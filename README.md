# jekyll-action
A GitHub Action to build and Jekyll sites for deployment.

This action doesn't publish the site anywhere, later steps are required to publish the site anywhere. This action will install Gems from a Gemfile, which can be cached.

## Usage
Use the `lemonarc/jekyll-action` action in your workflow file. The site will be output to `_site`

Use the `actions/cache` action in the workflow as well, to shorten build times and decrease load on GitHub's servers

```yaml
name: Testing the GitHub Pages publication

on:
  push
    
jobs:
  jekyll:
    runs-on: ubuntu-16.04
    steps:
    - uses: actions/checkout@v2

    # Use GitHub Actions' cache to shorten build times and decrease load on servers
    - uses: actions/cache@v1
      with:
        path: vendor/bundle
        key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
        restore-keys: |
          ${{ runner.os }}-gems-

    # Standard usage
    - uses:  lemonarc/jekyll-action@1.0.0
    
    # Example deployment: Push to S3
    - name: Configure AWS credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: us-east-1

    - name: Sync output to S3
      run: |
        aws s3 sync ./_site/ s3://my-s3-bucket --delete
```

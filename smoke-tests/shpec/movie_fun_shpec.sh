#!/bin/bash
describe "movie service"
  describe "GET /"
    http_result=`curl -s -o /dev/null -H 'Accept: application/json' $MOVIE_FUN_URL -w "%{http_code},%{content_type}"`
    http_code=`echo $http_result | cut -d, -f1`
    content_type=`echo $http_result | cut -d, -f2`

    it "serves a 200 response"
      assert equal $http_code 200
    end

    it "serves up json"
      assert match $content_type "application/json"
    end
  end
end

FROM ruby:2-alpine as jekyll

RUN apk add --no-cache build-base gcc bash cmake git gcompat
RUN gem install jekyll && gem install jemoji

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "jekyll" ]

FROM jekyll as jekyll-serve

CMD [ "serve", "--watch", "-H", "0.0.0.0", "-P", "4000" ]
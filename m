Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5619799ejc;
        Tue, 28 Feb 2023 02:53:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/Q+o3YEju9IgzktDBVOam/uOFudfwf1x+R7660dEYPaBL67+tV1wdK+S89rfVNaMsbTdF8
X-Received: by 2002:ac8:5714:0:b0:3bd:1647:9333 with SMTP id 20-20020ac85714000000b003bd16479333mr3299199qtw.28.1677581615688;
        Tue, 28 Feb 2023 02:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677581615; cv=none;
        d=google.com; s=arc-20160816;
        b=OTReH1gY/J4dkcOuROBqEVLYqSiW3PDREzUM+hrd5iRQYf1Lnkoe+C+TukTbrFbI4K
         bKs0tw/cZfv2mEBFFoTACf5hB5VXmVqQkaS0/kix1cNY2j3RXJU0yK6DtvnKjyVjyUO9
         RAnuddh62+q+lmz4PJIam22UBQ9C4BNe30Ff6SRTT6ntUcs3hmA1t3cPCvxHpRNG7jKB
         6F0yBy1PvfbOIpH813EpTe7s7MMJZeFilu9xRlJxjwYewhjsi237pD9wp1u6ANHkDkTD
         S770O3D7ngW5tHvn97eSdet44zFaztxwMHK5lHZaEBA4iucwnQCKkwDmSDuymF1z3tvm
         HhqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=4B0yCKa4hAbcRPlKdCpt5ZAwhMWkjGVG1SlP+iC3Y/o=;
        b=PnIqo5yaiFE4WTctsNTtVpdbqYyYb1hf7lBDxsvX6IpJi/cV2uy50GpXxwQjPc5OPk
         CvTofWLc8+k4g01chaa8kmsAfGGDrMuiMa54avKU1+wKr3rBpP2qxxktsWnbzrNHW5s1
         CJB06C4a9og/tnT+DjZc+g0yosNwlv0DGfeF7n/qGJjkoZ8ndwjM4l/EIqacHjImTGOg
         bGSS7TbWBjnAJGbNVSDmG0N3Hbqb8OIsvAWzCpy/dXapIKDpQwWl7SQMiWDhwTVPQHwy
         gYIZDWOcybcO/ler4AjvUGKPYlq1Aq+q289lyCOLy91Eg3/dNrQ/wqw9gm0jYw/5nZi7
         bQFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VxEKrY2+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b2-20020ac87fc2000000b003ba11be8904si9222282qtk.261.2023.02.28.02.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VxEKrY2+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677581615;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4B0yCKa4hAbcRPlKdCpt5ZAwhMWkjGVG1SlP+iC3Y/o=;
	b=VxEKrY2+ecPbsC5EQhP59A/mYE/TsF+mK5K+WFE7WJnKZFs0l34ZB6NXZKteaKA3Jmt8QQ
	Npq5Fs0CZrDg61SsK9u2ecfRFKKLur6OWHrXsjINzPCL7mnodlmI+DJkpFZULFyyZ4uhpT
	0WQSyoud83kAzT4XWqJUDjT3UwXYBZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-VfRp8SbjM7C4Yd0erLXa1g-1; Tue, 28 Feb 2023 05:53:32 -0500
X-MC-Unique: VfRp8SbjM7C4Yd0erLXa1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6388F889047;
	Tue, 28 Feb 2023 10:53:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A82D2026D4B;
	Tue, 28 Feb 2023 10:53:27 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:53:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 7/7] tests/gitlab: use kaniko to build images
Message-ID: <Y/3dJNGKgwByiR5U@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-8-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-8-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: bUhVzX3srgsL

On Fri, Feb 24, 2023 at 06:08:57PM +0000, Alex Bennée wrote:
> Apparently the docker-in-docker approach has some flaws including
> needing privileged mode to run and being quite slow. An alternative
> approach is to use Google's kaniko tool. It also works across
> different gitlab executors.

Interesting, I've not come across this tool before.

> Following the gitlab example code we drop all the direct docker calls
> and usage of the script and make a direct call to kaniko and hope the
> images are cacheable by others.



> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/container-template.yml | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
> index c434b9c8f3..c2d7950df8 100644
> --- a/.gitlab-ci.d/container-template.yml
> +++ b/.gitlab-ci.d/container-template.yml
> @@ -1,22 +1,17 @@
>  .container_job_template:
>    extends: .base_job_template
> -  image: docker:stable
> +  image:
> +    name: gcr.io/kaniko-project/executor:v1.9.0-debug
> +    entrypoint: [""]
>    stage: containers
> -  services:
> -    - docker:dind
>    before_script:
>      - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> -    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> -    - apk add python3
> -    - docker info
> -    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
> +    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
>    script:
>      - echo "TAG:$TAG"
>      - echo "COMMON_TAG:$COMMON_TAG"
> -    - ./tests/docker/docker.py --engine docker build
> -          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
> -          -r $CI_REGISTRY/qemu-project/qemu
> -    - docker tag "qemu/$NAME" "$TAG"
> -    - docker push "$TAG"
> -  after_script:
> -    - docker logout
> +    - /kaniko/executor
> +          --reproducible
> +          --context "${CI_PROJECT_DIR}"
> +          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
> +          --destination "${TAG}"

AFAICT from reading the docs, this does not allow for caching of layers
from the previous built image, so will always do a from scratch build.
This feels like it would kill any performance benefits over docker.

https://github.com/GoogleContainerTools/kaniko#caching

  "Users can opt into caching by setting the --cache=true flag. A
   remote repository for storing cached layers can be provided via
   the --cache-repo flag. If this flag isn't provided, a cached
   repo will be inferred from the --destination provided."

So it would sound like we need --cache=true adding to this command,
and in theory it should prime its cache from ${TAG}, but i'm not
entirely confident in that without testing. Also does not seem
like its psosible to have the dual cache COMMON_TAG + TAG, which
is particularly important for forks, since COMMON_TAG is more
likely to be up2date.

We could live with the latter restriction if we *always* used
COMMON_TAG as the cache, because 99% of the time forks are
going to just be using dockerfiles that match upstream. Only
those few contributors who have a branch that's changing
the dockerfiles would benefit from pointing the cache at
their fork.

So we could achieve that I believe using

     - /kaniko/executor
           --reproducible
           --context "${CI_PROJECT_DIR}"
	   --cache=true
	   --cache-repo "${COMMON_TAG}"
           --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
           --destination "${TAG}"

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

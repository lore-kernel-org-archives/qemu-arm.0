Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp343869wrq;
        Thu, 7 Feb 2019 14:01:22 -0800 (PST)
X-Received: by 2002:a5d:690d:: with SMTP id t13mr14698889wru.195.1549576882893;
        Thu, 07 Feb 2019 14:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549576882; cv=none;
        d=google.com; s=arc-20160816;
        b=T4lK8t1vHd07XsV+e6SJW5adN+LTmJhvKcANZg20+UVxAKIV37gobMECO3pmKRCvp0
         uJn5U7NdVseHWB+K+R5lQpZXtcNUoL4YiS04SA+fv2shqZ7ABnvUCqtBI2/poBi3MIqd
         vSsE/qLj7d7XdEpC/9mMNJaGkj8+di6V1CUD6Y9U7DFwaafpisojODfM6ndBelXnhbKi
         fLsGDiCSbYxg8USnnnAVXPM0J2FfeS6VaHPrSTNnDZMzvEn2z2S+Mn00Ue+MUKoOzoGF
         sDyUN5r6MPEgeYRfvjz9PMWompCe0kIV951JX+iU9OkqtdXVBLNW12/2cr2+Y4s8GI8U
         TE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=effcbpWzdXybaN+N2GTHgOjaNhH61WlOl3sno/4wBdE=;
        b=TFTc2BAVVmp263ypSSnqZXUlGG4c2IEVQ4iFXm4QapYQcOuFygCLpBg+2hNFxnbSeI
         p+Oot13puCX9Njfb81liYlBSNSjcQGOxdpjyd74VdKGHysXMllBZOlHhstjNvEAgJDsD
         J8eDCgpZtOlk3tOXyKFJoRS92ZGLGpYNzZGdyzOHJVq/HS6wMz/2ivsJP1El4FrxZFGL
         ftIbL41wx3WzWLLJZSBV4V9D1R2/A+y6oK1u9Rto+z8Vh0jY3Mx22s0TGiNBkstLogT8
         Izckc7rw6G7BRQ3TpCi20fpPY+KKX9JPvT6ODeVjgFdHP2Xo/7zK4PGrxalEGfPTzual
         /SCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h13sor351447wmd.3.2019.02.07.14.01.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Feb 2019 14:01:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=effcbpWzdXybaN+N2GTHgOjaNhH61WlOl3sno/4wBdE=;
        b=oopg5S+Dds48DsrQfdLpw9528unokU6kVDjaIy/Af1G6SO1vEZJqmf4S9/kIj1wJLU
         jkFBWUMU12vn0PUnlPncXFcompg2HKgEZMAvu0u5nuV2Yq4qPqug3phpZCYYHC7AMjai
         aVUGM97e29o4F4OL29s0l1P1gGZ0fPIwmo+WrcBtisTaHigbJ5A/JuNDKjEiMhW1jOKg
         djT0PJTY6aQD+OHPzVd9EgbjS7YOLF9vC4H48SjwCMgT18n1QepGTY1m87+vSBfGOncv
         TtWI5kF8HwMddNPSUstDP+O6tn0sFgcAvWeTu2X1WTDMWeYpXV3+foKVZB5mxWNIuEzU
         fdVQ==
X-Gm-Message-State: AHQUAuaBEW/inNF8In7S+7SCBojh2ZhnNIc2FAxORSRtkJ/FUrjOKoO4
	zOikHq6HO1wE7KDIFKhI6cZMxA==
X-Google-Smtp-Source: AHgI3Iai/h5roPXdL9NQWigZ1eFGyuKHh/37QSkq+8Q6e6lPj3UcMf81mWgQ2tVfCrSRCtaFGSeKew==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr9423192wmd.36.1549576882541;
        Thu, 07 Feb 2019 14:01:22 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net. [83.35.153.10])
        by smtp.gmail.com with ESMTPSA id l6sm145627wrv.70.2019.02.07.14.01.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Feb 2019 14:01:21 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 00/16] current testing/next queue (with
 build fixes)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org
References: <20190207183744.5054-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8cd5c316-f912-7184-f854-c892a4391990@redhat.com>
Date: Thu, 7 Feb 2019 23:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JFbna7rzQ5Vs

Cc'ing Michael.

On 2/7/19 7:37 PM, Alex Bennée wrote:
> 
> Hi,
> 
> There are a few more additions from the last iteration including some
> more fixes to try and get Travis green again. It's nice to see our ARM
> features are now catching up we need a newer toolchain to build
> things. I did try upgrading to debian 10 for the cross build but there
> are some upstream problems with the multiarch build deps that get in
> the way of that. People with Debian packaging experience can jump in
> on:
> 
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=921458
>   (dependancy on gcc-s390x-linux-gnu fails on non-x86 hosts)
> 
>   https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=921648
>   (apt-get build-dep -a arm64 qemu fails on multiarch setup)
> 
> as it would be good to get these problems fixed as we get to
> softfreeze (and given how much we leverage Debian's cross toolchains).
> 
> If all the testing is green by tomorrow I'll put together a pull
> request. Unless people are desperate to grab the arm64 compiler image
> now as a build fix?
> 
> The following patches need review
>  patch 0004/.travis.yml fold disable tcg into alternate corou.patch
>  patch 0007/docker add debian buster arm64 cross.patch
>  patch 0008/tests make docker.py update use configured binfmt.patch
>  patch 0009/tests make docker.py check for persistent configs.patch
>  patch 0010/tests docker.py be even smarter with persistent b.patch
>  patch 0011/tests PEP8 cleanup of docker.py mostly white spac.patch
>  patch 0016/scripts qemu.py allow arches use KVM for their 32.patch
> 
> 
> Alex Bennée (11):
>   .travis.yml: separate tools and docs into another entry
>   .travis.yml: fold --disable-tcg into alternate coroutine builds
>   docker: add debian-buster-arm64-cross
>   tests: make docker.py update use configured binfmt path
>   tests: make docker.py check for persistent configs
>   tests: docker.py be even smarter with persistent binfmt_misc
>   tests: PEP8 cleanup of docker.py, mostly white space
>   tests/vm: call make check directly for netbsd/freebsd/ubuntu.i386
>   tests/vm: add --build-target option
>   tests/vm: expose BUILD_TARGET, TARGET_LIST and EXTRA_CONFIGURE_OPTS
>   scripts/qemu.py: allow arches use KVM for their 32bit cousins
> 
> Daniel P. Berrangé (1):
>   .travis.yml: stop requesting libffi & gettext from homebrew
> 
> Ed Maste (1):
>   .cirrus.yml: basic compile and test for FreeBSD
> 
> Gerd Hoffmann (1):
>   tests/vm: move images to $HOME/.cache/qemu-vm/images
> 
> Philippe Mathieu-Daudé (2):
>   MAINTAINERS: Add an entry for scripts/archive-source.sh
>   archive-source.sh: Clone the submodules locally
> 
>  .cirrus.yml                                   |  16 +++
>  .travis.yml                                   |  31 +++--
>  MAINTAINERS                                   |   9 ++
>  scripts/archive-source.sh                     |   7 ++
>  scripts/qemu.py                               |  12 +-
>  tests/docker/Makefile.include                 |   1 +
>  tests/docker/docker.py                        | 110 +++++++++++++-----
>  .../debian-buster-arm64-cross.docker          |  15 +++
>  tests/docker/dockerfiles/debian10.docker      |  31 +++++
>  tests/tcg/aarch64/Makefile.include            |   2 +-
>  tests/vm/Makefile.include                     |  22 +++-
>  tests/vm/basevm.py                            |   3 +
>  tests/vm/freebsd                              |   3 +-
>  tests/vm/netbsd                               |   3 +-
>  tests/vm/ubuntu.i386                          |   3 +-
>  15 files changed, 213 insertions(+), 55 deletions(-)
>  create mode 100644 .cirrus.yml
>  create mode 100644 tests/docker/dockerfiles/debian-buster-arm64-cross.docker
>  create mode 100644 tests/docker/dockerfiles/debian10.docker
> 

Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp498567ejc;
        Mon, 25 Sep 2023 09:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZo8v9NoC+pr8z7flhthRfL2DTnKVLCIf8C08C6ce6VCT9Qd3uHIopvFGpuZI/pa1A2u3l
X-Received: by 2002:a05:6214:2b0a:b0:656:1ed6:fff3 with SMTP id jx10-20020a0562142b0a00b006561ed6fff3mr6630719qvb.56.1695658146265;
        Mon, 25 Sep 2023 09:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695658146; cv=none;
        d=google.com; s=arc-20160816;
        b=Vxf48VVsRa9o97COe7u007sQkEx9vrZmb8PYc9+XOiGEyGEniHSrFLgdEmO/KmJE0B
         yWTKUztm3uXUOLnnw9VL9PAMlq5+rqlN9K+U8/BeBsqlSqOuCcAhUaf7vlPeQGKccheP
         Mg6AMKEur/O9Se/CmmDCsnsBz23IXvOR9+YauLxrwMLtwzm+/KtwnWzCgT/Z/+NEeV/1
         jWBBUjy1uMczLlPjHJUiP1ko5txhj0qySestqNUpCgMljJhlgZRy25papmkv0y/Fc9rF
         6Nacaid9JdwoOjnysaKWdtkBX946dEOqwIwfTFPPJJfodu42VJu6ejsADB3h4LCTB3jM
         Omuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3o09FgjP2mri3S7JGXJqW1njdmzYkmcoW/evXL5zVCg=;
        fh=K4NqYNBzOTwwaAVLxUfLHV9qOVKTnvFqUM9paB3EKFA=;
        b=venFJSdoWjrt+v/lgdsPW5U3FpQfztAfd/5JE+1pFibSPWXXy43pfFfm8Wgbz42yiY
         tTUUFu+VpoqqzYD+l3wOT0BpasYZ9EPH0RiquCvMNCiPrX7ln6S/bmroRNR5y6V2LYea
         Drj7NDsjxpR/jr2OYOQ7qwPi9Q/tBUAjoGbMqudp8/fmjI1BArokjsimwVlE7ThnbzZs
         QGN4VOIHXWc/SMx1yJya2CnGwzQ2QaukYhBRcTPemdZfY/42/pu/jzgxRH2XVMz0kTc5
         p6sYoliLooZwHILCLHxgGo1C+Jkag/N8qRY6gUmDK4k0prMjfyzy2UHYNQ244xAANlE7
         rvJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Rb7XmU4/";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b14-20020a0cf04e000000b0065b2226fe46si72563qvl.140.2023.09.25.09.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Rb7XmU4/";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695658145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3o09FgjP2mri3S7JGXJqW1njdmzYkmcoW/evXL5zVCg=;
	b=Rb7XmU4/DKwNaKZJ6agEdiAqfZJvHTWDsms7cp8osN++7UvNrIWOZHMCesLmgPwmzmPqKs
	HxhW/2Kun57qWagasoZJpg0ARVP/S0mthcu7vaRILJ4Q7lRV9idM9bZO4vtZCQ21pg8k9c
	cI0UH86yrijEQzCYgmnVwtbHnt0IHFg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-_ShRrcolNp2hoiAQDMTKfA-1; Mon, 25 Sep 2023 12:09:04 -0400
X-MC-Unique: _ShRrcolNp2hoiAQDMTKfA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31f79595669so4066122f8f.0
        for <alex.bennee@linaro.org>; Mon, 25 Sep 2023 09:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695658142; x=1696262942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3o09FgjP2mri3S7JGXJqW1njdmzYkmcoW/evXL5zVCg=;
        b=Muk6xSpV6Ccyib88OQLxJls/8o3KU02ZpUDn8f+fmXdsdGuvOIiS6XdVFUFtfEyrL2
         U/5LYf0/UrCUoR01otZDbcuzaCKF9l1hTwE2eVpH7G3kRmLmyEohsZPVqju+x7iKy7FM
         VknivPFuAeyVv1Fx2kaDAJEFD+IEDCwZjaDwrT3e2P2ATSl4hZ466g1+J0BIV3ri9T6u
         7MpieMLPgadR7bNky/1ueV8WslUCSHnnxa2lTnPcoTP3cilVUEOTdh70JzExDe0UvZiE
         KPs2qZze7j2OfV2xmnGoMcOyoslUbNyJcDdahJrbtCf0zuh3mzecYySGmFSMn5MPpEV4
         IVxg==
X-Gm-Message-State: AOJu0YxbtA7ps1QjLcwQ72ckVlwRzoGTwvytEGOh3OvLaWr3gKli24/K
	av0SzJKjIFleK7b/+XtLrA2BSFnkDGmR+erHM8hvHi5MIixrnToKzbSDu4Vkh+/YSnVKYdrBpgC
	U8SSNX56lc2CGFljEUQ2AVjQvPGo5wxhyc2CRYlLZTZ36twxxUI5neP7mjNBIOO7y6czGbs9FrI
	iE
X-Received: by 2002:adf:f583:0:b0:317:6734:c2ae with SMTP id f3-20020adff583000000b003176734c2aemr67835wro.11.1695658142179;
        Mon, 25 Sep 2023 09:09:02 -0700 (PDT)
X-Received: by 2002:adf:f583:0:b0:317:6734:c2ae with SMTP id f3-20020adff583000000b003176734c2aemr67780wro.11.1695658141713;
        Mon, 25 Sep 2023 09:09:01 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id 19-20020a05600c229300b00405953973c3sm1928585wmf.6.2023.09.25.09.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 09:09:00 -0700 (PDT)
Message-ID: <a801cde2-e75e-4e4c-243f-887296f0322d@redhat.com>
Date: Mon, 25 Sep 2023 18:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/31] tests/docker: make docker engine choice entirely
 configure driven
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-6-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230925144854.1872513-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aNif0ZipAiDq

On 9/25/23 16:48, Alex Bennée wrote:
> Since 0b1a649047 (tests/docker: use direct RUNC call to build
> containers) we ended up with the potential for the remaining docker.py
> script calls to deviate from the direct RUNC calls. Fix this by
> dropping the use of ENGINE in the makefile and rely entirely on what
> we detect at configure time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure                     | 1 -
>   tests/docker/Makefile.include | 7 ++-----
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/configure b/configure
> index e08127045d..707132a3ae 100755
> --- a/configure
> +++ b/configure
> @@ -1694,7 +1694,6 @@ if test -n "$gdb_bin"; then
>   fi
>   
>   if test "$container" != no; then
> -    echo "ENGINE=$container" >> $config_host_mak
>       echo "RUNC=$runc" >> $config_host_mak
>   fi
>   echo "SUBDIRS=$subdirs" >> $config_host_mak
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index dfabafab92..035d272be9 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -17,8 +17,7 @@ endif
>   DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
>   
>   RUNC ?= docker
> -ENGINE ?= auto

This was used when using docker-* from the source directory.  What about 
changing it to:

RUNC ?= $(if $(shell command -v docker), docker, podman)

No complaint on removing ENGINE= though.

Paolo

> -DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
> +DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(RUNC)
>   
>   CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
>   DOCKER_SRC_COPY := $(BUILD_DIR)/docker-src.$(CUR_TIME)
> @@ -158,7 +157,7 @@ $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
>   )
>   
>   docker:
> -	@echo 'Build QEMU and run tests inside Docker or Podman containers'
> +	@echo 'Build QEMU and run tests inside $(RUNC) containers'
>   	@echo
>   	@echo 'Available targets:'
>   	@echo
> @@ -198,8 +197,6 @@ docker:
>   	@echo '    EXECUTABLE=<path>    Include executable in image.'
>   	@echo '    EXTRA_FILES="<path> [... <path>]"'
>   	@echo '                         Include extra files in image.'
> -	@echo '    ENGINE=auto/docker/podman'
> -	@echo '                         Specify which container engine to run.'
>   	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
>   
>   docker-help: docker

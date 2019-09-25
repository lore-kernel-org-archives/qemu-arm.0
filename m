Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1348566wrp;
        Wed, 25 Sep 2019 15:07:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMaJnVDun+U3zRWiotwjF0G069hNK6vaTE1+12OOW/AIdFxr/ZKaDlAFohXJfBg38NETSK
X-Received: by 2002:a92:3854:: with SMTP id f81mr2047078ila.31.1569449273436;
        Wed, 25 Sep 2019 15:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569449273; cv=none;
        d=google.com; s=arc-20160816;
        b=xdVlOwcxC7BvvtCkJ5yegeBNjn3hICdu/8tcxfe3/IKBdJqkMcCVHX8UstMbfpjsah
         c34JrRy8ctIFbdp6mzwd2tx0jk3IoEax3MMWKjraSs9ngyZij22Kk2F80WqFSNy2CAWy
         05rrvNOwixS/7abmfZF0fB+XdZkvsVm+2b752HypbEgMpHigyZwEZHobl6ZUql3Xz3DO
         tspvKkiKKPXj1vN796QJCac+kzpXFM24fUS3ZwP6DMb44kkIBBvziSVI1MrCXXErNlH4
         WJcThq+cCNc6MbtuUxPIGZfpDB4u92ZtKaUQuWHStdVJFkYOpvyydEySgz+EiSVj7lAa
         YP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=98MVFa8VVafhQyEy86Cb3wBx8d+/l8jlJ3YSn4tWv+0=;
        b=pQhsqascRJ/6j9AOueZx0QWaFV+iaxuyJc8IYRA/cxWrnIVUbm/eu0eThSrxG7IcQ9
         h3a3iE9OmenSSEEygAl1kroHCBEkt2LjMDisTuzscFG+TWcyauHu/DK5u7HnJeGTitU2
         KCefZcbigmxRw9XRoQwJXUQNRUxnJ7Nd79Ww/i/F6uc/P1Fz45oj2ammrXaDAiQ07K1K
         P1m9hBTm+n4YlshpJ6vXkbKwqxaHKb7/md82Q6jedYiDIyyOx5FjZFfddU2Pb4japz5A
         4Jh6V3K7toerM9StixVxDzc9G3XZY4nC7gD1MkRF6yAciom210VotAHlIuISSIwkoOaM
         Jurg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s129si5863781jas.108.2019.09.25.15.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64753C0546D5
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 22:07:52 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id q9so125200wmj.9
        for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 15:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=98MVFa8VVafhQyEy86Cb3wBx8d+/l8jlJ3YSn4tWv+0=;
        b=LUZSEGLwpfSvisUCL3OAbDHWZlvSaGjBf2QRAk8JpoqQfNa/sNds+hn7ISQpfiv+9w
         H8Nm9qU2IISyj56ix/RU2l3IQYtiHgDuFZO2DCdgl+5tPqZv47LWoq77qCF78Ta4dqEp
         VsJh4hHzq/aXSya1jsYQv8g0uKjxBvWXmk4/3xFSrNj4NjShtsrxucb93R91KMfZUJY7
         dVZc3BRzd7/hovAah3YYV9vv9Ipg8t2lOJIzJ3G9vWP01zNHyHbxFeIJLRgZi7miK5Ld
         PrIsLgJHVSdcNPXjCG8U3/zFLCwJvd7kg/DtbJ9pZJVzZ8gi6sKfV0LnaSp/KunPRIRo
         HMww==
X-Gm-Message-State: APjAAAWAj2aimpc0b7+JnX2IAIPwh+0VeVF4XnQJbm01YXdntOpy+3gr
	sZTRvXqB3HF4WmBKEU5vlQwYEDH4GEP/ToMbuu2MFlvy5Vfg82A6Quaz4/l4fGfp40kXAr7HBgp
	iRMIFIMCbO/wfRIon
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr292489wmi.151.1569449271122;
        Wed, 25 Sep 2019 15:07:51 -0700 (PDT)
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr292474wmi.151.1569449270923;
        Wed, 25 Sep 2019 15:07:50 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id f186sm253460wmg.21.2019.09.25.15.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:07:50 -0700 (PDT)
Subject: Re: [PATCH v3 17/33] tests/tcg: clean-up some comments after the
 de-tangling
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jsnow@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e90a11b4-5f68-79ba-b865-7ba9fef128df@redhat.com>
Date: Thu, 26 Sep 2019 00:07:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924210106.27117-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SMENnRSZL+gB

On 9/24/19 11:00 PM, Alex Bennée wrote:
> These were missed in the recent de-tangling so have been updated to be
> more actuate. I've also built up ARM_TESTS in a manner similar to
> AARCH64_TESTS for better consistency.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/tcg/Makefile.target         |  7 +++++--
>  tests/tcg/aarch64/Makefile.target |  3 ++-
>  tests/tcg/arm/Makefile.target     | 15 ++++++++-------
>  3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 8808beaf74b..679eb56bd37 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -74,8 +74,11 @@ TIMEOUT=15
>  endif
>  
>  ifdef CONFIG_USER_ONLY
> -# The order we include is important. We include multiarch, base arch
> -# and finally arch if it's not the same as base arch.
> +# The order we include is important. We include multiarch first and
> +# then the target. If there are common tests shared between
> +# sub-targets (e.g. ARM & AArch64) then it is up to
> +# $(TARGET_NAME)/Makefile.target to include the common parent
> +# architecture in its VPATH.
>  -include $(SRC_PATH)/tests/tcg/multiarch/Makefile.target
>  -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
>  
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index e763dd9da37..9758f89f905 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -8,7 +8,7 @@ VPATH 		+= $(ARM_SRC)
>  AARCH64_SRC=$(SRC_PATH)/tests/tcg/aarch64
>  VPATH 		+= $(AARCH64_SRC)
>  
> -# we don't build any other ARM test
> +# Float-convert Tests
>  AARCH64_TESTS=fcvt
>  
>  fcvt: LDFLAGS+=-lm
> @@ -17,6 +17,7 @@ run-fcvt: fcvt
>  	$(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
>  	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
>  
> +# Pauth Tests
>  AARCH64_TESTS += pauth-1 pauth-2
>  run-pauth-%: QEMU_OPTS += -cpu max
>  
> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
> index aa4e4e3782c..7347d3d0adb 100644
> --- a/tests/tcg/arm/Makefile.target
> +++ b/tests/tcg/arm/Makefile.target
> @@ -8,25 +8,26 @@ ARM_SRC=$(SRC_PATH)/tests/tcg/arm
>  # Set search path for all sources
>  VPATH 		+= $(ARM_SRC)
>  
> -ARM_TESTS=hello-arm test-arm-iwmmxt
> -
> -TESTS += $(ARM_TESTS) fcvt
> -
> +# Basic Hello World
> +ARM_TESTS = hello-arm
>  hello-arm: CFLAGS+=-marm -ffreestanding
>  hello-arm: LDFLAGS+=-nostdlib
>  
> +# IWMXT floating point extensions
> +ARM_TESTS += test-arm-iwmmxt
>  test-arm-iwmmxt: CFLAGS+=-marm -march=iwmmxt -mabi=aapcs -mfpu=fpv4-sp-d16
>  test-arm-iwmmxt: test-arm-iwmmxt.S
>  	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
>  
> -ifeq ($(TARGET_NAME), arm)
> +# Float-convert Tests
> +ARM_TESTS += fcvt
>  fcvt: LDFLAGS+=-lm
>  # fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
> -
>  run-fcvt: fcvt
>  	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
>  	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
> -endif
> +
> +TESTS += $(ARM_TESTS)
>  
>  # On ARM Linux only supports 4k pages
>  EXTRA_RUNS+=run-test-mmap-4096
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
(via make run-tcg-tests-arm-softmmu)

Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1115577wrx;
        Thu, 28 Feb 2019 14:42:11 -0800 (PST)
X-Received: by 2002:a7b:c777:: with SMTP id x23mr1228963wmk.71.1551393730768;
        Thu, 28 Feb 2019 14:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551393730; cv=none;
        d=google.com; s=arc-20160816;
        b=V+NWtDs98M8IN56/9QpOSWFl0pGkLpxtBDpJgcdK0FEzslLUScCB0y44mig3W9bLfW
         0TrjSQPDglaaOTF8e8QBxhim38XcOjrGM9yUluc/BKIj7hMKQb2dRZTrFIem7v1oH/Pk
         IpZbjJwIikPXPVlM9dNukbNgquUzfDYfrf2O5YGy8P7petC+Z/CngrwHV6PdScy6zqEV
         QlEQmtf+v4u+H7E9s0zq24uBYAY/fIiEp1UzRylzh+5VEjiS0uEho2hHwVot2/beGPe9
         EHrjr2f1OwqoZQitstPd66E9psRi5GkPaFg7saAX90Pp3Ph5EWlOzRwmwFdv6fwHpy3M
         itMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=fVSLgrAAIXDk1XjGy0ugPH+yTFd6cwa8iIr7hRbE9q4=;
        b=JFOh7U1eVlZcv4If8ZpO8xy7vfyXKZYWSeabPQ83dPNzOkebQKi/Y9ZycWNpGXgSCj
         hkhDV+EGypRyrIoeGBjm/4RkWErPiRTQDxJ9b0KI9HXS9vNS3OKkrQ7SQzjTGuI6HYhU
         +OAs/eI4NVQRXXvzBUTdHoi+KKGJM0o4AUD+4ReZ/B9BahduiODZhWOAUbHfVzzWZZlb
         MDZgCV6l1hOgIm0Uxy4IGtU3I+n1soA59q8yVEyvHGKRCPFAr6l8mCDMPES/GTPKCtph
         lwx0Fsk5Stt0m4sTs5Rx/viwnBrWn6/s6bRHWsBkyPowfnlcWAHPnw+mEYjT9H0kcr0P
         e8lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h9sor4415157wmh.27.2019.02.28.14.42.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Feb 2019 14:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fVSLgrAAIXDk1XjGy0ugPH+yTFd6cwa8iIr7hRbE9q4=;
        b=g0fw8FIu80ShQ3aI1oU8Na5Vn6zsvG6hxT8PQPU9d8BcPNeaaDsMMJhpiyPcbFhr6M
         mc+gWpPmPt+smHr+iPX6vo6NAyzq0Ktu1XSL5x2aARcLMgB2ek1cySen6kQzaKfUNY/b
         Lrx1O94MgYOTdtWn9P1Mv8ppsQyfg9ELLCbNNSZJkmDKK5CvHkt/GM/IXhTL9w0oclNU
         TcqSaCRrPpCFrs3mqG9+3goBrPhzZ31d3m5nAlPEo0kYJgsPZc4qL8Hlz36+C5wMOOfs
         oaxMMYnXBMiAK8FAeq4+1nMgTSg1Zol/cDj5adTjWEfpsj5U1LglAA3zNNxM5Oh6mrlk
         /ziw==
X-Gm-Message-State: APjAAAVe43IoHEgOmLAGiqfdLOX2q8cFSeCR995uezEDDaebLKfAnjS8
	KcKk6JRFS0jtv36wc7GpGr1iKQ==
X-Google-Smtp-Source: AHgI3IaQV2bWjzHpcVb4Bz/ERxHSH4ejhzPObEztqVrA7lIzFmMVNHJmlh9JSw0nfvf95z7RU8hgYw==
X-Received: by 2002:a7b:c929:: with SMTP id h9mr1215594wml.106.1551393730406;
        Thu, 28 Feb 2019 14:42:10 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net. [88.25.181.43])
        by smtp.gmail.com with ESMTPSA id g10sm29223286wrq.61.2019.02.28.14.42.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Feb 2019 14:42:09 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 05/16] tests/tcg/mips: fix hello-mips
 compilation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org, jcmvbkbc@gmail.com
References: <20190228202537.4638-1-alex.bennee@linaro.org>
 <20190228202537.4638-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c3a65d4b-8720-2957-1394-032823a78760@redhat.com>
Date: Thu, 28 Feb 2019 23:42:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190228202537.4638-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: dIBegF9jdSy7

Hi Alex,

On 2/28/19 9:25 PM, Alex Bennée wrote:
> The compilation flags for proper building are in the source tree. We
> also fix exit to 0 so the result is counted as a success.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/mips/Makefile.target | 11 ++++-------
>  tests/tcg/mips/hello-mips.c    |  2 +-
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
> index 086625f533..1a994d5525 100644
> --- a/tests/tcg/mips/Makefile.target
> +++ b/tests/tcg/mips/Makefile.target
> @@ -8,15 +8,12 @@ MIPS_SRC=$(SRC_PATH)/tests/tcg/mips
>  # Set search path for all sources
>  VPATH 		+= $(MIPS_SRC)
>  
> +# hello-mips is 32 bit only

Correct.

> +ifeq ($(findstring 64,$(TARGET_NAME)),)
>  MIPS_TESTS=hello-mips
>  
>  TESTS += $(MIPS_TESTS)
>  
> -hello-mips: CFLAGS+=-ffreestanding
> +hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32

As suggested in the header.

>  hello-mips: LDFLAGS+=-nostdlib
> -
> -# For MIPS32 and 64 we have a bunch of extra tests in sub-directories
> -# however they are intended for system tests.
> -
> -run-hello-mips: hello-mips
> -	$(call skip-test, $<, "BROKEN")
> +endif
> diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c
> index c7052fdf2e..4e1cf501af 100644
> --- a/tests/tcg/mips/hello-mips.c
> +++ b/tests/tcg/mips/hello-mips.c
> @@ -60,5 +60,5 @@ static inline int write(int fd, const char *buf, int len)
>  void __start(void)
>  {
>      write (1, "Hello, World!\n", 14);
> -    exit1 (42);

I understand 42 is to check SYS_exit1 worked, and this is not another
qemu-user exit. But we were previously never checked the exit code for
42. Neither are we checking 'Hello, World' on stdout.

> +    exit1(0);
>  }
> 

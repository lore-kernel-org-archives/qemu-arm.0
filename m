Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2106754wrv;
        Sat, 13 Jul 2019 08:01:21 -0700 (PDT)
X-Received: by 2002:a1c:c145:: with SMTP id r66mr15130941wmf.139.1563030080947;
        Sat, 13 Jul 2019 08:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563030080; cv=none;
        d=google.com; s=arc-20160816;
        b=NTD+Qpy+Dqkm6wdvQ9iMrFGv/EbqvCixFRqdy5Fbt7LymfL0ptkLEvt0W3fGPCzI3p
         ehR/2BdkLFB9ltfKsnwfLvTOEcSsofTCF0zcVD+hp++ngXI/V1CsCaIHWkTrgGfUwJhl
         SbzxiPE0S8/fTvsfPtL0Q174vntiCzx4dprB4Ae5FZ0WVa10J6r497NGQuZI4hNzE0/P
         5j6p7zklhzBpbU34Xh7dkR6ytYZiD8s/4CB2psTJQkj29TUT+biu5Gr6zng93UAiDGX4
         h0+uCgaKUH20ra9PterA3WxA96d+ECSsRGl3PmUZj2z25QfCZ6Mb8Q2tw4KfTcSYpbkg
         u40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=pNTcqyOPquY+hS25yXG47H1KC2X2Jv4tteHhZC1XHuk=;
        b=whdYv7cRXmXkc3kgS5B7Siejkri8n8/uqVDbFzqeBtOSdJiqA5ua4NnzHZEJsM1lZu
         omL08McrNqMvEN2BGpCXYyDs/6s24hBySPEnIiSUQlsIzakosxCKFRn6RtZF9YjWG4Tg
         nrKskLBDOHqLkwcGUPM/GmqWNF/qEnG6B1hceAe//+tzaCgdMoYCoj+GEvVwhW2azxDV
         k/jwrUCrrJy6Xd9TmktIGmHJiJVSLINx/1toxHXwya4jBQSe15D2zuudQ3Lp6ROlYolc
         bX9UPlxsOFFiqFwGXQeiwfBB9uGV+jn5sw+LKmZyTHb6eBl1aNzK55x+T29jpdJJ0DjT
         vTHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f17sor7025200wmj.13.2019.07.13.08.01.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jul 2019 08:01:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pNTcqyOPquY+hS25yXG47H1KC2X2Jv4tteHhZC1XHuk=;
        b=q2EQ9j6ZrJxehMjCPi5FIJ44RP496irRJtegv+UgujGSUwenhenv73AuPMzOq+eE8A
         bCMu7AqGaJ3WsjAuOcUD53Dde4EXCCsPN54ybO7garXPq5ukd+qP/KDiMCnSekwjEs8d
         Mqmiw2gaarWrCU6gc5yhinCCsF5E20QDOTFXnjgG+JIIASur40zYRoU6skIW/odcqkO3
         JHJUT4TcRXdVQiqRx3upwD1bmxq6QCXWQgLvrfvHke56repxUAtXrVI97ckQobL1TGzx
         n4ZBh6YkKEAghDhn9lTl4YavI5BdAB6gbABvZMkUSinQxZ84bAjVisY3hymdo13JwClU
         IOKg==
X-Gm-Message-State: APjAAAWY4FhmPGf2hRVDE++YT+QH88hYz4xvxB6ohHHl6mo5EN63T/7b
	UmjCSlbJrWGM6jbMox4CudhnmA==
X-Google-Smtp-Source: APXvYqwFEv+qPIqLNuvF8zd1IKHtP2g+oSPjYDai7op73yofYf71/6CH+UIcIi4kYALUD+v1++lTwQ==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr15944137wmc.154.1563030080690;
        Sat, 13 Jul 2019 08:01:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net. [83.42.61.62])
        by smtp.gmail.com with ESMTPSA id j17sm10204442wrb.35.2019.07.13.08.01.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 08:01:20 -0700 (PDT)
Subject: Re: [PATCH v1 7/7] shippable: re-enable the windows cross builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
 <20190712111849.9006-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <18c04017-7908-c4d1-5414-cae79ba82fc3@redhat.com>
Date: Sat, 13 Jul 2019 17:01:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712111849.9006-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2K21cPDREqts

On 7/12/19 1:18 PM, Alex Bennée wrote:
> The pkg.mxe.cc repo has been restored.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .shippable.yml | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/.shippable.yml b/.shippable.yml
> index f2ffef21d11..f74a3de3ffd 100644
> --- a/.shippable.yml
> +++ b/.shippable.yml
> @@ -7,11 +7,10 @@ env:
>    matrix:
>      - IMAGE=debian-amd64
>        TARGET_LIST=x86_64-softmmu,x86_64-linux-user
> -    # currently disabled as the mxe.cc repos are down
> -    # - IMAGE=debian-win32-cross
> -    #   TARGET_LIST=arm-softmmu,i386-softmmu,lm32-softmmu
> -    # - IMAGE=debian-win64-cross
> -    #   TARGET_LIST=aarch64-softmmu,sparc64-softmmu,x86_64-softmmu
> +    - IMAGE=debian-win32-cross
> +      TARGET_LIST=arm-softmmu,i386-softmmu,lm32-softmmu
> +    - IMAGE=debian-win64-cross
> +      TARGET_LIST=aarch64-softmmu,sparc64-softmmu,x86_64-softmmu
>      - IMAGE=debian-armel-cross
>        TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
>      - IMAGE=debian-armhf-cross
> 

Builds now take ~25min longer. The win32 build is definitively helpful
and should catch most of the errors the win64 could find. I suggest we
build the docker image but not cross-compile on win64. Anyway this can
be improved later.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

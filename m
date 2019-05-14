Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4182029wrg;
        Tue, 14 May 2019 09:15:17 -0700 (PDT)
X-Received: by 2002:adf:fb4a:: with SMTP id c10mr21643717wrs.309.1557850517599;
        Tue, 14 May 2019 09:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557850517; cv=none;
        d=google.com; s=arc-20160816;
        b=N/QLiofM8UN/2y6Goe6j/UyS7xwiIeopzJeUY/z4GlsaqNGM/W74odFbRHP2bOMIpI
         DBX9gvmyx7uiJYtGDBLfbGSgVJSdI4/3gscjG/u1PtbgMyF0pShfLa+5Gv7xh9ik8Eh3
         ZcOkerAylJAXWkMSOoZdLNIb/hT3BnTKp2WmOuDHsyHoAO4j6XuYzV6zRLRuQbCROKHO
         zNQjwJdqNygliWKi8KcuAGZX1lXFAfrb8i4Ao+fY66NErL9BaTc4nIeVJIHNeTb9W/uL
         deViEw7E/ip+lcKonuGsVFnqpTG21xJGHpH6jmrgzigBgcJVujnekIVEGJn+62prLi7K
         4hDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=mHFVRGKNxP6N2QG7Euyckvg/DF1mSDACPj3TCGfbuu4=;
        b=MDsEDq7xMH1qMffX36juKD4gMF3SHdxizaLth0HrPMBRhfmrF6MgkMMw+OgZ4JqIYY
         O2UtOWUOws+2eUQhvdyiDeSR6qE918j/yO4wLWkFeUxNr3szUHobTmjcPmOfQb31811C
         5Tsj2ZVsRcZeTA5ifs17fyQGXQTHkYuWdUxyM+5b45sGXkc05k/xvotIbBkocv7Or/QB
         QDY8clVmXT1fULHBCL/9B+Qnyw9+4yUbdV9brMDU0cBJ7TopRY1Qc2Epol1nCLJg1Diq
         moRx8+2TkBt4mhKJv7Z7wc5sIlJ3H9hv0KEJyMF7Bynxcvpe2FSl6s3TAIiu3XYlv+AE
         Sk5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y69sor1968663wmd.20.2019.05.14.09.15.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 09:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mHFVRGKNxP6N2QG7Euyckvg/DF1mSDACPj3TCGfbuu4=;
        b=B7gBbMg/ttWBxrqQ7LUD5DKFW44z9hJdS0sP4nonMjSXnwnlELOYZ7YaQiW8rKJ74K
         NcM+TtjYOO75skNHCUHJiKh5clvdCQsXnxN0f82FahjmgavGSGx3feo7nKI6v0NcGkMP
         +YVRomcduEdC8MhxW3iWqbO7Dgr7aDXvQQqX0PqEor9JZMuqfoRcbFzyuEcMb0Y9TspD
         wYFG6eh7QfTrkx7FWeHxbOMuiHn/VLqmAYSIX9DezM1kE2DMfrW4oYnd03vjlHrL6lpX
         FqLs1ZFyLzvdXLAQNgzRTaFyr7vWsghssPDS9OGhfBjyIDfpsMn9rpixuP6TLdp5tr2U
         TP+A==
X-Gm-Message-State: APjAAAVOwnum35g+DLhUSLPMRv9B9yLucA4JMpAZFmefVILSL10fQ8Hq
	9Jn2UmMB+qhBNstmJpvxDqviDw==
X-Google-Smtp-Source: APXvYqwmK24rimFfI+tC88xHPjZ5x85yDiskVaUE4FbGZqXi5P0bkhYDsOBir4lid1jh2s0P5HX62g==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr20046886wmc.148.1557850517364;
        Tue, 14 May 2019 09:15:17 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.43] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id a4sm4093830wmf.45.2019.05.14.09.15.16
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:15:16 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 07/11] target/arm: add LOG_UNIMP messages
 to arm-semi
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7d4041f5-3ef8-4e83-cea3-832afc0195b5@redhat.com>
Date: Tue, 14 May 2019 18:15:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514155301.16123-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HnYV7l6YohxP

On 5/14/19 5:52 PM, Alex Bennée wrote:
> Clean-up our unimplemented bits with a proper message.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/arm-semi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 253c66b172a..a3bbef18ef7 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -28,6 +28,7 @@
>  #include "cpu.h"
>  #include "hw/semihosting/semihost.h"
>  #include "hw/semihosting/console.h"
> +#include "qemu/log.h"
>  #ifdef CONFIG_USER_ONLY
>  #include "qemu.h"
>  
> @@ -366,7 +367,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return len - ret;
>          }
>      case TARGET_SYS_READC:
> -       /* XXX: Read from debug console. Not implemented.  */
> +        qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func__);
>          return 0;
>      case TARGET_SYS_ISTTY:
>          GET_ARG(0);
> @@ -400,7 +401,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return buf.st_size;
>          }
>      case TARGET_SYS_TMPNAM:
> -        /* XXX: Not implemented.  */
> +        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
>          return -1;
>      case TARGET_SYS_REMOVE:
>          GET_ARG(0);
> 

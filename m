Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4224181wrg;
        Tue, 14 May 2019 09:59:01 -0700 (PDT)
X-Received: by 2002:adf:8068:: with SMTP id 95mr21677213wrk.174.1557853141708;
        Tue, 14 May 2019 09:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557853141; cv=none;
        d=google.com; s=arc-20160816;
        b=oobpFLAcuHhDMdp7XZMSzanSFJxpF9lauXUAURoUOnykZbeAzFcUk8sR5XirjZiogK
         FLmrGw5sVtlfspgee31AIKuwx66Qsgn0Wwd2lvY58sFOb7+oW2IY6noGjm05JEmfLwKS
         3RuiiDmYIVd6hqcHaLPq2j5uTU+vDmNC/Wi/vp9qe+Ue1FbvXq2SjRxCzI6YNP2W/KY2
         OHRSiDCJOm2N33ZJLR7kYHXgs9LM9zsZs0kXg+Arada62c6yMNAA+kXxdAAdAu5IUrJY
         68DqWnuVVkqggdHQWmJQFTsqMSg9Rf5dJC+fSf1hGWhoRHUyge24Oq1iZLaj672zadgK
         CnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=Txru0t/jjgKlFBr2PCnXCr7WUnQEwCi5YXYcqSLxRfQ=;
        b=F6RKOUtIEtaxN1koIfdr2kKG4hXxsahzHCRrRD5n6EV8W5LyZopQjRqJQR82J5/y0t
         0JrVVOgM4sIhKVL7OQhl9u/6XqltLAXYwfLuMh6hdZTL7JBZmedK+uzzXlDEGoDFjboF
         WMTLsrI1yB9cxGVyu9Z+/BDIfJqHJVdaE5gNU2QWE+XnOrHTtM9uNl1kc7/ELbLLVpnw
         ozZcH6Nd4zNVasKEamXkgpSaqpK33kAC5wMaYDYnmpHob4abcQrbsded19PsWTFoel/q
         VtLHTOSNHITfgVQ963oSf0Hb8v4SJqkH4yyFxEYq2m9x4Fw8V105mh74gLE6NsKwe2JQ
         24nw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s2sor2127362wmh.11.2019.05.14.09.59.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 09:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Txru0t/jjgKlFBr2PCnXCr7WUnQEwCi5YXYcqSLxRfQ=;
        b=gFk36NUc8xiKULKgwg1KFXMbWXwkRb5d0zP0DfIiAGjFjX2PXm15jE6ZrBCCxakii/
         namYYoC3cFP4CyxEOCQN+pOvSFzmc9vQB+syBIF/9lgxVDylgCit0XnvPgToq4EGGde1
         kQce7igztvw5LfPPhce/iFtTLy0iSPNu87Xzn6OMcYKL8h79qoRTMcpSJyx4DCUfGLAl
         p/yxGaxjXbPpeo9TRNbzQtpRdxcvJtb2zMMB35l/9lBnlPr42bf4R/TEvAh1NrmT7xPr
         D9I1ZbStmbadSC80nBve/EIG+WhQDA9c9X7bDzVmQVadgsL6LCoQY+jdT9zHuva8jKH1
         3kUQ==
X-Gm-Message-State: APjAAAV4RS8t3LBvaXISDHLpUUTII3K5LcxWhHqVmZKepv6v6elOdyjc
	ccmfC5FTgTTtU/FzA7rHlB9+7A==
X-Google-Smtp-Source: APXvYqzFysbb+63KWw9gf3qWIXZORXIlMMA3o3JJ1gmuw40/USODu/IGPrRiz84ywJJahZmR+Hc4ZA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr1628917wml.150.1557853141496;
        Tue, 14 May 2019 09:59:01 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id w185sm3629220wma.39.2019.05.14.09.59.00
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:59:01 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 09/11] target/mips: only build mips-semi
 for softmmu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dadc0cad-cb9a-73a7-d87e-de742756a193@redhat.com>
Date: Tue, 14 May 2019 18:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514155301.16123-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7MmKnq3kXKHy

On 5/14/19 5:52 PM, Alex Bennée wrote:
> The is_uhi gates all semihosting calls and always returns false for
> CONFIG_USER_ONLY builds. There is no reason to build and link
> mips-semi for these builds so lets fix that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/mips/Makefile.objs | 3 ++-
>  target/mips/helper.h      | 2 ++
>  target/mips/translate.c   | 8 ++++++++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/target/mips/Makefile.objs b/target/mips/Makefile.objs
> index 651f36f5176..3448ad5e193 100644
> --- a/target/mips/Makefile.objs
> +++ b/target/mips/Makefile.objs
> @@ -1,4 +1,5 @@
>  obj-y += translate.o dsp_helper.o op_helper.o lmi_helper.o helper.o cpu.o
> -obj-y += gdbstub.o msa_helper.o mips-semi.o
> +obj-y += gdbstub.o msa_helper.o
> +obj-$(CONFIG_SOFTMMU) += mips-semi.o
>  obj-$(CONFIG_SOFTMMU) += machine.o cp0_timer.o
>  obj-$(CONFIG_KVM) += kvm.o
> diff --git a/target/mips/helper.h b/target/mips/helper.h
> index a6d687e3405..90ab03b76e3 100644
> --- a/target/mips/helper.h
> +++ b/target/mips/helper.h
> @@ -2,7 +2,9 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
>  DEF_HELPER_2(raise_exception, noreturn, env, i32)
>  DEF_HELPER_1(raise_exception_debug, noreturn, env)
>  
> +#ifndef CONFIG_USER_ONLY
>  DEF_HELPER_1(do_semihosting, void, env)
> +#endif
>  
>  #ifdef TARGET_MIPS64
>  DEF_HELPER_4(sdl, void, env, tl, tl, int)
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index 3cd5b11b16b..fb905c88b57 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -13726,6 +13726,14 @@ static inline bool is_uhi(int sdbbp_code)
>  #endif
>  }
>  
> +#ifdef CONFIG_USER_ONLY
> +/* The above should dead-code away any calls to this..*/
> +static inline void gen_helper_do_semihosting(void *env)
> +{
> +    g_assert_not_reached();
> +}
> +#endif
> +
>  static int decode_mips16_opc (CPUMIPSState *env, DisasContext *ctx)
>  {
>      int rx, ry;
> 

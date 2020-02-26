Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3284289lfg;
        Wed, 26 Feb 2020 08:36:27 -0800 (PST)
X-Received: by 2002:a62:ab13:: with SMTP id p19mr5096979pff.98.1582734987511;
        Wed, 26 Feb 2020 08:36:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582734987; cv=none;
        d=google.com; s=arc-20160816;
        b=FeQo7P+V7IuHKUjgD3afF6mqoIq/LG+9ExuS+JvA/F8ySMw82BUllE7w8vIbjtwuXa
         KzhzOwtLLJxUR2wTDfZP/Pg1WqHFaFE9yPkZ5arUodqnHmS8gghuyK1QYueR/j4xvd7s
         PIvhWxI29jlbgdbrVYI4YL/d6cuDrfIcPoHRm1Ymx+dwvnaG51kIQ0FQljzY+RXAYrVu
         w3FJWFPiL8pdhRINUgZh3Lrr+tSE/pGwaRkHD+4Mdy2ai16cMM3Zp+x7RBFd4vvUnMmg
         qAl91eoGYefbA9+i7+xioIP5+ZKLJiqEQ/xdBqR0ZhwDcNjPmR77LTmdKb4A3Q6ZB2DT
         dTJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=XGxBi06S5twoQRPY3oVf8T/EbZFE6lieZGOKgkJPxs0=;
        b=Sc8LgYDWjeVuEgvcXE79nzzZpyAqJsixR3oGw6dMPQ+FPa4ZMf4PRjMxw6Kd+aFVD3
         RJQ43Vajqig+OQUHItucg45kIvLK9LaCrSiFnNv3l3sUPT7FmGqVsfGHai5+GZ26zZ06
         zuDet4bjCewtHYV+GwAsPV9UCHajEXVn9bi9KkKVB+nQqjfEJ70hc75zHZUZEOwhgNcZ
         751mZbNR8I9axm0zcjrQH3mkZxuGPJGzxtojVwsa22CmrfXqEgSq13mWydvwHY8FN0QY
         MwJud7QPUyKNMIvrHWo1pT2xS25lgKWfm9baLathHWsa0MiM93HyCLepLogM9rc0GuOy
         TvNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wx8DZSfu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j11sor14026pjs.19.2020.02.26.08.36.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2020 08:36:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wx8DZSfu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XGxBi06S5twoQRPY3oVf8T/EbZFE6lieZGOKgkJPxs0=;
        b=Wx8DZSfuUI5EjLOlSbiFPvrD52GfYflKhIwm7j5vn0fyRmzXEqzUNzDWA0PkvqXG++
         uAK3lUF7ZaF9iTIyMRc2J7vOqDIZ5sF+1k58VOReNfutHLi2c7aOE10BDsI7Ixjh2BBe
         zkZrMBanPvMCN4j+M3FtsufdcsYK66CPw60kTwho2Bgkg3MFuXcz+O6Km2DEQUyNk1GL
         N8hgK4xoGONbEgohAavdRCT3LTHX9Dsq6+TXF31Nnl2cmyr22DT2RJjIml9QGprgo7Ok
         oE4T6HGd6kKL6gpXmmGnC4+s927CLg4c6mHJvoDOpUf/Dtq/AuTs9n5bs6X7CujwayWX
         ArGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XGxBi06S5twoQRPY3oVf8T/EbZFE6lieZGOKgkJPxs0=;
        b=OVmaCuayiteUcbNJoXCyrKEKooub4ZrNsD3xyCLSy2choy4cLGiNZ1U1vjVJZ1msNj
         xxlpnsjCyD4baEXFIf0E3fKDQD6XWEZbU70leGOmXiCRe8hCjRopXfmRho+kaBR2x9oU
         6qDNoUuO1YdDV5QHyDpR0pwKfGmiz65tlC+OSqn6btYS33CFfypSY4f73kpUCY3KbE86
         pr26r5Cg3GOk7Ppb0VwRgggRuaSxZK5N0GZeZRa0qESfXi8jPZ5jp5b/Zv65Zvm0tZtL
         hRmMKxrBOL3LAN20O0ADBS83jgtYCUD75q1TtrYhJVx9UQtGGdE+m167z6fd4IRRT2lt
         UZ1w==
X-Gm-Message-State: APjAAAVN8i+q0x/lG17uwzJvw1MpNUE4v3UBshOrDLcuYgzeXVuLAxcX
	ZUWNbOqIVx75ZEgA3LB2FVLxZ8sG
X-Google-Smtp-Source: APXvYqzioFTGSliesVsb31cQs30ZB86onewShqJTg+5NwnP3dr5YnwVYFjgG8KTWi9GAomA/tGpgJA==
X-Received: by 2002:a17:90a:7f93:: with SMTP id m19mr5953784pjl.92.1582734986819;
        Wed, 26 Feb 2020 08:36:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id s124sm4051236pfc.57.2020.02.26.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 08:36:25 -0800 (PST)
Subject: Re: [PATCH] accel/tcg: remove link between guest ram and TCG cache
 size
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20200226152710.31751-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bac7a5a4-c4c4-5102-4fe8-097ab15af29f@linaro.org>
Date: Wed, 26 Feb 2020 08:36:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200226152710.31751-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: s0YeBC7StJjq

On 2/26/20 7:27 AM, Alex Bennée wrote:
> Basing the TB cache size on the ram_size was always a little heuristic
> and was broken by a1b18df9a4 which caused ram_size not to be fully
> realised at the time we initialise the TCG translation cache.
> 
> At the same time the default code generation size seems mainly set to
> deal with the fact we use a static code buffer for CONFIG_USER to
> avoid mmap allocation problems on constrained systems. So we:
> 
>   - only use a static code buffer on 32 bit systems
>   - up the default buffer size for bigger systems
>   - ignore the ram_size and just go with the default
>   - document the fact tb-size is ignored for 32 bit linux-user
> 
> The could potentially slow down softmmu emulation on 32 bit systems
> with lots (3gb?) of spare memory. Those users can still manually up
> the tb-size via the command line if they do in fact exist.
> 
> Fixes: a1b18df9a4
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> ---
...
> -#if defined(CONFIG_USER_ONLY)
> -/* Currently it is not recommended to allocate big chunks of data in
> -   user mode. It will change when a dedicated libc will be used.  */
> -/* ??? 64-bit hosts ought to have no problem mmaping data outside the
> -   region in which the guest needs to run.  Revisit this.  */
> +#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS == 32
> +/*
> + * For user mode on smaller 32 bit systems we may run into trouble
> + * allocating big chunks of data in the right place. On these systems
> + * we utilise a static code generation buffer directly in the binary.
> + */
>  #define USE_STATIC_CODE_GEN_BUFFER
>  #endif
>  
> @@ -927,7 +928,11 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
>  # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
>  #endif
>  
> +#if TCG_TARGET_REG_BITS == 32
>  #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)
> +#else
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2ul * 1024 * 1024 * 1024)
> +#endif

As Igor notes, there is no -tb-size X or -accel tcg,tb-size=Y option for
linux-user.  Therefore I'd prefer this patch merely fix the default for softmmu
and not change linux-user at all.

I agree it is somewhat silly to use the static code gen buffer on a 64-bit
host, but let's leave that to a separate patch.


r~

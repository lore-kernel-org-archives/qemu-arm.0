Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7530392lff;
        Wed, 15 Jan 2020 14:24:40 -0800 (PST)
X-Received: by 2002:a65:4047:: with SMTP id h7mr35985336pgp.60.1579127080099;
        Wed, 15 Jan 2020 14:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579127080; cv=none;
        d=google.com; s=arc-20160816;
        b=MOihwAEpTL789lADiEDDMN4kiqrj1Fobwv6IUkO+18YwqDkphBujlDIcj/masFMY/J
         sb5gz+fQGGFrPfXXCDSxp2t2Rt5D0CAKJ8co6d5uIa/x/vYVLDSK8XnMI63V7AxFU05/
         FZ0LrXnm9FyISnC3S0HIaqAa6k4rThIuTR/qcRcKDnno9Lhm1xlP9y3dm+p7yPc4RPeR
         zRHxkdDRENSojlZL7se+/fZ0GmjpKS5mYcw9A2H8Nw6VTJTbhA7yuhqkuO7/IC8oIJEO
         kvF7XU+GJvOgUbTvtmuwSsfblxJtglxVybxK7zES3H+wC81JQVHk9WPCKt0c+2BCJkBe
         Ef/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=QUKf1kPErSPimYJHJpJWj0jRHEEjFnIDWMQB6HDFR9g=;
        b=bQX20jGafKpOuUfEXsCycTnuKVqZs5ke/FNjv6BbHpCZYl0mtUTiihPZ1u0/z/kFDC
         uaH/EkVgRGWxQCoGEoVJ99mBf2r35bUbSUUVBklVDXm8GzWPT0278Uc+j4r3TlAVm/ru
         eyqKQmTnVhUDJAg23Ys7KGU/3+DIG4419T0wuan4RedSFXG8/6cka3Wt0+afdQfDKS8/
         U4KNIVoKMvLTbJJjoFUE7gyTfv1ledh8lRUMuj7ryQ4ccZR7PDvl/0jpPgmngGdmALkF
         dXSTkYbFH///aZYvCWp8cLi5jgwAOELKWFP4VkYO6QnLn4MLp2JemHlaPqzlzxSwAqC5
         yn+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViCuQIlj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b6sor22013663pgh.15.2020.01.15.14.24.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ViCuQIlj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QUKf1kPErSPimYJHJpJWj0jRHEEjFnIDWMQB6HDFR9g=;
        b=ViCuQIljQ+l7xJ7bgELOrFqs7fOvokDVJuc1VgJ2XXhWhvE+YIE8l6c/1EdKDHENDX
         Yp86vSHty3Ff+bTiRWhGxKyY/G9UGig8gES5LFgyNpy/sGnDkhuMfGoZD+K51vACwyXk
         PqVdtNgl34G9DiFEs479if7ohx4iSzvNxDT2M2lWchqpvEKBck+ytaLJgae02BktB4YQ
         VUTuVKdnaINUl13wo1MgNQXS+WRSomnukRxBrmE/1HbaEpqDU0Vl3gjY7vEG/un17/wZ
         sacp9dxxRw7+EWttfxzXl8ufcq2LWXvSIcjFufUz0oxJILf25jIoQCCdYdjre8KJ0WeX
         114g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QUKf1kPErSPimYJHJpJWj0jRHEEjFnIDWMQB6HDFR9g=;
        b=Z6VcXywcJctN1O/MxB+Rp9/HIXulXutPRxyPrI7khHShvlEEAKT2mzpXvAQ2DlivsI
         PuvicSa3tAhiwPN3gRVsf4m0AMonEocwP6slzolAEA2yRk51OkgA61/p9tu+3WtljER7
         w7L4hIrDnbzkAAOLAHBfjXBe+Eg42Cv/5NW4Tz3z3fDPWQB3f/RBUpQ7EFwAlbGJ0Tk1
         iuKg/9GGbFXvbQQ8OYYrSlTsBBUy7qchDm8qZBy5I2k1L2ZXwoa7z9cGD4ClUQ5vrBcy
         FBICwqjFsNlXrzeESjrnYTFFPVjxwu3/qjSKCn2E0pQFlctl4pR+FQdBp07I4uMYRDD0
         WvyQ==
X-Gm-Message-State: APjAAAWPthdkaLD5zGcggmExU/fnDFKCmF59VhqZXpxl+lk/7bzX/IAk
	/qRpqwR8ELoy2XT7cMir2PUErRLl
X-Google-Smtp-Source: APXvYqwH5LxK/NWbp6OewBfKdso0mXPoOfbF3Okv5sG1R0Zvo96ZOS8r3J3PKp8wm5RQjaIzTSVN3A==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr34722007pgp.172.1579127079384;
        Wed, 15 Jan 2020 14:24:39 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id c14sm22779881pfn.8.2020.01.15.14.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:24:38 -0800 (PST)
Subject: Re: [PATCH v5 13/22] tests/tcg: add a configure compiler check for
 ARMv8.1 and SVE
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-14-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc27ea7e-2ea0-fc2b-5dd1-88155eb8d7a4@linaro.org>
Date: Wed, 15 Jan 2020 12:24:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fJFmmWN0yufD

On 1/14/20 5:09 AM, Alex Bennée wrote:
> +
> +    # Test for compiler features for optional tests. We only do this
> +    # for cross compilers because ensuring the docker containers based
> +    # compilers is a requirememt for adding a new test that needs a
> +    # compiler feature.
> +    case $target in
> +        aarch64-*)
> +            if do_compiler "$target_compiler" $target_compiler_cflags \
> +               -march=armv8.1-a+sve -o $TMPE $TMPC; then
> +                echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
> +            fi
> +        ;;
> +    esac

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

What's the status of the docker containers wrt the BTI and MTE extensions?  ;-)
 We already have tests for those, disabled.  I currently edit the makefile when
I want to test them explicitly.


r~

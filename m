Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1657520lfa;
        Fri, 4 Jun 2021 19:19:24 -0700 (PDT)
X-Received: by 2002:a17:90b:120d:: with SMTP id gl13mr7967254pjb.72.1622859564716;
        Fri, 04 Jun 2021 19:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622859564; cv=none;
        d=google.com; s=arc-20160816;
        b=nHDmJBYauxUvH7w5cfeXdi1o9fBVLhGZ8HXhEGVjUTMPUbGDm/k2sqij/qX5KaBkRx
         c3RbwYloSJ3/Ut08I4di2ec0JgLOe2dEsqPo8QjFsZ87oTfOQity440FNxJMSbjaapHJ
         x02lTVWWblsAcXyq+sDL9tCg9S3WHs7GEnim3NBL7NiPYSEvKlT0rc1oZSYfb/gAvyiC
         4NqQ5jI3d3wQ204Mc1T2082HJ9eqVMOhqkoL/XClKOHjf8xYh1jOF++ZtOcKKC5OIDxq
         Zp25l6Pmc0UKvQhagEL6iXoB2ky/zMSytX+XGpOeuzGF8QlsAl/DDGBHVCb3TCub1EjH
         ygag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=YbevpYdZY/gCcPsEQXvJLBVaZ25kgXVXhCedwdEsmb8=;
        b=s6NjL8BEqIxIDhIJoc2EWz/4bEhjgWW114sTsYbYZO3XSCo4OwdwB/3G1M8Icath95
         LLvrStYPZwk3Xh6BSYfd3716UDGuLflFC6GhSee2u+swHwBXzXho0P5Z/ntqdXftE/O+
         QjQ76t6foQhZho1PdNdfDWR1Fu/TSebxd+Gm8VN/vWur5121fvJBmjv/F/Cloa+7mwhI
         kjB617LKtcdRSvT7a2/zAi9MmIk0MoqC9E1KGQijtsoV9ghHuT+YNSqX01Wd9BF2Pwcl
         vekyA6xd4qat2s9JG48FxV6O7oO4pdaG/41qF4zoKjXcVfEp1VhgEx10N8uKWwTxLLWV
         nIDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtGrweiF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5sor2040454pfd.2.2021.06.04.19.19.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 19:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtGrweiF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YbevpYdZY/gCcPsEQXvJLBVaZ25kgXVXhCedwdEsmb8=;
        b=VtGrweiFUnMqPnkV8YQ44tN8u+QrbVLjg3ywsa/swD8PitmU2B0I6L4HJoqXgnA1rZ
         yezdlY5U260doiui10FfDJ7yDAOBtk+a/MtiupyDnsEdzv36HBLvFIuPbtGl6xH+YSYx
         PC3yVzcqurZd63aMQmWIxI276cagBxuBsLxCXErQ3XhOBcAmTTZpzhhwXjQoZEvccpgc
         JzpiYO+WEDhbMVw8Pbp2HQZ4Qu/MJqyLADrgf/sDoLVommHO96sVvGXGlau9NOaIkENr
         OUH3IiUsB/CNeG0kPHDp0IS9N7PmYyON3FHd4EvGrx8cLjn8C1znLECQY6lKHt8zPcpq
         AB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YbevpYdZY/gCcPsEQXvJLBVaZ25kgXVXhCedwdEsmb8=;
        b=VvPfj5h1u/p+cqMAk3eEGzBDHkmWw5OtYGMXuE9F5LJrpZ+tkEKYGxoFvU21D4jv/l
         Z7WikhrIJxM12Cfg6g3UyAz2WXYirGi/k990RKACnxa/WclyG6N+24nDg2FK3yRJR+sv
         sqjjvZJicGR+5WYEuw2Kr4RBmP8QKkExF/ns+e3OOaTC/iuQ7kz+tPc8OYEESc3OdNNB
         8JVKOIoa5QqI1NeS3MPHzv+8e09oybfazql8VXzcEeK2DQ21rRWlRC+Rks0qYOXa2RDe
         jVFQe15jIpWhC/2pVkvmMpO7Z4NCN2jP6hNzgqoGXR2pR496GbgAPjaSOgcT3WT283UJ
         JRMw==
X-Gm-Message-State: AOAM530r65Ot/f6QzyOTEg26KMagc/RINvht1zmfQK8V7ksztmrL91ho
	ggBLsE0UeH27+jCm2ij50QPDiRN3
X-Google-Smtp-Source: ABdhPJzN7c8UbbRu6gkz8m3lknml6Sw85uiikqGgFAeLxZ0pDGon/sW91rUPg+CWduZmQPfEWLA0tA==
X-Received: by 2002:aa7:8392:0:b029:2db:4a7:d866 with SMTP id u18-20020aa783920000b02902db04a7d866mr7381853pfm.66.1622859564187;
        Fri, 04 Jun 2021 19:19:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id i21sm2712317pfd.219.2021.06.04.19.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 19:19:23 -0700 (PDT)
Subject: Re: [PATCH v16 51/99] target/arm: move exception code out of
 tcg/helper.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-52-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a3aa04e-917b-cfb2-124f-10a23062e81c@linaro.org>
Date: Fri, 4 Jun 2021 19:19:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-52-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Eu6b/KyE8RsJ

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> cpu-sysemu.c:
> 
> we need this sysemu code for KVM too, so we move the code to
> cpu-sysemu.c so we can reach a builable state.
> 
> There will be further split later on in dedicated
> exception modules for 32 and 64bit, after we make more
> necessary changes to be able to split TARGET_AARCH64-only code.
> 
> tcg/sysemu/tcg-cpu.c:
> 
> the TCG-specific code we put in tcg/sysemu/, in preparation
> for the addition of the tcg-cpu accel-cpu ARM subclass.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h          |  31 ++
>   target/arm/cpu-sysemu.c           | 670 +++++++++++++++++++++++++++
>   target/arm/tcg/helper.c           | 734 ------------------------------
>   target/arm/tcg/sysemu/tcg-cpu.c   |  73 +++
>   target/arm/tcg/sysemu/meson.build |   1 +
>   5 files changed, 775 insertions(+), 734 deletions(-)
>   create mode 100644 target/arm/tcg/tcg-cpu.h
>   create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

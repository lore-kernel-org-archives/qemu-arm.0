Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1398348lfk;
        Wed, 2 Feb 2022 13:09:38 -0800 (PST)
X-Received: by 2002:a63:5f48:: with SMTP id t69mr25587965pgb.98.1643836178522;
        Wed, 02 Feb 2022 13:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643836178; cv=none;
        d=google.com; s=arc-20160816;
        b=urmhBAOFKoLNU0Ppszw5vLTZ3YMl5acb4IkpSmknRYR63h8ioaVxSqCPOhH95HE31W
         +Ig/PUPCEyb/qaLGmAtMlx6c7BSI6rX018kjvEZ/nviii4nyV0pHUMIbvmp9TSM8TCwp
         H5jI4hxlekX7TvX1sqD7Ore4rWCCIhuo4ahCDPkba77qmWSPhGTXwtRTGClC9EhoM+pz
         1iUz63Sf3dYNTu6aNIlMaxuwPrVJuMLvFZKohgSuo5OAWeIkUdcjpwFyXwFn8kMtK218
         e21o62CH2qpOTQq4krxDFdlW5DLSibb2xIIJUng0DC2gzPN1uPHL4pJEv9evlLfw3fbV
         GPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=K5QUGTnFRnr1FYzfLIv85FR8GFW9imDBUoUo+I4Z5I0=;
        b=pLpIki5QlSNHZb9+YonITR5YGQUfd0RNLjAxaRUkLQAwNmIJxRZ+VKOMNib5u4grnI
         v+PabSanz16S5kRNYZvCmgvqX5MOMHvO+66o7ZSozs4B1yJ+U0N+ELeq+aj8dn7FJVlx
         buFMlXjN3zvdEIWYsKzCblHhY0lbnAZoLXaAz9FIe9fHAPFH/Rxe1JhWpl3vVwNPbFcn
         Nq3guhYhGPzHqxXaUCbjykfNzhguc1FULHNvOOnk1VJIZjs8HA56GxPoAT5gVBHgAq6C
         M9BKeQKHyoZZ7HOJKbwMqjzsIMeiAySLBnvwNJvfIWKAk4XK0JNinlTnsiIBr/AOrE0l
         FnmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgG5+Zva;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w10sor10014362pff.92.2022.02.02.13.09.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Feb 2022 13:09:38 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgG5+Zva;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=K5QUGTnFRnr1FYzfLIv85FR8GFW9imDBUoUo+I4Z5I0=;
        b=RgG5+Zva08Vzy+N43uf6bAqhLcnGbsBY8UIUu44/m2gp2/UtsLy777xHvIHbt/vqlG
         7kYWwq1s2DW9uknTdMlObtEwMXeM1RTm7n8Zft1uHUmm53HYJKL4WRNjFVhLztfE0JQA
         9feexWjlR/y32doeMD66i3ZFfYqUE/Ir9iodg40qHaYZ/1Z/+duY7UMOooFTSiLMy7nw
         RARC4A9+hjZY2VRu5bLAPoRHSMRDzveqRuoHxbDqQRvTuLiRSdMbwQuLeBMy23NLTsly
         ONstB5tBd5CKPe0FWvIv+mTepXNUxfahjhAGHQx/Bxddc2HVhfxGbxLlq96Js3CFScHV
         EomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K5QUGTnFRnr1FYzfLIv85FR8GFW9imDBUoUo+I4Z5I0=;
        b=U76pQ7+d8mTSyw8JxyVwlaY9SWtNg2Y5lvdTd0YS963NIIDz5KNE4jU7kNTnP/4d00
         2gY0QvIrE+l2DxIHLgWLTtf7aZmCBmXbyU8rjv6xnSkan6zJlELdPZi/d7N/OdjbbyPB
         stj3ew1214CyiTnR5N/21A+EX+QyLqyibafFLtTHmxTxDKOXZs9HmpTwdcLjkqHLh+Fq
         6JjNthR6cRHANCofZekQ8m5iaC7pRUYwMxl6EiVKljNC8XIma39EMcfluhG+jykO5T0Q
         Be+eU9ZbrZx5EcP4jMg2QNcIDF7XU8XXrYO8s8gudiI+n51J24mUMuDS6fWcuGiGbbox
         lj0w==
X-Gm-Message-State: AOAM532cDPN/tNTiRIp0AoaxWxSNXJN9HcgwviWEWfVCx6I3obtlGKMV
	dM+LokjUbgonxhwxKvPF8rrE967TuDrqfAkXEHc=
X-Google-Smtp-Source: ABdhPJyozcRdl1QlG2V7P6DDRq137LDTyyIu/6O8X0s21j+J24Rm7as1muvm/aYuNho3HqWEVSJCmw==
X-Received: by 2002:a62:7c42:: with SMTP id x63mr31407200pfc.31.1643836178004;
        Wed, 02 Feb 2022 13:09:38 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:420b:54a2:470e:6ebd? ([2001:8003:3a49:fd00:420b:54a2:470e:6ebd])
        by smtp.gmail.com with ESMTPSA id s15sm27285589pfg.145.2022.02.02.13.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:09:37 -0800 (PST)
Message-ID: <5e12ebf8-46dd-021d-69b6-cc8bc68f7504@linaro.org>
Date: Thu, 3 Feb 2022 08:09:30 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 2/4] tests/tcg: build sha1-vector for SVE and compare
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <20220202191242.652607-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202191242.652607-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ePQZkblQxUkA

On 2/3/22 06:12, Alex Bennée wrote:
> The aim of this is to test code generation for vectorised operations.
> Unfortunately gcc struggles to do much with the messy sha1 code (try
> -fopt-info-vec-missed to see why). However it's better than nothing.
> 
> We assume the non-vectorised output is gold and baring compiler bugs
> the outputs should match.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 1d967901bd..a03844ce48 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -50,6 +50,18 @@ sysregs: CFLAGS+=-march=armv8.1-a+sve
>   AARCH64_TESTS += sve-ioctls
>   sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
>   
> +# Vector SHA1
> +
> +sha1-vector: CFLAGS=-march=armv8.1-a+sve -O3

For testing host vector operations, sve is not ideal -- you'll wind up with too many 
predicated operations that can't be vectorized by tcg.  (I wish sve had used a dedicated 
"true" predicate, which could be detected at translation.  Alas...)


r~

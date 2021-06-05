Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2314879lfa;
        Sat, 5 Jun 2021 16:01:07 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b029:10d:9f35:8ddc with SMTP id l16-20020a170902f690b029010d9f358ddcmr1973886plg.19.1622934067213;
        Sat, 05 Jun 2021 16:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622934067; cv=none;
        d=google.com; s=arc-20160816;
        b=ub1I98AiZawXpmMEqcwAlnHLtP4TRpNxYsThkBRlSa24y/Pr+QVKA1ShDevpsOlXwx
         E+Ojhq81wv3ZPgAvokeal+V/Z15iINKQP5mXLuhmaLeazB98Ot0+uLcyJqJDsxK4tEAj
         WRXAdhwAOf77b054MUEE9QIHqKk6jaLE3+6MVCGTjHlV2V9zIFFOXSZcGyALRfCbGRYY
         5nThEZdhwR8gQE52l38yQl6a9NhiFQ/ys6pR9+1tgbupq1lO4RvO5P22N6TmeaAngvc2
         zZNc3x/GV18XKuNP1EzZJjBLbRqc443/8f9SE11UGtpGG2KwsjF5tUWMZMoG4x8+nibc
         La/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OhbSNhffCGQYgRp4RK5haYU+KMDTXxY2DX8+JZ961YY=;
        b=jK49srsS8uulL0uYSTcAz59HnU80BOw93L47Zww4pMuyAyTrfTE+ITEJ7lp7N0mnCx
         ZttCMe0s4P6icaEE4+T4tHXld26rCZoGfAIow8VCLRaLrjMy89L+05tHaPGrabejb3VD
         vrlkmpqKTBBxAQIDZpJatBKm3rO0GTXn1ZzBakHZADMo3Dy+NDgZzGeUscQrGPoBZroF
         c2NTw4is0egonBiZgcy517wognGW4q4B3BmOb0jWc4PnGHdwMsXeFRzuSdsK57GmLbNv
         ZjX9hGIKE9WrHL8QIBU/G/kj2kYQ+XKltlTvLWBIlagFLL5WsgvOhRbnKrh947hjQH/R
         l9kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W71PXARQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 136sor3012914pfz.32.2021.06.05.16.01.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 16:01:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W71PXARQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OhbSNhffCGQYgRp4RK5haYU+KMDTXxY2DX8+JZ961YY=;
        b=W71PXARQS3HV0qb2WybHZUSuqE+ih5tCBl63af8DI+Qjz4RTa3+C48hI5CEJr40EgS
         pYEJ+0r9HQrWYumutq14oO5SW4gr3rdwBmr0gXZaeSAPrdW25QV4nyU+CJa9CmBYanL/
         rlikzH+q3Gf6L4rna2padU1+CSzmLi/K+r9y9OIopxHQ2FZlb5CUd6SwGTFp5wAdugVl
         sxKbaa8CxdaVHTwMxx6fc/M235LQZju2wV/WT3WqcLvkjx81m122QkC5hv19GXOVwPV7
         1fEHK0EZ30Zv50ADeJqbPEyasQUT8MkVL1hGOkfSynjKgaZ7BMdjepWCJ5qgbGdvXfK0
         KUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OhbSNhffCGQYgRp4RK5haYU+KMDTXxY2DX8+JZ961YY=;
        b=ef4uFM17JwXYEBVaun3duIi3QS3rEnKR6pVewPmi8kidSQOvoob/cjaw6pF4wzfpU8
         yJ2yzO/CxNfHDS+nGMPyYbQi/+HdaMdVb8ZHN4qivq6dfTXNsLoCko/cfXloX2y7ra5M
         BQOv0MIEiAytKV8gUYzihliTy3TFrwSTSRMHykY5sHX6vxGHGHHmeukrVwgreGyvB0ec
         BjXoVR/DNAkT5y0G5pZgdCkSknxCDlqrzpnWzqMwyHnr/1TQsfxv4qeyBW3X1sEYMVaU
         P7EoDG8e2j0aolasVEpkBLG7yH9NcCHMOviPnnBpWGT8Xh/VTS6t6OxI7hIGbUgmIj+K
         Gx6w==
X-Gm-Message-State: AOAM5332Jh/r8kd0PrwsyEBdty2V44a3t0JsQFav3IrJt0A+vhl/w43w
	Y333xfmHmEnMzBriq87gJzQlu3Fn
X-Google-Smtp-Source: ABdhPJzmhE2toW6u8C/g3Cuy8OL+XIaNRHS5GG8ex4DoZLed7dAEH/VeXl2qMV/ypyUjF23+OaxlHw==
X-Received: by 2002:a62:e21a:0:b029:2ea:26c5:2ec3 with SMTP id a26-20020a62e21a0000b02902ea26c52ec3mr10769592pfi.8.1622934066659;
        Sat, 05 Jun 2021 16:01:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id t17sm7518640pji.9.2021.06.05.16.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 16:01:06 -0700 (PDT)
Subject: Re: [PATCH v16 98/99] configure: allow the overriding of
 default-config in the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-99-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee423fff-69bd-5edf-a444-b5f5e6ec868b@linaro.org>
Date: Sat, 5 Jun 2021 16:01:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-99-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +Zj7F4RSc+D4

On 6/4/21 8:53 AM, Alex Bennée wrote:
> +++ b/configs/aarch64-softmmu/64bit-only.mak
> @@ -0,0 +1,10 @@
> +#
> +# A version of the config that only supports 64bits and their devices.
> +# This doesn't quite eliminate all 32 bit devices as some boards like
> +# "virt" support both.

It's not really 64bit-only then is it?
What is this attempting to show that virt-only (with sbsa) doesn't?


> +++ b/configs/aarch64-softmmu/virt-only.mak
> @@ -0,0 +1,8 @@
> +#
> +# A version of the config that only supports virtual machines. This is
> +# intended to be combined with options like --disable-tcg for a
> +# minimal build supporting only machines we can virtualise with a
> +# hypervisor.
> +#
> +
> +CONFIG_ARM_VIRT=y

I would have included SBSA here.  That's a virtual machine as well, just not 
named "virt".  It would also make a useful build configuration, imo, suitable 
for --disable-tcg --enable-kvm.


r~

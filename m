Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp513982wrv;
        Thu, 11 Jul 2019 02:51:33 -0700 (PDT)
X-Received: by 2002:adf:fb52:: with SMTP id c18mr2663237wrs.216.1562838693137;
        Thu, 11 Jul 2019 02:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562838693; cv=none;
        d=google.com; s=arc-20160816;
        b=PAPh7mlW0Exld6hl3xG/qTyfIclCgFa6qkJLDGI08JvCY39ousnHJVj036Jfzs5x2r
         4foitrBKoyuFoDn6P+TB9vir8N7nK6nVtw8TZMGF9uq6bJe9b9KXKP0bvx+kQOUBekJ1
         adJBnLuV9MaXdB4DHC2Z7tFNL7amsGy9QGECeIVLrCdHNuGt35t5ZERGjvk2elvJeYNz
         oy6KgFn3PL02E91VIREzGVpwenaVKr6lRWlFCgHx9jlUxRkik6i6FOVG/nmFMDpLy5uY
         0aFlKprUDNVqVrknd+EZuPeZUjmYT/lC3Wb4psCPCv7KwfwwDP5tdk5MrzCfY3E/FoNx
         EdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=gAVGaU2EukknbVz3LSnjZp6iwEIEBAJJTIj+DEAIuGA=;
        b=z20e4/UF1Hjjce6P5N9zORhMlYkijc/frLSWGrs2vc/1ncMt7HVToAMqzslHRhLJqt
         0FZxmrUT4jVjmTuQHjwQTDa//KDs6WH+QNUAm8RjwNfRDeowv2GMutb8K7O3YBbHFS4y
         GyzpMAYk8Gs11bQ9Gqpc2P8Pghl+OwY9RpT5ip4oTdcHTsHPT02PYy007+qVpd/1bi+i
         uTZpBbdvHZroTX/2Y6KMdon+hxWwKgBAmsy9kcM+XhzDL/L4eKte23XmXwP+ewo2Dtk3
         pGXaZhePAT/UvgXhyFoTE0HZRUv6uD9d26q+rc60pH81oWQOg0r43HcQLOEC293WaYm6
         JPRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hL1f+CP1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b202sor3074234wmd.20.2019.07.11.02.51.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 02:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hL1f+CP1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gAVGaU2EukknbVz3LSnjZp6iwEIEBAJJTIj+DEAIuGA=;
        b=hL1f+CP1d1r1rCTc4Mh4G/HBYQOTVazEk02NzfndEkGBM7GTGwMFSutQwL89DfP9xx
         rO80l9S3LAFzmNQXxfVsAKmAslTpO3XL4pzLrSL5HL1JD3eZCA0Hz8RXaHzbQWwMOJ5t
         5oMqIszRtjXUZytr3XDvEoVkQDluxM7DTMlb6tbkzQtv2TWRV4pKlLQDkXQ1xt5wWs6w
         FGaebiNqbrGdTfCaYj9dkpoa63FxRotjOgm7gVxZSty4oJQ+O8ixs4528jsX3RSbKijg
         66yR461+5MZHQWIu7FDesye0kWU8o9kgm5lgwnn6Vf8dJBnc7eg84RVO1N1pvSAkS8Rn
         pVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gAVGaU2EukknbVz3LSnjZp6iwEIEBAJJTIj+DEAIuGA=;
        b=nXsAUZpSMyBgFdKZxLI4UpYja4qA0VkPzqsmR4O1Cw0hgOocrTvQNu+ywt70do3Fjh
         gQzhGULgE8XqdAOjUYN6YRYORPDum/b2AynT6HYsn0y8j/iFHXSTYxQ6DRky0QjwWaSN
         wmxblNxGpRwslF1RaIt79WpnRoU00joXUvQg8TE18TcN4Km+HFiXbhi7ZRv5WJapZmQo
         T9AsfWg5Wa7HEuiHiHTho9VKIn3xkfvFx3mVe5vKn3/hnybpl5HgXRZnNDLHTJCpIkZv
         tBMS1FliZI9jzb9dMKaex4XRBYck7e+RNLQOXttfgwX5Ehm/QV+IKuwnFGUBHbCrTDHD
         OO6w==
X-Gm-Message-State: APjAAAWokoMx4C6Rw7QwJvr94lqFuF1VuDHPCm9gXF0oKjq9l86ffI+v
	h4spiWRmN7b4cleTy+2r0UMfBRhQvAc+ygsY
X-Google-Smtp-Source: APXvYqzI4Qq0waYStIaqE86ndu7D18y7if+Ng8n5LfJrim4ezQyG64Kz9Hssm22fUfnjmY/HlKdRnQ==
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr3325599wmu.137.1562838692706;
        Thu, 11 Jul 2019 02:51:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.16.96.70] (mob-31-157-172-216.net.vodafone.it. [31.157.172.216])
        by smtp.gmail.com with ESMTPSA id g11sm5481552wrq.92.2019.07.11.02.51.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 02:51:31 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH for 4.1] target/arm: report ARMv8.2 FP16 for
 ARM -cpu max
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 1836078@bugs.launchpad.net
References: <20190710172437.628-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f85b75f3-f903-7bad-d43e-a545cafdb57d@linaro.org>
Date: Thu, 11 Jul 2019 11:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190710172437.628-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2V6/QLTB5Dau

On 7/10/19 7:24 PM, Alex Bennée wrote:
> When we converted to using feature bits in 602f6e42cfbf we missed out
> the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
> -cpu max configurations. This caused a regression in the GCC test
> suite. Fix this by setting the appropriate FP16 bits in mvfr1.FPHP.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e75a64a25a..0a0a202fe3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
>              t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>              cpu->isar.id_isar6 = t;
>  
> +            t = cpu->isar.mvfr1;
> +            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.2 FP16 */

The comment is wrong.  This is not full v8.2 FP16 support (which would be value
3, plus a change to SIMDHP), but v8.0 support for double<->half conversions.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

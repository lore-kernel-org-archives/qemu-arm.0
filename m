Received: by 10.223.197.9 with SMTP id q9csp3979949wrf;
        Mon, 16 Oct 2017 15:24:31 -0700 (PDT)
X-Received: by 10.101.64.11 with SMTP id f11mr9330145pgp.217.1508192671780;
        Mon, 16 Oct 2017 15:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508192671; cv=none;
        d=google.com; s=arc-20160816;
        b=AEQAS7SsMYEhEIa27a9Tza8Wrg74Yl9MuYeI4x/QVRq1TSgZo4opq7JGvNRPQQxdYt
         Vg346TfozmTz4+qltOiz2w9SeNuoGZU0cTGLKIg+e2M2Ededm6gattGXA0fgAr1pIAEK
         2zcL6lFXOuC5quMaAs3pNcMMtWjIJja0kIUcrjGXaajTOX0djPOAQmJaIRzgi0cSyscS
         mr/4U/wdT0mWHmP70A6KMY5uQOn9IAYfnxPP0ok5Q6yFzi10yisEradVR/4gY/IkOMXn
         NULFDvAOEwqnEysbxkPrrHFWri1RaW7+Yc0aam0yQTK3mdojXZT+WUz9azCY/jPilMu2
         BHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=rhAweNS/nll3PMOZxbSbo4e+rYNWNTqtB/9iJvTfJGo=;
        b=Mp0ecVAZ9iKyzaKHeaJ8tCjLrwYaXBtneuzUW04F41H5DHo0IWqqmKpYWabDt18lSN
         oqELGU2F3G+iKz+KZdm/wPVPHR4lTN4Oty66Jzc/OtMUE2qdgv6LMl8LAo+LFfuNuf51
         9Ry5x1bGJo9Bm4Y47k1NVwgtgkbHCu8X2XKY9VeWmyUbcK5Ux6mw4njG6LSbhrpG3vPw
         omA4dQY0IaDhbmSQG9wEkjud3vexgXT/Hy1++gYnUBh6tPs3IqsPQXp0g6w6kTLDG+76
         8AFVUJIEBJkQ1l6WpTq1ASmoKLX+mAyPBDeEzOld0a9dmQebbatfXgPmyYmLrL5PjR6p
         qGCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fW3QL9eP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b11sor2359754plk.105.2017.10.16.15.24.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 15:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fW3QL9eP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rhAweNS/nll3PMOZxbSbo4e+rYNWNTqtB/9iJvTfJGo=;
        b=fW3QL9ePHjKNdbLmoCzwgqhkIPK4IgZCSWpfoZZoVz342VZcB9dB15rdEWuz9VwWxP
         ohunv0eTXC4wvETAD6b87IkKoUX/RnGRGUJQBL1nxnIEP3PjqMYktGUloSRpv8z/0Ebv
         NQLLrPMsR2m1ULsSIZENAgewcAADIQgOaaqtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rhAweNS/nll3PMOZxbSbo4e+rYNWNTqtB/9iJvTfJGo=;
        b=UQi9WWriLjaLqnCltEwkn5U17u6ghb8qi/jF24sG22m8r7FP7yMUx2QOE7LRW1UQEC
         Y4E4Rjh99LFlcl0a4Hran1wKmxFlTFasbnT9/OmBxtxFH7yZEqhywRHQiqYaL/ozVwyR
         jsIe6bgechc86OcApoLitZUktsrfiYTY9W8C3y7VI9w29ieut9A+wspVfMcr0lj6wS8k
         M0QnP9bnTLXNpviD9LTEKOW3+M14Pbm/0AVKSNoq2jfaeTwTAmShXDrD9B+7V21xhy8h
         2mft/N2CLcl/uVx6eMkF5MpNeYX5gtdbqO72G+6ZotU+4D2YSiQosT66VHKENa9EaA/r
         ysNg==
X-Gm-Message-State: AMCzsaXmiQwbXbkA5UYmR16sZRfu6qaruQ0+PaDcF1tp1idteKwgOgYL
	KG6MNu5bnJwzOf+ZUsbHJ5GfvZhe
X-Google-Smtp-Source: AOwi7QDElvGNm/izz/gsbAkJbyhKfy0T+9bANmtpTQ/QfsL8mGJtMT8UzD2qDMm0JOSVlHHzzfOYSQ==
X-Received: by 10.84.173.4 with SMTP id o4mr10059352plb.152.1508192671292;
        Mon, 16 Oct 2017 15:24:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id l1sm14718111pff.77.2017.10.16.15.24.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 15:24:30 -0700 (PDT)
Subject: Re: [RFC PATCH 17/30] target/arm/translate-a64.c: add FP16 FMULX
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60365412-0554-1a29-3331-a0de913a5443@linaro.org>
Date: Mon, 16 Oct 2017 15:24:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: L96Rit0msvJ/

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -10648,7 +10648,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>          }
>          /* fall through */
>      case 0x9: /* FMUL, FMULX */
> -        if (!extract32(size, 1, 1)) {
> +        if (!extract32(size, 1, 1) && !arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
>              unallocated_encoding(s);
>              return;
>          }

This isn't quite right --

  00 = fp16
  10 = fp32
  11 = fp64

You still need to diagnose 01.

> @@ -10805,10 +10817,23 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>                  gen_helper_vfp_muladds(tcg_res, tcg_op, tcg_idx, tcg_res, fpst);
>                  break;
>              case 0x9: /* FMUL, FMULX */
> -                if (u) {
> -                    gen_helper_vfp_mulxs(tcg_res, tcg_op, tcg_idx, fpst);
> -                } else {
> -                    gen_helper_vfp_muls(tcg_res, tcg_op, tcg_idx, fpst);
> +                switch (size) {
> +                case 1:

MO_* here, since you converted to them above.


r~

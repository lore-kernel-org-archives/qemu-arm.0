Received: by 10.28.71.27 with SMTP id u27csp12398wma;
        Thu, 8 Feb 2018 14:43:56 -0800 (PST)
X-Received: by 10.101.78.200 with SMTP id w8mr265119pgq.123.1518129835894;
        Thu, 08 Feb 2018 14:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518129835; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub/5/zak3SbjtC6v93Ou/utoPhM5qXE2GOiuHjKyu2htAPWr/Id6D+dYeiQRl6uFk/
         w+6647SXQBLed3QSEFtM/PWAnt8D5/FjL3VQr30o1cdULgm4SUz2hpKqxMEXkrIXlQvo
         L1C30RINUQf4PhFrzjTjjaNbVKW2/c9hTPrprbDaphT0Ltk0UEZQHKao5bXNcWta4RLv
         91FeZkkb9Xa/kO4QtBL6d+LN8lEldQ/iHDpc45NGFWEymsA7Wb+wP/YML6m8D3uU8js/
         OqZQSC+EfxdIQMVhsXk8/uxa25BSTTFBoD1GjEkZm2f4oC0nh1L7aTBLPy/7UCRmUARO
         mObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=KFisStMu4fh4IGNbTcTmVLdYGW2yyX6RFtWzu1dzUbQ=;
        b=QcHvQ2vYu0rkfx7u/CRL4fGpyar8k4xUhNAu/UzXJd0Nzr0LN17K8Ep8or76Wea5BS
         SFX6xbLBlpKTNUn6fbBOmagYG7kW48cArOk8OJt6VudkwWOCt7KT9/GXbkUSxm6kxxTl
         p7tYKAhQJvWEN//IznFCzacluKePdV6RAgznDnjuBm/Ea5w2uy923AYysW8U+gDfFNHc
         kbE8d92ltI4P7moQdBSPM3FcJaLo5YUynI21kZsCB6gi4rrmWXmqJUTqYVz+PnNQSTdA
         wWskHLbz7PLarqxcXBJGY3RqtnBRlWOgsmy+t/gmKm4etP03FMfk5aRpQz6EKwbA4PDW
         pnBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bg97omE3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f2sor204883pgn.216.2018.02.08.14.43.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Feb 2018 14:43:55 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bg97omE3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KFisStMu4fh4IGNbTcTmVLdYGW2yyX6RFtWzu1dzUbQ=;
        b=bg97omE3IAyHTwTAwFQ3jeBUzV0K1O1s4Ixt31HSWj5NHpCt5Gj/ota/lj/ml/l2Aq
         OrCQw/FhWniV+EaQAPeKWw6Jc84f9g2u2PpqHyVrSNblN0qaZqTYqZybw7pYzJkNYOl0
         PIntTnvpumLxujhLxz3b5BVxLS9EXc1mUS/LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KFisStMu4fh4IGNbTcTmVLdYGW2yyX6RFtWzu1dzUbQ=;
        b=orQ7bEt4hBqIpRJw7ojvCbfX1++uaHUV7ZVDVyTkoEz2IG17qqmcC/8Bi+riiYUgFc
         wyZDzpFN9+6R1TZqoLAPvp9iCpeJYZJYXnjE4JSgySM/Ol4BO8ETd5r3AI4vP+/L58aW
         iyaVV/UhFDXpQwi00KSb6T0+mC9S0s50kodnrBh3PPS4aroVJ4mEtIUp8ttqMCiw9XUh
         MothRewjy3n8fu1uVEKMG1I/BLsqG5CmLqiFgVaSna3Dq8H/EipFBciPrPkU0/bI3YCf
         qfRXhF9enewxTkkiKwUvi3b6iRcq/DvXv9iLDryI79XMx3OSAqlwGCtebI3jutqGTcSF
         W8Dg==
X-Gm-Message-State: APf1xPCp1Z5rzqEq6Kqc2FRZ0W2ymYKyCo/aNwLFKoH2Km/3X915B33O
	y2u5gGN8syjJjpJXtYu12yUEWChitjPQVw==
X-Google-Smtp-Source: AH8x224a9bD82kk65L8Ssn3yIQYf/oap0s5oRBCRzCQJQN42PZMHI9Cca353crBSKoAcADvs/fQgpw==
X-Received: by 10.101.96.71 with SMTP id b7mr577400pgv.339.1518129835461;
        Thu, 08 Feb 2018 14:43:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id c19sm3431345pfk.22.2018.02.08.14.43.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 14:43:54 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 22/32] arm/translate-a64: add FP16
 FNEG/FABS to simd_two_reg_misc_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23fab91d-1ca1-0c6c-800c-f7fe6a1c109e@linaro.org>
Date: Thu, 8 Feb 2018 14:43:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: FdPD0GBJr8KE

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> +            case 0x2f: /* FABS */
> +                gen_helper_advsimd_absh(tcg_res, tcg_op);
> +                break;
> +            case 0x6f: /* FNEG */
> +                tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
> +                break;

Why is ABS a function call while NEG a bit operation?


r~

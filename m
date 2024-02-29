Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp710059eja;
        Thu, 29 Feb 2024 15:05:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQsXttfZc1DsLE2it9uHYECfDpw/rLGKXUmmTH867cVJIemm6rECZJcMwKABsmTwMaXTGwgDIw2S4mit3Py9Ht2Iryx+dX
X-Google-Smtp-Source: AGHT+IGlbgnSB+UBvP7xatgYSZ0ERwnR+OGnpr9Uo08pTTIOmAaTKmlWLzwT6k5xw+KUUiemHv7+
X-Received: by 2002:a05:6358:6e95:b0:17b:ef19:ee7d with SMTP id q21-20020a0563586e9500b0017bef19ee7dmr1656306rwm.26.1709247939398;
        Thu, 29 Feb 2024 15:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709247939; cv=none;
        d=google.com; s=arc-20160816;
        b=FfD3/jgzrFqiANC1sVScKesdvn5eAreCbkolYOl5fSv2ueVpz01fugyQK7a/fuL/Nl
         zjNQZoT2c/LjWG6zf6DKy85bFLPiNPbN33YMNekMkwTooGKtXxxRe9JhbaxPlBKF9ptC
         25fD8npBh5vw+nOGnB9d11ujIJBeoO0x23LEiBCPyu4IKngQyvXUpe9aB7z1jvIrLPE1
         m0kriCiNwVump5Rm99s/3jpNr6TxX/52nAghXLyN8gcbjtZLimqTjwGBFbzB9jPgq37Z
         r73Kx/i7xxqiL7S9dtPK278/6Y8kUCfE0Wuee9JC878NGQiEEfpbu8tQ+I6uPfiELqBE
         jSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=SVG6G/jUwC5ZGCxbB2nYaoKt15Hm73i6FrQGjWZf71Q=;
        fh=0hLCuMtfUX3PB9/IAY2LAYD+kcn1VPC2oyXdTqkARx8=;
        b=NzRCip6rwhoxQ2iXPKx6pG34Wjpxn9n2Yoi1re/CGuagCD0VWWddM94LJ/kPeyzb6M
         XLDUPtLTWcm2oxSjCi2xQmDZXTHm2gxkL+L7k+G/gl8mYo0eOVyrOMdSo18xD8pM826X
         J08Uq7aoBaAWpNAtHo5fpuFHCqJZwSD1gn5lr6QmvVUwlyxndaHs/UszhLD43RhFjZVd
         T8pb1BMUM/H3fK1oKIWtfacNJH8zkMc6+QzpN7ys1scNJ3Xg4Z6FV/96YastHy+KyGsG
         bZcR4CgJZuOmrA6ZQeTnlVNStdgfBbX6aZommw+u3v0LmTNToYwcYMiTHNnNDrv2/hc+
         /77A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xha83Qe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a014b00b0042eba5644basi2338607qtw.462.2024.02.29.15.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 15:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xha83Qe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfpT2-00078G-6b; Thu, 29 Feb 2024 18:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpT1-000753-2N
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:05:31 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfpSy-00074p-KK
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 18:05:30 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6e45ef83c54so995124a34.2
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 15:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709247926; x=1709852726; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SVG6G/jUwC5ZGCxbB2nYaoKt15Hm73i6FrQGjWZf71Q=;
 b=xha83Qe2PvKi9Rfvtba1JEQC5j59u4RFXaQX6pXV85rh6a1RduFC0pdLBlPuSY0ZyF
 5SVxwp7+gi8M/H2JupQkVhOCIyb1WfUzfj9tY8gV7xvbF41au5jaIMO3YvP8NP2qc4rJ
 DE3FISmUJD5dcyb3lUuNTr7zV6qtDgGQnE8WtYQXkLM3Ybqs3gCzM5OasQ3MSPG+Ci13
 yrVUagUCB/2aS8KsZUqjcOO0wGL6MpzmT2jRbFh50EYCGkzImegqnTUwSsvXt81Cnt9w
 iFL54yI2dIGFWdeh5GTjJBEPvdKoYzErZtbpQdS0CvxiCYAg9dykznXeM2UBXGHWI0UC
 ODRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709247926; x=1709852726;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVG6G/jUwC5ZGCxbB2nYaoKt15Hm73i6FrQGjWZf71Q=;
 b=CfhejfbD4CCgEatJ99U2cXbkn3J0IWpe/n3oG7Jfi5qyH4bKlXM8VgNwWgVvPnX7Oq
 hWUCbs5YXeNmT2Tkds5wwYRtRO8W911G474enYySGe9M/gG0XTV1PFx+6H11bR2gRDbD
 k0lKFMrOAZD2xdwRikqTV3C8V4StyRhOMKpKa0PFZwJRTysAHDRlL1ZVRf68CXHEma0h
 0C4p3tUaeFGI+g0UzezSxh9dUq73Kxrv4rC/3mwFb8kXrHgI+ke6SLcOPh67VdmFVE0/
 mD/FBIVgHB83VgIIhi8D2P9o5JoY338fNhXnRgqT/B8VVds1x1dpATz54QqTx4UJQ48B
 4blg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVORvx2mhvZ17WzpNdWEQZh+y6AgTXaoj8Lr1rzBKCrpORbFOCoqFnnLhp4dSZwQ5ZckOBejNZbp3lRKmNkUd2+HkJV
X-Gm-Message-State: AOJu0YxRlNGeZ8JCrURWOH4hjXwHEFCuGsKxWNFF/k8WOsLVyjQ6pO4m
 LIn/hjfm7huBZKu67v85pLxArn0ScyF/V6zkT/IyDTQZmeSqFOiBG33O9UW2RVs=
X-Received: by 2002:a05:6830:1db7:b0:6e4:8caa:6b13 with SMTP id
 z23-20020a0568301db700b006e48caa6b13mr130716oti.4.1709247926584; 
 Thu, 29 Feb 2024 15:05:26 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 i37-20020a635865000000b005dc5289c4edsm1817304pgm.64.2024.02.29.15.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 15:05:26 -0800 (PST)
Message-ID: <886af10e-2534-4d97-a705-573bf95793be@linaro.org>
Date: Thu, 29 Feb 2024 13:05:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 08/22] target/arm: Handle IS/FS in ISR_EL1 for NMI
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-9-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7P0SEJUReO9H

On 2/29/24 03:10, Jinjie Ruan via wrote:
>       if (hcr_el2 & HCR_FMO) {
>           if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
>               ret |= CPSR_F;
> +
> +            if (env->cp15.hcrx_el2 & HCRX_VFNMI) {
> +                ret |= ISR_FS;
> +            }

VFIO can be raised one of two ways: from the GIC and from HCR_EL2.VF.
But superpriority can only be added with HCRX_EL2.VFNMI.

You need to verify that HCR_EL2.VF is set before checking VFNMI.


r~

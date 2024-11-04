Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2254778njc;
        Mon, 4 Nov 2024 08:58:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJyv4FY912eJjF6cfmbleRJuEBC4vOHTdahONnFo26yRGlfiS9Xr3r+EONAwUrEn1y8Tu8OV3AehzaPw==@linaro.org
X-Received: by 2002:a5d:64a1:0:b0:37d:41c5:a527 with SMTP id ffacd0b85a97d-381c7a5d2bemr10699103f8f.13.1730739501571;
        Mon, 04 Nov 2024 08:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730739501; cv=none;
        d=google.com; s=arc-20240605;
        b=HSfg/6v/2LyT353waWrSqR7xtt09dftztAAut8hb6WrIIrE3NloLtd3XlJbXfbDDfh
         fQ+oUZLIz0SSwt3O3j1vbLXH4pGBRm2QHbra9MqbnTRWpNcmt3q53EIRD2k2vNvhvYFU
         D6qRPfDnpyNhpwTg0zbnmjQ8e4QDFWWXR+kzVpuXnr0eZ6m3zyScuZv/dFvKaf8oeoxz
         d7X/yfKBJZc0o2R8NxQnwpWFIRzZX44IfojLSqfNaCsSftrzOrIOOiMg8E2LbExyJThY
         9wE0mUZdIfmXtcNXVlBHezoSAL0ng0rciPram5qyGWmk8dgWrDVBhoyVF13+tYhjfKLj
         N8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m0o2RgKkHP9t1oVMWCUj0yrb8kc+cMF2/vR0PNGAOy4=;
        fh=Uuk6k6UD0tWdqjMOOZox9w2Enez5wBoRneRgsfGSLdU=;
        b=QOf//nOfto2h6mmjZphhNqT/xjDlCjcEzqIyg+kE81pK9QieElcqrCQPpgCG9/VHgK
         QHYbNCe3z/IT+xEm9fu+A/qEaENG1IziCwXwqIRB10bGIB3IAKrPkYwpy2BYeQ7wXMTQ
         ky2qm+3v/Y9hkJgc/pLjNRF5LcLUamIos1H0NHS35B7xWXPpTI63hgQ5CVgJz/ZrFjLn
         ZGtWCWkU1ngnfK2tu+e7NxOQvrxk5zMctmqfSfIIuj3/rbSu8TKZr+ZR5isjMRgYeWRW
         8e6tIRKU9qYHFmDbeayIJaoGaI7M32th8ccl2IrSqahch7SDf84eUhd0CsFo7SLmfrqa
         WfHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nflr6a4Q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381c10b7f8esor3906592f8f.2.2024.11.04.08.58.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 08:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nflr6a4Q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730739501; x=1731344301; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m0o2RgKkHP9t1oVMWCUj0yrb8kc+cMF2/vR0PNGAOy4=;
        b=Nflr6a4Q8rBgGsAisxTClCQdjRBQYPHqvDVMDQY/s1Nsthred3i9x1++z9xysV3wfH
         Mzh9HzK2OOWJ2CHHMwQTG/RHEezPU4GLtA0Nxr46lWB+WbJ3VDnMKSIL3cSYVugQ2Uqq
         mj43xrcoXdutjUQ9AO0BEsv64+RyZ2hkDFgbcb/iD+GuP+QhzN3HtfEntoLbKu1lx0cB
         NQxJYilF6lqudlV0On6eRqpebILjBZ7fs6PZhc24epzo+kF0LG5pgvChy2qgAC9deAaK
         kp9hJSifaqkWqP7Oq+GjOQxko3xY5JESRmBdIx6+wwkOXo7NL6iPaUCagytKBaKbBwfR
         poXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739501; x=1731344301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0o2RgKkHP9t1oVMWCUj0yrb8kc+cMF2/vR0PNGAOy4=;
        b=XBX5M0enMLhFo4bFQUSVFyBbjhT3Do5GP53imjt5mcitsDbq5cGohXroYBMCBefRtZ
         SqKMDsBs3QEqulhHsn/OWlWzvkH1RLqAkyfkoNerO/4wdM5eciVioFHPU0gnbbb48snk
         3GDtDAR5nHesN1pxOjaUWJL3s0jvieUJunb+tYRNeSZuFFL1p2Seag8gU60OZidtuUlg
         KXAiLrYZ6bxfuvNW5kPTfFCw8e/mBgeScmQ2B3vNC/7Qg9hQdHQrkGnX2c/wlBIljURd
         TTZyyR8/INuJTkLUslzWtBT2E9I9T4K+8vlrc/KGFeFfqujNUmo92PBMTlGqstVtdXAv
         fLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD1RY0fiGaJMOt4WaBNtBl8ZrUSJYLLCQFTGB/1x2uty9UPb4aY0QAUk0zsdVHlO5iRTXncD6fvlt+RA==@linaro.org
X-Gm-Message-State: AOJu0YxNfflFDoBG8veR3ZbLkP9UGVeF4IcPw3DAWsmqV/l6tvMWAlIU
	0UG1h2XBSfdbigGdpdUlcltyTPgkAYMiYI9MKJYCaVyZx8+7eWoSwyK8IY2xzYPyF1qBW4ZRcfj
	AP4DM3MYxynG8tKFSI089FiHnTayxzZE6woLV65CCuWCEWRHIwBs=
X-Google-Smtp-Source: AGHT+IHlfbypLypjDRbkkufLGEWuzBXtPvG95UdaIRb7uMNRkLJ7lPcNZa3L/SUhBsFDrRudH6xZAFIYXSNCpA65k5Y=
X-Received: by 2002:a05:6000:4027:b0:37d:4ebe:1646 with SMTP id
 ffacd0b85a97d-381c7ac74d2mr10870950f8f.48.1730739500855; Mon, 04 Nov 2024
 08:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20241104142606.941638-1-gustavo.romero@linaro.org>
In-Reply-To: <20241104142606.941638-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 16:58:09 +0000
Message-ID: <CAFEAcA85mXoskBCnackKpMAe936qGHwdkSpSRsOBespzeAFBjw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Enable FEAT_CMOW for -cpu max
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
	richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: L0gT45oCrelr

On Mon, 4 Nov 2024 at 14:26, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> FEAT_CMOW introduces support for controlling cache maintenance
> instructions executed in EL0/1 and is mandatory from Armv8.8.
>
> On real hardware, the main use for this feature is to prevent processes
> from invalidating or flushing cache lines for addresses they only have
> read permission, which can impact the performance of other processes.
>
> QEMU implements all cache instructions as NOPs, and, according to rule
> [1], which states that generating any Permission fault when a cache
> instruction is implemented as a NOP is implementation-defined, no
> Permission fault is generated for any cache instruction when it lacks
> read and write permissions.
>
> QEMU does not model any cache topology, so the PoU and PoC are before
> any cache, and rules [2] apply. These rules state that generating any
> MMU fault for cache instructions in this topology is also
> implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
> MMU faults either, instead, we only advertise it in the feature
> register.
>
> [1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
> [2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

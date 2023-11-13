Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1477654ejc;
        Mon, 13 Nov 2023 09:04:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNS6kSOmT8XmhjBnejZqDZCIjfhRUEOOaeFVsbWvVTDfPXiWGp3OhQEYq2KEt7Y+ANcHn7
X-Received: by 2002:a67:a647:0:b0:452:618b:13e3 with SMTP id r7-20020a67a647000000b00452618b13e3mr52709vsh.9.1699895079456;
        Mon, 13 Nov 2023 09:04:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699895079; cv=none;
        d=google.com; s=arc-20160816;
        b=cTwZN5vwIHApwEgV2HnrOgdJvKuNVQksboqLe8XnDsJDuPqTxg7tkq30hCCGAfZBxO
         m7ycQXhvXxpwfKIwV163V6Lh/jCeF6ucTeeyEUtgiN9XzdhMhn0ydt+/yuMkZbHPGDdY
         0G/4rzYoMhpMyzphyPFG7T/vvD20Z5ibz6rZlhn0FOd501BLrTJ8KARnorbDV+4HxTs7
         9NHh+Yt9KlpR2un4WMJ8wfJE/wKan0FTLuS/nx66I5I2FXQIUsvs8nD5PagE8zBSnjaS
         AvoN0d8FqVUV7NEVrLZThySNgocPHGfWNAdxifNuDXvFCnbxYg244e6yEuGRPYAOnfUL
         AbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tXoTXFWOeQYOegr331Fli9ECx2LaIgBkkd5shOsuOag=;
        fh=bfwl0cLRt6i4pfJCs5PuomPHcsZftWIiDFLyF6BvuGU=;
        b=t9rIRcs6jH1brfV/1mJplw/dtxMN2vamDxCqep5CFiYV7uKf+wZZFSX0QMBOT+u3i4
         YGpFOYDs5IpOLl6wHPyUwfjtMfBxTbhtUKoS2SDOtq7eg3cYKmoFtPEkU51OFkw9HOcN
         ChXYgFaC6T/CGfdMomhMvUzE7U9XndkM0Z12+TLjMzrmY86Jc3nxZVVFyCNrWoFoKZtc
         HZxRXc4CeFjCUv2D8LnN/LePhvF38eD7o7qTK1Bci9WT6IvNIcClB9HNQ6CCh0CswOAO
         uaBPjMxvcMoxne12+M7KzP6LxUzPoo8ABj+FrI5V9n6mafnPvpbBq1FlJRXR1xG6I2lH
         xyAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfRueeFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk14-20020a056102190e00b0045281c73fa9si526116vsb.818.2023.11.13.09.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 09:04:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfRueeFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2aMO-0007fr-Dk; Mon, 13 Nov 2023 12:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r2aML-0007f5-NN
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 12:04:25 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r2aMG-0004PS-Ci
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 12:04:25 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso7115409a12.1
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 09:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699895057; x=1700499857; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tXoTXFWOeQYOegr331Fli9ECx2LaIgBkkd5shOsuOag=;
 b=mfRueeFA/TIBNaXsiQ1+Eflvl6fV2lJcjr4OknZ7kUHCsw9q5B8HlFTTv+x+U3sinb
 SgFpgocCIT2ZozG+3QR3qe1DSRU0NWZS9aiyBKXw6UeXrLI/Q1ZF0YehyCKTxeMzGIKj
 iEzRX2z7hA0agfT8bOA1wAME0BGC9fnsXLI9JN8EfPB/8q3fDk0JrBMKvojXSAOqXsfq
 izeHikygA88Okss7izV+ZuUiaSAfU3JsohniKXNak4TpJ7S8adF2dTAt0eM7Q+ssfiHY
 35QMFDcv/BwLC1orthLuPwWKQieUuL6iFKvOLgyGtRW8++1g9TEbznMX9/L6Zna5GHgY
 5Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699895057; x=1700499857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXoTXFWOeQYOegr331Fli9ECx2LaIgBkkd5shOsuOag=;
 b=pRhGxb4MlV5C3eJr1ZrSeajqHViYfiUbUfGaMcqdJ+hICAAeLn0mixLG3neCxP9jLV
 yqI3L5S3gArsfjOCu5XNfSVnIMyYUap7XgJ8mhaq9p1pgOV3dNNPpSEwq36l/+HTwOc+
 Pru4knJxn8ZFJHthsE1hvP3ylXzeYtH/nBajEY915wb497D3zpB1UnWtsBEd1du0iDGT
 WQdKHXP6IPMSZEjQs6+w3Z3y8DsUpHjZft4eZMNOHRj2lxiP1I5eXXOTsa6WXFjcfD1/
 yytX60d5PHcf1va/Jez4XIyGXpiRedLWjJKYPaFjCxmizSjAIdiabXIm3v47/Gq1CmZe
 ApmA==
X-Gm-Message-State: AOJu0YyxA4AMhC9PlByHvMDPHX3ZJ8j090GUbTIm++onY26ZzrUHnrQ8
 sZbxc+yXEXZBHD2ZhLcZXF04OyBEy7TLANkIuYRfww==
X-Received: by 2002:a05:6402:1052:b0:543:52be:e6ad with SMTP id
 e18-20020a056402105200b0054352bee6admr5217435edu.5.1699895057359; Mon, 13 Nov
 2023 09:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20231112165658.2335-1-n.ostrenkov@gmail.com>
In-Reply-To: <20231112165658.2335-1-n.ostrenkov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2023 17:04:06 +0000
Message-ID: <CAFEAcA_qmKctYajg2fXSd0GU0YtD_HBPGq5_BzdDDj0aLw1J9g@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm/tcg: enable pmu feature for cortex a9
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 07sYmjbVqozV

On Sun, 12 Nov 2023 at 16:57, Nikita Ostrenkov <n.ostrenkov@gmail.com> wrote:
>
> According to the technical reference manual Cortex A9 like Cortex A7 and Cortex A15 has Perfomance Unit Monitor (PMU)
> https://developer.arm.com/documentation/100511/0401/performance-monitoring-unit/about-the-performance-monitoring-unit
>
> Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> ---
>  target/arm/tcg/cpu32.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 0d5d8e307d..0008c3f890 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -418,6 +418,7 @@ static void cortex_a9_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>      /*
>       * Note that A9 supports the MP extensions even for
>       * A9UP and single-core A9MP (which are both different

Thanks for this patch.

There definitely seem to be some weirdnesses in our PMU emulation
for older CPUs like the A9. In particular we define the registers
in v7_cp_reginfo[], so you get them on all v7 cores, even if
ARM_FEATURE_PMU is turned off; they just don't actually do anything.
This seems to affect the cortex-a8 and cortex-a9; everything
newer defines ARM_FEATURE_PMU. We really ought to have the PMU
registers separated out and only defined for ARM_FEATURE_PMU CPUs.
(Annoyingly, we can't drop ARM_FEATURE_PMU and look at ID_DFR0
instead, because the A8 and A9 have a PMU but don't advertise
it in ID_DFR0, because they predate the PMUv2 standardization
of the ID_DFR0 field for that.)

The other thing here is that these CPUs are older versions
of the PMU, so strictly we ought to check whether they
have deviations from the registers we define. But since
we're already defining all those registers anyway, it seems
safe enough to let them actually work.

I've applied this to target-arm.next, with an update to also
set ARM_FEATURE_PMU for the Cortex-A8, since that was the
only other CPU in this odd "PMU registers present but not
really working" state.

thanks
-- PMM

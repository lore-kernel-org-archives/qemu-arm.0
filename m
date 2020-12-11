Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp147413lfq;
        Fri, 11 Dec 2020 06:47:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/KyNPVlA4i8Agb/JNyBsdJ5/vCEFgG3aLojU8QDCo3aFcgbSMu/v6n+hCKH9d6ZKHMWrw
X-Received: by 2002:a25:c786:: with SMTP id w128mr18907116ybe.322.1607698039344;
        Fri, 11 Dec 2020 06:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607698039; cv=none;
        d=google.com; s=arc-20160816;
        b=XNlWodtCAtKx8o7B9wKfJfI+BnwDEUMOfTesbvptv2EMJm3tm3ZnC+2OJvV66M/cZv
         qJntb6Mm8sPTfFF932i6Nf4bZa0cMvL1LqLAt8mR7dAR+x9YorZnstAD69LwsgMDYx9j
         H6WVRCyzKmeRJTtxUI/wY2dRmCeSteK3nN6AFxXyamtld/IZVQqBSCNxz6Vn+IrKgwfL
         biKkAXuMUThEbQxWgW/ypckrZmt3YHNbhEH5r3LA2or2D99h8nYrmDFPw1hXzRyVdIa8
         VDUj5ZDy4/RF03yWoIgV2nfpKFvdD5UUlHehufjxftMpzG5/n263QEX9x0IvxeIHTPYe
         9rEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E/QXE6Dp1WojnzptChsobRJCnxriTuOC+w+XlEAsmAY=;
        b=ib5ukHHaQugyes08GC3YGJ/iZigflgYKSaHSCCChmkk0j1NWH2JCOkKGt8XE0PPjC6
         p9AKHjE9lg3h5XhoL2dymJkPQJev08it92tIHu8p+DI+/ZVHQVeSLrUWi8AQgtyQMV2H
         sQuiTwGyDnlCfj9XFOtH6O+hxUvyt72VTHNimA9U03nhwY17sipbbck49ZRtbqN1oZGj
         nAYQXqfH6WOmVnk35fLUyUHqq5itki54KwMtMnixVxwFclculjfdS4XKX8Ur2bUelbDf
         W1ruf3RTuPE1YOmZhX0k/wc9hQLVVrhYFP8XVTZsGL8EZEBAQrVbZplRSkl4R8qa5tjl
         tRwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UF5rb05p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o138si6826407yba.85.2020.12.11.06.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 06:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UF5rb05p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knjhW-000479-OH
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 09:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjgY-0003TO-8y
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 09:46:25 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:45619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjgO-0000Ra-Pe
 for qemu-arm@nongnu.org; Fri, 11 Dec 2020 09:46:18 -0500
Received: by mail-ej1-x643.google.com with SMTP id qw4so12637885ejb.12
 for <qemu-arm@nongnu.org>; Fri, 11 Dec 2020 06:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/QXE6Dp1WojnzptChsobRJCnxriTuOC+w+XlEAsmAY=;
 b=UF5rb05pnbPzZEOULtgIEga/Yj4F1nH8uNy8Hd6yvJvKh8+BM7KSIHtnYAAO4fc1Nn
 KPUzDpktHDrxWXlGOwDvISN9OMsT1uJ1zAu2QI4Z/YrpACAW9NYy4dsfDRLGjm1YBtSL
 5K2683tn6yoyf45gP+hVDNyMg1Mp1udV6U5txzoM3cLquK1AGxg3xgsEdLe1y4FwCftg
 Nxwafyr3ZUB4p0Ao9O2Rw1GZqUZICvQzH649dQ/k7SLLyJmtdgTyaLT72ka3hqwn7HsC
 di8yg5tOYjFG1OS7YTVHd9V+IMs0S9GbnXGk2ERXbyWDiipVQd1QKnm1uBmnuVItWz1I
 LiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/QXE6Dp1WojnzptChsobRJCnxriTuOC+w+XlEAsmAY=;
 b=oIurR/mYjKZUJyinMHR8ymltP9WmRpMpUmwhuKmpDtcJwrGHuA73Y3C4dhp//3zjN8
 nd4fKejGxavn6KzXf5z2Seh5VdLDW+cVrHZfQLpq69klTMxvjHoyz+/DU6opGS2Rmhh7
 q6dfCe2p0naQeKgGnsTicWGIJ2oKLDe1ZMhPm4ucjQL//yOmsA2lLq3d/6T5IyjH0IlX
 M82YabKs5suVEsCbdaeVl7Bif+hPlrqzRsZJhQDDAuVFcrOaBWtlL9MYi52MqsNnVXRw
 NeZ60vVd5xPPtAkVD51QLoskX3klA15fwp9/emzDmuDANNtz9FqWU4RXb1Nu2LWgizcB
 MUwQ==
X-Gm-Message-State: AOAM531oIOp1jW9A9NB0vHvxeDljZFtZRN2umJh++1/PXrT7y2FCrCeU
 2VOKE5intsXkG/pAAbsyDzi0dzTMxg+qJe8oQna5oA==
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11518565eja.250.1607697966268; 
 Fri, 11 Dec 2020 06:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-4-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-4-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:45:55 +0000
Message-ID: <CAFEAcA-vT4eAxn7K=ULu7wGomfW7akEG=eSVGp4j7CSKtksuHg@mail.gmail.com>
Subject: Re: [PATCH 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ghQquvcIh/cj

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b54d1dc092..5e9e8061f7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1713,6 +1713,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
>  /*
>   * System register ID fields.
>   */
> +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> +FIELD(CLIDR_EL1, LOC, 24, 3)
> +FIELD(CLIDR_EL1, LOUU, 27, 3)
> +FIELD(CLIDR_EL1, ICB, 30, 3)
> +
> +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 20)

The ASSOCIATIVITY field is bits [23:3], so it's
21 bits long, not 20, right ?


> +FIELD(CCSIDR_EL1, NUMSETS, 32, 23)

Similarly, NUMSETS is [55:32] so 24 bits long.

> +
> +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> +FIELD(CTR_EL0,  L1IP, 14, 2)
> +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> +FIELD(CTR_EL0,  ERG, 20, 4)
> +FIELD(CTR_EL0,  CWG, 24, 4)
> +FIELD(CTR_EL0,  IDC, 28, 1)
> +FIELD(CTR_EL0,  DIC, 29, 1)
> +
>  FIELD(MIDR_EL1, REVISION, 0, 4)
>  FIELD(MIDR_EL1, PARTNUM, 4, 12)
>  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)

Any reason not to define the other fields here?
FIELD(MIDR_EL1, VARIANT, 20, 4)
FIELD(MIDR_EL1, IMPLEMENTER, 24, 8)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp582883lfk;
        Thu, 21 Apr 2022 12:14:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyNFca3eK6wd1bdkfZJZGzzcQYuWzP4bO8SC/qm4Z3WZLOorGULki8erDpJZ4ehyHcjxvl
X-Received: by 2002:a0d:d64c:0:b0:2f1:9710:bb97 with SMTP id y73-20020a0dd64c000000b002f19710bb97mr1312802ywd.462.1650568475682;
        Thu, 21 Apr 2022 12:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650568475; cv=none;
        d=google.com; s=arc-20160816;
        b=xfojRUoSllT262iYDCNBN3nswYEsp+S3VjAW6Nsd0E0E6bseuZcwh2G7LxBjmp02+y
         IpXE/11QC1ODKWC53VS7YxktLqlj1LVY5SupUjfqiyTMVDzhEUP0YAcrMqXqJijXmwz2
         nh/wxPXzqhLQ4HqxigqXiDRLPelZ0Uffq8tOwALg3xmKkUpCK1KPTh9Shcjw3ORUd68i
         0Nae5dPYPufoToD4ja8y5dWORqf6fjTebW+kjsHdUiuYxU9itboB9fRJG3jD6AQEZkeu
         vOhxfkklDXUlsLMdseUPEq+d20viRhJlm9ErbebK87kUzqGPON/1OdWenNdVIhAyGoQ8
         EVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UIbk2iEknwImbrFKa751tmOo233l5Qv0Kice8GI1KKg=;
        b=H84rLmETx/N6sr3gUums7zPboksSXS/gpMlfDeucaa3ej7oGye76RaislRlMkAhA46
         0vaZtsl10A+g/YOajQU4Jn5J/3+c3xnlPkbh8/dnSsRYv9YY/Day4NN/yjmw25iuXAkE
         vPLTAtDf9JyN0TlWFzbW1olTnCfnjNs9OaMTn9w5w1eYiDI5U/rFssQ0Gok3SqFyAZee
         NjxbAZAxJ+Jp2LJCz5rtjwk1ap5njYiQHPr9jV26DJ5TkyxtD8rx+pBU1++g7n82m0Ll
         klsi5PslSJF7kjKomjBcnqbO8dPwa++mskxxNmEM1iORW1nwawc1DSvY/7uYdUAp9TU4
         i+sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tKPdidH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s96-20020a25aa69000000b0063dbe1bb12bsi3575279ybi.158.2022.04.21.12.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tKPdidH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhcGB-0004Io-2d
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcFx-0004B6-Qg
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:14:21 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcFv-0002so-HY
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:14:20 -0400
Received: by mail-yb1-xb33.google.com with SMTP id b26so4834857ybj.13
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UIbk2iEknwImbrFKa751tmOo233l5Qv0Kice8GI1KKg=;
 b=tKPdidH+ehHvzdWZpPkNOkL//s08JDKlW/G2XImv5LMcbQaJEHK2SvNoaw9lzXROuM
 bN5dFTuRnUCle7WppiYIp5vmuHOSQsg3ZKRhxlQEXXI8ukaqzmxPBPAFdC+RA+KjUA58
 s1oEo2eUv2w7C2Jx467Rk2FqWVk5g/swNl0oJAirwnsJO48ci4pxmLIKivZOmPE/dBkF
 zSg7/yWhO7zUnYY0QTz7BX/31yMg041K9P3VTGDOi+jAB72QCvCGCY3EI1TsdSQjgBUg
 hTqqcilwJ0g87u8ftutv5W1q4klJOJAmtLpgR4EfAm1EPwcTzwjb73KvvKka/WkeI3qo
 ZmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIbk2iEknwImbrFKa751tmOo233l5Qv0Kice8GI1KKg=;
 b=UkUgc70qpsBiusUzknG+cIzc8eqsAyJEEihSzAMryXERY05yuhG5Mbh0C9hNuqOtLW
 5MmDUlnXXvSgEYrD0CpeboEf32obVtLdgTkdijteVgsD7sd5CYvxpSSIiESCqru5HJV8
 J/fdcbabok1jc/YijvlQreM63gqIzGoj4WulV9UxldSXDlajLdrwQ46T4KRi+Do2/zrD
 4lHRnEfWOQOM6YWFIkdWy4OZC6T/GQOP1VBj6cvqNBiAtGKHRGQsamykDMuHqAdfjb3l
 gTn4ytpUnIX4cqRQuQI+GMCRSCy6XTIJQ0rPrQ+wbUdCCNCrI99fr+YHE1DtDLUix8Oy
 AbWg==
X-Gm-Message-State: AOAM5316PvfJSyV3gApfvRlkw6gnu4OVAJZLdP1beFWvx4rSWLh07Vxi
 ykAkCehyol8C/kvucH3X8Gcke+R7Vl397OIBv8KLBkF07Iw=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1225496ybq.67.1650568457414; Thu, 21 Apr
 2022 12:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-25-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:14:06 +0100
Message-ID: <CAFEAcA9B9Rh-VG=yGVVXZOgY3_Lo6yt2MMHv1yPGqofxhwPsgA@mail.gmail.com>
Subject: Re: [PATCH v3 24/60] target/arm: Split out cpregs.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /aookv4/IqXr

On Sun, 17 Apr 2022 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move ARMCPRegInfo and all related declarations to a new
> internal header, out of the public cpu.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +#ifndef TARGET_ARM_CPREGS_H
> +#define TARGET_ARM_CPREGS_H 1

Our usual style doesn't have the "1" on these include-guard defines.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

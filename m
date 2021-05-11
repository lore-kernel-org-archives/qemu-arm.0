Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3956043lfg;
        Tue, 11 May 2021 06:00:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdNcLEME13MIDPfOlk1sAtSm1lyBdCNoPcUSiXiPF40urQUImm4un3rpYRxGm7ZWzSGJGz
X-Received: by 2002:a05:6602:27c2:: with SMTP id l2mr22035735ios.71.1620738012074;
        Tue, 11 May 2021 06:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620738012; cv=none;
        d=google.com; s=arc-20160816;
        b=hWj08egajr21qfuKg/3pXOuFMIpVPJXPX7DNJrQmURrrilyBKjiMMQfFxbriJe5EDX
         S1CY8N4eztUAw6IjdDTiCWAgkwuLxb+HKv+oDhfUpJqzaXktjLYLTCVvP5lLfWASF8qZ
         3cbo99CeNw6x2Zh7vDFh3LcTui6ybV5uuqA1o7q/86HdlKpKo0SAPSrZduW3pWBrdbf6
         69VESHjdYN5PsXXjZ5jrceA0WMlYaPMbykfE7+BL+g5QVhYMKmv8qi5fRToy9iunazVk
         gptyC0EZKHpCINOelTBc7bbJr6VftF8BvqmANSLLYG6P2ZnicCbo+UXtLuKB2xiIwYeP
         OHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rR8Hl1WyGAI1IyS5+ncTXn0IsHjUc9V0xXJ3i+mxI0g=;
        b=q3L2APEu9v/WXCRDKRq4KNA3UW1fs5mCkLTiOEVjVaISI3K/Cuid3pKZ9cjFxbs+FR
         RitGOsL9Nz7aiMpqxi1iGYMe5NX5ymKiMYlb1csLQntFOeJ2TVRB2+czaHw/V7z3RYuK
         JIetm4vfaiipxniSL7xucyhN6zIdbtrybRegLDcY2Gjl9YeYT13/EHDxme+M0yrhgxLK
         pWdoI72DU4vG376Ruuurg7/HQH1LzHL4Pfyv6Zl9dTdxVXFY+P9TzNz/qWaTNVxYG9cK
         hneBXrmUYZd+pdp0y/tsyGL+lboDcPlS6a84VTKKS8Br6VXglY7bHiYQ13suIG5EcvtR
         r2hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lW1AvSU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si20708763jak.61.2021.05.11.06.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 06:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lW1AvSU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgRzf-0006lJ-A8
	for alex.bennee@linaro.org; Tue, 11 May 2021 09:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRzQ-0006km-K6
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:59:56 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgRzK-0000Hu-G0
 for qemu-arm@nongnu.org; Tue, 11 May 2021 08:59:56 -0400
Received: by mail-ej1-x632.google.com with SMTP id b25so29575328eju.5
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rR8Hl1WyGAI1IyS5+ncTXn0IsHjUc9V0xXJ3i+mxI0g=;
 b=lW1AvSU6aWqqbkG9++ORgVMQxKnvpnyxXKuNGdFpmCfrRtFGFn3tK9LaSBfPf300KP
 EhZV92rlIFxYNMbxabohkzwlUI1l8Wi2VXmbfmf8ezboz2E5d44fgI+zwyE9gGBF9Ucl
 fZGE/OMC1gYEheDZ7sN/T0FwgBIvGH8B+Hl76Hgw/mLmWYfVcviKVz0ctXrhMsn3Kjzq
 lo2WXGaXJcRR80Y/t72NkaZD25JMBq1y9v03skFMCGDUFaUrFNeR1E843Y4nQq5P8Y4B
 PxeoeFD3DLYqXtZSAHS3NcHYJQAX/FjHXNdwArcfbcYzABnXaTR3VDw5yys05639fs0P
 WOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rR8Hl1WyGAI1IyS5+ncTXn0IsHjUc9V0xXJ3i+mxI0g=;
 b=D1EnUaSXFlHcDMtt2umCxhaLSc6OU1ngcsWCnCaYeo48g6Jap/eWSocQxg343vElQt
 rUPGNKo6ryTH3wbeeB9qm6Fqy3+9AlDOSD/6i0xcYDYe4XnamA66mPj/sFHFqB4SWg23
 ZHrw40UChXuc5UN16xaIN/Zwe+fVZ9HnUSm77oandFu5RTyi+2h1mUcYjPMBL2C1E+ck
 96GCBMXGmG7xCz7rvxsWvs0fvWnnj2YpMfYRFyS94w0CXwky4atOo+48XAPBIH8V237F
 pgKn1MC7chzEw0hd4it149XHmrDQNBAmU6rKyPf6cjm8W2WpVtXGVBRm+ZO0f+u6mX7L
 f8qA==
X-Gm-Message-State: AOAM530QFxmO1UESsDUh0FucW2YNOKUfKkI9R8qxfs0ZU/Im2W9fJqqP
 du6uGBe1dkvaU+QH6ok9XlXm9bwIj+l/2NgE9H3Lvg==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr2119382ejb.482.1620737988822; 
 Tue, 11 May 2021 05:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-18-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:58:36 +0100
Message-ID: <CAFEAcA9g8y4QvObcNwaO7p0bmOtJw_BvDb5AHU2WUenZANfkKQ@mail.gmail.com>
Subject: Re: [PATCH v6 17/82] target/arm: Implement SVE2 bitwise permute
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3H/ubrLTZ8Q

On Fri, 30 Apr 2021 at 21:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++
>  target/arm/helper-sve.h    | 15 ++++++++
>  target/arm/sve.decode      |  6 ++++
>  target/arm/sve_helper.c    | 73 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 36 +++++++++++++++++++
>  5 files changed, 135 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

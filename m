Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1698142lfu;
        Thu, 28 Apr 2022 05:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoE2C2vfi9Izp5SEAEs3/f1KPjzjnICRu1bNO7kUJV+gwDYFLzqXJ1tBYS7Jk9PJaCRgFZ
X-Received: by 2002:a05:620a:4015:b0:69f:6146:f969 with SMTP id h21-20020a05620a401500b0069f6146f969mr10849867qko.27.1651149617251;
        Thu, 28 Apr 2022 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651149617; cv=none;
        d=google.com; s=arc-20160816;
        b=rWIVdAXAksLhsV2+QHydGtJLWl7M3/I2L32+p08N14PmfJpGNetZNFFmSk8mGSPinK
         R2jCdRhkwsDaLxslOdELZJqRweFBJfWFGdKcvzrBZnBrbh1mEjYJTvUUCz7v1Zjut3NI
         I8EVNeFaseZIAdBNPgwzeY8fT06K66offX6B3oOw+rWRgmzYqUVDxb1CdzYK89VWiAJg
         XjRgaAxdD3xJq55huIEb+b2Xhi/O6i3xsdMOg+Jph+Yx84viDL+1i0ge6NYamhwm9Vxu
         gxRq+mgqLJlB4tx+59IEvIiwW/FQOnyqOMtjgZn1r4MLjgFpXUdExbUgVkJbPqQCARYH
         qVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ogXsQ7bY9F8CqLkBBE5fpcRXjKSXSwqik/FtxhMKb/E=;
        b=F9IM/06urm73eNDyjX/EFo9pYDVicMA70cV3FL/T34AW3gpgHqDYr+FUjMtTrqTVbY
         yKodOEJtwFZUJqaC4WcmSPCdWvK+d4WJaUsEVPDtaduJoM2phuttnztSwn6REKoqq4CW
         /LIPBoxSYPMzG5uCCA/Si0R3/fM8Wiw0yrkyeHuMYvntmr9YegXSbjrHtB13SzQvmN0T
         N9wAOEvE1+1a84idfFtuiZsgZx+1y3Bpjfw48BjCG/XDYZr8rpZMOc7ZKaq8/rYuyXAU
         iBAXK6L+8Kg20bOk1I96vb+aSDZN4MTbJVezaQ9fP4O/7wJz48OQljJY3lJtgV6BC0Hx
         tb6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yc4wd9/X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a0cb444000000b004522bbefd30si1434458qvf.40.2022.04.28.05.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 05:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yc4wd9/X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk3RQ-0007LT-K9
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 08:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Pu-0007LK-SN
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:38:42 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Ps-00072P-M5
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 08:38:42 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f7d621d1caso51042817b3.11
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogXsQ7bY9F8CqLkBBE5fpcRXjKSXSwqik/FtxhMKb/E=;
 b=yc4wd9/XBreD43OgXVpF/RUV4kXXj14uavBAs2yQcGejRTfJvb6uQqaRd8euuCk55L
 7baK9WB5cER9DaYFiIZnPVPGaRE/qi4uKmiMbDKJ1YVH+Js27Thnuc+Vq8byE4AC/pqh
 drgy8XzsyxqIF3hzN16nkev0KRyIbpQ31WkPyOO4s9bvkoNDrql1ish63fedux4DAanL
 gabu4Fgf97gJT80Q0eHD8MCoiaJzEkSzSxv5LrMdLZBZSH7eET6UJFUBL3/tEivJFj++
 2TWSe5iJeTcQMQi/paEB8Zwdovd55L/rDq5ZEKNLKgY9PHH1IiyEP3bPqau5VSFBOww2
 wXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogXsQ7bY9F8CqLkBBE5fpcRXjKSXSwqik/FtxhMKb/E=;
 b=SseooSIJx+gda1o2uxQ/Ovz7FVEOAtbSIJml3Jd6jNny1v6hugMhl6jy10aqhapIPn
 HatwRKmdTl46Yw6oCkdCW1AhkO8YK2NLrUPNzP11kM5glve1ss2DMh9QSXQ7tfeiHEDe
 Q3/n9aPxvkV7CUaDn/heJS3p2YVpguqewuNduTs/PL79QHxOg4IPAa2ibZHNSmIhpBv4
 HlXosdD9i/hSuwaGmsTYS1hx1PCM14wZHbcyJhpMQFxFBuboMwBhHg/6uGnseVWLeFgt
 L+K8jXp9gnW5UD8tXYjCrS2u8r0uEl6CPmbdhq62NP0VwiJm7XW6xl+khHT2ChtudflK
 xXsw==
X-Gm-Message-State: AOAM530tsE78GwnqxBjr0f/8q9fxmIij2PL6sjDDLHImSJV58kdRYzMp
 2ugWf2VW6JAHBUn2gJWFl0HBLkfQZOerVn5ziq56NA==
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr32596776ywt.10.1651149519016; Thu, 28
 Apr 2022 05:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:38:27 +0100
Message-ID: <CAFEAcA_BSgOoXuaTCEv6XNUPNJeThG3X-PJDp3WrT9Fv3R51ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/47] target/arm: Use tcg_constant
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l/l8MeX9P3Hm

On Tue, 26 Apr 2022 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split the tcg_constant patches out of my larger v3 cleanups
> patch set, and then split the 5 patches into tiny bites.

Since there was only one issue with this patchset (in patch 17),
I'm going to fix that and apply this series to target-arm.next.

thanks
-- PMM

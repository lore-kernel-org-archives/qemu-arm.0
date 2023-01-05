Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp248734ejb;
        Thu, 5 Jan 2023 04:00:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLL6JLyYa9w3g5GDQDFNA+BpXPpIDnXsz76l2c/VsTU10B7inQjO6mLLeMUI3n4gVcwVoV
X-Received: by 2002:a05:622a:2605:b0:3ab:a1cf:b2ca with SMTP id ci5-20020a05622a260500b003aba1cfb2camr41178434qtb.27.1672920032726;
        Thu, 05 Jan 2023 04:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920032; cv=none;
        d=google.com; s=arc-20160816;
        b=BBtskyfw1G4Qlh9TM3RqO8fEQIMBwAJ99FYjXd09M5Tl+MtpsaeI7aXHkY/OuB0UQI
         yFp3K01flUKjWIYQ5Y3zC1txpiBnb3XgCUPWCxlYD8d/lpY0aL0PzGdP81KImDSZmxgT
         32PYuoBslIBwttgRfjHcnzw+qjxfZtVTOYO55z3gjPqfYNQZe+JHED8f21EfZAVR7aoI
         Y9J4cpGTdDD9kSzN01mFY3EBJawTDlaMlWhNlWbHftWUkGsLIB2gfDaPl7zVJr4giZ07
         KOtakiIL1FEcVKBIaVJaHUW76VlFQiEpjlLFmGRDXwvbSaJYL7XsfmtwD3fsf2gU6BGr
         HFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ORbf2A5Lj8jTXQAHE9kwkO8J1Lc6ISermkRtv19XiXw=;
        b=pA9doTmwHYBkgRPCzhqcR0tb4Pi8L5jqgKjXVaw2j45h2Pbz0OcJfWikq8YsbIQugA
         qLfK9uhVGu3Yqwz3HdH+GkE1SxhArtAmRrvJ3BqJ91NIQ442P+mIRMjn8B+lVBax7rnh
         LPsDm/Uhj605H+jQpTiHwsOfXoajppPgdHD+lAsrtzePz+zcGY7YRRW7Ze372M2Bhos5
         xSNrg1IzRgK7PX0t6W9OvGv2kC/QzzY7KsHs57y2nxKLXvJ0mRFIDUaHT3Wfq5hgzQ9D
         kfB11QYAE4r69k2wtluVUB3ylnVlAQPPDf6pIwnJArwy78edBhlqeiCl5X5cWXW9wQjL
         tJdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k33J116r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv8-20020a05622a0a0800b003ab810b8aa3si17931437qtb.426.2023.01.05.04.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k33J116r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDOv7-0007v3-BF; Thu, 05 Jan 2023 07:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOv3-0007qV-TO
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:00:26 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOv2-00009w-Bl
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:00:25 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso1808265pjf.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ORbf2A5Lj8jTXQAHE9kwkO8J1Lc6ISermkRtv19XiXw=;
 b=k33J116rOillFONm/UJWXAMZs+JDXMN67o46WekgBkmAq7w3a00CAtVRehwkA5PO4f
 3T3RxmzqesXdHJ78CaYYCSCmpTuScQrqvqoxd6tLN+dgbKEC56IwEWeqSqnGQ5FhoHTm
 a8pUlJjLHZhHRQpTzBl8zN5Lf77jXhs1x6HKLKasZ8OF6APFiKUWuRMoXqJQ34neDGNE
 4Bb059sQmR3PuPdNYURkPKoHTUaS1gbREGJKWq7siGKYcCmKZ9U1ciy7ux45hVOxnjAy
 dT+rofM2yXaMmeCSHUQlymOEesbctcYc9llbFoKtvTtnycdv51lPN4ulgBkb7upk39/x
 oK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORbf2A5Lj8jTXQAHE9kwkO8J1Lc6ISermkRtv19XiXw=;
 b=3bEM/Z87Qa3ZPLvf6R1uQiEaKXxqtDJ9wHqQEk6nfb9csHGZKMGafl61VDnQjSMMjL
 3UQIvEaiS2KfPBRHyPPMfx8T8ulSrGUoae3AHg/pj+QZJQv0Z9CCzVCwt1GLesZD2c8A
 tmcp+1qcJC1V4fI8Oamp7r9pQ9+J1Pxc/Ec6fvfsVyTmazNTkedl9jEhENCoSVryzqM0
 MUZuXACHntACegabZh7CleEC8vRH+NXj+JYx0pn0ca3Llj0rYPcMWsj+xMdzshbTm0Iz
 UeLjHSQF8XjUqwLoJCT4tEnKm0/XJQoL4Hs7iKLcoyrt3XhHsWxslLdM1N/R4rW7/mAG
 uhIQ==
X-Gm-Message-State: AFqh2kpkGmQ30Cy7kZz3dRpf6iJ8lyaxDBMoqqn/p80PvtJ/u051Xjr2
 iLSPROiJkVMMPEBI3uc3U12QMxeTYgmGr2UeVSAtCQ==
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr440185plb.19.1672920022646; Thu, 05
 Jan 2023 04:00:22 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-1@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-1@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:00:11 +0000
Message-ID: <CAFEAcA-4GJPHbcsWnY3Apqx8-Jix2yO=cY0DPQHduhpgqsO2ZA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 1/8] hw/timer/imx_epit: improve comments
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +bBN62s7jt/N

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Fix typos, add background information
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

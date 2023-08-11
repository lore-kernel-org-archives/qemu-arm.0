Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1322471ejc;
        Fri, 11 Aug 2023 05:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV+Jqm+XlPz/YRjxb189KRsBMzugHYxf+oIhQ2r6QNVc/Vs+kms5oqnHYONYIXDSEQ6t52
X-Received: by 2002:a05:620a:b0a:b0:76c:a985:1d0b with SMTP id t10-20020a05620a0b0a00b0076ca9851d0bmr1619437qkg.44.1691756041743;
        Fri, 11 Aug 2023 05:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691756041; cv=none;
        d=google.com; s=arc-20160816;
        b=qCSvAiM2+7F68cb+vt8+jzH5U8dmRtOYP3fuuEd6pJ5gZHRSDRWHzgawdQdk/xQa8H
         nn5u807D5ZuEJvZBtsd2GOHMZb5dGrkPBNzCToqn8+Wd7xp5p1R7sDHRvaKLVTTyV+jx
         j919ws+vtWYwyXaVujq1JO//rGiW2gr2MlXJbkyfOIAF9QDIwQNvYAWaf7/e/47qXPt/
         rqjJbClpuZeD2yVtc72y0XCkLHi5xTGRAsGUqHY1uaKY9hCuqyw39QHZp9vel931/7tG
         UaJfod/iTi1VqXZLg77eN0TQ3htPZpO9VJ0G0YdL9FVGBFw1MLv0mph/h5WHAGsm4rbS
         dIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YQrYePtzB9CE7rSQfMEhjs/n92b/nORl3809bFHFByo=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=oXYIikJ/R2IrbBMQfqUoDUwVT3ruSK6himIkbbg2pk9BTZmoIu0ZmtaK37DrtbI7bf
         2YjykBkMxSW9DL3Q1Z+7mDCeAa+FjYSNi4ys1W82VjLi9LNpMF0juUH+a9jhHzGAWxVU
         N16iamNevLj+venpMK7F72G2SBdbVObY4IoZZz0zz8mhJDzNTiBP+D4/EvviHB2sx71z
         fNMPHfIKfo/meH2jafMjzf1HLuyZIZJFRUT83WdrvovME/w3yhz/cgDec/RMn9xz5sog
         IrbAdrgSw0LaL+fBNm9ghy+83Cb0Bf+v7M6lgIZBqta95QOdiAuYZqvZ2Pkw48VtYIPI
         3Kwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mef8+DEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05620a22ad00b0076787a8a594si2020591qkh.205.2023.08.11.05.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 05:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mef8+DEH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUR18-0008OD-5u; Fri, 11 Aug 2023 08:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUR16-0008La-2A
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:13:20 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUR12-0004Ld-O5
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:13:19 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so2413711a12.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755995; x=1692360795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YQrYePtzB9CE7rSQfMEhjs/n92b/nORl3809bFHFByo=;
 b=Mef8+DEHn6KxV2gD8ZNvsiYgcvi1Ct34cjzOZDukgFWoIEXdcwm9N+uUQFayACJX0L
 8M3oEhY2xaB6ELUQ501qvzfqR2SvYiePNVpojjelaSVayRnpgvKSdYk2a9sB9nxelzzC
 ho2judO/JSTcknmukx4ToDmjhkrgB0YrZnFzepXZ1dxosFi7sWVQ/GaYxZSP9DFWc3Uq
 t662Q7Oq5cvPWa4ec4NcV6C3D+uR4xUGzCPRDTkgD/kqpoTcRLke3144agoX8AzcIqXw
 +cEVrDCyAopJjAOZFNV/Q3uY+6VS+RRReTH0ffeL+S4n3eSnSE3rw3IptzN5tNWDs6Hu
 TP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755995; x=1692360795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YQrYePtzB9CE7rSQfMEhjs/n92b/nORl3809bFHFByo=;
 b=f4E73d7m2wJiqyf2EmXbjoASdNVyyly28J6CcE3l6OwVq0ceai4y2d98HGIgJU3UXt
 vHYTAbsmTQ4I9polHv3zpG2GtfS5ySEOgUjXIUco1Fe0fIOtaWAAb4Tg0dd3JmO4s8dC
 CR4bbU4K+koHDTn8fxPSyw2YwHgvLL04yiJBCvg3zy94C8XwNUZSv8hmB9xZRrFhguxS
 GXQSdn/1jEN+J3vEscDOvSld7JwMOXUPnlBC3HsIGUjQfoOe7czMFgI9OdJ8sIeEx5X1
 Qzhh6vO2lunI7DqHm48tIF/9WDZYqf1KRlrSVZLwroIXTCLHkvsKsoTZQWuQRkG1OLCo
 6KWQ==
X-Gm-Message-State: AOJu0YzrV6DqOjsQL4RB634Pyd9tNCyB+6vrhsbDFq3iemkuLLKjBJpj
 zE0G1W2ncVGHW8iKmVOKgH+i+vybo4WHXQ1IX1J2jw==
X-Received: by 2002:aa7:c0cc:0:b0:523:100b:462b with SMTP id
 j12-20020aa7c0cc000000b00523100b462bmr1499853edp.5.1691755995108; Fri, 11 Aug
 2023 05:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-25-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:13:04 +0100
Message-ID: <CAFEAcA_HUQSyJfT9e4RxJq5CxUDPH5PJpPGV=M+SQV_QfdSfcQ@mail.gmail.com>
Subject: Re: [PATCH 24/24] tcg/i386: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: kbUts/vD081Q

On Tue, 8 Aug 2023 at 04:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |  4 ++--
>  tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++--------
>  2 files changed, 21 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

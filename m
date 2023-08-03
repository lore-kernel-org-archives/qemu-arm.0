Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1156160ejb;
        Thu, 3 Aug 2023 09:16:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFuWH8Oxi009j4ydLcriqZJDIDPq00GZPKgmA56eHzCaxDEZ7aDBpm4DEiu/gaJ+bkSmSL9
X-Received: by 2002:a05:6830:1646:b0:6bc:86f1:f24e with SMTP id h6-20020a056830164600b006bc86f1f24emr19379427otr.12.1691079385566;
        Thu, 03 Aug 2023 09:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691079385; cv=none;
        d=google.com; s=arc-20160816;
        b=UVIrZ+31AJrC4OX0ZjGmlA4UtLnpL+jI61fHokq5E0JD1suHynEqtoWFaJ1e+TTXbu
         RehEU/9LxSwpfAfNIcYFG7QPXK1epCD9x0bWXbwqpH2sXzWmpW1wqU1OGubtnp9/i+WT
         CBpoF6TQvPSIQAyPifYhfxR/4ehIqfTTDylubwtKkTONH9e5CCJRv+pm1FfytX1wOt/C
         HtVr6u9AfRb6fc0Bwx5Jc6LKIDHWi/OZZ38wM8rS55xx51RcR4C4eQXvfNvylej+rn7c
         4HxxHhRLqgpSFv+lc4jcZqQB/6D4MsZ5/Y0dKN+xh3wwNXZ6RAynB6QwChjoqU2qW18u
         82Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hGvBPvFqSUYeXV6Thm4UF5fp4yvklhVIGy45xkUmcsE=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=olQd1ReiRQcE4zYWHgOrA5B/yVqM/6spDf0E3Ex95rd14nPBnXP0kUvpdSV/sm82Oi
         Fquv9N8mUUtN8P/PLynraRufQRz1K8l7h1ledWB1KfJ6pKYYBrHrMAIm6Qjs+YkxycuB
         qb2wT6viw7vEOYY+IcgrbvTGukdb8TQY3B39SpxX5bz3yAh9HwueWxxYnityfO9Ocd53
         stM37enkMAmhLLKK5c+KrYU/+2tELaD9v/Z9eLLwwTZig6u3b1/uWmUoOnJqQlK39kdX
         eiicBNNmDnhbr/zqhEpC7lpCRStnD8ONsD7Hm3F400bL7w9wKGP1W8FVs5o+hE83miQ/
         +lsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xf34b6gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020ac85781000000b0040c34202141si67894qta.504.2023.08.03.09.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 09:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xf34b6gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRazY-0003FF-DM; Thu, 03 Aug 2023 12:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRazW-0003Ed-1m
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 12:15:58 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRazU-0006tg-HK
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 12:15:57 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5230f8da574so970877a12.3
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691079354; x=1691684154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hGvBPvFqSUYeXV6Thm4UF5fp4yvklhVIGy45xkUmcsE=;
 b=Xf34b6gmUl4RlNl+zBzOROrv5cN9byTAAfLtXnJ6YlIbfpwylvn6SuDccCHWTqkc5/
 BovmGCsNl02LFJrtB+OyhJ1e7lO2pLi0/tEseAwMohv46/dkGYT9uDUd2lFvkhHEvn+1
 8+D4gB65Unkiws8qR1YGMQuy+rGNhzBT0zPCycad2pbe6LJrczm9d21yKD1LbD7h6uoz
 TSyRZAgULgYa5fHp7/k7ZTWQW3ptP0gc+Hf8LQWzPU0PQXFhSXBmepPhZZXq+TfZl3G8
 lCCZcbC+mUiapovTWI1i/5NcNYTdfnSC1vNvbQ7PjYWcZgsoULNL9XFQmaab9qYRdnZ2
 QswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691079354; x=1691684154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGvBPvFqSUYeXV6Thm4UF5fp4yvklhVIGy45xkUmcsE=;
 b=ZpU/7u8hem6CUQNN/Y5cMZK83JUsKzHqpVsVZhzkO6g74OdaUUxuvBXtx6gLaDiytb
 w5qpAV3fNVgnqGS13WdUczF4Qz/rTSXU9pLkgxSHXMXGxWh6s31zkA/FYCvtvJyxLAcN
 79Kpgg9eWmwjRQ3OHTzR0jUoj0L4OzH6gM3DTcA0wDi4FOL7Dcxp+AMCZUrqGpbBNDm3
 WLcbeIazUSCPXQopOKhP2UBKqRgH50b1JebWm9wmUMJHqt1EMK8Mvo43dzKgP50nBWnr
 UlVVOhOnol58p67B86fKKqE0t6bnSj2wWt6S00M59ZaSKU4/PR8cvyXYTIZWQ3224yIw
 g0jA==
X-Gm-Message-State: AOJu0Yy7948a46s9XQD2xfbwjnEzcEw1wop+JRqNnXLLGTESJizcAYAn
 w5hVkRDP8g2YfBq6cutqwn1ZF+Jg9sBc/z2MnQS9hZmm9Q1kiwiS
X-Received: by 2002:aa7:c744:0:b0:523:1400:2d7c with SMTP id
 c4-20020aa7c744000000b0052314002d7cmr675449eds.35.1691079353841; Thu, 03 Aug
 2023 09:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-2-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-2-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2023 17:15:42 +0100
Message-ID: <CAFEAcA9oKFF7bRvKUWLMEvyaPobmShyf=i57oYombD3oWAbEkA@mail.gmail.com>
Subject: Re: [PATCH 01/44] Split out common part of BCM283X classes
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: eJ95OOXvY/0E

On Wed, 26 Jul 2023 at 14:43, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2836.c         | 102 ++++++++++++++++++++++-----------------
>  hw/arm/raspi.c           |   2 +-
>  include/hw/arm/bcm2836.h |  26 +++++++++-
>  3 files changed, 83 insertions(+), 47 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

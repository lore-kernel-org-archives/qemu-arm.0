Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4112281lfg;
        Tue, 11 May 2021 08:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaEK6rnkiYrhTVm4OXyEX7DQ0QnD5FyDhio+2jfDlb38yn9bdYUyvMI9DGfvjfujPAOO61
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr27267979jak.91.1620748212069;
        Tue, 11 May 2021 08:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620748212; cv=none;
        d=google.com; s=arc-20160816;
        b=d7SOG9WVQb4TOWOCzeAsbuALeOoFh3ws3fBTKKuqQRzB+9BP+Fpgjm5EmpJiFwlNOd
         6UUQnZndZ5/8DfynNKAwZdQDpNqR5WFNBD/7lcF/x3F6z6UkY4cvUiVHBikMJOfYEuUL
         6uJ7lBP1fuYnPXzdEqKtoJ1nS/ocJCB2S+tRKirSDJxKLdQY1BrOsgDibdPuFOAJazea
         IWdlahKJaFpr9aoCBtk7HZ8KcTFg3LbaFZp6PVkRzSl9TDqOZ91T9muPM6+kIBkjFk/5
         qQnFeSElYMsS/t0MzXMxGXA2ERfx3zY1FxpfFkPDCdnTx3MHV5VEO0gi9QGkYFFSxSls
         pB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DanP7Wy3DBLPlLRi4fOdK9IbdsewSL5BAjfz+4QSoW0=;
        b=kXuYOS9wjlMBysNlc1A16LoogpHmiWH9xdZe8VRhZblUipbcnQxBRi3WIsVo+WuT5q
         tx/VvIdCfnUhpgYNb9M/FKfuAw4+hqwg2BFEAP69zWGCPIxUiAJ11vhK2YZ2Y7LDRUZF
         DyIvVph9jcpNUFlZ1GfyFaBNnbFiyHoTsEVWUGu5R3SNYeogrDBs65L6CSPjZyzrX331
         yIVCAJV5d/uEIB1NZ3ddf6PVjdOkMrkgu80qMDGeViz5tDPQPQhRZ3TOVUqzANmksvcV
         Kw1jfKFksnR0C8w6abGXV5+vOp+vsTEFEreiU1ExeWuviXxY15aVNRWraEGdkiIDmobW
         E/ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZuCF2Ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si20361898jas.16.2021.05.11.08.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 08:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LZuCF2Ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUeB-0000xB-DG
	for alex.bennee@linaro.org; Tue, 11 May 2021 11:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUda-0000wl-5l
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:49:35 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUdW-0007YM-On
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:49:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b17so23480508ede.0
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DanP7Wy3DBLPlLRi4fOdK9IbdsewSL5BAjfz+4QSoW0=;
 b=LZuCF2IxTxM6K24z8EIQxrBBvD1yYt+2bHoikBgxtS6BMbeTfWmMmKhvmw4IIw2UgY
 rIapE0q+30PhASDNxNgntfVhbOuk4MklupAQ3lQsxJWHisJBXnEcXmypRJDPAO9WAPSN
 jIBTQY5R7P5dvf1+UkQ2DQa38biEBxzAFvpz6uv/+rwz4qZ93h8KDET4twJXlYDcwwMJ
 0W82mD1g8lCUwQGu3bnEN+kC1E4b9fssFQ6RfMWyoUdNDXhX9FmTRkAIbjtMyx0hVP90
 ddIZP326IDd/UpYe8DzLlHykX6y4eLUj/lXeNtHLBrqW2moPHB7Gk5RSPxfuVTGnEd+3
 DUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DanP7Wy3DBLPlLRi4fOdK9IbdsewSL5BAjfz+4QSoW0=;
 b=X41qZAQzW1invBGDlwMTAeOXll9croLjWPfaqGbvE5N6UxkZlCZ97ETwNN09xGg2eg
 b8AFOa2V6GJQ8SAijdIQze3Q2FpVEcFQlRmcKqQCRHwSM/zF6b+trs+/R4iTPavgJ1+q
 clwg9fcdvSx1FFbCDtzPeaCsV6pfa469kAq1iBPm6FN8To/O92N07gxni9sgBXvtw4Bn
 zCqpiDVYd49IIIEbidNhvnG+59y4J+Stmroa9pyefIfiG/rbIgRnk06BW4iFhTQBsIfH
 DJOWgOjV3uhKXVMQ/n577BB/LmxxR8FWFicdjhDxcoqXRuWnMW4oCI0bhDpGnBdmeDGZ
 U1HA==
X-Gm-Message-State: AOAM531km15xzS/JNjhspzxdMBNvctO7O8Gf/vgBxAzgd0oMCCMueW/w
 ki2cGkO66Noi0YS+PfegcHzKHA/Tv7s/nELi2ROlQQ==
X-Received: by 2002:a05:6402:1d8f:: with SMTP id
 dk15mr34791122edb.146.1620748168947; 
 Tue, 11 May 2021 08:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-21-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:48:16 +0100
Message-ID: <CAFEAcA8HcFG2D+1xncTLyQk_67bh91uvAacbm_MHC6fe3z_2+A@mail.gmail.com>
Subject: Re: [PATCH v6 20/82] target/arm: Implement SVE2 integer add/subtract
 long with carry
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lGo/aRv99Vgl

On Fri, 30 Apr 2021 at 21:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix sel indexing and argument order (laurent desnogues).
> ---
>  target/arm/helper-sve.h    |  3 +++
>  target/arm/sve.decode      |  6 ++++++
>  target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 23 +++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

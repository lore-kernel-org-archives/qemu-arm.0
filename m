Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp616909lfq;
        Wed, 16 Dec 2020 11:03:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRyk9ROxQOtOGuOBPMkAM1PXlBzi+PY8Z40iioa6X82hBX1VPDdSx0fNnIgtpamtTGjI3Z
X-Received: by 2002:a25:a4ca:: with SMTP id g68mr50953122ybi.359.1608145385492;
        Wed, 16 Dec 2020 11:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608145385; cv=none;
        d=google.com; s=arc-20160816;
        b=nDW6XWaN1Bst1vAUXeA6bjj07uHe2MWd17VARKyTYmJMcLfxYrgIUDkzmxRTiv2Dd7
         FEKg0OrTqtQjhdCXnX/vEWwqfOxZ8Ggi5VV+QfhuZvIn5GHUOOLD5oHRbZ4aDGcrgknj
         tD/SR012fXbbJ5xmEV3aeo/4Ys0C7cyXo3EReAmeBzNaNNSZ568WkqjFNsvchZQqX8P1
         bAn398xCUu6+EL2on80QdNzoJT6yr6WDZeMLKJBi668SDqqc48L6XuLCENPy9M/ym34v
         lcfbaO3HQPs6KDo/wqh1h7/THhVI/9I/BbKgoUUbe6v79aKH86RY+9gyJ6gJjzzHk2Kt
         3ORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+8DGERduX/BzmMtGxMWFcsJvvCASeG+0eCwkYEVU1Sk=;
        b=X9JE18lA0S7cQ+pWMltpF2bX37ik9ztur9oF7YH79WIrZk6k97YRkjVkYgRYbIZuUn
         bN9k6IBIkxRicRIvsuHn0ApUDLU/o6ixpbrjqMQilOavcayAGI032hnNiMvpEEvjQc/Z
         fn5A5IbG1P48gM4CSCZqA1n/D0PGBjSfpsVN9JYOIIYr2GBsYJ4fjCvZtklh/dF5dte0
         RAsp4CadYFOKijEK9gTfNmGEnBN/qCDGYKjGCfA1FwGSUJDU7ShmdQmYEtISeYw2rSNR
         g/mZQ6t9lyVjjWsHnyrHTnqH8Ucx6HcOkXZM6bDp8uQNqoMFDyW2t4hedz+m7WhHHA2E
         UT9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rM3gmBZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w127si1749234ybw.164.2020.12.16.11.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 11:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rM3gmBZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpc4m-0008MB-Qp
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 14:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpc4d-0008Ll-Fv
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 14:02:55 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpc4b-0006kR-R6
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 14:02:55 -0500
Received: by mail-ej1-x62d.google.com with SMTP id q22so16565432eja.2
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 11:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8DGERduX/BzmMtGxMWFcsJvvCASeG+0eCwkYEVU1Sk=;
 b=rM3gmBZaFrSTR1rDxSaJymxn1SnAnBkfKdPniKGkBqKjHFNLhRC7xt9KszbDQb2Vi+
 QlVqfwmK5E1V06UKGAT/nO7MtM5PUQ/TXoiMKksoKknd9ExatvddYGpfUDcMWk0zd541
 w3AtJFtvFT4fJvf18dWM2XgNfIxNJXk3icEleFYiAoOMsLeutmdxvPswRNQiFQ8uaWKW
 8Es52la5d307ygxMUZAYFPJuLDabwEV8loCV7CNh/RILnlEuukPuQj/SqIjnqH1XITi3
 /aqjZo76/lkMCz0BTJ72Mz97ei5rql2Ezbe/QQbqL2Ix+y6+yrHRUssNiX/Ypc7y2JaZ
 f4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8DGERduX/BzmMtGxMWFcsJvvCASeG+0eCwkYEVU1Sk=;
 b=rhobzPR3j2RyJ0Xg5I5XTSK5LZhq/a1CsDFxz2NXdfPhhB1ncBCzqHyYKj8stY9r90
 zLPrcoB8fjHZemZhY3N1zxQDJf0fmDeXK1O9wpSJ6GvTSVkF7crnPNsTn9R22keQpgYX
 hPrGzUskLXedgm+CIh5esUcYd0PAf/LmCCJEh3kBDZ5AtbtIjuQW/agawlsw98KOX4KC
 QtUWOPYwiYY/jjLSeBHSy2ut/LWLOUQ+ZU3nqUt0vCiplnlQJE2XQfuTBtBdlzFFQ+kY
 CMPXOkaZVu891npg7gfIrxd56bHW5PxyeC7aDkC4IpJTdowrltdNBgsmUMoCTulAS9CX
 Do0w==
X-Gm-Message-State: AOAM533KC1e/Fieyr4uoGc454czd8ZlDOI28+Bif7VHBevm5AE8fSE2K
 thaA7dqfZ/e4iKwTv6CsLmwySSzpf1wmIGQS4bH5Ow==
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr32444921ejb.56.1608145371961; 
 Wed, 16 Dec 2020 11:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-5-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Dec 2020 19:02:40 +0000
Message-ID: <CAFEAcA_Nd0TNjiXkPXp7T29BYO2PnQLQUAFhEg+AR87B8YP+kA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/misc: Add a PWM module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 f4bug@armsat.org, qemu-arm <qemu-arm@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hEw/zIS7PRIi

On Tue, 15 Dec 2020 at 00:13, Hao Wu <wuhaotsh@google.com> wrote:
>
> The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> two outputs: frequency and duty_cycle. Both are computed using inputs
> from software side.
>
> This module does not model detail pulse signals since it is expensive.
> It also does not model interrupts and watchdogs that are dependant on
> the detail models. The interfaces for these are left in the module so
> that anyone in need for these functionalities can implement on their
> own.
>
> The user can read the duty cycle and frequency using qom-get command.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>


> +static void npcm7xx_pwm_init(Object *obj)
> +{
> +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> +    SysBusDevice *sbd = &s->parent;

This isn't right. A device shouldn't be poking around
in the 'parent' or 'parentobj' member of its struct --
that is a QOM internal. If you want "this device, cast
to a SysBusDevice", the way to write that is:
   SysBusDevice *sbd = SYS_BUS_DEVICE(s);

(or you could pass 'obj'; same thing).

Looking at the code currently in the tree it also is making this
same mistake:

$ git grep -- '->parent' hw/*/npcm*
hw/arm/npcm7xx_boards.c:    MachineClass *mc = &nmc->parent;
hw/mem/npcm7xx_mc.c:    sysbus_init_mmio(&s->parent, &s->mmio);
hw/misc/npcm7xx_clk.c:    sysbus_init_mmio(&s->parent, &s->iomem);
hw/misc/npcm7xx_gcr.c:    sysbus_init_mmio(&s->parent, &s->iomem);
hw/misc/npcm7xx_rng.c:    sysbus_init_mmio(&s->parent, &s->iomem);
hw/nvram/npcm7xx_otp.c:    SysBusDevice *sbd = &s->parent;
hw/ssi/npcm7xx_fiu.c:    SysBusDevice *sbd = &s->parent;
hw/timer/npcm7xx_timer.c:    SysBusDevice *sbd = &s->parent;

These all should be using QOM cast macros. Would somebody
who's working on these devices like to send a patch ?

thanks
-- PMM

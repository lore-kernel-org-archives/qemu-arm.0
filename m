Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp41111lfc;
        Mon, 8 Jun 2020 18:36:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTzRzwdL5k5WPndT6MI52bG2Qm2ZsPcwXVbHTrDWfz3JpprVmtQVCcMp1cC+Ii5Eds+DnR
X-Received: by 2002:a25:b48:: with SMTP id 69mr2325681ybl.421.1591666619582;
        Mon, 08 Jun 2020 18:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591666619; cv=none;
        d=google.com; s=arc-20160816;
        b=ckYu0GhLNItH/vi4AdQf2+FhhFQp7j2NSMv0i+ufV+PcaK97DuiFI5d/k9rRoYhofU
         PZdQ7VFxfALXmC4N4B/5YI5GIvXGHz8hs9cA2Pra6Md6Y57yk/snuzj2St44lWq9aWc1
         9QLIkTrfEONOTMhJT/6cdbPMqFSAru7UrLsEQu/HWP3O94lhNALLxzpv8UiLxh78IhOf
         5jOYx6NfRORN3ZImtbvUp0xvgCvbXVMVm3iSt3f8AOG5t1ED6l42ElPdgvWwQSin3fdS
         7/qtmzGylGmZGao1lQLE0RByic4xI4LukGbfLUrocZy82G2kDbzez0d19dB8h1K+TLUL
         fFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9aphTkaF/pTaor8lK4sJuIDAPhh8u4H3dPq8RbeFkUs=;
        b=wXW2U+YtwhNfkEz2OnrEK/uZIhyjq1LcByifNAQ5/5HKJtnVROyL/uV2ciCvYMdTvd
         Ob8au7vZid5rJuzGxWFEfIAm/Zt+L5AzBD5MLHE1wBMIBgOrvj3V9rE+fpBuH3j8D6Tv
         BnI0Z6YhQU5vLTldper1PiP5Gfxdd94GGb6PvMr+XIadb4XpRh6EGflZGsB2R9Dj3i3R
         RLn1CSJVH2lwQA9UKAkoExngp6PcQBqONyFy6jWiZv7HHLudBLgKBOV0Gb9deIlwVLt2
         eaiyQO1I+UQHwiT7fBeeLR7tdz4zvOOXQayc/shuWzLML/UvxMXxsAh6wok4PnvG5lmU
         zYUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mFiX3UJ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si1162871ybc.41.2020.06.08.18.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 18:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mFiX3UJ5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiTCE-0003CX-Q1
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 21:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTBs-0003BA-Bv; Mon, 08 Jun 2020 21:36:36 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jiTBr-00007X-GV; Mon, 08 Jun 2020 21:36:36 -0400
Received: by mail-ed1-x542.google.com with SMTP id q13so15022366edi.3;
 Mon, 08 Jun 2020 18:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9aphTkaF/pTaor8lK4sJuIDAPhh8u4H3dPq8RbeFkUs=;
 b=mFiX3UJ54eu6BnI1/r8+w/I3+LfY4V4759zcTa/LJxNgsrGz3cIf15h4SlEgRUGF5q
 zJH+PMsA98cjQTYor5EZShsOsoq4BQmNlaqOucl0wEKZUwAbKOvenp3oib5GqRPxeBSc
 BFvczSOhWwvGwl9nRohOEti7U1TvEB4Jt36rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9aphTkaF/pTaor8lK4sJuIDAPhh8u4H3dPq8RbeFkUs=;
 b=JcBgt3+PLANont7hH+bFTDG/47SRd6Gm3Dx/0c5XSkWa730+GLmIT28Peqo9ed8ZGM
 PH2d93KvrVg7OovSlT4axgZIdVEiteLR28ZrIeu+TlAIFYD8CSC6NR1MVRPSNjfSzMrR
 bpIV9sLanleTcwdwmlKrQ2A2iNsBNOtAuepHA/CJoTt12uFbCxOsiJ9yUt+j54EYyjNY
 Bv6pSblm7+iO3F9krDbDHlzeKc7Zq72qlWRuIjzxdHu+DFXcAlViW+4fR1edGVC7KV6r
 qS9bg1QPz9UCTkO64/HjN1T9p4KhrPJGj2nBbygcjKKKjYUQ/o3WWs8A4VK3s0nni9AR
 a1eQ==
X-Gm-Message-State: AOAM532gn4b0JnyeZJvDLXSyvz7BErI8HfQ7WCChRYgZfKMaW/liMScE
 lKRS+/Rlreu73heVxjmwfWEdNqVhGYLErAJAu/Lpt9Lk
X-Received: by 2002:a05:6402:128b:: with SMTP id
 w11mr18834455edv.377.1591666593791; 
 Mon, 08 Jun 2020 18:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-4-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-4-hskinnemoen@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Jun 2020 01:36:22 +0000
Message-ID: <CACPK8Xfz2izvKoh-eRK2-=Pm_HpndTR6Op2qUZu_1GmSt2ng4g@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/misc: Add NPCM7xx Clock Controller device model
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kfting@nuvoton.com,
 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c6F09tf2PnEZ

On Thu, 21 May 2020 at 20:39, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> Enough functionality to boot the Linux kernel has been implemented. This
> includes:
>
>   - Correct power-on reset values so the various clock rates can be
>     accurately calculated.
>   - Clock enables stick around when written.
>
> In addition, a best effort attempt to implement SECCNT and CNTR25M was
> made even though I don't think the kernel needs them.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> +++ b/hw/misc/npcm7xx_clk.c

> +#define PLLCON_LOKI     BIT(31)
> +#define PLLCON_LOKS     BIT(30)
> +#define PLLCON_PWDEN    BIT(12)
> +
> +static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] = {

Can you add a comment to mention where these come from? If it's the
data sheet, note which version you're using.


> +    [NPCM7XX_CLK_CLKEN1]        = 0xffffffff,
> +    [NPCM7XX_CLK_CLKSEL]        = 0x004aaaaa,
> +    [NPCM7XX_CLK_CLKDIV1]       = 0x5413f855,
> +    [NPCM7XX_CLK_PLLCON0]       = 0x00222101 | PLLCON_LOKI,
> +    [NPCM7XX_CLK_PLLCON1]       = 0x00202101 | PLLCON_LOKI,
> +    [NPCM7XX_CLK_IPSRST1]       = 0x00001000,
> +    [NPCM7XX_CLK_IPSRST2]       = 0x80000000,
> +    [NPCM7XX_CLK_CLKEN2]        = 0xffffffff,
> +    [NPCM7XX_CLK_CLKDIV2]       = 0xaa4f8f9f,
> +    [NPCM7XX_CLK_CLKEN3]        = 0xffffffff,
> +    [NPCM7XX_CLK_IPSRST3]       = 0x03000000,
> +    [NPCM7XX_CLK_WD0RCR]        = 0xffffffff,
> +    [NPCM7XX_CLK_WD1RCR]        = 0xffffffff,
> +    [NPCM7XX_CLK_WD2RCR]        = 0xffffffff,
> +    [NPCM7XX_CLK_SWRSTC1]       = 0x00000003,
> +    [NPCM7XX_CLK_PLLCON2]       = 0x00c02105 | PLLCON_LOKI,
> +    [NPCM7XX_CLK_CORSTC]        = 0x04000003,
> +    [NPCM7XX_CLK_PLLCONG]       = 0x01228606 | PLLCON_LOKI,
> +    [NPCM7XX_CLK_AHBCKFI]       = 0x000000c8,
> +};

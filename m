Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3445655lfq;
        Tue, 15 Dec 2020 04:24:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygzZycfr1MP+nvnKfA7zLxLbTtbfgf6BPN7M6kPlwRvF4lLinqcRc4uXYwNUzSg7AEI1Go
X-Received: by 2002:a25:be89:: with SMTP id i9mr39991197ybk.35.1608035065697;
        Tue, 15 Dec 2020 04:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608035065; cv=none;
        d=google.com; s=arc-20160816;
        b=scWw3hpPiTx5uunqKIkefnOop1u07O7pm/QRjFTDXN08EGiEr9FBX06fH+IQTmjkWm
         Pdtw54DpQRpd8Xvuuzqd2CSaIsumUFTvFlKA/E//3PmYwIM6wEtMDXqPFdl0LRQ7r9WL
         5e0STCBsPaizeX8NZW+2j54XL1QyAKZRnV5iipQo2gI0e6SyFKJKqoTzugjfnv0YNYHB
         GxKSh7VkaV6XPSACNIxfkV3RfkjnDwevoVYIM1ueMWMh2h1VxBfm3xc0VP3/0EApvxLJ
         16qNwLexzdSN3ntJfDZSiJ9TgSwW2jkMgetdh5lovRRmzZptXTCGRySsmlihbAAfVl0W
         7oZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tes1kIxpED/r3tZ4yQeQmCFn+znK+RVMOmU7w9HIF1Q=;
        b=V3gUwoqtt7/Cj4rgULP3oXupdNFlHpdfmAm525D0Ie6enh6P+KRODqdtEo6/FTNYXP
         zI2cuv/HV0vqj35K7i716dNJY+QO2crsRiDgK4enR6Awg9kmgsJcW3NOd1io3o5jcI6Y
         6D4fmkUCbovDFOFHuvb5tCLLtEdQ5AiL6gLbl0R3K86YeAT2ZID3rOxPEDJMt3IvGOa5
         X+1h4OLbipzkEJBrt+KWhN3cd2ie0B4KMF4NMwSwMbpqZLZCH7n6pKSBYFQEe0H31pbY
         dWB2/XRHjg94B3um0ndCLrbmSSioIFeMDe7k6Idv/97uY0TPqukL1MXatL70YgWxkqDh
         F/9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="p/L2pim8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q184si20566520ybb.376.2020.12.15.04.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 04:24:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="p/L2pim8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp9NR-0003cH-3Z
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 07:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9NF-0003bi-Mh; Tue, 15 Dec 2020 07:24:13 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9ND-0004YI-1l; Tue, 15 Dec 2020 07:24:13 -0500
Received: by mail-io1-xd41.google.com with SMTP id q137so20257975iod.9;
 Tue, 15 Dec 2020 04:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tes1kIxpED/r3tZ4yQeQmCFn+znK+RVMOmU7w9HIF1Q=;
 b=p/L2pim8baYXu7F7Zj4/B9zAH+l8PzEPF7uZVnMDSN6j+HkKZ1ocqcRbzAr9Hc8Wn4
 3M6tiWY3pTNQ+1wiA85DbcqEh6lI19SA9rEnuqM7twjVX4F7iukrQmWwGCWnEgK7goBA
 +EMtANdYB1eeAipi9bIPyWN6eDPTnzoev2HyVqJbeCbGNVmOjYexPywGMaY2cgCNE1ur
 qRFJ05gAatig6eNFnKaC3l6IemwxP51xtH0IY2SByZfShWzv0LBUBdTuh3zrcBY/tMWD
 qPMKam3LptTo4voYEzqhVNlVKx5QeBk8/wRf13kMyh+2p2XoeoQ68dOWRD/zQ3VIr3BF
 kZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tes1kIxpED/r3tZ4yQeQmCFn+znK+RVMOmU7w9HIF1Q=;
 b=plv67ZjA1K058jVV30VUWc1/S/YJBGGAk7GXs8+R6mb+Nnbv4a62FGKgx+xqrXSLbf
 D8R6SyC5pbz82nl1jfRb2FI0A2f/1cRR0XjGu4LdP7mgqu7C188YzXByyT4z5lCLfS9y
 FpRiIrDW/+JhPS8wEyRFy/3My8GMK5Ojruid4jgbutQHgQedhtgLT1FAt70EjCYjrH97
 kaE1xDDuybNbb+seRBUPgnpWPxn4uRPyfTs2JH06RyL9Tmy+sIEYdQkSlvqAlC7E1Gam
 CQ1TNlugrAU5d5jlk/OAdvZv+gtYDBJyhAi+Pe2sBQJq+vMnyvUZeh3y7zRGjwbY4kN4
 Wh5w==
X-Gm-Message-State: AOAM531SoG3hIf3cm3fWeTu76VoDx2cWPKZI4sAdBf9ajNlbJtYEzCSC
 KUFMm8IjzLEOJ/Zbo4L0f8K7o9z/naXXEDJGviY=
X-Received: by 2002:a05:6602:2157:: with SMTP id
 y23mr38248953ioy.202.1608035048965; 
 Tue, 15 Dec 2020 04:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-4-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 15 Dec 2020 13:23:58 +0100
Message-ID: <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-io1-xd41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OneHbufklkVO

Hello,

On Tue, Dec 15, 2020 at 12:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fadd1a47df..90ba707b64 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
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
> +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
> +FIELD(CCSIDR_EL1, NUMSETS, 32, 24)

The positions and sizes of the ASSOCIATIVITY and NUMSETS CCSIDR fields
depend on whether the ARMv8.3-CCIDX extension is implemented or not.
If we really want to define the fields this way, we perhaps should
define two sets.  Or at the very least, add a comment stating this
definition is for ARMv8.3-CCIDX.

> +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> +FIELD(CTR_EL0,  L1IP, 14, 2)
> +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> +FIELD(CTR_EL0,  ERG, 20, 4)
> +FIELD(CTR_EL0,  CWG, 24, 4)
> +FIELD(CTR_EL0,  IDC, 28, 1)
> +FIELD(CTR_EL0,  DIC, 29, 1)

There's a missing field:  TminLine which starts at bit 32.  If
implemented, that would require to make ctr a 64-bit integer.

Thanks,

Laurent

> +
>  FIELD(MIDR_EL1, REVISION, 0, 4)
>  FIELD(MIDR_EL1, PARTNUM, 4, 12)
>  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> --
> 2.20.1
>
>

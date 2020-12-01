Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5784480lfb;
        Mon, 30 Nov 2020 18:06:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDRCmsUi64naUbcO67h8GlIDNVReRjB1tnBcijAQ7EdTml0ixrF75tO+fBzRXrTgA4QmUZ
X-Received: by 2002:a25:d494:: with SMTP id m142mr760622ybf.16.1606788401055;
        Mon, 30 Nov 2020 18:06:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606788401; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm4VqJ2byDdgkMEbMbd2iCxvEyfzSbI2H8RMO+PROebWOAnuhai0MHmLwVzkqXmezN
         ke2o9TsZNJtZ5j3jqLCTnKGsMkPsdfbNf1gL2zHDICILGZr2U1PUGS1cubdcVVKym/YL
         kOO57N7rb+We/yOwvuhGl6alQsQs+WJLvdTV6iQs4g8yIzfrC9dvcVPxoOFxrEDaRLT5
         KHg6ItlObk8QEE54GEdwWtq9PYs2DPbAnSGw3JJUNfBGcZ+AH03Cq+mJdvirT6FlqV7f
         r+n2VsNU4GHt1sO9JLKOcxnKs8Zqnffauf3iJjAKV4wPDErtp2bTpLOWmXZLbB739MNn
         izzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OB0RP0d+luIHMoFTLuzW3oFueM9Ak8zKUXbxFAD0GUY=;
        b=aIcvDrI5BaM5hh8ASw5Szie6Vj5GV6S0qgmgDnUFoi1g/2lsxDfVgvaN2cChiJpk2/
         dthjk9wW+Ae0rElVwmcMKw1grqD/Q9UNxYVsaPJKwwCga9KA54Us3cIaK5fqbhcD2POf
         w8W9Ku8gb0KY7osZaXxjdBnMrifBZeO+6CgR2AYt54lKtI+8BJucRqmD/fKNJx5wKnOW
         BN+39HLA4NzCnjd97f34iNZnbbmJXtBTpPikuxEkJt8ljYReafROwpTlQXM2NB/D9qIO
         oKHipNn76QeiYnYQnWitAwbd7dLHSMjZOHVEqoFZqWZYxSKKxtJg/MK2uSr7pWkD87ZW
         5/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d37f4ZFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si257298ybk.248.2020.11.30.18.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 18:06:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d37f4ZFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjv3w-0007er-FO
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 21:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv3n-0007cr-BX; Mon, 30 Nov 2020 21:06:31 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv3l-0000b6-Qn; Mon, 30 Nov 2020 21:06:31 -0500
Received: by mail-io1-xd43.google.com with SMTP id f20so34280ioc.12;
 Mon, 30 Nov 2020 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OB0RP0d+luIHMoFTLuzW3oFueM9Ak8zKUXbxFAD0GUY=;
 b=d37f4ZFgZlXzH6dl9pTSexrSkloRiM29tSN+KgQIYXbPTBkHR+4vMlbMZL0oRZ5DO1
 yZM1fTZjtLgOnHn6eNgJXIahzJtZPZJmgVHWH/CrMoL4/BySX8q/XQD02jsjpPWcOsmW
 m+WtcrN5lVB09EabaWTiXa5ZpUvzXKXlQI6Osb0+mjxb+RKdoJXfpbuASX15hqrvZVnt
 5xjtdfyW8dSfPwdMQvl9K5A5aPvP7cFiiKjsTfoAtw+rw2mEQMtkMos11Xa3UnYIa2KB
 k8UdJojBsf8yqCRPj3b5lStZbNa/qzVrePRDGVBV41s8UlKEKc4Fr17TELyfyCjfGo2Q
 QSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OB0RP0d+luIHMoFTLuzW3oFueM9Ak8zKUXbxFAD0GUY=;
 b=FF4RNlvCo3DSe4TiZIPDwjFfvqsMO61Wezpnhff/5ENBXaxeQieWyV3rPJGvXeDiP8
 Z9dp/ae+Uf41YqQnqTI75vnAl60VEoWlL8bw8Vcgu5/JBvKRJigUXZ4IT8atZkQjwdvz
 lNMO3gvcRC2+t7Wj606UDor17TP4m3UXB1LThUwRncuYPjsYYHgaO2ONR4YwHWcEtvan
 ejlPCE34bDcQKv5qsw5CfUA72Tte+WBjREuDfzyXYQdyPs+WOLxa8QwFdakCI3c3r6D+
 d8WXiZz35pZIegxJqqcxReRLEq002i/WCc3NbvGZ/PDbBeaXUaE5ignxf875YY1mHtns
 lPKw==
X-Gm-Message-State: AOAM5300TLNepMOsD5jHCYEjj7P+L6lyukJyu1GCNumbnert+swWb9EJ
 Uvey+t9bI6w/kMKUvn1olIB1PiLgRFIGIvOZLrWdo5CTz1E=
X-Received: by 2002:a05:6638:83:: with SMTP id v3mr713805jao.106.1606788388269; 
 Mon, 30 Nov 2020 18:06:28 -0800 (PST)
MIME-Version: 1.0
References: <1606709124-80741-1-git-send-email-bmeng.cn@gmail.com>
 <1606709124-80741-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1606709124-80741-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:54:11 -0800
Message-ID: <CAKmqyKN88Zipq5SwWdjRAU4Em+5XakO2kyByYYKVxEr+n8ebcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vvqLjD6Ll5jm

On Sun, Nov 29, 2020 at 8:05 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> When a write to ECSPI_CONREG register to disable the SPI controller,
> imx_spi_reset() is called to reset the controller, during which CS
> lines should have been disabled, otherwise the state machine of any
> devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> its last state and responds incorrectly to any follow-up commands.
>
> Fixes c906a3a01582: ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  hw/ssi/imx_spi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index e605049..85c172e 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  static void imx_spi_reset(DeviceState *dev)
>  {
>      IMXSPIState *s = IMX_SPI(dev);
> +    int i;
>
>      DPRINTF("\n");
>
> @@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
>
>      imx_spi_update_irq(s);
>
> +    for (i = 0; i < ECSPI_NUM_CS; i++) {
> +        qemu_set_irq(s->cs_lines[i], 1);
> +    }
> +
>      s->burst_length = 0;
>  }
>
> --
> 2.7.4
>
>

Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2466841lfy;
        Fri, 7 Aug 2020 02:15:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfgBGzuVoLeiIRUKfpYPXc9GSgZBtknga2Is5uAbIT+/6JlOcfoeTq7WvZk1xJ7yjet4DK
X-Received: by 2002:a25:ca50:: with SMTP id a77mr18796093ybg.286.1596791703363;
        Fri, 07 Aug 2020 02:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596791703; cv=none;
        d=google.com; s=arc-20160816;
        b=XYMDSHYrVFWxOcpFmsbRItA8B1ovffS+wqH83lRnyYwToHLkKjCIGBc+zZ08Mepncw
         +E4OlEyzIHL59n2vC1TxXxPOyUOdg22UFrFVXAxGEuybwKvZbUaw8DNaxJQyhH+vAEDM
         5sDxuodK/WT628LVi6LYssLY0A7glmZc7Etls0GrmTo+wexJUEpFIGoKnGAkqNB3OR7D
         QEdnmVzbKQ/TN7Wp0pTPI8CkwymoqnZB//J2i1SO7JnEvf9Ngd2RCW2/0fQRn5xK/2T9
         8HuCrjA3U47/UEu5y0gVvV/voaPUQtnmdqUb1Xv6ppjHVHLe9UOKQLt6xtbUX4RXqDbh
         hKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gf2GxP1wncmiRZSntjLHRNntrKjkXPe/3EQDvZvYvNY=;
        b=AAzbz7E+4e4Xq9GeQ0tdSWI3UNCWpPi6x8rV7fAismYaYg+wcWJMywU0Fb7jFKRZQ1
         wJWmt0fUTMZkj+fpLiiNetUv2z3ck37s7To++iKebIb5yNienL1xaB0AZ94jwqBJp22q
         JR5eQoEUhyQ5fT0dA0apz2GPZ91Z33zhwLdl1L5g84EPovHOFIUDyf3StW8en6HCF/1h
         jnsd8F3tkRw+sDFywQpl/c4YVNgWv0n6NmA4PrSJftB15RBqdm6aiZdnNVIymCOWuwNI
         WA5e1wXOqzcGAbVxL8Ch2eNNzMCSStB6mpAP/sUFKEIUY7d7ytge/uTy7C2ESzRPmlZY
         ZEcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nhw2k5X+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si7605088ybk.232.2020.08.07.02.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 02:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nhw2k5X+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3ySs-0007yG-PS
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 05:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3ySm-0007yA-UB
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 05:14:56 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3ySl-000105-4q
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 05:14:56 -0400
Received: by mail-oi1-x244.google.com with SMTP id a24so1329850oia.6
 for <qemu-arm@nongnu.org>; Fri, 07 Aug 2020 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gf2GxP1wncmiRZSntjLHRNntrKjkXPe/3EQDvZvYvNY=;
 b=Nhw2k5X+MQVyn8nKeKSDBwUoVAteYDnYP/U9h3o42o3wBlB6hwc2tv/PargatMnaTD
 5F97e0z5zBahsq4Hx4olEFu1hnNLvg32ecfdFyCfRuB26YDgl1obPeHYUCvfT2+f15dv
 Ooy3B2ho8Ih9hXKHBwIkXB2TN2GUey3qWoOxUstZAaUJ9v90Umy9YTmWil89hHuUarey
 V9TczME6MDNZHznh1XkvkWVqnU/o2lD31Afh3E/hSbNtKq4oWREyrJh7sWFxB1ln5T3R
 EQf9Rruwj6lTk+FeEHh+x0S62OY4ZTDDZ7et/FLNZfQVfmV8erXOFYoLaOEWJtsn5x8C
 KYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gf2GxP1wncmiRZSntjLHRNntrKjkXPe/3EQDvZvYvNY=;
 b=tPT+iY9EpripTmAu3hYlSfGcz95oSrX8KV2qhmNrDZ8ttT6lQZE99+BN+pkVxLYcos
 WfSH35wk0x3cMkIsYWCoxbw5jeTKx0KlEKW82sDPriViCUsTbcJqcpOLbMLi7KXRnHrZ
 MVbskPcwypawXzoXEaRSPgV51ple5rt3JXF0k1D6qQVdC7ZwqUMP1ZhHHUjrS4b32nf+
 VPQdoqeKbK3OazMLLuBHM1gWiwm7c4CbzIIbCdZd9C+jFkzNjYp+6/6cCPQvVBSNJd9M
 22CvaMn9vgGdBbYbcqdBTYk9DoR9TL8ZMXyDWdh0UKBEu+CZ7/72ARMp/0MYz9/o3ZZA
 sM6A==
X-Gm-Message-State: AOAM532vUx5GWnpa3Gsk2/tFS0Tw5tQsygvAbm0snTb74KJrziArmCFa
 Oz95brO9DqxshVc8kYL4ZAXXss860MZmgRWqKicJNQ==
X-Received: by 2002:aca:50c4:: with SMTP id e187mr9964604oib.146.1596791693770; 
 Fri, 07 Aug 2020 02:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <c5e38163-5ad0-1965-df7e-7543be284135@kaod.org>
In-Reply-To: <c5e38163-5ad0-1965-df7e-7543be284135@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Aug 2020 10:14:43 +0100
Message-ID: <CAFEAcA88DLWFPynThkkb39KUPsHYsUMawco6UFbyqcVuBTh32w@mail.gmail.com>
Subject: Re: [PATCH for-5.2 00/19] aspeed: mostly cleanups and some extensions
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4S0wywpsbnpe

On Thu, 6 Aug 2020 at 14:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/6/20 3:20 PM, C=C3=A9dric Le Goater wrote:
> > Hello,
> >
> > Various fixes improving the support of Aspeed machines.
> >
> > Thanks,
> >
> > C.
> >
> > C=C3=A9dric Le Goater (16):
> >   m25p80: Return the JEDEC ID twice for mx25l25635e
> >   m25p80: Add support for mx25l25635f
> >   m25p80: Add support for n25q512ax3
> >   aspeed/scu: Fix valid access size on AST2400
> >   aspeed/smc: Fix MemoryRegionOps definition
> >   aspeed/smc: Fix max_slaves of the legacy SMC device
> >   aspeed/sdhci: Fix reset sequence
> >   ftgmac100: Fix registers that can be read
> >   ftgmac100: Fix interrupt status "Packet transmitted on ethernet"
> >   ftgmac100: Fix interrupt status "Packet moved to RX FIFO"
> >   ftgmac100: Change interrupt status when a DMA error occurs
> >   ftgmac100: Check for invalid len and address before doing a DMA
> >     transfer
> >   ftgmac100: Fix integer overflow in ftgmac100_do_tx()
> >   ftgmac100: Improve software reset
> >   aspeed/sdmc: Simplify calculation of RAM bits
> >   aspeed/smc: Open AHB window of the second chip of the AST2600 FMC
> >     controller
> >
> > Joel Stanley (2):
> >   aspeed/sdmc: Perform memory training
> >   aspeed/sdmc: Allow writes to unprotected registers
> >
> > erik-smit (1):
> >   hw/arm/aspeed: Add board model for Supermicro X11 BMC
>
> Peter,
>
> I saw that you just merged that one. I did some minor changes in
> the commit log. Nothing very important.

OK, I'll drop the old version from target-arm.next.

I'm wondering whether it would be simpler to let you just
submit pullreqs for aspeed-specific patches, since we seem
to have quite a lot of them and I'm generally letting you do
the review work anyway. What do you think ? I'm happy
to continue to take them in via target-arm.next if you prefer.

thanks
-- PMM

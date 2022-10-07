Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp541003ocg;
        Fri, 7 Oct 2022 08:13:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wSyrthWHNqW5z8mfAuph5cVkMtt5qTLlj8NQMwEcXIsTDXLjXWQh8beHtkJ4t6WiX7y7+
X-Received: by 2002:a37:ac0e:0:b0:6e4:9fd5:bf1e with SMTP id e14-20020a37ac0e000000b006e49fd5bf1emr3995897qkm.84.1665155625290;
        Fri, 07 Oct 2022 08:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665155625; cv=none;
        d=google.com; s=arc-20160816;
        b=I3leSKNK429ffMEY95nYsQ6OrgvrT5qp19n707tCiKE0QNScBtuuMZqf/wdhexP6ap
         FMlLuZi3un315uYtrTBkpLHT/1H44EyEBQGFtkuPRF0AJR9CiYD7WmbUmtZwecHr2Ar8
         tj+ossfVX2ka7FVvVFVsOImtfX4j11381KR6FIcQqdRQPFGhP8yCz5CxpZ+ZRlkMOTvr
         hsqZGlaAIGvTbHLhM9TX/fc0wWOSWOUWEGcP17nZRMtJSuemu56uy4Ysjm64DpVYilyT
         uVwSwRwKLMt5C/NYRw8uBiaVAIu4WoOyim0RwqZtSMSvp3NP+IPhFVMSBKgW/HLaB82l
         DFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=zLjZJqgVBLa0R+74x38dqaCOPvajibRWCIf/G8J0xz4=;
        b=DSFr1hRwNUjwkX8c5J4Lifwk6uwkWnxS9LYIlh8TK87Vg70v89xwQudeILHp2jhjG1
         dRWsN+yprrsh9+Xbf2D/Hh2IHW0UtH0ubpyQ4aH3DXBoH2mTmVcpnv+RvR06R6V++vQI
         V4m2sRDWOb+cV27hgGOFvgMtF6G0+08HJ8BJ0d7sTKIp0eSndobXVHjbFvTJg6NqwrUi
         CmxPZDK4lf0yWzEmue/JX6xWudbiTB8qGhIFsGP+IN3zTcwGF9C8z00eWT/i9YV5ADXc
         zO7C2ECEMyxSn/3NBeiDWOFwN7Q0SO3cBSyMZlJePUfVrt+CssEX5G85gRWbR17dd17z
         y2dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TgcYFyxx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020a05620a445500b006cdf9845b57si935517qkp.590.2022.10.07.08.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 08:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TgcYFyxx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogp2m-0000hW-Rf
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 11:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ognxi-0003VV-NM; Fri, 07 Oct 2022 10:04:29 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:35546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ognxf-0001Dg-3k; Fri, 07 Oct 2022 10:04:26 -0400
Received: by mail-lj1-x232.google.com with SMTP id m14so5840202ljg.2;
 Fri, 07 Oct 2022 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zLjZJqgVBLa0R+74x38dqaCOPvajibRWCIf/G8J0xz4=;
 b=TgcYFyxxCVqzc5Z9+O/FTmX0M/LXB4zO1cSBFE6xpps/PEN+yLoGuYeWo6ntwXBdZg
 wJd+oMTIi33SVof9Da7esTHFPSsalt7He6VjXGnisaWYVoDXtL5sWoLKCRYFH7SIzJRQ
 oYgcXwRXHknz0KjEFHc3KbxJNsyZxL9eo7pQKl8rNWsjEkTs3HrmlzDpAT/8dEuk66XK
 GvtbkfgQPyRDgbwaIgbyA1e5XrFYQKi3opn4Z0NGbW1wEAvy1giX+GQeMpXoCZGdqZa3
 yjw/wZdxCygzc3Gusqg/n3WoBA6napbwe6rqtbsI08EQOgegKjV6TMBd5aOyAv1jIW2t
 Eeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLjZJqgVBLa0R+74x38dqaCOPvajibRWCIf/G8J0xz4=;
 b=4RMXfjYs2BDK4zWw2YZ0o/j+6Y81WgsVJZ+BU1IEEvQKKNG4NOmbbLrHR2eiGA2XdE
 pgdr6hlz0zLzqPZvOJuzncgGpLGyNRMZ2HRp9Vcy8P6cVBN2JrAXg7AtRRsVmQUfjbYO
 NMmr6CnlKSPAG0IayYAGMyImd4IDm+FFr0DT0ePrNmTbsmzT7FP+JoIJtW6uqu/inUbl
 Yl2Ck1xRZ/gXIlPxcnO5Ml5dUKAdDiy8efMMGLkdbTncfImlxICrc3OS1ccHtb5aCOU/
 5s9d3AX2iS17YR6sRd1bzRHu2I7sLAZN9muy+HVzrU6OZYpH7Bkg+gEExSBMWplmYpE9
 O6bA==
X-Gm-Message-State: ACrzQf3EPIf41UzEkA0BwO7Gd5hOOZ3LnQBm1vrXqZW6mo/AEuWY+KQo
 Af9HvrE147Obg4Ao+gkiFp8=
X-Received: by 2002:a05:651c:3da:b0:26d:fd58:cb3a with SMTP id
 f26-20020a05651c03da00b0026dfd58cb3amr1796092ljp.454.1665151459765; 
 Fri, 07 Oct 2022 07:04:19 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b0026bdb7ad643sm276456lji.50.2022.10.07.07.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:04:18 -0700 (PDT)
Date: Fri, 7 Oct 2022 16:04:16 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Message-ID: <20221007140414.GD20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-9-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-9-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GVURUySK97vW

On [2022 Jul 22] Fri 08:36:02, Cédric Le Goater wrote:
> A mx25l25635f chip model is generally found on these machines. It's
> newer and uses 4B opcodes which is better to exercise the support in
> the Linux kernel.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/arm/aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1c611284819d..7e95abc55b09 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1157,7 +1157,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>      amc->soc_name  = "ast2400-a1";
>      amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
>      amc->fmc_model = "n25q256a";
> -    amc->spi_model = "mx25l25635e";
> +    amc->spi_model = "mx25l25635f";
>      amc->num_cs    = 1;
>      amc->i2c_init  = palmetto_bmc_i2c_init;
>      mc->default_ram_size       = 256 * MiB;
> @@ -1208,7 +1208,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>      amc->soc_name  = "ast2500-a1";
>      amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
>      amc->fmc_model = "mx25l25635e";
> -    amc->spi_model = "mx25l25635e";
> +    amc->spi_model = "mx25l25635f";
>      amc->num_cs    = 1;
>      amc->i2c_init  = ast2500_evb_i2c_init;
>      mc->default_ram_size       = 512 * MiB;
> @@ -1258,7 +1258,7 @@ static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>      mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
>      amc->soc_name  = "ast2500-a1";
>      amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
> -    amc->fmc_model = "mx25l25635e";
> +    amc->fmc_model = "mx25l25635f";
>      amc->spi_model = "mx66l1g45g";
>      amc->num_cs    = 2;
>      amc->i2c_init  = witherspoon_bmc_i2c_init;
> -- 
> 2.35.3
> 

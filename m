Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4500907ejb;
        Thu, 29 Dec 2022 12:50:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsdmI9HiNbY9J2FXziV/VboT4yHOekXrnF8AsqoH8xJj3dWkH0SzcO3J3EJSVKTz2oYNl3S
X-Received: by 2002:a0c:eb0b:0:b0:4c6:ff4c:f05f with SMTP id j11-20020a0ceb0b000000b004c6ff4cf05fmr41160636qvp.4.1672347014945;
        Thu, 29 Dec 2022 12:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672347014; cv=none;
        d=google.com; s=arc-20160816;
        b=bY8GKLOlCGrRpgUrB8Fd4Jw/oJA+x6Jz61mBwmXicUdigtn48M7dH2EoBv2VFUT280
         VALLRZWU66M4eaZ73GWgPQ2QkNjLItftAAoza550vLGHyffKEPajnEk1yVdH9YPQdrK0
         Dt1qTyv2L/DQ53Ehmy3EobFpIj757tOA6zRB/2Ucbrwf5vVDYRGNxGAl4KW/o6woiF4N
         lDZtOXSKXI+jqk18uKhY7immn0hmY+3pIEjSPx0VjXPlAqPILh7If+FBF1yoovssE/LY
         aD+MBQYQ4HCdmEG5Ine+vBctPr0lWkOFHZYMYWjKcvDgTwqElJUCGe/r6xwBDu8gio7y
         7OFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=HqqVL/hdJDFu3hJPvXnhhUb4vxL5zTUEo7LDRL44fPM=;
        b=RyNijjVif8aZPscBqcY4M/1QjFO95dITDbVBZV2/F5kuXEXFANX/cfdiMUdvix0hW9
         y3WElvst1AnCN03DHRO+imgTX5ZkbFEFj9jymCWDHUn/fPM4b5/srA94J/MmErqb2WHT
         bRUi1YYdSfeRI+F7UI0zizWvC4vgt1zM71KT3TNsjRYLwUa5W2yOAnYg6qyZRuFmzpdd
         9om0eVUEQgBBmSs/3VwnJwf4ENR9/fRPfGlyB7A4kOLEZd851aFdJzlp3H3G0b7KpIXj
         uwGeHw/5F0z7bhm350Fwy5sJ5DVEvmvHaXZZkIARXm3ur4L+HFv15Nl92kHhqUpRRVTq
         tfZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b=WFL6HpQa;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=eqDitLWJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a0562141d2300b0053191d0a07fsi4478382qvd.100.2022.12.29.12.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 12:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b=WFL6HpQa;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=eqDitLWJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAzna-0003on-9E; Thu, 29 Dec 2022 15:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAznN-0003ew-Tc; Thu, 29 Dec 2022 15:46:37 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAznK-0004O5-7b; Thu, 29 Dec 2022 15:46:33 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 469EB5C009D;
 Thu, 29 Dec 2022 15:46:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 29 Dec 2022 15:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672346789; x=
 1672433189; bh=HqqVL/hdJDFu3hJPvXnhhUb4vxL5zTUEo7LDRL44fPM=; b=W
 FL6HpQao1S4fLsf7Qx0uF7fhjFdU8KxM5yUfHUDVJaA4Y0O2g4j9iksqokaJfY6O
 5tW5P1yav4a9zaQvFnekGkRvWCCOtEPdrpZfTbbHLY22co8/yQasgi0CiOFkoPI+
 LpVtSfpC0XFFMc/KotI7QQ+cEAtehVeVLigWOf46gLJAc1a5yrpR0QzX6NIvv5Ho
 ggrCmBF/gyXHwQx03PEiJszhd2krjGMFtrk/C0oMDqQK2jmACCOXTFYvFQYmzp+r
 ztRtAycNCBa/1riW8cJs4OdU5EZyTYxIsamoJmfxixlqDh5Qn8v4paSwyHxFhozt
 H+fEkp7kIszC0sbHorNHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672346789; x=
 1672433189; bh=HqqVL/hdJDFu3hJPvXnhhUb4vxL5zTUEo7LDRL44fPM=; b=e
 qDitLWJ9RbrwF6CgnxYflszwr5HCWCiVp6lmC2EBxE4ZmXu3F8wwLF+cOKcnwbqe
 L+lydY0RMhH5opkUf3cdjtfKiDDiVNq5M1EJt4e5M1xsxS1n/qGaOp2A1x3mDzZ9
 Um+nO7OvVqY2msivP0cIFSoHYS06FHM2+e8USArpPoTRjGIVJo66r3WLwREnSSQa
 Yp82H1qn+Ab4bCUIhkdRNjlW1iR6mSEBdKjBSBG9Z64Uz/dPcf6ng+EPw/DNUKIb
 jW8oW0i0CTPPrs2zdTFlIanSRBTY/SU4VYb39RE/muyx+fcVz1unhYF7ASsQiye/
 Re6VoiCiRWp/ZLfqwuHsg==
X-ME-Sender: <xms:pfytYxmSdiew-gKd6YJYmI2BhhEDI1kooXIU639OfdcuAzg-Wy_HxA>
 <xme:pfytY83GwPnohzsZMKoC62SvqaCSQc3I1Kctqi6wHuP8dMOMRfRjantGvI9JjBtSR
 VTOrEQT3rmXmheLMtI>
X-ME-Received: <xmr:pfytY3orDYy3-cHnVk96FQIdUc2qN28cAxL_YJ0g39D6ddpNAnS5KBANk60Qv35sZSP-fLVFV7VTSoqzb0MLow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:pfytYxmLBpyowNYpudkOW6-uyNZ8hE3AFKNo84vsDnLDxUxy_jH9wg>
 <xmx:pfytY_1zEXVlkVpRbtABN0zCKVMiRzQkKbBtzDWKYiFd9ypgny1oNw>
 <xmx:pfytYwtNxlqtvzUmUXZvzwuwvEaOxjaBTDW2znG4dpUBI5-EyaxtTw>
 <xmx:pfytY23_Pk5Eh0y6jC6TlmleZ5Ak6CZLfJ0W78myOZ-jkrqzKsvYnw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:46:27 -0500 (EST)
Date: Thu, 29 Dec 2022 12:46:25 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 4/9] hw/arm/aspeed_ast10x0: Map I3C peripheral
Message-ID: <Y638ocw5VdN5TeHK@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-5-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KqXrYAIw8X7O

On Thu, Dec 29, 2022 at 04:23:20PM +0100, Philippe Mathieu-Daudé wrote:
> Since I don't have access to the datasheet, the relevant
> values were found in:
> https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index d7dbc1a801..53ea6d471f 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -54,6 +54,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>      [ASPEED_DEV_WDT]       = 0x7E785000,
>      [ASPEED_DEV_LPC]       = 0x7E789000,
>      [ASPEED_DEV_PECI]      = 0x7E78B000,
> +    [ASPEED_DEV_I3C]       = 0x7E7A0000,
>      [ASPEED_DEV_I2C]       = 0x7E7B0000,
>  };
>  
> @@ -89,6 +90,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
>      [ASPEED_DEV_ADC]       = 46,
>      [ASPEED_DEV_SPI1]      = 65,
>      [ASPEED_DEV_SPI2]      = 66,
> +    [ASPEED_DEV_I3C]       = 102, /* 102 -> 105 */
>      [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
>      [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
>      [ASPEED_DEV_UDC]       = 9,
> @@ -130,6 +132,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
>      snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
>      object_initialize_child(obj, "i2c", &s->i2c, typename);
>  
> +    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
> +
>      snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>      object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>  
> @@ -240,6 +244,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>      }
>  
> +    /* I3C */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
> +    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
> +                                        sc->irqmap[ASPEED_DEV_I3C] + i);
> +        /* The AST1030 I2C controller has one IRQ per bus. */

Should this comment be I2C or I3C?

Otherwise looks good!

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
> +    }
> +
>      /* PECI */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
>          return;
> -- 
> 2.38.1
k 

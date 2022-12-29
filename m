Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4501931ejb;
        Thu, 29 Dec 2022 12:52:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgDoj/8nT2jDQzZmbVpsfBkAPgJ0v+cWQN8JCuNRdAP3QvdRxUUG4DCU63hzcwYPAMtqQp
X-Received: by 2002:a05:6214:37c1:b0:4c7:4574:42f with SMTP id nj1-20020a05621437c100b004c74574042fmr42083726qvb.44.1672347136647;
        Thu, 29 Dec 2022 12:52:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672347136; cv=none;
        d=google.com; s=arc-20160816;
        b=xrN/UWqwoYTYoALnoUSTu0NaH8okCHpBb2mGF+naGmza44t2pkrP8sLOKg/c3pnf8d
         tTkAXeM/aJ7+Unhnn0odA+/j+hvEHRPebozSy/gZkPzfTqaC0fNvqYtW1P+FE0bs7jLv
         4ay9d7tWRlHeJGyEMITYOk+mj6jP8VXqrQaGO0fx+TXA23V+COQDEJFXIfjgO6qqNlb0
         /qgBRnYcykoT1a/g4eNOZFQJMYe8fM9vObvI2JnjZgUCnyd44QTB7ouZRFUwrG3qYypJ
         mZ5PfThNy098F4dXVRFb5HZufUymwMm7U3TkKmIBEfcFaRpjeZN/fxFO8oSBgzzhxRiZ
         zmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=KQhGbU2nCIecPOnK04ujIxvLxxPGfIm3k31QXiUS9s8=;
        b=EwmhZnbYdnN+TpcLaU0mztDMzdn0Bh/SK3PJ9d80Mke4PY769R9u12xgrf1bl47cze
         ripUT8foTq6of0YKo3RauBvjOuOpfHpDyHOdJkB5+YnJBo5A2PbjuMfPDUk1TaKdDGVu
         7/roENHFGyvCRcC0cO4vGip/EojpJeOr6GEhgAr5gtlAjSCtkDs9DXO3+i021O17edXY
         7Uzt4iZuFKICOPW18vXGBbijPRcDROCv+vaINySXwMGxAlwxJBgukvSkjyfxfSBMhwG8
         u/NI8X3Ju6XaappunENyTv3uZkjTFoDNdPhNJeE9IVfGP+5GXLCRxsRlH50MjDYmftMJ
         7wJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b=bIA5XnbS;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=hcsT+ue6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kf10-20020a056214524a00b004c6a5ef9e36si8284475qvb.408.2022.12.29.12.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 12:52:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm3 header.b=bIA5XnbS;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=hcsT+ue6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pAzrk-0005hM-6l; Thu, 29 Dec 2022 15:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzrg-0005gQ-7h; Thu, 29 Dec 2022 15:51:02 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzre-0005Ay-Ii; Thu, 29 Dec 2022 15:50:59 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BFF405C0040;
 Thu, 29 Dec 2022 15:50:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 29 Dec 2022 15:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672347056; x=
 1672433456; bh=KQhGbU2nCIecPOnK04ujIxvLxxPGfIm3k31QXiUS9s8=; b=b
 IA5XnbScxFpdEgAN+PJNRKklSTv63C6GgMom2ZRlyYz7kFI2z6Cwr7M69//EEKJO
 q4DfS0JRQYxorPkEghfAW5vBbaXGDwx0abWRtItoj9E0L6zDO5q2vMy9qIFL9r0Z
 mxxImE4VwK2dq5g2Ze/Dt/kGsDhBTcJD2p7M0M10aVuExqzMLKT7b2UVNTjY9taZ
 SfpqwHInP4NYCeO8hv0ciZZVs4FcFuB/BMAzbu6XGHlijhoSmuWgUiQE0jiLfooy
 zkGzrl+k79xABUmUXsUE9bhc3uxQp8okN/uiabRzwaGdCCeMWH8/FSwluDh8xl0s
 okg9J8KDSlha3e7L6DE2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672347056; x=
 1672433456; bh=KQhGbU2nCIecPOnK04ujIxvLxxPGfIm3k31QXiUS9s8=; b=h
 csT+ue6t+ox2n7k+aKfWy6ZG3JpCn8IDDU8xq+d5GK/CPHdW3n6th4z/KtRP573i
 gfFgwrk9mu8pB1XJ/p5Z7XGO5E4X+VmCjNsRzqMtWcu3PdxW1bRe0VnBQXfFPUh3
 72REMniTmJ2BmJsIVFPFLnMHM/rC0pQbQyVriQOv1tY/PHN6om1fn9EWjoVYnCh7
 rfgVGRRnB0v67l0PeKrqumBEd6Uboy+lT1CLNS2v1GBByzWTVOtHsEE9ISpIDAOe
 IGd+luPaOg31r5ZdLNnu7oSE/+myug7axJkf1RZg6PfsS2YqHJp1rQjluhoDhvvR
 LAEGGI8WXNPP5AdDisiTg==
X-ME-Sender: <xms:sP2tY2-L8mOxUAn2fWoZHap7kdT248ihrbmIqXIPmra93Ja4FBU5vw>
 <xme:sP2tY2s01YvK_RSen4r8cW16Sf6_48IX8BFrWOD1N4_C9Y3UGpSwwVlZzhx5bue62
 BKzSBDMEnng03LeC8Y>
X-ME-Received: <xmr:sP2tY8DL4ypE7B3h2pYyvLyVhmgJBVar3K8INkPvi9anq3VoS3eoukv06I4htdT7gE0JrdAv3lJOdfeFp87Bvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:sP2tY-es74Wk-oy3V42qWBYiYxEjgT_LTXZoJ1o9MvYQmKofwyF1yg>
 <xmx:sP2tY7Psm08lL2UivraqygSk9J8BWHx6ebrYrXQA2L4AbIRVNP2pqA>
 <xmx:sP2tY4k29-sLcz7cKa-V0vw_zXDeLLh3PHtJYS3mXQZ85RE2Ektc2Q>
 <xmx:sP2tY5s3k3PUzF8UciI9ZLqG8yv0ZdhoaVyXyZyhW7BLhwuSLdocoA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:50:54 -0500 (EST)
Date: Thu, 29 Dec 2022 12:50:52 -0800
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
Subject: Re: [PATCH 5/9] hw/arm/aspeed_ast10x0: Map the secure SRAM
Message-ID: <Y639rFom2AZX7A1x@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-6-philmd@linaro.org>
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
X-TUID: LjHhUQxAmDp6

On Thu, Dec 29, 2022 at 04:23:21PM +0100, Philippe Mathieu-Daudé wrote:
> Some SRAM appears to be used by the Secure Boot unit and
> crypto accelerators. Name it 'secure sram'.
> 
> Note, the SRAM base address was already present but unused
> (the 'SBC' index is used for the MMIO peripheral).
> 
> Interestingly using CFLAGS=-Winitializer-overrides reports:
> 
>   ../hw/arm/aspeed_ast10x0.c:32:30: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>     [ASPEED_DEV_SBC]       = 0x7E6F2000,
>                              ^~~~~~~~~~
>   ../hw/arm/aspeed_ast10x0.c:24:30: note: previous initialization is here
>     [ASPEED_DEV_SBC]       = 0x79000000,
>                              ^~~~~~~~~~

Ohhhh! Oh no, yeah I think Zephyr has this warning enabled by default, right? I
guess it's not enabled in QEMU? Hmmmm.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

Also maybe include this tag?

Fixes: 356b230ed1 ("aspeed/soc : Add AST1030 support")

> This fixes with Zephyr:
> 
>   uart:~$ rsa test
>   rsa test vector[0]:
>   [00:00:26.156,000] <err> os: ***** BUS FAULT *****
>   [00:00:26.157,000] <err> os:   Precise data bus error
>   [00:00:26.157,000] <err> os:   BFAR Address: 0x79000000
>   [00:00:26.158,000] <err> os: r0/a1:  0x79000000  r1/a2:  0x00000000  r2/a3:  0x00001800
>   [00:00:26.158,000] <err> os: r3/a4:  0x79001800 r12/ip:  0x00000800 r14/lr:  0x0001098d
>   [00:00:26.158,000] <err> os:  xpsr:  0x81000000
>   [00:00:26.158,000] <err> os: Faulting instruction address (r15/pc): 0x0001e1bc
>   [00:00:26.158,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
>   [00:00:26.158,000] <err> os: Current thread: 0x38248 (shell_uart)
>   [00:00:26.165,000] <err> os: Halting system
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast10x0.c     | 11 ++++++++++-
>  include/hw/arm/aspeed_soc.h |  3 +++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 53ea6d471f..21a2e62345 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -22,7 +22,7 @@
>  
>  static const hwaddr aspeed_soc_ast1030_memmap[] = {
>      [ASPEED_DEV_SRAM]      = 0x00000000,
> -    [ASPEED_DEV_SBC]       = 0x79000000,
> +    [ASPEED_DEV_SECSRAM]   = 0x79000000,
>      [ASPEED_DEV_IOMEM]     = 0x7E600000,
>      [ASPEED_DEV_PWM]       = 0x7E610000,
>      [ASPEED_DEV_FMC]       = 0x7E620000,
> @@ -222,6 +222,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>      memory_region_add_subregion(s->memory,
>                                  sc->memmap[ASPEED_DEV_SRAM],
>                                  &s->sram);
> +    memory_region_init_ram(&s->secsram, OBJECT(s), "sec.sram",
> +                           sc->secsram_size, &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SECSRAM],
> +                                &s->secsram);
>  
>      /* SCU */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
> @@ -401,6 +409,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
>      sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
>      sc->silicon_rev = AST1030_A1_SILICON_REV;
>      sc->sram_size = 768 * KiB;
> +    sc->secsram_size = 9 * KiB;
>      sc->spis_num = 2;
>      sc->ehcis_num = 0;
>      sc->wdts_num = 4;
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 9a5e3c0bac..bd1e03e78a 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -71,6 +71,7 @@ struct AspeedSoCState {
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
>      EHCISysBusState ehci[ASPEED_EHCIS_NUM];
>      AspeedSBCState sbc;
> +    MemoryRegion secsram;
>      UnimplementedDeviceState sbc_unimplemented;
>      AspeedSDMCState sdmc;
>      AspeedWDTState wdt[ASPEED_WDTS_NUM];
> @@ -105,6 +106,7 @@ struct AspeedSoCClass {
>      const char *cpu_type;
>      uint32_t silicon_rev;
>      uint64_t sram_size;
> +    uint64_t secsram_size;
>      int spis_num;
>      int ehcis_num;
>      int wdts_num;
> @@ -143,6 +145,7 @@ enum {
>      ASPEED_DEV_SCU,
>      ASPEED_DEV_ADC,
>      ASPEED_DEV_SBC,
> +    ASPEED_DEV_SECSRAM,
>      ASPEED_DEV_EMMC_BC,
>      ASPEED_DEV_VIDEO,
>      ASPEED_DEV_SRAM,
> -- 
> 2.38.1
> 

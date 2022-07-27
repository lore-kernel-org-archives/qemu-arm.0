Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp456066lfg;
        Wed, 27 Jul 2022 11:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDYwchfmuXS4Q4VmvxkjwvzSSljFyCBLIcOjkvqF8T9UJKkB9ezsGXBvkA/bdR1lcqz5qd
X-Received: by 2002:a05:6214:c4b:b0:474:254c:df47 with SMTP id r11-20020a0562140c4b00b00474254cdf47mr20332740qvj.84.1658945376168;
        Wed, 27 Jul 2022 11:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658945376; cv=none;
        d=google.com; s=arc-20160816;
        b=MBtDUNMeiVHWS4zx8yB5kBPPIaGLO5TCkIm/F22RN6rfIS18FZmcZT0XgLqTROQh0k
         VHQ6sN+G11c7NsivPTYM4/RDprptFUZd/A5jyrKPAKxbzDjZrlimhRfhhxMiNj6H28fF
         93HbbTiTVwdHGSGI8EgOw5/b4T/4K78gDLDYkyOPC1ZwFbQfc1Tk2x2domjh20HRlIeA
         o7DoTLKO2Xed7QUIImm1OHNs80EIlk94bO+ke2XV3MuTlNA2uCSU0iws18hBW1ZzxUK8
         apLiS7UWMaUznY8J3xlovO4ssiPJN/4tthKb8daNnvr6Wkp2Fx+7XhilqX/KzIIGCGz0
         r67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=VxsAfHDLVkArDp3PLv6yizX3WBE44dQA0TMxD8PBX+8=;
        b=d7sQ4/8KtWa5nhO2H4S17+WOvz5o0ZL91990Yy4HNZ3COGqAeicWCACyxh7gq/2FZD
         4dvKU+M7hHS69gEFT6gDSztaOp3HjIn2FPCkw4eFvIhS8LmZv5n6UIqSFarSn0qAfXKZ
         YO/SojuDVTB7YKWKdKE1XWQkN18d1+VOxrJgcvT7Z0Bt3lPnv+nbC9pNFA06GoxdhJTi
         Ab33ArbNdfgRp4xakbacOnFypP18NJSI0TfsUJqkxoT8mg37MOQz3vv0x1Yrll7t4FPP
         QtopB10mEpoeBruo/Y84cft6gBFX4nrkmkrEoDqz2tvooPKsmdFEP9gTmcuZSPS+TKXy
         HK9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=OvqlxMfi;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=tscf0G6n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020ad45bc3000000b0047339576991si3788643qvt.271.2022.07.27.11.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jul 2022 11:09:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=OvqlxMfi;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=tscf0G6n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGlTT-0001ku-JC
	for alex.bennee@linaro.org; Wed, 27 Jul 2022 14:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oGlTA-0001ga-3D; Wed, 27 Jul 2022 14:09:16 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oGlT7-0004hk-BL; Wed, 27 Jul 2022 14:09:15 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id E997A5804C5;
 Wed, 27 Jul 2022 14:09:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Jul 2022 14:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1658945349; x=
 1658948949; bh=VxsAfHDLVkArDp3PLv6yizX3WBE44dQA0TMxD8PBX+8=; b=O
 vqlxMfictm3RzCq5bSJR/LMnSjC53YObViEiqupASvU/qkANrBQ8PWm18JlkEDXy
 mGCAFA/YynMwTVoj8TcKWEkymeTC/LHUUvy+MpXCD5GkdxUYBIP+tAh4YgLV7hrk
 AHi8s99rO7+aRknxePRqK352AWh3bAF6A2k5xBwqhqdDU5utD1oB5m1sVOwhyTkO
 wP3vJTe/uMTW7zdDCoX+mhqkyenLj12wBYqZklWplNX78i8j3mU/wHNLLmExWw1F
 EiJ0Pi6rcMdnz8l8ZbrD4bcy9wWh2xDyXz7H1bkfZag9b0+Ekl8QjJSEpiCtbXUJ
 RfU8kEZZIC9KIgwVnHAOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658945349; x=
 1658948949; bh=VxsAfHDLVkArDp3PLv6yizX3WBE44dQA0TMxD8PBX+8=; b=t
 scf0G6nDGLauKlcyex+YCzGGNOQgOTe/8nlZmRP/BxO/UmubPg/eMGyLdoGUxuh+
 sSrL7ZaA02KMhlwzKiyluLMQ02gW6P86gphHWFJPR5ni4YVIP3mmfHe6421pJwAt
 2KS1U6MF52ob8nTosObabMkx03s36cJ7ltnd+PRewwtmgXNT35ycgtt8AdY+YQln
 k9AGOgzbG7nqja1NlVqvmQqkceq/mbKDtSBWriIYVq4AeRuFRpRsrlFlDUw6ceeo
 tb1V8LF91C15+BIbU89y4SAvwCUsBXacXvCdhw1cQ5l9xeq1bK6RuzcEBmnGq5Km
 G4XgkqcZDUiySL2UteTIA==
X-ME-Sender: <xms:RH_hYvs2kwftvNapYEjrJuveySWPYAmMbzPi2Nwqi-HjChX2sGC5fQ>
 <xme:RH_hYgcHbh4qi4NiOMM0JWJfpVdWGW2NauUDCWT1DmH9sMqrBh4BflYMYH9UfzHN_
 HZsPVp_CeL1vyZ5qQg>
X-ME-Received: <xmr:RH_hYiyg_VJljRmpDeVbz1IVvP5jn76x58xSaD78UGDUlG_BYjzN4nhyM2cVu2QCm5dvsHHADFZt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduvddguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepgfeukefftdeutefgheetffeltdeuhefgheegleefudejfefhffetkedv
 tdefteetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:RH_hYuMmWEnTYCqheI3hTmYi7xOvTCoaiUuI2GFcvBUihXVK55BYRw>
 <xmx:RH_hYv9EAF2aJma7ubwv1WJkH0Vb_e2GJ9uMJbpDODSfZm6Q86JK0A>
 <xmx:RH_hYuUWFRXfeTyd66QblpNPz3lT2MiUAkaVdy7SqKYbkOupBPF_5Q>
 <xmx:RX_hYrbXUXaPhJNai967j7X2EmiEVaQB82vsmGlUWoIZ14IwB4hTIg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 14:09:07 -0400 (EDT)
Date: Wed, 27 Jul 2022 11:09:06 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 6/9] aspeed: Add AST2600 (BMC) to fby35
Message-ID: <YuF/QguEYUr1n02H@pdel-fedora-MJ0HJWH9>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-7-peter@pjd.dev>
 <69fc7600-052b-a077-27b0-da5751ca3379@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fc7600-052b-a077-27b0-da5751ca3379@kaod.org>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2o4a3tH5iNl8

On Wed, Jul 27, 2022 at 12:05:58PM +0200, Cédric Le Goater wrote:
> On 7/5/22 21:13, Peter Delevoryas wrote:
> > You can test booting the BMC with both '-device loader' and '-drive
> > file'. This is necessary because of how the fb-openbmc boot sequence
> > works (jump to 0x20000000 after U-Boot SPL).
> > 
> >      wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
> >      qemu-system-arm -machine fby35 -nographic \
> >          -device loader,file=fby35.mtd,addr=0,cpu-num=0 -drive file=fby35.mtd,format=raw,if=mtd
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > ---
> >   hw/arm/fby35.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 41 insertions(+)
> > 
> > diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> > index 03b458584c..5c5224d374 100644
> > --- a/hw/arm/fby35.c
> > +++ b/hw/arm/fby35.c
> > @@ -6,17 +6,55 @@
> >    */
> >   #include "qemu/osdep.h"
> > +#include "qemu/units.h"
> > +#include "qapi/error.h"
> > +#include "sysemu/sysemu.h"
> >   #include "hw/boards.h"
> > +#include "hw/arm/aspeed_soc.h"
> >   #define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
> >   OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
> >   struct Fby35State {
> >       MachineState parent_obj;
> > +
> > +    MemoryRegion bmc_memory;
> > +    MemoryRegion bmc_dram;
> > +    MemoryRegion bmc_boot_rom;
> > +
> > +    AspeedSoCState bmc;
> >   };
> > +#define FBY35_BMC_RAM_SIZE (2 * GiB)
> > +
> > +static void fby35_bmc_init(Fby35State *s)
> > +{
> > +    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
> > +    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
> > +                           FBY35_BMC_RAM_SIZE, &error_abort);
> 
> A MachineState object is used as a owner of the RAM region and this
> should assert in memory_region_init_ram() :
> 
>     /* This will assert if owner is neither NULL nor a DeviceState.
>      * We only want the owner here for the purposes of defining a
>      * unique name for migration. TODO: Ideally we should implement
>      * a naming scheme for Objects which are not DeviceStates, in
>      * which case we can relax this restriction.
>      */
>     owner_dev = DEVICE(owner);
> 
> It went unnoticed until I started experimenting with some MachineState
> modifications. CONFIG_QOM_CAST_DEBUG needs to be defined to catch the
> error. I would have thought that CI was doing this check. It seems not,
> which is surprising.

Hmmm! I see, didn't realize this was a requirement. Thanks for catching it!

> 
> Anyhow, this needs a fix for 7.1 and I will work on it.

I see, yes, thanks!!

> 
> C.
> 
> > +
> > +    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
> > +    object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
> > +                            &error_abort);
> > +    object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
> > +                             &error_abort);
> > +    object_property_set_link(OBJECT(&s->bmc), "dram", OBJECT(&s->bmc_dram),
> > +                             &error_abort);
> > +    object_property_set_int(OBJECT(&s->bmc), "hw-strap1", 0x000000C0,
> > +                            &error_abort);
> > +    object_property_set_int(OBJECT(&s->bmc), "hw-strap2", 0x00000003,
> > +                            &error_abort);
> > +    aspeed_soc_uart_set_chr(&s->bmc, ASPEED_DEV_UART5, serial_hd(0));
> > +    qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
> > +
> > +    aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
> > +}
> > +
> >   static void fby35_init(MachineState *machine)
> >   {
> > +    Fby35State *s = FBY35(machine);
> > +
> > +    fby35_bmc_init(s);
> >   }
> >   static void fby35_class_init(ObjectClass *oc, void *data)
> > @@ -25,6 +63,9 @@ static void fby35_class_init(ObjectClass *oc, void *data)
> >       mc->desc = "Meta Platforms fby35";
> >       mc->init = fby35_init;
> > +    mc->no_floppy = 1;
> > +    mc->no_cdrom = 1;
> > +    mc->min_cpus = mc->max_cpus = mc->default_cpus = 2;
> >   }
> >   static const TypeInfo fby35_types[] = {
> 

Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1187547lfm;
        Wed, 15 Jul 2020 23:07:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMCTCVyp9Bi7+Jfn3+2FUWnv5p7DY6gWAPVGJsnoUUp0zPByiNOh87dw4koS/nZNzPAZaB
X-Received: by 2002:a25:570b:: with SMTP id l11mr4190675ybb.246.1594879671674;
        Wed, 15 Jul 2020 23:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594879671; cv=none;
        d=google.com; s=arc-20160816;
        b=Xz90QaxH0mlROGBE4gFwJJMZn9+w9xRhBQC58OPSljh3RcpA5olriCLXfLKkQAZSCJ
         ROMUcY55KrM57LOT2nigO0OCOKWoCF2vfTPzzgUFW4lUdG/a9uG3X4CzbiRZgyLPYUfO
         rNW/falRYapacNKIHEJOqdEHiNRJgLKz3FAkXLaKMjLAbKROPXwKLO9+t5392Lk02e54
         +GcR+YLDXnnqJH3KvGWUM9rd7YslfdMMoSRJjy+kfrm6EAFTeGPyokW+Jd+OEEcFBzWT
         0Ca5V9XGCapRNFfOBnRrKHswWLda7skJKG0VGLtRRmnAWbTdVtlHlb2K15SYWuoT8op0
         ODLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=LfASV8eRLJim9uFQd00DEvcapIJmHGCOKoNegylpOs8=;
        b=vhJ1H+rr+8SLUnvpndqbUwuns3LNTgYNNGC5/ThT0R5fr1yepfa/Mo0mcAQPhOMbMr
         MLAwYb/3o1DbsWD8BwXgexumULzbcZZX/4ZbanUjj2bBwWH4ScRJBsYmdVSVRFfNQvAZ
         +yElom5U1Z/jpWzxPKreQ42Z8z+cjC9A9/bE+k3Istzz6FaLk7T2f1K9WF3FPgW921yq
         Y/CVdehSuMxLdMvEPk3KQeDnVxU0SRgMfj+r2zwEnCcSnD9DWhqbSW7tS7gb7U+LH7m1
         hDKp4qXBoLKbUl4H7hyTMS74030v6j1x3yO9qR7HOxXCdG+y+1Ctu+mPe9Ck3tzW94Cn
         dbLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si4751468ybl.67.2020.07.15.23.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 23:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvx3f-0000fe-2N
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 02:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jvx32-0000F7-EP
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 02:07:12 -0400
Received: from 6.mo7.mail-out.ovh.net ([188.165.39.218]:59153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jvx30-00025z-FZ
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 02:07:12 -0400
Received: from player778.ha.ovh.net (unknown [10.110.171.125])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3390C16EA11
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 08:07:06 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-1163-216.w90-76.abo.wanadoo.fr
 [90.76.222.216]) (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 6D6681467E9A0;
 Thu, 16 Jul 2020 06:06:57 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00411f495fb-f0a1-4623-9cd1-f33dd25c4f8b,2A9D1999911B15737EB689736E4AAE1772229697)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2] hw/arm/aspeed: Add board model for Supermicro X11 BMC
To: erik-smit <erik.lucas.smit@gmail.com>
References: <20200715173418.186-1-erik.lucas.smit@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b3c8ef39-5a1e-c49d-6ab8-342f42be088c@kaod.org>
Date: Thu, 16 Jul 2020 08:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200715173418.186-1-erik.lucas.smit@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17188550929903225664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfeefgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpledtrdejiedrvddvvddrvdduieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.39.218; envelope-from=clg@kaod.org;
 helo=6.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 02:07:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s57L3m2uw07U

On 7/15/20 7:34 PM, erik-smit wrote:
> Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
> Changed in v2:
>  - matched aspeed_machine_supermicrox11_bmc_class_init function name to
>    machine name
> 
>  hw/arm/aspeed.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 379f9672a5..ef042471be 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -57,6 +57,20 @@ struct AspeedMachineState {
>          SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
>          SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>  
> +/* TODO: Find the actual hardware value */
> +#define SUPERMICROX11_BMC_HW_STRAP1 (                                   \
> +        SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_128MB) |               \
> +        SCU_AST2400_HW_STRAP_DRAM_CONFIG(2) |                           \
> +        SCU_AST2400_HW_STRAP_ACPI_DIS |                                 \
> +        SCU_AST2400_HW_STRAP_SET_CLK_SOURCE(AST2400_CLK_48M_IN) |       \
> +        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
> +        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
> +        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN) |                \
> +        SCU_AST2400_HW_STRAP_SET_CPU_AHB_RATIO(AST2400_CPU_AHB_RATIO_2_1) | \
> +        SCU_HW_STRAP_SPI_WIDTH |                                        \
> +        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
> +        SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
> +
>  /* AST2500 evb hardware value: 0xF100C2E6 */
>  #define AST2500_EVB_HW_STRAP1 ((                                        \
>          AST2500_HW_STRAP1_DEFAULTS |                                    \
> @@ -600,6 +614,23 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>  
> +static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
> +                                                        void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Supermicro X11 BMC (ARM926EJ-S)";
> +    amc->soc_name  = "ast2400-a1";
> +    amc->hw_strap1 = SUPERMICROX11_BMC_HW_STRAP1;
> +    amc->fmc_model = "mx25l25635e";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 1;
> +    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
> +    amc->i2c_init  = palmetto_bmc_i2c_init;
> +    mc->default_ram_size = 256 * MiB;
> +}
> +
>  static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -728,6 +759,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_palmetto_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("supermicrox11-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_supermicrox11_bmc_class_init,
>      }, {
>          .name          = MACHINE_TYPE_NAME("ast2500-evb"),
>          .parent        = TYPE_ASPEED_MACHINE,
> 


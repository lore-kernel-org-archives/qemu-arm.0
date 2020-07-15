Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp511226lfm;
        Wed, 15 Jul 2020 06:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/4pHKy/nMLafquYfmF+I95nFc3kiu059tZ45+7LBpEz8UjUUW0x5b0IJ/2LfG3JWyNpqj
X-Received: by 2002:a67:ec8f:: with SMTP id h15mr6538125vsp.98.1594818439842;
        Wed, 15 Jul 2020 06:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594818439; cv=none;
        d=google.com; s=arc-20160816;
        b=ezmnRhNx7ULVRdkDRSDI2/qnPTED9WY5X8S8V8TP6kLBhTaXeIgAVHPcx/Pt5mL2+E
         rH8w6ycyOaJY1fTwpsrBGU9CAGNBHlU0/JrVxv92tbqDuraPysD5/cpySoQcIpwoCYjB
         cZ32nyrCMD0oFUW77jEz3sIBcD4YLZdglbwCyUQV3RQbYvGGO49/5RNQ9yr1zsthNAuP
         6JDXWfBWMtFTOh5flzjD4FFcfHeOneOQEUiodgRGvneR55xmicSBlnOfNNlKI1NpjXnx
         QSAG1RHs6l8g0kCcLM8oH6OSgt7pXs4MEtFSejijJceE9qqzpasbeF9aHbUYF0lCKha/
         EiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=XVsHOs8/ZgrbOx22Pm+iPeRgEUzw3u7Zo8JHuKLpYVA=;
        b=YoDMxKxHQB8fN81SxY6q+msmf6abj41K4LgUsyW0+Qj8YPIMxk03WuMOtZu4391pIM
         vBesnLyxQ5WOfWheBY2hsdHrhcG+BNY0ijYpJXGRjc5BNUp7rxt75tkJbGTqHBOTNQOz
         L3Jygm4GtlpOs8i7HGa/2zYZX2tb6g35n3cMT9ilRxvTlCeob0s9pHb/VGrkrlvTw1aV
         ZoxShUcfhmNrf1TtH87s1Nn/Nzp/L5Gl9/yJPpcBSf5hUHTj0bt5yH0Ji/yXpMKRbZGV
         0c6iTpAYpKSWzVd3Rm/nxsN8doF6BxI2W12Ua4/q0dTvq8sWdCXegvz68ObEiLSPpUfD
         TmLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si249387vsq.191.2020.07.15.06.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 06:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvh83-0004n7-68
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jvh7v-0004mC-7T
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 09:07:11 -0400
Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jvh7r-0004MA-Up
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 09:07:10 -0400
Received: from player760.ha.ovh.net (unknown [10.108.35.90])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 6E76413B43C
 for <qemu-arm@nongnu.org>; Wed, 15 Jul 2020 15:07:05 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-1163-216.w90-76.abo.wanadoo.fr
 [90.76.222.216]) (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id AF603146088DE;
 Wed, 15 Jul 2020 13:06:57 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00294115017-e106-4692-96f8-6419b92a0bb1,D1878713575E7557A8ED5F979EF3ECB62B482302)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] hw/arm/aspeed: Add board model for Supermicro X11 BMC
To: erik-smit <erik.lucas.smit@gmail.com>
References: <20200714203604.5676-1-erik.lucas.smit@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <be8642a8-7fcd-db96-98e8-4f98bf736992@kaod.org>
Date: Wed, 15 Jul 2020 15:06:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200714203604.5676-1-erik.lucas.smit@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18408744955681016640
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfedvgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfffgeelfeejudevuedvvdeigeduteetveffhfffudeggfegleeljeeuieefuedvnecukfhppedtrddtrddtrddtpdeltddrjeeirddvvddvrddvudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeitddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.72.238; envelope-from=clg@kaod.org;
 helo=9.mo177.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/15 09:07:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sYIMaCEmCmHX


> Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
> -- 
> checkpatch was complaining about the length of
> aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc, void *data)

in which way ? line too long ? If so, you can insert a return inside
the parameter list.

> so I renamed it to aspeed_machine_smx11_bmc_class_init. Not sure if
> that's the right way to go, since then it's out of sync with the machine
> name "supermicrox11-bmc". But renaming the machine name to "smx11-bmc"
> makes it less descriptive...

You should put the patch comments below the '---' 
 
> ---
>  hw/arm/aspeed.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 379f9672a5..e74a89f427 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -57,6 +57,20 @@ struct AspeedMachineState {
>          SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
>          SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>  
> +/* TODO: Find the actual hardware value */

If you can access the BMC console, you can do that from u-boot.

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
> @@ -600,6 +614,22 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>          aspeed_soc_num_cpus(amc->soc_name);
>  };
>  
> +static void aspeed_machine_smx11_bmc_class_init(ObjectClass *oc, void *data)
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
> @@ -728,6 +758,10 @@ static const TypeInfo aspeed_machine_types[] = {
>          .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>          .parent        = TYPE_ASPEED_MACHINE,
>          .class_init    = aspeed_machine_palmetto_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("supermicrox11-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_smx11_bmc_class_init,
>      }, {
>          .name          = MACHINE_TYPE_NAME("ast2500-evb"),
>          .parent        = TYPE_ASPEED_MACHINE,
> -- 
> 2.25.1


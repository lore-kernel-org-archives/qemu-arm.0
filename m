Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp350323lfo;
        Fri, 4 Mar 2022 23:58:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYqggvpOg0d5uJpSYMCHJoGSu1ZHn03PCq4LoTzPUpdK4HaBYBO5uMeilfPBM9uEgaJiQm
X-Received: by 2002:a05:620a:1a1d:b0:648:af1f:90d7 with SMTP id bk29-20020a05620a1a1d00b00648af1f90d7mr1395337qkb.340.1646467089611;
        Fri, 04 Mar 2022 23:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646467089; cv=none;
        d=google.com; s=arc-20160816;
        b=pN3muLWQ380rxwbL3d5BxpwxqAWmuy2r9gYFhjPYmawIaAl/2dx66Ii8J4S4ReiuiL
         Cm3AvEycXMKBGdsnBHgVBDYjcNM2lagwBSsSgZcP6LQMHzX07rLZps/IhHyPXwlOMF5Q
         5fsioJ8gOlb0nLE/1ySTClCHEJ6CbntLV+ZqrNJloUkPHOB/xYc5Mph2p7wO88qs+GBS
         eE66DuSwRpmS2ZuFWPMqTJqKLhz3IqxX7A1GX8O1AIyPeFXfq2D8ekemAGi0wf89EpfK
         wpXhjC6ZDskWYA1k6mzIpITdNC35eR23hchhnUPm/CfAMiKh3lYsuzEuCmgzx10PnmsW
         jJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=mDOPLJK9CPdX7KtvqJ6ESYRmxU40F4/NyQ5lt48ysg8=;
        b=RivfnekYxqj3KYcOinETNQxwtqaRHeLk2KRaCDVPq5+w0yI51sZdQnaozcJDZZOnrH
         EICnKJZw12SpbsjxZVtRGDKvgfo12q3y0sO55yOTEcXAnrn3CWZedA8k9TjU5aGV+R6K
         D8aClbfa9ubj2EgHTlTvAbE0BZ2XlpFnqEk+NlSIT+YN8OWK/JJVdFyrEFJnuMq8f4Ws
         O0xckZq5qVjqoAiJeH+Pf+1weMOmAQ+GUj+yL/B8qwPbHz3RbuVohR5Amd71P4n6I7VG
         ANlYS8VEgzFWqYBEeBD1bgYXDueNCXgTMCejYrdxRA11ZTV5q3+TkYZWh8D1EvbsYJgf
         EBmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy12-20020a0562140f6c00b004352bfec8b9si3261062qvb.279.2022.03.04.23.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 23:58:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQPIn-0004yn-4x
	for alex.bennee@linaro.org; Sat, 05 Mar 2022 02:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPIZ-0004rn-58
 for qemu-arm@nongnu.org; Sat, 05 Mar 2022 02:57:55 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:43149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPIX-0008Fc-4x
 for qemu-arm@nongnu.org; Sat, 05 Mar 2022 02:57:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 14CB520784;
 Sat,  5 Mar 2022 07:57:50 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 5 Mar
 2022 08:57:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0065ccc0f9e-eee0-4ecc-b8d3-52cbdc5c5628,
 A4EA2D8AEBB64B4F793E8EC0AE0C67A6646D724C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <790dd79a-4c5e-207e-86a9-9351694f0427@kaod.org>
Date: Sat, 5 Mar 2022 08:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] hw/arm/aspeed: add Bletchley machine type
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
 <20220305000656.1944589-2-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220305000656.1944589-2-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8f939cd6-bc2b-4539-a106-ecf81c9d94a4
X-Ovh-Tracer-Id: 1728537832650279718
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddujedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevhefhudfgteffvdffveetieefheekiedtkedthfehgfdvfeelkefhteeuheeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VBxg/RHDRWFl

On 3/5/22 01:06, Patrick Williams wrote:
> Add the 'bletchley-bmc' machine type based on the kernel DTS[1] and
> hardware schematics available to me.  The i2c model is as complete as
> the current QEMU models support, but in some cases I substituted devices
> that are close enough for present functionality.  Strap registers are
> kept the same as the AST2600-EVB until I'm able to confirm correct
> values with physical hardware.
> 
> This has been tested with an openbmc image built from [2] plus a kernel
> patch[3] for the SPI flash module.
> 
> 1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts?id=a8c729e966c4e9d033242d948b0e53c2a62d32e2
> 2. https://github.com/openbmc/openbmc/commit/b9432b980d7f63f7512ffbcc7124386ba896dfc6
> 3. https://github.com/openbmc/linux/commit/25b566b9a9d7f5d4f10c1b7304007bdb286eefd7
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>   hw/arm/aspeed.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 617a1ecbdc..3dc2ede823 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -167,6 +167,11 @@ struct AspeedMachineState {
>   #define FUJI_BMC_HW_STRAP1    0x00000000
>   #define FUJI_BMC_HW_STRAP2    0x00000000
>   
> +/* Bletchley hardware value */
> +/* TODO: Leave same as EVB for now. */
> +#define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
> +#define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
> +
>   /*
>    * The max ram region is for firmwares that scan the address space
>    * with load/store to guess how much RAM the SoC has.
> @@ -901,6 +906,54 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>       }
>   }
>   
> +#define TYPE_TMP421 "tmp421"
> +
> +static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +    I2CBus *i2c[13] = {};
> +    for (int i = 0; i < 13; i++) {
> +        if ((i == 8) || (i == 11)) {
> +            continue;
> +        }
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +
> +    /* Bus 0 - 5 all have the same config. */
> +    for (int i = 0; i < 6; i++) {
> +        /* Missing model: ti,ina230 @ 0x45 */
> +        /* Missing model: mps,mp5023 @ 0x40 */
> +        i2c_slave_create_simple(i2c[i], TYPE_TMP421, 0x4f);
> +        /* Missing model: nxp,pca9539 @ 0x76, but PCA9552 works enough */
> +        i2c_slave_create_simple(i2c[i], TYPE_PCA9552, 0x76);
> +        i2c_slave_create_simple(i2c[i], TYPE_PCA9552, 0x67);
> +        /* Missing model: fsc,fusb302 @ 0x22 */
> +    }
> +
> +    /* Bus 6 */
> +    at24c_eeprom_init(i2c[6], 0x56, 65536);
> +    /* Missing model: nxp,pcf85263 @ 0x51 , but ds1338 works enough */
> +    i2c_slave_create_simple(i2c[6], "ds1338", 0x51);
> +
> +
> +    /* Bus 7 */
> +    at24c_eeprom_init(i2c[7], 0x54, 65536);
> +
> +    /* Bus 9 */
> +    i2c_slave_create_simple(i2c[9], TYPE_TMP421, 0x4f);
> +
> +    /* Bus 10 */
> +    i2c_slave_create_simple(i2c[10], TYPE_TMP421, 0x4f);
> +    /* Missing model: ti,hdc1080 @ 0x40 */
> +    i2c_slave_create_simple(i2c[10], TYPE_PCA9552, 0x67);
> +
> +    /* Bus 12 */
> +    /* Missing model: adi,adm1278 @ 0x11 */
> +    i2c_slave_create_simple(i2c[12], TYPE_TMP421, 0x4c);
> +    i2c_slave_create_simple(i2c[12], TYPE_TMP421, 0x4d);
> +    i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
> +}
> +
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>   {
>       return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -1224,6 +1277,26 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +
> +static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook Bletchley BMC (Cortex-A7)";
> +    amc->soc_name  = "ast2600-a3";
> +    amc->hw_strap1 = BLETCHLEY_BMC_HW_STRAP1;
> +    amc->hw_strap2 = BLETCHLEY_BMC_HW_STRAP2;
> +    amc->fmc_model = "w25q01jvq";

So we need this patch :

http://patchwork.ozlabs.org/project/qemu-devel/patch/20220304180920.1780992-1-patrick@stwcx.xyz/

May be I can take it through my queue.

> +    amc->spi_model = NULL;
> +    amc->num_cs    = 1;

There are two flash devices on the FMC. I can fix it inline since
it is the only change I would request.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> +    amc->macs_mask = ASPEED_MAC2_ON;
> +    amc->i2c_init  = bletchley_bmc_i2c_init;
> +    mc->default_ram_size = 512 * MiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +}
> +
>   static const TypeInfo aspeed_machine_types[] = {
>       {
>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1277,6 +1350,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("fuji-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_fuji_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_bletchley_class_init,
>       }, {
>           .name          = TYPE_ASPEED_MACHINE,
>           .parent        = TYPE_MACHINE,


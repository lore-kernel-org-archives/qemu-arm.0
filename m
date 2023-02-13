Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp727ejb;
        Sun, 12 Feb 2023 23:54:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8Hyd5IlgEpebvBGx2fHh4/DryCVwNy7vK4ngSo2eC8v3n6up50FBr6qhoJy8A6Vma5hNTu
X-Received: by 2002:ac8:5aca:0:b0:3a7:e2df:e868 with SMTP id d10-20020ac85aca000000b003a7e2dfe868mr44106080qtd.41.1676274886136;
        Sun, 12 Feb 2023 23:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676274886; cv=none;
        d=google.com; s=arc-20160816;
        b=jTikNhskkYudMj7R3pV91Lt8ga8fKn8VUnkhH+5nkrWnbFGcHoEXJ/rFO0OoBU0c9C
         /bFQZDRKcNZx3TCNqZAdce4RT47Z7VYsyuhjTkf4HFb+M6XSxk1au9kFBVU2gIH3oSwl
         ZiIuxxd+uqzNmoW18u1zqtONqQFIattIgJ+NLYAEHXRQ8Frz60sPcKX8xkl6j5HggmtY
         3vAvXherEX6/StCqWgnUNOorINO7pu7eoV1zZFuz+goet0VY8gtb63B+fSy9HVOBTZ4U
         nl0wRjO17XDXqrMjgBwU7HU0LcgKiIEynXsYwKduFmlFCBMOJmWjqOcTw87XLgvfxkRf
         Tg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=gzDucPRw8qpkrfIYUmrjUWcVL16D8/wS9B0uZ1IG7dg=;
        b=NKoktsqtIMicjmaCo+4yY30h3A8r2PF7NUUnIEaseTRHOHJX+rh/lteXHa/M3pNyu5
         JBJAh4n6i5jWbroBdBxpMf11kyLXxZENUwzwvaY+lH5yHMGA9Wk4kTrEs+4bBvJboqPe
         lQNacYhWbqJAlcJaCQ/Qg0Q0PCiVkTxqZf4uU+sA4SwGeg2oNViMZ096cYc4ZkBneeNZ
         715XPawO5fu6i1juUyqHY7NmYCok85vDZlWaulFBuvu2ygo3g2KgfaewRrA3IV9nfoV7
         Z8AxjNCjDMbVg6OjI/vJVrgBa/imHa9RGV1JohC0W9bzr3txMoRyFyDjPNfJ9+AX9iEq
         0xDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ac85994000000b003ba0d90cec7si8839031qte.281.2023.02.12.23.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 23:54:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRTfK-0007Qg-1u; Mon, 13 Feb 2023 02:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRTfI-0007Px-Ei
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:54:20 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pRTfG-0006PA-Lb
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:54:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.192])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B04B920B3D;
 Mon, 13 Feb 2023 07:54:14 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 13 Feb
 2023 08:54:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a4c2785b-6c7f-477c-a755-1540eefeef85,
 F14F4AD8ED0BD1E75D9128D0FAA1081513448E0E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <28f750f8-18ce-c8cb-eda0-fb40a5c64249@kaod.org>
Date: Mon, 13 Feb 2023 08:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] Adding new machine Tiogapass in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230210122641.837614-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230210122641.837614-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 49644780-9335-4513-8bc2-c24fdb0cb7f4
X-Ovh-Tracer-Id: 17052317042496080678
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeitddgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedthedtfeelvdeljeehueetheefudeivddvveektdelkeetieefteduveekkedugfenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpkhgrrhhthhhikhgvhigrnhduhedtleesghhmrghilhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 7QF6GoAbyQmW

Hello,

On 2/10/23 13:26, Karthikeyan Pasupathi wrote:
> This patch support tiogapass in QEMU environment.
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 27dda58338..279ba60743 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -521,6 +521,14 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
>                        TYPE_TMP105, 0x4d);
>   }
>   
> +static void fb_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    /* The FB board AST2500 compatible with ds1338 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
> +}
> +
>   static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1174,6 +1182,25 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +static void aspeed_machine_tp_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook Tiogapass BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
> +    amc->hw_strap2 = 0;
> +    amc->fmc_model = "n25q256a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->i2c_init  = fb_bmc_i2c_init;
> +    mc->default_ram_size       = 1 * GiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1562,6 +1589,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("ast2600-evb"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_ast2600_evb_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("tp-bmc"),

how about "tiogapass-bmc" for a machine name instead ?

Thanks,

C.

> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_tp_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


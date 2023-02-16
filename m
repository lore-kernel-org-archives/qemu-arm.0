Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp451217ejb;
        Thu, 16 Feb 2023 04:40:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/bw2N8oeR8n17XPXZCAt+JutL581KfrCNb6TQKATZ8Xch8c54Qwj/iBpveByqTuvK35Sp+
X-Received: by 2002:a05:6214:ac6:b0:56e:b6de:e782 with SMTP id g6-20020a0562140ac600b0056eb6dee782mr11150701qvi.29.1676551207900;
        Thu, 16 Feb 2023 04:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676551207; cv=none;
        d=google.com; s=arc-20160816;
        b=vuomfxXgs/Qq0lZtqI7vGjuE5CGCSpEbU/MhGfFrtCRRaDA1ehpqPNalpNuBQS7aBY
         azh690hq7JcwOhIhxTsdsHUOJzFaMTJ8Q911a4Ks4Qkq/2YCF6SWR/K83UIYCETOZzHf
         LBeQvDKNwgOFKpl11hHLtriiQ+4qGX2kjSNAHrQ7v2VzGWqUNdQu7FVyqluZOGi0bgfw
         zka+e8Rmv5INPU3VfjcKcB1vZ6XM7CWe6eUfJvwY7bT7MRIVH9gX5v1sPI7nLeIAeTcF
         t1Yw5GuDBlMyaNMWQZt7NCBER0lRXhSyEYuXZelqPdCFsa4JDrFa+L//D8N2jT7ADmXZ
         yDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=XP1Zab3rKAoAJio3ZEeYpLgiwh9wHYjFZo8Rz+yK2EI=;
        b=ndJJ4rPZxVVnnJCUaaJWeMyHe9ifcl7AEFZ2UrN5z7iKL4yMkK0zUd9GBJPCcU1Q13
         saDIVCSltKdW/HSV+fNRfWvR7bv2d146OPD+DSLwTGdzxiNayCUKVBGwCTU0PNGenYLV
         74As9a7zk79ymtZpToFTgsQh1aUQ2Uf85dk6fxC/OtJOVaoyk4JdKk12uWlDCQi3fol7
         v5ZtxJVy4Zq7QR9NhBjtruK/uHd6ldwL3e8RJz9eKRoQ5QX1d2mMp4TZKlaOZvft+8x0
         7ePP3FNIrEqjOU/nR0LmuZ6qX21A3wW9io0X5MMU9pXbvpgvjzuJSOW0gqFXEBcR3YxB
         LtfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q49-20020a05620a2a7100b0073ba21a47cfsi109727qkp.352.2023.02.16.04.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 04:40:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSdYC-00010U-Pl; Thu, 16 Feb 2023 07:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSdY7-000102-UX
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:39:43 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSdY5-0006Kb-Fw
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:39:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.103])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 301AD212B2;
 Thu, 16 Feb 2023 12:39:30 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 16 Feb
 2023 13:39:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004c631a52a-5d32-4820-ace7-c9b2d67f5eb4,
 6472B0FD1AC4FAE7C483658EB00F62ED22160684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6b7573b4-d8be-02df-5132-47f55983d049@kaod.org>
Date: Thu, 16 Feb 2023 13:39:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230216104934.192713-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230216104934.192713-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b30bbc04-5a06-4515-9f72-2730e0f1a7a3
X-Ovh-Tracer-Id: 2594636339190139686
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehtdefledvleejheeuteehfeduiedvvdevkedtleekteeifeetudevkeekudfgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpkhgrrhhthhhikhgvhigrnhduhedtleesghhmrghilhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: hef9lyAU4dnm

On 2/16/23 11:49, Karthikeyan Pasupathi wrote:
> This patch support Yosemitev2 in QEMU environment.
> and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
> along with the machine support.
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c        | 38 ++++++++++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h |  3 +++
>   3 files changed, 64 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 27dda58338..35ff29b752 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -521,6 +521,22 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
>                        TYPE_TMP105, 0x4d);
>   }
>   
> +static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    I2CBus *i2c[16];
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }

You don't need the loop.

> +
> +    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
> +
> +    at24c_eeprom_init_rom(i2c[8], 0x51, 128 * KiB, fbyv2_bmc_fruid,
> +                          fbyv2_bmc_fruid_len);
> +}
> +
>   static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1174,6 +1190,24 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +static void aspeed_machine_fbyv2_class_init(ObjectClass *oc, void *data)

There are no naming convention for the machine but it is better practice
to keep a common name: aspeed_machine_yosemitev2_bmc_class_init instead ?
the bmc suffix is not that important.

> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
> +    amc->hw_strap2 = 0;
> +    amc->fmc_model = "n25q256a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->i2c_init  = yosemitev2_bmc_i2c_init;
> +    mc->default_ram_size       = 512 * MiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1562,6 +1596,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("ast2600-evb"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_ast2600_evb_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("yosemitev2-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_fbyv2_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
> index 04463acc9d..807036d416 100644
> --- a/hw/arm/aspeed_eeprom.c
> +++ b/hw/arm/aspeed_eeprom.c
> @@ -77,6 +77,29 @@ const uint8_t fby35_bmc_fruid[] = {
>       0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
>   };
>   
> +// Yosemite V2 BMC FRU

Please keep the C comment convention.

> +const uint8_t fbyv2_bmc_fruid[] = {

same comment on the name.

Thanks,

C.

> +    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
> +    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
> +    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
> +    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
> +    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
> +    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
> +    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
> +    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
> +    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
> +};
> +
>   const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
>   const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
>   const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
> +
> +const size_t fbyv2_bmc_fruid_len = sizeof(fbyv2_bmc_fruid);
> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
> index a0f848fa6e..14d2533a28 100644
> --- a/hw/arm/aspeed_eeprom.h
> +++ b/hw/arm/aspeed_eeprom.h
> @@ -16,4 +16,7 @@ extern const size_t fby35_nic_fruid_len;
>   extern const size_t fby35_bb_fruid_len;
>   extern const size_t fby35_bmc_fruid_len;
>   
> +extern const uint8_t fbyv2_bmc_fruid[];
> +extern const size_t fbyv2_bmc_fruid_len;
> +
>   #endif


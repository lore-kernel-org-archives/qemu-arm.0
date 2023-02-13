Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp5294ejb;
        Mon, 13 Feb 2023 00:03:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8+wOfY8fQykJW2LUNt6d6G4qiIBNnaifGl4gGdS2exOmouQP9Nx0raO7yOqCkT0zcIfM3w
X-Received: by 2002:ac8:5892:0:b0:3a8:1ba:b8ab with SMTP id t18-20020ac85892000000b003a801bab8abmr44138849qta.6.1676275426012;
        Mon, 13 Feb 2023 00:03:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676275425; cv=none;
        d=google.com; s=arc-20160816;
        b=KjLb+TSgi+HIvkjV/Urp7Tag1zPhDCqJC8GvackheM9e+epw6IvA/nxf4aHD34NT/u
         YobXtFCHL0Kr6IG9f5kW/OUpfxKmpru3mo2tYasBskziQ2Uh7CZOrxYmaFa7l3khlPvT
         CF08eLgQXX4br83AKpLkB7NOKE7bS6G0nOsWrjId8lFw2ezZ4R70APbnTJlUmxZzX1i+
         u9e95bjdoH1pneQSQq6VUwMMpwM+Vfqlk2dhlde/OMimyN8Tth064BZli4SQj2QDCAir
         PUSDaQ4UY4aCPp1tOOTNkNDhRu2cRo1q5sZ1b9Xa1YpsKEm55QwFB8K/dh3jA2XzqciM
         zVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=RCCKJCmFn0vbHqB8rNIEqXcIw0qIWVJ6IGSix2pOlt8=;
        b=WvMpLu8mOFV4dx2hiAfvg7tfQYMIJELbtUNudNBSRAHjY11c1d/uEEglLCc5HR5hBj
         mXKPdg+HuM7P8S3MeD+OmuCzMt2E8Hix0sNMxnUDcoqkyqbxLnwUUnh4YIue2uNjJ5B6
         Vd8eB0aQbrT7S0Ptoo3YRmoigwoNcJO0zXt+YQ5kdBE7gpGvdVzOJNzeYZepx5yEq7Hl
         kb8kIefGbln50uIWQCFm0KzvL7u4DZKzKlUa52bxQB9R4MJlp1KJTlROdMczuXzCpXk2
         iXHzjLlcAVvQ71jNJEZohDBZcFQRe9ceF8kvzPqpNFaZMssV7WyVSPtQh8MbCrYANRrN
         YNLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a05622a034400b003bbd8bdb934si4711579qtw.792.2023.02.13.00.03.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 00:03:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRTo4-00013H-LK; Mon, 13 Feb 2023 03:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pRTo3-000133-KZ; Mon, 13 Feb 2023 03:03:23 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pRTo1-0000my-Le; Mon, 13 Feb 2023 03:03:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9A72420AF8;
 Mon, 13 Feb 2023 08:03:15 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 13 Feb
 2023 09:03:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003d96f7739-ba93-4ff9-b2c7-c26685e780ae,
 F14F4AD8ED0BD1E75D9128D0FAA1081513448E0E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e16436c5-585d-1a9b-1d62-249922e924c6@kaod.org>
Date: Mon, 13 Feb 2023 09:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230210125028.839131-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230210125028.839131-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a9686246-b5d7-4b1c-8057-c95fd2d1ee79
X-Ovh-Tracer-Id: 17204595003649067814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeitddguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgfefgfeetjeffteffjeehteeugefhieduteefjedtgfefudejteffveejheefgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhkrghrthhhihhkvgihrghnudehtdelsehgmhgrihhlrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.348,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: EatEjjel6e54

Hello,

On 2/10/23 13:50, Karthikeyan Pasupathi wrote:
> This patch support Yosemitev2 in QEMU environment.

It looks OK apart from the naming. Could we call it "yosemite2-bmc" instead ?

Thanks,

C.


> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 27dda58338..74dc07190d 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -536,6 +536,14 @@ static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)
>                               TYPE_PCA9552, addr);
>   }
>   
> +static void fb_bmc_i2c_init(AspeedMachineState *bmc)

The same routine name is proposed in the tiogapass patch :

   https://lore.kernel.org/qemu-devel/20230210122641.837614-1-pkarthikeyan1509@gmail.com/

Do you have plans to populate the I2C buses differently ?

> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    /* The FB board AST2500 compatible with ds1338 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
> +}
> +
>   static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1191,6 +1199,24 @@ static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +static void aspeed_machine_fbyv2_class_init(ObjectClass *oc, void *data)
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

same as tiogapass ?


> +    amc->num_cs    = 2;
> +    amc->i2c_init  = fb_bmc_i2c_init;
> +    mc->default_ram_size       = 512 * MiB;
The RAM size is the only difference with the tiogapass and one could use the
-m machine option instead.

Thanks,

C.
   

> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1554,6 +1580,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_sonorapass_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("fbyv2-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_fbyv2_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("witherspoon-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


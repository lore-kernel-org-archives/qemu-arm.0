Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2495733lft;
        Mon, 27 Jun 2022 09:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sq2F7el/8LmAFb0qfd4KF/YUGZYuevS7WYst0a11KNrf5ykSVjyXbw/tvdxTB2l/H8H47m
X-Received: by 2002:ac8:5f0f:0:b0:305:1fc0:482 with SMTP id x15-20020ac85f0f000000b003051fc00482mr9659622qta.121.1656346662298;
        Mon, 27 Jun 2022 09:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656346662; cv=none;
        d=google.com; s=arc-20160816;
        b=MqLNNHxY3lEgvY4Ure2mRmDJqUVpBKDAqs0taEN6OLtsHjl6ZK95G45qrfV5k0vDH2
         Sy62s0Tl7vqpvOy/4ZCaZPvXjHGx87/aGl7O68niL/u9KzkUBYfc4gLRVDj9EH4QcMFR
         NInd2FuLrW8zarGfjgZ4faGw8q8F6jeE+HKPemo2YaKSoCSxkNAxM3JzRsH7PvCQCIRk
         aQgoOR6WGc99oLzu3vSNjIHQneMNHuKXX7tem5FGs1qT4t7vvXPXa76uQn2z85Cexwx0
         5IlDOCbqMiJV9uiqyU1p/jUK4sqpa11VfsslG1LRxrcoih1eQfPc8GrTUk4PtSu3z6Dj
         AsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=zYfR0qRaVIzHiHWdohaM6lRKr7l8aSlo36v5PcvTiHA=;
        b=jnt/Gmbh9UmpM1alRo7+V4FL2UujOUnXLvXR5kxscREIjZ1udn+Rud4wdwElHSw3Qc
         S3Lr9np72d9bNDkx2OnpPJCFoo5d4XNDR0GhnnMK95280M8uDuZw/SqsHz2xU8pUdEl0
         sZ1KRZ/JiaAkUtxKhUmlYJXkzi5IsjaVY/Nzpe1UTOxq13iLugoaK2A4t9BNj498X1e/
         l/ID03EAQDOq0TA56kyBo0c5FqgxKOCGDCgaYccsEol5IjxryqnaY4qKi1smaXaYAICG
         1PfMb2KwgYUR7HUWYhzHQbeTfiniS6whfcK/iKHYfvN6QFbFehzMzFmEAniPCel3VKeQ
         JcUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a379101000000b006a6b3f6ca4asi5556733qkd.376.2022.06.27.09.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rQj-0002Ob-LL
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rAI-0007Yz-Li
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:00:44 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:36175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rAB-0007Uk-EM
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:00:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 25BC925727;
 Mon, 27 Jun 2022 16:00:32 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:00:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006e64a03c8-3619-4180-8762-465da036d131,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f9b4d8ea-b11d-b970-feed-b1d0f7f9df78@kaod.org>
Date: Mon, 27 Jun 2022 18:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/7] hw/arm/aspeed: add Qualcomm Firework BMC machine
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-3-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-3-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5bd17100-aa82-4bf3-97e1-5d3a61ef8199
X-Ovh-Tracer-Id: 15285217136473639925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: L0kTcRfD4Y3Z

On 6/27/22 17:46, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Add base for Qualcomm Firework BMC machine.
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
> Changes in v2:
> * Changed machine name to 'qcom-firework-bmc'. (Cedric)
> * Dropped FRU eeprom initialization part. (Patrick)


Let's see what happens next. If we don't have a good solution before 7.1,
it is better to reintroduce the helper qcom_dc_scm_fru_init() with a
more generic name.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> 
>   hw/arm/aspeed.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index cb7d99513816..342cf39c9747 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -999,6 +999,16 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
>   }
>   
> +static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    /* Create the generic DC-SCM hardware */
> +    qcom_dc_scm_bmc_i2c_init(bmc);
> +
> +    /* Now create the Firework specific hardware */
> +}
> +
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>   {
>       return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -1451,6 +1461,26 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
> +                                                    void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Qualcomm DC-SCM V1/Firework BMC (Cortex A7)";
> +    amc->soc_name  = "ast2600-a3";
> +    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
> +    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
> +    amc->fmc_model = "n25q512a";
> +    amc->spi_model = "n25q512a";
> +    amc->num_cs    = 2;
> +    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
> +    amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
> +    mc->default_ram_size = 1 * GiB;
> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);
> +};
> +
>   static const TypeInfo aspeed_machine_types[] = {
>       {
>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
> @@ -1492,6 +1522,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("qcom-firework-bmc"),
> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_qcom_firework_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


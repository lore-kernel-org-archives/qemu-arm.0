Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2709644lft;
        Wed, 22 Jun 2022 23:44:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vz5/LeRnd6vLcPxvzDCGLEGgf2dR0XphNcjl8nRMd/VWhhciCSAqAtJJk0N/VwP4DUpznM
X-Received: by 2002:ac8:570a:0:b0:304:e615:275f with SMTP id 10-20020ac8570a000000b00304e615275fmr6434836qtw.139.1655966646163;
        Wed, 22 Jun 2022 23:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655966646; cv=none;
        d=google.com; s=arc-20160816;
        b=p2nYTacAWBdn3Gm/7KJ8p/RLVIiLk1oFKQXR8sKo1DmpIGW57DVFLQvzfjZtB78Dqr
         BhZotLCPf/wJWHc4ru1lbFwl3FsT1i0uF2Q/9tarHNmnWQkVNatqJOB8HKcHCDLp/rwZ
         x1krP96tma7CqDqV3N9L5txwrXmhbLXfv7+dfZ5oHp0+fv3UB2Kh8naNwswIEyo3e1Wb
         4hjE9lNOsZ3vbzIBcRSE0xXCExiZHHH88VuzEJeTTJUsA0oy+AhI4GxQ2pBNJDZjSg01
         AhSWLFvbx31+hu53BMJsPxaUlfzJZvtYiZlgzS3bE+TzVsd3lu8siSjhsYCHeyIhf2MP
         Dwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=dWiUq5pfcsDmcyFbJzk8TyhKfXR533dhul2kTh+yJP8=;
        b=NP9KVqJcuQU7JpYybcUGVLeDo2e8PUur507YYqypCVioTYJQJnHG0a9XMO7SXSv8KP
         Jif8MXn9eDzfAC0R7FGyuSk61Mn+oOSmlT7E9FMTFomexMtRlNJAzql9W481DUVEKFb1
         N5LRDDb8KgwegATPugpgAsRS/RSkdAERu+STtBKimLMLSZ0MUc3BFGyO1hxlFIDdZg34
         8kVsu/UksklywPkY8T76QmniGT2025iBlakeQOGLNfYgenM+WV95eSjowCXYaZbrHlPW
         xJoG/6ONcQVDNAFgtpsXYNzE5LbHchA8/XhZEA9qMASe5KJ5gSsHF+Omd+C750vgTwkn
         tElQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05622a014800b00317ac568364si10170qtw.514.2022.06.22.23.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 23:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4GZR-0002iV-KT
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 02:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4GYr-0002dN-3h
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 02:43:33 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4GYj-0004dy-Fi
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 02:43:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1AE931101FD3A;
 Thu, 23 Jun 2022 08:43:16 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 08:43:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00549fc49f9-30f6-43f5-9105-cd4b0cb432f7,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1f050a11-b1ab-12ef-c83a-c0061d36aae9@kaod.org>
Date: Thu, 23 Jun 2022 08:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/9] hw/arm/aspeed: add Qualcomm Firework machine and FRU
 device
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-5-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220622172830.101210-5-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 28b0fbf7-4654-4298-aaee-25d24d1c132f
X-Ovh-Tracer-Id: 829506758654987055
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefiedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ugUo+O2EFPZ8

On 6/22/22 19:28, Jae Hyun Yoo wrote:
> From: Graeme Gregory <quic_ggregory@quicinc.com>
> 
> Add base for Qualcomm Firework machine and add its FRU device which is
> defined by DC-SCM to be fixed address 0x50.
> 
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> ---
>   hw/arm/aspeed.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 36d6b2c33e48..0e6edd2be4fa 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1017,6 +1017,35 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>       qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
>   }
>   
> +static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +    /* Use First Index for DC-SCM FRU */
> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 1);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
> +
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
> +    }
> +
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
> +
> +static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    /* Create the generic DC-SCM hardware */
> +    qcom_dc_scm_bmc_i2c_init(bmc);
> +
> +    /* Now create the Firework specific hardware */
> +
> +    /* I2C4 */
> +    qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
> +}
> +
>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>   {
>       return ASPEED_MACHINE(obj)->mmio_exec;
> @@ -1489,6 +1518,26 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
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
> @@ -1534,6 +1583,10 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,
>           .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
> +    }, {
> +        .name          = MACHINE_TYPE_NAME("qcom-firework"),

We should add the "-bmc" prefix to this machine name to be consistent
with the other BMCs. A "qcom-firework" machine would model the whole
system, host side included.

Thanks,

C.

> +        .parent        = TYPE_ASPEED_MACHINE,
> +        .class_init    = aspeed_machine_qcom_firework_class_init,
>       }, {
>           .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
>           .parent        = TYPE_ASPEED_MACHINE,


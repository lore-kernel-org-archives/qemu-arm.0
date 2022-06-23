Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2991166lft;
        Thu, 23 Jun 2022 07:11:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snvYIrV9HmhtwFfVnOnv5oK/LdoTgMM0wEY04rYnsUho8RG3IIavhE7dLMf6PUCBiXL5R6
X-Received: by 2002:a05:622a:190a:b0:316:cc5b:13fe with SMTP id w10-20020a05622a190a00b00316cc5b13femr6442745qtc.222.1655993518965;
        Thu, 23 Jun 2022 07:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655993518; cv=none;
        d=google.com; s=arc-20160816;
        b=LAbTh53n6Rclh8lqXeLGe8mJyPjncLCGLgpZYwhND1MU8ESorzYeBrb7wtIPlElVmP
         icBHj9uCPoim/yJic08WV1+Rrci67c31VcQlZKxDoJfwRUpRF8FBoX3pqDcQZl96i4lc
         /wa7yoajc+dAIfPoy9O/Evr3Se4Pi9sroaOiruQ5XTfXJVuLft0CISMr4t2AqLyRSMS/
         Vx8HYO3vvEj1Hx8rCroiej2DwGDHwhPFQo5p+tISMi355veAJLsi0iObggF7EkEoaI6X
         8LCq5Mqgmm8xYck3HFzCnQgqyFyUrX5blfS1X568Yc4BImZ7BBxGqArd67lCA9K0L6jt
         IyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LYzqduB4VLse9uTQk7Jt0NgeEX49Oe1BQJ+PgjJoVuo=;
        b=XnvHYlcA1JLDfPV0EFFbOE5ka5zJp7VaGmVFH9YhjoHnkaS2ArpiVxoxPVJNfi2Idl
         W4dsN2vhVdaCCgKqsw+9lZZvZzM8DnGrtVJ2exVnQyBPR1ckPQEjvzT7RP243+J9RQ/e
         +ATsz6YR047dSPv9/71rOXDE4todJhBqnSg32iHULtBZdBFdd5GhQ1QzomWW/K4mBKPP
         zwQyCCTTISM8FeXA9PC8KXeg6W+6ndK/AMoKX/W8KyOCMeyENwnBka5UiQzoxc2MB5yT
         SVV52NuT3O5/L/hsHte+c533vioSvBCDKFWItYGHUsHt63ekPhCymRF/extAlfPKYfr1
         sGag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=GzcnjHsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk5-20020a056214508500b004645f212c71si13322721qvb.46.2022.06.23.07.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 07:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=GzcnjHsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4NYs-0008Pm-EL
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 10:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NYY-0008Nr-Ur; Thu, 23 Jun 2022 10:11:38 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3422)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o4NYW-00057A-NC; Thu, 23 Jun 2022 10:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655993496; x=1687529496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LYzqduB4VLse9uTQk7Jt0NgeEX49Oe1BQJ+PgjJoVuo=;
 b=GzcnjHsf49phFpdpNuggX+ILZEPMqAVmSe+Tsr5ZuKdFKZpYCJo1yIQb
 4NNOc1Xcm1/Ih0kv8MIOrDhKLwCR47n5EqpYOauLqYwcQ79kZbPZ5jIBx
 COS3RQOMaYQqHw/CIYI5dqzkePUsUSHzBqhGqAUMgGlNoNiCmEoReWT3Z w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 07:11:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 07:11:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 07:11:33 -0700
Received: from [10.110.34.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 07:11:32 -0700
Message-ID: <d978e798-eace-01a5-67fb-0a1d132322a3@quicinc.com>
Date: Thu, 23 Jun 2022 07:11:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/9] hw/arm/aspeed: add Qualcomm Firework machine and FRU
 device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, "Andrew
 Jeffery" <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-5-quic_jaehyoo@quicinc.com>
 <1f050a11-b1ab-12ef-c83a-c0061d36aae9@kaod.org>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <1f050a11-b1ab-12ef-c83a-c0061d36aae9@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: GIbcJiimKsVz

On 6/22/2022 11:43 PM, Cédric Le Goater wrote:
> On 6/22/22 19:28, Jae Hyun Yoo wrote:
>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>
>> Add base for Qualcomm Firework machine and add its FRU device which is
>> defined by DC-SCM to be fixed address 0x50.
>>
>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>> ---
>>   hw/arm/aspeed.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 36d6b2c33e48..0e6edd2be4fa 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1017,6 +1017,35 @@ static void 
>> qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>>       qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 
>> 128 * 1024);
>>   }
>> +static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, 
>> uint32_t rsize)
>> +{
>> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>> +    DeviceState *dev = DEVICE(i2c_dev);
>> +    /* Use First Index for DC-SCM FRU */
>> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 1);
>> +
>> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>> +
>> +    if (dinfo) {
>> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>> +    }
>> +
>> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>> +}
>> +
>> +static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>> +{
>> +    AspeedSoCState *soc = &bmc->soc;
>> +
>> +    /* Create the generic DC-SCM hardware */
>> +    qcom_dc_scm_bmc_i2c_init(bmc);
>> +
>> +    /* Now create the Firework specific hardware */
>> +
>> +    /* I2C4 */
>> +    qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 
>> 128 * 1024);
>> +}
>> +
>>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>>   {
>>       return ASPEED_MACHINE(obj)->mmio_exec;
>> @@ -1489,6 +1518,26 @@ static void 
>> aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>>           aspeed_soc_num_cpus(amc->soc_name);
>>   };
>> +static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
>> +                                                    void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>> +
>> +    mc->desc       = "Qualcomm DC-SCM V1/Firework BMC (Cortex A7)";
>> +    amc->soc_name  = "ast2600-a3";
>> +    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
>> +    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
>> +    amc->fmc_model = "n25q512a";
>> +    amc->spi_model = "n25q512a";
>> +    amc->num_cs    = 2;
>> +    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
>> +    amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
>> +    mc->default_ram_size = 1 * GiB;
>> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
>> +        aspeed_soc_num_cpus(amc->soc_name);
>> +};
>> +
>>   static const TypeInfo aspeed_machine_types[] = {
>>       {
>>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>> @@ -1534,6 +1583,10 @@ static const TypeInfo aspeed_machine_types[] = {
>>           .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
>>           .parent        = TYPE_ASPEED_MACHINE,
>>           .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
>> +    }, {
>> +        .name          = MACHINE_TYPE_NAME("qcom-firework"),
> 
> We should add the "-bmc" prefix to this machine name to be consistent
> with the other BMCs. A "qcom-firework" machine would model the whole
> system, host side included.

Right, so I added the "-bmc" tag to "qcom-dc-scm-v1-bmc" as it's an
add-in card type board, and it can be attached to the "qcom-firework"
baseboard. The "qcom-firework" doesn't have the "-bmc" tag intentionally
since it doesn't have a bmc soc on it.

Thanks,
Jae

> Thanks,
> 
> C.
> 
>> +        .parent        = TYPE_ASPEED_MACHINE,
>> +        .class_init    = aspeed_machine_qcom_firework_class_init,
>>       }, {
>>           .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
>>           .parent        = TYPE_ASPEED_MACHINE,
> 

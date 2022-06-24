Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp117171lft;
        Fri, 24 Jun 2022 00:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vIffc5dY2HqDa4Yq/xAYz7clyIk/M3LZ79Ru9Ibj4w5IjOL2YxSOHeRMcwU4LR4mB7+4ym
X-Received: by 2002:a05:622a:190b:b0:304:ee86:59f1 with SMTP id w11-20020a05622a190b00b00304ee8659f1mr11741031qtc.632.1656055951922;
        Fri, 24 Jun 2022 00:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656055951; cv=none;
        d=google.com; s=arc-20160816;
        b=fVjLAX9yB5ij4ZTVq3pl0hmXEZ3yE4r3EwiXtWUbYP2Y/Hv5uLYsV74iLujaeWHDKe
         9Y9W6IihnELcBlHLsRYvPz2dRDcjiZbEiad4E8xtLmTsMQDXaZBmkSTV2IQsHeLg2YEA
         mRtw0QtamLZ+yrKzmHvSQ9cuwdamHQ7fLJnmjxFsk51+321yecLXOOdi7UmWfD1MU6h9
         UMfqZiskQ4joCkotdBgmfBf9NTFUBPalmvKkhL2jw6r4gG93uaKIj/5u7VWamWiHDoZh
         PEAwyKARBNfT44FZbTP/8fvJ0HnM6GfkDVieOTDMyvz56ILC+c60eoRFQXuarxYhoLq1
         GIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=KnIurP3MPnWkptBf16fHhBvth/qvZybAk5LW1OADKUM=;
        b=0ChyoOwVbOsFgVEgCoVJ0dO7/DPXLsfiWo4jWCDbsyu9Bo8fDlBH45V2eYTxmRqBKm
         e8mh/nNpn2s3JOZPa3SwN8WmZRlR7Ncx/044Atgd5GPMEon6eEOc9Vsat9c8/zXbHr3P
         p5IUnV/3sFryoZ1CwHyS8wo7VvqwQLEu3sOtCT9ul8GEiJPaSaGL7sfuUB7DuZqk2woe
         CQocyf3bQM6PqkCOBAOgwuQNXaYQGlxCtMX2BPhEQJ1yRRJUfkdpvOPl6Y9oF4BoCwTb
         ql4mw93+MP+NzAnebqur5/D1vUgzZQan5//mxVBjVWek9towuI9+aiQNk8ER8TimFfGF
         GFew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020ac85f06000000b00317c6f3c646si1047479qta.575.2022.06.24.00.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 00:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4dnr-0001PH-DQ
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 03:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dnf-0001NS-9b
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 03:32:19 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:45291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4dnc-0002kn-Hl
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 03:32:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BF02D27157;
 Fri, 24 Jun 2022 07:32:12 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 09:32:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004ae09ec7a-3e83-498e-9fe4-2e9047d44e58,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fb8cc3d1-767c-85d5-514f-89e7aa60ac8e@kaod.org>
Date: Fri, 24 Jun 2022 09:32:11 +0200
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
 <1f050a11-b1ab-12ef-c83a-c0061d36aae9@kaod.org>
 <d978e798-eace-01a5-67fb-0a1d132322a3@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d978e798-eace-01a5-67fb-0a1d132322a3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 48a2b1a1-62c8-4a0a-af5e-4f212bac1b9d
X-Ovh-Tracer-Id: 7528892678166973231
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudehkedtudfhgfelgffggfeffeefgefhudejvdekveeuveegieelteejiedugeevnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: +y3SVG9N+eMR

On 6/23/22 16:11, Jae Hyun Yoo wrote:
> On 6/22/2022 11:43 PM, Cédric Le Goater wrote:
>> On 6/22/22 19:28, Jae Hyun Yoo wrote:
>>> From: Graeme Gregory <quic_ggregory@quicinc.com>
>>>
>>> Add base for Qualcomm Firework machine and add its FRU device which is
>>> defined by DC-SCM to be fixed address 0x50.
>>>
>>> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
>>> ---
>>>   hw/arm/aspeed.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 53 insertions(+)
>>>
>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>> index 36d6b2c33e48..0e6edd2be4fa 100644
>>> --- a/hw/arm/aspeed.c
>>> +++ b/hw/arm/aspeed.c
>>> @@ -1017,6 +1017,35 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>>>       qcom_dc_scm_fru_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x53, 128 * 1024);
>>>   }
>>> +static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>>> +{
>>> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>>> +    DeviceState *dev = DEVICE(i2c_dev);
>>> +    /* Use First Index for DC-SCM FRU */
>>> +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 1);
>>> +
>>> +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>>> +
>>> +    if (dinfo) {
>>> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>>> +    }
>>> +
>>> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>>> +}
>>> +
>>> +static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>>> +{
>>> +    AspeedSoCState *soc = &bmc->soc;
>>> +
>>> +    /* Create the generic DC-SCM hardware */
>>> +    qcom_dc_scm_bmc_i2c_init(bmc);
>>> +
>>> +    /* Now create the Firework specific hardware */
>>> +
>>> +    /* I2C4 */
>>> +    qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
>>> +}
>>> +
>>>   static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
>>>   {
>>>       return ASPEED_MACHINE(obj)->mmio_exec;
>>> @@ -1489,6 +1518,26 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>>>           aspeed_soc_num_cpus(amc->soc_name);
>>>   };
>>> +static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
>>> +                                                    void *data)
>>> +{
>>> +    MachineClass *mc = MACHINE_CLASS(oc);
>>> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
>>> +
>>> +    mc->desc       = "Qualcomm DC-SCM V1/Firework BMC (Cortex A7)";
>>> +    amc->soc_name  = "ast2600-a3";
>>> +    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
>>> +    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
>>> +    amc->fmc_model = "n25q512a";
>>> +    amc->spi_model = "n25q512a";
>>> +    amc->num_cs    = 2;
>>> +    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
>>> +    amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
>>> +    mc->default_ram_size = 1 * GiB;
>>> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
>>> +        aspeed_soc_num_cpus(amc->soc_name);
>>> +};
>>> +
>>>   static const TypeInfo aspeed_machine_types[] = {
>>>       {
>>>           .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
>>> @@ -1534,6 +1583,10 @@ static const TypeInfo aspeed_machine_types[] = {
>>>           .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
>>>           .parent        = TYPE_ASPEED_MACHINE,
>>>           .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
>>> +    }, {
>>> +        .name          = MACHINE_TYPE_NAME("qcom-firework"),
>>
>> We should add the "-bmc" prefix to this machine name to be consistent
>> with the other BMCs. A "qcom-firework" machine would model the whole
>> system, host side included.
> 
> Right, so I added the "-bmc" tag to "qcom-dc-scm-v1-bmc" as it's an
> add-in card type board, and it can be attached to the "qcom-firework"
> baseboard. The "qcom-firework" doesn't have the "-bmc" tag intentionally
> since it doesn't have a bmc soc on it.

These are the Aspeed machines, they only model the BMC side of the
overall system.

A "qcom-firework" machine would include the host SoC, possibly the
service and management SoCs plus the BMC.

As an example, see the fb35 machine being developed by Peter :
  
   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=306294

or the PowerNV machines which use an embedded or external Aspeed BMCs

Thanks,

C.

> 
> Thanks,
> Jae
> 
>> Thanks,
>>
>> C.
>>
>>> +        .parent        = TYPE_ASPEED_MACHINE,
>>> +        .class_init    = aspeed_machine_qcom_firework_class_init,
>>>       }, {
>>>           .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
>>>           .parent        = TYPE_ASPEED_MACHINE,
>>


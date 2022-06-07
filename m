Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2021895lfb;
        Tue, 7 Jun 2022 04:19:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLYVnEy+9gkdZIbdEY2cQ18lU39krOiKW3n1D49zfYFaZMR5R7HcQgIZiXMIr4BdU572Y3
X-Received: by 2002:a05:620a:28d6:b0:6a6:6c9c:ca9e with SMTP id l22-20020a05620a28d600b006a66c9cca9emr17881726qkp.518.1654600779982;
        Tue, 07 Jun 2022 04:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654600779; cv=none;
        d=google.com; s=arc-20160816;
        b=PPLe96+QpQzO/oZOCAXyTAPmltMma7YWn94r3hZs8Teuv155TSkk/WH7TRdGCFZTiW
         tAufyBPgk3GOGNBR34bn80wjMg4mkHj5atnyu0RsxWZLq2TjfsGqzdw8Aq932UvuXaSX
         PkohPKAnEpb2AUh0sW9vpEzpEe1G/Lf4cPV60IbMW/wKptas8H1vG9eEWMZnLV10v8wL
         llkCgUAJGcYsR4LgBJzEySiJh0rIZVbQZxpcBXdwaduseGrm5rJABeRuCGB5BNQyrWDk
         RydL67OF6EOan36HxsoZICuIspQA3Tz3DgGbCh2MrctfrSFXCJZeb8HlOcMyS1qQycgX
         QO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=C3dNrKjwLVgAv33LStBjzjbc10bqlC6tW96vw1nDrOw=;
        b=oMNY2EBOQaU7OVXS3jpokQEQFCGeNroL0KtV3JRJeBRWZ5ZNU+qB7cWYaB6eEpeeyA
         pSwXt58LRIW8aS2WFBQg3RQ48gG8YdmyJGknaEv9dfJhMw92IwGkPbCurUSmpKI3wHAK
         VlWufZnwBZFxrgQ1Z5EbQTLsRzY4cX/Vz4c0xCyw4VvU6fnttdccuO70mZoAzsjepTyY
         RvEH5RBwNxlIV2eicV5TpQSuvpS9PSHM3cxCTFJ0p7TiUoI4Qj34ANLJCfjQ+uAXhKp1
         DPmkJxgNYJ8nEH99eE+F3zLGq1pGIwVpYnRz2KOd7VZf7OJ0u3gpFdtlQ6mrIOw514NG
         x7Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05622a058800b00304e89d8b81si4369106qtb.217.2022.06.07.04.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 04:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyXFL-0000QA-9t
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 07:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyWgt-0002M6-LU
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 06:44:03 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:54641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nyWgp-0008Qm-4P
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 06:44:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DA47925D63;
 Tue,  7 Jun 2022 10:43:54 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 7 Jun 2022
 12:43:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0044d3a270d-3a2c-4f0b-859d-085e06784f4e,
 B3A9F5ABA359FFEAA5F192A1B4EC97B2EEB111D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e20b78c1-02c0-0e27-e02d-98cb3038757a@kaod.org>
Date: Tue, 7 Jun 2022 12:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 13/21] aspeed: Add I2C buses to AST1030 model
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>,
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Damien Hedde
 <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-14-clg@kaod.org>
 <CACPK8XeqgDE+oNSJS8PHQW8hxx25atYW6ww1_0d-nsJuc1vQBg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XeqgDE+oNSJS8PHQW8hxx25atYW6ww1_0d-nsJuc1vQBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e06b1edd-5d7a-4a73-bd23-7fbc8bf85bc4
X-Ovh-Tracer-Id: 3164341688510221258
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegslhgvrghlsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LR2Qwiol/79j

On 6/7/22 01:18, Joel Stanley wrote:
> On Mon, 6 Jun 2022 at 15:09, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> From: Troy Lee <troy_lee@aspeedtech.com>
>>
>> Instantiate the I2C buses in AST1030 model and create two slave device
>> for ast1030-evb.
>>
>> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>> [ clg : - adapted to current ast1030 upstream models
>>          - fixed typo in commit log ]
>> Message-Id: <20220324100439.478317-3-troy_lee@aspeedtech.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> one question about a comment below.
> 
>> ---
>>   hw/arm/aspeed.c         | 13 +++++++++++++
>>   hw/arm/aspeed_ast10x0.c | 18 ++++++++++++++++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 98dc185acd9a..5c3802308e80 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -1401,6 +1401,18 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>>                          AST1030_INTERNAL_FLASH_SIZE);
>>   }
>>
>> +static void ast1030_evb_i2c_init(AspeedMachineState *bmc)
>> +{
>> +    AspeedSoCState *soc = &bmc->soc;
>> +
>> +    /* U10 24C08 connects to SDA/SCL Groupt 1 by default */
>> +    uint8_t *eeprom_buf = g_malloc0(32 * 1024);
>> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50, eeprom_buf);
>> +
>> +    /* U11 LM75 connects to SDA/SCL Group 2 by default */
>> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 1), "tmp105", 0x4d);
>> +}
>> +
>>   static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>>                                                             void *data)
>>   {
>> @@ -1412,6 +1424,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>>       amc->hw_strap1 = 0;
>>       amc->hw_strap2 = 0;
>>       mc->init = aspeed_minibmc_machine_init;
>> +    amc->i2c_init = ast1030_evb_i2c_init;
>>       mc->default_ram_size = 0;
>>       mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
>>       amc->fmc_model = "sst25vf032b";
>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
>> index d53454168403..a2ed275712fb 100644
>> --- a/hw/arm/aspeed_ast10x0.c
>> +++ b/hw/arm/aspeed_ast10x0.c
>> @@ -114,6 +114,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>>       object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu), "hw-strap1");
>>       object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu), "hw-strap2");
>>
>> +    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
>> +    object_initialize_child(obj, "i2c", &s->i2c, typename);
>> +
>>       snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
>>       object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
>>
>> @@ -188,6 +191,21 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>>       }
>>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
>>
>> +    /* I2C */
>> +
>> +    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(&s->sram),
>> +                             &error_abort);
>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
>> +    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
>> +        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
>> +                                        sc->irqmap[ASPEED_DEV_I2C] + i);
>> +        /* The AST2600 I2C controller has one IRQ per bus. */
> 
> I know it's the same hardware, but is the "AST2600" part of the comment correct?

I will take care of it.

Thanks,

C.


> 
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
>> +    }
>> +
>>       /* LPC */
>>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
>>           return;
>> --
>> 2.35.3
>>


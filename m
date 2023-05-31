Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2647617ejb;
        Tue, 30 May 2023 23:15:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7etEyli+/1VVBIqysb6e97ZfFZwJ4b9j5n32Z0jxwA7eghT7xmbixXrM7UDvr0YweHglZm
X-Received: by 2002:ad4:5947:0:b0:61b:5e9b:a15d with SMTP id eo7-20020ad45947000000b0061b5e9ba15dmr5309592qvb.36.1685513746467;
        Tue, 30 May 2023 23:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685513746; cv=none;
        d=google.com; s=arc-20160816;
        b=NYPwuNMhmimDPpj5jM/br3+pYIQUO42EWyh/jFKMP9hY3m1cCalrCcXNQoPQUShpAG
         B34Xiv0Lu7HxAQPSjm9hwOM8Cv5UNA62Dr3motWANZqmnOOUa9fBQ7qwTKI3gqqUC/mk
         sVPsbz8PSBMmxc946XYNsbl87P4pI5nlZwgN/ZlmSq4+36wLxEKWXMJPcemmb7Nhzvyg
         NFNth4tPXOB+aom+oyoTaj2UfWtuJMAIR4mfx0B4UFVHDMpyHbezOLexOH9sIHcaFWpm
         qinqVElbmhIzOzlMOVFPCmJOzIjRJX49Kif3me1rwZ3Rrzh7LN6BqoLMh8uraVg7tjFk
         TrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=IORPAH+O9ndbT44lkY2Nic1siw+tKFrbGPfOer5MB68=;
        b=p/VRi1Dj9MMYim9OerGPrdJeAiRUlmFAl0nlrJwHU+4fEqmndemUJWLg0Uexalk3NX
         7p3j2e9HqlNRrGo3QyevSBiFUDJVcvWqKlESwpQozms2ZvQJEfxrnMOFhFTSpIQewkeI
         4JAQF+hCiYRTW+4VgjH0aRHiTl8wIGpjHKtemRhHrg1rlgmF8PcZRzdBE0i+NU0ZmRKu
         eCcOY3UwP5LRDn9rkVld+8DV/R5GiTKDyoZMh6i7jY9Tnx7qJFbPWoPEwyojDjzLAxn2
         LT9UcrugXKfU+FVf8j9+tNLbeZEJEJ71BSrJqddh73ts2B5ziA/nr7WjmYRQrqnq0hrc
         DzRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if7-20020a0562141c4700b00623a617b697si1876891qvb.229.2023.05.30.23.15.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 23:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4F7S-0007GD-5D; Wed, 31 May 2023 02:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1q4F6w-0006qu-RT
 for qemu-arm@nongnu.org; Wed, 31 May 2023 02:15:06 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1q4F6u-0007W6-JZ
 for qemu-arm@nongnu.org; Wed, 31 May 2023 02:15:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D3E4C2134A;
 Wed, 31 May 2023 06:15:00 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 08:15:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011664d7e2-9b82-4938-94eb-eec7aa015665,
 AD4A5C7A17A66D4AFB6DE796C11E1CF112258E66) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad2ef68a-f308-db96-a668-58bfd457788c@kaod.org>
Date: Wed, 31 May 2023 08:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/12] aspeed/smc: Wire CS lines at reset
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-7-clg@kaod.org>
 <ad016c90-238c-2654-d550-9823bcb2a395@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ad016c90-238c-2654-d550-9823bcb2a395@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 01a55954-916b-46c3-91b1-fb65610c91bb
X-Ovh-Tracer-Id: 16565365330939906854
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekkedguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeliedpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +wz/QOydtEUF

On 5/30/23 22:56, Philippe Mathieu-Daudé wrote:
> On 8/5/23 09:58, Cédric Le Goater wrote:
>> Currently, a set of default flash devices is created at machine init
>> and drives defined on the QEMU command line are associated to the FMC
>> and SPI controllers in sequence :
>>
>>     -drive file<file>,format=raw,if=mtd
>>     -drive file<file1>,format=raw,if=mtd
>>
>> The CS lines are wired in the same creation loop. This makes a strong
>> assumption on the ordering and is not very flexible since only a
>> limited set of flash devices can be defined : 1 FMC + 1 or 2 SPI,
>> which is less than what the SoC really supports.
>>
>> A better alternative would be to define the flash devices on the
>> command line using a blockdev attached to a CS line of a SSI bus :
>>
>>      -blockdev node-name=fmc0,driver=file,filename=./flash.img
>>      -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0
>>
>> However, user created flash devices are not correctly wired to their
>> SPI controller and consequently can not be used by the machine. Fix
>> that and wire the CS lines of all available devices when the SSI bus
>> is reset.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/aspeed.c     | 5 +----
>>   hw/ssi/aspeed_smc.c | 8 ++++++++
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index b654513f35..9a15899cbc 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -299,17 +299,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>>       for (i = 0; i < count; ++i) {
>>           DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
>> -        qemu_irq cs_line;
>>           DeviceState *dev;
>>           dev = qdev_new(flashtype);
>>           if (dinfo) {
>>               qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>>           }
>> +        qdev_prop_set_uint32(dev, "addr", i);
>>           qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
>> -
>> -        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>> -        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
>>       }
>>   }
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 7281169322..2a4001b774 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -692,6 +692,14 @@ static void aspeed_smc_reset(DeviceState *d)
>>           memset(s->regs, 0, sizeof s->regs);
>>       }
>> +    for (i = 0; i < asc->cs_num_max; i++) {
>> +        DeviceState *dev = ssi_get_cs(s->spi, i);
>> +        if (dev) {
>> +            qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>> +            qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
>> +        }
>> +    }
> 
> Why did you chose the DeviceReset handler?
> Shouldn't this be done in aspeed_smc_realize(), the DeviceRealize handler?

This looks weird, I agree, but the wiring needs to be done at reset time
to wire the user-created devices. I don't think there is another way.

Thanks,

C.
  
  
> 
>>       /* Unselect all peripherals */
>>       for (i = 0; i < asc->cs_num_max; ++i) {
>>           s->regs[s->r_ctrl0 + i] |= CTRL_CE_STOP_ACTIVE;
> 


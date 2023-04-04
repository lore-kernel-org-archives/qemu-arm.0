Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp792752ejb;
        Tue, 4 Apr 2023 09:30:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHOGLKMtTtaCLLKB6EB33U9OdlAGlY8yDJNWuVscV5+UwhcSEDvo3KydeKn/qPOuehJzsg
X-Received: by 2002:a05:622a:12:b0:3e4:e5bf:a24c with SMTP id x18-20020a05622a001200b003e4e5bfa24cmr4357399qtw.62.1680625805450;
        Tue, 04 Apr 2023 09:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680625805; cv=none;
        d=google.com; s=arc-20160816;
        b=cOMkLqm7kZ/zp+vCFx1Ggden8AOfQCCU2gXrJ0PBCZjvRSwh0Mn3L8OJTfESxzFTNg
         j24tDCtG2hGucgsTT5ZxaxOCJ3PBjUCGK9vLxZnUHf+LyMAoST8oem8czl8oVyD1GsPu
         igyk1j37ntum0m73DMrV+KsXXyU10kmTpyEXXnB7vUnhigpFD12uC6ZlfLJ/8Edum0T6
         dw1J53sl+5sSGNqTPD5mCadDMWPWT8ugI7k/4r09f8aQ3GozAiYRrvH1xKvmBr1aXQAw
         TMbMH7nlf+NmWnrMBbG1eKvohM5ORuKeeplJNKLYfX1PWFtKc2IhldbiFOr7dS0eAumU
         3FXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=RzFdSRicHHhS+c72HnUQSWhLTcV59cTcrjCud3RUIGU=;
        b=NX9/xpd4dBUW8A8kK9yzW+pjbl3ukd4lEzlt8741fTaPMvHNo+t2vWCrkFqtLpNvLI
         I/juud+jeiOdV2BZh8qJHrOixiIvjVRzdVtZM8wHFjVid8yTbY/Fe1AF6NjHdtfBy3lA
         UTsxw5+9KU4C3NGVMyVkARM/q9r4Gc5EZtJL+JNie7Fvsn5TloA9ND5mdxYWOW4Ic6DT
         n1v9Nsnf7OVpH/ikm6TuUUBZp5RrO4q8urGVgQ7UDipMZbsJuquG5s8x4rbqRGX1mPF4
         NqK2vSBEoEWjDJNlQmduVudGEE0655v5UQHh4lBsYFDsLsZHp4iCpJ84IR5uJcJOQ94R
         hG+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05622a15cf00b003c009d75e43si8340504qty.196.2023.04.04.09.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 09:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjjXe-0002K7-D2; Tue, 04 Apr 2023 12:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjjXc-0002J4-2g
 for qemu-arm@nongnu.org; Tue, 04 Apr 2023 12:29:52 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjjXC-00021R-DN
 for qemu-arm@nongnu.org; Tue, 04 Apr 2023 12:29:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0CFDC21EB6;
 Tue,  4 Apr 2023 16:29:23 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 4 Apr
 2023 18:29:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004dd354537-2539-48f5-8241-b13109ee3d01,
 85507D0075A56E5AD4EA03BF56E5282CC2D8C3A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <42909658-3a6d-69b0-1607-182728e2ac70@kaod.org>
Date: Tue, 4 Apr 2023 18:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PULL 10/19] aspeed: fby35: Add a bootrom for the BMC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Delevoryas
 <peter@pjd.dev>
References: <20220714154456.2565189-1-clg@kaod.org>
 <20220714154456.2565189-11-clg@kaod.org>
 <CAFEAcA_yYuWgsSKc9N7PvHeAWjtSqWwM1z+qJQ1swv3cwCghPg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_yYuWgsSKc9N7PvHeAWjtSqWwM1z+qJQ1swv3cwCghPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8539e7d6-1868-434c-93b5-d0c8c7b09024
X-Ovh-Tracer-Id: 5792192071044729824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhesphhjugdruggvvhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OTBOeuQ99UBo

On 4/4/23 17:54, Peter Maydell wrote:
> On Thu, 14 Jul 2022 at 16:45, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The BMC boots from the first flash device by fetching instructions
>> from the flash contents. Add an alias region on 0x0 for this
>> purpose. There are currently performance issues with this method (TBs
>> being flushed too often), so as a faster alternative, install the
>> flash contents as a ROM in the BMC memory space.
>>
>> See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
>> property to boot directly from CE0")
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>> [ clg: blk_pread() fixes ]
>> Message-Id: <20220705191400.41632-8-peter@pjd.dev>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Hi; Coverity has noticed a trivial "memory leak" (CID 1508061) in this code:
> 
>>   static void fby35_bmc_init(Fby35State *s)
>>   {
>> +    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
>> +
>>       memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
>>       memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
>>                              FBY35_BMC_RAM_SIZE, &error_abort);
>> @@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
>>       qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
>>
>>       aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
>> +
>> +    /* Install first FMC flash content as a boot rom. */
>> +    if (drive0) {
>> +        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
>> +        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
> 
> Here we allocate a new MemoryRegion...
> 
>> +        uint64_t size = memory_region_size(&fl->mmio);
>> +
>> +        if (s->mmio_exec) {
>> +            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
>> +                                     &fl->mmio, 0, size);
>> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
>> +                                        boot_rom);
>> +        } else {
>> +
>> +            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
>> +                                   size, &error_abort);
>> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
>> +                                        boot_rom);
>> +            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
>> +                                     size, &error_abort);
>> +        }
> 
> ...but we never keep a pointer to it anywhere, so Coverity classes
> this as a "memory leak". (It's not really one, because the memory
> has to stay live for the whole of QEMU's execution anyway.)
> 
> The easy fix is not to allocate a new MR, but instead use
> a MemoryRegion field in the Fby35State struct, the way we
> do for all the other MRs this function sets up. Conveniently,
> there already is a "MemoryRegion bmc_boot_rom" in the struct
> which is currently completely unused :-)

hey :) Indeed.

I have recently taken another approach in the aspeed machines, which is
to introduce a spi_boot region since it is part of the SoC address space.
There is also an extra container to overlap a rom region to speed up boot
because the "execute-in-place mode" is a bit slow (~30 s to reach FW).
So the aspeed code is different now :

    if (!bmc->mmio_exec) {
         DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);

         if (mtd0) {
             uint64_t rom_size = memory_region_size(&bmc->soc.spi_boot);
             aspeed_install_boot_rom(&bmc->soc, blk_by_legacy_dinfo(mtd0),
                                     rom_size);
         }
     }

and we should report the same code in fby35 (which was a copy paste)

The benefits are that we will (soon) be able to create SPI flash devices
from the command line, such as :

         -blockdev node-name=fmc0,driver=file,filename=./flash.img \
         -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0 \

and boot from them. That said, the memory leak is still there in
aspeed_install_boot_rom() :

     MemoryRegion *boot_rom = g_new(MemoryRegion, 1);

     memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom", rom_size,
                            &error_abort);
     memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
                                         boot_rom, 1);
     write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);

and coverity didn't catch it ? Anyhow we can use a MemoryRegion under the
machine state to remove the warning like you suggested. I will add that on
the 8.1 TODO list.

Thanks,

C.


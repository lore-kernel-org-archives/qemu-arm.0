Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3110582njb;
        Tue, 22 Oct 2024 07:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+WTcKaeXIq3Owo0KZXJIFE8P7fzmJSosyvv7cD21SLeTI+OMeqfpA1gqkdo/9x2O10NIPsjC6Ja1JFg==@linaro.org
X-Google-Smtp-Source: AGHT+IFQJyTjkY6U9V6Wb9PfnLPYRzi0PxNqFGrkapvyk1rrfklFE9iUsxYTVmwsMiWV8K1zMZfE
X-Received: by 2002:a05:6122:a12:b0:50d:34fe:fef0 with SMTP id 71dfb90a1353d-50fb30aa08cmr2203097e0c.6.1729606238812;
        Tue, 22 Oct 2024 07:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729606238; cv=none;
        d=google.com; s=arc-20240605;
        b=VcI1VOA9UiaLCRXknuYTX0Rvf4FKC4pOkHxGIe6af5RoBf49Ctwl7ujCmuOCKow3rN
         MS1wX3jgY5NzAkFd7HV8PNPZVAf395HkxZWJ2qFiYrHKf7UM4hBLLBaVkt5ecLHTK4Ge
         rrY5h4FDQu/4VAABYQ4eIS+khWGKciA42YukTx3/a/DVf4h3CYQtIEYV71EJgUOPlZcM
         5f9PMubLoa8H0h+rVHuHwz3ZrUkkZUQ3ZSgJ/VupDWn1kCPEIpV/ZNDTuYqG0QNLRzjO
         5x5qiRgztMUQqznnuTGeh/BaDHRt6GUTnaJMvfiyq/CGdRupgo4UhbS1wJZmp13cx21D
         y/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id;
        bh=UMaRyTn3Oa7qgImk4mC//+Cwp29Mcvf2FSN70RAzcpU=;
        fh=4mlnkPeqTwuu2Qx8qreMlJHQU0w7aOUfwVS+XUkOkGE=;
        b=GAaqfF23YTZqML2GzOu9kYyZBmMFmhIBaZpzYHL/AROcEyZfl5D7ykZS4jqmhV7SWo
         kL07H3iUs/Janbds+2BPWUaMFjfQ6ZhmoGcinccouZ8XUtJ6wwTjx0rIjdlLnqUwZ6HL
         o1mXDZrGFbYgiHgn6BxL80vS+ORNvVjySsxAKy0YX3HvKE2n+0FqJCRxeu8tN7CTC62l
         4VpAb1tOVTSLH+/yLrY5X7hJU/hbKdML7f1NQPK/8TmaTkLIaCZJpTYcvY2vkb/dQVrU
         eeX7SffhFAV4s84/H7STGjAtdphvLpp3W9vyR0bv9b0wD8X8hcln41RHEPRhCVXzpm/Y
         P+og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50e19e624c3si1185519e0c.108.2024.10.22.07.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 07:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3Fag-0002z5-Qc; Tue, 22 Oct 2024 10:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=pGrG=RS=kaod.org=clg@ozlabs.org>)
 id 1t3Faa-0002yS-1q; Tue, 22 Oct 2024 10:10:24 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=pGrG=RS=kaod.org=clg@ozlabs.org>)
 id 1t3FaW-0004Nj-3M; Tue, 22 Oct 2024 10:10:23 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XXvFw4Gcmz4wc2;
 Wed, 23 Oct 2024 01:10:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXvFp6SVHz4wb1;
 Wed, 23 Oct 2024 01:10:06 +1100 (AEDT)
Message-ID: <6118d5bd-342e-41d3-aaf5-4ce9715a9ea1@kaod.org>
Date: Tue, 22 Oct 2024 16:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] aspeed: Fix hardcode attach flash model of spi
 controllers
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
 <20241022094110.1574011-8-jamin_lin@aspeedtech.com>
 <e1803cd1-f4fd-4d1a-a8e9-5a5ed86c59e7@kaod.org>
Content-Language: en-US, fr
In-Reply-To: <e1803cd1-f4fd-4d1a-a8e9-5a5ed86c59e7@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=pGrG=RS=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.169, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fzNxkZsRVq+T

oops. R-b sent on the wrong patch.

On 10/22/24 12:48, Cédric Le Goater wrote:
> On 10/22/24 11:40, Jamin Lin wrote:
>> It only attached flash model of fmc and spi[0] in aspeed_machine_init function.
>> However, AST2500 and AST2600 have one fmc and two spi(spi1 and spi2)
>> controllers; AST2700 have one fmc and 3 spi(spi0, spi1 and spi2) controllers.
>>
>> Besides, it used hardcode to attach flash model of fmc, spi[0] and spi[1] in
>> aspeed_minibmc_machine_init for AST1030.
>>
>> To make both functions more flexible and support all ASPEED SOCs spi
>> controllers, adds a for loop with sc->spis_num to attach flash model of
>> all supported spi controllers. The sc->spis_num is from AspeedSoCClass.

To be honest, I am not a big fan of the aspeed_board_init_flashes()
routine. See commit 27a2c66c92ec for the reason.

I prefer the more flexible approach :

$ qemu-system-arm -M ast2600-evb \
       -blockdev node-name=fmc0,driver=file,filename=/path/to/fmc0.img \
       -device mx66u51235f,bus=ssi.0,cs=0x0,drive=fmc0 \
       -blockdev node-name=fmc1,driver=file,filename=/path/to/fmc1.img \
       -device mx66u51235f,bus=ssi.0,cs=0x1,drive=fmc1 \
       -blockdev node-name=spi1,driver=file,filename=/path/to/spi1.img \
       -device mx66u51235f,cs=0x0,bus=ssi.1,drive=spi1 \
       -nographic -nodefaults

which doesn't use the drive_get() interface and so, doesn't make
assumption on the order of the drives defined on the QEMU command
line.

Also, the number of availabe flash devices is a machine definition,
not a SoC definition. Not all CS are wired.

I will drop that patch for now.


Thanks,

C.



>> ---
>>   hw/arm/aspeed.c | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index b4b1ce9efb..7ac01a3562 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -419,9 +419,11 @@ static void aspeed_machine_init(MachineState *machine)
>>           aspeed_board_init_flashes(&bmc->soc->fmc,
>>                                 bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
>>                                 amc->num_cs, 0);
>> -        aspeed_board_init_flashes(&bmc->soc->spi[0],
>> -                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
>> -                              1, amc->num_cs);
>> +        for (i = 0; i < sc->spis_num; i++) {
>> +            aspeed_board_init_flashes(&bmc->soc->spi[i],
>> +                            bmc->spi_model ? bmc->spi_model : amc->spi_model,
>> +                            amc->num_cs, amc->num_cs + (amc->num_cs * i));
>> +        }
>>       }
>>       if (machine->kernel_filename && sc->num_cpus > 1) {
>> @@ -1579,7 +1581,9 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>>   {
>>       AspeedMachineState *bmc = ASPEED_MACHINE(machine);
>>       AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
>> +    AspeedSoCClass *sc;
>>       Clock *sysclk;
>> +    int i;
>>       sysclk = clock_new(OBJECT(machine), "SYSCLK");
>>       clock_set_hz(sysclk, SYSCLK_FRQ);
>> @@ -1587,6 +1591,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>>       bmc->soc = ASPEED_SOC(object_new(amc->soc_name));
>>       object_property_add_child(OBJECT(machine), "soc", OBJECT(bmc->soc));
>>       object_unref(OBJECT(bmc->soc));
>> +    sc = ASPEED_SOC_GET_CLASS(bmc->soc);
>>       qdev_connect_clock_in(DEVICE(bmc->soc), "sysclk", sysclk);
>>       object_property_set_link(OBJECT(bmc->soc), "memory",
>> @@ -1599,13 +1604,11 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>>                                 amc->num_cs,
>>                                 0);
>> -    aspeed_board_init_flashes(&bmc->soc->spi[0],
>> -                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
>> -                              amc->num_cs, amc->num_cs);
>> -
>> -    aspeed_board_init_flashes(&bmc->soc->spi[1],
>> +    for (i = 0; i < sc->spis_num; i++) {
>> +        aspeed_board_init_flashes(&bmc->soc->spi[i],
>>                                 bmc->spi_model ? bmc->spi_model : amc->spi_model,
>> -                              amc->num_cs, (amc->num_cs * 2));
>> +                              amc->num_cs, amc->num_cs + (amc->num_cs * i));
>> +    }
>>       if (amc->i2c_init) {
>>           amc->i2c_init(bmc);
> 


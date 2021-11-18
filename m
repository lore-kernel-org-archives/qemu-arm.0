Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp739112lfk;
        Thu, 18 Nov 2021 06:43:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwX0SE5liH9DXaMazk7iebmK8/VwnMPAdhSF6brQKiElicvwnB+VptGhWS0HahNwauUMO0c
X-Received: by 2002:a05:6122:a02:: with SMTP id 2mr105235931vkn.6.1637246584259;
        Thu, 18 Nov 2021 06:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637246584; cv=none;
        d=google.com; s=arc-20160816;
        b=BjJLBcRXRuE9iJXC1VOCAThXmxN54+dn3inmUNf7X7g1fcJ8JCXms9TuTKvfz3NH56
         Li7QHI5HYvCFrrV5ZbHbChLOLV8yKVgt3w6QTffD5VXnjJif7bGancKdm22WI8UEhy76
         RX+PxpKlxaaiaXuxWKsO1LXfiltEEEXCliVAG7aZifV3ZfUSdtfCNUnBgQlQSMo/JK36
         NMEeZ9u1KuUEExNk35psRNS4Xy30k8Gz+47pXqxODYndk2/DV6XO4MRxh0sR98ivB5eQ
         yyO5ha/Z80FI0lVsiSpvoyvpTvdu+wuwhAMYrCqGSU7euUbssPlyBlBpMunuxUTyz5S7
         xc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=bVojfUJ4nwI/Aei/4lYO7LMCxDxfLRxL6viMoCFiWso=;
        b=DpTB413N7xQxOWgtj++/i2PUZ92mz5e09aeBlrzX72XUdlj/KBbLaodE8p/GoISBrf
         2oKD3/ar+3/gni8zESejvHbctKK1FuXTMlEcwIUNQomrWkLmSXRFgHKMecECKKP/UAk5
         Sa6o/wbcOdZQ/9xwkVZ0/2OS/bIW+Xkgi+PpXL+hqGrt/nqp/TgJITymVfhzCxnUnGt+
         gYG/ph69YBLTZqNNvyupxVQmns+3YD+DoSgd8LTkpla9EJAHWDGf1DKckvPeZbsOUMRu
         xbY5nmi4ptq3Ot3yLE7Rb6yw8yD09mm2dL+qmRmlDbQqoJN45WBZk517corMOJnIuaGU
         50JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si8190869vsj.350.2021.11.18.06.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 06:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnicx-0004fB-IF
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 09:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mnic3-0003nQ-Al; Thu, 18 Nov 2021 09:42:07 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mnic0-0005ZY-SK; Thu, 18 Nov 2021 09:42:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CCDF0CC642FC;
 Thu, 18 Nov 2021 15:41:58 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 15:41:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ffd21ca9-e706-40ea-8dcf-22e4bb212975,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <a092fc06-66e5-44b1-4e95-7b4a7325c140@kaod.org>
Date: Thu, 18 Nov 2021 15:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 12/13] hw/arm/aspeed: Replace drive_get_next() by
 drive_get()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, <qemu-devel@nongnu.org>
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-13-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117163409.3587705-13-armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6cb04726-a525-4d45-9888-7bcf4e3ceef2
X-Ovh-Tracer-Id: 7365074242974878569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDr9jhjdA85A

On 11/17/21 17:34, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
> 
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> The aspeed machines connects backends with drive_get_next() in several
> counting loops, one of them in a helper function, and a conditional.
> Change it to use drive_get() directly.  This makes the unit numbers
> explicit in the code.

I hope we can introduce some bus id. At least for the SPI controllers.
  
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

>   hw/arm/aspeed.c | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a77f46b3ad..cf20ae0db5 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -284,12 +284,13 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>   }
>   
>   static void aspeed_board_init_flashes(AspeedSMCState *s,
> -                                      const char *flashtype)
> +                                      const char *flashtype,
> +                                      int unit0)
>   {
>       int i ;
>   
>       for (i = 0; i < s->num_cs; ++i) {
> -        DriveInfo *dinfo = drive_get_next(IF_MTD);
> +        DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
>           qemu_irq cs_line;
>           DeviceState *dev;
>   
> @@ -382,10 +383,12 @@ static void aspeed_machine_init(MachineState *machine)
>                             "max_ram", max_ram_size  - machine->ram_size);
>       memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
>   
> -    aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
> -                              bmc->fmc_model : amc->fmc_model);
> -    aspeed_board_init_flashes(&bmc->soc.spi[0], bmc->spi_model ?
> -                              bmc->spi_model : amc->spi_model);
> +    aspeed_board_init_flashes(&bmc->soc.fmc,
> +                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
> +                              0);
> +    aspeed_board_init_flashes(&bmc->soc.spi[0],
> +                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
> +                              bmc->soc.fmc.num_cs);
>   
>       /* Install first FMC flash content as a boot rom. */
>       if (drive0) {
> @@ -435,11 +438,13 @@ static void aspeed_machine_init(MachineState *machine)
>       }
>   
>       for (i = 0; i < bmc->soc.sdhci.num_slots; i++) {
> -        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_SD));
> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i],
> +                           drive_get(IF_SD, 0, i));
>       }
>   
>       if (bmc->soc.emmc.num_slots) {
> -        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD));
> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0],
> +                           drive_get(IF_SD, 0, bmc->soc.sdhci.num_slots));
>       }
>   
>       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
> 


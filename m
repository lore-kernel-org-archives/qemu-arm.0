Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1053942ejc;
        Fri, 20 Jan 2023 04:52:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPN6Iy7d3oIkxvkvuKavZhouK8tE01eld4uC8i/nxl7HeIyMVvqe3UOqetEGaa4V3/hULY
X-Received: by 2002:ac8:4a18:0:b0:3b6:8d44:5648 with SMTP id x24-20020ac84a18000000b003b68d445648mr10243592qtq.46.1674219172232;
        Fri, 20 Jan 2023 04:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674219172; cv=none;
        d=google.com; s=arc-20160816;
        b=gt7+nDjfDtgD1xSWtqMBDIo25F49Xs8JokWBWgVeQEIFbLmDRPU+aUERrzbD+8wCpa
         7c9TzoA5jyo4cFzLlOG65nutD+Z37TtK4n79QOS4YOXgeyokckDhA8T3rkRE4Hejic+d
         Af8i2XqbffSmGP4xVSJ7Q9BkQuzeRoBvGTgdfOsUAWl4hHByKg41LQv0h8C/yJcPAh1w
         EoLZUkb/Xpd2Y3gHjQV0ag5PgGlyuwPlLU47GU38Q8bfLraJadkGUHnWjIDuW8tbp1Yf
         Pz03kluaaN0+2LH/OApLR5tc+qKenOEShh4Dfg7txq8gzor+soMA6nuZVbNiSWLVEQ7j
         /ACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=lpQ7GDSyL2zH+51JymoFq5ztKifVfYQm2TMO0tlx7JM=;
        b=FbW+tOJ+Mvm2niX6tF4J7XJqgvpo4umoVDFHA9cpKNmoi0mzaxDfm7qjlLyAYyAtwQ
         USCeTcdGHk/2AWSVkkvNnAyYhsu0NqI5GeeiqjuavYw3OGmS9TVHZlXrfC5O6C5ooEdJ
         H91GSZl5I4mcitZ15MNVdYyCap5TtMzjryRdENQna56K35On+jYpQkhQVaga7dP65bb6
         aME/EEszBMHJg9iH/kWgYe/g6mWQEXmLntim/F0ZvzUZQjfddnqdqOg2gSTsvITcCSAJ
         JhxRJPb/07+bnoBRA+sJBmztMyT6+BYMMQS7OlgEbQd1cfDdGOlgWzJ7VfaGOnaAe0qQ
         Yjaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd5-20020a05622a4d0500b003b68d1f3f7fsi4078274qtb.660.2023.01.20.04.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 04:52:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIqsl-00046b-P6; Fri, 20 Jan 2023 07:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIqsk-0003zg-1B
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 07:52:34 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIqsH-0004id-9o
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 07:52:07 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 93838337A9;
 Fri, 20 Jan 2023 12:51:52 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 20 Jan
 2023 13:51:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00444e9c119-a1d4-4ab4-8bdd-ffcb880b8922,
 B144956C13BBC382596DA5742790BEAB579A3E91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9e75b567-210a-6fd5-24a3-7b0ca47f6447@kaod.org>
Date: Fri, 20 Jan 2023 13:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] tests/avocado: Truncate M2S-FG484 SOM SPI flash to
 16MiB
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Cleber
 Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, Subbaraya Sundeep
 <sundeep.lkml@gmail.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230120122836.81675-1-philmd@linaro.org>
 <20230120122836.81675-3-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230120122836.81675-3-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 23957d53-a32b-4435-b905-1534969a5f07
X-Ovh-Tracer-Id: 10261451754654567276
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefguefgkeeileeikefgfeevgeffvdegueetkeeuudejtdfffeegvdfffeefuddvvdenucffohhmrghinhepvghmtghrrghfthdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpsghlvggrlhesrhgvughhrghtrdgtohhmpdhsuhhnuggvvghprdhlkhhmlhesghhmrghilhdrtghomhdpfigrihhnvghrshhmsehrvgguhhgrthdrtghomh
 dpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: gs5j+OKm0QGD

On 1/20/23 13:28, Philippe Mathieu-Daudé wrote:
> The M2S-FG484 SOM uses a 16 MiB SPI flash (Spansion
> S25FL128SDPBHICO).  Since the test asset is bigger,
> truncate it to the correct size to avoid when running
> the test_arm_emcraft_sf2 test:
> 
>    qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes
> 
> Add comment regarding the M2S-FG484 SOM hardware in
> hw/arm/msf2-som.c.
> 
> Reported-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/arm/msf2-som.c                   | 5 ++++-
>   tests/avocado/boot_linux_console.py | 2 ++
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index a6df473ec9..7b3106c790 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -1,6 +1,9 @@
>   /*
>    * SmartFusion2 SOM starter kit(from Emcraft) emulation.
>    *
> + * M2S-FG484 SOM hardware architecture specification:
> + *   https://www.emcraft.com/jdownloads/som/m2s/m2s-som-ha.pdf
> + *
>    * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>    *
>    * Permission is hereby granted, free of charge, to any person obtaining a copy
> @@ -87,7 +90,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
>   
>       /* Attach SPI flash to SPI0 controller */
>       spi_bus = qdev_get_child_bus(dev, "spi0");
> -    spi_flash = qdev_new("s25sl12801");
> +    spi_flash = qdev_new("s25sl12801"); /* Spansion S25FL128SDPBHICO */
>       qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
>       if (dinfo) {
>           qdev_prop_set_drive_err(spi_flash, "drive",
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 49a4b22fe1..37600be4a2 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -399,6 +399,8 @@ def test_arm_emcraft_sf2(self):
>           spi_hash = '65523a1835949b6f4553be96dec1b6a38fb05501'
>           spi_path = self.fetch_asset(spi_url, asset_hash=spi_hash)
>   
> +        file_truncate(spi_path, 16 << 20) # Spansion S25FL128SDPBHICO is 16 MiB
> +
>           self.vm.set_console()
>           kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE
>           self.vm.add_args('-kernel', uboot_path,


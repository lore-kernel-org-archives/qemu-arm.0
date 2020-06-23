Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3895023lfm;
        Tue, 23 Jun 2020 01:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSdBOi/SilBgXEDO5t9z03YAGahhJdePlqMLrfjMH4zVVE5ty3Yw4DB9IRPD6gKE3VP72f
X-Received: by 2002:a5b:942:: with SMTP id x2mr34572644ybq.273.1592899986356;
        Tue, 23 Jun 2020 01:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592899986; cv=none;
        d=google.com; s=arc-20160816;
        b=AZ4ITK5dHl+xkzr+V4SBg1e1WHdMtviRC2g4XRUTJbwlvvOVqYuzXlU94QveO+YX1O
         A7ZpCtq0i+RyyqcMh+Tp/CFFPeiInXj6uNXU2y8h0LcEFxNt2oBe26M7J+UiT9ZZ8+YR
         D5cvRyJACPRpRQLxA3CJqJ27hz4ZY52Na9E5o/X0TxvEK7znwjO9rq1TSjWMWKSg37v/
         DH47cOn+mQzyj5+/VhxxiLRFvVmRcf5FXZAPHitGauEvGGukJ8GL2J8dnvdr8E4U8dEN
         aefHHMg7aZ+wNO1+y3w+Ij1etszW0NQhVS/XNXO4Xtx0aZdE/hpZAbKwa6pdJZX2MMKP
         haNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=0lm0jNQn/8NuDrC77fx1zRCh4myzeV/8JVJczV/sILY=;
        b=BUkC9NOUimg3RsXWblQWhohzUUscBI/Bq5EOeEkBhvCCy0/PbL1B7PBptvc2d8o3TZ
         +NgOcureAEE62X6ZCFCmMCoM5HKGLd+t6IjCePZGxmKDelxpJ7pI9QQTHLs1Y3r21g0v
         c9/RKsAVop5m0BUIoxWitK4JJEaGSGkeNWDPz+m/OXpMKWvxeWuVYvQNVDYx6Q+I2lNL
         wL2534wLQHw4/u/F1SRAtsvvkQMFOjt09EqNXUWUMuoGNY6a1XqWjbjINScW8WYGjBYI
         /OQiqWKZmx+BgBR1fPDDFBzEaI/gWyG1YX5iWbZI5Oa7AN0H/55Fmb12A2DLELSDxgmp
         dI6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si16615808ybc.337.2020.06.23.01.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 01:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jne3F-0007a9-PJ
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 04:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jne38-0007Yx-Hr
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:12:58 -0400
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:54333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jne36-0004zM-9s
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 04:12:58 -0400
Received: from player695.ha.ovh.net (unknown [10.110.103.91])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 497F696B44
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 10:12:54 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id 2F1191385D479;
 Tue, 23 Jun 2020 08:12:45 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003f3fa0fe8-cfa1-4f1e-ad7b-51eb12a15320,EED1DA90FC9B795DFFB5AB62ED4F19E3D36D96F8)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 3/3] hw/arm/aspeed: QOM'ify AspeedMachineState
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200623072132.2868-1-f4bug@amsat.org>
 <20200623072132.2868-4-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <22e4dc69-03cb-9ba0-5d34-4fbef51dc29c@kaod.org>
Date: Tue, 23 Jun 2020 10:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623072132.2868-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13368372545306266579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekgedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.56.78; envelope-from=clg@kaod.org;
 helo=9.mo69.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 04:12:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ymTwBDoPeOyh

On 6/23/20 9:21 AM, Philippe Mathieu-Daudé wrote:
> AspeedMachineState seems crippled. We use incorrectly 2
> different structures to do the same thing. Merge them
> altogether:
> - Move AspeedMachine fields to AspeedMachineState
> - AspeedMachineState is now QOM
> - Remove unused AspeedMachine structure
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  include/hw/arm/aspeed.h |  8 +-------
>  hw/arm/aspeed.c         | 11 +++++++----
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 5114ba0bd4..09da9d9acc 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -15,13 +15,7 @@ typedef struct AspeedMachineState AspeedMachineState;
>  
>  #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
>  #define ASPEED_MACHINE(obj) \
> -    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
> -
> -typedef struct AspeedMachine {
> -    MachineState parent_obj;
> -
> -    bool mmio_exec;
> -} AspeedMachine;
> +    OBJECT_CHECK(AspeedMachineState, (obj), TYPE_ASPEED_MACHINE)
>  
>  #define ASPEED_MAC0_ON   (1 << 0)
>  #define ASPEED_MAC1_ON   (1 << 1)
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 680345beca..ccf127b328 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -33,9 +33,14 @@ static struct arm_boot_info aspeed_board_binfo = {
>  };
>  
>  struct AspeedMachineState {
> +    /* Private */
> +    MachineState parent_obj;
> +    /* Public */
> +
>      AspeedSoCState soc;
>      MemoryRegion ram_container;
>      MemoryRegion max_ram;
> +    bool mmio_exec;
>  };
>  
>  /* Palmetto hardware value: 0x120CE416 */
> @@ -253,7 +258,7 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
>  
>  static void aspeed_machine_init(MachineState *machine)
>  {
> -    AspeedMachineState *bmc;
> +    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
>      AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
>      AspeedSoCClass *sc;
>      DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
> @@ -261,8 +266,6 @@ static void aspeed_machine_init(MachineState *machine)
>      int i;
>      NICInfo *nd = &nd_table[0];
>  
> -    bmc = g_new0(AspeedMachineState, 1);
> -
>      memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
>                         4 * GiB);
>      memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
> @@ -751,7 +754,7 @@ static const TypeInfo aspeed_machine_types[] = {
>      }, {
>          .name          = TYPE_ASPEED_MACHINE,
>          .parent        = TYPE_MACHINE,
> -        .instance_size = sizeof(AspeedMachine),
> +        .instance_size = sizeof(AspeedMachineState),
>          .instance_init = aspeed_machine_instance_init,
>          .class_size    = sizeof(AspeedMachineClass),
>          .class_init    = aspeed_machine_class_init,
> 


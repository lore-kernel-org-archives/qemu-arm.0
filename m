Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2384742lfm;
        Fri, 17 Jul 2020 05:15:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUV/wM3QKFF0UCuSMQQOXWoHh7FwFFUb/pDcLdrnqcZtf3TTsa4uJUcN7Cm9NNRLoUGsXo
X-Received: by 2002:a25:ac02:: with SMTP id w2mr13482246ybi.499.1594988122662;
        Fri, 17 Jul 2020 05:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594988122; cv=none;
        d=google.com; s=arc-20160816;
        b=LtZRUYJKhMyBikhgvfIhl+AxEBkJUCSHTZ8WDhGUK+XeaiMj218M8GTMlyOb3z5aAO
         JW2yn+616XY7RBgRN0rSLX10Hin8QXtHGW8t72sB+vPCD45h6ac2DMqT56u9oNvKJK0w
         /lhpWMM9dDPNFfQsVmbG3Tp3vagXY/mK1SF3zqQjxBnarpmz/msSClzJK7qUDWSTTP8z
         RXXlUJvJ9F7og2udlzIN7o0OzcfonwpmA4OcGpS8KQbrC6cy7JaOKowP9AzgzDXNorlB
         +j2k7xXo0bOde/BrK6mIKdA0lOb7ZwuLFHb8brxZpsKVpcMITxwuY9SspFo5pcpTLt03
         Ccag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=2qxgexELJ0b8pPicHx8FXSDEFr2wR9/CDmae+4wsjJ8=;
        b=Lgj8NWnphBo+ODoxEtaK8U0UR3Qcqp1QhjEVWpnRuYstohlXh11B+n4VcrrNTb4PT3
         SsNOE42fIAn0E1BtNmLPMlVFktWi5DKwYEo2XM4BPSZRZNLlzM5KLVx9xiAxIfG76sXG
         BYAA+oZtCbrTEOvlU+tiOuA1lsBfVGIPNJcfyw8ynpqzuTLg8uGLk1AAASzegqQTtyB8
         N9XflwJITx+75DmZsLYzJpgqJIdz8mVbxtYguplg57NRBbC9Z4uTv9TfUfNtlRigtoRQ
         7ceNoF5L6dAkJOycAitplPZYurnJ6zJ8It6UnQZ7s3IDapfj6hI1dkwme+QaNmEtd5nb
         xdiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si8489660ybs.137.2020.07.17.05.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 05:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwPGs-00053d-1D
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 08:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jwPGj-00053P-Hu
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 08:15:13 -0400
Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]:54719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jwPGh-00087H-8J
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 08:15:13 -0400
Received: from player795.ha.ovh.net (unknown [10.108.54.74])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id A5E5825D6AF
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2020 14:15:01 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id C3EC5144E1AAA;
 Fri, 17 Jul 2020 12:14:55 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00314731bc6-1c62-4562-8136-01b5a9a5a681,EDCDB8C856EF0F0B0CA5B21EBB7B009702C7510A)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v6 07/13] hw/arm: Load -bios image as a boot ROM for
 npcm7xx
To: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200717060258.1602319-1-hskinnemoen@google.com>
 <20200717060258.1602319-8-hskinnemoen@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b5cf9b0f-9ad9-31b8-12ee-c2f8520b8ffd@kaod.org>
Date: Fri, 17 Jul 2020 14:14:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717060258.1602319-8-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10828060879354170281
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeigdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.46.10; envelope-from=clg@kaod.org;
 helo=4.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 08:15:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kfting@nuvoton.com, Avi.Fishman@nuvoton.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KgTcFUBGFE21

On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> If a -bios option is specified on the command line, load the image into
> the internal ROM memory region, which contains the first instructions
> run by the CPU after reset.
> 
> If -bios is not specified, the vbootrom included with qemu is loaded by
> default.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 0b9dce2b35..f32557e0e1 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -18,12 +18,41 @@
>  
>  #include "hw/arm/npcm7xx.h"
>  #include "hw/core/cpu.h"
> +#include "hw/loader.h"
>  #include "qapi/error.h"
> +#include "qemu-common.h"
>  #include "qemu/units.h"
> +#include "sysemu/sysemu.h"
>  
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
>  
> +static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
> +
> +static void npcm7xx_load_bootrom(NPCM7xxState *soc)
> +{
> +    g_autofree char *filename = NULL;
> +    const char *bootrom;
> +    int ret;
> +
> +    if (bios_name) {
> +        bootrom = bios_name;
> +    } else {
> +        bootrom = npcm7xx_default_bootrom;

you could simply assign bios_name. No need to resend for that.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> +    }
> +
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bootrom);
> +    if (!filename) {
> +        error_report("Could not find ROM image '%s'", bootrom);
> +        exit(1);
> +    }
> +    ret = load_image_mr(filename, &soc->irom);
> +    if (ret < 0) {
> +        error_report("Failed to load ROM image '%s'", filename);
> +        exit(1);
> +    }
> +}
> +
>  static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
>  {
>      memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, dram);
> @@ -60,6 +89,7 @@ static void npcm750_evb_init(MachineState *machine)
>      npcm7xx_connect_dram(soc, machine->ram);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>  
> +    npcm7xx_load_bootrom(soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>  
> @@ -71,6 +101,7 @@ static void quanta_gsj_init(MachineState *machine)
>      npcm7xx_connect_dram(soc, machine->ram);
>      qdev_realize(DEVICE(soc), NULL, &error_fatal);
>  
> +    npcm7xx_load_bootrom(soc);
>      npcm7xx_load_kernel(machine, soc);
>  }
>  
> 


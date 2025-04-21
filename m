Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp1970492njd;
        Mon, 21 Apr 2025 14:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWd874Z+MncR9flX6iYn6zdmrDFZQ7LEy0LYJlD0Soyhr545odPM3WSMEukHXDCt2ygOrN4BV/4/bQn6g==@linaro.org
X-Google-Smtp-Source: AGHT+IEQgD2qVTkJ2bTtsgzEGhWHv2tJA2kbjhqXJEWVWp6JSIYQQLWgGzPXti4EAUo7U7uEk8Vg
X-Received: by 2002:a05:6214:1d09:b0:6e8:ffb6:2f8e with SMTP id 6a1803df08f44-6f2c4645424mr267720206d6.32.1745269278746;
        Mon, 21 Apr 2025 14:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745269278; cv=none;
        d=google.com; s=arc-20240605;
        b=RTrnW8/VQnv/U3xP8eq4tQpmmSRQn2XK6FSokn4+x/TUkDQ2r7D2jeXZ1ouQNKrPOA
         WxL74tQKqK9yyXarTR37ta59nZ1pOPjI6EDVfJEWIAJTTfIF5wKr/IxWGDTnUBdFpjjL
         PWC+FTbyMdQgBJPMsxc/MRkrCBZmjnP+fbRbLbG+XYJ4rHaHuyVjTOp8BKd923neKtaD
         xH4QlEcv2ASEQJw0WCYuaFB3tWiOZ6Nqa3sanS95dhUf/DQihXmgUzCY5vUrJT9/RdQs
         IP4P/YxMnbv9DMWVIkW8+8SFV76FD8jMShH8gw9pepAhdVYdFi3SaVa7dh8u4dmjqbC1
         t/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=C1VdIIeoPxMLbxTPe0EG1qR27/0767jbqELPtiK4x5k=;
        fh=aTXBRWvcUi1tLADA5DrDnV7F47mfdIt5smkQi/SmRpk=;
        b=JRdI+HRYfLbCXjiXfsP4OR01bRa6S+3k05HRIwz55crreoiswRm8L9A5tSvLM3Y9xg
         pugrG3W4awmQJA9r9P5c39Z7Pa3N+EsRxJ1FNnS1vGfR9OcIFEr2UEF6MgDOjjswiyqO
         uEPKkWYpoXaN1xPc9fIi3UGHG//2R51Ci4zMR0L1HNl/gngsLtcsM3sJlkQiaiCuUFWq
         NWSitjZ3T9bMuMDZMKz0/Iy4KVy1cmgp+SX1cnYKIbdt5+lVO2wPVWwohOcEmq6LRvE2
         Pw3NYoxma8+Hzj7ZbVBFwX2Swv77wkzFuVhJee6XmiXEllt6gBYt2l2Q9rks3nEAX57T
         yYxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2b207ccsi98223686d6.114.2025.04.21.14.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Apr 2025 14:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u6yGJ-0004hm-LQ; Mon, 21 Apr 2025 17:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=X3PK=XH=kaod.org=clg@ozlabs.org>)
 id 1u6yGH-0004gJ-4q; Mon, 21 Apr 2025 17:01:05 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=X3PK=XH=kaod.org=clg@ozlabs.org>)
 id 1u6yGE-0005ck-5k; Mon, 21 Apr 2025 17:01:04 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZhHpH51k9z4x3p;
 Tue, 22 Apr 2025 07:00:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhHpB5HMbz4wd0;
 Tue, 22 Apr 2025 07:00:47 +1000 (AEST)
Message-ID: <85a2947e-6909-4311-8b58-f9eb8045e76c@kaod.org>
Date: Mon, 21 Apr 2025 23:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] hw/arm/aspeed: Add support for loading vbootrom
 image via "-bios"
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
 <20250417031209.2647703-7-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250417031209.2647703-7-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=X3PK=XH=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: ImNiaU+8JErW

On 4/17/25 05:12, Jamin Lin wrote:
> Introduce "aspeed_load_vbootrom()" to support loading a virtual boot ROM image
> into the vbootrom memory region, using the "-bios" command-line option.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Nabih Estefan <nabihestefan@google.com>
> Tested-by: Nabih Estefan <nabihestefan@google.com>
> ---
>   include/hw/arm/aspeed.h |  1 +
>   hw/arm/aspeed.c         | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 973277bea6..2b8332a7d7 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -41,6 +41,7 @@ struct AspeedMachineClass {
>       uint32_t uart_default;
>       bool sdhci_wp_inverted;
>       bool vbootrom;
> +    const char *vbootrom_name;

I don't think adding a class attribute for the default firmware
image file is that useful. A define should be enough :

     #define VBOOTROM_FILE_NAME  "ast27x0_bootrom.bin"

and use VBOOTROM_FILE_NAME when defining the bios_name variable.

Unless you already plan to have different default firmware files
for the ast27* machines ?


>   };
>   
>   
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index b70a120e62..7f11371f02 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -27,6 +27,7 @@
>   #include "system/reset.h"
>   #include "hw/loader.h"
>   #include "qemu/error-report.h"
> +#include "qemu/datadir.h"
>   #include "qemu/units.h"
>   #include "hw/qdev-clock.h"
>   #include "system/system.h"
> @@ -305,6 +306,34 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
>                      rom_size, &error_abort);
>   }
>   
> +/*
> + * This function locates the vbootrom image file specified via the command line
> + * using the -bios option. It loads the specified image into the vbootrom
> + * memory region and handles errors if the file cannot be found or loaded.
> + */
> +static void aspeed_load_vbootrom(MachineState *machine, uint64_t rom_size,
> +                                 Error **errp)
> +{
> +    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
> +    const char *bios_name = machine->firmware ?: amc->vbootrom_name;
> +    g_autofree char *filename = NULL;
> +    AspeedSoCState *soc = bmc->soc;
> +    int ret;
> +
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> +    if (!filename) {
> +        error_setg(errp, "Could not find vbootrom image '%s'", bios_name);
> +        return;
> +    }
> +
> +    ret = load_image_mr(filename, &soc->vbootrom);
> +    if (ret < 0) {
> +        error_setg(errp, "Failed to load vbootrom image '%s'", bios_name);
> +        return;
> +    }
> +}
> +
>   void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>                                         unsigned int count, int unit0)
>   {
> @@ -483,6 +512,11 @@ static void aspeed_machine_init(MachineState *machine)
>           }
>       }
>   
> +    if (amc->vbootrom) {

what about the "aspeed.boot_rom" region ? Is it ok to have both ?


Thanks,

C.



> +        rom_size = memory_region_size(&bmc->soc->vbootrom);
> +        aspeed_load_vbootrom(machine, rom_size, &error_abort);
> +    }
> +
>       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
>   }
>   
> @@ -1691,6 +1725,7 @@ static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
>       amc->uart_default = ASPEED_DEV_UART12;
>       amc->i2c_init  = ast2700_evb_i2c_init;
>       amc->vbootrom = true;
> +    amc->vbootrom_name = "ast27x0_bootrom.bin";
>       mc->auto_create_sdcard = true;
>       mc->default_ram_size = 1 * GiB;
>       aspeed_machine_class_init_cpus_defaults(mc);
> @@ -1712,6 +1747,7 @@ static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc, void *data)
>       amc->uart_default = ASPEED_DEV_UART12;
>       amc->i2c_init  = ast2700_evb_i2c_init;
>       amc->vbootrom = true;
> +    amc->vbootrom_name = "ast27x0_bootrom.bin";
>       mc->auto_create_sdcard = true;
>       mc->default_ram_size = 1 * GiB;
>       aspeed_machine_class_init_cpus_defaults(mc);


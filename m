Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6186370njk;
        Thu, 26 Dec 2024 23:57:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUm+Q+SM2T5Wi25hp+m/IJC7uh2wQq1HudiP3PVYkWXQdMHCEDdyMm/or4hZLugPUvJAPGE8ytpXH9d0w==@linaro.org
X-Google-Smtp-Source: AGHT+IE+E9VFazsXo3qmzgLMVnZnCuPeE4gQmR4OVZGZE4mk9tvkXobJqkghp/Adw5HsL76sfe+t
X-Received: by 2002:a05:620a:2697:b0:7a9:9f44:3f8 with SMTP id af79cd13be357-7b9bac05c6cmr3874330385a.5.1735286234639;
        Thu, 26 Dec 2024 23:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735286234; cv=none;
        d=google.com; s=arc-20240605;
        b=JwOjFqpl42cMGy8tyhYL1S2JiuhzGRCs3hETNUFM85vWJAdmJuSqkyeA/PED/AdiVW
         w59XahT6XZNFlstCNpWsbZPlseGiV/y6HAy1ZIR5eCrTkFmL5B9FQRsjCyK2JZtKMKBr
         uJvlWqpFHMpqkTwGgfrPUEaUw1XAZt0XEOuynQ+9dsWAKji9h0a17+PZFwWvJCcK6Fli
         s0PJGheL86at+SdNA5+ENVDl0UVth9329W1H1SI7u0DR96pY8bE5xMe1bVf3LHBlxFnR
         clkngwAW3Na9pFPMeTooX/rXpS1IThSkD2uwVyDdjk9j1L42E/YUkbxlNrGsdt8x50rv
         UwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=tWNtR55HRRA8wl7yJIGk9xDF/kKrRv0sIzeFdkyHX1o=;
        fh=zRGHzg0QSvglehTRa45zTc999PxcMC/xgiADOP0n0i8=;
        b=K5o0nzYlM7DHEC8eEKRxIWcrHstBRiSdk/+4CZTLxAJVJNMkJ6xLkGrFpw9K/vVqWA
         Ji4EP6wnoJ3fW51PlNzeXZDNU9WF2T6rvCmitWmVy9g/eGfIm5mEMzwjmXVOXUTdTwK4
         2jaRHiq6YbkBOgVSFLvpK4jqhspH0qPyqeGSeBAZFGZFlfmlL1HSs25VFx8Ohx53sZlw
         aYmXI9KYNImdJN9fhcYK1iKznf7jdSbgLOp7O8QGtURUgSnGukU5wUpBlrpvFsA3EgYy
         LvrWv7DGjjAeJnEAm+y+1sym5CjSVhKdQOoOR9zQkAoMik/9rbMMHxR3mMFsSzBBGaM5
         9tpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac478f42si2045679585a.211.2024.12.26.23.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 23:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tR5DO-0005Tk-Qv; Fri, 27 Dec 2024 02:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TB6Z=TU=kaod.org=clg@ozlabs.org>)
 id 1tR5DM-0005Sy-42; Fri, 27 Dec 2024 02:56:56 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TB6Z=TU=kaod.org=clg@ozlabs.org>)
 id 1tR5DJ-0001DM-Sa; Fri, 27 Dec 2024 02:56:55 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4YKHrQ0cgmz4x4t;
 Fri, 27 Dec 2024 18:56:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YKHrL3bRsz4x0G;
 Fri, 27 Dec 2024 18:56:31 +1100 (AEDT)
Message-ID: <b915cf10-8b1a-428d-beb0-f3d6f9ce816a@kaod.org>
Date: Fri, 27 Dec 2024 08:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] aspeed: Make sdhci_attach_drive and write_boot_rom
 public
To: Steven Lee <steven_lee@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
 <20241225020311.3718080-2-steven_lee@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20241225020311.3718080-2-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=TB6Z=TU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.169, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CQFjI7C2JG2N

On 12/25/24 03:03, Steven Lee wrote:
> sdhci_attach_drive and write_boot_rom functions may be used by
> the aspeed machine supporting co-processors.

I would move these routines to aspeed_soc_common.c file and rename them
with an aspeed_ prefix.


Thanks,

C.



> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/arm/aspeed.c         | 4 ++--
>   include/hw/arm/aspeed.h | 6 ++++++
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a18d4ed1fb..62ac8b7206 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -256,7 +256,7 @@ static void aspeed_reset_secondary(ARMCPU *cpu,
>       cpu_set_pc(cs, info->smp_loader_start);
>   }
>   
> -static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
> +void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
>                              Error **errp)
>   {
>       g_autofree void *storage = NULL;
> @@ -325,7 +325,7 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>       }
>   }
>   
> -static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
> +void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
>                                  bool boot_emmc)
>   {
>           DeviceState *card;
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index cbeacb214c..bba224c357 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -10,7 +10,9 @@
>   #define ARM_ASPEED_H
>   
>   #include "hw/boards.h"
> +#include "hw/sd/sdhci.h"
>   #include "qom/object.h"
> +#include "system/blockdev.h"
>   
>   typedef struct AspeedMachineState AspeedMachineState;
>   
> @@ -41,5 +43,9 @@ struct AspeedMachineClass {
>       uint32_t uart_default;
>   };
>   
> +void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
> +                               bool boot_emmc);
> +void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
> +                           Error **errp);
>   
>   #endif


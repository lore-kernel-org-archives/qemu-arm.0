Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3379003njb;
        Tue, 9 Jul 2024 08:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJPIkvikEEpDqhf/V1RBkVfAPI2WjTplfD+QWkS5lWRGgMCPV9lc2YAmuUN31GOOJDNppDAnR3dL92LCIFjY4yKR5u14wy
X-Google-Smtp-Source: AGHT+IGJ6NiH/AHvkwEaWEW+MyXplSMmm0Onw9hqbI/r4+hUkLKaVLnomojPNyhEA0GUPwsijJSx
X-Received: by 2002:a05:6214:5016:b0:6b2:ccb5:8b7b with SMTP id 6a1803df08f44-6b61da1bd6dmr41115946d6.31.1720540761111;
        Tue, 09 Jul 2024 08:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720540761; cv=none;
        d=google.com; s=arc-20160816;
        b=LUqmhZWf37eHONY5XVG5RkzihWIyTMvhwq2JJpIWoJlMzS8T0R95qb0FydMwz9Hwmw
         ReBVPORZUl4vGfVEbA2bA3CdVxOoIj6XAsi2WKVJ09q1P9IWjeJRK6/bS2PF7ehi765A
         lsWwzkKmtk7zjyoDg4oeWaSBzfUzHBVEb39ljEEVj9dUwXoT55KeGCYKshmV0Uzh9iF1
         X+qoKB4WCMuYrLwVESE/0vYdJFO7u1dUrZXb2eADwa2cDel7uql5MRbqC3iFFx11MC7y
         h1oINOhBhoT5M1Ny00KVhJqOROsvV6lQD40wY9R1tdRlFS5YEh3IzAwaq95wQRXOuU17
         PIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Un7CxtJiA3pjI23GGb8Lc/DjT+zkmi4I7Ayxrp9iHEc=;
        fh=pXQCCfdofZB5e4ZqzVRXiVuRGYeJnl2WhJnhDCL9qiQ=;
        b=tNlwrnDaeI3MvvAwIXmG0MvZbHf7bSpM/HaAMHme6CA0ihv4tUQgLBv/yunSwMS48N
         Ir6UW7Q/TMnDYzWcqlRErQvVcd+d058gn7fR0U3+BAGLwzZrC2E9odMb1OoJD+ZuUaAx
         ykit1rh+fSXPVR+Z0/0FKGFTjKh7pMngJWmJzHkYgLF8sUBU0xuALd1HeHys6NlYmqH4
         oB5F9MR+eadXxzB4gL6h1dqqP9ruPs6Ea2pm/EurgFuCYmo+412+l3raveKCz+OfD6HL
         zXlamW2hrtzFu1mSsSZGzQ+rH49fdoVUJk92KccfJRSODBKSYIbuIIHE3ktViMk7EH7k
         Dpww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61b9f78bcsi25248486d6.48.2024.07.09.08.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRDF9-0003N4-KR; Tue, 09 Jul 2024 11:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRDF3-000301-Uy; Tue, 09 Jul 2024 11:58:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org>)
 id 1sRDF0-0004II-Ja; Tue, 09 Jul 2024 11:58:57 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WJQdd5VYrz4x0w;
 Wed, 10 Jul 2024 01:58:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJQdY5YM8z4wny;
 Wed, 10 Jul 2024 01:58:40 +1000 (AEST)
Message-ID: <e9c273ff-32bd-40fc-8f50-cb47784cf741@kaod.org>
Date: Tue, 9 Jul 2024 17:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v47 00/19] hw/sd/sdcard: Add eMMC support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
References: <20240709152556.52896-1-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=H1KF=OJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: HD7sPcDuauYR

On 7/9/24 5:25 PM, Philippe Mathieu-Daudé wrote:
> Since v42:
> - Stick to spec v4.3 (re-simplified EXT_CSD register & migrate)
> - Fill CID register
> - Few changes to CSD register
> - Implement 'boot-mode' reset timing
> - Add 'boot-size' property
> 
> Change required for aspeed branch:
> -- >8 --
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 8c0e36badd..563816b710 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -344,3 +344,3 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc,
>           if (emmc) {
> -            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 0x48 : 0x0);
> +            qdev_prop_set_uint64(card, "boot-size", 1 * MiB);
>           }
> (I'm still reluctant to merge patches 16-18)...

Then, please drop all changes related to the boot partitions. I will keep
the original patches in my tree and address the feature when I have time.
TYPE_EMMC is already great to have.

Thanks,

C.



> ---
> 
> Cédric Le Goater (2):
>    hw/sd/sdcard: Add emmc_cmd_SET_RELATIVE_ADDR handler (CMD3)
>    hw/sd/sdcard: Fix SET_BLOCK_COUNT command argument on eMMC (CMD23)
> 
> Joel Stanley (3):
>    hw/sd/sdcard: Support boot area in emmc image
>    hw/sd/sdcard: Subtract bootarea size from blk
>    hw/sd/sdcard: Add boot config support
> 
> Luc Michel (1):
>    hw/sd/sdcard: Implement eMMC sleep state (CMD5)
> 
> Philippe Mathieu-Daudé (11):
>    hw/sd/sdcard: Basis for eMMC support
>    hw/sd/sdcard: Register generic command handlers
>    hw/sd/sdcard: Register unimplemented command handlers
>    hw/sd/sdcard: Implement emmc_set_cid()
>    hw/sd/sdcard: Implement emmc_set_csd()
>    hw/sd/sdcard: Add mmc_cmd_PROGRAM_CID handler (CMD26)
>    hw/sd/sdcard: Add eMMC 'boot-size' property
>    hw/sd/sdcard: Simplify EXT_CSD values for spec v4.3
>    hw/sd/sdcard: Migrate ExtCSD 'modes' register
>    hw/sd/sdcard: Implement eMMC 'boot-mode'
>    hw/sd/sdcard: Enable TYPE_EMMC card model
> 
> Sai Pavan Boddu (1):
>    hw/sd/sdcard: Add mmc SWITCH function support (CMD6)
> 
> Vincent Palatin (1):
>    hw/sd/sdcard: Add emmc_cmd_SEND_EXT_CSD handler (CMD8)
> 
>   include/hw/sd/sd.h |   4 +
>   hw/sd/sd.c         | 424 ++++++++++++++++++++++++++++++++++++++++++++-
>   hw/sd/trace-events |   3 +
>   3 files changed, 425 insertions(+), 6 deletions(-)
> 


Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2912317njd;
        Wed, 23 Apr 2025 02:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwz8eKmZ7CqqAaP9AR+Vk6RaEclXv9tcAO0YZkCnggpAyzZyffLNNbb7a/QjONClqdusiUVq28RViMiA==@linaro.org
X-Google-Smtp-Source: AGHT+IHlVFA7DERDJqWaxV3S5Rc8gu/Z1zqnLV6yAr5VXRBG8jwKEJKbjG/Q/bIIm/Dn1ZiwI71W
X-Received: by 2002:a05:620a:1790:b0:7c5:467f:d130 with SMTP id af79cd13be357-7c9280185damr3628430785a.36.1745401033420;
        Wed, 23 Apr 2025 02:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745401033; cv=none;
        d=google.com; s=arc-20240605;
        b=JFPDMz/mkEcYqAxoz84yoq4eL5I7azxfhqet690Nzygya2wnyy1AKUx3N4pd/+La7C
         DZIeuLVxgRQPyNpkFFJxOyfIls2GwHcxlM9EV2Guo8bjTnyG/EEzzMaKGGUj4JMHnIA1
         gAN8aNAACBdq94vsgLpjdAzeq6NWItF9+a7Itk8U4vWU2fsvHenlmlD3uEA2wBT43EhE
         n2c4cv6tn20OgxZl8HeGPxG16PgrEDEbNYRMzcqWA2ejXR/RBLn2wi8vglKUXk7zWWi+
         Py/Rn67UV46IU3+4IAZGmqYn6wCM4xeQzNFIxHF9s/0RgcMBZsOpVcAjQo6m/M04QVfR
         gw6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=HD5CBXtetg9+e0McdRarlSZprJLWO3Z8TY9UWQRa/p4=;
        fh=aTXBRWvcUi1tLADA5DrDnV7F47mfdIt5smkQi/SmRpk=;
        b=HTG9ivPJakpTL0rbnsMHxuUFRtVs7ylJVlcCsXT1y3Pef4p3gzIXXW1q949DUJNeXL
         Q/s7fIbV8XPypihmYSaxctiUg+w1HWOsW3z9hofyIg/g/Ls4l/AVciGrSEmrghx+mn1j
         fB7XKZBWLM4RA3hZYKEzCvlmntX9x5uNHtRgbDm4ZAyOszdmXRItR6VgiPX+fGSYGqHh
         71CigTWF9okLJPjriDDfgumvovda/K4kcNqZrclJ/PYh42BxuOqJ74CbrkYpFMGxlTrL
         wADdg5+jGSwJNoQHAC1aTLIrzbCD0eU7VhIhXE7WSZJhEW7ZEzeOyT5w1M88OkemEpHC
         OduA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925bf8590si1343561885a.595.2025.04.23.02.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 02:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7WXR-0000st-9i; Wed, 23 Apr 2025 05:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=wlG+=XJ=kaod.org=clg@ozlabs.org>)
 id 1u7WXP-0000rq-8l; Wed, 23 Apr 2025 05:37:03 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=wlG+=XJ=kaod.org=clg@ozlabs.org>)
 id 1u7WXM-0007qY-Kp; Wed, 23 Apr 2025 05:37:03 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZjDX568Gwz4xPQ;
 Wed, 23 Apr 2025 19:36:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZjDX22vVSz4xN6;
 Wed, 23 Apr 2025 19:36:50 +1000 (AEST)
Message-ID: <52aa4d05-c1a4-480a-af82-b244bf046a28@kaod.org>
Date: Wed, 23 Apr 2025 11:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/11] Support vbootrom for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=wlG+=XJ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: na88xxWODqUI

On 4/23/25 09:23, Jamin Lin wrote:
> v1:
>    Add initial support for AST27x0
>    The purpose of vbootrom here is to simulate the work of BootMCU SPL (riscv)
>    in AST2700, because QEMU doesn't support heterogenous architecture yet.
> 
>    ast27x0_bootrom.bin is a simplified, free (Apache 2.0) boot ROM for
>    ASPEED AST27x0 BMC SOC. It currently implements the bare minimum to
>    load, parse, initialize and run boot images stored in SPI flash, but may grow
>    more features over time as needed. The source code is available at:
>    https://github.com/google/vbootrom
> 
> v2:
>    Add "Introduced ASPEED_DEV_VBOOTROM in the device enumeration" patch to fix
>    build failed.
> 
> v3:
>    1. Supports both vbootrom and device loader boot methods, with vbootrom used as
>    the default.
>    2. Fix review and QTEST test failed issues.
> 
> v4:
>    Adjust the patch order.
>    
> v5:
>    fix review issue and remove unnecessary class attribure.
>    doc: create a new section for AST2700.
> 
> Jamin Lin (11):
>    hw/arm/aspeed_ast27x0: Rename variable sram_name to name in ast2700
>      realize
>    hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
>    hw/arm/aspeed: Add vbootrom support on AST2700 EVB machines
>    hw/arm/aspeed: Reuse rom_size variable for vbootrom setup
>    pc-bios: Add AST27x0 vBootrom
>    hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
>    tests/functional/aspeed: Move I2C test into shared helper for AST2700
>      reuse
>    tests/functional/aspeed: Update test ASPEED SDK v09.06
>    tests/functional/aspeed: extract boot and login sequence into helper
>      function
>    tests/functional/aspeed: Add to test vbootrom for AST2700
>    docs/system/arm/aspeed: Support vbootrom for AST2700
> 
>   MAINTAINERS                             |   1 +
>   docs/system/arm/aspeed.rst              |  96 ++++++++++++++++++++++--
>   include/hw/arm/aspeed.h                 |   1 +
>   include/hw/arm/aspeed_soc.h             |   2 +
>   hw/arm/aspeed.c                         |  40 +++++++++-
>   hw/arm/aspeed_ast27x0.c                 |  17 ++++-
>   pc-bios/README                          |   6 ++
>   pc-bios/ast27x0_bootrom.bin             | Bin 0 -> 15424 bytes
>   pc-bios/meson.build                     |   1 +
>   tests/functional/test_aarch64_aspeed.py |  82 +++++++++++++-------
>   10 files changed, 209 insertions(+), 37 deletions(-)
>   create mode 100644 pc-bios/ast27x0_bootrom.bin
> 


Applied patches 1,7,8,9 to aspeed-next.

Thanks,

C.



Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp715428ejn;
        Wed, 26 Oct 2022 10:20:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7zsleXukl+89L0ney4TZDLAcrbwyV5fC9YLUtU7/cYyJ5QHKKqq8YBYZlrxAFuvR4Tqi6N
X-Received: by 2002:a05:620a:a41:b0:6f1:8521:613b with SMTP id j1-20020a05620a0a4100b006f18521613bmr15620408qka.369.1666804818183;
        Wed, 26 Oct 2022 10:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666804818; cv=none;
        d=google.com; s=arc-20160816;
        b=g/GUOQ93xwcaxVGqp7ZUivBdc1KXNWPpaMmZXdAVmkcoNYGbQypOZxc2D10fDgt0SZ
         7W4WeMr0/Zctvf79ZA4YAAG8aD2eEbeX99iiW2frVH+j+EK/YWxl79u0YQ2KMBcjKokb
         keKbQLnfUQI4CWaKmtSsfwiSxJ37qPiBQULpN8Z1qLPuVQsdl3iKxN+R+F+N1O3SBBZP
         WLIgGxCEic9qS7rGCqN8im5HJYMBNCemPYRjt9UX/+Pka8Ufm+YH2HCGPIWelbmuu/iV
         8U4BBHiqEdG5LICzKOq+ojEK7ZdOefm1yOFnh5OBDEVdXjQU9ZU2hjB3VugoFZv4/kS8
         qRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5P4BTzNSeateEHlwduTsUyKhXBMrMLPnZjYqNpbtKpQ=;
        b=aPjOGPnu7pueo73VWILLZSXdoz2aD9rashq2HkwhlQ38TgLQWOkQXTiHM47B4LyO+n
         ZuqWR/Y0M/TVXzEAwWomM5Ky412Bp7LWJUn/401mFJSwRVHrZe6HheXoMXBByEHd6x3t
         qha3LTJ1ulVI1cJ603eoc7NHOno9vh6D9rsO9+81WcAGwhBlaTtNIdJKpfTCzvMsXCr6
         KCTcI994bItGRcaqmYoinEqeFYyNSqQdgNp1wSX0r/6E3AIGeynVhq1on6IvI/oF0hm6
         3JqzDUdopLOx5j8xA5mlJc8JkWQiCfjDmTVE6qFdcKpQFc3yHQFWyBuLkPBRF8lCAuT1
         vRmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bM76kBGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18-20020ae9d612000000b006d9d641950fsi3832286qkk.700.2022.10.26.10.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 10:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bM76kBGO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onk36-0003a3-R2; Wed, 26 Oct 2022 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onk2v-0002aY-Ut; Wed, 26 Oct 2022 13:18:34 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onk2r-0007dS-HZ; Wed, 26 Oct 2022 13:18:27 -0400
Received: by mail-oi1-x232.google.com with SMTP id s206so6062342oie.3;
 Wed, 26 Oct 2022 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5P4BTzNSeateEHlwduTsUyKhXBMrMLPnZjYqNpbtKpQ=;
 b=bM76kBGO4TtJqEF1yqBqQio78M6EIF9BxoXqLI9RaFMaddCnadjbbupOcLMWRUSG+H
 EO0S6r5VsY1TcwYEGlt1XclD/hzBL7BmKSYvvorlcv5GMBpjl8JTnlFqML0bJVQAIITB
 8129AYmVKWkNN0qDZJzrNGOcR3CAHl2NxTDF74INO3c/LeOUvXYwa+Cxoj38vHs+3l9X
 z2W83xEYcCSidxp/VJRriizwGRQyfU4FPaxqu/wMJdErVXibJoAfTHfuvvCzJVstZX7O
 PYCeBGeOuso9bPvlqyZTH17o3SRCNH0k/AstDajx7oxAP4yZSFlCNge7fmSQtYl59vTX
 k/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5P4BTzNSeateEHlwduTsUyKhXBMrMLPnZjYqNpbtKpQ=;
 b=Ij6cv//6gRaoDQBLnQGRl2ivo9nSITW0MX3tlRvJxM4UWSpZhOLJQKbxQmmSjXkOrb
 4WBwu9YvhtgZlQNECdjiKm4hO7iBWGlQXYCbhFTIBJu97x5WbXHzug6rgYAo+IEuIemI
 wgTy8SRjgXMbial+w107WL72NLgXFk3YcrraFbIziaL+4PVlS30Ml4VQaSY00/c38Unp
 0XysTDPFG9B13NOnjZMV7s88rp/ulkBoHbG4zaa0YUAlPRprOoqBH3vead5rJfhE6hOf
 bSn6+wXIe7kFjokBkcpRepQ9TIfsUarJSBApaNyYisymty+Ui/sHZdIoxFwg6VlRflbC
 ib6Q==
X-Gm-Message-State: ACrzQf3lM7mzK0wc9hubihNphppDwMHayBYot4U1g4WoRQpdAfm9uKXZ
 dfjjwZV4IVw9V4k1Lrtk84Q=
X-Received: by 2002:aca:df8b:0:b0:350:e9a8:1627 with SMTP id
 w133-20020acadf8b000000b00350e9a81627mr2426862oig.68.1666804703192; 
 Wed, 26 Oct 2022 10:18:23 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a9d6654000000b00661b46cc26bsm2382051otm.9.2022.10.26.10.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 10:18:22 -0700 (PDT)
Message-ID: <7e76dbc2-ff48-1f08-36c3-8eae41591752@gmail.com>
Date: Wed, 26 Oct 2022 14:18:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/7] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0rLjCJCKrc/i

Hi,

Since this is being sent to qemu-ppc and has to do with e500 I decided to
take a look. I acked the e500 related patches, 5 and 7. Patch 6 LGTM as well
but I'd rather not ack it it's SD specific code.

I'll send a PowerPC pull request this week. I can grab this series via the ppc
tree if someone with SD authority acks patch 6.


Thanks,


Daniel





On 10/18/22 18:01, Bernhard Beschow wrote:
> Cover letter:
> ~~~~~~~~~~~~~
> 
> This series adds support for -pflash and direct SD card access to the
> PPC e500 boards. The idea is to increase compatibility with "real" firmware
> images where only the bare minimum of drivers is compiled in.
> 
> The series is structured as follows:
> 
> Patches 1-4 perform some general cleanup which paves the way for the rest of
> the series.
> 
> Patch 5 adds -pflash handling where memory-mapped flash can be added on
> user's behalf. That is, the flash memory region in the eLBC is only added if
> the -pflash argument is supplied. Note that the cfi01 device model becomes
> stricter in checking the size of the emulated flash space.
> 
> Patches 6 and 7 add a new device model - the Freescale eSDHC - to the e500
> boards which was missing so far.
> 
> User documentation is also added as the new features become available.
> 
> Tesing done:
> * `qeu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
> "console=ttyS0 rootwait root=/dev/mtdblock0 nokaslr" -drive
> if=pflash,file=rootfs.ext2,format=raw`
> * `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
> "console=ttyS0 rootwait root=/dev/mmcblk0" -device sd-card,drive=mydrive -drive
> id=mydrive,if=none,file=rootfs.ext2,format=raw`
> 
> The load was created using latest Buildroot with `make
> qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 type.
> In both cases it was possible to log in and explore the root file system.
> 
> v4:
> ~~~
> Zoltan:
> - Don't suggest presence of qemu-system-ppc32 in documentation
> 
> Bin:
> - New patch: docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
> 
> Peter:
> - Inline pflash_cfi01_register() rather than modify it (similar to v2)
> 
> v3:
> ~~~
> Phil:
> - Also add power-of-2 fix to pflash_cfi02
> - Resolve cfi01-specific assertion in e500 code
> - Resolve unused define in eSDHC device model
> - Resolve redundant alignment checks in eSDHC device model
> 
> Bin:
> - Add dedicated flash chapter to documentation
> 
> Bernhard:
> - Use is_power_of_2() instead of ctpop64() for better readability
> - Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS)
> - Rebase onto gitlab.com/danielhb/qemu/tree/ppc-next
> 
> v2:
> ~~~
> Bin:
> - Add source for MPC8544DS platform bus' memory map in commit message.
> - Keep "ESDHC" in comment referring to Linux driver.
> - Use "qemu-system-ppc{64|32} in documentation.
> - Use g_autofree in device tree code.
> - Remove unneeded device tree properties.
> - Error out if pflash size doesn't fit into eLBC memory window.
> - Remove unused ESDHC defines.
> - Define macro ESDHC_WML for register offset with magic constant.
> - Fix some whitespace issues when adding eSDHC device to e500.
> 
> Phil:
> - Fix tense in commit message.
> 
> Bernhard Beschow (7):
>    docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>    hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power of
>      two
>    hw/sd/sdhci-internal: Unexport ESDHC defines
>    hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>    hw/ppc/e500: Implement pflash handling
>    hw/sd/sdhci: Implement Freescale eSDHC device model
>    hw/ppc/e500: Add Freescale eSDHC to e500plat
> 
>   docs/system/ppc/ppce500.rst |  38 +++++++-
>   hw/block/pflash_cfi01.c     |   8 +-
>   hw/block/pflash_cfi02.c     |   5 +
>   hw/ppc/Kconfig              |   2 +
>   hw/ppc/e500.c               | 114 +++++++++++++++++++++-
>   hw/ppc/e500.h               |   1 +
>   hw/ppc/e500plat.c           |   1 +
>   hw/sd/sdhci-internal.h      |  20 ----
>   hw/sd/sdhci.c               | 183 +++++++++++++++++++++++++++++++-----
>   include/hw/sd/sdhci.h       |   3 +
>   10 files changed, 324 insertions(+), 51 deletions(-)
> 

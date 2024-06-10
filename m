Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp550725ejb;
        Mon, 10 Jun 2024 02:25:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjsqhHRAxZjB2sNg9SqcXVIiK+Rc+wOOrCy7FXu72ey8HoPFAhYzvV967E7giRc+yo7o0unsA6NLuMNKjzira/nnNKMuhR
X-Google-Smtp-Source: AGHT+IGKVUIEZb6auCs1LQ3CGxfPGXv17n3QT7yjnO3CfE8Uj6P4EM7G6uqGkBTamKT2DCqC5miN
X-Received: by 2002:a67:fb48:0:b0:48c:403b:85ce with SMTP id ada2fe7eead31-48c403b862amr3000828137.13.1718011503685;
        Mon, 10 Jun 2024 02:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718011503; cv=none;
        d=google.com; s=arc-20160816;
        b=ky+M+QkYX5fjCeomm6M4DYjEcozNh2ZNaG/HZixAKXe4jEUT+kPS6+PNZpUxm3qh5I
         hRUG0Gr22J80iZa/qzgs3ZNA/VXeIkU07J9f2oa/qZZ4bAo0Tk26yCvtYZ7oGeV4i9Y9
         Bsazga5kJPwBZXGXTWtqCNRnMWeJUlTYgIrz7I7z7uP5vxu38323uSDMJvEDUT4usD62
         QQqwRYO2m5RMEXhX+Od1js3WN9Z5TRukGJAEvEYh43hgcf8saaDbaJjCHCzCVs/JmEBF
         Ks7gDqovmqL8DnBFhh3ISzjuz4ZIjSS+fLcWU5vfoNkOGfOllxnnJG/uKU3oTkx9GAUE
         HIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=L27De4W6HmYEdpkot2yNhZWmv9vhv7D6ULt3RNP/09c=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=AmEMzRqX+gr4Acd2cQGNP2TGNahmm1zfvp+653ktYjupsIwMKUn1D4PHwQSKP9cE1F
         h66dcdF6VPmmrZjXkNMrhulNPbt8W5BsYw9Qd/d4fPieGIqRsxhEKvdCTqC+63DQRfJC
         7sihV96rsKCLx7aR2kiO3mLFoBXVs/0D/eWyIhuwNtt7UpbUaxEKk35tpCPoitw6xSqW
         4FcmZz4wrGf4KLc7fv27n/uNZHzs/P7fo0BKATu1Rir3aQzSm9r9ZKKvd0Y584gjJAoA
         bAOrvV8xFRXZ0dmxb2uCb/Ju3I/Zu39SoJvR750acLvBSqF73r9hNumnl3kY6MwFeO2E
         gNag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7955f1b3baasi312470685a.197.2024.06.10.02.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2024 02:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sGbFx-0003Dl-Vf; Mon, 10 Jun 2024 05:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=l9v5=NM=kaod.org=clg@ozlabs.org>)
 id 1sGbFw-0003Cz-9C; Mon, 10 Jun 2024 05:24:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=l9v5=NM=kaod.org=clg@ozlabs.org>)
 id 1sGbFs-0003Wf-H2; Mon, 10 Jun 2024 05:23:59 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VyRFM3jpvz4xF3;
 Mon, 10 Jun 2024 19:23:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VyRFF5zzGz4x4T;
 Mon, 10 Jun 2024 19:23:42 +1000 (AEST)
Message-ID: <35f06e9e-eb1b-4efa-972e-7af528b2d306@kaod.org>
Date: Mon, 10 Jun 2024 11:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=l9v5=NM=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vphOv8Ti+SKX

On 6/4/24 7:44 AM, Jamin Lin wrote:
> Changes from v1:
> The patch series supports WDT, SDMC, SMC, SCU, SLI and INTC for AST2700 SoC.
> 
> Changes from v2:
> - replace is_aarch64 with is_bus64bit for sdmc patch review.
> - fix incorrect dram size for AST2700
> 
> Changes from v3:
> - Add AST2700 Evaluation board in ASPEED document
> - Add avocado test cases for AST2700 Evaluation board
> - Fix reviewers review issues and add reviewers suggestions
> - Implement INTC model GICINT 128 to GICINT136 for AST2700
> 
> Changes from v4:
> - support 64 bits dma dram address associated with review issues
> - support dma start length and 1 byte length unit associated with review issues
> - refactor intc model to fix serial console stuck issue and associated with review issues
> 
> Changes from v5:
> - sdmc: incrementing the version of vmstate to 2.
> - smc: support different memory region ops for SMC flash region
>         introduce a new "const MemoryRegionOps *" attribute in AspeedSMCClass and
>         use it in aspeed_smc_flash_realize function.
> - intc: fix associated with review issues
> - dram size detect: change to use address space API and simplify with write
>                      transaction on the DRAM memory region of the SoC.
> - ast27x0_soc: update aspeed_soc_ast2700_gic function associated with review issues
>                 and rename to aspeed_soc_ast2700_gic_realize
> 
> Test Version:
> qemu commit:
> https://github.com/qemu/qemu/commit/74abb45dac6979e7ff76172b7f0a24e869405184
> applied patch:
> https://patchew.org/QEMU/20240527124315.35356-1-clg@redhat.com/
> 
> Test steps:
> 1. Download the latest openbmc image for AST2700 from AspeedTech-BMC/openbmc
>     repository, https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.01
>     link: https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.01/ast2700-default-obmc.tar.gz
> 2. untar ast2700-default-obmc.tar.gz
>     ```
>     tar -xf ast2700-default-obmc.tar.gz
>     ```
> 3. Run and the contents of scripts as following
> IMGDIR=ast2700-default
> UBOOT_SIZE=$(stat --format=%s -L ${IMGDIR}/u-boot-nodtb.bin)
> UBOOT_DTB_ADDR=$((0x400000000 + ${UBOOT_SIZE}))
> 
> qemu-system-aarch64 -M ast2700-evb -nographic\
>   -device loader,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin,force-raw=on\
>   -device loader,addr=${UBOOT_DTB_ADDR},file=${IMGDIR}/u-boot.dtb,force-raw=on\
>   -device loader,addr=0x430000000,file=${IMGDIR}/bl31.bin,force-raw=on\
>   -device loader,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin,force-raw=on\
>   -device loader,addr=0x430000000,cpu-num=0\
>   -device loader,addr=0x430000000,cpu-num=1\
>   -device loader,addr=0x430000000,cpu-num=2\
>   -device loader,addr=0x430000000,cpu-num=3\
>   -smp 4\
>   -drive file=${IMGDIR}/image-bmc,format=raw,if=mtd\
>   -serial mon:stdio\
>   -snapshot
> 
> Jamin Lin (17):
>    aspeed/wdt: Add AST2700 support
>    aspeed/sli: Add AST2700 support
>    aspeed/sdmc: remove redundant macros
>    aspeed/sdmc: fix coding style
>    aspeed/sdmc: Add AST2700 support
>    aspeed/smc: correct device description
>    aspeed/smc: support dma start length and 1 byte length unit
>    aspeed/smc: support 64 bits dma dram address
>    aspeed/smc: support different memory region ops for SMC flash region
>    aspeed/smc: Add AST2700 support
>    aspeed/scu: Add AST2700 support
>    aspeed/intc: Add AST2700 support
>    aspeed/soc: Add AST2700 support
>    aspeed: Add an AST2700 eval board
>    aspeed/soc: fix incorrect dram size for AST2700
>    test/avocado/machine_aspeed.py: Add AST2700 test case
>    docs:aspeed: Add AST2700 Evaluation board
> 
>   docs/system/arm/aspeed.rst       |  39 +-
>   hw/arm/aspeed.c                  |  32 ++
>   hw/arm/aspeed_ast27x0.c          | 648 +++++++++++++++++++++++++++++++
>   hw/arm/meson.build               |   1 +
>   hw/intc/aspeed_intc.c            | 360 +++++++++++++++++
>   hw/intc/meson.build              |   1 +
>   hw/intc/trace-events             |  13 +
>   hw/misc/aspeed_scu.c             | 306 ++++++++++++++-
>   hw/misc/aspeed_sdmc.c            | 220 +++++++++--
>   hw/misc/aspeed_sli.c             | 177 +++++++++
>   hw/misc/meson.build              |   3 +-
>   hw/misc/trace-events             |  11 +
>   hw/ssi/aspeed_smc.c              | 346 ++++++++++++++++-
>   hw/ssi/trace-events              |   2 +-
>   hw/watchdog/wdt_aspeed.c         |  24 ++
>   include/hw/arm/aspeed_soc.h      |  30 +-
>   include/hw/intc/aspeed_intc.h    |  44 +++
>   include/hw/misc/aspeed_scu.h     |  47 ++-
>   include/hw/misc/aspeed_sdmc.h    |   5 +-
>   include/hw/misc/aspeed_sli.h     |  27 ++
>   include/hw/ssi/aspeed_smc.h      |   2 +
>   include/hw/watchdog/wdt_aspeed.h |   3 +-
>   tests/avocado/machine_aspeed.py  |  62 +++
>   23 files changed, 2345 insertions(+), 58 deletions(-)
>   create mode 100644 hw/arm/aspeed_ast27x0.c
>   create mode 100644 hw/intc/aspeed_intc.c
>   create mode 100644 hw/misc/aspeed_sli.c
>   create mode 100644 include/hw/intc/aspeed_intc.h
>   create mode 100644 include/hw/misc/aspeed_sli.h
> 


Applied to aspeed-next.

Thanks,

C.




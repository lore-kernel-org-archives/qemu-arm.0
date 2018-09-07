Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2300275wrd;
        Fri, 7 Sep 2018 16:13:35 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaGOO018rhKr3oR5G6sp78dUlEtW2INC5tj77DxB+TwalRHK3sD2Q5g5VrKSYA9tTgKB1fA
X-Received: by 2002:ac8:2b78:: with SMTP id 53-v6mr8172992qtv.255.1536362015029;
        Fri, 07 Sep 2018 16:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536362015; cv=none;
        d=google.com; s=arc-20160816;
        b=eWfejaaNN3nxfFmzmZTDy1eBCJiN7892IVB14uL9cXjP/h9yrV143/HulVBPu6XO5e
         xWEwSNv0Slx1LGbv+B3/f90F1HQwLzlI/BXGWFJFLtstP3q2HARiUuEBEzBfknjkJ9Pk
         RX5cNjRQUjIthujBKnO+H8fCTXAzSnFBv1hSSQtSNx2LXvbjujllyw53dLDwE2DZ9ekK
         2KRpXQfDApvIC4Nd2u6efQUBBpICvD/nlD/MF4/YkCyWYjQzetvkuy1KFgV6Ce1qKZlZ
         4JS5xnhuuyBDV7zoFi3Nh68S/p41IWmiFGEhRku1dHZns729XJunmtW6FIY/ZlHyzSLV
         20tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=0BuDUVFRulVygc+2SpvqqbWIdHhB342GNfWw1O2BDJ8=;
        b=pSv2IQ4z1AkLNsWKvdTDbkiXpwMe+lz8T6IgwrJTNlEUSojwm4U/kQDe9/8KIt9sv2
         A1bnFRWEwioXDecXs3NjSxmN+sIeZrPQBK+eREHHqPGikVFfWCoBYgNrTtg8/f918nC3
         y8jkToeCyPYFJFwpuKBB7qSP+fZClHRo9RIo1cMWpYK9fJtfK14tLp2JZCnpo21TJgwD
         k9bfc+B13doMWbRL+9U+6V3eCcCkyb84dEJTCEKR8qmBI4vrbZ5rdXiPt5SkGjrpJ6Pp
         ZJkj4Aj1tly0MhMpbk2JQyRDwdPK28YO9G2Klx/9C127Y6WHjoGeuRy1VMTI5eIibn2p
         Ieeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L1XV3gyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27-v6si243646qvu.77.2018.09.07.16.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 16:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L1XV3gyY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyPwU-0004Xu-IQ
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 19:13:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPwK-0004Tw-KZ
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPwG-0005PC-DX
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:13:24 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyPwG-0005J4-0K; Fri, 07 Sep 2018 19:13:20 -0400
Received: by mail-wr1-x444.google.com with SMTP id u12-v6so16356622wrr.4;
	Fri, 07 Sep 2018 16:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0BuDUVFRulVygc+2SpvqqbWIdHhB342GNfWw1O2BDJ8=;
	b=L1XV3gyYY6DLnJYMbOtxy/9uFecjI0oO3m6unrz4cFUuVTAuM4gGxwVCqycnPyV+8k
	2MP0XnEWTsmuqZYgBcY1LQkZ7hxRm9ueH7DoKCZdI7ZE+jNX4OsHsXvJ9cbvdzXgwVYj
	3DIzq2A9aTOXuDPf2ienqYnwYFmAPSBqT7IZh3+CEJn+mVegqLqBGFe+361y2A8FzhFk
	uZ+L99ADk7sD+w7x4aIAjj3f5E+aRaGUU8cp+6iF2f5yXnrO+kWFvV9/FX9DEhq+02kn
	Dy8BCdDVSZcX5zwykblini2GC5XUDERIBozHoDitBjkbjO/KFfPV9vko+AzSG6J8LiSo
	dHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0BuDUVFRulVygc+2SpvqqbWIdHhB342GNfWw1O2BDJ8=;
	b=dP6Ong2ggqZt1FJ67eDgBknV3XP00zBpET9zobRZ4eFui1gKmBfapvTzlI7tPN83Ht
	XNyNWMpUHuvJK0+LjgJyIRsqx7VwGb9b2508grqqABKZKxB4D2v8mzeiYJ8Od33H92/f
	eXnGs3Qp5jz/INqdlon3wUFG4GI8RPS25+QYbGq0g4nHOAs8pfZGSEFpjN8lC94yjLxO
	yj7QHgv+CXtljn7CyOiFc5y17bOqTDQzrxAL33zDDftzL/NWuzwBZBko2r0ZhhjieXVl
	NkVf8Is++mphJfy8W7z6foBZCzYS52IQkv1yFibN1ihjUvg716S7P/d4zaWMYpMec1R7
	9Wvg==
X-Gm-Message-State: APzg51Dlt69PtQY9BhAl8eCm2OaMg7fL7yLSr5hi/uHdmO5vUZVc2J3v
	bDphhv0ycXZ9KGJWcVgLTMY=
X-Received: by 2002:adf:c64e:: with SMTP id
	u14-v6mr7493584wrg.177.1536361998805; 
	Fri, 07 Sep 2018 16:13:18 -0700 (PDT)
Received: from [192.168.43.186] (dynggepcrak-122-5-66-105.inwitelecom.net.
	[105.66.5.122]) by smtp.gmail.com with ESMTPSA id
	g133-v6sm7839883wmf.44.2018.09.07.16.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 16:13:18 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <12321eb0-2e27-2f3a-4533-a90c3e27fcc0@amsat.org>
Date: Fri, 7 Sep 2018 20:13:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180831103816.13479-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [PATCH 03/11] hw/arm/aspeed: Add an Aspeed machine
 class
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DlIG6Gt/pC5q

On 8/31/18 7:38 AM, Cédric Le Goater wrote:
> The code looks better, it removes duplicated lines and it will ease
> the introduction of common properties for the Aspeed machines.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Nice cleanup :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/aspeed.h |  46 +++++++++
>  hw/arm/aspeed.c         | 212 +++++++++++++---------------------------
>  2 files changed, 116 insertions(+), 142 deletions(-)
>  create mode 100644 include/hw/arm/aspeed.h
> 
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> new file mode 100644
> index 000000000000..2b77f8d2b3c8
> --- /dev/null
> +++ b/include/hw/arm/aspeed.h
> @@ -0,0 +1,46 @@
> +/*
> + * Aspeed Machines
> + *
> + * Copyright 2018 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef _ARM_ASPEED_H
> +#define _ARM_ASPEED_H
> +
> +#include "hw/boards.h"
> +
> +typedef struct AspeedBoardState AspeedBoardState;
> +
> +typedef struct AspeedBoardConfig {
> +    const char *name;
> +    const char *desc;
> +    const char *soc_name;
> +    uint32_t hw_strap1;
> +    const char *fmc_model;
> +    const char *spi_model;
> +    uint32_t num_cs;
> +    void (*i2c_init)(AspeedBoardState *bmc);
> +} AspeedBoardConfig;
> +
> +#define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> +#define ASPEED_MACHINE(obj) \
> +    OBJECT_CHECK(AspeedMachine, (obj), TYPE_ASPEED_MACHINE)
> +
> +typedef struct AspeedMachine {
> +    MachineState parent_obj;
> +} AspeedMachine;
> +
> +#define ASPEED_MACHINE_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(AspeedMachineClass, (klass), TYPE_ASPEED_MACHINE)
> +#define ASPEED_MACHINE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(AspeedMachineClass, (obj), TYPE_ASPEED_MACHINE)
> +
> +typedef struct AspeedMachineClass {
> +    MachineClass parent_obj;
> +    const AspeedBoardConfig *board;
> +} AspeedMachineClass;
> +
> +
> +#endif
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index f2d64e45511a..6b33ecd5aa43 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -15,6 +15,7 @@
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "hw/arm/arm.h"
> +#include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/smbus.h"
> @@ -34,22 +35,6 @@ typedef struct AspeedBoardState {
>      MemoryRegion max_ram;
>  } AspeedBoardState;
>  
> -typedef struct AspeedBoardConfig {
> -    const char *soc_name;
> -    uint32_t hw_strap1;
> -    const char *fmc_model;
> -    const char *spi_model;
> -    uint32_t num_cs;
> -    void (*i2c_init)(AspeedBoardState *bmc);
> -} AspeedBoardConfig;
> -
> -enum {
> -    PALMETTO_BMC,
> -    AST2500_EVB,
> -    ROMULUS_BMC,
> -    WITHERSPOON_BMC,
> -};
> -
>  /* Palmetto hardware value: 0x120CE416 */
>  #define PALMETTO_BMC_HW_STRAP1 (                                        \
>          SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               \
> @@ -88,46 +73,6 @@ enum {
>  /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
>  #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
>  
> -static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
> -static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> -static void romulus_bmc_i2c_init(AspeedBoardState *bmc);
> -static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
> -
> -static const AspeedBoardConfig aspeed_boards[] = {
> -    [PALMETTO_BMC] = {
> -        .soc_name  = "ast2400-a1",
> -        .hw_strap1 = PALMETTO_BMC_HW_STRAP1,
> -        .fmc_model = "n25q256a",
> -        .spi_model = "mx25l25635e",
> -        .num_cs    = 1,
> -        .i2c_init  = palmetto_bmc_i2c_init,
> -    },
> -    [AST2500_EVB]  = {
> -        .soc_name  = "ast2500-a1",
> -        .hw_strap1 = AST2500_EVB_HW_STRAP1,
> -        .fmc_model = "w25q256",
> -        .spi_model = "mx25l25635e",
> -        .num_cs    = 1,
> -        .i2c_init  = ast2500_evb_i2c_init,
> -    },
> -    [ROMULUS_BMC]  = {
> -        .soc_name  = "ast2500-a1",
> -        .hw_strap1 = ROMULUS_BMC_HW_STRAP1,
> -        .fmc_model = "n25q256a",
> -        .spi_model = "mx66l1g45g",
> -        .num_cs    = 2,
> -        .i2c_init  = romulus_bmc_i2c_init,
> -    },
> -    [WITHERSPOON_BMC]  = {
> -        .soc_name  = "ast2500-a1",
> -        .hw_strap1 = WITHERSPOON_BMC_HW_STRAP1,
> -        .fmc_model = "mx25l25635e",
> -        .spi_model = "mx66l1g45g",
> -        .num_cs    = 2,
> -        .i2c_init  = witherspoon_bmc_i2c_init,
> -    },
> -};
> -
>  /*
>   * The max ram region is for firmwares that scan the address space
>   * with load/store to guess how much RAM the SoC has.
> @@ -313,30 +258,6 @@ static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
>      object_property_set_int(OBJECT(dev), 110000, "temperature3", &error_abort);
>  }
>  
> -static void palmetto_bmc_init(MachineState *machine)
> -{
> -    aspeed_board_init(machine, &aspeed_boards[PALMETTO_BMC]);
> -}
> -
> -static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "OpenPOWER Palmetto BMC (ARM926EJ-S)";
> -    mc->init = palmetto_bmc_init;
> -    mc->max_cpus = 1;
> -    mc->no_sdcard = 1;
> -    mc->no_floppy = 1;
> -    mc->no_cdrom = 1;
> -    mc->no_parallel = 1;
> -}
> -
> -static const TypeInfo palmetto_bmc_type = {
> -    .name = MACHINE_TYPE_NAME("palmetto-bmc"),
> -    .parent = TYPE_MACHINE,
> -    .class_init = palmetto_bmc_class_init,
> -};
> -
>  static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -353,30 +274,6 @@ static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
>  }
>  
> -static void ast2500_evb_init(MachineState *machine)
> -{
> -    aspeed_board_init(machine, &aspeed_boards[AST2500_EVB]);
> -}
> -
> -static void ast2500_evb_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "Aspeed AST2500 EVB (ARM1176)";
> -    mc->init = ast2500_evb_init;
> -    mc->max_cpus = 1;
> -    mc->no_sdcard = 1;
> -    mc->no_floppy = 1;
> -    mc->no_cdrom = 1;
> -    mc->no_parallel = 1;
> -}
> -
> -static const TypeInfo ast2500_evb_type = {
> -    .name = MACHINE_TYPE_NAME("ast2500-evb"),
> -    .parent = TYPE_MACHINE,
> -    .class_init = ast2500_evb_class_init,
> -};
> -
>  static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -386,30 +283,6 @@ static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338", 0x32);
>  }
>  
> -static void romulus_bmc_init(MachineState *machine)
> -{
> -    aspeed_board_init(machine, &aspeed_boards[ROMULUS_BMC]);
> -}
> -
> -static void romulus_bmc_class_init(ObjectClass *oc, void *data)
> -{
> -    MachineClass *mc = MACHINE_CLASS(oc);
> -
> -    mc->desc = "OpenPOWER Romulus BMC (ARM1176)";
> -    mc->init = romulus_bmc_init;
> -    mc->max_cpus = 1;
> -    mc->no_sdcard = 1;
> -    mc->no_floppy = 1;
> -    mc->no_cdrom = 1;
> -    mc->no_parallel = 1;
> -}
> -
> -static const TypeInfo romulus_bmc_type = {
> -    .name = MACHINE_TYPE_NAME("romulus-bmc"),
> -    .parent = TYPE_MACHINE,
> -    .class_init = romulus_bmc_class_init,
> -};
> -
>  static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> @@ -433,36 +306,91 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
>                       0x60);
>  }
>  
> -static void witherspoon_bmc_init(MachineState *machine)
> +static void aspeed_machine_init(MachineState *machine)
>  {
> -    aspeed_board_init(machine, &aspeed_boards[WITHERSPOON_BMC]);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
> +
> +    aspeed_board_init(machine, amc->board);
>  }
>  
> -static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
> +static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +    const AspeedBoardConfig *board = data;
>  
> -    mc->desc = "OpenPOWER Witherspoon BMC (ARM1176)";
> -    mc->init = witherspoon_bmc_init;
> +    mc->desc = board->desc;
> +    mc->init = aspeed_machine_init;
>      mc->max_cpus = 1;
>      mc->no_sdcard = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->no_parallel = 1;
> +    amc->board = board;
>  }
>  
> -static const TypeInfo witherspoon_bmc_type = {
> -    .name = MACHINE_TYPE_NAME("witherspoon-bmc"),
> +static const TypeInfo aspeed_machine_type = {
> +    .name = TYPE_ASPEED_MACHINE,
>      .parent = TYPE_MACHINE,
> -    .class_init = witherspoon_bmc_class_init,
> +    .instance_size = sizeof(AspeedMachine),
> +    .class_size = sizeof(AspeedMachineClass),
> +    .abstract = true,
> +};
> +
> +static const AspeedBoardConfig aspeed_boards[] = {
> +    {
> +        .name      = MACHINE_TYPE_NAME("palmetto-bmc"),
> +        .desc      = "OpenPOWER Palmetto BMC (ARM926EJ-S)",
> +        .soc_name  = "ast2400-a1",
> +        .hw_strap1 = PALMETTO_BMC_HW_STRAP1,
> +        .fmc_model = "n25q256a",
> +        .spi_model = "mx25l25635e",
> +        .num_cs    = 1,
> +        .i2c_init  = palmetto_bmc_i2c_init,
> +    }, {
> +        .name      = MACHINE_TYPE_NAME("ast2500-evb"),
> +        .desc      = "Aspeed AST2500 EVB (ARM1176)",
> +        .soc_name  = "ast2500-a1",
> +        .hw_strap1 = AST2500_EVB_HW_STRAP1,
> +        .fmc_model = "w25q256",
> +        .spi_model = "mx25l25635e",
> +        .num_cs    = 1,
> +        .i2c_init  = ast2500_evb_i2c_init,
> +    }, {
> +        .name      = MACHINE_TYPE_NAME("romulus-bmc"),
> +        .desc      = "OpenPOWER Romulus BMC (ARM1176)",
> +        .soc_name  = "ast2500-a1",
> +        .hw_strap1 = ROMULUS_BMC_HW_STRAP1,
> +        .fmc_model = "n25q256a",
> +        .spi_model = "mx66l1g45g",
> +        .num_cs    = 2,
> +        .i2c_init  = romulus_bmc_i2c_init,
> +    }, {
> +        .name      = MACHINE_TYPE_NAME("witherspoon-bmc"),
> +        .desc      = "OpenPOWER Witherspoon BMC (ARM1176)",
> +        .soc_name  = "ast2500-a1",
> +        .hw_strap1 = WITHERSPOON_BMC_HW_STRAP1,
> +        .fmc_model = "mx25l25635e",
> +        .spi_model = "mx66l1g45g",
> +        .num_cs    = 2,
> +        .i2c_init  = witherspoon_bmc_i2c_init,
> +    },
>  };
>  
> -static void aspeed_machine_init(void)
> +static void aspeed_machine_types(void)
>  {
> -    type_register_static(&palmetto_bmc_type);
> -    type_register_static(&ast2500_evb_type);
> -    type_register_static(&romulus_bmc_type);
> -    type_register_static(&witherspoon_bmc_type);
> +    int i;
> +
> +    type_register_static(&aspeed_machine_type);
> +    for (i = 0; i < ARRAY_SIZE(aspeed_boards); ++i) {
> +        TypeInfo ti = {
> +            .name       = aspeed_boards[i].name,
> +            .parent     = TYPE_ASPEED_MACHINE,
> +            .class_init = aspeed_machine_class_init,
> +            .class_data = (void *)&aspeed_boards[i],
> +        };
> +        type_register(&ti);
> +    }
>  }
>  
> -type_init(aspeed_machine_init)
> +type_init(aspeed_machine_types)
> 

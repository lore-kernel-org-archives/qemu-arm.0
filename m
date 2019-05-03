Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp670629wrh;
        Fri, 3 May 2019 08:07:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWvIbeQ3ZP3eG9hmvL+PNxXozufX1UvqF4h2sGL5aIQ92HcVAjlyGWrnO2YUsPEsSycb9F
X-Received: by 2002:adf:e944:: with SMTP id m4mr1246816wrn.130.1556896073950;
        Fri, 03 May 2019 08:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556896073; cv=none;
        d=google.com; s=arc-20160816;
        b=mdNmCHhQ9QI0xBp8nmfRo3RmCsJbUlcvlojzHiKwD2Ig+rYWAJZPGByrlh5ZZs0I/X
         tJszaBG/gSm9Q23Hili9kY/LzsLknaxbIMoCohnkgsQmv97iM6b176XG3lRe141+ETvP
         wchTfZEF8js4O6aeOxCm0HNzLP41c2RfHRX5tl7Dtdla5jjRWU3TVacF8tVg5flua09b
         Tp64bvmffYiHTmiWxeI4KnskKZ5r72+VDn4NmsY7b6W2zCzXn0by3qnqZo5XOzkqSP/E
         YTv+6+cUUpjv4vC9FuMNCtXt1PVcbh3tiU+G/2cLdExO0XdKnOrJdS7iHGzsQ+MCHXlB
         NTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=c/Bq/wmFbhXlgMLagBN9uIHBBitvjf/WmQ+GZPVo6RY=;
        b=Fw9JuiMeKoeFlgPkRHDxCi+Fh6mXKLZJ/Zl1ACV/kMRKDkZm8ou0Jhg2zg/j6fqstT
         E7Xu6fK18+/X0eSVF/L2HsSbWuW8dYaHMvcrYGVSJAqFsQeC094bZOhtzxUsXPF5gh2z
         zT4q79+n+0sMRmDYKhuEJQCaVCf82C0I9hfZHMdiEv0f3j/tQRxkqMdJAevNm/BSpZz/
         /BEhD5/xbrpZa0w92cPmFonQKrTWPVn/F5HGe0SejOdhtwCA8SwqTMSU+g4dF0NhgD/y
         kHXtzzGrstU13xzxyMHoLEQyotHzYUZrg3rOmbg3en1C3fzqpMHUyPc8ppjOVaSIlNF7
         r3rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si1771741wrq.403.2019.05.03.08.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 08:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMZmy-0005Je-Ud
	for alex.bennee@linaro.org; Fri, 03 May 2019 11:07:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMZml-0005JQ-6Y
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:07:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hMZmj-0004BA-Tj
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:07:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hMZmj-0004AR-Nk
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:07:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id b10so7529496wmj.4
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 08:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=c/Bq/wmFbhXlgMLagBN9uIHBBitvjf/WmQ+GZPVo6RY=;
	b=Ed31rys4ErnxdBUaoFURnRaiHckfK7k04/4PeuexnjLx3BPSAT1+wOeAmodC+wMVSJ
	Os4A1mAUBbtXrt7prp5SoEWhRnrPmhNaUZTv+G7IZK9a/k540BCPNvxcG0+8GJkB4H46
	+avprf/4LQyErGIqHJ1US271uV9izmDDr6cnfLo8fJagUDpYZWcB50SBlLXRw+JSugDZ
	+R/ZfKXK0stb+lRrdVsW4CfdYqUyMzRHVy3OzfWZe9U/HZAsKPFyN7U4F5sX3uDsfHdh
	ooA0suuRRZ5VJBMJS7SCUkAeOupLeaolGhfZKQHdgycT8nbPLUY+PskgequDhsxsx0aF
	DDqg==
X-Gm-Message-State: APjAAAUHEAkceB+8AgY9/HEK7uRDrFg2cTr2wW9ZdHVXylSe3vRnrMu9
	Lv+RBCxF71/QjXsAiEZKzr+dLg==
X-Received: by 2002:a1c:9d17:: with SMTP id g23mr2558100wme.100.1556896056610; 
	Fri, 03 May 2019 08:07:36 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id y6sm4397125wra.24.2019.05.03.08.07.35
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 08:07:36 -0700 (PDT)
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
	<clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20190503022958.1394-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1f32879b-63ac-5cf2-2f1e-6bcc4da99220@redhat.com>
Date: Fri, 3 May 2019 17:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503022958.1394-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] arm: aspeed: Set SDRAM size
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ELYLYWDLx2rZ

On 5/3/19 4:29 AM, Joel Stanley wrote:
> We currently use Qemu's default of 128MB. As we know how much ram each
> machine ships with, make it easier on users by setting a default.
> 
> It can still be overridden with -m on the command line.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I did review this patch:
https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00109.html

So:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> v2:
>  - Fix 'if' style issue. Thanks patchew
>  - Use units.h defines
> 
>  hw/arm/aspeed.c         | 8 ++++++++
>  include/hw/arm/aspeed.h | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1c23ebd99252..29d225ed1405 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -25,6 +25,7 @@
>  #include "sysemu/block-backend.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
> +#include "qemu/units.h"
>  
>  static struct arm_boot_info aspeed_board_binfo = {
>      .board_id = -1, /* device-tree-only board */
> @@ -331,6 +332,9 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
>      mc->no_parallel = 1;
> +    if (board->ram) {
> +        mc->default_ram_size = board->ram;
> +    }
>      amc->board = board;
>  }
>  
> @@ -352,6 +356,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx25l25635e",
>          .num_cs    = 1,
>          .i2c_init  = palmetto_bmc_i2c_init,
> +        .ram       = 256 * MiB,
>      }, {
>          .name      = MACHINE_TYPE_NAME("ast2500-evb"),
>          .desc      = "Aspeed AST2500 EVB (ARM1176)",
> @@ -361,6 +366,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx25l25635e",
>          .num_cs    = 1,
>          .i2c_init  = ast2500_evb_i2c_init,
> +        .ram       = 512 * MiB,
>      }, {
>          .name      = MACHINE_TYPE_NAME("romulus-bmc"),
>          .desc      = "OpenPOWER Romulus BMC (ARM1176)",
> @@ -370,6 +376,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx66l1g45g",
>          .num_cs    = 2,
>          .i2c_init  = romulus_bmc_i2c_init,
> +        .ram       = 512 * MiB,
>      }, {
>          .name      = MACHINE_TYPE_NAME("witherspoon-bmc"),
>          .desc      = "OpenPOWER Witherspoon BMC (ARM1176)",
> @@ -379,6 +386,7 @@ static const AspeedBoardConfig aspeed_boards[] = {
>          .spi_model = "mx66l1g45g",
>          .num_cs    = 2,
>          .i2c_init  = witherspoon_bmc_i2c_init,
> +        .ram       = 512 * MiB,
>      },
>  };
>  
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index 325c091d09e4..02073a6b4d61 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -22,6 +22,7 @@ typedef struct AspeedBoardConfig {
>      const char *spi_model;
>      uint32_t num_cs;
>      void (*i2c_init)(AspeedBoardState *bmc);
> +    uint32_t ram;
>  } AspeedBoardConfig;
>  
>  #define TYPE_ASPEED_MACHINE       MACHINE_TYPE_NAME("aspeed")
> 

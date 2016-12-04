Received: by 10.25.159.131 with SMTP id i125csp1191071lfe;
        Sun, 4 Dec 2016 09:01:53 -0800 (PST)
X-Received: by 10.237.34.206 with SMTP id q14mr45819755qtc.101.1480870913510;
        Sun, 04 Dec 2016 09:01:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x124si7287773qke.49.2016.12.04.09.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Dec 2016 09:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDaAi-0004kd-6H
	for alex.bennee@linaro.org; Sun, 04 Dec 2016 12:01:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDa9D-0003gT-LX
	for qemu-arm@nongnu.org; Sun, 04 Dec 2016 12:00:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDa9A-0001pv-I0
	for qemu-arm@nongnu.org; Sun, 04 Dec 2016 12:00:19 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33624)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cDa9A-0001oa-7n; Sun, 04 Dec 2016 12:00:16 -0500
Received: by mail-wm0-x241.google.com with SMTP id u144so10806768wmu.0;
	Sun, 04 Dec 2016 09:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=XgLODKfKzOuYpTkwIiPMytsTMUxYkxgv/sFYZlykLrs=;
	b=VWw5DBLc5Wl1nL5pPyVGp+mjEiGlsnsoWpXXzGmGQjnKwJeLCicucmB5ONCBM7IkC7
	KvMxQ+qgDfNz4evCzYQN0kiIQQVHkq4UofYZGTL2TLsAEOc/H6+TGF+BzOYrix1x/IUl
	cyRsQ1gyZW+B6EdPY4KKTa3beZOXSuy/8MmbkGSqXg6Vi+Li8bl0t1eRmADiygrKipJq
	6gD+9RJDA03qG5qfx2+gF3GqzRjSa9cpS29RMOW5vZ3cnsaDs3mKnBo2LkCthzstR8Ih
	utIL4Ts7+IVvnUKCMZz7H0Qu6knhRt4ZdEGQynF3B3BTZ47DpYvhZsN1Nx64r+zDDy5Y
	sCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=XgLODKfKzOuYpTkwIiPMytsTMUxYkxgv/sFYZlykLrs=;
	b=caYeXcD8z6Zi5i11lqgDOa0am88yK+esZrwCWIbuG2sMJVzWQRZTkYvoMAvW4F8alp
	Gd0VNZ9of8To4OPpTkECXk+KIuiYyM6xPqHkvxDY8+DOm0pgvIv5HaCXUoY0wmi0+gt5
	/JfU+yGzba4r1qAx1VaIKEpgT5PkD8p/45QEL4tTw4PKYrgnSGUrhBMv1Povfmt1FBER
	yroisE9emLblJ1TKY7QqpWFn4AuWhdSPfJKaw2Lfxk6Uwd1rl94aAAf4z+s+ZZGjOG0X
	jyqYSOKfJWI2Ajbo8MPw6g54n+kapwztZ5sJEy388GRuxBHgLfU9GsnJ3ChYrkqbpOLC
	PGKQ==
X-Gm-Message-State: AKaTC01OEqmdKzJpIKA2RxK/Je3trjEC9htqkgssIqCjoEaHMQ2ND+lFDVVp/576pin/yg==
X-Received: by 10.25.67.12 with SMTP id q12mr16179976lfa.63.1480870814930;
	Sun, 04 Dec 2016 09:00:14 -0800 (PST)
Received: from [192.168.75.106] (89-78-94-50.dynamic.chello.pl. [89.78.94.50])
	by smtp.gmail.com with ESMTPSA id
	v72sm2327270lfa.11.2016.12.04.09.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Dec 2016 09:00:14 -0800 (PST)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-25-git-send-email-clg@kaod.org>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <4e2db842-7ff6-d7e7-c96c-26ce9c563c83@gmail.com>
Date: Sun, 4 Dec 2016 18:00:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1480434248-27138-25-git-send-email-clg@kaod.org>
Content-Type: multipart/alternative;
	boundary="------------AF660585D27BF645EA59C056"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9 24/30] aspeed: use first
 SPI flash as a boot ROM
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oiBSpV4sX/B5

This is a multi-part message in MIME format.
--------------AF660585D27BF645EA59C056
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Cedric,

it looks like good idea for now to handle boot from flash.
As I understand you are trying to omit bootrom code in Qemu model?
This could lead you to some hacks in device models (eg SMC).

W dniu 29.11.2016 o 16:44, Cédric Le Goater pisze:
> Fill a ROM region with the flash content to support U-Boot. This is a
> little hacky but until we can boot from a MMIO region, it seems
> difficult to do anything else.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 40c13838fb2d..a92c2f1c362b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -20,6 +20,8 @@
>   #include "qemu/log.h"
>   #include "sysemu/block-backend.h"
>   #include "sysemu/blockdev.h"
> +#include "hw/loader.h"
> +#include "qemu/error-report.h"
>   
>   static struct arm_boot_info aspeed_board_binfo = {
>       .board_id = -1, /* device-tree-only board */
> @@ -104,6 +106,28 @@ static const AspeedBoardConfig aspeed_boards[] = {
>       },
>   };
>   
> +#define FIRMWARE_ADDR 0x0
> +
> +static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
> +                           Error **errp)
> +{
> +    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> +    uint8_t *storage;
> +
> +    if (rom_size > blk_getlength(blk)) {
> +        rom_size = blk_getlength(blk);
> +    }
I was not able to attach smaller file as m25p80 storage.
> +
> +    storage = g_new0(uint8_t, rom_size);
> +    if (blk_pread(blk, 0, storage, rom_size) < 0) {
> +        error_setg(errp, "failed to read the initial flash content");
> +        return;
> +    }
> +
> +    rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
> +    g_free(storage);
> +}
> +
>   static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>                                         Error **errp)
>   {
> @@ -135,6 +159,7 @@ static void aspeed_board_init(MachineState *machine,
>   {
>       AspeedBoardState *bmc;
>       AspeedSoCClass *sc;
> +    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
>   
>       bmc = g_new0(AspeedBoardState, 1);
>       object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> @@ -168,6 +193,22 @@ static void aspeed_board_init(MachineState *machine,
>       aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abort);
>       aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_abort);
>   
> +    /* Install first FMC flash content as a boot rom. */
> +    if (drive0) {
> +        AspeedSMCFlash *fl = &bmc->soc.fmc.flashes[0];
> +        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
> +
> +        /*
> +         * create a ROM region using the default mapping window size of
> +         * the flash module.
> +         */
> +        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
> +                               fl->size, &error_abort);
> +        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
> +                                    boot_rom);
> +        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort);
Is it possible that fl->size will be bigger than segment size?
I think max_size here should be segment size in smc.

Thanks,
Marcin
> +    }
> +
>       aspeed_board_binfo.kernel_filename = machine->kernel_filename;
>       aspeed_board_binfo.initrd_filename = machine->initrd_filename;
>       aspeed_board_binfo.kernel_cmdline = machine->kernel_cmdline;


--------------AF660585D27BF645EA59C056
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">Hi Cedric,<br>
      <br>
      it looks like good idea for now to handle boot from flash.<br>
      As I understand you are trying to omit bootrom code in Qemu model?<br>
      This could lead you to some hacks in device models (eg SMC).<br>
    </font><br>
    <div class="moz-cite-prefix">W dniu 29.11.2016 o 16:44, Cédric Le
      Goater pisze:<br>
    </div>
    <blockquote
      cite="mid:1480434248-27138-25-git-send-email-clg@kaod.org"
      type="cite">
      <pre wrap="">Fill a ROM region with the flash content to support U-Boot. This is a
little hacky but until we can boot from a MMIO region, it seems
difficult to do anything else.

Signed-off-by: Cédric Le Goater <a class="moz-txt-link-rfc2396E" href="mailto:clg@kaod.org">&lt;clg@kaod.org&gt;</a>
Reviewed-by: Joel Stanley <a class="moz-txt-link-rfc2396E" href="mailto:joel@jms.id.au">&lt;joel@jms.id.au&gt;</a>
Reviewed-by: Andrew Jeffery <a class="moz-txt-link-rfc2396E" href="mailto:andrew@aj.id.au">&lt;andrew@aj.id.au&gt;</a>
---
 hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 40c13838fb2d..a92c2f1c362b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -20,6 +20,8 @@
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "hw/loader.h"
+#include "qemu/error-report.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -104,6 +106,28 @@ static const AspeedBoardConfig aspeed_boards[] = {
     },
 };
 
+#define FIRMWARE_ADDR 0x0
+
+static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
+                           Error **errp)
+{
+    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+    uint8_t *storage;
+
+    if (rom_size &gt; blk_getlength(blk)) {
+        rom_size = blk_getlength(blk);
+    }</pre>
    </blockquote>
    <font size="-1">I was not able to attach smaller file as m25p80
      storage.</font><br>
    <blockquote
      cite="mid:1480434248-27138-25-git-send-email-clg@kaod.org"
      type="cite">
      <pre wrap="">
+
+    storage = g_new0(uint8_t, rom_size);
+    if (blk_pread(blk, 0, storage, rom_size) &lt; 0) {
+        error_setg(errp, "failed to read the initial flash content");
+        return;
+    }
+
+    rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
+    g_free(storage);
+}
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       Error **errp)
 {
@@ -135,6 +159,7 @@ static void aspeed_board_init(MachineState *machine,
 {
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
+    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
 
     bmc = g_new0(AspeedBoardState, 1);
     object_initialize(&amp;bmc-&gt;soc, (sizeof(bmc-&gt;soc)), cfg-&gt;soc_name);
@@ -168,6 +193,22 @@ static void aspeed_board_init(MachineState *machine,
     aspeed_board_init_flashes(&amp;bmc-&gt;soc.fmc, cfg-&gt;fmc_model, &amp;error_abort);
     aspeed_board_init_flashes(&amp;bmc-&gt;soc.spi[0], cfg-&gt;spi_model, &amp;error_abort);
 
+    /* Install first FMC flash content as a boot rom. */
+    if (drive0) {
+        AspeedSMCFlash *fl = &amp;bmc-&gt;soc.fmc.flashes[0];
+        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
+
+        /*
+         * create a ROM region using the default mapping window size of
+         * the flash module.
+         */
+        memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+                               fl-&gt;size, &amp;error_abort);
+        memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
+                                    boot_rom);
+        write_boot_rom(drive0, FIRMWARE_ADDR, fl-&gt;size, &amp;error_abort);</pre>
    </blockquote>
    <font size="-1">Is it possible that fl-&gt;size will be bigger than
      segment size?<br>
      I think max_size here should be segment size in smc.<br>
      <br>
      Thanks,<br>
      Marcin<br>
    </font>
    <blockquote
      cite="mid:1480434248-27138-25-git-send-email-clg@kaod.org"
      type="cite">
      <pre wrap="">
+    }
+
     aspeed_board_binfo.kernel_filename = machine-&gt;kernel_filename;
     aspeed_board_binfo.initrd_filename = machine-&gt;initrd_filename;
     aspeed_board_binfo.kernel_cmdline = machine-&gt;kernel_cmdline;
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------AF660585D27BF645EA59C056--

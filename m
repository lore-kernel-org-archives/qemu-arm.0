Received: by 10.28.91.67 with SMTP id p64csp2436497wmb;
        Mon, 5 Mar 2018 03:28:11 -0800 (PST)
X-Google-Smtp-Source: AG47ELsuEjaTGHIHT5MtSrR/UUQ2SB4Z7uHKE+iY5wcRX9z6Xgy5LtulpqTDPXJMI8Zetx2rmYLv
X-Received: by 2002:a25:df06:: with SMTP id w6-v6mr6749316ybg.57.1520249291680;
        Mon, 05 Mar 2018 03:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520249291; cv=none;
        d=google.com; s=arc-20160816;
        b=gqmXQCwbfv1O+yGOquzqRygCLCwZNudT4i0YFneZ60ttJkEYYli4gRCTLG/6upWpze
         DrKvvReqI/xvwSJfNQyxviC8SG6D/42Pv/RPV9i4TILsJdN/wGyzbGpxRkT/BEKR6Nv+
         g2T3IaWFpjupT/ViqR7x/vuSeS6TWNlakq5V9rsqHj1ya9Xgrf2daemT8VgJNcxo+VeE
         wOtYURGkeXNR2InQB7or6gg6qv5FrK1pDiLlJVxbwd/310o70G/+AhV7ByPy7JFewU8T
         L8iZOCSUc4xGlxiMDwHuPH6NTXb75CQcKtSpH0zNxNSRe3zAK8gBFgM+Z8POEhxKeNOp
         FnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=qNjHFmcv9spW4giRIgLW0f9gBykx1don3UhqHQhAlvI=;
        b=SEweec4JxWhPX48O+LH4cuscZ4Ukwff8uKciXQG3g9UYY/aqllhXo7sGLu590VK+V/
         LOLhPMIACAyIolnsa2DeBtZZbdH060+/AX39g4xLuqIa+WQAe4y+P6SunRLdreS/FGMi
         4A+gQ71lD4LdaReoGAQRvZqVlE3Y8tH/++dqszCMlQ9fvsoHxe5CkKpXcAgjmcwy6OuR
         KR6hpnhBnjBO6sIDosWNjJTlWbLpx7uZNDziJ32HET+6WYD1YaqZnR7PPWQDRBWhUS+9
         qXExtTazl7lvkzWEBw0izGGSYKI9w/B/z3Jl8KW/idKhR0On7doZy8Z/Zq6Tw6gK+JTB
         /Weg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o/qGvl+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si2125158ywg.250.2018.03.05.03.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 03:28:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o/qGvl+v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esoHr-0003Pi-0D
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 06:28:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHa-0003JO-3n
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 06:27:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHY-0006t5-7r
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 06:27:54 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:39623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHP-0006la-Pu; Mon, 05 Mar 2018 06:27:44 -0500
Received: by mail-wm0-x243.google.com with SMTP id i3so14699468wmi.4;
	Mon, 05 Mar 2018 03:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qNjHFmcv9spW4giRIgLW0f9gBykx1don3UhqHQhAlvI=;
	b=o/qGvl+vBw6mzu85CtbYCmkV+o0gVgFkajzU/LaZbQ5OUvh7UF+Bz5njlDrwwbOuON
	7Hp5ynJJKiletMdkQfVgDFdWMhx8wnCGv/5fkEfOPylIp7615nbBGI1O9GWAldBN9NYw
	UU/+Z9RyRDiWL1xlKPT3XGnHUDIiZX5WhKxsEkOQvMHybQ5XZcIA9XU+Pd8vtVB2dh76
	4NRxV4WY2CpEDO2Nxwrs9sF8p/bHADD1vrNiPsb31OFoNecOPNVcmfDm2zXXZ6fHWgvo
	HAR/UKh9P1VH3FtBsMW/IRPyk62NiGBaZttwYzZLVGn2qDZGJHS5C92PlOsSPYsSdJrj
	Eypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qNjHFmcv9spW4giRIgLW0f9gBykx1don3UhqHQhAlvI=;
	b=dYMPVg4yqoLDDHzVT/p353w7mTHgxJ9GS1axT5Zl1eTtYUwXrAfTeAOBkaQ8G8lr/n
	pteyYA4MRSumssS1pEyrVHEhM9dgG7pMBYnQNVlm2uqWrNLW54DmmYcRFSBe6TvyGnNw
	9G/zqHJtb7WBolizZC7GshfEZRLEH6Zp/MQ4d7KTQT5JDtaLnS2S2tRjoosXDVRj+I0y
	3uZtnUVZMRjVTQmssKOoDsslS6nQDjIzGlda7LA8DCD/f+jMfBibOIP9iXE+n1Ikyrs5
	BQPcjhqih8niJKbWW6im2XGnPOj+C+58hGXOemI0xe8bHdTJdjVluMH90P1uIxhMM5eF
	/JVw==
X-Gm-Message-State: AElRT7FkAms3LiC+5BHTcPRsIgsXnVxoSxe/btFo8LMQ165AORVFOHp7
	yT0wKwKVXUpP+nLoEyebuG6x3rCv
X-Received: by 10.28.69.93 with SMTP id s90mr7895645wma.29.1520249262217;
	Mon, 05 Mar 2018 03:27:42 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.27.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:27:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Date: Mon,  5 Mar 2018 08:27:04 -0300
Message-Id: <20180305112732.26471-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-arm] [RFC PATCH v2 02/30] hw: include "qemu/cunits.h" and
 clean unused "qemu/cutils.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Paul Burton <paul.burton@mips.com>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 26XLfPrRxUtH

These files were including "qemu/cutils.h" to use the byte-based size
definitions, now available in "qemu/cunits.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

Thomas suggested:

    Instead of adding this to a header and creating yet another possible
    recompile-the-world dependency this way, wouldn't it be better to
    include the cunits.h only from the .c files that need the definitions?

 include/hw/hw.h       | 1 +
 hw/arm/msf2-soc.c     | 1 -
 hw/arm/msf2-som.c     | 1 -
 hw/core/loader-fit.c  | 1 -
 hw/core/loader.c      | 1 -
 hw/core/machine.c     | 1 -
 hw/cris/boot.c        | 1 -
 hw/display/sm501.c    | 1 -
 hw/hppa/machine.c     | 1 -
 hw/lm32/milkymist.c   | 1 -
 hw/microblaze/boot.c  | 1 -
 hw/mips/boston.c      | 1 -
 hw/misc/mos6522.c     | 1 -
 hw/nios2/boot.c       | 1 -
 hw/ppc/mac_newworld.c | 1 -
 hw/ppc/mac_oldworld.c | 1 -
 hw/ppc/pnv.c          | 1 -
 hw/ppc/prep.c         | 1 -
 hw/ppc/spapr_rtas.c   | 1 -
 hw/sd/sdhci.c         | 1 -
 hw/sparc/sun4m.c      | 1 -
 hw/sparc64/sun4u.c    | 1 -
 hw/usb/dev-serial.c   | 1 -
 hw/usb/dev-storage.c  | 1 -
 24 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/include/hw/hw.h b/include/hw/hw.h
index ab4950c312..8249448cac 100644
--- a/include/hw/hw.h
+++ b/include/hw/hw.h
@@ -14,6 +14,7 @@
 #include "migration/qemu-file-types.h"
 #include "qemu/module.h"
 #include "sysemu/reset.h"
+#include "qemu/cunits.h"
 
 void QEMU_NORETURN hw_error(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
 
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index a8ec2cdf36..952cda45ed 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -30,7 +30,6 @@
 #include "hw/char/serial.h"
 #include "hw/boards.h"
 #include "sysemu/block-backend.h"
-#include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
 
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 0795a3a3a1..d3e6ed00fe 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -28,7 +28,6 @@
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
 #include "cpu.h"
 
diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index 0c4a7207f4..0208e5b357 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -22,7 +22,6 @@
 #include "exec/memory.h"
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 76b244c508..ce0aefe5c2 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -54,7 +54,6 @@
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
-#include "qemu/cutils.h"
 
 #include <zlib.h>
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5d445839e8..7a7ec0c1e1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -19,7 +19,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
-#include "qemu/cutils.h"
 #include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
diff --git a/hw/cris/boot.c b/hw/cris/boot.c
index f896ed7f86..7d423ed92f 100644
--- a/hw/cris/boot.c
+++ b/hw/cris/boot.c
@@ -29,7 +29,6 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "boot.h"
-#include "qemu/cutils.h"
 
 static void main_cpu_reset(void *opaque)
 {
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f4bb33c279..00cf8358e2 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 19033e268d..22a15112df 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -17,7 +17,6 @@
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
 #include "hw/hppa/hppa_sys.h"
-#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 85d64fe58d..471a74eaa1 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -34,7 +34,6 @@
 #include "milkymist-hw.h"
 #include "lm32.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 
 #define BIOS_FILENAME    "mmone-bios.bin"
 #define BIOS_OFFSET      0x00860000
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 35bfeda7aa..5b30d63c17 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -34,7 +34,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "qemu/cutils.h"
 
 #include "boot.h"
 
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index fb23161b33..e99f3638cf 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -32,7 +32,6 @@
 #include "hw/mips/cpudevs.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "qapi/error.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 8ad9fc831e..b55e6acbe2 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -29,7 +29,6 @@
 #include "hw/misc/mos6522.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
-#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "trace.h"
 
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 94f436e7fb..771e00267b 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -38,7 +38,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "elf.h"
-#include "qemu/cutils.h"
 
 #include "boot.h"
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 4e1298ee50..77d4e9b013 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -71,7 +71,6 @@
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"
-#include "qemu/cutils.h"
 #include "trace.h"
 
 #define MAX_IDE_BUS 2
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index d0d21d2392..c245251c5c 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -45,7 +45,6 @@
 #include "kvm_ppc.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 
 #define MAX_IDE_BUS 2
 #define CFG_ADDR 0xf0000510
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 98ee3c607a..3d943dd71b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -31,7 +31,6 @@
 #include "hw/ppc/pnv_core.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 #include "qapi/visitor.h"
 #include "monitor/monitor.h"
 #include "hw/intc/intc.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 096d4d4cfb..f7c0a48558 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -50,7 +50,6 @@
 #include "exec/address-spaces.h"
 #include "trace.h"
 #include "elf.h"
-#include "qemu/cutils.h"
 #include "kvm_ppc.h"
 
 /* SMP is not enabled, for now */
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 4bb939d3d1..7e26a9fb5a 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -43,7 +43,6 @@
 
 #include <libfdt.h>
 #include "hw/ppc/spapr_drc.h"
-#include "qemu/cutils.h"
 #include "trace.h"
 #include "hw/ppc/fdt.h"
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 97b4a473c8..cf935c2008 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -34,7 +34,6 @@
 #include "hw/sd/sdhci.h"
 #include "sdhci-internal.h"
 #include "qemu/log.h"
-#include "qemu/cutils.h"
 #include "trace.h"
 
 #define TYPE_SDHCI_BUS "sdhci-bus"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 61eb424bbc..9d82490794 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -46,7 +46,6 @@
 #include "elf.h"
 #include "sysemu/block-backend.h"
 #include "trace.h"
-#include "qemu/cutils.h"
 
 /*
  * Sun4m architecture was used in the following machines:
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index da28ab9413..b84589e0b6 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -50,7 +50,6 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "trace.h"
-#include "qemu/cutils.h"
 
 #define KERNEL_LOAD_ADDR     0x00404000
 #define CMDLINE_ADDR         0x003ff000
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 2829dda391..5e610722ee 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -11,7 +11,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "hw/usb.h"
 #include "hw/usb/desc.h"
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index b56c75a73a..d02c5d76c6 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -22,7 +22,6 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "qapi/visitor.h"
-#include "qemu/cutils.h"
 
 //#define DEBUG_MSD
 
-- 
2.16.2


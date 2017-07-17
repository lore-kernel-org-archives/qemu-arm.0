Received: by 10.25.44.15 with SMTP id s15csp4830876lfs;
        Mon, 17 Jul 2017 09:43:07 -0700 (PDT)
X-Received: by 10.200.2.139 with SMTP id p11mr28262922qtg.34.1500309786938;
        Mon, 17 Jul 2017 09:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500309786; cv=none;
        d=google.com; s=arc-20160816;
        b=uHulhJawlrUHEx/ysnXLKt7BsRd1qfCmMv2J/pdHf9adnbFGypu1cUfJ+jpaHhcNoh
         tmvkqNi9z+xkHPoSS1LvD8veHrELa6sadwc3KJd3QXQX/nu775Qj79E12NHtlTPSjv+w
         HDbuPLNa4yqxgJHfeO34vFM2KD79D5zcFt0r3pIGXqTg8vrVh1tgwtrJPf9EQ2bDNvIV
         OqeC7tO9ooY7gI7olriRcYmj+UglDZQ+Ewz7fnJ+9adBfkLXWIel/b3UX6vrtveWscV9
         HNnOQKnGTgSMSRcWVBK8LyZBP91RHiYzHDQQ+fsABMJBiA/68Za/7kGEdU4uuhoY20iL
         BLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=eEDOutyEg+u8m3LtgvgJZRRMp7bU3OMv5d7bgdsDVzw=;
        b=QFOMtIjqfWtJ0l6oaiZBnhwgEBwlwxlCXHEF8PvnyZ81dIbNOAEYPIINe5wDFy8li2
         wM7Gn3j9HcOUD3DcpFBXNSLDNE/At99Wm0UhIli1e0VtbdcpG2qUikpdqh3OaUzHBR6G
         lo7etfhtTjfIG4710dvmykapOsJd1ijymZZtRjfdp3br6s6dq5vbyx5KMNeDoGsjfJm6
         hY9h0aNvusydxHRE2tugYBRTlZ5XK98JgHKPCbmYMMfEpGD02ANhFqEDmz4sG+OgD1UZ
         D2CM9DzQRTZuKTjscPtO3qEyxKilhUCakQoxpPDq98144KvShoZS4ovN0V2ERaZB8c3W
         sDDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z188si15283889qke.98.2017.07.17.09.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Jul 2017 09:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dX96u-0001WV-7r
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 12:43:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dX96q-0001WA-14
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 12:43:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dX96o-00010U-Ug
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 12:43:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dX96o-0000zd-Mj; Mon, 17 Jul 2017 12:42:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dX96m-0003mH-AZ; Mon, 17 Jul 2017 17:42:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 17:42:55 +0100
Message-Id: <1500309775-18361-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10] fsl_imx*: Migrate ROM contents
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dwV9JlWAu9v2

The fsl-imx* boards accidentally forgot to register the ROM memory
regions for migration.  This used to require a manual step of calling
vmstate_register_ram(), but following commits
1cfe48c1ce21..b08199c6fbea194 we can use memory_region_init_rom() to
have it do the migration for us.

This is a migration break, but the migration code currently does not
handle the case of having two RAM regions which were not registered
for migration, and so prior to this commit a migration load would
always fail with:
  "qemu-system-arm: Length mismatch: 0x4000 in != 0x18000: Invalid argument"

NB: migration appears at this point to be broken for this board
anyway -- it succeeds but the destination hangs; probably some
device in the system does not yet support migration.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/fsl-imx25.c | 4 ++--
 hw/arm/fsl-imx31.c | 4 ++--
 hw/arm/fsl-imx6.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 8cff3c1..3b97ece 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -249,7 +249,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
 
     /* initialize 2 x 16 KB ROM */
-    memory_region_init_rom_nomigrate(&s->rom[0], NULL,
+    memory_region_init_rom(&s->rom[0], NULL,
                            "imx25.rom0", FSL_IMX25_ROM0_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -257,7 +257,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM0_ADDR,
                                 &s->rom[0]);
-    memory_region_init_rom_nomigrate(&s->rom[1], NULL,
+    memory_region_init_rom(&s->rom[1], NULL,
                            "imx25.rom1", FSL_IMX25_ROM1_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 9027875..0f2ebe8 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -219,7 +219,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     }
 
     /* On a real system, the first 16k is a `secure boot rom' */
-    memory_region_init_rom_nomigrate(&s->secure_rom, NULL, "imx31.secure_rom",
+    memory_region_init_rom(&s->secure_rom, NULL, "imx31.secure_rom",
                            FSL_IMX31_SECURE_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -229,7 +229,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
                                 &s->secure_rom);
 
     /* There is also a 16k ROM */
-    memory_region_init_rom_nomigrate(&s->rom, NULL, "imx31.rom",
+    memory_region_init_rom(&s->rom, NULL, "imx31.rom",
                            FSL_IMX31_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 576c663..26fd214 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -399,7 +399,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                         FSL_IMX6_ENET_MAC_1588_IRQ));
 
     /* ROM memory */
-    memory_region_init_rom_nomigrate(&s->rom, NULL, "imx6.rom",
+    memory_region_init_rom(&s->rom, NULL, "imx6.rom",
                            FSL_IMX6_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -409,7 +409,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                 &s->rom);
 
     /* CAAM memory */
-    memory_region_init_rom_nomigrate(&s->caam, NULL, "imx6.caam",
+    memory_region_init_rom(&s->caam, NULL, "imx6.caam",
                            FSL_IMX6_CAAM_MEM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.7.4


Received: by 10.28.71.27 with SMTP id u27csp1864854wma;
        Sat, 17 Feb 2018 06:06:15 -0800 (PST)
X-Google-Smtp-Source: AH8x224RHpWcThIPieJ8GveA9K7AD7zxmS5Uo2IMl7jPOQdcj9lKmWQ68oa6nMiNW641hFVezGk2
X-Received: by 10.129.182.76 with SMTP id h12mr1446804ywk.207.1518876375806;
        Sat, 17 Feb 2018 06:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518876375; cv=none;
        d=google.com; s=arc-20160816;
        b=HnZ54jW6ZzbyseDhfmu/c1nWr4MOePgAmKVkAhl+0pPROdxx5PS2l3XF9fQgIZm7Aa
         CGVRiTsJbG4iD9C6U/1BDoUxj9HEQwbyIO50vESTSClz5u3l32VguF64NfZbWmpSCuFk
         TKaFSjZYd0vTcNAZDmapZQ44Sc3eGjUOqGHVb6NigX2Q0J4S7Dr/X5C6ZlD86gLKqXg8
         FRjOn6qNgNfXj5enEfdJMaN6pulGkos/uESyn2zhkeMPxiuGpHll7uXH7v3C/6Td2qD6
         NTll2y5aBXKoy5k8fkFO43FDro4B+VOiStC4wZ0HomT5tqUF3IWSZC22OsjkgyaV6u/G
         1gZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ZbjmdgIp5MAF0MP+wTHNPXFmSV6vmH4D940DliqjBxc=;
        b=azboX63yhmnrNFSXAJTDA9VsADFngbprOJgyaj5OfPjh4PImfsUZVImKeFUb2/K7sH
         VJ53WklvfgnvpND488EuhoR4NBiUx17zA6ajBgVbTD5K8dlS4wUEl3MmcG4dEQzsJqJ6
         D1bwJzqz5Dme53KGyMYaREOiaNBlZDVC6an//KYIaG3Dn0iIWMCCfX8xPcyyHnq1Tnk3
         EJK5fgCZ0amg6/JXoK8olgf2WyPbYupknEXe7r2rKJBbhU4l6t1cC8AnTm5IyM+vjK/x
         Aytc/s5K+6V6hxh+zPrezfgyfxQEVkbDD4lVKOes52Bm5OxCbkTM8Fqg1CugmOPPyDcA
         frKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dL/OsS2q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si218683ywh.348.2018.02.17.06.06.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 06:06:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dL/OsS2q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en383-0007r6-9Q
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 09:06:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1en362-0006bU-81
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 09:04:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1en35x-00049R-V8
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 09:04:10 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:43542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1en35x-00048k-OJ
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 09:04:05 -0500
Received: by mail-lf0-x243.google.com with SMTP id q69so7577081lfi.10
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZbjmdgIp5MAF0MP+wTHNPXFmSV6vmH4D940DliqjBxc=;
	b=dL/OsS2qX422zBwmlNmMCaeYzXo2GW+FPqKyzq6YlVICO/nR9gW/jQn/dfF8wmlBtM
	AUNVAVFmtr4Ax7I3/GKouaqiBROYN5Q4dNNmohNtYcrQ9LJhy2N2qKaDr9dK/SbYJoMV
	m/GNB2TLImFF6mSdn0JD9B4oIvvjQ5sFi5w+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZbjmdgIp5MAF0MP+wTHNPXFmSV6vmH4D940DliqjBxc=;
	b=Xs4OnZvJSPeOEczl8L/eAaBSyuMSGCH+rq2XF8uv71z26FBmholmmNOeOCgNFKN8xy
	iW8VSqDXLY48COPWRNYhO81CSceVKy1wFvzKRRwNXE2R6+PHEZTRWm1yF3KUME67+Q8D
	81/Wzby0Pgk9DhFtnu4M+veJzklg/tJHFatFvLu7LsosLlEbO7WqQ95Ug2cadHSXNLkC
	GXBJxecpMgQudlqh5Ll15HZzy6xgLfVoWS4yv/79wS/mEz82O7mZwR3MMbTZgZ3W4qUN
	Ned5U6m9q7jG2e3HvlbRMwuV0Df2t+7lZ6wjPU2LVVEghDAZhbm9hpvAvywmli4/vmRm
	jEIg==
X-Gm-Message-State: APf1xPAezjYzBURvTMVCdchqfQ67X1qjQ8EtliTrXL6EwZGWS29xicoN
	yhUip9FXTOu+iPirAGxKiMbckBjxf+s=
X-Received: by 10.25.210.11 with SMTP id j11mr6590274lfg.42.1518876244181;
	Sat, 17 Feb 2018 06:04:04 -0800 (PST)
Received: from localhost.localdomain
	(c-cb7471d5.014-348-6c756e10.cust.bredbandsbolaget.se.
	[213.113.116.203]) by smtp.gmail.com with ESMTPSA id
	w204sm122054lff.29.2018.02.17.06.04.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 06:04:03 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 15:00:51 +0100
Message-Id: <20180217140051.22731-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217140051.22731-1-linus.walleij@linaro.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH 3/3] arm/vexpress: Add proper display connector
 emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Te2fWqLHHpM/

This adds the SiI9022 and EDID I2C devices to the ARM Versatile
Express machine, and selects the two I2C devices necessary in the
arm-softmmy.mak configuration so everything will build smoothly.

I am implementing proper handling of the graphics in the Linux
kernel and adding proper emulation of SiI9022 and EDID makes the
driver probe as nicely as before, retrieveing the resolutions
supported by the "QEMU monitor" and overall just working nice.

The assignment of the SiI9022 at address 0x39 and the EDID
DDC I2C at address 0x50 is not strictly correct: the DDC I2C
is there all the time but in the actual component it only
appears once activated inside the SiI9022, so ideally it should
be added and removed to the bus by the SiI9022. However for this
purpose it works fine to just have it around.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 default-configs/arm-softmmu.mak | 2 ++
 hw/arm/vexpress.c               | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index ca34cf446242..54f855d07206 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -21,6 +21,8 @@ CONFIG_STELLARIS_INPUT=y
 CONFIG_STELLARIS_ENET=y
 CONFIG_SSD0303=y
 CONFIG_SSD0323=y
+CONFIG_DDC=y
+CONFIG_SII9022=y
 CONFIG_ADS7846=y
 CONFIG_MAX111X=y
 CONFIG_SSI=y
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index dc5928ae1ab5..d6c912c97684 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -29,6 +29,7 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/primecell.h"
 #include "hw/devices.h"
+#include "hw/i2c/i2c.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -537,6 +538,7 @@ static void vexpress_common_init(MachineState *machine)
     uint32_t sys_id;
     DriveInfo *dinfo;
     pflash_t *pflash0;
+    I2CBus *i2c;
     ram_addr_t vram_size, sram_size;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *vram = g_new(MemoryRegion, 1);
@@ -628,7 +630,10 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
     sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
 
-    /* VE_SERIALDVI: not modelled */
+    dev = sysbus_create_simple("versatile_i2c", map[VE_SERIALDVI], NULL);
+    i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
+    i2c_create_slave(i2c, "sii9022", 0x39);
+    i2c_create_slave(i2c, "i2c-ddc", 0x50);
 
     sysbus_create_simple("pl031", map[VE_RTC], pic[4]); /* RTC */
 
-- 
2.14.3


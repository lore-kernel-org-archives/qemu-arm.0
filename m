Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3353852lfp;
        Sat, 15 Feb 2020 11:17:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzlYwP6u4w/ZZ5Vdwop60LgotHAvfp0C3sscslQOEhbBsrvpvDWuRL7cp3I8+eyRBfaG+FE
X-Received: by 2002:ac8:2a55:: with SMTP id l21mr7603547qtl.111.1581794234903;
        Sat, 15 Feb 2020 11:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581794234; cv=none;
        d=google.com; s=arc-20160816;
        b=daIaVvz6yk1KnaN4acAotPASZzo8j8K6RebFHA5cRZ19jfxnIyz3eQ+jqZDJu7U70j
         brx3w/OS7m8Ofi5eLcy2E/f45ORY3pcdCdK0QhX8rHcFLxR/OYClBgG700MDq5yAye+I
         MFKS9Q0FjBQdQ0vGtSwgVjmAozvW/Jfj9y2L55q0KkLoL4hn5IttFfYsHfZHSOfn4vjE
         iMQdFXd+gOU9EoohblKMSy4wvUfXqNHPtUG2UlktXLPAHerm7f5wd/XFetfy3PPpol9z
         q6sV6BYn4GJIRZ5zY1IRSAKGmLsmYezOPbpPMa7QhX6ojPQxZ/faIXYOxi2Te+6MFyw2
         OlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0W7MkWQz+YxLQxe7rZ5JAUVHezRcUYqi0e+LBivqS2A=;
        b=bWsEsXjmEuJ9mfoamoBr5FFxfldD4OI68jjtGRsGPnbhiaBxevjSPlxu4otlM5R/Bx
         QSx/Rtfp3I9VwoZUaQLNMLN/+dpkHi1OBrRSFrRw3UKpeaV2goz7BpceJ1UT7FjBRGnC
         2Ekd+bS8wEsvEQGbvhzR7ISehxQ+8KFSf3iHnDknOPmW/aseZfbKCDyyVhEfZZ4NwlWp
         soaP2Su6i/noJGfZd80A3rnSschLwRIji/5xbRnQWXV8gZjVKuM60sfcIojr0UAErYo3
         eciYeMob+DD6kYsxRszDok3EI5rAXfs1ZUGhndrVUfi2JQoUHEv67Uz61I2K1nqPYAtc
         J/eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ILhpMr0E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si3593395qkk.193.2020.02.15.11.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 11:17:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ILhpMr0E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j32wE-0001dq-9f
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 14:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32ut-0008EY-H9
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32us-0004Ej-GF
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:51 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39926)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32us-0004Do-AE; Sat, 15 Feb 2020 14:15:50 -0500
Received: by mail-wm1-x342.google.com with SMTP id c84so14379253wme.4;
 Sat, 15 Feb 2020 11:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0W7MkWQz+YxLQxe7rZ5JAUVHezRcUYqi0e+LBivqS2A=;
 b=ILhpMr0Ec5qamtt+exYp/0I9fMC0vp2JmeahADcArJbBMI5Zqh5mCav/qA6aUbDMSd
 9NnkHNvhVQxrz0zqNA/rT6SXBSgrA5weHKz2C0wW/7gnxyv6SgM9G5LV6cGkFZtXicVy
 6fD/LZsGPlr+4j2GaLk8yPD7R/sT0JQQ4G+cbl+6/mUSCRN4Jd6mFwTvd7ud/v/zm0pm
 pgdzedObYWjrggYKbF9PaYA/qSpoCEYROa0TUjV+WRC7uAEGPS4FBBzHS1ylLKhOiJJO
 JRzwJQ0O1ScPOEYmnTXHFq7NCS2tPHahmAHbKM55mdelwjGfYhlKSN8PMttnVNlb/uB5
 NHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0W7MkWQz+YxLQxe7rZ5JAUVHezRcUYqi0e+LBivqS2A=;
 b=Cl1Z+Uu+93mWWbaCrWuX9VgVFzjG5lCFk2Lkg8yxNgnGKuT77agbEnPNxSXtuakdQw
 k4vtC1jmd3PME5HHn/57076OyuqUbYTYY4pb7iOx1t8jKmV/k+eYSFE6tVBJNr4b5iFk
 eBUKyRcGag8EFr5hbUVjCch1IkWkj0Odxvbp4LC3S9p4I4LeDrblcyNQMxPxejx9FqC9
 jVvWNB5csV0x1EBKeEMg6gY2I6wWZnTV2ieZKP1W0vp4qLZsyfsSSO1TUFMe8PKk810w
 dUnNZ6fuiJ2ynx5bQFmzTEMBfQCty13+PMDdaZfUDI9labIquNOIyAlpv/5djL+WZDw4
 znPw==
X-Gm-Message-State: APjAAAWt2Luf9/jgs6F2nz5G9PHrMqpWNvEtiUW6VsypCcFDKrYLMUpd
 DXfVG8ZyWb3P17gC2tq2ufwdQ+KtvbM=
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr11519421wme.125.1581794149104; 
 Sat, 15 Feb 2020 11:15:49 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm9678605wrw.20.2020.02.15.11.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 11:15:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] hw/arm/raspi: Avoid using TypeInfo::class_data pointer
Date: Sat, 15 Feb 2020 20:15:33 +0100
Message-Id: <20200215191543.3235-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215191543.3235-1-f4bug@amsat.org>
References: <20200215191543.3235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nbn6XrQN1lkY

Using class_data pointer to create a MachineClass is not
the recommended way anymore. The correct way is to open-code
the MachineClass::fields in the class_init() method.

This partly reverts commit a03bde3674e.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 221356933e..81cc5824c4 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -309,13 +309,9 @@ static void raspi_machine_init(MachineState *machine)
     setup_boot(machine, version, machine->ram_size - vcram_size);
 }
 
-static void raspi_machine_class_init(ObjectClass *oc, void *data)
+static void raspi_machine_class_common_init(MachineClass *mc,
+                                            uint32_t board_rev)
 {
-    MachineClass *mc = MACHINE_CLASS(oc);
-    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
-    uint32_t board_rev = (uint32_t)(uintptr_t)data;
-
-    rmc->board_rev = board_rev;
     mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
     mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
@@ -326,18 +322,34 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = board_ram_size(board_rev);
 };
 
+static void raspi2_machine_class_init(ObjectClass *oc, void *data)
+{
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa21041;
+    raspi_machine_class_common_init(MACHINE_CLASS(oc), rmc->board_rev);
+};
+
+#ifdef TARGET_AARCH64
+static void raspi3_machine_class_init(ObjectClass *oc, void *data)
+{
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa02082;
+    raspi_machine_class_common_init(MACHINE_CLASS(oc), rmc->board_rev);
+};
+#endif /* TARGET_AARCH64 */
+
 static const TypeInfo raspi_machine_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi_machine_class_init,
-        .class_data     = (void *)0xa21041,
+        .class_init     = raspi2_machine_class_init,
 #ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi_machine_class_init,
-        .class_data     = (void *)0xa02082,
+        .class_init     = raspi3_machine_class_init,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.21.1


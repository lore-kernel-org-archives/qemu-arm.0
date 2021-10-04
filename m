Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l2sm15890484wmi.1.2021.10.04.06.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9660D1FF9E;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [PATCH  v1 7/7] hw/arm/raspi: Add the Raspberry Pi 4B board
Date: Mon,  4 Oct 2021 14:47:41 +0100
Message-Id: <20211004134742.2044280-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B+Cr8vO1yoUN

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Raspberry Pi 4 uses a BCM2711 SoC (based on a BCM2838).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
vAJB:
  - use 8gb version
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 03f54887f4..0342aeab03 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -369,6 +369,15 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
+
+static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xd03114;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
 #endif /* TARGET_AARCH64 */
 
 static const TypeInfo raspi_machine_types[] = {
@@ -393,6 +402,10 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi4b"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi4b_machine_class_init,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.30.2

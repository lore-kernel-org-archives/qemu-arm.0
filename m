Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2359591lfi;
        Thu, 26 Mar 2020 13:34:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsDT7/feWBwmwGgZ7ROK/JaI/L7qnorgcaLG4t2DSNwUpuL1V6CWmGvVbt9QEdjbhfmnz/O
X-Received: by 2002:aed:2169:: with SMTP id 96mr10840512qtc.124.1585254868667;
        Thu, 26 Mar 2020 13:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585254868; cv=none;
        d=google.com; s=arc-20160816;
        b=eI2tzfJ4q9Svq/7HRu46uZ8UmjLbrRa0c+5VIr1CW5E2BIeDnEawqFPdSI8aQ/8g2Z
         e3vKYnhhz9YSeQ48TCyUbwdW5uWD90BkrWOkdpTIdDFCyOYtoM2G0Cl/IQSM3h+eyOBp
         MgD+q2VyjOv3jxl0DwPnHHxMTZYfTYmDuGA1t1JTMYkm93tlzDGyDcOmwh9l2WiFXm2k
         iEfYcbRpTaStp56XuR9FVabNXIlqDsRC/g3VuxWyMwtdxXv785WOS+gucvHWdqcqXYO7
         reVVLZhztQKYQRzhrt4ijfXQWEIfhZyo9cBks/pRNgWXlFdrdhlHT0AfR2wKD9tOLnPb
         Cmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=eigIr7yZ70T25XWD0fJuHajFYnnBMnfjgNM68LuO0TM=;
        b=xeQme6eXATtkCGlVWqrSynYuY0PFB1MFKDLY25u529HeBU6cmv7E4RB1RifB/g6Ofg
         RhfDCTlRuXYSBBDtfv2Et6QoXkT1iWObAkn3x0T4SX/Jvh9scjC+xl4bVlbhQ5AQAlWS
         1BDIbkJU7+S/n9cCUWyZxnQkHKB3fhwMH2jbnMp5KRbZIXSGJUsF1s27dkuWtYviPgLb
         9TNLzw5O4C2B/9Qy+T7UiLVQwHlasTzwo0gcHYrO+92tTOxTyuW0CWcb0nrL9IEsNur3
         qZNh309din65snO//DHhhfhIIJ/tChsn107QASEtnXcqnd1xcssBuQ67+t5yC1Q/sMxJ
         VLKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUnYZfPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s37si2226237qth.84.2020.03.26.13.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 13:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gUnYZfPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHZCu-0008Gc-2i
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 16:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZCm-0008GE-Br
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 16:34:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZCl-0001fs-6a
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 16:34:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHZCk-0001ej-Sr
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 16:34:19 -0400
Received: by mail-wm1-x342.google.com with SMTP id a81so9121165wmf.5
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eigIr7yZ70T25XWD0fJuHajFYnnBMnfjgNM68LuO0TM=;
 b=gUnYZfPUrWCJMMFzK/gN0Vf0dCjh3g0omt8SJVYPENCbD7hfBT4MfXAMc5+UpshO1Y
 K1IAGOgsZI8PTvUxgZ2DHB+piaw2erVmie2Su4XKg/oy7pbTwh/rJ5ozBMY/2TrXvpQH
 3O/ihWMrlzVMh4t0ZuMX/9UjmUDZGDlxkYJdmcCSF2YAQ/p5DIesbP3TgNIv4pft7BMU
 bynprzklxZJiJ1paRZG+ybELX//0XCZsftJ3dUbsrU/726tJU4zvZ4EwHwXigC8hBkQW
 2hXoxQe+Avd9fZxuwOoq3+Jgcm3vPKLXIFIKGiVnqLtlBAUTYbZouo4V/lfiU84yZcid
 3Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eigIr7yZ70T25XWD0fJuHajFYnnBMnfjgNM68LuO0TM=;
 b=dIYeC5oak0G4CADAShrutECRovmoEp94448sJP5FJGDv139xNxvHcDh6igs+NEj2Ga
 sJFh1ZISPMGyYBSi706dL7u8arSObdS0gEgxLOh0hlGLPW9IpXkLDGpfQjICTnUw4+iU
 3YhwLGPpDXMYVyzsa4CqUU+dIiQqQxa+PnS5EYx7u6tmCaoBCnbyoCuZ90QB7toY/E+M
 n0yL8d2ZVZK25OnxJMZh4HzxPGxl3QVPvNl9dYcY/rh+2G5ccjHj2cneGdKJlcWwyXjb
 pVFhxgBZB7J0cwP9pLsGKGiDdIDB475aGCK9WET4UrQY7TBIww6dzXEsVbJFttApEmlS
 5L0g==
X-Gm-Message-State: ANhLgQ2wzealjQVOKilrb3SiBa6QGSTEdKkRjLnjb9bDTfPcD1eBRIX8
 hHc5/9DkCfPeoC1iAMWrooxIzyNQusfJ/A==
X-Received: by 2002:a7b:ca4e:: with SMTP id m14mr1715107wml.164.1585254857104; 
 Thu, 26 Mar 2020 13:34:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s11sm5299123wrw.58.2020.03.26.13.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 13:34:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/collie: Put StrongARMState* into a CollieMachineState
 struct
Date: Thu, 26 Mar 2020 20:34:14 +0000
Message-Id: <20200326203414.18140-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHhfIVNqa/KA

Coverity complains that the collie_init() function leaks the memory
allocated in sa1110_init().  This is true but not significant since
the function is called only once on machine init and the memory must
remain in existence until QEMU exits anyway.

Still, we can avoid the technical memory leak by keeping the pointer
to the StrongARMState inside the machine state struct.  Switch from
the simple DEFINE_MACHINE() style to defining a subclass of
TYPE_MACHINE which extends the MachineState struct, and keep the
pointer there.

Fixes: CID 1421921
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/collie.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 4992084a3f6..8ca0df96b47 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -19,6 +19,16 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 
+typedef struct {
+    MachineState parent;
+
+    StrongARMState *sa1110;
+} CollieMachineState;
+
+#define TYPE_COLLIE_MACHINE MACHINE_TYPE_NAME("collie")
+#define COLLIE_MACHINE(obj) \
+    OBJECT_CHECK(CollieMachineState, obj, TYPE_COLLIE_MACHINE)
+
 static struct arm_boot_info collie_binfo = {
     .loader_start = SA_SDCS0,
     .ram_size = 0x20000000,
@@ -26,9 +36,9 @@ static struct arm_boot_info collie_binfo = {
 
 static void collie_init(MachineState *machine)
 {
-    StrongARMState *s;
     DriveInfo *dinfo;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    CollieMachineState *cms = COLLIE_MACHINE(machine);
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -37,7 +47,7 @@ static void collie_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    s = sa1110_init(machine->cpu_type);
+    cms->sa1110 = sa1110_init(machine->cpu_type);
 
     memory_region_add_subregion(get_system_memory(), SA_SDCS0, machine->ram);
 
@@ -57,8 +67,10 @@ static void collie_init(MachineState *machine)
     arm_load_kernel(s->cpu, machine, &collie_binfo);
 }
 
-static void collie_machine_init(MachineClass *mc)
+static void collie_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "Sharp SL-5500 (Collie) PDA (SA-1110)";
     mc->init = collie_init;
     mc->ignore_memory_transaction_failures = true;
@@ -67,4 +79,15 @@ static void collie_machine_init(MachineClass *mc)
     mc->default_ram_id = "strongarm.sdram";
 }
 
-DEFINE_MACHINE("collie", collie_machine_init)
+static const TypeInfo collie_machine_typeinfo = {
+    .name = TYPE_COLLIE_MACHINE,
+    .parent = TYPE_MACHINE,
+    .class_init = collie_machine_class_init,
+    .instance_size = sizeof(CollieMachineState),
+};
+
+static void collie_machine_register_types(void)
+{
+    type_register_static(&collie_machine_typeinfo);
+}
+type_init(collie_machine_register_types);
-- 
2.20.1


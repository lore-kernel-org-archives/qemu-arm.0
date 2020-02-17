Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4989135lfp;
        Mon, 17 Feb 2020 03:47:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqzw7fcSDOpkmA+AZOY2CtZ077eTtJ+cMtfeleLjgoU1y/0wgYiZFTe6+ZGmgZ+L67L7dd3g
X-Received: by 2002:a0c:f910:: with SMTP id v16mr12297339qvn.108.1581940031086;
        Mon, 17 Feb 2020 03:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940031; cv=none;
        d=google.com; s=arc-20160816;
        b=g2wEkEAVBg1zYe1I7uTRokyOqJG7CWK86HK5o3dKkm8JRp+am5aFSjPluN9PLbskvH
         R83S2jO8LtodYNFYo4XQcVgxSHWmbouxPUZN9CWUM4aGABU0uX5amdXck6b1lPf4i9WX
         SS3ySTwvD941tn6kqOoXcfkQQ3/zX40bjZn+/Zwuyso5vF1Z/S84txUXqf6oe2YEC2Z8
         OpShWsem/jf7bqTPjmNal9fY0JFaoj1TiLjEK8LWjOAYyiPOB9qYlboMm1pLA1QOHK/Z
         GwOwIhRxj8YG/hNbwlPpufyJQI3JXXyBB6FKxebkCCYxjU1voSp1X8pxA6frguGse2AH
         n6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VKFmxLOGnHffoRhD3MbqsWU4YBZCUj/Q1JFXeGbGN9Q=;
        b=JjVGZ/JwqpBGoFonfojMsIIVVfY5Msv3NP7MToH4l8hJaldtdS1FU3X7daM7xc8Zej
         bBnDW+WT7k+0WM8hEWkwp9qY+Sz3AS4MvK0eoMWRg/d9v/hXRksuY6iFO+PA15I/6Rba
         2eIi0Yfut9s6ZJePeEhXMyI6AUiIyGhZYMqx1Ed56sYi9pt5YbXiB9r94ZDrCPrquzNC
         +g4cPMxN6esNns+ggvTYjtQ7l6stMJXwEmvsxVlztnMvSq4hVSPGlhXRmkVFZSKzUVUd
         49q7qIQcLdvvnk2uvrkOayYN7AWzdynVwfOKxVjxOCgZnkSdvxXIG9HnoBYLCK7uzuBD
         wKhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rrlg03E7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si158859qvt.102.2020.02.17.03.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rrlg03E7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3erm-00009X-Ce
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqN-0006V2-3O
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqL-0002PO-UE
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:45:43 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45282)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqJ-0002KV-EG; Mon, 17 Feb 2020 06:45:39 -0500
Received: by mail-wr1-x442.google.com with SMTP id g3so19302238wrs.12;
 Mon, 17 Feb 2020 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VKFmxLOGnHffoRhD3MbqsWU4YBZCUj/Q1JFXeGbGN9Q=;
 b=rrlg03E7oHFT3lxqyAj65RWWIB8Y2kApUR+nWdEaPS/bdSGkudrbIYMni9wMJwBInH
 E0kMsuUyUPOyj/vEf1hxHoXBXXuvE6QZlkJCNAYE2asJyMiLxNfWnFem9xoJwRk0+ctb
 yzFPjHIt0lNt5aKsa08StwWfVMpZDbYO3jZFP/+Z6IL06Qj7BWqxUFMCkQT3EO/KrfaY
 uRAtmVGfeHLjTOFHt0CXSN7xszSoJu217ohdnMVLcq7R5HmasLOG+jGQzYvXXUBmZfi5
 JmPyJTU2d9+V2USWl2qC0u+jfyVBZFBSJaFKrYkrcMqMajcTKsD0MoVOXcNqSiLDopJH
 yILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VKFmxLOGnHffoRhD3MbqsWU4YBZCUj/Q1JFXeGbGN9Q=;
 b=jZKH+uEWFqkG7uFQEcttzfFJx9hLVJWF/nZO4g7NiUkA0U1Gay83i7F7AO00Ugf05j
 oOECYxR+WE7uDAatqXlBczosazgH0j7U/Fa0fbo17HjwzyD6y/Kxubqi2AIZKTPAVIi6
 j0anPMSHOUo3tK5kwMjcaM+QdOO7rilHHs2l+QOM8U0HK/eTLDyRBaJRkWPmFTI69Aus
 +HBBOAuPJnk8nykCYE8k/GfPM060Y3xf5XreuZaj8LjuZxLLt4T4X12ztLNCea4a5raE
 BeT9pIyfZa4OYlR73WMYG2ODRCqJ0DFBeSvMEkPH9FiBSqRY16S2YU9je8YhmdV8yI8H
 oblw==
X-Gm-Message-State: APjAAAUrD7IqSe1zWrQo7+/krPrXtH5p5+/J4XuX1dmewR40+tKYBi+f
 Ix9U8+HimbZ4KE0qi0CxUuzIwpnTp6E=
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr21975408wro.421.1581939938204; 
 Mon, 17 Feb 2020 03:45:38 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/13] hw/arm/raspi: Avoid using TypeInfo::class_data
 pointer
Date: Mon, 17 Feb 2020 12:45:22 +0100
Message-Id: <20200217114533.17779-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gPM4fy/NyVyj

Using class_data pointer to create a MachineClass is not
the recommended way anymore. The correct way is to open-code
the MachineClass::fields in the class_init() method.

We can not use TYPE_RASPI_MACHINE::class_base_init() because
it is called *before* each machine class_init(), therefore the
board_rev field is not populated. We have to manually call
raspi_machine_class_common_init() for each machine.

This partly reverts commit a03bde3674e.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 221356933e..1a8c135dc6 100644
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
@@ -326,18 +322,36 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = board_ram_size(board_rev);
 };
 
+static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa21041;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
+#ifdef TARGET_AARCH64
+static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0xa02082;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+#endif /* TARGET_AARCH64 */
+
 static const TypeInfo raspi_machine_types[] = {
     {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi_machine_class_init,
-        .class_data     = (void *)0xa21041,
+        .class_init     = raspi2b_machine_class_init,
 #ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3"),
         .parent         = TYPE_RASPI_MACHINE,
-        .class_init     = raspi_machine_class_init,
-        .class_data     = (void *)0xa02082,
+        .class_init     = raspi3b_machine_class_init,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.21.1


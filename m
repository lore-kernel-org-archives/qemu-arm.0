Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6395760wrt;
        Mon, 21 Jan 2019 11:13:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5DAKAWlCrgSy218ey3c3SFpSqPhGjEBXfywr4DVvl4DYkqOT6sjc1IBi7lV8nhPZVxo55O
X-Received: by 2002:a5d:6647:: with SMTP id f7mr29295750wrw.225.1548097984804;
        Mon, 21 Jan 2019 11:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548097984; cv=none;
        d=google.com; s=arc-20160816;
        b=W19rBmsbQv+EPXNdIliYi8L6qPFg3LYGZLij52kpsQ27N2PCwlglSNVvIaLida1c8P
         gcDJRYUAHh4tRE8rXt2ClxIvWFMpi7JoVHrO0CYCGk16fMKX964P/SEme3CZQOdEtzFU
         C6R3aEDzt3xnty+e7Nc35jJkmruuTRRqc0GVKLtSTRNHfkL8nUi0f4g/2alAQLzWDDwR
         vbzpYQVmB/eYJlavHzw+6LJGcArbXL45x1Tx52hbZUJmywtsuI7qzFrCaw86X4rROMXf
         STPn5IEzrfvoJdjbOniYp4va7wPz3wuLM7KSl3l8G7gVtd3q/RaJEZt93CVPwqRbTXg+
         Hpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=JNtduwYQb9S31DnKOmDqWMP8TZCY2KnxF33CO6L/1os=;
        b=x/gbn6W33VwbsZlvxnuZVFyRCmHByU1IQHaXdH1AzRzflMNjcDehPiYAQBFPsMx9TR
         sl+o84opq59+nLB9gSSv0+K2J9uRPe6A9cOepXogg3yDoY1R36Fb4o0BiAx7/mHAZAzA
         h+x1XP3oa/tpMcGxrm9q34BRklfX0p7UJKjGoAZ1qYUbPVc3v68Y8jERhRONB7yQetRX
         iet0cRgwlbcD1xN96ewsUKXcCNawSXvIspV84po2CdHLQVZc/QPJyg5jq5qWc9qxZIsT
         3g5J4y4OZCR5RDjbhApWT38UNgAbUKVzPQUSK1jCrEkOtfYoEXm+medTScfgsZi/ULRS
         sSmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UmFxpTCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si62418220wrl.456.2019.01.21.11.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UmFxpTCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf0J-0004B6-LQ
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevI-000854-TA
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:07:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefk-0002yV-A2
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:49 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefk-0002xf-33
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:48 -0500
Received: by mail-wm1-x342.google.com with SMTP id p6so11832351wmc.1
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JNtduwYQb9S31DnKOmDqWMP8TZCY2KnxF33CO6L/1os=;
	b=UmFxpTCyQNPsd5yCz3IUG6NDUQgDTjtRNvrJkg/jl0KKO9fLl6vg6uJsaM+7eIVoOC
	Oze52UFN9sCOQqMHMzDYLIvmT6oMGkaY8HzgYdEp+f9QGE+hqqQeLrJ0zDb7uPapXqMw
	EHeR8uZdmLNyhUH7P/18x96aaILmDt8Nwxweo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JNtduwYQb9S31DnKOmDqWMP8TZCY2KnxF33CO6L/1os=;
	b=oAdzMlXDC98TeIBjWVYbk45Oj6Nwx3qSvAidQ6xy0w6m4FQKnC68xDkF3/9a/BHG47
	qKDNyl7v4ZL2XFJ+890jD34S8J6QUuEOhlDzQm+Hp85iZffea4str3SY+/CGshh2rP25
	YT9yeCviV8UgeDE17qHr9Sq3qjO7HH95ksV8fkQbIvkeXKPPRbPOzpIEAPAs2m58Gzdh
	XY29dAEYZnnxZ1VwT30I63mRsse8i36XLaIdxHgUR0va31ic3LuNd/Z0FAms8roHhC9f
	XSEwAPyQsNj6+UcNuNst5vGzV7Lt2iTaHDh4nS/3jOUHi6ssQTO0h4FVCRxQEM0e/SIg
	OKeg==
X-Gm-Message-State: AJcUukfPOfDJEJH69RPRAFNoIAAahu0nmpG97UNHLnB+ojpg48BWFABO
	BrHpEDf2jZUGZhd9Q1Pp5j1vwMSrEOY5Xg==
X-Received: by 2002:a1c:d74a:: with SMTP id o71mr531544wmg.73.1548096706692;
	Mon, 21 Jan 2019 10:51:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:18 +0000
Message-Id: <20190121185118.18550-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 23/23] hw/arm/mps2-tz: Add mps2-an521 model
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kABpdEcKombE

Add a model of the MPS2 FPGA image described in Application Note
AN521. This is identical to the AN505 image, except that it uses
the SSE-200 rather than the IoTKit and so has two Cortex-M33 CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 95adcd478ab..f5f0b0e0fa5 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -15,6 +15,7 @@
  * as seen by the guest depend significantly on the FPGA image.
  * This source file covers the following FPGA images, for TrustZone cores:
  *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
+ *  "mps2-an521" -- Dual Cortex-M33 as documented in Application Note AN521
  *
  * Links to the TRM for the board itself and to the various Application
  * Notes which document the FPGA images can be found here:
@@ -24,10 +25,16 @@
  * http://infocenter.arm.com/help/topic/com.arm.doc.100112_0200_06_en/versatile_express_cortex_m_prototyping_systems_v2m_mps2_and_v2m_mps2plus_technical_reference_100112_0200_06_en.pdf
  * Application Note AN505:
  * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * Application Note AN521:
+ * http://infocenter.arm.com/help/topic/com.arm.doc.dai0521c/index.html
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
  *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * Similarly, the AN521 uses the SSE-200, and the SSE-200 TRM defines
+ * most of the device layout:
+ *  http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ *
  */
 
 #include "qemu/osdep.h"
@@ -64,6 +71,7 @@ typedef struct {
     MachineClass parent;
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
+    const char *armsse_type;
 } MPS2TZMachineClass;
 
 typedef struct {
@@ -93,6 +101,7 @@ typedef struct {
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
+#define TYPE_MPS2TZ_AN521_MACHINE MACHINE_TYPE_NAME("mps2-an521")
 
 #define MPS2TZ_MACHINE(obj) \
     OBJECT_CHECK(MPS2TZMachineState, obj, TYPE_MPS2TZ_MACHINE)
@@ -379,7 +388,7 @@ static void mps2tz_common_init(MachineState *machine)
     }
 
     sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
-                          sizeof(mms->iotkit), TYPE_IOTKIT);
+                          sizeof(mms->iotkit), mmc->armsse_type);
     iotkitdev = DEVICE(&mms->iotkit);
     object_property_set_link(OBJECT(&mms->iotkit), OBJECT(system_memory),
                              "memory", &error_abort);
@@ -632,7 +641,6 @@ static void mps2tz_class_init(ObjectClass *oc, void *data)
     IDAUInterfaceClass *iic = IDAU_INTERFACE_CLASS(oc);
 
     mc->init = mps2tz_common_init;
-    mc->max_cpus = 1;
     iic->check = mps2_tz_idau_check;
 }
 
@@ -642,9 +650,28 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
 
     mc->desc = "ARM MPS2 with AN505 FPGA image for Cortex-M33";
+    mc->default_cpus = 1;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN505;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
+    mmc->armsse_type = TYPE_IOTKIT;
+}
+
+static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS2 with AN521 FPGA image for dual Cortex-M33";
+    mc->default_cpus = 2;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
+    mmc->fpga_type = FPGA_AN521;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mmc->scc_id = 0x41045210;
+    mmc->armsse_type = TYPE_SSE200;
 }
 
 static const TypeInfo mps2tz_info = {
@@ -666,10 +693,17 @@ static const TypeInfo mps2tz_an505_info = {
     .class_init = mps2tz_an505_class_init,
 };
 
+static const TypeInfo mps2tz_an521_info = {
+    .name = TYPE_MPS2TZ_AN521_MACHINE,
+    .parent = TYPE_MPS2TZ_MACHINE,
+    .class_init = mps2tz_an521_class_init,
+};
+
 static void mps2tz_machine_init(void)
 {
     type_register_static(&mps2tz_info);
     type_register_static(&mps2tz_an505_info);
+    type_register_static(&mps2tz_an521_info);
 }
 
 type_init(mps2tz_machine_init);
-- 
2.20.1


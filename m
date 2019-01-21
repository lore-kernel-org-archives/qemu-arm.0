Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6401241wrt;
        Mon, 21 Jan 2019 11:20:23 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6fZLVA8BLVbRTzVUrU7Pr+AIpJDCge3HPjBB2ESnBkYK6x6PYSFsSjyIDzmkB0Ex/w7yy/
X-Received: by 2002:adf:84e4:: with SMTP id 91mr29135351wrg.237.1548098423257;
        Mon, 21 Jan 2019 11:20:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098423; cv=none;
        d=google.com; s=arc-20160816;
        b=TbNjTicLeJbJR6AHcW/102C7Tg5rdNvvFSpl3xcz2LmeL5inPqIqXmfwj7n6sviiKE
         lroFJiSGZrmGlaM/xQmpWYGnlaRbONzisXO7umWK+SZGJT3jhnbTPCKUAzIDzKXhaOMm
         ynIEty4I1u1Kb67h5GQzFpCI7YMe7/6qPfninA00gH1lBNhct/jY4VK/8KNFAvSLQkck
         wXq2YvNSwtK2dE5fl8u1JJW6EVAWldX6jrimJtupYoHyHb3YC7LgN/x/hSW2Fb0XULJq
         uykSX35FCpohKKZSOoiGUEz7roAthLr30BmTHr4VtiFqVosvC2XTwyyDaO5RdrVgF4BU
         w0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=y0iJP1/0IWSi2a//xChFZD3ZT9ballXzK0ZjLQwVNl8=;
        b=r3imy8Cvz+dDF7aEsAqJRjiveFocj41spnb1SQnIcH6rfuatMSb6OBJdviVPkWTsYc
         DTE8qa5giLM5J9O2WS4E/XrlqsV14oeuQEwFYU5ynS3M9F+Ry69YSGuzP3RhH1DQMSJT
         RXBZvYBV+x+5/fncWJB+cELDXC7Q2lJOc8K0jBlIK34doz0TNDMHzMh18vV+XKmd2154
         X4LBYUrq4hd2VqkqlMWQXaQ544VRB8q3xq9jFz0zD7yzQBy7BJfp5MkjEQwQs/YmiIIT
         wIFY3DTZ+W0xy3e/ycBEXjwSre/LjlHl57G5JBIY3tHOAjRu3Vtfam7ICGEc+3042yTc
         G38A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L/V3fAmO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 33si38832030wrq.155.2019.01.21.11.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:20:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="L/V3fAmO";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glf7O-0001FV-9p
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:20:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevP-0007jF-Nl
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefh-0002wL-JN
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:48 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefh-0002vv-CI
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:45 -0500
Received: by mail-wr1-x442.google.com with SMTP id c14so24667087wrr.0
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y0iJP1/0IWSi2a//xChFZD3ZT9ballXzK0ZjLQwVNl8=;
	b=L/V3fAmOrajnLxIzBOWs3x+pFR3SCRdZ1OX/H++FufMgmt8nooRFHp8b+BOJxnOAyk
	N7daPs0ZVixlYoj23Q/4gEeVdRWkQXUNdvGGG43WZtU0NtXTbPk8bd9O2z0a6QSvgVGO
	VmWSHiIGcDjEFRp+2ge/EXNA87V3598kxjMTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y0iJP1/0IWSi2a//xChFZD3ZT9ballXzK0ZjLQwVNl8=;
	b=SH4kalsZn4YDAJETeFfLlGDQADbWq/aTewbugDw+cIpowULhAnilcX2/qJjHxpgACk
	TgQTiHBay820sS51vCLU7jCA867FF7bA3dUnWm+wEy/XU83oCcPMQ7I8/TPe2EXqAHq9
	ld8pOqKz3l836U6oAnnPyOHxQ4C+Pkw0v6wiRRM9eSjjZQm2tD3aNHky8ASiQGYuLPQc
	KE9TlWeBEFQjfVeQth7XdLLU4u5+YduDfC+dVGTzZM/EhZv5/lBrnUdljOCF4VOgkouN
	as5bWw3ANXuoRehYBbl0VqP5wUkTWMhFbkiBm8SGzJdwsi7yS6VmGjy1W/8ua5nnqZU/
	fHVg==
X-Gm-Message-State: AJcUukfAjvsTk2byUG9grmAXNoFjELcJjOYy3nvvy3HfuX/gbBCB/dVU
	VnHYUIgHdtLDj0u/cr8hVlS7uw==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr30473940wrf.206.1548096704432;
	Mon, 21 Jan 2019 10:51:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:16 +0000
Message-Id: <20190121185118.18550-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH 21/23] hw/arm/armsse: Add SSE-200 model
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iT9byT2C1sMD

Add a model of the SSE-200, now we have put in all
the code that lets us make it different from the IoTKit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 19 ++++++++++++++++---
 hw/arm/armsse.c         | 12 ++++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 3914e8e4bf2..f800bafb14a 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -1,5 +1,5 @@
 /*
- * ARM SSE (Subsystems for Embedded): IoTKit
+ * ARM SSE (Subsystems for Embedded): IoTKit, SSE-200
  *
  * Copyright (c) 2018 Linaro Limited
  * Written by Peter Maydell
@@ -12,9 +12,13 @@
 /*
  * This is a model of the Arm "Subsystems for Embedded" family of
  * hardware, which include the IoT Kit and the SSE-050, SSE-100 and
- * SSE-200. Currently we model only the Arm IoT Kit which is documented in
+ * SSE-200. Currently we model:
+ *  - the Arm IoT Kit which is documented in
  * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
- * It contains:
+ *  - the SSE-200 which is documented in
+ * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ *
+ * The IoTKit contains:
  *  a Cortex-M33
  *  the IDAU
  *  some timers and watchdogs
@@ -23,6 +27,14 @@
  *  a security controller
  *  a bus fabric which arranges that some parts of the address
  *  space are secure and non-secure aliases of each other
+ * The SSE-200 additionally contains:
+ *  a second Cortex-M33
+ *  two Message Handling Units (MHUs)
+ *  an optional CryptoCell (which we do not model)
+ *  more SRAM banks with associated MPCs
+ *  multiple Power Policy Units (PPUs)
+ *  a control interface for an icache for each CPU
+ *  per-CPU identity and control register blocks
  *
  * QEMU interface:
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
@@ -93,6 +105,7 @@
  * them via the ARMSSE base class, so they have no IOTKIT() etc macros.
  */
 #define TYPE_IOTKIT "iotkit"
+#define TYPE_SSE200 "sse-200"
 
 /* We have an IRQ splitter and an OR gate input for each external PPC
  * and the 2 internal PPCs
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index eb691faf720..5d53071a5a0 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -50,6 +50,18 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpusecctrl = false,
         .has_cpuid = false,
     },
+    {
+        .name = TYPE_SSE200,
+        .sram_banks = 4,
+        .num_cpus = 2,
+        .sys_version = 0x22041743,
+        .sys_config_format = SSE200Format,
+        .has_mhus = true,
+        .has_ppus = true,
+        .has_cachectrl = true,
+        .has_cpusecctrl = true,
+        .has_cpuid = true,
+    },
 };
 
 static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
-- 
2.20.1


Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5562859lfc;
        Mon, 15 Feb 2021 04:07:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypXDFJzaNl3Toz2TqdZt2khVmm6dqnt8qE8N8UjXKOfXMIa73Z+Q7najGOcH2cICa+dH4x
X-Received: by 2002:a25:344f:: with SMTP id b76mr9806198yba.398.1613390861892;
        Mon, 15 Feb 2021 04:07:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390861; cv=none;
        d=google.com; s=arc-20160816;
        b=kNC7rthyRroMuNgM+Qs9xjvWoyl6opTHFTu6EcsZc2s3bsK2tx6itU2eEmJfiq/LcS
         f6/MM/xFsUkMvErX3L/WwH/g3yGtywFDkotCJF66IvmnjD8hz0x8n5CF6dahPuOhzlEE
         35MbY1ZZjMWV5ADUHpE2PFDrQUMT8Bc1yIhuwpDDzrp7yJYw9sd8yvMYQjktvMzwhtb9
         98mDes929vjG4dvKpQn6OactX1luITAf/OlZFY5GcZTAsnTVXIBGYDXhHMUaRrjJtq21
         qDIBaEXRrZGa9Cbd1mUK6Y5T40M0AjsAjJFJ3lm9vpuIN4zxNzCKaDFUAOVsc0fJKgM4
         GOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=olyCqXlwgdAYPiStvMqcHJzP/susydF9jK1tL5ZtuZw=;
        b=0WEt7xYCUcTvza0icUsJj1iUgsA+OuIqRMzd+sbkC8Bgrvj8+ImKV+q/RWjN463PHp
         xhWoA34V2ByvoW0t1cc5cBiwucQL4VpAi9aHCXN4dV4wBvJ0aD/UqdqKzmk5DsxZppEW
         Wre634dPLj4PukYBBsHIP5xi80DFSorHae4jJi6md8WD2yCmBxvjaZ4AGrLD/UFTHjrT
         U+Zf4DDXH3PYiw8+6hX20FCdwRzCYTg+NXy4b2Ciw82n4T0jZULfWZbLLtmIcD5D9Ov/
         Tx4TXVLjaTNcluCEc13jAVhwIvztVttWOg3Zh0h2tL+DiNJPRWbBAbV4w1E9n+t4+S0f
         F4ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RUrpppAz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si7532377ybk.210.2021.02.15.04.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:07:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RUrpppAz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcfF-0000Ky-2o
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:07:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRO-0000U8-JR
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRG-0004Kz-NQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:22 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so8445218wrx.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=olyCqXlwgdAYPiStvMqcHJzP/susydF9jK1tL5ZtuZw=;
 b=RUrpppAz27ItZoUxpMweqNUA+M1ZBEep1ZQM02I4mf3YjvvIxXxYOXApsPDZMfhn9l
 dbnokCOUB3o1LPUetbAOZKa8aH0yBWbHvQRTJ6QP1cEf8H0ZOdj2/mkJ+t9Zb+u4iQZ0
 ZozJHMAJZVvDN8xxE5k92u4NZvoPQiNi48WVYL5nv/6z8hchniGYVqOL0hPLcrSJg2JR
 UB+65i7IBA7uVyNlHnvMtizHgMMmbwrpOdlcmPdlz+QGNJCXiHoF7qiEmhBOlVEfAfSD
 XGyvrmJc3HxYdDUBFmp9PAF41FbtkctV9uB5kj9WNFJzdpjAc9SMu2lzhF+ZCFB6jCLf
 gQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=olyCqXlwgdAYPiStvMqcHJzP/susydF9jK1tL5ZtuZw=;
 b=uBTnEuLK/yA0rxVxYEJEfVgbTBdQjfY23yxaMbwW4y1ktxlHy9J7musg9j2zZlV0ld
 pVBNxyOC+OZP7WejnGvXzLaLuZ8dhey8dwPD14+yHvMMfv03XQxNcExr0H1Q8Jd7Hd0t
 LJr5z0nDeamPjMx0WQ4Dtl4QXzCPKXnxgh8vfeItDhgFYU+GjC7XhCd45XZO8mkXsh5L
 TyYGT2gnPPnbFtkXVHsLLSvIRlbFbJEZY2K+OvuIxkNDKj+xIbhVwGXfYtJrrlo6cD9E
 zOkYELhbBTTGYbUxmBepENruihkmahLm3bLpPxzTdGAGRep8QQTwNcpmKKB2aLDOKJqm
 cLew==
X-Gm-Message-State: AOAM532u9c3hqbg/2M48hirOWhqXeby2D2xNkJj+uszdzehyMO2UpsC/
 QeiyPVD7Qtz9k2BHCvcka47Kiw==
X-Received: by 2002:adf:b749:: with SMTP id n9mr18301985wre.267.1613389993300; 
 Mon, 15 Feb 2021 03:53:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:53:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 24/24] hw/arm/mps2: Update old infocenter.arm.com URLs
Date: Mon, 15 Feb 2021 11:51:38 +0000
Message-Id: <20210215115138.20465-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qgPQtVipsNs8

Update old infocenter.arm.com URLs to the equivalent developer.arm.com
ones (the old URLs should redirect, but we might as well avoid the
redirection notice, and the new URLs are pleasantly shorter).

This commit covers the links to the MPS2 board TRM, the various
Application Notes, the IoTKit and SSE-200 documents.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
There are some other infocenter URLs in the codebase; we should
probably update those too, but they don't really fit in with this
patchset, so I'll do them separately later.
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/armsse.h          |  4 ++--
 include/hw/misc/armsse-cpuid.h   |  2 +-
 include/hw/misc/armsse-mhu.h     |  2 +-
 include/hw/misc/iotkit-secctl.h  |  2 +-
 include/hw/misc/iotkit-sysctl.h  |  2 +-
 include/hw/misc/iotkit-sysinfo.h |  2 +-
 include/hw/misc/mps2-fpgaio.h    |  2 +-
 hw/arm/mps2-tz.c                 | 11 +++++------
 hw/misc/armsse-cpuid.c           |  2 +-
 hw/misc/armsse-mhu.c             |  2 +-
 hw/misc/iotkit-sysctl.c          |  2 +-
 hw/misc/iotkit-sysinfo.c         |  2 +-
 hw/misc/mps2-fpgaio.c            |  2 +-
 hw/misc/mps2-scc.c               |  2 +-
 14 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 676cd4f36b0..09284ca75cf 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -14,9 +14,9 @@
  * hardware, which include the IoT Kit and the SSE-050, SSE-100 and
  * SSE-200. Currently we model:
  *  - the Arm IoT Kit which is documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ *    https://developer.arm.com/documentation/ecm0601256/latest
  *  - the SSE-200 which is documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ *    https://developer.arm.com/documentation/101104/latest/
  *
  * The IoTKit contains:
  *  a Cortex-M33
diff --git a/include/hw/misc/armsse-cpuid.h b/include/hw/misc/armsse-cpuid.h
index a61355e5161..9c0926322cb 100644
--- a/include/hw/misc/armsse-cpuid.h
+++ b/include/hw/misc/armsse-cpuid.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "CPU_IDENTITY" register block which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  *
  * QEMU interface:
  *  + QOM property "CPUID": the value to use for the CPUID register
diff --git a/include/hw/misc/armsse-mhu.h b/include/hw/misc/armsse-mhu.h
index 2671b5b978b..41925ded89b 100644
--- a/include/hw/misc/armsse-mhu.h
+++ b/include/hw/misc/armsse-mhu.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the Message Handling Unit (MHU) which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  *
  * QEMU interface:
  *  + sysbus MMIO region 0: the system information register bank
diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index 54c212b515c..227d44abe49 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -11,7 +11,7 @@
 
 /* This is a model of the security controller which is part of the
  * Arm IoT Kit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  *
  * QEMU interface:
  *  + sysbus MMIO region 0 is the "secure privilege control block" registers
diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 2b5636b218c..2bc391138db 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system control element" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * Specifically, it implements the "system information block" and
  * "system control register" blocks.
  *
diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 7e620e2eafe..055771d2098 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system information block" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * QEMU interface:
  *  + QOM property "SYS_VERSION": value to use for SYS_VERSION register
  *  + QOM property "SYS_CONFIG": value to use for SYS_CONFIG register
diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index 0d3c8eef56c..e04fd590b63 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -12,7 +12,7 @@
 /* This is a model of the FPGAIO register block in the AN505
  * FPGA image for the MPS2 dev board; it is documented in the
  * application note:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * https://developer.arm.com/documentation/dai0505/latest/
  *
  * QEMU interface:
  *  + sysbus MMIO region 0: the register bank
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 2c385422373..aca8efba6cf 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -23,21 +23,20 @@
  * https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/mps2
  *
  * Board TRM:
- * http://infocenter.arm.com/help/topic/com.arm.doc.100112_0200_06_en/versatile_express_cortex_m_prototyping_systems_v2m_mps2_and_v2m_mps2plus_technical_reference_100112_0200_06_en.pdf
+ * https://developer.arm.com/documentation/100112/latest/
  * Application Note AN505:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * https://developer.arm.com/documentation/dai0505/latest/
  * Application Note AN521:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0521c/index.html
+ * https://developer.arm.com/documentation/dai0521/latest/
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
- *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ *  https://developer.arm.com/documentation/ecm0601256/latest
  * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
  * most of the device layout:
- *  http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
- *
+ *  https://developer.arm.com/documentation/101104/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/armsse-cpuid.c b/hw/misc/armsse-cpuid.c
index d58138dc28c..e785a090519 100644
--- a/hw/misc/armsse-cpuid.c
+++ b/hw/misc/armsse-cpuid.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "CPU_IDENTITY" register block which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  *
  * It consists of one read-only CPUID register (set by QOM property), plus the
  * usual ID registers.
diff --git a/hw/misc/armsse-mhu.c b/hw/misc/armsse-mhu.c
index a45d97fada8..0be7f0fc874 100644
--- a/hw/misc/armsse-mhu.c
+++ b/hw/misc/armsse-mhu.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the Message Handling Unit (MHU) which is part of the
  * Arm SSE-200 and documented in
- * http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
+ * https://developer.arm.com/documentation/101104/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 964b48c74d9..222511c4b04 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system control element" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * Specifically, it implements the "system control register" blocks.
  */
 
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index b2dcfc4376c..52e70053df7 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -12,7 +12,7 @@
 /*
  * This is a model of the "system information block" which is part of the
  * Arm IoTKit and documented in
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
+ * https://developer.arm.com/documentation/ecm0601256/latest
  * It consists of 2 read-only version/config registers, plus the
  * usual ID registers.
  */
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index acbd0be9f4b..76308543fcb 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -12,7 +12,7 @@
 /* This is a model of the "FPGA system control and I/O" block found
  * in the AN505 FPGA image for the MPS2 devboard.
  * It is documented in AN505:
- * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
+ * https://developer.arm.com/documentation/dai0505/latest/
  */
 
 #include "qemu/osdep.h"
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 562ace06a58..140a4b9ceba 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -13,7 +13,7 @@
  * found in the FPGA images of MPS2 development boards.
  *
  * Documentation of it can be found in the MPS2 TRM:
- * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.100112_0100_03_en/index.html
+ * https://developer.arm.com/documentation/100112/latest/
  * and also in the Application Notes documenting individual FPGA images.
  */
 
-- 
2.20.1


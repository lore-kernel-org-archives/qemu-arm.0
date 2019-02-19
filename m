Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3379882wrx;
        Tue, 19 Feb 2019 05:03:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbRIKHcvxWYlrI2Tow0jC+TxPewK9cgXbpf1SezRh+lhk7snF+stLp3KjETO2oHngZRE7yJ
X-Received: by 2002:a0c:9e6b:: with SMTP id z43mr1308399qve.131.1550581385156;
        Tue, 19 Feb 2019 05:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581385; cv=none;
        d=google.com; s=arc-20160816;
        b=SNj+4AF5I7iBylbKv22wNSd+XVbSc+ocET8ct1zGl8DDd059hShvUCo0WHrd9Ln7cF
         v5I5qwAeJNbUdVEzbDa/fyLdu3kMyg0caH6IhEVAJeqW5wS7WA6xPu/lv1hG4JBiVkMM
         QLvhDwkL/Sq2ut+C2EHPmjI9yh3CzHTg21+IB3FSpUnCNKz4rIgvUTPvrGKQw39KJVqb
         GWh5cA3nVK9273TacHGfYSNt2D+h/eqW6eN06DoWfu44w4UMynNT/7/sHmo/tj87vn9c
         sdMdHmHsHMBXRLL63Ifd3sjXhu9rOMlStWIO72CtZjgwPJ+EyHGdpGy1ITtld61SVC05
         9ZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=h7p/j2bF8mRYbAEayArl2bX6oWoA1v9jlyX/daxOJvc=;
        b=tsNNxLCy5PWSuLC+akx5XNBii3hKWvhBOncjE2ozdrLY/bIuN0ddrueYyricQ8sVFw
         kIXLQdeSeU4HPpkySMMrZBKS/c3sAre9tdh4BPU43n3sle/XxtfCH27eFM3BF4VQi0U5
         ROCWza3JCKV23UNPqe/wMrh+kvVXQSyCMBGNV6gsAUcCbLHphWVK9q/LJs7azBXa5E3t
         unQwRz/IynJ7FATEG5foG/74ozm+hBQy5s24MZnyF6e8NSxMqOOIeZ8JdZ96qBa6yzqo
         1ZH6ZEyuJrJklLBxqOJY//wMoR0S0g+KrfldLDm23KAMb2LRfzbe6Ds16G3pmrNkl7lC
         YT4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PpNqtpeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si2375990qtc.15.2019.02.19.05.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 05:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PpNqtpeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw53A-0005iK-IX
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 08:03:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yx-00023r-Dp
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yt-0002xx-8m
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:42 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4ym-0002rY-TP
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:33 -0500
Received: by mail-wr1-x434.google.com with SMTP id i12so21930348wrw.0
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 04:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h7p/j2bF8mRYbAEayArl2bX6oWoA1v9jlyX/daxOJvc=;
	b=PpNqtpeGj5dalW1H3GxIQJB9JGiU/qnLn4PA3sE1sNUmypvkQfbxLw4LRUOFBrHI5A
	BRImZNFFUk+3kUXO1LhH2iSFkBr3jwIyNVypFMJU5OM2Iuw9095sjRTUiMjxmOEBDBFO
	ZpB8EcQuqdQBACwumD2yXS4sSR9jBhZnw5EZq47dQMC9laORTtbhAKy+wQc8LHCXfU+J
	ptjOVqwcmROFYYA6hLty6nupnss92CNBemxw1P1zlnEdpOE2EuimwlybpaVOBLl3suwE
	L8onE1y3tnmNymXGic9+8FNFDW348q+/2998hjkLycXAP9JtRmpo3nMxD8kQ4Lk3ziMs
	1lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h7p/j2bF8mRYbAEayArl2bX6oWoA1v9jlyX/daxOJvc=;
	b=nzChWbHqtYyYbGRnw5lZqZ3GDgjdrLugLd0lqgGim6kJGyzvTcK7BNi1eER47p9Y8l
	edkamUIFJ/WwuNmhcd6YEdvvsIEVDADSqYlKUboUum+MsrthhVzXJka1HM7gp8rgkPWe
	LYG9H1YzDrNionanHzsiCwUHoBaYLDuOpKoooyfDztVbboAFX+kMyWkrJfhFcw8hPyRj
	f3Oexo73buHCammlbtgzeoViAONJz6mKY/BtyxV9Y5cDo38KsQyL2zjXvlo/RUklkFdb
	oWJxdMyNIk/WcaYFGk01D7fVGL8BUcnmDTc3EGFbPscNaHIwGeQMJYh3YHdHL3TbGnpa
	EbYw==
X-Gm-Message-State: AHQUAuahk16nlGhqBmQ0x8IUDHDwCBHgV41QmEWuBftYtr9KuAlLgjEW
	9/Sm/sIEH6HKaGyfaolUoVLnVCscOPuIkQ==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr19444389wrs.85.1550581100559; 
	Tue, 19 Feb 2019 04:58:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:07 +0000
Message-Id: <20190219125808.25174-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219125808.25174-1-peter.maydell@linaro.org>
References: <20190219125808.25174-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-arm] [PATCH 7/8] hw/arm/iotkit-sysctl: Implement CPUWAIT and
 INITSVTOR*
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
X-TUID: EdO+ccdWTQwT

The CPUWAIT register acts as a sort of power-control: if a bit
in it is 1 then the CPU will have been forced into waiting
when the system was reset (which in QEMU we model as the
CPU starting powered off). Writing a 0 to the register will
allow the CPU to boot (for QEMU, we model this as powering
it on). Note that writing 0 to the register does not power
off a CPU.

For this to work correctly we need to also honour the
INITSVTOR* registers, which let the guest control where the
CPU will load its SP and PC from when it comes out of reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/iotkit-sysctl.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 05606017fc2..e333c8169a3 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -25,6 +25,8 @@
 #include "hw/sysbus.h"
 #include "hw/registerfields.h"
 #include "hw/misc/iotkit-sysctl.h"
+#include "target/arm/arm-powerctl.h"
+#include "target/arm/cpu.h"
 
 REG32(SECDBGSTAT, 0x0)
 REG32(SECDBGSET, 0x4)
@@ -69,6 +71,21 @@ static const int sysctl_id[] = {
     0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
 };
 
+/*
+ * Set the initial secure vector table offset address for the core.
+ * This will take effect when the CPU next resets.
+ */
+static void set_init_vtor(uint64_t cpuid, uint32_t vtor)
+{
+    Object *cpuobj = OBJECT(arm_get_cpu_by_id(cpuid));
+
+    if (cpuobj) {
+        if (object_property_find(cpuobj, "init-svtor", NULL)) {
+            object_property_set_uint(cpuobj, vtor, "init-svtor", &error_abort);
+        }
+    }
+}
+
 static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
@@ -229,11 +246,18 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         s->gretreg = value;
         break;
     case A_INITSVTOR0:
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl INITSVTOR0 unimplemented\n");
         s->initsvtor0 = value;
+        set_init_vtor(0, s->initsvtor0);
         break;
     case A_CPUWAIT:
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CPUWAIT unimplemented\n");
+        if ((s->cpuwait & 1) && !(value & 1)) {
+            /* Powering up CPU 0 */
+            arm_set_cpu_on_and_reset(0);
+        }
+        if ((s->cpuwait & 2) && !(value & 2)) {
+            /* Powering up CPU 1 */
+            arm_set_cpu_on_and_reset(1);
+        }
         s->cpuwait = value;
         break;
     case A_WICCTRL:
@@ -287,8 +311,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         if (!s->is_sse200) {
             goto bad_offset;
         }
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl INITSVTOR1 unimplemented\n");
         s->initsvtor1 = value;
+        set_init_vtor(1, s->initsvtor1);
         break;
     case A_EWCTRL:
         if (!s->is_sse200) {
@@ -382,7 +406,16 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->gretreg = 0;
     s->initsvtor0 = 0x10000000;
     s->initsvtor1 = 0x10000000;
-    s->cpuwait = 0;
+    if (s->is_sse200) {
+        /*
+         * CPU 0 starts on, CPU 1 starts off. In real hardware this is
+         * configurable by the SoC integrator as a verilog parameter.
+         */
+        s->cpuwait = 2;
+    } else {
+        /* CPU 0 starts on */
+        s->cpuwait = 0;
+    }
     s->wicctrl = 0;
     s->scsecctrl = 0;
     s->fclk_div = 0;
-- 
2.20.1


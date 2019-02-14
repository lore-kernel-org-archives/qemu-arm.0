Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp951771wrp;
        Thu, 14 Feb 2019 05:04:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZRSQU1YIjWzFhUfevS5EROBn0FKxrHaCeh4F1qxHXI4Jee89nehcl2yPvp1l8iwwEj/XyA
X-Received: by 2002:ae9:c106:: with SMTP id z6mr2617134qki.197.1550149444985;
        Thu, 14 Feb 2019 05:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149444; cv=none;
        d=google.com; s=arc-20160816;
        b=jU8TErgDsQB3FHW8M/DGG4iKNCuM3jtYxb2QXnCaPAX4yap6PBm1wWs0HjvVwzlC+o
         qasWxYFFHrYWuqc1lgsgBI9CdugtQtH5Q30IoCgtJ82UwXVnbDwPsHECYxD+I3L+AdLB
         MsWrOON5JyjJBcA4EqUm6g3HvwbdmyKlMMpHPjgwPqOTFjQoD2x85TAEK+NugmcWoQZ+
         Rjp3lsBTCxPTGdZ3IcgdnMQGVcjFERYW9OI8mj0HN6X7f2iVNRFCwSHnmVrNnHHENsmt
         ouLAbeNpi035xmWDF+gHc4yzvOqxgWzNxc5oHNUFWUhHnImNhbvIYHWNR6i72bWzm6Ly
         Gj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LPT0GH8RargF2/EI2vjidZ0F87i5Cplwmh30EfoSbEQ=;
        b=YAC19XyL9R97tP1HTdDznCsSG6nlS2zKpQpP23sQ2E7JVjnUEuW/oh9gRFREQ4Lags
         dC0vjHIZc8Ur3wRpX9t7oKDkBEKGkLEEd/NutOmH9Empn71PkoVtLZpH3EqqnMhMmi35
         DJn1YeTP3pwIjD0WIcEdDKB8LjyhRyNHvorJSYgQfwC+XvMGV2kyoIdk7cQDX9odLDHO
         5WhYP1yHfTJTnrODYZSTvCOXKPmNiYPzrArqcruFyyB3CK6zgCr/67nDVkY5nwDTjNMs
         7WXGtKVcvcrQRXC9kredrmS2PnUILP6woh6SX5K9AftDqDm1YgnfS9ne8PZx5p7vzycM
         rwmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p7hrRiVW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si1514482qtk.118.2019.02.14.05.04.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:04:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=p7hrRiVW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGgO-0003tE-CK
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeU-00038O-4U
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:02:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGTx-0006Rr-Ux
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:14 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40011)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGTx-0006RS-Oo
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:13 -0500
Received: by mail-wm1-x342.google.com with SMTP id q21so5966731wmc.5
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LPT0GH8RargF2/EI2vjidZ0F87i5Cplwmh30EfoSbEQ=;
	b=p7hrRiVWsFBlyNxj6IJNQiOC58XJfdUMZuytcUqUUl9xzzLFCYonr60Bcq3gFA7bKr
	gMStSBHEgLl6NKJt52sDDfb2zZyM1lpuFD+4SuHyR6wRs03CmiS8AYc3YXZhcZseRG/s
	EVryYxeHebleyGHv8mmW/exv3NFEtLE+/rA2ao62aIIIgLuBUOqVrhwTlfu2M9rJMuu+
	JuFCJl/2t3x00/pcMV6lV8hFseJFU/ZM2SaCnwfjp6l59/bN7ALDSDQKwKr9hWfhjN16
	PLl84uARj9+2o9J7URb7Zk22S3TRBhn+mvDfnGRs9K+rgE8rqq7HmsPvkPGoX8sz4iBO
	UNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LPT0GH8RargF2/EI2vjidZ0F87i5Cplwmh30EfoSbEQ=;
	b=l1Tcm6KuAyQk7nLJ3xOPP2qvOtcuj9Z+DifQ7QUYuCxPWJjE+HRwZewacWNtfFrpPt
	KAIQkZa77fX+DQf0zBEjnmppZ+Ug8edDuhRY5aQ6z38Uult9YDopLX2pz5Lfmx3FMahg
	ae2v4dzypYDgNx8XHlAnRFbW7OF4i7zhur8F5VVJ//8IsqsYV7rNazQdJF3L0wY6fXRL
	rtmkvB2YvGvQLzx6GQKPmwEdUTBaawhPVz1RVN5dYT9m+f8GMG5TMiSoQ+U67IsienyW
	+F/ICbCF/zV4SS1daU3yKF3di5rJ2uvMjrj+lZ0kWrXz2FmciVkz4BvXTZhLnLwwr1Zb
	j0TA==
X-Gm-Message-State: AHQUAubaeVptSdASm9CCr23P0dMbsTRcefYvZtIEzv95ILy7NyY+qfft
	YntWJpHcMi7IQ0QdLt7T3e0decqn4IYv/A==
X-Received: by 2002:a1c:9810:: with SMTP id a16mr2625054wme.37.1550148672786; 
	Thu, 14 Feb 2019 04:51:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:56 +0000
Message-Id: <20190214125107.22178-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 03/14] hw/timer/pl031: Allow use as an
 embedded-struct device
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
X-TUID: KxxBQtzj+Ues

Create a new include file for the pl031's device struct,
type macros, etc, so that it can be instantiated using
the "embedded struct" coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/pl031.h | 44 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/pl031.c         | 25 +----------------------
 MAINTAINERS              |  1 +
 3 files changed, 46 insertions(+), 24 deletions(-)
 create mode 100644 include/hw/timer/pl031.h

diff --git a/include/hw/timer/pl031.h b/include/hw/timer/pl031.h
new file mode 100644
index 00000000000..99416d8ba52
--- /dev/null
+++ b/include/hw/timer/pl031.h
@@ -0,0 +1,44 @@
+/*
+ * ARM AMBA PrimeCell PL031 RTC
+ *
+ * Copyright (c) 2007 CodeSourcery
+ *
+ * This file is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#ifndef HW_TIMER_PL031
+#define HW_TIMER_PL031
+
+#include "hw/sysbus.h"
+
+#define TYPE_PL031 "pl031"
+#define PL031(obj) OBJECT_CHECK(PL031State, (obj), TYPE_PL031)
+
+typedef struct PL031State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    QEMUTimer *timer;
+    qemu_irq irq;
+
+    /*
+     * Needed to preserve the tick_count across migration, even if the
+     * absolute value of the rtc_clock is different on the source and
+     * destination.
+     */
+    uint32_t tick_offset_vmstate;
+    uint32_t tick_offset;
+
+    uint32_t mr;
+    uint32_t lr;
+    uint32_t cr;
+    uint32_t im;
+    uint32_t is;
+} PL031State;
+
+#endif
diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index d3aacce80da..f774dcd5223 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/timer/pl031.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
@@ -36,30 +37,6 @@ do { printf("pl031: " fmt , ## __VA_ARGS__); } while (0)
 #define RTC_MIS     0x18    /* Masked interrupt status register */
 #define RTC_ICR     0x1c    /* Interrupt clear register */
 
-#define TYPE_PL031 "pl031"
-#define PL031(obj) OBJECT_CHECK(PL031State, (obj), TYPE_PL031)
-
-typedef struct PL031State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    QEMUTimer *timer;
-    qemu_irq irq;
-
-    /* Needed to preserve the tick_count across migration, even if the
-     * absolute value of the rtc_clock is different on the source and
-     * destination.
-     */
-    uint32_t tick_offset_vmstate;
-    uint32_t tick_offset;
-
-    uint32_t mr;
-    uint32_t lr;
-    uint32_t cr;
-    uint32_t im;
-    uint32_t is;
-} PL031State;
-
 static const unsigned char pl031_id[] = {
     0x31, 0x10, 0x14, 0x00,         /* Device ID        */
     0x0d, 0xf0, 0x05, 0xb1          /* Cell ID      */
diff --git a/MAINTAINERS b/MAINTAINERS
index 9a76845581b..85d4b4c9f7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -493,6 +493,7 @@ F: hw/sd/pl181.c
 F: hw/ssi/pl022.c
 F: include/hw/ssi/pl022.h
 F: hw/timer/pl031.c
+F: include/hw/timer/pl031.h
 F: include/hw/arm/primecell.h
 F: hw/timer/cmsdk-apb-timer.c
 F: include/hw/timer/cmsdk-apb-timer.h
-- 
2.20.1


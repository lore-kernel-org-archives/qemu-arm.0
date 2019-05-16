Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp858896wrg;
        Thu, 16 May 2019 09:39:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxPS0eTn4KSxvAowl4z5y8xv5krctRnZ/131EtD8W033TPCGDeqBm5f0eg3vj9RkFtz0t0
X-Received: by 2002:a05:6402:180b:: with SMTP id g11mr52029835edy.268.1558024769186;
        Thu, 16 May 2019 09:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558024769; cv=none;
        d=google.com; s=arc-20160816;
        b=yKCd0Hlz2S0pC3OF0bXGUX0ivPcPsIS6flg1P0cEOQZh+lu2+gUUW3rGghv1fFxf6y
         Sc/Bh5T79zwymu8nVHnz9az/EIEzWnQ2lupVQZibmoIpsadTcauN/Az/NMX4JEKsu84N
         43LEgBJZGMXb+21dE6y9rALGnyVvpAPvKtL81B8VHDjF12owj5l5ul65jYKzihNatBmp
         M+v4EqWy959Q0Ct+28WoQuioMflCfgOFFDZzZkUumy0oR+pUnVYaIY5x0btjda9um8Ep
         JK482mtspUbDC0LQRN0Z35LRI3Q8g/hoF1x9kg+ZufTdLBmaA4DbHp9IaV07aF93S+XX
         uJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EHWFkbuw1ciTuYhMY21VSgxzzXPrQYdg2HxcH0sKDA8=;
        b=doBY5H5T11w0xYNyUV+BiLYPxBpTGNEZLZiUogHQSWoiEJqd7224wwSefXQpZhGTGt
         eTlDrraWcOeQD3/r5CMOK+HDCJF+BKe8rhbSlvdIFYQdCA/Kv1hOI67cyaIVCVKuRFm4
         2QXu3YWzAxIoJewO+bVJDX6aVBTbAb7KnIIvjUfbjd8zbTLQt1DqYSOcuW6WZlwphhIJ
         0u9JeEUzg09mdeONJ/260iK592zdDJTLXCb7AfujF/nqSmLIl8wVAc1SKYhAIoipvSh8
         i9wSSp372AMnrHK/uZSXM07nPjVsdTPL7Jn3H8LOewqAFxk5O9J0Jw5t+bSKFhMFhZDj
         ierA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q+TOHrkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si4213075edg.63.2019.05.16.09.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 09:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q+TOHrkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRJPk-0004QR-7H
	for alex.bennee@linaro.org; Thu, 16 May 2019 12:39:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRJPP-0004NU-4W
	for qemu-arm@nongnu.org; Thu, 16 May 2019 12:39:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRJPN-0002lj-MT
	for qemu-arm@nongnu.org; Thu, 16 May 2019 12:39:07 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38633)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRJPN-0002kr-GH
	for qemu-arm@nongnu.org; Thu, 16 May 2019 12:39:05 -0400
Received: by mail-wm1-x341.google.com with SMTP id t5so2795716wmh.3
	for <qemu-arm@nongnu.org>; Thu, 16 May 2019 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EHWFkbuw1ciTuYhMY21VSgxzzXPrQYdg2HxcH0sKDA8=;
	b=q+TOHrkT0BeTNHQYLV/vZj9BA4rrv7GtykA/Z1BxO55nCHUviQneVDAOS+RMzyjFl/
	OUwm0u+x3TmWRzCJ5oEXMmy2M0i5GmgTaZOi7jj2E7BThxXLrFGHwmnlDiNCa9EIYZaz
	BSiXcEadsXcgIb5GGXDLlJECSefAmr+INQDqQ2dJo0ENK3ezbnQCK8s2LqRQS49BzcmS
	CCI3RxwQXjAZvZBu6l04nJCCRJiTNxDjJc9w4o9syBevrd978rZDNw+Y/kF5rRgPV1yl
	docNZ1WzLTnOdAui8IX6pxf0kOo+lYXPjSyZ4A7cJpQwMfRGkupaNJ8aMa7jsp25QWw5
	nktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EHWFkbuw1ciTuYhMY21VSgxzzXPrQYdg2HxcH0sKDA8=;
	b=VixhHJvrGhynPzYL4LhZyIye8bL02vL7xosvOnRkv7bxWXluj6LDPFHm/MfaOHcbGo
	B2u8h2yH+V2iEGDZSjBIRKiWed6bmuB6mucqf/2SoYJR4UR2IHIA4GF0+iDb/GlrZok2
	i7uewvQAlz2r85QxsfsZUq9YR68dIZZWc61mWaGQJ6+NV5my8T2RWrOFdSq0z343VB3F
	PVsTRP1sUrAThQotldni/DWr03RyR2uLLE8xrkR8fappAClIjmBj89KFXbCPinIGkPxg
	bfElUYZqBO5RlTjlkvijB7BYOIFXhHiU6/8wxec+GOU+QluzzBzJvq4SoaQXMBYfcDCY
	RlHw==
X-Gm-Message-State: APjAAAWUUs8YRq2eLi4XTCyOCY3MQcjuJ7zjyuJwFPSlIBlrdPsNce/Z
	UR9LbGZx3UhjqJyBdsDs0lHGFQ01dhI=
X-Received: by 2002:a1c:eb07:: with SMTP id j7mr27300676wmh.138.1558024743333; 
	Thu, 16 May 2019 09:39:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y130sm6702844wmc.44.2019.05.16.09.39.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 09:39:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 16 May 2019 17:38:56 +0100
Message-Id: <20190516163857.6430-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516163857.6430-1-peter.maydell@linaro.org>
References: <20190516163857.6430-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 2/3] arm: Remove unnecessary includes of
 hw/arm/arm.h
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JEC8E21JFuAd

The hw/arm/arm.h header now only includes declarations relating
to boot.c code, so it is only needed by Arm board or SoC code.
Remove some unnecessary inclusions of it from target/arm files
and from hw/intc/armv7m_nvic.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 1 -
 target/arm/arm-semi.c | 1 -
 target/arm/cpu.c      | 1 -
 target/arm/cpu64.c    | 1 -
 target/arm/kvm.c      | 1 -
 target/arm/kvm32.c    | 1 -
 target/arm/kvm64.c    | 1 -
 7 files changed, 7 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 3a346a682a3..815e720cfab 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -16,7 +16,6 @@
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
-#include "hw/arm/arm.h"
 #include "hw/intc/armv7m_nvic.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 8b5fd7bc6e3..ddb94e0aba0 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -29,7 +29,6 @@
 #else
 #include "qemu-common.h"
 #include "exec/gdbstub.h"
-#include "hw/arm/arm.h"
 #include "qemu/cutils.h"
 #endif
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a181fa8dc1a..6e421271580 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -30,7 +30,6 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #endif
-#include "hw/arm/arm.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 228906f2678..37a57c4f60b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -25,7 +25,6 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #endif
-#include "hw/arm/arm.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 59956346126..fe4f461d4ef 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -23,7 +23,6 @@
 #include "cpu.h"
 #include "trace.h"
 #include "internals.h"
-#include "hw/arm/arm.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 327375f6252..4e54e372a66 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -20,7 +20,6 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "internals.h"
-#include "hw/arm/arm.h"
 #include "qemu/log.h"
 
 static inline void set_feature(uint64_t *features, int feature)
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e3ba1492482..998d21f399f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -26,7 +26,6 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "internals.h"
-#include "hw/arm/arm.h"
 
 static bool have_guest_debug;
 
-- 
2.20.1


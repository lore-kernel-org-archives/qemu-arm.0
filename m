Received: by 10.25.44.15 with SMTP id s15csp6353969lfs;
        Wed, 2 Aug 2017 09:44:37 -0700 (PDT)
X-Received: by 10.237.35.203 with SMTP id k11mr35415052qtc.182.1501692277545;
        Wed, 02 Aug 2017 09:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692277; cv=none;
        d=google.com; s=arc-20160816;
        b=gWiydzxDADs+cDnsFgNtVdXkiy4kl0j9ysuBzzIMc0zp1usBYwhtIUlG6mVvzgM7cP
         6MqRwF0P5B5DVn3Zq08oo2ufsNnhsap1oYxVzGtrg+5z0Pi9x3dkDLkr4Hah0XPuFI4Z
         rZUTwmcxeEJE5K1yxACLzEr3IhPLzV784zelZ/uOJqTuSJKIPshRM12i6Cupqe6u8T1U
         W9EiqUw6Ne8uCf50LbSi9IozB0f3Pf0uPOB3VaLouDRDU1wuoSaWnEypTSxQg3AhuGed
         Mz1Mm2xAHpcK7QVFxUMIska3F9mp44mejtITmj10h8Ro3feT1rOL3wMJ8uI8MUf7hBs5
         nfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=suVInd7KYDrTK7MIgJprQgQp7uQFFYRMUUDoE1rTEnU=;
        b=K5j5GbMiYxIyFCOXPdyQpyIUEPGra36RqsTsufJFnE0ucpwFRKkA6Qbzr66BJB2N08
         cwk23unJuAziT9qP0Se8rCPunaDnEApkJQF69c1hebrAAE0dwGUT0jSS4snSxIwbZM2t
         hD113pbjlQ4DIlj+8XFv/FFNgRDf1Rk8+f2fUrIXs9QHvwlP7Ag/5G9fauaXx7XMqQtT
         A+N8b8OJFWNkkKep+yuD+xbjPvHhrtxjsdkEoT+T01IbLNyXCnyslNtuGpTz04NwYM2k
         9aUHHbuPN/ap7yLyj8n2FojjYvo/JDGDKxFVJ79eCijW4rFKtgpmYTRq1RH0O5owaeL3
         yEoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9si33198533qkh.65.2017.08.02.09.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwl8-0003Um-AJ
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:44:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl3-0003Th-LY
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl2-0004cS-No
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl2-0003zA-HK; Wed, 02 Aug 2017 12:44:28 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkj-000417-AT; Wed, 02 Aug 2017 17:44:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:44:00 +0100
Message-Id: <1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 14/15] armv7m_nvic.h: Move from include/hw/arm to
 include/hw/intc
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
X-TUID: aKfxz7Ned4hM

The armv7m_nvic.h header file was accidentally placed in
include/hw/arm; move it to include/hw/intc to match where
its corresponding .c file lives.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c                  | 2 +-
 include/hw/arm/armv7m.h                | 2 +-
 include/hw/{arm => intc}/armv7m_nvic.h | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename include/hw/{arm => intc}/armv7m_nvic.h (100%)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 343bc16..5a18025 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -17,7 +17,7 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/arm/arm.h"
-#include "hw/arm/armv7m_nvic.h"
+#include "hw/intc/armv7m_nvic.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/log.h"
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index a9b3f2a..10eb058 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -11,7 +11,7 @@
 #define HW_ARM_ARMV7M_H
 
 #include "hw/sysbus.h"
-#include "hw/arm/armv7m_nvic.h"
+#include "hw/intc/armv7m_nvic.h"
 
 #define TYPE_BITBAND "ARM,bitband-memory"
 #define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
diff --git a/include/hw/arm/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
similarity index 100%
rename from include/hw/arm/armv7m_nvic.h
rename to include/hw/intc/armv7m_nvic.h
-- 
2.7.4


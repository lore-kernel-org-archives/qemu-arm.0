Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458806lfq;
        Thu, 7 Jan 2021 09:07:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypjVMHtiIEsgvLbiVIpPuETEQSBt22uka7UJcQ3/7638MGhFRh78TZndp1KS0zNzpXqn2R
X-Received: by 2002:a17:902:59dd:b029:db:cda3:39c0 with SMTP id d29-20020a17090259ddb02900dbcda339c0mr2950177plj.81.1610039249737;
        Thu, 07 Jan 2021 09:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039249; cv=none;
        d=google.com; s=arc-20160816;
        b=cbKOSBPdS2v/efBLfvaYo4f7LTwp0HtzxFJcqmeRdY+nY9Q4LWf0qDApV7RmqA2/uf
         GLt7tpsBZyUkTq2T/ku+vn3yqo6GNcRF6qR6EMCRNo4tURUkG4UAxYeITeTUjO53pJsG
         sz3b0NConxFgH19XWwrHjVaxxnAHZ7nBA1IYgLbZhqhyC0FllZz5r1/Bk7STDYzNnyHN
         KtJNkxNWZASewq3O1oyXSisseG/xHObXY/iKoPG+FGz7wu3WPJeHX3GWodEArak4jE6V
         qwm0ewEfjHDWa+jIfbQ78+LJc3MDPoptS2xzXMCrMjtoWyVJUuw4xrpQLGC0Z28Zh0gh
         Ajgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=47XPx38ZimaR8oNiruRmudVAGS8k+gN5rSz7NwM/0V4=;
        b=OKrswPSJHbzLaHgKXAdqWVAZvL2Iap0iQMnSR4RLQw6RP3y195hOo0jfAtYWanIefi
         PYAkvB6V7I2JfwMPtJtP8QNGuVhJDfaVRfMsY/jjik205SN/99qeVBX3h8dmtwjoIQ5K
         WyA+f18KXoO7I4+qycHuTCTPVAnaQgo+qlugaNOvq4tV6htr5O41vvFfIifI7VkZDb1V
         OisJFJQgtRS80BGEyJjmBd7rviBEm74QJUY1avrbcSmoXNgqAiioqno72wYeFEMObU9T
         5owEZl95UoIc5IeXIi8MDClsw1TkC3DXWpcEqaUSnUOYUNr1CiCVHhAHtn7hVx5GSV+Q
         J0DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=VTx2UJmB;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id m6si6449261pgl.142.2021.01.07.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=VTx2UJmB;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 651A13F2E263;
	Thu,  7 Jan 2021 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039247; bh=EHscTKWyEFqqL+QpnQrPGpYwQDdIi+ZqeBK7ty7vNd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VTx2UJmB7bJh+gvAJL8W+2iWppS/c4VI1d5n643dTZWYLEjZDtstQBnxKLhW70R5B
	 JtLz3rJcZjd6eCM94P35Fl8IbYjyuBC+HpINy6gZVRwQnUvMiEnOOdwNVJaBoe96YO
	 Rz/SCivWuNy2q0TTdD/9z9X74Ksf/XJHmIUgnaEbbUgAzhjZ4TrCYZ1BVi44K8Uq4i
	 CgWye4SbdZLvkBqTv5ORYiebK/s78lOxTCfwkJToGbvMIbXnRXu0Zwg2mjgW24TwRP
	 wkjwz1xBfrY323yCEVBrKkFC56rlkqoHiztBMUcoQF1w4I3Lk0sv4t9KxwEWjpSYWs
	 pgcBR7J5umPKA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VbLQYyZhT5_6; Thu,  7 Jan 2021 09:07:27 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id 1F7EC3F2E362;
	Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id 0445A742DC7; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 4/9] semihosting: Support SYS_HEAPINFO when env->boot_info is not set
Date: Thu,  7 Jan 2021 09:07:12 -0800
Message-Id: <20210107170717.2098982-5-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VMxaf8UH4xvm

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>

Message-Id: <20201214200713.3886611-5-keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 43 +++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 33c82f73b1..f09deff4d3 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -137,6 +137,36 @@ typedef struct GuestFD {
 
 static GArray *guestfd_array;
 
+#ifndef CONFIG_USER_ONLY
+#include "exec/address-spaces.h"
+/*
+ * Find the base of a RAM region containing the specified address
+ */
+static inline hwaddr
+common_semi_find_region_base(hwaddr addr)
+{
+    MemoryRegion *subregion;
+
+    /*
+     * Find the chunk of R/W memory containing the address.  This is
+     * used for the SYS_HEAPINFO semihosting call, which should
+     * probably be using information from the loaded application.
+     */
+    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
+                   subregions_link) {
+        if (subregion->ram && !subregion->readonly) {
+            Int128 top128 = int128_add(int128_make64(subregion->addr),
+                                       subregion->size);
+            Int128 addr128 = int128_make64(addr);
+            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
+                return subregion->addr;
+            }
+        }
+    }
+    return 0;
+}
+#endif
+
 #ifdef TARGET_ARM
 static inline target_ulong
 common_semi_arg(CPUState *cs, int argno)
@@ -175,7 +205,18 @@ common_semi_rambase(CPUState *cs)
 {
     CPUArchState *env = cs->env_ptr;
     const struct arm_boot_info *info = env->boot_info;
-    return info->loader_start;
+    target_ulong sp;
+
+    if (info) {
+        return info->loader_start;
+    }
+
+    if (is_a64(env)) {
+        sp = env->xregs[31];
+    } else {
+        sp = env->regs[13];
+    }
+    return common_semi_find_region_base(sp);
 }
 #endif
 
-- 
2.29.2

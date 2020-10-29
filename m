Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp886949lfa;
        Thu, 29 Oct 2020 13:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Zwq2W2dbFDHH6GAt02bc8DJWAHi06EyYkLqd+Q3N0FfZ1HgptfeZOMOwQPh1yvbHQcrE
X-Received: by 2002:a5d:9602:: with SMTP id w2mr4911326iol.120.1604003121178;
        Thu, 29 Oct 2020 13:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604003121; cv=none;
        d=google.com; s=arc-20160816;
        b=HPUOG8nPN22G/WI//e2KnPNPFItL4KVvsS7C7vawq5cdztNxOlKNyPm+5rC5/3jDK+
         rdI4VNMKEIsaMhJz5Let5owkSpIif4YQddS+xZBW7EUjIXBvj0NbkwiT4A7arMAnzLaC
         Oj6mLqJYcOgCiUOtuy0qzA2RM6BvIuPzvvY2NNl6Wyr33AZpytSbDM67ZT/k9HAgr1AE
         MW8kLqfhUT+Y3JhPufhsy77a9QZAglbvNDnkThGl/xhzLPTVqR8NbAw/2BVG4N5fXJ0X
         NMhnecxMWYCEjNsOeYFhGevdITvpN3Pt9Ax1nEJNXuTyeKFo0qRXoxRPnSG501syREVx
         bI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=/tBmC3YcdW6vxWvQ+1fP/eEs6OdNbyx3lpcd5eWqJMk=;
        b=Co4qlbJvFpNnUCFzWuOP4HtpAnT0lZfzCX1QBV0js5UlL9dOp8pUQCcB15FDzf5d+t
         MkoJ5vMGLYONDWwFeLgslramdCPxXGXv1tsQTFn+Xn6hIyBm6kRFTc7Ccy0DbaiMXHJX
         mPUTcqF9hyoJmOIO1LinOrpKikMHKzjVysGoaF+rQzdmN6bv1ZyrTTkRi5KI1ZWc1JuE
         ijUy9dk/X476ctgSTb3spvm1Av7+MyOh9zeStvu13mmEJK0FEWTNF6ycuURscJIS1Z1k
         HTaNYCx8qCIfkyVZVLGllSzElUltW1Apqt+D0BiaB1dyQEEzzKo9aa7PRlUuAlMp/pcl
         BhCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si3347444jan.5.2020.10.29.13.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 13:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYEU4-0000WN-HC
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 16:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>) id 1kYETx-0000W3-9x
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:25:13 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:48098
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1kYETv-0002vj-8d
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 16:25:12 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 7B8085FC12
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2020 21:25:06 +0100 (CET)
From: remi@remlab.net
To: qemu-arm@nongnu.org
Subject: [PATCH 1/1] target/arm: fix LORID_EL1 access check
Date: Thu, 29 Oct 2020 22:25:06 +0200
Message-Id: <20201029202506.9209-1-remi@remlab.net>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 16:22:01
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: ttlW/wAGlarO

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Secure mode is not exempted from checking SCR_EL3.TLOR, and in the
future HCR_EL2.TLOR when S-EL2 is enabled.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc51175bf0..6854591986 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6679,9 +6679,10 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 #endif
 
 /* Shared logic between LORID and the rest of the LOR* registers.
- * Secure state has already been delt with.
+ * Secure state exclusion has already been dealt with.
  */
-static CPAccessResult access_lor_ns(CPUARMState *env)
+static CPAccessResult access_lor_ns(CPUARMState *env,
+                                    const ARMCPRegInfo *ri, bool isread)
 {
     int el = arm_current_el(env);
 
@@ -6694,16 +6695,6 @@ static CPAccessResult access_lor_ns(CPUARMState *env)
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult access_lorid(CPUARMState *env, const ARMCPRegInfo *ri,
-                                   bool isread)
-{
-    if (arm_is_secure_below_el3(env)) {
-        /* Access ok in secure mode.  */
-        return CP_ACCESS_OK;
-    }
-    return access_lor_ns(env);
-}
-
 static CPAccessResult access_lor_other(CPUARMState *env,
                                        const ARMCPRegInfo *ri, bool isread)
 {
@@ -6711,7 +6702,7 @@ static CPAccessResult access_lor_other(CPUARMState *env,
         /* Access denied in secure mode.  */
         return CP_ACCESS_TRAP;
     }
-    return access_lor_ns(env);
+    return access_lor_ns(env, ri, isread);
 }
 
 /*
@@ -6738,7 +6729,7 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "LORID_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
-      .access = PL1_R, .accessfn = access_lorid,
+      .access = PL1_R, .accessfn = access_lor_ns,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
-- 
2.29.1


Received: by 10.223.188.70 with SMTP id a6csp5106444wrh;
        Tue, 22 Aug 2017 08:47:00 -0700 (PDT)
X-Received: by 10.233.239.11 with SMTP id d11mr1521212qkg.266.1503416820580;
        Tue, 22 Aug 2017 08:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416820; cv=none;
        d=google.com; s=arc-20160816;
        b=fqVXMThVU+Y7faOm9xRpM5GcN9ruRzzHBEzHRh+b1M+pefy091viMTAhm9zQi8xn/M
         MrS9/39rHLlG4dicj9A/Lw1nnVx/bsDAklNJNKTIW/x2Nu5y1R0xgV22sJSQPYpatbxD
         nU7Q1rBUB6zHHtJlCV2qFdj0AtNY4Mr7djNBAMsAJdmwnBofBycmAvXm26YlKwg/KOvA
         Jr93D0NsVEFSgEA2nnRUv7ZVK1QoFbTVY6zOTGjJDYHOfONPEbrLBufsTVWyHweT/izK
         dxWwx2dKdQR+WRKo8a4IvELRQFl20lwbZnFYAeXTkrBk/YCaxmT2O31hLL968a3L17AY
         JqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=sZxHIQ0uWucKo+x7Wygy7dwH0CR+l8l/OL+PUZTpbcs=;
        b=theaPDa1RZ5a7zfYOXjdwvmT1CUZ4vmjvwZqnoY5K28DszKeMiDNMIEKt4DrZF9xC6
         syKNtDCW62pbbmvAFNQhacI92JLZcrEQQtybhGXMd07B0pCdI0LjXknNsBUZfE3IqYZo
         xh+6/FkU8JHzDCzABJ1J6jTzxX2l+NSPYxiwkAzPDLP9JbCatnswxFBq9bu8qETjSuFh
         MGa2Cy0W01bVuf4HcpFBQ2HhFlpdpgp68xIGwgvxm1ZBZYDgbmX7v/e7bSdMytQjOZiF
         q7V5nauWGeM6QPj9Ay4gZCoo5h0z4WZyhMh3GGUDv15i1aui9PB7uqxzzELnwsQP7nV/
         M30Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c21si14269407qka.450.2017.08.22.08.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBOM-0007TS-6m
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:46:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnq-0006Vh-KE
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAno-0003F5-Vn
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:14 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAno-0003E6-OL; Tue, 22 Aug 2017 11:09:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnn-0004m0-Pn; Tue, 22 Aug 2017 16:09:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:58 +0100
Message-Id: <1503414539-28762-20-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 19/20] target/arm: Move regime_is_secure() to
 target/arm/internals.h
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
X-TUID: jEP8gF0MOXrF

Move the regime_is_secure() utility function to internals.h;
we are going to want to call it from translate.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 26 ++++++++++++++++++++++++++
 target/arm/helper.c    | 26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index bb06946..eb171b1 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -478,4 +478,30 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
+/* Return true if this address translation regime is secure */
+static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_S12NSE0:
+    case ARMMMUIdx_S12NSE1:
+    case ARMMMUIdx_S1NSE0:
+    case ARMMMUIdx_S1NSE1:
+    case ARMMMUIdx_S1E2:
+    case ARMMMUIdx_S2NS:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MNegPri:
+    case ARMMMUIdx_MUser:
+        return false;
+    case ARMMMUIdx_S1E3:
+    case ARMMMUIdx_S1SE0:
+    case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSNegPri:
+    case ARMMMUIdx_MSUser:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 67b3874..b1ae73c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7060,32 +7060,6 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_S12NSE0:
-    case ARMMMUIdx_S12NSE1:
-    case ARMMMUIdx_S1NSE0:
-    case ARMMMUIdx_S1NSE1:
-    case ARMMMUIdx_S1E2:
-    case ARMMMUIdx_S2NS:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MNegPri:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_S1E3:
-    case ARMMMUIdx_S1SE0:
-    case ARMMMUIdx_S1SE1:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSNegPri:
-    case ARMMMUIdx_MSUser:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint32_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
-- 
2.7.4


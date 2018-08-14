Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4029895wru;
        Tue, 14 Aug 2018 05:43:24 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxqpBJ0dBsOWJ79bXku53DF39Hj/yquGv7KKJJQD3ED5f0VaP0LYaWtdaUNCvkEM70l93Le
X-Received: by 2002:a37:2118:: with SMTP id h24-v6mr19431951qkh.263.1534250604581;
        Tue, 14 Aug 2018 05:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250604; cv=none;
        d=google.com; s=arc-20160816;
        b=WhvG5We6dZQN4JlXxGaxnTFDUFXgBuQ7VyRoOZFNneJjm5iWEUeRvh9jPv6n/qggby
         uxN+tAa29R+yf2zK36breLUh3/ayTO3j4XrO7cnWA5keWlXmiU0jlnvO3/bxQinnYfON
         EzcZPzGZuaN7dLeDXWpOMVJ6BXvjuynlThhnzMXIyXen9SOBFGRqscdRy5ISXP5ev4CI
         /a7UGBN6iQn38bFDm53KImOV4QdEiFGh8Il7En+eeyaB1Qg+tRMy/FlVMLJlGrzpktk5
         hj7KRXO8/xJOXZ2KbUxKRgnTC1GtG/3WL28jEnbidXlptEF0B4iyVriq5h6M1KaOehWV
         jf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8ZI0FDZ3MVZpPGsbmhp+g+t31/LOIEMncGMYyabNAYM=;
        b=aXXX378+1gq7I0MjQm1CapB4436KZ3IAQdxgGznNNOO+MF33/A2dVXodOkBVNuVFTs
         af2G4uVD3GWAbrg/mhLwdrBX3tCtlM2Mt3/fy/W1FsNuCgLA+LD8xWGZjLYbCrKKS0hI
         91an4pokSTqvErND41zbjoQPxpro9fq2rrG4Np0KC1g8h7w+r7HHxrGjX1/4Ln75qVpL
         hvWQ/dZ2WzbfHyzRhz2YVjw8YjRQN/StYoNQ9UuEXi1rfJV2bkpLCJK/taN74OSpDURU
         uzsVUcpfIB68aUCkOBFFkrnCsrOviFGVgw4tOBapwpRB5bTt445qmIsxZMLZ5OFFiA5a
         fQDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 30-v6si135484qvp.53.2018.08.14.05.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfU-0005Xw-1o
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfG-0005Ui-Of
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfF-0002Gj-Rk
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:10 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfF-0002F2-KJ; Tue, 14 Aug 2018 08:43:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfE-0006r7-Hd; Tue, 14 Aug 2018 13:43:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:52 +0100
Message-Id: <20180814124254.5229-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/10] target/arm: Permit accesses to ELR_Hyp
 from Hyp mode via MSR/MRS (banked)
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
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+EeoKUYGHZ0

The MSR (banked) and MRS (banked) instructions allow accesses to ELR_Hyp
from either Monitor or Hyp mode. Our translate time check
was overly strict and only permitted access from Monitor mode.

The runtime check wo do in msr_mrs_banked_exc_checks() had the
correct code in it, but never got there because of the earlier
"currmode == tgtmode" check. Special case ELR_Hyp.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 22 +++++++++++-----------
 target/arm/translate.c | 10 +++++++---
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index d550978b5b9..952b8d122b7 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -611,6 +611,14 @@ static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
      */
     int curmode = env->uncached_cpsr & CPSR_M;
 
+    if (regno == 17) {
+        /* ELR_Hyp: a special case because access from tgtmode is OK */
+        if (curmode != ARM_CPU_MODE_HYP && curmode != ARM_CPU_MODE_MON) {
+            goto undef;
+        }
+        return;
+    }
+
     if (curmode == tgtmode) {
         goto undef;
     }
@@ -638,17 +646,9 @@ static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
     }
 
     if (tgtmode == ARM_CPU_MODE_HYP) {
-        switch (regno) {
-        case 17: /* ELR_Hyp */
-            if (curmode != ARM_CPU_MODE_HYP && curmode != ARM_CPU_MODE_MON) {
-                goto undef;
-            }
-            break;
-        default:
-            if (curmode != ARM_CPU_MODE_MON) {
-                goto undef;
-            }
-            break;
+        /* SPSR_Hyp, r13_hyp: accessible from Monitor mode only */
+        if (curmode != ARM_CPU_MODE_MON) {
+            goto undef;
         }
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f845da7c638..3f5751d4826 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4506,10 +4506,14 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
         }
         break;
     case ARM_CPU_MODE_HYP:
-        /* Note that we can forbid accesses from EL2 here because they
-         * must be from Hyp mode itself
+        /*
+         * SPSR_hyp and r13_hyp can only be accessed from Monitor mode
+         * (and so we can forbid accesses from EL2 or below). elr_hyp
+         * can be accessed also from Hyp mode, so forbid accesses from
+         * EL0 or EL1.
          */
-        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 3) {
+        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 2 ||
+            (s->current_el < 3 && *regno != 17)) {
             goto undef;
         }
         break;
-- 
2.18.0


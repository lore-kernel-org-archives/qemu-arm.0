Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6729409wru;
        Tue, 24 Jul 2018 05:00:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdng+380tvMHzyKuJ1TBbaypLX4TAheFcsMZSMHYe742rqz7NTywr79JiB29d37ve3dWHQk
X-Received: by 2002:aed:24b0:: with SMTP id t45-v6mr15943129qtc.86.1532433644293;
        Tue, 24 Jul 2018 05:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532433644; cv=none;
        d=google.com; s=arc-20160816;
        b=p1/Se/N3gTn5EE/v7NuVtyRw+mMA0ixUe1ndsFMPzmCu6OmHtOR/QvIEiOSUy3vK7W
         RPAa8i22mtVRFc+SDO5aoC/nxDM3izymQ1Sfrs/nwdIWnybcQrnq4CtDwELrdqHdbpIo
         dyZE3CMqMfQb+Er3Rnhz/9u5t4mE/Po+eKy2nuJO1Bq14gvKZDPo/T/ahi4jc08fI52u
         cXQFN4P4LdcLbOzHdWleWnXtvLC/nMRhT1MjT5zpO+RXamPG3w1En4N4EaCd1xWcdvsN
         r0UEaauhFnp5o8RoAXz1AofQFtWkag3HG9acmBI6zO+CILRvTxXlD0+sWJwARKZKkJMZ
         fl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=FZMPRIiV48xqOC5EKZNnqpBysG51R8gx/TfgU6ogPVc=;
        b=uvqV7spUQ5bYNN6YJxKxe5pmHfOPcTtEdJe2ok6GNOGkuGSs5wNik8Y3QgocrZlymk
         iqgxUWE5SUrTW+Hh6jXMa2la3Se+BTllFVNqt4YyzLIa7YBdb6CYmylyohmM2WGjXfoq
         cQtiumpUiYlSf/5gKn8LAQWJ09UgygG+8+eIJpdpnuctADXLqBg/q5D2kXUzCXNyFd87
         Ew4cxiww6lI8sQHI2s6OoybeaVg3x2SZsHvkthDeH92BvIhXRL1Xi2Uq09GNOA0u/sLf
         yldH36FMM2T1hu6S8zBqZWRYYUSE7n0ihXutjdSKYT/zuHilyH+3KLh4pqNCRNf3yxV+
         rB4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t68-v6si658524qkc.395.2018.07.24.05.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:00:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhvzf-0008Tt-PP
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:00:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyx-0008CF-G4
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 08:00:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyw-000394-PZ
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 07:59:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhvyu-00034o-7G; Tue, 24 Jul 2018 07:59:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhvyr-0008PD-5Z; Tue, 24 Jul 2018 12:59:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 12:59:47 +0100
Message-Id: <20180724115950.17316-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724115950.17316-1-peter.maydell@linaro.org>
References: <20180724115950.17316-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/5] target/arm: Honour HCR_EL2.TGE and
 MDCR_EL2.TDE in debug register access checks
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
X-TUID: G0TwKTREbR8v

Some debug registers can be trapped via MDCR_EL2 bits TDRA, TDOSA,
and TDA, which we implement in the functions access_tdra(),
access_tdosa() and access_tda(). If MDCR_EL2.TDE or HCR_EL2.TGE
are 1, the TDRA, TDOSA and TDA bits should behave as if they were 1.
Implement this by having the access functions check MDCR_EL2.TDE
and HCR_EL2.TGE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22d812240af..e2930e99388 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -444,9 +444,11 @@ static CPAccessResult access_tdosa(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     int el = arm_current_el(env);
+    bool mdcr_el2_tdosa = (env->cp15.mdcr_el2 & MDCR_TDOSA) ||
+        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+        (env->cp15.hcr_el2 & HCR_TGE);
 
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDOSA)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdosa && !arm_is_secure_below_el3(env)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDOSA)) {
@@ -462,9 +464,11 @@ static CPAccessResult access_tdra(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
+    bool mdcr_el2_tdra = (env->cp15.mdcr_el2 & MDCR_TDRA) ||
+        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+        (env->cp15.hcr_el2 & HCR_TGE);
 
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDRA)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tdra && !arm_is_secure_below_el3(env)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
@@ -480,9 +484,11 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
                                   bool isread)
 {
     int el = arm_current_el(env);
+    bool mdcr_el2_tda = (env->cp15.mdcr_el2 & MDCR_TDA) ||
+        (env->cp15.mdcr_el2 & MDCR_TDE) ||
+        (env->cp15.hcr_el2 & HCR_TGE);
 
-    if (el < 2 && (env->cp15.mdcr_el2 & MDCR_TDA)
-        && !arm_is_secure_below_el3(env)) {
+    if (el < 2 && mdcr_el2_tda && !arm_is_secure_below_el3(env)) {
         return CP_ACCESS_TRAP_EL2;
     }
     if (el < 3 && (env->cp15.mdcr_el3 & MDCR_TDA)) {
-- 
2.17.1


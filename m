Received: by 10.25.44.15 with SMTP id s15csp1868942lfs;
        Thu, 27 Jul 2017 03:59:33 -0700 (PDT)
X-Received: by 10.55.183.197 with SMTP id h188mr5270293qkf.206.1501153173668;
        Thu, 27 Jul 2017 03:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501153173; cv=none;
        d=google.com; s=arc-20160816;
        b=Qn8H1Q8KmCt5LA0nGnpm3BTZlCciZT2dgySZpFGa1FAMsFGAXc9anm4hfH0TVkUgdt
         RqWQNovgH9yd44biw/hQDu/6LdpvRx5NpKH6qLrmh3TQAIdJVTdjX9kBFvBdM/M0vPMe
         E1NVKF1oIdKD758jgTp60UP96/YRyZ0a2tReR5G07I3dnGJ5fN+SbXUHFfyiAYB44Y8V
         CqsV9KEnQfj7sHSxlTfDcIF63KIxdNfwWVoALkpcK0qsKMN13FHMRn4ad0gl5OeG4eu7
         CqtI5radE4lK/yRRjxN6MgY7kRdymMfbkTeK4yqrop5gjr6BjFt6gBVQb+GSqpm2h0kW
         og4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=VYkTck1B6RSvtTY+92obNsXIkM/EqnfVZoNwI/Eaxyo=;
        b=DHFYy/E4gZdE2oo6cI9oDD94YupwOzdR/uemovEwdqNcdn/QEJ3ltbj6gwne+9UzUm
         4eGQLvET53nS5e2Duah3TGzq4IJO+qWxq9owB80XECUnAAvFF2inLXizU7Ul9j0LRBQL
         2k/KitYZ/Uvk31SBh/Fy7FkeAopQo+qX2PY2dfkLIctJLm1Pfwo2C7ghJF/HfZZx7JMX
         LR9zHXtI0d4GRj6SLzBfTM66c8EyE/2ml95Edfi0FQYwYzInv4ssRMydViUGKnKgJKSX
         b44aGmk3+a5Rbdvng6bw5jsGRyX7k6m5b8GLaeZFErebajKVwAZAI0kSTGTjf1U/4/OR
         ygOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4si15353191qks.546.2017.07.27.03.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 03:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dagVv-0006Ia-0f
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 06:59:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVk-0006HP-Jb
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVj-0000Bc-UT
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dagVj-0008P0-OF; Thu, 27 Jul 2017 06:59:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dagVd-0003ml-Pd; Thu, 27 Jul 2017 11:59:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 11:59:10 +0100
Message-Id: <1501153150-19984-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10 5/5] target/arm: Migrate MPU_RNR
 register state for M profile cores
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
X-TUID: tobMWU2r/EgA

The PMSAv7 region number register is migrated for R profile
cores using the cpreg scheme, but M profile doesn't use
cpregs, and so we weren't migrating the MPU_RNR register state
at all. Fix that by adding a migration subsection for the
M profile case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 93c1a78..1f66da4 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -171,6 +171,29 @@ static const VMStateDescription vmstate_pmsav7 = {
     }
 };
 
+static bool pmsav7_rnr_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    /* For R profile cores pmsav7.rnr is migrated via the cpreg
+     * "RGNR" definition in helper.h. For M profile we have to
+     * migrate it separately.
+     */
+    return arm_feature(env, ARM_FEATURE_M);
+}
+
+static const VMStateDescription vmstate_pmsav7_rnr = {
+    .name = "cpu/pmsav7-rnr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pmsav7_rnr_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.pmsav7.rnr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
                     VMStateField *field)
 {
@@ -377,6 +400,11 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_iwmmxt,
         &vmstate_m,
         &vmstate_thumb2ee,
+        /* pmsav7_rnr must come before pmsav7 so that we have the
+         * region number before we test it in the VMSTATE_VALIDATE
+         * in vmstate_pmsav7.
+         */
+        &vmstate_pmsav7_rnr,
         &vmstate_pmsav7,
         NULL
     }
-- 
2.7.4


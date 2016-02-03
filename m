Received: by 10.25.159.19 with SMTP id i19csp1227414lfe;
        Wed, 3 Feb 2016 05:39:23 -0800 (PST)
X-Received: by 10.140.91.109 with SMTP id y100mr1573256qgd.42.1454506763020;
        Wed, 03 Feb 2016 05:39:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y47si369385qgy.120.2016.02.03.05.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxeU-0004YZ-GN
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:39:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxdt-0003p2-CM
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:38:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxds-0003SM-Jo
	for qemu-devel@nongnu.org; Wed, 03 Feb 2016 08:38:45 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxds-0003SC-Ck; Wed, 03 Feb 2016 08:38:44 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-000360-Dl; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:41 +0000
Message-Id: <1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 7/7] target-arm: Enable EL3 for Cortex-A53 and
	Cortex-A57
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jrg/QwZNz3S7

Enable EL3 support for our Cortex-A53 and Cortex-A57 CPU models.
We have enough implemented now to be able to run real world code
at least to some extent (I can boot ARM Trusted Firmware to the
point where it pulls in OP-TEE and then falls over because it
doesn't have a UEFI image it can chain to).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index cc177bb..073677b5 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -109,6 +109,7 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
     cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
@@ -161,6 +162,7 @@ static void aarch64_a53_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
     cpu->midr = 0x410fd034;
     cpu->revidr = 0x00000000;
-- 
1.9.1


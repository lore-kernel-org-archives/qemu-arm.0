Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF79C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMQI-0002qW-I2; Sat, 26 Sep 2026 03:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQ7-0002iA-Li
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:06 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMQ5-0000TZ-EP
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:02:03 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3428f70d7e7so534055eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406120; x=1791010920; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NmcVVZs2AdigVyOz3zzkAE1Rb9Ccoa5Uym0KVLWzyjs=;
 b=Sc+VFs0O+IHAcmF8sSe1YDeL03pE2xAZb1EpQjIhTML5YyD4EiAgkrLLSiiJjR9v4m
 z5aIMnydvEwS2BuOFFnZZoEb8vRELVqkgrzfeCitIV5GMWsjbVZgl7tqPFnX7cplghYO
 rwfCJ97c5v5tC8UAE991qt2IEDHh47mctKaPg0KatgAJelOlIv+aasiJvIyyvp157YEo
 QDzceWFyc4EN6WP4vsePiB0Y69SMfLIuq5YGu6SHEKFgkQJLr7dbquIE5BWBdeq49Juc
 Uu6BduLNZWs5mFBmTHYexW5JgwS1k8BbjXKhYMV3CrtGqFlc2RWFkC93WdYYcH1J/d/w
 uqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406120; x=1791010920;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NmcVVZs2AdigVyOz3zzkAE1Rb9Ccoa5Uym0KVLWzyjs=;
 b=sakQhD6F90cOGTBMZVltz8xtudZWV3aemXAMaIlvVksqoaHvqqATQKu9wdOhPxJC6+
 7G3QeEDK2IkYlzZEyKm2pADkRgX8OtFPAMXSTVjHiZ4+5x94Zm0ncdq2X+w167bG0EH2
 UltgvIu4LAWNMrvnfHjTPVrlbZgF29xBezeNLfhS+j9zJ96mcRzl5GNKRegNQ+VwAQHx
 Kfc3TV1B0XNler7kvWFAHQ7jDO/Fig3edf4zeKGckdEC/htxjpQO+VkaGP7VLQ4L9gJq
 kZsyej0Fg5ahGqQs2xa5fthIcUvpZHOGYyP9IxWz+SxjgJyK0eCsgvIKn86GqgA7jid4
 jnqw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw7TRxxt2G4PNejGeFcNhevCIzX+2QrfFVj9l7UktwGHtgiXzCQsi1uhIrlbDYW5Vl31VXD6MwDAA==@nongnu.org
X-Gm-Message-State: AFuF++mTAV/9hu9zb/G1lkWh8ZBUeyL56VFp/rhpzOV2FZBdirmFM8Dg
 YDaxsWcOdmF8VAyWKBA8dRk10EBdDWI5mb2QVjfJwh2T3oyaUvyQvifY
X-Gm-Gg: AYBFou3hOCiGQ7A13FXndn+TVVnYhVCI9o373xzRrpJnCsB0TzN55tdh4DWk03SX7VR
 dUbU6liFMEH5k1Yuwn/Y9OlXvub9aQpzGDFHTOOiCClvMMYJU9k+7BwWq8yk7k7Y/tlP7evzhl/
 wJqDGMiyVIfHDW6yrBxmA7bgAjvrvAgMQ/wrXkJmz9J1VJunhffe22KswvGaD/B092KIPBUL4aH
 kE2lvcVTRvyfqXaOrU2tnu00EEMqkdv1KMzU6wcx/pINwSbkEdiJ+fFqXkMfckUxPpWAfFSBhBV
 lGFM9yRQWYmh6nm8D+1obEw53D894suvu/gKDVCKjNwhL17xRChnZSBuan+wP1lxkjvYEcnkNU1
 7JRSOCZjNu9npgfEj9AqyX0/gnZ5vLw/MzCPPhSlmPaLQzRx0fwJbeAou5+6bZGIjZOE1bujPPk
 cMUheqFveGn7SdFxjuksuQjD3Cv412u2ejdo52pNJFknTrlMyWydcihgozfi3FBwYn9kOY2TSAF
 i5UOLrAB06hsEQJ46qvhgQVsn1P1QWWGz6kCYA63AU=
X-Received: by 2002:a05:693c:2589:b0:341:9040:8ec6 with SMTP id
 5a478bee46e88-34273850d16mr1979752eec.41.1790406119966; 
 Sat, 26 Sep 2026 00:01:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:59 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 14/55] target/arm: move kvm_arm_set_cpreg_mig_tolerances to
 kvm.c
Date: Sat, 26 Sep 2026 15:00:13 +0800
Message-ID: <20260926070057.1234-15-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Keep KVM kernel register-list migration policy with the other KVM
cpreg helpers.

- Move kvm_arm_set_cpreg_mig_tolerances from cpu64.c to kvm.c
- Declare it in kvm_arm.h
- Add a kvm-stub.c assert stub

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/cpu64.c    | 38 --------------------------------------
 target/arm/kvm-stub.c |  5 +++++
 target/arm/kvm.c      | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h  |  9 +++++++++
 4 files changed, 50 insertions(+), 38 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4e8c4725308..1e64eb54cdc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -754,44 +754,6 @@ static void aarch64_a53_initfn(Object *obj)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-#if defined(CONFIG_KVM)
-static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
-{
-    /*
-     * Registers that may be in the incoming stream and not exposed
-     * on the destination
-     */
-
-    /*
-     * TCR_EL1 was erroneously unconditionnally exposed before linux v6.13.
-     * See commit 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace
-     * when disabled for guests")
-     */
-    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 2, 0, 3),
-                                     0, 0, ToleranceNotOnBothEnds);
-    /*
-     * PIRE0_EL1 and PIR_EL1 were erroneously unconditionnally exposed
-     * before linux v6.13. See commit a68cddbe47ef ("KVM: arm64: Hide
-     * S1PIE registers from userspace when disabled for guests")
-     */
-    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 2),
-                                     0, 0, ToleranceNotOnBothEnds);
-    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
-                                     0, 0, ToleranceNotOnBothEnds);
-
-    /*
-     * KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
-     * from v6.15 onwards. Backward migration from a >= v6.15 to an older
-     * kernel would fail without cpreg migration tolerance definition.
-     * If the register is present on source but not on destination, make
-     * sure it has its reset value, ie. 0, meaning no service is exposed
-     * to the guest.
-     */
-    arm_register_cpreg_mig_tolerance(cpu, KVM_REG_ARM_FW_FEAT_BMAP_REG(3),
-                                     UINT64_MAX, 0, ToleranceOnlySrcTestValue);
-}
-#endif
-
 void aarch64_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 88cbe8d85c4..ecbd4f9aca1 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -50,6 +50,11 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     g_assert_not_reached();
 }
 
+void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
 void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
     g_assert_not_reached();
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ed99be7fd80..2525b9d429c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -505,6 +505,42 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features = arm_host_cpu_features.features;
 }
 
+void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
+{
+    /*
+     * Registers that may be in the incoming stream and not exposed
+     * on the destination
+     */
+
+    /*
+     * TCR_EL1 was erroneously unconditionnally exposed before linux v6.13.
+     * See commit 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace
+     * when disabled for guests")
+     */
+    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 2, 0, 3),
+                                     0, 0, ToleranceNotOnBothEnds);
+    /*
+     * PIRE0_EL1 and PIR_EL1 were erroneously unconditionnally exposed
+     * before linux v6.13. See commit a68cddbe47ef ("KVM: arm64: Hide
+     * S1PIE registers from userspace when disabled for guests")
+     */
+    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 2),
+                                     0, 0, ToleranceNotOnBothEnds);
+    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
+                                     0, 0, ToleranceNotOnBothEnds);
+
+    /*
+     * KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
+     * from v6.15 onwards. Backward migration from a >= v6.15 to an older
+     * kernel would fail without cpreg migration tolerance definition.
+     * If the register is present on source but not on destination, make
+     * sure it has its reset value, ie. 0, meaning no service is exposed
+     * to the guest.
+     */
+    arm_register_cpreg_mig_tolerance(cpu, KVM_REG_ARM_FW_FEAT_BMAP_REG(3),
+                                     UINT64_MAX, 0, ToleranceOnlySrcTestValue);
+}
+
 static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
 {
     return !ARM_CPU(obj)->kvm_adjvtime;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index e7c40fb003e..014b7bad65b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -133,6 +133,15 @@ void kvm_arm_destroy_scratch_host_vcpu(int *fdarray);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
+/**
+ * kvm_arm_set_cpreg_mig_tolerances:
+ * @cpu: ARMCPU to register the tolerances on
+ *
+ * Register KVM cpreg migration tolerances for kernel register-list
+ * differences (hidden sysregs and newer FW feature bitmaps).
+ */
+void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu);
+
 /**
  * kvm_arm_add_vcpu_properties:
  * @cpu: The CPU object to add the properties to
-- 
2.52.0.windows.1



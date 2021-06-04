Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w11sm7439148wrv.89.2021.06.04.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F2F7F1FFDC;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 68/99] target/arm: move kvm post init initialization to kvm cpu accel
Date: Fri,  4 Jun 2021 16:52:41 +0100
Message-Id: <20210604155312.15902-69-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i5+cj2KV/rqI

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c         | 4 ----
 target/arm/kvm/kvm-cpu.c | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0ecbfa060c..003e58d8ee 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -778,10 +778,6 @@ void arm_cpu_post_init(Object *obj)
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
 
-    if (kvm_enabled()) {
-        kvm_arm_add_vcpu_properties(obj);
-    }
-
 #ifndef CONFIG_USER_ONLY
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
         cpu_isar_feature(aa64_mte, cpu)) {
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
index 5fbb127e61..9f65010c0c 100644
--- a/target/arm/kvm/kvm-cpu.c
+++ b/target/arm/kvm/kvm-cpu.c
@@ -63,6 +63,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
      * the same interface as non-KVM CPUs.
      */
     qdev_init_gpio_in(DEVICE(cs), arm_cpu_kvm_set_irq, 4);
+    kvm_arm_add_vcpu_properties(OBJECT(cs));
 }
 
 static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
-- 
2.20.1

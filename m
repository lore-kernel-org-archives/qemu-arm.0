Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d66sm22544086wma.21.2015.12.08.10.32.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2015 10:32:58 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id B5CC03E0662;
	Tue,  8 Dec 2015 18:32:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	christoffer.dall@linaro.org,
	zhichao.huang@linaro.org
Cc: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	marc.zyngier@arm.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v10 3/6] target-arm: kvm - support for single step
Date: Tue,  8 Dec 2015 18:32:30 +0000
Message-Id: <1449599553-24713-4-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449599553-24713-1-git-send-email-alex.bennee@linaro.org>
References: <1449599553-24713-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: amdWE/7eO/kq

This adds support for single-step. There isn't much to do on the QEMU
side as after we set-up the request for single step via the debug ioctl
it is all handled within the kernel.

The actual setting of the KVM_GUESTDBG_SINGLESTEP flag is already in the
common code. If the kernel doesn't support guest debug the ioctl will
simply error.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - convert to using HSR_EC
v3
  - use internals.h definitions
v10
  - fix arm32 build
  - remove redundent flag setting (done in main kvm.c)
  - more words on fail case
---
 target-arm/kvm64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 3b3929d..5f96cde 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -534,6 +534,13 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     kvm_cpu_synchronize_state(cs);
 
     switch (hsr_ec) {
+    case EC_SOFTWARESTEP:
+        if (cs->singlestep_enabled) {
+            return true;
+        } else {
+            error_report("Came out of SINGLE STEP when not enabled");
+        }
+        break;
     case EC_AA64_BKPT:
         if (kvm_find_sw_breakpoint(cs, env->pc)) {
             return true;
-- 
2.6.3

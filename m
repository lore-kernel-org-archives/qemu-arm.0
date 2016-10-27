Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id hb5sm9051580wjc.5.2016.10.27.08.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Oct 2016 08:19:59 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 985C73E04DB;
	Thu, 27 Oct 2016 16:11:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com,
	mark.burton@greensocs.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v5 32/33] target-arm: helpers which may affect global state need the BQL
Date: Thu, 27 Oct 2016 16:10:29 +0100
Message-Id: <20161027151030.20863-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161027151030.20863-1-alex.bennee@linaro.org>
References: <20161027151030.20863-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OnRGN/tPcZQw

As the arm_call_el_change_hook may affect global state (for example with
updating the global GIC state) we need to assert/take the BQL.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/helper.c    | 6 ++++++
 target-arm/op_helper.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index cb83ee2..ad93926 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6662,6 +6662,12 @@ void arm_cpu_do_interrupt(CPUState *cs)
         arm_cpu_do_interrupt_aarch32(cs);
     }
 
+    /* Hooks may change global state so BQL should be held, also the
+     * BQL needs to be held for any modification of
+     * cs->interrupt_request.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 4f0c754..41beabc 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -487,7 +487,9 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
      */
     env->regs[15] &= (env->thumb ? ~1 : ~3);
 
+    qemu_mutex_lock_iothread();
     arm_call_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
 }
 
 /* Access to user mode registers from privileged modes.  */
@@ -1013,7 +1015,9 @@ void HELPER(exception_return)(CPUARMState *env)
         env->pc = env->elr_el[cur_el];
     }
 
+    qemu_mutex_lock_iothread();
     arm_call_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
 
     return;
 
-- 
2.10.1

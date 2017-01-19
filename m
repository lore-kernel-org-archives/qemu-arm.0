Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d64sm54553544wmh.3.2017.01.19.09.12.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2017 09:12:42 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4B79C3E2A3F;
	Thu, 19 Jan 2017 17:05:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com
Cc: mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	bamvor.zhangjian@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v7 21/27] target-arm: helpers which may affect global state need the BQL
Date: Thu, 19 Jan 2017 17:05:01 +0000
Message-Id: <20170119170507.16185-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170119170507.16185-1-alex.bennee@linaro.org>
References: <20170119170507.16185-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WFgOAcmQjPrB

As the arm_call_el_change_hook may affect global state (for example with
updating the global GIC state) we need to assert/take the BQL.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/helper.c    | 6 ++++++
 target/arm/op_helper.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b3875c7c6e..87809562b9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6672,6 +6672,12 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 1348789760..e1a883c595 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -488,7 +488,9 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
      */
     env->regs[15] &= (env->thumb ? ~1 : ~3);
 
+    qemu_mutex_lock_iothread();
     arm_call_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
 }
 
 /* Access to user mode registers from privileged modes.  */
@@ -1020,7 +1022,9 @@ void HELPER(exception_return)(CPUARMState *env)
                       cur_el, new_el, env->pc);
     }
 
+    qemu_mutex_lock_iothread();
     arm_call_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
 
     return;
 
-- 
2.11.0

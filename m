Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1032023wrq;
        Wed, 23 Oct 2019 08:21:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxb0ZDt6nrsMDsm8xY3Qx7IvX4PIaC0kGbQFKDYgksWZTOhCyKaj3WiduJSBPBCwSc32Dvq
X-Received: by 2002:ac8:29a5:: with SMTP id 34mr9707198qts.56.1571844097507;
        Wed, 23 Oct 2019 08:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844097; cv=none;
        d=google.com; s=arc-20160816;
        b=az+ZpC9PPMr/tRtmdaZ6jzaTwwHQ1JIBdDBbZKpBDyBEhFF6IDwnghyMlNLSRmqxhi
         3m3jE8pxd0PETXsFItqVvOxNIamWaR7AVSLRVFkd9JGlmcxmTnUdZxVhrdAkOGpiVA4l
         2zJ+OErP8NtWDSIO3Zz4mbbHKUfSAZ6SBfD4V4EvAqhU3KLieHne4vyXAzvy2HbV/PFA
         6XtsuQ/8PETE0orghQYrDnVqTfYHznSjwFpQDla3h3TI1CcTZBYql8X+HFGwZzZ6rYd9
         xatOxcGYngjtKTtzj4ElbCIO8BOl/hPnYwtSVKft3kEws6dmeDJm+1vSdEcDBwNdsjtU
         rn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SiowrkM/1iAKWki4Ii968zkKQyJbLh4wL5XVrtx3P7c=;
        b=MAhvvbYZwNdVAFDnh+G98N8bjK3d2HKafWBHTFy+dlLyLo3I6jA0lWKu1VO/xxtj57
         CgeupRBnufUKEhxIkKeL/uOWoltIBMvSe4DEs/vy8VcwK26xJqoocTQ3AmJik4AVrIOm
         vHmDlI5wI/iF9mMkD5OZqmAYze4OhYX7WOz7JtalN5SGNu8BD+Xr3FIQKbnKS+/SUGcp
         /H0uKYcaj5LeP0kw1lczD15ClNdNAqUWHK4dKzigBUgksYBkDw6Kp03fHvvVe3jSUfCI
         f1GMCXsJoA5CY0j3Q35LixzxUqtRYVmfsZnC5SQZ8hRnFfnY+ZSPY71rnAgGVcQdEAho
         6C0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I4xTugx1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si6140504qka.301.2019.10.23.08.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I4xTugx1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIS8-0006Qc-8R
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-00087W-Sk
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8q-0001EM-Un
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:32790)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8q-00018a-NG
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 11:01:40 -0400
Received: by mail-qk1-x744.google.com with SMTP id 71so16169344qkl.0
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiowrkM/1iAKWki4Ii968zkKQyJbLh4wL5XVrtx3P7c=;
 b=I4xTugx1trsGqtBfJ4WWtytCUbLwO2vvQUbXv97YcuwFCCUuVBTT162f7pqymGAhxK
 OBMFGvz+nSdYGkpWmGqskrFvQABHhvo4pt1lo2wLq++ocQ9m5s5JnMAWRYPcxEkWy9EB
 grmabn6a74KmPXOgtMhxI7FwiSLbEPMAwsYYgv9piX5VuTLkF8q1e3f5ll1P3SY7A1AI
 QhzWk9VYpCX4Rstq7PdmyzMW6OIZTb9IpSUzmjVqrog6bw5+ckZ/KNuTUQPTD4edfZeB
 jqH+ZRss6zo0AWJx+RagjvrznCwRhzGCZWEDoc9L5YLlZL8h9roS5Gki3Q7TkhIUCR4A
 0mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiowrkM/1iAKWki4Ii968zkKQyJbLh4wL5XVrtx3P7c=;
 b=FnpOFZGCdgfqzXu0F0rn9qXNotbrodloTf3l4ojTlKGIlvvomToMsQMpEG+HEMwiHM
 8qlqq/JLgIcg0zZJp6VxZdjUfwuh/oe7RKQS1ozZG/73BdEINwxxa6KZBHWP3n+C31Rk
 Bnl52XG1O6/XXsn5YuWl2e1HgJFHlz0tP4MHV4I0JR2A2NkgleDs4asDiuRkptk4D+hn
 3ZNwh6S1izjLq9oirbw8MO/6+jYMom3XrM6jxAJ/2lw3LUSRNeblxU5u6fA0gGd6+oG1
 dlzZMytu+Jyht9LUlCdT/NhCSnzcY1/t3f1gaeUwYDv6Bd+AwIgRbSDDMaK22NB22Py3
 696Q==
X-Gm-Message-State: APjAAAWAgpYFIgyPANvAw3hJ31IcivByBYgck9Ge+70dbIrF/828sYGM
 bgBxZf6gT4MDzU4p53cQ3FF8JpzThDA=
X-Received: by 2002:a37:4dca:: with SMTP id a193mr8753818qkb.292.1571842884203; 
 Wed, 23 Oct 2019 08:01:24 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 16/24] target/arm: Rebuild hflags at EL changes
Date: Wed, 23 Oct 2019 11:00:49 -0400
Message-Id: <20191023150057.25731-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPpDVbJ5ufws

Begin setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c    | 1 +
 target/arm/cpu.c        | 1 +
 target/arm/helper-a64.c | 3 +++
 target/arm/helper.c     | 2 ++
 target/arm/machine.c    | 1 +
 target/arm/op_helper.c  | 1 +
 6 files changed, 9 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f1ab81b917..530c843303 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9984,6 +9984,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     aarch64_sve_narrow_vq(env, vq);
                 }
                 env->vfp.zcr_el[1] = vq - 1;
+                arm_rebuild_hflags(env);
                 ret = vq * 16;
             }
             return ret;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 13813fb213..ab3e1a0361 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -406,6 +406,7 @@ static void arm_cpu_reset(CPUState *s)
 
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
+    arm_rebuild_hflags(env);
 }
 
 bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bca80bdc38..b4cd680fc4 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1025,6 +1025,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         } else {
             env->regs[15] = new_pc & ~0x3;
         }
+        helper_rebuild_hflags_a32(env, new_el);
         qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
                       "AArch32 EL%d PC 0x%" PRIx32 "\n",
                       cur_el, new_el, env->regs[15]);
@@ -1036,10 +1037,12 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         }
         aarch64_restore_sp(env, new_el);
         env->pc = new_pc;
+        helper_rebuild_hflags_a64(env, new_el);
         qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
                       "AArch64 EL%d PC 0x%" PRIx64 "\n",
                       cur_el, new_el, env->pc);
     }
+
     /*
      * Note that cur_el can never be 0.  If new_el is 0, then
      * el0_a64 is return_to_aa64, else el0_a64 is ignored.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b2d701cf00..aae7b62458 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7998,6 +7998,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->regs[14] = env->regs[15] + offset;
     }
     env->regs[15] = newpc;
+    arm_rebuild_hflags(env);
 }
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
@@ -8345,6 +8346,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
+    helper_rebuild_hflags_a64(env, new_el);
 
     env->pc = addr;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5c36707a7c..eb28b2381b 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -756,6 +756,7 @@ static int cpu_post_load(void *opaque, int version_id)
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
+    arm_rebuild_hflags(&cpu->env);
 
     return 0;
 }
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 0fd4bd0238..ccc2cecb46 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -404,6 +404,7 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
      * state. Do the masking now.
      */
     env->regs[15] &= (env->thumb ? ~1 : ~3);
+    arm_rebuild_hflags(env);
 
     qemu_mutex_lock_iothread();
     arm_call_el_change_hook(env_archcpu(env));
-- 
2.17.1


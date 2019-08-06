Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4553142wrv;
        Mon, 5 Aug 2019 17:05:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvsw11mVzisSCE82Oga7QXWypkhmCRCxl+lJw/T1VCQTG0bbfI68slJt+cBguT2o7wgFix
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr534261ejr.310.1565049926240;
        Mon, 05 Aug 2019 17:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565049926; cv=none;
        d=google.com; s=arc-20160816;
        b=j/pyH5CBJGTdOCDUdz0HFs5LZrO9iRG/hlb5q2Mi6dYGxxyDZMe6RLAkYrnIuKdc/c
         A31qnk9IPrxSe274vSD5QRqzQS5NwPcQUGbI43dG+larkr1tAeBqpNWHiYQ1stMn1URI
         KsFrJUiU2HtLaw3xLOPjF0IjrYhoWAZNlf6Dboc9QFMVSYVRE6reA7PT7ttSCB1NyFeB
         w2869eUTBQlQt9CEpJoAgi1Fan9NCLnanajnpdbxRaNmVrOTfOt82y+UdCR/P2aReoxm
         cizJZtLfuiVZ8OLDf+CXjaRFBmYIyBGJ+R7BJWAetSSQfabmPlqnxigEaFY0GA1fQSqn
         vXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=SmJ5Hdt1lX0FZop+Dbb79p/hOPSk025oMFCmVoyvZFY=;
        b=dZbtrtDJiSi5uhN/dpJUdsPUv+9ngxB8aq05cJF2S5XASDAjuGeJDxdtxOqB5moTIK
         9aa/5S/kk8MKuGovTu2lcsytZyLWd8+ZZI6BfJInU1WBkFIXR4HShQS850NWRV8M//uA
         i8jQVJ4P75rF67stxGjAc3Kv7CkPUZjytg8eQu5Eqzjq9zgJz6bvMRGQxMTH53yOfJgC
         jad2uH2xT52x+wZaNstdRcYXVkYsMv3Z8wpnvPK6TO4fIY9yPy7kLfecvj5/NR/5Fp5D
         z8609dDppw4RxsKSL4M8OsrZR9DQL2AQmY52ql0m84L2eutGsLfEpoITaIZp/0Nxy51N
         /txg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BbzBdBjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si26813292eja.29.2019.08.05.17.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 17:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BbzBdBjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1humyj-00041p-BV
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 20:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33655)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1humyZ-0003wm-9V
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1humyX-0008FX-P5
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:15 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37062)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1humyX-0008EN-I6
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:13 -0400
Received: by mail-pf1-x443.google.com with SMTP id 19so40446100pfa.4
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 17:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmJ5Hdt1lX0FZop+Dbb79p/hOPSk025oMFCmVoyvZFY=;
 b=BbzBdBjO4n7vzM3PZK0IUtakO9usQ8aWxkJOng54QjZaoyKvGUxqLNz2I3WV9UmbjI
 hpyXFOWOd/vQ0bVh8UndVF8I3SIEvsDEPzPKfwjVJfA1DHVemQj4IFGlQj14cGSytR25
 VLFHE3QHCWbU1QOBMSuLkvQlBQ8GY3WGRKwkCv6LqHyEhh+OVOFkJBspyfRtRVzrbopB
 PeOqPc4SMbO7KvIZk8DqkjqEsMsGjyHRqp/x48pS8ojuicgztFRDdvCyLQbFC8kXOLR+
 hbIglURis2KyhoAxgiiPVxefhxymNsTa2pqgRcJwwwEseqRFbVteXMIHvSpJt/jQRolL
 nn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmJ5Hdt1lX0FZop+Dbb79p/hOPSk025oMFCmVoyvZFY=;
 b=HYoaFZvuc7gaf0ZCgFUxL7Ua3zI7qV8MkC35T0/44jRXynDW/6bbvkfoesVNnoulk8
 FQ6XY6p/89KGiSbX5GUhlGB7xN60uzsWvsu8fkUACOwQLmjp+vP/JfxeH6zXt3sXhB6L
 QHqGGIX+7VXpfTMwqeLL5vGRFUupkzqXfsmdRZnInIntp1G3fu5pZ1LTFjjZSDlQUH82
 nou8kM2rLHRa0UP3+27saYPitWzP5OEs/OEsApIyJU06E6eG26wkGWdrdrZEjf0sg8MG
 0tqMMTM27CU8RIusHzK1dESps7vTXvzORJiaiu4jZUb5VSc4gTLPpBtAYm4qj0IbBXjG
 d1BA==
X-Gm-Message-State: APjAAAW0CK2WSA8AAgX51Rf8AM8P8NHDDPw4SNoKHz4g2W3CU0ke2Qf8
 PeIF5Nm7bJWqT7FlhZ9f68ha8+yPUgY=
X-Received: by 2002:a17:90a:21ac:: with SMTP id
 q41mr295306pjc.31.1565049912549; 
 Mon, 05 Aug 2019 17:05:12 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm92149782pfo.138.2019.08.05.17.05.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 17:05:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:05:05 -0700
Message-Id: <20190806000506.10833-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806000506.10833-1-richard.henderson@linaro.org>
References: <20190806000506.10833-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v4 2/3] target/arm: Rebuild hflags at EL changes
 and MSR writes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T7fujdd3qkQp

Now setting, but not relying upon, env->hflags.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fixed partial conversion to assignment to env->hflags.
---
 linux-user/syscall.c       |  1 +
 target/arm/cpu.c           |  1 +
 target/arm/helper-a64.c    |  3 +++
 target/arm/helper.c        |  2 ++
 target/arm/machine.c       |  1 +
 target/arm/op_helper.c     |  1 +
 target/arm/translate-a64.c |  6 +++++-
 target/arm/translate.c     | 14 ++++++++++++--
 8 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8367cb138d..55d5fdadf3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9979,6 +9979,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     aarch64_sve_narrow_vq(env, vq);
                 }
                 env->vfp.zcr_el[1] = vq - 1;
+                arm_rebuild_hflags(env);
                 ret = vq * 16;
             }
             return ret;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ec2ab95dbe..995f4ea355 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -406,6 +406,7 @@ static void arm_cpu_reset(CPUState *s)
 
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
+    arm_rebuild_hflags(env);
 }
 
 bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 060699b901..3bc364ebb7 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1025,6 +1025,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         } else {
             env->regs[15] = new_pc & ~0x3;
         }
+        env->hflags = rebuild_hflags_a32(env, new_el);
         qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
                       "AArch32 EL%d PC 0x%" PRIx32 "\n",
                       cur_el, new_el, env->regs[15]);
@@ -1036,10 +1037,12 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
         }
         aarch64_restore_sp(env, new_el);
         env->pc = new_pc;
+        env->hflags = rebuild_hflags_a64(env, new_el);
         qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
                       "AArch64 EL%d PC 0x%" PRIx64 "\n",
                       cur_el, new_el, env->pc);
     }
+
     /*
      * Note that cur_el can never be 0.  If new_el is 0, then
      * el0_a64 is return_to_aa64, else el0_a64 is ignored.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 43b7c41f11..9b07350cfe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7905,6 +7905,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->regs[14] = env->regs[15] + offset;
     }
     env->regs[15] = newpc;
+    env->hflags = rebuild_hflags_a32(env, arm_current_el(env));
 }
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
@@ -8251,6 +8252,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
+    env->hflags = rebuild_hflags_a64(env, new_el);
     aarch64_restore_sp(env, new_el);
 
     env->pc = addr;
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 3fd319a309..838d154a3c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -758,6 +758,7 @@ static int cpu_post_load(void *opaque, int version_id)
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
+    arm_rebuild_hflags(&cpu->env);
 
     return 0;
 }
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 5e1625a1c8..6e6613b8a8 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -420,6 +420,7 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
      */
     env->regs[15] &= (env->thumb ? ~1 : ~3);
 
+    env->hflags = rebuild_hflags_a32(env, arm_current_el(env));
     qemu_mutex_lock_iothread();
     arm_call_el_change_hook(env_archcpu(env));
     qemu_mutex_unlock_iothread();
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d3231477a2..f8b5debf82 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1799,11 +1799,15 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         /* I/O operations must end the TB here (whether read or write) */
         gen_io_end();
         s->base.is_jmp = DISAS_UPDATE;
-    } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+    }
+    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
         /* We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
+        TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
+        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
+        tcg_temp_free_i32(tcg_el);
         s->base.is_jmp = DISAS_UPDATE;
     }
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21..cd14bbebf1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7164,6 +7164,8 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
     ri = get_arm_cp_reginfo(s->cp_regs,
             ENCODE_CP_REG(cpnum, is64, s->ns, crn, crm, opc1, opc2));
     if (ri) {
+        bool need_exit_tb;
+
         /* Check access permissions */
         if (!cp_access_ok(s->current_el, ri, isread)) {
             return 1;
@@ -7336,15 +7338,23 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             }
         }
 
+        need_exit_tb = false;
         if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
             /* I/O operations must end the TB here (whether read or write) */
             gen_io_end();
-            gen_lookup_tb(s);
-        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
+            need_exit_tb = true;
+        }
+        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
             /* We default to ending the TB on a coprocessor register write,
              * but allow this to be suppressed by the register definition
              * (usually only necessary to work around guest bugs).
              */
+            TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
+            gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
+            tcg_temp_free_i32(tcg_el);
+            need_exit_tb = true;
+        }
+        if (need_exit_tb) {
             gen_lookup_tb(s);
         }
 
-- 
2.17.1


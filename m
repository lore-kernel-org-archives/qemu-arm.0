Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1237368wrm;
        Fri, 18 Oct 2019 10:59:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1ogDoFhSUVAUXODXUBZN4u8p9X6RdwfdDb40NVsAeq2DOv4Kmi69o4NacPauRsup2CQ3y
X-Received: by 2002:a37:e503:: with SMTP id e3mr10185118qkg.491.1571421571631;
        Fri, 18 Oct 2019 10:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421571; cv=none;
        d=google.com; s=arc-20160816;
        b=Uv9QaDeKXxtyMTCiGF19XKD/2BU8hU2V/+fyX7EH79OwinvTF5s21JDO9wLFfXGioz
         OocfRa2sUrnIF+0r34bU6/VdDxc/CkyTlkijwJWbNReyg4JzG+fde+Ix31OqvPbBHbbz
         WrveFhg6Ndje4X5IAFyxh1trBaYgsKS42efyHWQr1h6aC+IEbCoRhtaGhfcTqgPM6T07
         4jSTnR3vnfdEMR8XhWYmRqVDeg1uvvpPmcGdpUO5L1Qy01mxUkktzeJ1uuvWhggV+cmu
         fbdy1kARddWDgRrskoEOeYwZUxI/xZmH27wYrSHLHOoCBJIsH+MzrMnNm1dlh0hALSV4
         s44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lq3/b5OXsgTHbcSMFLOFHm3tF7v/Y0wC/PpxwPnfroE=;
        b=HgixDm1m2j68hJ7x59AtBxbUIuhKujHGmRaHwZjrEbzdci98ziEpHxtJaqEIxrlb07
         miPFE0UROvlhBGCd0+8dRzVBM7aJsSNNjpzVJeMQFqvx0kDQgJnmAJ+tqNOwjh8usRd8
         G2JVGQw0313E/3UQoGjgjiZpZtDHaUIc0dDX6DvrsCtFd80PHkbS9DAeoAAti1tUeg/a
         quKcWHZWo5rFfHjpWm7Hci8I4u4n3wdSL3nT/ygmKYkVZq6PbiRaiDAFapED7D0hFqfQ
         NQwua0yFga5hnB8HwF1vBwEIQ9L1g5SHR717gZjlU6N0b3ZrIQEEm4LdN41/+KdQ9XJj
         WlkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ztf1GH7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d27si6318583qta.195.2019.10.18.10.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ztf1GH7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWXC-0006DZ-HI
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ6-0006mb-Gp
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ4-0005ao-AE
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:56 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ4-0005YN-29
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:54 -0400
Received: by mail-pl1-x644.google.com with SMTP id u20so3195818plq.4
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lq3/b5OXsgTHbcSMFLOFHm3tF7v/Y0wC/PpxwPnfroE=;
 b=Ztf1GH7vLBOL9JAXoGunShOuW+rmYPuT+itDVi/fgcZYc1IVT/CioSw8lE9pv62VAj
 MpSkhhaC9sCqPdjbJusVJ2gGVrw+dYMumbXRruQxZb97iq7RIxGPu4Tey77Nbbem8zSU
 8qft4U6YOK+9Pdl4BBaf2yynhtK+C7BbUnkAlKRkte4vMr7IivZI0zcKjik2ooyQ3Vbl
 vL2tEYdudcV5g8117sxScBzPc8C5gArrqhK0K07/9WTNOVUbmT+LA6yYMu6xMTDkrq1P
 ICtMSGGxdcxrgaNf3MKzx1WN50fF0dN2iGlM+Wq3K/Ig+hHPQ6M1wWqzbWX2yevNtouK
 vcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lq3/b5OXsgTHbcSMFLOFHm3tF7v/Y0wC/PpxwPnfroE=;
 b=W9+QS2Dbc5t7nh/4o2FuUiVwg+thfNHHXOYIEx0E7kDDKF23IHkFrozgZHFLn6MY9t
 Q7Ll98DhZ9wqZWt7WvwwkAAABfQnjdkZC8VGj2/j6Ep78xG5rdnXaTmmGF4x0leDLehs
 9D6zp5efdXuIfsNyQLYIodLJpUrxW/8kCTjWxyeKtNywTKoh652Xv0FEx+6grhjuMVU6
 Jos+W15GH/JC4R/vbS+487fnuIGF+bq/LGCp+8OUKDrrbz7D4nOPhAom++KeyfQwNMEb
 iyptmEcZrx2Rp+uCNj6SLOvgj19+47zdqgj+uUrRnr+F1N2bZX4phmrekWhLNsoMSGmo
 JU7Q==
X-Gm-Message-State: APjAAAWmrBtkkY8TQt5AGSejHayIPpvUj5JGJJ9jtd/wH73PkEYgJnu9
 XZyOpu4MX0XL0bYqYs9XN8g3qL3nf0Y=
X-Received: by 2002:a17:902:7b95:: with SMTP id
 w21mr11476538pll.322.1571420692242; 
 Fri, 18 Oct 2019 10:44:52 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 16/22] target/arm: Rebuild hflags at EL changes
Date: Fri, 18 Oct 2019 10:44:25 -0700
Message-Id: <20191018174431.1784-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: tepMSAq2RwNB

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
index e2af3c1494..ebefd05140 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9982,6 +9982,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


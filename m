Received: by 10.223.161.27 with SMTP id o27csp850070wro;
        Tue, 24 Oct 2017 10:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R9gnMYaaG3LUnc7VlfOeXMbyc9XCb5D7/489gr/dQ0n89x/dFBuveyu9me5UUgttWkApWR
X-Received: by 10.37.106.70 with SMTP id f67mr10924864ybc.332.1508867980928;
        Tue, 24 Oct 2017 10:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508867980; cv=none;
        d=google.com; s=arc-20160816;
        b=uKh8mwTucNCRi3BVpvvhurz7VZLDA+Vea0ZufQvVa8SAjfWZjWRi8FB3HVKgluOC08
         X5O+hlmDqEdcCBSQ23XWSrKRtnrvZnvC7z7Za8kT4qCk4uU8Glq3LnZkOncVfilmEU07
         VHmJMY34Hm1eVLRQTNu8LC6e8f4QxvWZHl1BWg3TeC6FSKqOVmk8Vme2THDdSaGGeRaX
         1vrIoJAB5/+iqasplpA6iKM0g4SDOR2yRAuQq4VuHujn3R4W8rT5ctjn09t+r11mrfoN
         oPu6u1CgfyEBiLyRS8dRn6wi3yTDZDaJ6KlffrNw9+janw+YD/FZQepQrKKDJ58R4gL4
         C9eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=oN4pa9JBb9u+eX9DrYNXuotTNJxTOCkuv0johH1e7Pc=;
        b=EFZOLa3xRl9xd2Xkawq8BGB7kpYASO5r+y8+v0jNEatW+ZMFDkdu4NUFfc98gs1IWn
         HfNSno3T7pS2+obcuAiVXuA2X30VvzdMBZ1tdhyi4uH4et+YEUycA9rlers/SvpYrozN
         ZqwEIa2qKbqnsV2mZ3cCVRd1KQhKGqnXMHid6ATeCWRoFdvqU0jhUzES5WFbY0k4ZpA5
         qDrh/Z3QWsZvV7ckdhdv3+c1shHx6loRQ6n/5Es2M3pPqf9nCy8BM5d8YSI6uYdl5l54
         G1P/eIVja2HTZnbPQ5AbRCL3G8ifwxFM5emXqYpPym3YqdX7Oqa042WVX5t9mRWHn1XJ
         1Xxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si21852ywe.51.2017.10.24.10.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 10:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e73UK-0000YQ-DH
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 13:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e73U9-0000Wf-Mz
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:59:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e73U7-00054t-4O
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 13:59:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e73U6-00054e-S1; Tue, 24 Oct 2017 13:59:27 -0400
Received: from [10.0.0.56] (c-24-130-70-9.hsd1.ca.comcast.net [24.130.70.9])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 82685218AC;
	Tue, 24 Oct 2017 17:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82685218AC
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 24 Oct 2017 10:59:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: peter.maydell@linaro.org
Message-ID: <alpine.DEB.2.10.1710241055160.574@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3] fix WFI/WFE length in syndrome register
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
Cc: qemu-arm@nongnu.org, sstabellini@kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FvJvSpFw9PWD

WFI/E are often, but not always, 4 bytes long. When they are, we need to
set ARM_EL_IL_SHIFT in the syndrome register.

Pass the instruction length to HELPER(wfi), use it to decrement pc
appropriately and to pass an is_16bit flag to syn_wfx, which sets
ARM_EL_IL_SHIFT if needed.

Set dc->insn in both arm_tr_translate_insn and thumb_tr_translate_insn.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

---

Changes in v3:
- free tmp
- wfi on aarch64 is always 4 bytes
- set dc->insn in arm_tr_translate_insn and thumb_tr_translate_insn
- also check for dc->thumb in arm_tr_tb_stop

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2cf6f74..439d228 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -48,7 +48,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
 DEF_HELPER_1(setend, void, env)
-DEF_HELPER_1(wfi, void, env)
+DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5a5af38..6792df2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -428,9 +428,10 @@ static inline uint32_t syn_breakpoint(int same_el)
         | ARM_EL_IL | 0x22;
 }
 
-static inline uint32_t syn_wfx(int cv, int cond, int ti)
+static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
 {
     return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
+           (is_16bit ? 0 : (1 << ARM_EL_IL_SHIFT)) |
            (cv << 24) | (cond << 20) | ti;
 }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 045c312..30039c5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -463,7 +463,7 @@ static inline int check_wfx_trap(CPUARMState *env, bool is_wfe)
     return 0;
 }
 
-void HELPER(wfi)(CPUARMState *env)
+void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
 {
     CPUState *cs = CPU(arm_env_get_cpu(env));
     int target_el = check_wfx_trap(env, false);
@@ -476,8 +476,9 @@ void HELPER(wfi)(CPUARMState *env)
     }
 
     if (target_el) {
-        env->pc -= 4;
-        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
+        env->pc -= insn_len;
+        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, insn_len == 2),
+                        target_el);
     }
 
     cs->exception_index = EXCP_HLT;
diff --git a/target/arm/psci.c b/target/arm/psci.c
index fc34b26..eb7b88e 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -189,7 +189,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
         } else {
             env->regs[0] = 0;
         }
-        helper_wfi(env);
+        helper_wfi(env, 4);
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a39b9d3..aba9436 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11380,17 +11380,21 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
+        {
+            TCGv_i32 tmp = tcg_const_i32(4);
             /* This is a special case because we don't want to just halt the CPU
              * if trying to debug across a WFI.
              */
             gen_a64_set_pc_im(dc->pc);
-            gen_helper_wfi(cpu_env);
+            gen_helper_wfi(cpu_env, tmp);
+            tcg_temp_free_i32(tmp);
             /* The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(0);
             break;
         }
+        }
     }
 
     /* Functions above can change dc->pc, so re-align db->pc_next */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4da1a4c..0a7b67c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12124,6 +12124,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
+    dc->insn = insn;
     dc->pc += 4;
     disas_arm_insn(dc, insn);
 
@@ -12191,6 +12192,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
+    dc->insn = insn;
     is_16bit = thumb_insn_is_16bit(dc, insn);
     dc->pc += 2;
     if (!is_16bit) {
@@ -12325,12 +12327,17 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* nothing more to generate */
             break;
         case DISAS_WFI:
-            gen_helper_wfi(cpu_env);
+        {
+            TCGv_i32 tmp = tcg_const_i32((dc->thumb &&
+                                          !(dc->insn & (1U << 31))) ? 2 : 4);
+            gen_helper_wfi(cpu_env, tmp);
+            tcg_temp_free_i32(tmp);
             /* The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(0);
             break;
+        }
         case DISAS_WFE:
             gen_helper_wfe(cpu_env);
             break;

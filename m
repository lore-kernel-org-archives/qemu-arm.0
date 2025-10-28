Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07F1CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcgJ-0005MN-2K; Tue, 28 Oct 2025 01:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcgC-0005Gt-0V
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:55:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcg8-000500-Jf
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:55:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4270a3464caso2671474f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630929; x=1762235729; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNN09nikcz59h/+aSBzafHW4AR3HBWle7qRThHgLUuc=;
 b=E9dKO2XnglyrQWSfW4FdUAdS6SVOvGpUeuQVONowExJ7aDI/Cl4VeCRfJeCpVJI7ik
 z0veohY4SZzbAX+pYOkbgS9VfclxZY7ZWgJ7TQtVInWIlnq7NMgnugwjCwrpePKK//wh
 YCcEw9Ca3sPTIgxC+1CBcDAeDyJYOWxC7CbwsR/sX/cGhYVSn3hcK7zm9zwCkV63rhAi
 X65Hb/b4ARmyPJCNJYtQ8uzW0tFAYd3Fy+DnOl1HbamrsSfFpircMjhsmpoX/IEMetBh
 C8MLsIg2vjiOLJnCmM1pAYFeuq6VlT8M6c6snAPGOEXBgLVgHeCRaMeo47nXPIfpZoSH
 FINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630929; x=1762235729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNN09nikcz59h/+aSBzafHW4AR3HBWle7qRThHgLUuc=;
 b=dZZg45uLh0C60crHqfEgYHVzqUDVX+bXFKhZsA7mpjRYnb8XGXlvMvlMkHImLSJ00Y
 iv5myBDdpjYKP832rnHXKCEauriuIaaUipLqeMpeHGGyw+wLJtOnja65DeqkLL4DGcYI
 Gw6t5ejnPagWNt6K1AikmJ13/Q3bSLyW5/P3RGLch8+csUw1OW1Mi8MQX1eOnmeWr8wM
 ahYKINzaLugjp56TvCkdmlIWoeHRLnB6m0jgB/h7okff8wD3FEAFy62LqzdMmI9WHnZ2
 QxoKyvMDyy0lJEZqPWEx8XkL60VS9pUaF6rUJzLV1UeShl5rdGzM+5g9EuoDP2Sr9sVB
 f+Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl3FOPvWClfLiQeTchHa9dE9TZwPM+dytqM+0y1txb2jOuMz5PVtLxaG3tzL3U0mGPov/q2q0t7g==@nongnu.org
X-Gm-Message-State: AOJu0Yz9ZcYqYIOAPBOrvDH4aU856I/VbJLhF+S99uCmWUI9aZu5J7+H
 fjY0JRt3tTqUDdRRghxMkprqXVk/1T3nmK/sQPRKlPNAKs9o0YoT+BfBJOrX7ztnibw=
X-Gm-Gg: ASbGncuLVpCB59oXbrRdLhtnoPpvCuBiNLT/VIz8pFC8qcYFLyrh3K/1iCDgiyiqgBg
 E3WVVBj+lDwu4J//W6QFob3zuNgR+u8bZZdyJ5IunpOHAZLZ1G1wKrUtqAe5XusbUprSGCaTe/q
 fJqteAs6yZEalMjN8UZQOZdLkr04dWnCnhZI/CG0z/Oe9xPJkxUDcDTEBjrCwAt9c0BC6VFVdBi
 3P3NxdP49Ki/QLykR7ssutD2jpcpkrTSrfJRvnJIQBUFeobO11msEigvXX7BL6Zck8+C774gF9W
 ckEGrppcrMAPA/uT6FYe3rNBuuT8BJpOlo50wfL5TiYOLSu5XjJB4pkMG7E6wNBdRo1A0uEQXo3
 EZ/8aG3+SFXFVUIwJfgB7xH6XBERi6bjSzkBvE6+4+vq3DhIg8V7AmvCNcNCqBFDiiOZIB1hL3h
 qF4AHzCq5Wd2oqKUr3BsmovOfgNMEoGszzbQOgTV2hhWt/3SwcWcV0zK4=
X-Google-Smtp-Source: AGHT+IEZrj/HQuARSscCPMuD6ISRIB/7wuGRHKn024Yyz4w+QemOtbjTLJ+khnZqOKjVAf03tv/cHQ==
X-Received: by 2002:a05:6000:26ce:b0:427:5e6:c0e5 with SMTP id
 ffacd0b85a97d-429a7e75aaamr1632320f8f.39.1761630928856; 
 Mon, 27 Oct 2025 22:55:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7a7csm18287752f8f.8.2025.10.27.22.55.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:55:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 18/59] target/i386/hvf: Factor hvf_handle_vmexit() out
Date: Tue, 28 Oct 2025 06:41:54 +0100
Message-ID: <20251028054238.14949-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Factor hvf_handle_vmexit() out of hvf_arch_vcpu_exec().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 478 +++++++++++++++++++++---------------------
 1 file changed, 244 insertions(+), 234 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 76a58cb0350..28d98659ec2 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -721,6 +721,249 @@ void hvf_simulate_wrmsr(CPUState *cs)
     printf("write msr %llx\n", RCX(cs));*/
 }
 
+static int hvf_handle_vmexit(CPUState *cpu)
+{
+    X86CPU *x86_cpu = env_archcpu(cpu_env(cpu));
+    uint64_t exit_reason = rvmcs(cpu->accel->fd, VMCS_EXIT_REASON);
+    uint64_t exit_qual = rvmcs(cpu->accel->fd, VMCS_EXIT_QUALIFICATION);
+    uint32_t ins_len = (uint32_t)rvmcs(cpu->accel->fd,
+                                       VMCS_EXIT_INSTRUCTION_LENGTH);
+
+    uint64_t idtvec_info = rvmcs(cpu->accel->fd, VMCS_IDT_VECTORING_INFO);
+    int ret = 0;
+
+    hvf_store_events(cpu, ins_len, idtvec_info);
+    rip = rreg(cpu->accel->fd, HV_X86_RIP);
+    env->eflags = rreg(cpu->accel->fd, HV_X86_RFLAGS);
+
+    bql_lock();
+
+    update_apic_tpr(cpu);
+    current_cpu = cpu;
+
+    switch (exit_reason) {
+    case EXIT_REASON_HLT: {
+        macvm_set_rip(cpu, rip + ins_len);
+        if (!(cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD)
+              && (env->eflags & IF_MASK))
+            && !cpu_test_interrupt(cpu, CPU_INTERRUPT_NMI)
+            && !(idtvec_info & VMCS_IDT_VEC_VALID)) {
+            cpu->halted = 1;
+            ret = EXCP_HLT;
+            break;
+        }
+        ret = EXCP_INTERRUPT;
+        break;
+    }
+    case EXIT_REASON_MWAIT: {
+        ret = EXCP_INTERRUPT;
+        break;
+    }
+    /* Need to check if MMIO or unmapped fault */
+    case EXIT_REASON_EPT_FAULT:
+    {
+        hvf_slot *slot;
+        uint64_t gpa = rvmcs(cpu->accel->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
+
+        if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
+            ((exit_qual & EXIT_QUAL_NMIUDTI) != 0)) {
+            vmx_set_nmi_blocking(cpu);
+        }
+
+        slot = hvf_find_overlap_slot(gpa, 1);
+        /* mmio */
+        if (ept_emulation_fault(slot, gpa, exit_qual)) {
+            struct x86_decode decode;
+
+            hvf_load_regs(cpu);
+            decode_instruction(env, &decode);
+            exec_instruction(env, &decode);
+            hvf_store_regs(cpu);
+            break;
+        }
+        break;
+    }
+    case EXIT_REASON_INOUT:
+    {
+        uint32_t in = (exit_qual & 8) != 0;
+        uint32_t size =  (exit_qual & 7) + 1;
+        uint32_t string =  (exit_qual & 16) != 0;
+        uint32_t port =  exit_qual >> 16;
+        /*uint32_t rep = (exit_qual & 0x20) != 0;*/
+        struct x86_decode decode;
+
+        if (!string && in) {
+            uint64_t val = 0;
+
+            hvf_load_regs(cpu);
+            hvf_handle_io(env_cpu(env), port, &val, 0, size, 1);
+            if (size == 1) {
+                AL(env) = val;
+            } else if (size == 2) {
+                AX(env) = val;
+            } else if (size == 4) {
+                RAX(env) = (uint32_t)val;
+            } else {
+                RAX(env) = (uint64_t)val;
+            }
+            env->eip += ins_len;
+            hvf_store_regs(cpu);
+            break;
+        } else if (!string && !in) {
+            RAX(env) = rreg(cpu->accel->fd, HV_X86_RAX);
+            hvf_handle_io(env_cpu(env), port, &RAX(env), 1, size, 1);
+            macvm_set_rip(cpu, rip + ins_len);
+            break;
+        }
+
+        hvf_load_regs(cpu);
+        decode_instruction(env, &decode);
+        assert(ins_len == decode.len);
+        exec_instruction(env, &decode);
+        hvf_store_regs(cpu);
+
+        break;
+    }
+    case EXIT_REASON_CPUID: {
+        uint32_t rax = (uint32_t)rreg(cpu->accel->fd, HV_X86_RAX);
+        uint32_t rbx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RBX);
+        uint32_t rcx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RCX);
+        uint32_t rdx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RDX);
+
+        if (rax == 1) {
+            /* CPUID1.ecx.OSXSAVE needs to know CR4 */
+            env->cr[4] = rvmcs(cpu->accel->fd, VMCS_GUEST_CR4);
+        }
+        hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
+
+        wreg(cpu->accel->fd, HV_X86_RAX, rax);
+        wreg(cpu->accel->fd, HV_X86_RBX, rbx);
+        wreg(cpu->accel->fd, HV_X86_RCX, rcx);
+        wreg(cpu->accel->fd, HV_X86_RDX, rdx);
+
+        macvm_set_rip(cpu, rip + ins_len);
+        break;
+    }
+    case EXIT_REASON_XSETBV: {
+        uint32_t eax = (uint32_t)rreg(cpu->accel->fd, HV_X86_RAX);
+        uint32_t ecx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RCX);
+        uint32_t edx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RDX);
+
+        if (ecx) {
+            macvm_set_rip(cpu, rip + ins_len);
+            break;
+        }
+        env->xcr0 = ((uint64_t)edx << 32) | eax;
+        wreg(cpu->accel->fd, HV_X86_XCR0, env->xcr0 | 1);
+        macvm_set_rip(cpu, rip + ins_len);
+        break;
+    }
+    case EXIT_REASON_INTR_WINDOW:
+        vmx_clear_int_window_exiting(cpu);
+        ret = EXCP_INTERRUPT;
+        break;
+    case EXIT_REASON_NMI_WINDOW:
+        vmx_clear_nmi_window_exiting(cpu);
+        ret = EXCP_INTERRUPT;
+        break;
+    case EXIT_REASON_EXT_INTR:
+        /* force exit and allow io handling */
+        ret = EXCP_INTERRUPT;
+        break;
+    case EXIT_REASON_RDMSR:
+    case EXIT_REASON_WRMSR:
+    {
+        hvf_load_regs(cpu);
+        if (exit_reason == EXIT_REASON_RDMSR) {
+            hvf_simulate_rdmsr(cpu);
+        } else {
+            hvf_simulate_wrmsr(cpu);
+        }
+        env->eip += ins_len;
+        hvf_store_regs(cpu);
+        break;
+    }
+    case EXIT_REASON_CR_ACCESS: {
+        int cr;
+        int reg;
+
+        hvf_load_regs(cpu);
+        cr = exit_qual & 15;
+        reg = (exit_qual >> 8) & 15;
+
+        switch (cr) {
+        case 0x0: {
+            macvm_set_cr0(cpu->accel->fd, RRX(env, reg));
+            break;
+        }
+        case 4: {
+            macvm_set_cr4(cpu->accel->fd, RRX(env, reg));
+            break;
+        }
+        case 8: {
+            if (exit_qual & 0x10) {
+                RRX(env, reg) = cpu_get_apic_tpr(x86_cpu->apic_state);
+            } else {
+                int tpr = RRX(env, reg);
+                cpu_set_apic_tpr(x86_cpu->apic_state, tpr);
+                ret = EXCP_INTERRUPT;
+            }
+            break;
+        }
+        default:
+            error_report("Unrecognized CR %d", cr);
+            abort();
+        }
+        env->eip += ins_len;
+        hvf_store_regs(cpu);
+        break;
+    }
+    case EXIT_REASON_APIC_ACCESS: { /* TODO */
+        struct x86_decode decode;
+
+        hvf_load_regs(cpu);
+        decode_instruction(env, &decode);
+        exec_instruction(env, &decode);
+        hvf_store_regs(cpu);
+        break;
+    }
+    case EXIT_REASON_TPR: {
+        ret = 1;
+        break;
+    }
+    case EXIT_REASON_TASK_SWITCH: {
+        uint64_t vinfo = rvmcs(cpu->accel->fd, VMCS_IDT_VECTORING_INFO);
+        x86_segment_selector sel = {.sel = exit_qual & 0xffff};
+
+        vmx_handle_task_switch(cpu, sel, (exit_qual >> 30) & 0x3,
+                               vinfo & VMCS_INTR_VALID,
+                               vinfo & VECTORING_INFO_VECTOR_MASK,
+                               vinfo & VMCS_INTR_T_MASK);
+        break;
+    }
+    case EXIT_REASON_TRIPLE_FAULT: {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        ret = EXCP_INTERRUPT;
+        break;
+    }
+    case EXIT_REASON_RDPMC:
+        wreg(cpu->accel->fd, HV_X86_RAX, 0);
+        wreg(cpu->accel->fd, HV_X86_RDX, 0);
+        macvm_set_rip(cpu, rip + ins_len);
+        break;
+    case VMX_REASON_VMCALL:
+        env->exception_nr = EXCP0D_GPF;
+        env->exception_injected = 1;
+        env->has_error_code = true;
+        env->error_code = 0;
+        break;
+    default:
+        error_report("%llx: unhandled exit %llx", rip, exit_reason);
+    }
+
+    return ret;
+}
+
 int hvf_arch_vcpu_exec(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -752,240 +995,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         hv_return_t r = hv_vcpu_run_until(cpu->accel->fd, HV_DEADLINE_FOREVER);
         assert_hvf_ok(r);
 
-        /* handle VMEXIT */
-        uint64_t exit_reason = rvmcs(cpu->accel->fd, VMCS_EXIT_REASON);
-        uint64_t exit_qual = rvmcs(cpu->accel->fd, VMCS_EXIT_QUALIFICATION);
-        uint32_t ins_len = (uint32_t)rvmcs(cpu->accel->fd,
-                                           VMCS_EXIT_INSTRUCTION_LENGTH);
-
-        uint64_t idtvec_info = rvmcs(cpu->accel->fd, VMCS_IDT_VECTORING_INFO);
-
-        hvf_store_events(cpu, ins_len, idtvec_info);
-        rip = rreg(cpu->accel->fd, HV_X86_RIP);
-        env->eflags = rreg(cpu->accel->fd, HV_X86_RFLAGS);
-
-        bql_lock();
-
-        update_apic_tpr(cpu);
-        current_cpu = cpu;
-
-        ret = 0;
-        switch (exit_reason) {
-        case EXIT_REASON_HLT: {
-            macvm_set_rip(cpu, rip + ins_len);
-            if (!(cpu_test_interrupt(cpu, CPU_INTERRUPT_HARD) &&
-                (env->eflags & IF_MASK))
-                && !cpu_test_interrupt(cpu, CPU_INTERRUPT_NMI) &&
-                !(idtvec_info & VMCS_IDT_VEC_VALID)) {
-                cpu->halted = 1;
-                ret = EXCP_HLT;
-                break;
-            }
-            ret = EXCP_INTERRUPT;
-            break;
-        }
-        case EXIT_REASON_MWAIT: {
-            ret = EXCP_INTERRUPT;
-            break;
-        }
-        /* Need to check if MMIO or unmapped fault */
-        case EXIT_REASON_EPT_FAULT:
-        {
-            hvf_slot *slot;
-            uint64_t gpa = rvmcs(cpu->accel->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
-
-            if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
-                ((exit_qual & EXIT_QUAL_NMIUDTI) != 0)) {
-                vmx_set_nmi_blocking(cpu);
-            }
-
-            slot = hvf_find_overlap_slot(gpa, 1);
-            /* mmio */
-            if (ept_emulation_fault(slot, gpa, exit_qual)) {
-                struct x86_decode decode;
-
-                hvf_load_regs(cpu);
-                decode_instruction(env, &decode);
-                exec_instruction(env, &decode);
-                hvf_store_regs(cpu);
-                break;
-            }
-            break;
-        }
-        case EXIT_REASON_INOUT:
-        {
-            uint32_t in = (exit_qual & 8) != 0;
-            uint32_t size =  (exit_qual & 7) + 1;
-            uint32_t string =  (exit_qual & 16) != 0;
-            uint32_t port =  exit_qual >> 16;
-            /*uint32_t rep = (exit_qual & 0x20) != 0;*/
-
-            if (!string && in) {
-                uint64_t val = 0;
-                hvf_load_regs(cpu);
-                hvf_handle_io(env_cpu(env), port, &val, 0, size, 1);
-                if (size == 1) {
-                    AL(env) = val;
-                } else if (size == 2) {
-                    AX(env) = val;
-                } else if (size == 4) {
-                    RAX(env) = (uint32_t)val;
-                } else {
-                    RAX(env) = (uint64_t)val;
-                }
-                env->eip += ins_len;
-                hvf_store_regs(cpu);
-                break;
-            } else if (!string && !in) {
-                RAX(env) = rreg(cpu->accel->fd, HV_X86_RAX);
-                hvf_handle_io(env_cpu(env), port, &RAX(env), 1, size, 1);
-                macvm_set_rip(cpu, rip + ins_len);
-                break;
-            }
-            struct x86_decode decode;
-
-            hvf_load_regs(cpu);
-            decode_instruction(env, &decode);
-            assert(ins_len == decode.len);
-            exec_instruction(env, &decode);
-            hvf_store_regs(cpu);
-
-            break;
-        }
-        case EXIT_REASON_CPUID: {
-            uint32_t rax = (uint32_t)rreg(cpu->accel->fd, HV_X86_RAX);
-            uint32_t rbx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RBX);
-            uint32_t rcx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RCX);
-            uint32_t rdx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RDX);
-
-            if (rax == 1) {
-                /* CPUID1.ecx.OSXSAVE needs to know CR4 */
-                env->cr[4] = rvmcs(cpu->accel->fd, VMCS_GUEST_CR4);
-            }
-            hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
-
-            wreg(cpu->accel->fd, HV_X86_RAX, rax);
-            wreg(cpu->accel->fd, HV_X86_RBX, rbx);
-            wreg(cpu->accel->fd, HV_X86_RCX, rcx);
-            wreg(cpu->accel->fd, HV_X86_RDX, rdx);
-
-            macvm_set_rip(cpu, rip + ins_len);
-            break;
-        }
-        case EXIT_REASON_XSETBV: {
-            uint32_t eax = (uint32_t)rreg(cpu->accel->fd, HV_X86_RAX);
-            uint32_t ecx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RCX);
-            uint32_t edx = (uint32_t)rreg(cpu->accel->fd, HV_X86_RDX);
-
-            if (ecx) {
-                macvm_set_rip(cpu, rip + ins_len);
-                break;
-            }
-            env->xcr0 = ((uint64_t)edx << 32) | eax;
-            wreg(cpu->accel->fd, HV_X86_XCR0, env->xcr0 | 1);
-            macvm_set_rip(cpu, rip + ins_len);
-            break;
-        }
-        case EXIT_REASON_INTR_WINDOW:
-            vmx_clear_int_window_exiting(cpu);
-            ret = EXCP_INTERRUPT;
-            break;
-        case EXIT_REASON_NMI_WINDOW:
-            vmx_clear_nmi_window_exiting(cpu);
-            ret = EXCP_INTERRUPT;
-            break;
-        case EXIT_REASON_EXT_INTR:
-            /* force exit and allow io handling */
-            ret = EXCP_INTERRUPT;
-            break;
-        case EXIT_REASON_RDMSR:
-        case EXIT_REASON_WRMSR:
-        {
-            hvf_load_regs(cpu);
-            if (exit_reason == EXIT_REASON_RDMSR) {
-                hvf_simulate_rdmsr(cpu);
-            } else {
-                hvf_simulate_wrmsr(cpu);
-            }
-            env->eip += ins_len;
-            hvf_store_regs(cpu);
-            break;
-        }
-        case EXIT_REASON_CR_ACCESS: {
-            int cr;
-            int reg;
-
-            hvf_load_regs(cpu);
-            cr = exit_qual & 15;
-            reg = (exit_qual >> 8) & 15;
-
-            switch (cr) {
-            case 0x0: {
-                macvm_set_cr0(cpu->accel->fd, RRX(env, reg));
-                break;
-            }
-            case 4: {
-                macvm_set_cr4(cpu->accel->fd, RRX(env, reg));
-                break;
-            }
-            case 8: {
-                if (exit_qual & 0x10) {
-                    RRX(env, reg) = cpu_get_apic_tpr(x86_cpu->apic_state);
-                } else {
-                    int tpr = RRX(env, reg);
-                    cpu_set_apic_tpr(x86_cpu->apic_state, tpr);
-                    ret = EXCP_INTERRUPT;
-                }
-                break;
-            }
-            default:
-                error_report("Unrecognized CR %d", cr);
-                abort();
-            }
-            env->eip += ins_len;
-            hvf_store_regs(cpu);
-            break;
-        }
-        case EXIT_REASON_APIC_ACCESS: { /* TODO */
-            struct x86_decode decode;
-
-            hvf_load_regs(cpu);
-            decode_instruction(env, &decode);
-            exec_instruction(env, &decode);
-            hvf_store_regs(cpu);
-            break;
-        }
-        case EXIT_REASON_TPR: {
-            ret = 1;
-            break;
-        }
-        case EXIT_REASON_TASK_SWITCH: {
-            uint64_t vinfo = rvmcs(cpu->accel->fd, VMCS_IDT_VECTORING_INFO);
-            x86_segment_selector sel = {.sel = exit_qual & 0xffff};
-            vmx_handle_task_switch(cpu, sel, (exit_qual >> 30) & 0x3,
-             vinfo & VMCS_INTR_VALID, vinfo & VECTORING_INFO_VECTOR_MASK, vinfo
-             & VMCS_INTR_T_MASK);
-            break;
-        }
-        case EXIT_REASON_TRIPLE_FAULT: {
-            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-            ret = EXCP_INTERRUPT;
-            break;
-        }
-        case EXIT_REASON_RDPMC:
-            wreg(cpu->accel->fd, HV_X86_RAX, 0);
-            wreg(cpu->accel->fd, HV_X86_RDX, 0);
-            macvm_set_rip(cpu, rip + ins_len);
-            break;
-        case VMX_REASON_VMCALL:
-            env->exception_nr = EXCP0D_GPF;
-            env->exception_injected = 1;
-            env->has_error_code = true;
-            env->error_code = 0;
-            break;
-        default:
-            error_report("%llx: unhandled exit %llx", rip, exit_reason);
-        }
+        ret = hvf_handle_vmexit(cpu);
     } while (ret == 0);
 
     return ret;
-- 
2.51.0



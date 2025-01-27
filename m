Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2378318njk;
        Mon, 27 Jan 2025 03:55:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWtzO0X2MJt0IpG+ZMbkOtUcybwnnr9zDMtd9KQnFf8qNIbL4BcBf4VRFKT1Yz7KGte5MrDek/yVN53g==@linaro.org
X-Google-Smtp-Source: AGHT+IHLey2BwxTzBkyJc3aNfWaOAPiiHxB9zpp6ZhyVU0sfy8nrfMzKLVXgKK8ElmbNj8lr/BJ+
X-Received: by 2002:a05:620a:3942:b0:7b6:efd0:3d1e with SMTP id af79cd13be357-7be63288d37mr6910170785a.53.1737978923826;
        Mon, 27 Jan 2025 03:55:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737978923; cv=none;
        d=google.com; s=arc-20240605;
        b=LhsRT15qG7MeJzAfDRi/2izDRx5J6Zeb/KRE1Pf/brlaM9/+wel9bCEBjEPIjOV9I3
         0oaD4TH8QmrdLc/t7LGqy8M4Z0cmP5UTAqQ1eyo/Fw+hlQffhelBG/VgRXSPv711ysSy
         m8DUqdjiMjcpjlBL9siH+B0SQttX2+9xzfpJaMCRhHHY5tG3jc0aFo6F/lXpDJCsXQHK
         1munQZVrOs/Gc7A2zbjYkd3NNS/Xc7RoTdt+Nk2zP4o6JhCiIIXqY91aSK5HoCX4ziCT
         aWW0jOj/u1xQbiICx1a6g9CB36ZC3PUWwlP1SDyP9zdZILU2ZAUtK/1IzPTkH55loInF
         nuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7sZoopH8al3/3onc9yLxoFWuzvX6JEuGgczZIUbC+S4=;
        fh=UT36gCECAOtEsgOrSReymFda56t2Gj969DHeMwsi3As=;
        b=BzSIfvJ64m0TRMfukOXs1vLfunyBfXX/Rj6Rv89NvFVIq+0B/i5A6Wq8NGryYbZPXw
         VeBNw3IRXU5JKQ20cwUPnx8DMVPc0hmvnabp7jwvw/5RDIxbDBxyAxGRbPOB7VTeH+n0
         tRZ9ko9jHISGCG2dPlRmLNUFtPIXfRUP5wR8EeE/5k0FdsB6ichsObCABVDTR834hS5C
         OIg7IqBr+OHy10Q9Ry7lyeKeMvlI+UKtd5Avcl6Frdx5hB3dFOtBhQZX/agerjyrVJWK
         pHZhiwKFD0CAIkPI1tCEcVzENLex5d32hhqHTUEamEsCsJHBjJVNHS/Wl+3r0fWW01A9
         mttQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abIzd0B6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66ba6c4bsi108526451cf.566.2025.01.27.03.55.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:55:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abIzd0B6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNhO-0006Ld-9J; Mon, 27 Jan 2025 06:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhM-0006Ke-Js
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:36 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNhK-0006p7-Nb
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:54:36 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385e06af753so2311376f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737978873; x=1738583673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sZoopH8al3/3onc9yLxoFWuzvX6JEuGgczZIUbC+S4=;
 b=abIzd0B60RSfWdG/DHBbanvWN1kf9hY0GLO9GakUEkZMWDWL5/9SxvtZa+gVKzN/B7
 02fFc8llIecH4V/cF6v+Cvn77cNMkIIH3dcPJNzh4mpuhYf3tZHrgnzTo+iu0HdteN0u
 1xqpwzJmE9+wDL9Szgu+lsqffmnVx/6fS1XXrwQZqKIz00O0uXYcgPxPgousZmH1uFpo
 LFy9uGdM+q74VeTK470KcyK+egv/NA23KXfLGZ+FzqiGDU18Yk48BQMy9xHYEd3OPINx
 R1BBGYESZaE2VqIUglmvvtEoZ/14S9Xk4EEF2wrs730iAlR9jB9U4guBEkjQcQEXDR5G
 tkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737978873; x=1738583673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sZoopH8al3/3onc9yLxoFWuzvX6JEuGgczZIUbC+S4=;
 b=sWvQAhrm9V2oHgjhDk+O5UMArLG+iA6wLdNZ3GXG/OVPKbzZCjOzy0lQs+mXx5HrVK
 4EDwgy86K6uIpR+1YTk6q7LL35YgKShNABDPc6R12t3Sn4Ec7ocwsxxGSs4nPY9m80ZI
 05V2XZytpWcinaO1VPgaxKyJfE/iLrckqt3+0mZjVjaeXlfvGuVby5njOosaBKuUw7yk
 xN+exkJFFWL2rb1cjUyFE4iJNhSThm39wH3BdpXNI3yJjcMWK0QShoWPNs8bm4blfeTT
 AFzCwn9SDkmA6tt52fOnsYxbGml6051j/IYVyZGFfwAPMSXowQPxRYyxFZWkpzQYFjnm
 8rJw==
X-Gm-Message-State: AOJu0YyVVEzyXociY0qo6xBirVys28NpKons+dfCc9R5NAHkDIDUY+E0
 enai0c496bvQ7nV6irGhhtG42OTYiWhZasCpDlgHHyDKf/6MzxBnSADAJHrp179m+kGEYcEu1gP
 3tkY=
X-Gm-Gg: ASbGncsXnJ0Pcj59CqZ2W17qQV9aEr2TQ685jztuBswLEbMJGWA1jj+jh7guwqyk0GS
 WQdrboOeqILJKr1aA/HV1j4DmawBvAY80K/QRPzWb+R6Ycsoj/lX3NwLbUUH4f0UQcOqFdDMR5+
 p9aOJMKZIhcH4laLZgOpwhvGX+sjdhgS5ZwD2QbPG01WrqVGpmwdwXNoQUsHcAXNB4Mdp3eClFV
 LPA04jhfdHHgbhGVocVDClKQ9qkP+tht+wd0fpBVkmFJgW5sdEh7KaanGDVcM4JJdQM1vNvHJol
 SDtmHEDleGgk8DHYB1m30Qe4lJJ5X7FjRWK9AUE3ojux+198Zv8Vlvg=
X-Received: by 2002:a5d:588f:0:b0:385:e961:6589 with SMTP id
 ffacd0b85a97d-38bf565f8b9mr33866086f8f.20.1737978873298; 
 Mon, 27 Jan 2025 03:54:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bbd93sm10882117f8f.76.2025.01.27.03.54.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:54:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/10] target: Set disassemble_info::endian value for
 little-endian targets
Date: Mon, 27 Jan 2025 12:54:17 +0100
Message-ID: <20250127115426.51355-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127115426.51355-1-philmd@linaro.org>
References: <20250127115426.51355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iMaHo/blsw5l

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for little-endian targets.

Note, there was no disas_set_info() handler registered
for the TriCore target, so we implement one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.c     | 1 +
 target/avr/cpu.c       | 1 +
 target/hexagon/cpu.c   | 1 +
 target/i386/cpu.c      | 1 +
 target/loongarch/cpu.c | 1 +
 target/rx/cpu.c        | 1 +
 target/tricore/cpu.c   | 6 ++++++
 7 files changed, 12 insertions(+)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index da21f99a6ac..acf81fda371 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -85,6 +85,7 @@ static int alpha_cpu_mmu_index(CPUState *cs, bool ifetch)
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = bfd_mach_alpha_ev6;
     info->print_insn = print_insn_alpha;
 }
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5a0e21465e5..2871d30540a 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -102,6 +102,7 @@ static void avr_cpu_reset_hold(Object *obj, ResetType type)
 
 static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = bfd_arch_avr;
     info->print_insn = avr_print_insn;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 238e63bcea4..a9beb9a1757 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -293,6 +293,7 @@ static void hexagon_cpu_reset_hold(Object *obj, ResetType type)
 static void hexagon_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     info->print_insn = print_insn_hexagon;
+    info->endian = BFD_ENDIAN_LITTLE;
 }
 
 static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1b9c11022c4..eecb6f54d9e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8343,6 +8343,7 @@ static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = (env->hflags & HF_CS64_MASK ? bfd_mach_x86_64
                   : env->hflags & HF_CS32_MASK ? bfd_mach_i386_i386
                   : bfd_mach_i386_i8086);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 227870e2856..cb9b9f909f3 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -617,6 +617,7 @@ static void loongarch_cpu_reset_hold(Object *obj, ResetType type)
 
 static void loongarch_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->print_insn = print_insn_loongarch;
 }
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index d237d007023..f283315474c 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -160,6 +160,7 @@ static void rx_cpu_set_irq(void *opaque, int no, int request)
 
 static void rx_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_LITTLE;
     info->mach = bfd_mach_rx;
     info->print_insn = print_insn_rx;
 }
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index eb794674c8d..49c18a0cd92 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -35,6 +35,11 @@ static const gchar *tricore_gdb_arch_name(CPUState *cs)
     return "tricore";
 }
 
+static void tricore_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
+{
+    info->endian = BFD_ENDIAN_LITTLE;
+}
+
 static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
 {
     cpu_env(cs)->PC = value & ~(target_ulong)1;
@@ -201,6 +206,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_num_core_regs = 44;
     cc->gdb_arch_name = tricore_gdb_arch_name;
 
+    cc->disas_set_info = tricore_cpu_disas_set_info;
     cc->dump_state = tricore_cpu_dump_state;
     cc->set_pc = tricore_cpu_set_pc;
     cc->get_pc = tricore_cpu_get_pc;
-- 
2.47.1


Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2230007njb;
        Mon, 10 Feb 2025 13:31:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXdoi6iKlUe9H5NiR63JU6K9ZuIGdN7t78ErAA7qk3Ja0ikOKpbCEgHQywi3B7xvvhkuh9jno/6nrB9sw==@linaro.org
X-Google-Smtp-Source: AGHT+IH2V4Y47nVGgCkxnEnlu5TZByEoV0o1dXF0awsMvPR6+FahsL17hNyaunq58daAmjoj5SsT
X-Received: by 2002:a05:6122:c9d:b0:517:4d53:4272 with SMTP id 71dfb90a1353d-51f2e224c3bmr10307718e0c.7.1739223093259;
        Mon, 10 Feb 2025 13:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739223093; cv=none;
        d=google.com; s=arc-20240605;
        b=IpV4v/mkkpvs6BDbB+wLICWQXiEYfvZhhyHWSthEZlIdFMeSPPcNepDBTi5U3z5kC1
         qgxWVqhIgvv5qb/WrMcdr0hL6LknBzwfW2gHPVmFG0SJrRWUCiRlJjy27kpjkHgwdBte
         Hehh44E3rFuOmnMto0FqtsyD9ynFMBTn7KFkjI/catCpxp2tSikgWjMkOS/TVOCoUKIO
         SNEJh7JZ+ejglP6AwdtpTPziD7reTfsr/NYl10GE303Du5jflun2hVPsVe742KEyf7en
         3FuQlvWVSNTaHMP0B8F21BX+DtmQFn/BdMrpbhl8ME1iVhKxowB8hWyyzzhGlBSMciKg
         jzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GbaUDoQaM/zAo+qrfvJYguOp2M5t31jnNdamnbAQszo=;
        fh=mM1ERsVQwgcKb3yo7TgbYZeCYb5iRr8ycQ/rB4WqrWI=;
        b=KS7ZUFX6MxDc7gdtNvSSoKkG7Y/vb/IN40YZJ+OUAeWx0NAVWDbECGZR8RlQptn3Sd
         umfsepPrOxnhnmjUV2vwnNWWvZiNbwqBkZF5teTA9QrRGyiRUnnYi8u4NIzIGKmOV2bg
         lyI/3mhZjNRIQZWwoE0xSAPiwg+lI53ymSP+etrBdXTo9gdStNQKytY6tVQKLj7DrgEm
         5mDqTfgmzNBl1KU0QL1Kp4fAjjhZTgfSqFChnHqq/yhX8oj9waWEKnjaAPQ5vFUg2IjG
         tDoQbTOhiNRqhiPVFv5NZXnpKunsNWttjTViCPzNm+qyieA02SXVFJx4d1tmu8ZvhEFk
         ta3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e3RqM9it;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f2292edc6si2250983e0c.147.2025.02.10.13.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:31:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e3RqM9it;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thbLd-0003cX-Ap; Mon, 10 Feb 2025 16:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLb-0003bS-Cw
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 16:29:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbLY-000297-EC
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 16:29:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43618283dedso48374565e9.3
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 13:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222978; x=1739827778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbaUDoQaM/zAo+qrfvJYguOp2M5t31jnNdamnbAQszo=;
 b=e3RqM9itkZxTSNVYo3Jy1KP2YnTcCNlp+a2alvfq+VobM1FYUJ+QQEGnD8bBJbCq9C
 fVXi4ZqxKLvLjzp1MX2cYG1DNHdNyosmr1GdvuWA9OpyE7ooEqVj2IzBhnA1d0iRIE7S
 LzTaNlyo8EjlL5xoFUCQQky83nEfxyIKF/OOFoN+XhsyqaK6AfDVI2XaIWPWfHTsCR3d
 urUHW8ZRkPilMG+XcVcSd5XFHOeX052CcqkoKfVqcl4V7Ouhx9ddpsALvAAOxMGXxrTi
 90MuBMapFC0npOIvOG4WAbckV3uf1Hcd1u4OZvPGzSVTUSuuiLaq71edCMCBNHCKCfwR
 quJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222978; x=1739827778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbaUDoQaM/zAo+qrfvJYguOp2M5t31jnNdamnbAQszo=;
 b=E77clRE4VXDv8vg002p9VJlCzYSKh6ChUsdurWx90mFupTktK+yEtshZR4eLQFNpyU
 ofCkphxDPvii1IaqOFzKdosVQZPlD285sRzsZSPbAPUvyi3943qOcOUIThGTot+R4Xes
 Yg4eU5khTwl6OZGR2uQoJ7wtiQ6JKO8NTKf0gu65ycd1b6lWglPkV4QVtAAZHGK03s4c
 k/myoAZLU9i0mKwEtAwKEqxDA0B0R37qqWEosT2JpBWxuSjLMCntimuyxR0kTM6bLdLt
 w2awiMn1zE4F0bW+yb/xLaXQFkcOAhzfPc6BpB+FBOHgYFRUszm6rKd8kJjsaF4XmN/Y
 tY7A==
X-Gm-Message-State: AOJu0YyfJ6+m+4npNqigyVBAuQD+18LO6FYrQ3Vipppdyugl42zOLbns
 JG4G++znqYh8N1Lhd3KTV21BWu7hNdCBB0CLROhRVJcT8pXQK/xaq1cTo7wy0RtzAmCm9bfFJl8
 3fBQ=
X-Gm-Gg: ASbGncsj0kNjfV20PeucblJDSXfmA5Uugo3/sidCBa9N7V2hDUhYwX0IU8LIV0xyYiM
 07wUQMpQZk+YMZ9f4GeVFuxV6kxpbikIJu9Gu5OFeQehQkuQ9n3XSH3nxhFcGjPeDdysj9zZmfX
 UINI+Mwzj76Ba2NQt7PtG81r4+OOLB37CUq6odzU8dFN7LaKHG7jS9+jKgCFHVsfPq6ObJ2yKJ+
 VQ6e0pyA3TLh83aRSs0ZN0pBJRTUKX1D4NksEz603+dJZfjKRedEUz/QxsbAhZ/iflFZgM9Oot3
 W8qP1Jy6zWuEhpBLBkyF9W+uKbE4V3aap25faa4WfsSLB3D3YRp9OUEqYvXwNENx9g==
X-Received: by 2002:a05:600c:1da8:b0:434:a75b:5f59 with SMTP id
 5b1f17b1804b1-43924971286mr122015855e9.3.1739222978557; 
 Mon, 10 Feb 2025 13:29:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394dc1c56asm457605e9.0.2025.02.10.13.29.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 13:29:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/10] target: Set disassemble_info::endian value for
 little-endian targets
Date: Mon, 10 Feb 2025 22:29:21 +0100
Message-ID: <20250210212931.62401-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
References: <20250210212931.62401-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cSV8235uEnl9

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for little-endian targets.

Note, there was no disas_set_info() handler registered
for the TriCore target, so we implement one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index b5dd60d2812..85815c0805d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8497,6 +8497,7 @@ static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
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
index 154906ef5f4..acd5a6e12da 100644
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


Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp862084lfb;
        Sat, 8 Jan 2022 07:10:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzyHGzROtgYMwsnNaVQXYi/IU7rSqfEzgCnJ0CRQ81MK9/EowG6NjhJWTURjogIWTaYvQM
X-Received: by 2002:a05:6402:2885:: with SMTP id eg5mr5609242edb.383.1641654604614;
        Sat, 08 Jan 2022 07:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641654604; cv=none;
        d=google.com; s=arc-20160816;
        b=jJyGuLY2/uwMP+7kJ7YINwja53LmrCkW7DGXczebL7/SM0w5mM5OlPTP8H5EbI8abJ
         I0XVHX3NMK1YT9N21XgLpBFfNEnkRGecdtvfhgvXG5kHhprvxsxiI6JZ1fU+EP5LnBfd
         VluxK2WZA119uUMwi0MEgVG2t/BQZqyCEnYGOEtlgubXqf2qTyzyfYGvdcgEoRU6/EY2
         5NTFpT07iW/mxTKRwj5eiYK2Dy2v5jL5YqyiX0z7iwu9Iu8xfAUrOrN0IhT+R+9W/Hqu
         QOxBT/FPqF1s/REVDqmcn/FZxSBXSa32oR8bw5dleoeMJhsAVAPfujb1b/e6uYyqUpcE
         J2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=hE3KJevvZccQ7HSEWfdoqHBSQoAahbitLCLff7qAK2Y=;
        b=uYEdHY22n3JaHt3lbRpVkRdKu2ALDehqi/5P5hEYYykRXOahnSrxdyxBmsr8HPJCFF
         QDIis6nXHJQFo19NUx16nsFul099+XeoiAz02xo/PP/lEOGXFvX59NSW1nZ4Q7buX4lE
         wijbWGr9H54b+mfUXY/9hoezre8B/8dFiLXHJXRAKWLoxMcZXNMIutNoLTeDEIjSvAFo
         H5a7D8c84zO51LZRKAHmPW21KoYJ4nH+VC3I6fnUBbN9DgJG4f/XdQCvm95QQZ6qSZDi
         rKjIgs+Yoiw000okUiVdUfGiUXTl43Sbus75NHcirMcndvZpqNowmhP5VzX9PFhC7WUA
         SNEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bEfz4QDp;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id ga27si877997ejc.125.2022.01.08.07.10.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Jan 2022 07:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=bEfz4QDp;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFDD160BCB;
	Sat,  8 Jan 2022 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD685C36AEF;
	Sat,  8 Jan 2022 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641654602;
	bh=p9cA6hHTu7BoB3BC5S1lTAOtIKToutjhOTgjSPoxQYs=;
	h=From:To:Cc:Subject:Date:From;
	b=bEfz4QDpGdkrwq2mszFlle0eblBBZ7CsGHABH68QxiaOvuSAB0+zsd7JtVCKuy003
	 oVyZFHBvg9zZZHbXxnWpV8NzyZiv1tY/HMHrRUGjvOdB5y4YWj1inKRzRT7kLftST0
	 n32H1b9V+45XMpFgvrWpYK4TEFcnoIOPgDR50tuQlO39JEPNes4LdJkj4LdaKReOIf
	 CwQh/cYAf8ZFc2MiDVZYUkWozyHLGVS5NRG1k3GD4ktci4fClYm2s/nCngozA3EK1t
	 X7uLvcwPvb7RQHlvwgHdHkp5V2Osw1cAnAVcAieonTHGH59Z7hDIxUXgViM0Xl4Mz8
	 PAsHrrDgiAkyw==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>
Subject: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in 32-bit KVM mode
Date: Sat,  8 Jan 2022 16:09:52 +0100
Message-Id: <20220108150952.1483911-1-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dgIKy1fRa7yA

When running under KVM, we may decide to run the CPU in 32-bit mode, by
setting the 'aarch64=off' CPU option. In this case, we need to switch to
the 32-bit version of the GDB stub too, so that GDB has the correct view
of the CPU state. Without this, GDB debugging does not work at all, and
errors out upon connecting to the target with a mysterious 'g' packet
length error.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennee <alex.bennee@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: refactor existing CPUClass::gdb_... member assignments for the
    32-bit code so we can reuse it for the 64-bit code

 target/arm/cpu.c   | 16 +++++++++++-----
 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c |  3 +++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a211804fd3df..ae8e78fc1472 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2049,6 +2049,15 @@ static const struct TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+void arm_cpu_class_gdb_init(CPUClass *cc)
+{
+    cc->gdb_read_register = arm_cpu_gdb_read_register;
+    cc->gdb_write_register = arm_cpu_gdb_write_register;
+    cc->gdb_num_core_regs = 26;
+    cc->gdb_core_xml_file = "arm-core.xml";
+    cc->gdb_arch_name = arm_gdb_arch_name;
+}
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2061,18 +2070,15 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, arm_cpu_properties);
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
+    arm_cpu_class_gdb_init(cc);
+
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-    cc->gdb_read_register = arm_cpu_gdb_read_register;
-    cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
-    cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e33f37b70ada..208da8e35697 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1064,6 +1064,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
  */
 const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
 
+void arm_cpu_class_gdb_init(CPUClass *cc);
+
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15245a60a8c7..df7667864e11 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -906,6 +906,7 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
 static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    CPUClass *cc = CPU_GET_CLASS(obj);
 
     /* At this time, this property is only allowed if KVM is enabled.  This
      * restriction allows us to avoid fixing up functionality that assumes a
@@ -919,6 +920,8 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
             return;
         }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
+
+        arm_cpu_class_gdb_init(cc)
     } else {
         set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     }
-- 
2.30.2

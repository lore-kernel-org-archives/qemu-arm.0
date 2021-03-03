Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706242lfg;
        Wed, 3 Mar 2021 13:48:11 -0800 (PST)
X-Received: by 2002:a5d:6703:: with SMTP id o3mr657082wru.357.1614808091194;
        Wed, 03 Mar 2021 13:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808091; cv=none;
        d=google.com; s=arc-20160816;
        b=vnwVEsErroih5U9tz+zrXYYfX97MNg2w+QvHjKv/lWjQle2pWzvMAD+4YUpibxJmFX
         yDcOsKUOT1bN+9LTcg9ltw2dL9slCCde9o0SuIfjLRhmjX+uHVExSNR0LbmqCzSvOLhf
         rFtsuw1k9Wmr2V2crjUM4BHasZxyAUqsNdcSxbJ5GbRvGWzT+49ERcXH4Nbm8bmfghr7
         SX6VB9+Pxzw9Wuk/3yzwEJOHjE/VriWRgE6/CAqlTNtS/XoBc83oDDxhePzIRHSduKy3
         iXZDoioLPrdgGPlsjOQCLirhg30DlcOUvftRVzr+NvfgFK58fbbNq7CkQlhzmwgLmffr
         QxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YXKlTeCnjmHxOIuW+5ok+sHuvv9dHK5aHCAXQUqIY0w=;
        b=LjswXpkceHo47Cosc6z2P6N7JDQh2L2WDBzOsZVycc/FqL6VxIqLl3/4NteRTK8D/w
         wgJxgX+jx1Kto0MepGmVRbivypmff/WwugZ4/JxATVVoPXhOHil6FeO9uZRHLIbGeVPN
         hS/qQ5taBddpYTwtWwB1y8Q8fi/4BN1JiTls8qAVnJNmkbLFByxb1CCO/8HUgyE1FoBH
         m57VBQAqwnH8a69dEScZQs3QLy5egs2wjZiG9J2sHwTWJiAsYA48AT23VUZ3Oh1SmLaq
         UEBJGLvcD9fhvhC/JG6k6PNSmMiz5HUpayYDQscLOzcC+OBAOkhWCHXnGCrVzHCAxeoT
         +YQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SEZ4KBDc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k17sor12877520wrn.30.2021.03.03.13.48.11
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SEZ4KBDc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXKlTeCnjmHxOIuW+5ok+sHuvv9dHK5aHCAXQUqIY0w=;
        b=SEZ4KBDcFeAeqQ/5JtNtzvNXQgdGlZcbsKkoAldLMpqwQ9bM41viT6moaATrG27Cr4
         sGitvPcB72EwpGsEuLWBOOZmA8cXMbO07pI+gmawAbmszagWVVKsNmzqTTnh4zLC92jl
         EquBq+ZStJ59VTrs63E1q+52qQZtMXEOfG8tnW7VpZBVtKQEaWrQ3UgvZsy1UuuMhCeY
         E3mqMQKxTpSONYg5tWR9sz40hWl091Tmg521XJahoHdJSdv/RqVsVpi8pY0DcXd7Vz8/
         53aFHfWPNUDarS4ewUItcEcl1J6cH8fEMNCu10bGuHCEyLOlETy1gq/I10d+mgVduaM6
         O3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=YXKlTeCnjmHxOIuW+5ok+sHuvv9dHK5aHCAXQUqIY0w=;
        b=MQVYBXXAyvH4sPvFyg30Ql2vuDtwApPy+eZrZGhTB+Kk5M9OpfcKJ/8noac3Sb9YCx
         o9c/yvVumXDL7VP8lY2qEsyfb45bB9rEdzGfMCLpgBsDiqgMe/rMzzpbFo8SrCcKN2cE
         S/ethqaOvYsAZLqJLQ+uJpJppPlTiK5IPcbLM5T2FKdDtrus+jDdVr+YeG0WUCjG0/5h
         9SYfgcQK6zaAut2odHAGzx3amUGNII48eqmukk7LpJ6PVrF7Kk4DUBCWrfe5zOAikwSg
         mK2J8/y0rJ82V8NiQHus1z2VW+YKZ49Hczi86kls38E85NVWdk57K8VibL27vw6+M7JY
         Y4rw==
X-Gm-Message-State: AOAM533Yzi5/feUm7iCMRobe11rfnSpEOFCn2zMaob7Y0kyBM0T18sWa
	VSKLeXSoYntwgPG5HkKGprY=
X-Google-Smtp-Source: ABdhPJxAONuByIIGIauhsjsh8+raA1mqasyYjOXylUqzsaoKTs3hTHMP9yjNuWo4rv2nPee/4+1GRg==
X-Received: by 2002:adf:e485:: with SMTP id i5mr820835wrm.26.1614808090992;
        Wed, 03 Mar 2021 13:48:10 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id n6sm14035298wrt.1.2021.03.03.13.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:10 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 11/28] cpu: Move CPUClass::write_elf* to SysemuCPUOps
Date: Wed,  3 Mar 2021 22:46:51 +0100
Message-Id: <20210303214708.1727801-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qXULeVh2d6Hc

The write_elf*() handlers are used to dump vmcore images.
This feature is only meaningful for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 17 -----------------
 include/hw/core/sysemu-cpu-ops.h | 24 ++++++++++++++++++++++++
 hw/core/cpu.c                    | 16 ++++++++--------
 target/arm/cpu.c                 |  4 ++--
 target/i386/cpu.c                |  8 ++++----
 target/s390x/cpu.c               |  2 +-
 target/ppc/translate_init.c.inc  |  6 ++----
 7 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 781cd8fc42b..0a2c29c3735 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -112,14 +112,6 @@ struct AccelCPUClass;
  *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
- * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
- * 64-bit VM coredump.
- * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
- * note to a 32-bit VM coredump.
- * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
- * 32-bit VM coredump.
- * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
- * note to a 32-bit VM coredump.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -163,15 +155,6 @@ struct CPUClass {
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
-    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
-                            int cpuid, void *opaque);
-    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
-                                void *opaque);
-
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index b9ffca07665..60c667801ef 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -21,6 +21,30 @@ typedef struct SysemuCPUOps {
      * GUEST_PANICKED events.
      */
     GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
+    /**
+     * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
+     * 32-bit VM coredump.
+     */
+    int (*write_elf32_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
+     * 64-bit VM coredump.
+     */
+    int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
+                            int cpuid, void *opaque);
+    /**
+     * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 32-bit VM coredump.
+     */
+    int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
+    /**
+     * @write_elf64_qemunote: Callback for writing a CPU- and QEMU-specific ELF
+     * note to a 64-bit VM coredump.
+     */
+    int (*write_elf64_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
+                                void *opaque);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      *       runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 0aebc18c41f..c74390aafbf 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -151,10 +151,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_qemunote) {
+    if (!cc->sysemu_ops->write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -162,10 +162,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_note) {
+    if (!cc->sysemu_ops->write_elf32_note) {
         return -1;
     }
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
@@ -173,10 +173,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_qemunote) {
+    if (!cc->sysemu_ops->write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -184,10 +184,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_note) {
+    if (!cc->sysemu_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fa0d4bba590..0c06b9b1758 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,8 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .write_elf32_note = arm_cpu_write_elf32_note,
+    .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .vmsd = &vmstate_arm_cpu,
 };
@@ -2306,8 +2308,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
-    cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 362ad56ab68..403ed65fc61 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7389,6 +7389,10 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_crash_info = x86_cpu_get_crash_info,
+    .write_elf32_note = x86_cpu_write_elf32_note,
+    .write_elf64_note = x86_cpu_write_elf64_note,
+    .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,
+    .write_elf64_qemunote = x86_cpu_write_elf64_qemunote,
     .vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -7428,10 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->write_elf64_note = x86_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
-    cc->write_elf32_note = x86_cpu_write_elf32_note;
-    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index fdc169bb0ac..2b249f47eb9 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,6 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
     .get_crash_info = s390_cpu_get_crash_info,
+    .write_elf64_note = s390_cpu_write_elf64_note,
     .vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -524,7 +525,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 789124debe7..598304bd636 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,8 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .write_elf32_note = ppc32_cpu_write_elf32_note,
+    .write_elf64_note = ppc64_cpu_write_elf64_note,
     .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .vmsd = &vmstate_ppc_cpu,
 };
@@ -10894,10 +10896,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->sysemu_ops = &ppc_sysemu_ops;
 #endif
-#if defined(CONFIG_SOFTMMU)
-    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
-#endif
 
     cc->gdb_num_core_regs = 71;
 #ifndef CONFIG_USER_ONLY
-- 
2.26.2

Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4539033lfg;
        Tue, 2 Mar 2021 06:59:42 -0800 (PST)
X-Received: by 2002:a50:fe89:: with SMTP id d9mr21295417edt.57.1614697182196;
        Tue, 02 Mar 2021 06:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614697182; cv=none;
        d=google.com; s=arc-20160816;
        b=sbA7VxlzVRFOPp11GqCIOjXbnRz7dOeEt4CN9Bid5p70UKKLLmR1o32C/R2+nxQK84
         gAB+nyiHog7IHAx2pOalLiUNnmJ5iCsRxA3ktXYJf9pBlZVvy55EGiKIB+KZnz9YGvMu
         vf+YGV0rgscnNn3Y38cjAkT1pi3Qpmg0LQweHTgcbnlDd39xs6SkTjjVmOzbct36txd3
         YAHy5CKlxgAjdn0qiVhsr7XlyOvxo1IHMSidwwA38ir/k5ssyyGCyIxtqp1SH7qOTmkI
         fFYPOuUsyJPpaB9G0H0f96jsLTMu1/mNRyYaGz1ESZDXuuk4pqzMEFA8NcvxFy9RwJFD
         k25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=6w8yuNP2zUEwKLIo3lOsMB+G9xmXkg7KWNf3q3iE2oc=;
        b=pxfLS+j3pX6bX32/leEA4Wti1jQMO1+tEceKEYDMgnpegQajrMbsJygqQoSVeaR3wX
         /1+7rmud5pbdlq0FA2SkGvAibTwb/J+ykVNAvxsh750hQWIrQHCTc0PX9mPigUHXfmQZ
         fcaIR2egtH/9FbSpz62utGdz0l92vZkLiEMkDN9tLZ5oXS0HIScdIe/5XoMsdwcoQfms
         MHz+ywJUHCX10poZaiJaD1KLQZ/NZhklKjCji69r3ih+RxyjSjy6NZZtpRiu04QatzZM
         fjtquEeI13zGEhKhRXR+KliKnvfzC9kheic6P/NwZPhUnVT+Y8coGfpESoSn/l81fpBV
         64tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uwdAAgV8;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jx14sor2825460ejb.59.2021.03.02.06.59.42
        (Google Transport Security);
        Tue, 02 Mar 2021 06:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uwdAAgV8;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6w8yuNP2zUEwKLIo3lOsMB+G9xmXkg7KWNf3q3iE2oc=;
        b=uwdAAgV8AYcMubfPQNzQXSoIamXMBuHQn1Z8DBgnsC/VE0AyNc3i4VYhGRBzmIy4jG
         nBPRBG5T5JtPJV+G4al+ghhS6X/kImXFeACTGiZ4HocUoxWSqe12fG8a4ebIGYz1MuHA
         Zft+6136sPOMxNI6aOd6TS/sbiztq0SZPrJTMX6KR0bRcAqABawMR2sDPzJTshzC8Hs1
         ZOyAPGtKUlrShQDKNjfmiYZ9vQq7DgmYbpLmm/uVW65N56GXqULY8LRwXhQODrmoJfUv
         FtgwckSsZvV+/1noyOh3lGAxIzN6LmRclQbiFQbCtd1LEdsr+zp/tOUhNt0AM8e/rBbN
         b7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6w8yuNP2zUEwKLIo3lOsMB+G9xmXkg7KWNf3q3iE2oc=;
        b=X43eKqEnQeIXMsyFH368KSVFIQpgWdsSGzQpk0P0RCcousLiLCqcAYa/x1r8lsNoXQ
         sED7Pc+Ngjuzl35q+J8I47o7v5M235B1LnM/MF+WH6UdvS7hOnGxZ/77httTPW3K0Zmo
         /IrHtPr1cL0Jg9vzaYJu030ECj/vmkBOSa4kIrOxYaANBv5M6Jdw3uz2KcT9Am8sJwwT
         XhDkFFhUJO3ppPEi7FBNn45Dd2ytdJVnSMdqXwiR47vthsn8P2+ezO1DGr9AbrbpSut/
         tOU8FVQkHN7N6EZ9NeondRV4E+5V9A99fTSsnvDJYL3l/fkk6sMN0LOZZgjbyEABg3sZ
         pi2g==
X-Gm-Message-State: AOAM530H/YQPLgvsoC4xOxwT/ywVCdC0hIlfO+WqMxvIK6lvkcD+LeTI
	p1j59tafLw//ftcxlkfKxi0=
X-Google-Smtp-Source: ABdhPJw/NtUpEf7h3awO41CqFHXw9y/hlzZiJiWABzR26ktHVT06QpLFbnPFge1acgBulHcMUWFpTA==
X-Received: by 2002:a17:907:7799:: with SMTP id ky25mr3220539ejc.217.1614697181807;
        Tue, 02 Mar 2021 06:59:41 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id be27sm3277273edb.47.2021.03.02.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:59:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Stafford Horne <shorne@gmail.com>,
	qemu-ppc@nongnu.org,
	Anthony Green <green@moxielogic.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-s390x@nongnu.org,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 11/27] cpu: Move CPUClass::write_elf* to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:02 +0100
Message-Id: <20210302145818.1161461-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Vk6dLKp+GWz5

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
index 2bad6307cce..7dc6956f2cc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,8 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps arm_sysemu_ops = {
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
index b7672a7accc..b26905b22a3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7389,6 +7389,10 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
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
index 04c14fcd9da..92b7a66d3c3 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,6 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps s390_sysemu_ops = {
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
index 2dd4f47adbb..068f4a4012e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,8 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps ppc_sysemu_ops = {
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

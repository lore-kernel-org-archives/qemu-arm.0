Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1440760lfg;
        Fri, 26 Feb 2021 08:51:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBoBLwzVbaN0ZQxr3MKEP1ObBTf5vLwJyDwMj3X8v6sZiLhoyWoDl9Bko/JrlrP0TYLTQU
X-Received: by 2002:a6b:f714:: with SMTP id k20mr3473597iog.70.1614358287980;
        Fri, 26 Feb 2021 08:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614358287; cv=none;
        d=google.com; s=arc-20160816;
        b=uBE03OBo8La09w0x6dLnQZUJ+H+NKFhoLOCSdvGE6Vod/u0qAnVCD4b/8uIKN2hHk9
         Cw3NrBsbxiBzG1miC+2KAWPjFZplItQJsn63bG4LazmiARVeydbLeSJm+xSurQ5lRisE
         jFUYl2jkB4iLLFTncIQ/SkCr+WFo+JWAKP8q4d74LjjT9kjn0/IpDti8354CDqdENMOa
         2NG/Jn43qNX0z7X45ZOg/VhMSh05yu3/W3YgmigPwcVEzr44W245GnvnMnbDRHkupym6
         z7lNLYRRJu0SbwB9oNmWAauxMx95uWABk5wA9v34PQ8J0YJGFPE4LB4eGG3BJyVxbbPn
         io6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yppSFDQsnap9fkQDMIB4LM/Hd6+rcDegPvCr9hlrbG4=;
        b=Z44fqqU0JhiJmBWKmtnuHPbbo+P3uMtlApbnxwq6AReDwtNqCB9O0BBZlhfOtPh+6H
         vCt9lr3Tdq5P7J7emxXPH3TxFMbmxc1eroi5GECPmynnU6cM2wK+iYhvpmDYytrKo0HL
         fFGlqJyDtsMn/7A3+lD+DQp+jPl7xYjO/6wChXRxxTj3BZI32zQfc9YrKQ1oT9IkLdkN
         P5Wpkog8fl0tP3HEKkW/OWh521lqqKcd1N25AcZ8qkfiuvz81TzNclLCMeUeee/G8qc5
         JmA7uZUO5djzBmiSNDOVbev5d4G6JqDoaruK8QqhWcJIF2LGn+k2Tl228dGiyxIKGd/T
         r+ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RqsbZxiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si5195314jam.51.2021.02.26.08.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RqsbZxiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgKt-0003RT-65
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3j-0004yH-BM; Fri, 26 Feb 2021 11:33:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3g-0007nF-7K; Fri, 26 Feb 2021 11:33:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id n4so6904833wmq.3;
 Fri, 26 Feb 2021 08:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yppSFDQsnap9fkQDMIB4LM/Hd6+rcDegPvCr9hlrbG4=;
 b=RqsbZxiETkb9P1vuejki+clVSger/BhVc0Y+i01T/lyJFro47QMOYFEMQqeEX1LpL7
 egUkAka5uPw2lBcHNJ0vmPvzX9kShILCt1LYd8Pc9NUFZF7PVRR9mU/2Ba6LPYuoFGiX
 0QzMPnkIQ8Gipw3mRI7eJ5wJbatX3hOLnjEQwf7/+Ea9Hazd3VKiE3yb8f1F8053wia+
 8dVtdlIqd1a81+yFEZNVyrWfaC1WXzW0A1HUaR85voFyhcrK+7V6v7I6GBmEZphGFTaO
 SNXSDtatdL7TS9VV6VAY2aMOUueFGtwOyHf5y1DLVof1oYhLzgBmOalNvfEGE7DeiYIl
 6cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yppSFDQsnap9fkQDMIB4LM/Hd6+rcDegPvCr9hlrbG4=;
 b=VQpeohn97auRht7GdS5WCjYStRWDXeD9mOnBlJI5rLvAxsjpn0qjWxH0TA4SSP0Ymv
 b5DA4nDnGIhflQgL0o/xsw0m3iDcUKdsj9RQQCtQYqKY/D1vHHBNO+4y2HOZwOo+tLQz
 AJCnZ6fh2bAv5XnHv0stT2T3gjPIztdvlYd8m6kDr1O03zVKwkIusmvPFL+NkbDZk3aZ
 JsnLyPjlELIApkDeiowXfn3deu3M9FgEF8aM+FBwTd8n3yNxZ5HeBlccLvrCcFoiYNqS
 Bb2CGbWLHC8Pjn2Ie+6JFJTliFGiFrBs8mVsGrlMbIEuOOHRv6kKd5V3z2Zz77kvxjh0
 VstQ==
X-Gm-Message-State: AOAM531aFs1o6u57DNKO+UjNT3CbGYWqtyPsTZNwsGrymsiISDMiwc+U
 c1qTRg501AVgbUhrJHo8FOy2Cvt+Od0=
X-Received: by 2002:a1c:f409:: with SMTP id z9mr3633637wma.141.1614357217212; 
 Fri, 26 Feb 2021 08:33:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm15756579wry.90.2021.02.26.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/16] cpu: Move CPUClass::write_elf* to CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:22 +0100
Message-Id: <20210226163227.4097950-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G1FwITreEOJj

The write_elf*() handlers are used to dump vmcore images.
This feature is only meaningful for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           | 41 +++++++++++++++++++--------------
 hw/core/cpu.c                   | 16 ++++++-------
 target/arm/cpu.c                |  4 ++--
 target/i386/cpu.c               |  8 +++----
 target/s390x/cpu.c              |  2 +-
 target/ppc/translate_init.c.inc |  4 ++--
 6 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 87186e85d44..e8c2e9af3bb 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,6 +89,30 @@ typedef struct CPUSystemOperations {
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
@@ -133,14 +157,6 @@ typedef struct CPUSystemOperations {
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
@@ -184,15 +200,6 @@ struct CPUClass {
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
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index ddf5635d87b..3dc8faf6086 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -151,10 +151,10 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_qemunote) {
+    if (!cc->system_ops.write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cc->system_ops.write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -162,10 +162,10 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf32_note) {
+    if (!cc->system_ops.write_elf32_note) {
         return -1;
     }
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cc->system_ops.write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
@@ -173,10 +173,10 @@ int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_qemunote) {
+    if (!cc->system_ops.write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cc->system_ops.write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -184,10 +184,10 @@ int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cc->write_elf64_note) {
+    if (!cc->system_ops.write_elf64_note) {
         return -1;
     }
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cc->system_ops.write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3cbb17a5879..4941a651e64 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2301,8 +2301,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->system_ops.vmsd = &vmstate_arm_cpu;
     cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
-    cc->write_elf64_note = arm_cpu_write_elf64_note;
-    cc->write_elf32_note = arm_cpu_write_elf32_note;
+    cc->system_ops.write_elf64_note = arm_cpu_write_elf64_note;
+    cc->system_ops.write_elf32_note = arm_cpu_write_elf32_note;
 #endif
     cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "arm-core.xml";
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9692843256c..c34d41d4c79 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7422,10 +7422,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->system_ops.get_crash_info = x86_cpu_get_crash_info;
-    cc->write_elf64_note = x86_cpu_write_elf64_note;
-    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
-    cc->write_elf32_note = x86_cpu_write_elf32_note;
-    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
+    cc->system_ops.write_elf64_note = x86_cpu_write_elf64_note;
+    cc->system_ops.write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
+    cc->system_ops.write_elf32_note = x86_cpu_write_elf32_note;
+    cc->system_ops.write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
     cc->system_ops.vmsd = &vmstate_x86_cpu;
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index f9107cb7179..dcfbb7832e1 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -519,7 +519,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
     cc->system_ops.vmsd = &vmstate_s390_cpu;
     cc->system_ops.get_crash_info = s390_cpu_get_crash_info;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
+    cc->system_ops.write_elf64_note = s390_cpu_write_elf64_note;
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 2e5c272190b..b1ac3291be1 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10888,8 +10888,8 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->system_ops.vmsd = &vmstate_ppc_cpu;
 #endif
 #if defined(CONFIG_SOFTMMU)
-    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
-    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
+    cc->system_ops.write_elf64_note = ppc64_cpu_write_elf64_note;
+    cc->system_ops.write_elf32_note = ppc32_cpu_write_elf32_note;
 #endif
 
     cc->gdb_num_core_regs = 71;
-- 
2.26.2


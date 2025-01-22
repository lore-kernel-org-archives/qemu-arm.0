Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654757njc;
        Wed, 22 Jan 2025 01:30:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4//+rIN9gQVScVygvYKubp1pPIYZ/8ZEuF15rAcWaVBtO0Sz14XMW4h/onYOyhgP8GNoAGTiFQl405g==@linaro.org
X-Received: by 2002:a05:600c:1c93:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-43891429c77mr171086795e9.24.1737538249575;
        Wed, 22 Jan 2025 01:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538249; cv=none;
        d=google.com; s=arc-20240605;
        b=RcmbBH3ECxWG6oShde7yaeOTbTD6utuA9NJQTBI07EbNxlO0gWX49GaXr8sPmDP5sc
         uE8KPSZa8owJY4glKd1jC6t2FzmyNYBgLPyoOQHP+PPM8lyYabkwlL3GLR8wShxzAcBR
         ndW3+i3+RV4UHYQBxtQE0sQXRS0k2OMH6R2CpO6CcjKakFFKYAab9V583EOxMgQMMdrK
         bj8eyJlRHJfXwFMlmZcEReLjR6ntGgOpycveCLekV0lDt9w7lRWtpbaNz4ven9GYdgn8
         JBuM2YUBtPppz05khqL5OEvOJeQqVs5zBgVYcA+XuMGmvdSglgxtpwIMlkQgLlB90MC9
         J2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1UV0l1u1VpXGSm89LpbkaA5vSB88+gDPSxyKKjefn6E=;
        fh=f45vr8cUdzk1kAItLkpd897oQeJ+9TbtRxfk7ZN23yY=;
        b=C6IkoYAEoMH1YDTqebpqb7CVetVMqeox4UGg8B6rZS2x4MkqSG5S13M3K6PM8aF/Ee
         jxzezhltMiChxSVC+GZeVYa1URl4kJdMqDDPsJvAxVRUcKX4/vNq05gretToePRiL6I1
         sTezN7j4Qk+QKjnwH1KfoYDxNcS0Y4Fy43MUqG7azleupsN3CYZeRx36x8rRQRXeUAQD
         dD2BE6dZ9pGmEr4STZsx5kp+caK/AVY46CZlZ4xkFGCu7152NMyNMGY/WCd0SVhU83+4
         /gQYr9q3hmO01xGdow7BcSxuyp0xEJ2fOTaBlNE+F1LzKghuT12I1slwktxhtkNoyYiu
         nEnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSF5KkpE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43890367f42sor42851265e9.0.2025.01.22.01.30.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSF5KkpE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538249; x=1738143049; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UV0l1u1VpXGSm89LpbkaA5vSB88+gDPSxyKKjefn6E=;
        b=WSF5KkpEjbq1178xgQ3dwcToF1LDGsSxQrxGaB/+3hJ26eWz2LW2iCHdpu36pXQG01
         UGMMIuk8tbiLDnJV3JLqCjoCtIj4MWliCqJL/MV+sfQHkgNd1mS2IsyWlWy6DNzrQBQ4
         0jP3a0CXVTl3mQUicYaD5RsJE72mZ5+RyPQKCDIBahc4Z/KN1AiWAlFI2CJQCtb70GWJ
         PBa7TBOHZORnFqpXjX+XKqd7KSpOkg0aOCAb5+RMnTZ6TXJjalyx73RshgtmtK8ToU0B
         HA7NyqTVN5a5V2gcnwTFwY7xayIlKJ3unp80YZ4I2gNspcCCzv66yyaGXE4UUJ/iwh8d
         TJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538249; x=1738143049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UV0l1u1VpXGSm89LpbkaA5vSB88+gDPSxyKKjefn6E=;
        b=k4yfF7WLuJMFXzCqS+XLM71ueYfjHx1Xcnp3l6M8aPYdV+QRvgnoWTWtFPPT9Lfj1J
         H3aSONivRj1lNEoTDNR4TWCIqT1ZOZlcsnZr2hS8SwLeAig4Me3ijkyAqenlMWmnCdv5
         T2fqAjML1EDncz+fgZIQ8Y8m+uLqFilcflHKTI5lsSv0wOltUjBqAtDJDsbRHe/wC5ke
         EcV8liHfAse+E1Ru071FYtx42Xf2MFRgWx0fW595ABR+AKgcXrPOTrwY31V1W5fXZUSm
         60y714Y2RCJIGAzNhvmWK6+aFlmLgX/V5PFDAGOgbUNN7E4X9vTi+jYHa8uQh48RUAoG
         kOFg==
X-Forwarded-Encrypted: i=1; AJvYcCUSfsuKsvYe9l0+y6joO7wTRD3WvdSZLSDxLFIN4n3GkVBjYq0gFTpF3HKHTUSSG0qNdTJ4UB3Npie4ug==@linaro.org
X-Gm-Message-State: AOJu0YypzHakXQQ1mWD2ZU3FYhNY3fnHndUVwAe/pB1ZubriOb/A4By/
	lOKqRZgfK+ReN3kIA5JsyypBUAEPS16yfN5GIi844hJJyZXzZk3ebW+e3KUB4UOAzA==
X-Gm-Gg: ASbGncvBDeE1xzreYjXdd5JX37UIMDdupYAyHDvR0vmbstMTr8NvGrJjvcNpOTIHTmY
	VcAQItp9l09TBUZMy6scAtj6CngwR16TmwJJltJ59Dup/TkFqiXBCrNAzhjSKpCzCPHeabKY0XJ
	tcEbxn6P7jVwPoSySnyrc6l0+Xp2wuN3Ji0/kA+ZpTJXs93d+n74vntNeNIkdO7ndMGvAtFOJpK
	9tBo6LH+O4VOFyX+LZOhKEsBFgQGWaRCH7yLjxWno2aOF3SAczMN94txV8nR6vQhVVz7IaCAxKZ
	e9hhT+prnJbMlIKh3omnDPK5Ed8B+lssug7d3/p/bOVy
X-Google-Smtp-Source: AGHT+IG9O4Vaslac/rd22GI8JJjeSuQaSY9J/vZ19MsSESCQirxJFfUqVnRG0W1Jv966HJvoPWtHKw==
X-Received: by 2002:a05:600c:4511:b0:431:60ec:7a96 with SMTP id 5b1f17b1804b1-438914387ddmr160190935e9.25.1737538248888;
        Wed, 22 Jan 2025 01:30:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c1a2sm17580255e9.7.2025.01.22.01.30.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/10] cpus: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:22 +0100
Message-ID: <20250122093028.52416-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h5uSEtlV6NbH

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 10 +++-----
 cpu-common.c          | 10 ++++----
 cpu-target.c          |  6 ++---
 hw/core/cpu-common.c  | 13 ++++------
 hw/core/cpu-system.c  | 55 +++++++++++++++----------------------------
 5 files changed, 32 insertions(+), 62 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7b6b22c431b..d9e19d192e4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -826,10 +826,8 @@ const char *parse_cpu_option(const char *cpu_option);
  */
 static inline bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
+    g_assert(cpu->cc->has_work);
+    return cpu->cc->has_work(cpu);
 }
 
 /**
@@ -968,9 +966,7 @@ void cpu_interrupt(CPUState *cpu, int mask);
  */
 static inline void cpu_set_pc(CPUState *cpu, vaddr addr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->set_pc(cpu, addr);
+    cpu->cc->set_pc(cpu, addr);
 }
 
 /**
diff --git a/cpu-common.c b/cpu-common.c
index 4248b2d727e..3a409aacb2e 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -389,11 +389,10 @@ void process_queued_cpu_work(CPUState *cpu)
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUBreakpoint *bp;
 
-    if (cc->gdb_adjust_breakpoint) {
-        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    if (cpu->cc->gdb_adjust_breakpoint) {
+        pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
 
     bp = g_malloc(sizeof(*bp));
@@ -419,11 +418,10 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 /* Remove a specific breakpoint.  */
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUBreakpoint *bp;
 
-    if (cc->gdb_adjust_breakpoint) {
-        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    if (cpu->cc->gdb_adjust_breakpoint) {
+        pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
 
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
diff --git a/cpu-target.c b/cpu-target.c
index 89874496a41..98e9e7cc4a1 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -159,10 +159,8 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ff605059c15..886aa793c04 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -40,9 +40,7 @@ CPUState *cpu_by_arch_id(int64_t id)
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        CPUClass *cc = CPU_GET_CLASS(cpu);
-
-        if (cc->get_arch_id(cpu) == id) {
+        if (cpu->cc->get_arch_id(cpu) == id) {
             return cpu;
         }
     }
@@ -101,11 +99,9 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
 
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->dump_state) {
+    if (cpu->cc->dump_state) {
         cpu_synchronize_state(cpu);
-        cc->dump_state(cpu, f, flags);
+        cpu->cc->dump_state(cpu, f, flags);
     }
 }
 
@@ -119,11 +115,10 @@ void cpu_reset(CPUState *cpu)
 static void cpu_common_reset_hold(Object *obj, ResetType type)
 {
     CPUState *cpu = CPU(obj);
-    CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (qemu_loglevel_mask(CPU_LOG_RESET)) {
         qemu_log("CPU Reset (CPU %d)\n", cpu->cpu_index);
-        log_cpu_state(cpu, cc->reset_dump_flags);
+        log_cpu_state(cpu, cpu->cc->reset_dump_flags);
     }
 
     cpu->interrupt_request = 0;
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 6aae28a349a..37d54d04bf8 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -25,10 +25,8 @@
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->get_paging_enabled) {
-        return cc->sysemu_ops->get_paging_enabled(cpu);
+    if (cpu->cc->sysemu_ops->get_paging_enabled) {
+        return cpu->cc->sysemu_ops->get_paging_enabled(cpu);
     }
 
     return false;
@@ -37,10 +35,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->get_memory_mapping) {
-        return cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
+    if (cpu->cc->sysemu_ops->get_memory_mapping) {
+        return cpu->cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
     }
 
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
@@ -50,14 +46,12 @@ bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->get_phys_page_attrs_debug) {
-        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
+    if (cpu->cc->sysemu_ops->get_phys_page_attrs_debug) {
+        return cpu->cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
     }
     /* Fallback for CPUs which don't implement the _attrs_ hook */
     *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
+    return cpu->cc->sysemu_ops->get_phys_page_debug(cpu, addr);
 }
 
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
@@ -81,64 +75,53 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf32_qemunote) {
+    if (!cpu->cc->sysemu_ops->write_elf32_qemunote) {
         return 0;
     }
-    return (*cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf32_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf32_note) {
+    if (!cpu->cc->sysemu_ops->write_elf32_note) {
         return -1;
     }
-    return (*cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf32_note)(f, cpu, cpuid, opaque);
 }
 
 int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf64_qemunote) {
+    if (!cpu->cc->sysemu_ops->write_elf64_qemunote) {
         return 0;
     }
-    return (*cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf64_qemunote)(f, cpu, opaque);
 }
 
 int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
                          int cpuid, void *opaque)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (!cc->sysemu_ops->write_elf64_note) {
+    if (!cpu->cc->sysemu_ops->write_elf64_note) {
         return -1;
     }
-    return (*cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
+    return (*cpu->cc->sysemu_ops->write_elf64_note)(f, cpu, cpuid, opaque);
 }
 
 bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->virtio_is_big_endian) {
-        return cc->sysemu_ops->virtio_is_big_endian(cpu);
+    if (cpu->cc->sysemu_ops->virtio_is_big_endian) {
+        return cpu->cc->sysemu_ops->virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
 
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->sysemu_ops->get_crash_info) {
-        res = cc->sysemu_ops->get_crash_info(cpu);
+    if (cpu->cc->sysemu_ops->get_crash_info) {
+        res = cpu->cc->sysemu_ops->get_crash_info(cpu);
     }
     return res;
 }
-- 
2.47.1

Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485681njk;
        Thu, 23 Jan 2025 15:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxIqW0bkZb5TtznwCR37cU/UsvnUbKg1eRLeFiGQYTikcIPj2wRj8ZmwiPlCpA1WuPt1rSTOldiEnj/Q==@linaro.org
X-Received: by 2002:a05:600c:1d0c:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-438b885652fmr48092325e9.7.1737675965688;
        Thu, 23 Jan 2025 15:46:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675965; cv=none;
        d=google.com; s=arc-20240605;
        b=dR/d0Q4qpWAJnx8BcmbOaGSWDcC6sVjLggPvfxBNwxBQSXX9Fys6m99FrVYaZyK42y
         2Dk7QQao3Mt1zvw5IyD9gYLZQJB3werCvFiFYtlhYmHNbr/+Mlp4fb31VBSvVW8KpmO3
         +5n3IAs1XfjNBq/zSrKxhRBKuRQl8Rw9PpFNrbZpR9SBX9AUCpJ9LSCUwOQ9wjHKR1yu
         cK6hU9OXzU77MYpdmD4EzTzJr9W/qVglprH5JZYJNkN+3JVVpub8IU2d0SLl7dmusZQ7
         coz2PSD63D+EUCqBYtJ2iqvQ3yeBwok0Q9ws28WveW2LIScyctiOzQO0kcPBtKhzhF1r
         kFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sQ+5PubFZrrCYmUor7z2ohXZLQOj0+FDz6CQ50FZwrM=;
        fh=gQ5H80WKfWurJ+jFATKJgOWPRfn42lCGd+SojDhIwc0=;
        b=J3h161pTTH4HqFbFE06dtoyLh0KKg7C3Nv/W3hj2DWmwxWHRVWsosuLMu9prxxbcWZ
         fX7/5cj/auBDMXhvEBBpzsnAC0W6AUJP5MrIwSzFkpLwxb0ouQQCM8O1HPfD219mCi8Y
         KtcW12X0xHGpCUQ8LxOSKGKDHgrR+QY3hl57zaDYEQRGBL/7omprNo1tsJmxqzFGOfxv
         2xeJhC8A/q4jMfiJMiNh7IsFWXHUNDFASamPm/bBwwt/mAJrR9MxyMpqm0cgFdJd6Gui
         hyOyQKERLFp11XKTBDYsH/RjkMz05B0AQfnpuEddlj4nC2hBoQFSHzxqtt4gJlZoylky
         bXzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vUobMpNQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd50234asor1483605e9.3.2025.01.23.15.46.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:46:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vUobMpNQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675965; x=1738280765; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ+5PubFZrrCYmUor7z2ohXZLQOj0+FDz6CQ50FZwrM=;
        b=vUobMpNQqBKKWEXGiLpzoJ/gWnkodTRzHY2N3fuccjFe4s8CPNLeyLE6kvRkA1NxrC
         gFhfTgpLclmWOd38lPNp6wTm4B/uO0n/XevVxSqRRPV5Pp3a5qj/JT5OAvWH2cD80+OC
         gCiMLeRevHJ1s+JDeSTpOMky7GyQ/2IMRDRkjm2Qyaviz/331HKcTLKZi1z67FAwk0/e
         9zatWRhqbu6ttCke/l5WKRHNegRcBGSrxXZuqbUhKseE4486GWr4b/hwmVUryNW5RP1G
         M4usOvkbnZwLl7XRiN+UvAly2AHxLPzXkS0sAVh7NCoqpLGMaG0HT9JyHmzjIeYgem1Y
         Op3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675965; x=1738280765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQ+5PubFZrrCYmUor7z2ohXZLQOj0+FDz6CQ50FZwrM=;
        b=g85QaL4bhbCZrMtYDcW4RV5k5YD+auu8J/GujyceHT6tH2fvQY2uevizhx27EiXwuo
         lbw/4EXP1gFNna3eGAjsGJ+MJqyJv7QlPA7Axk9/QRMCsDU+KysQQjwK5Z88dMOaE4CH
         yzhg48NvifHbytMYj3K4w6+u7rYxui3mVxiz3p7DUJu2SULUB2Ji3b/n4ufsgdU/2ZTB
         btJyMzW3EeEujxeL5NpEKFytTIvwzJ1THsTBD8xWjeLs9+62/0iJgca5NTvF7td3I094
         a23k20zoeHUWbjw/A3ftPPrPOLoIv7l9YOX3uXK8movtb3UDB0Lb9IgO+uI6XZLRykXh
         dhhw==
X-Forwarded-Encrypted: i=1; AJvYcCV407zlG0Wxd8JEiE6AqzDs6vYFlUP4Wh3QZWB3LJjzNTC+m1/Mu83C08wjSDcIMZ+jR96Se/9n5MO7LQ==@linaro.org
X-Gm-Message-State: AOJu0Yw4DRz+22MyP5gJkubabxSGuQEHj84TsqYVRvGG17kQhtVsbubT
	yYM55VZEGQCaB8M3W2RhboPkcp3whmOj7dJkxs5yiLUCIh+a0weAPvI0eLyJAQuCTw==
X-Gm-Gg: ASbGncupmftOJp2xGH05/QxA7soFyo1Bg4RUO7k5OLQZHjQhEcrkHa3rV8ZQNmWT1l5
	o8L2V3SHUeBLvsV+TU3uKx9IldAcUb0B/OZ9dIbgich074DfVnbgLYFKSWHZK5Js2GeEsAFbQt3
	w95uD7ZQYV3b0XzVc2ucd2B8O+jThjgxALEC6pMI91MuHlvvLzSkkWggkqaCz5vMvQ2BxiSYJHL
	KZpZ7aizSOyMlT+/y20lwW4X5pAH4sIJn7BjFMEbZKVqn6WZ/AdmNc26NLM1FmnVO2/OrTQV9sQ
	9Bsz9Pwkt/t/Rcyeg9AwR7DTOwnJ+12dqXtCVXI3nA9y3b4xndoTWbA=
X-Google-Smtp-Source: AGHT+IGsiKZVvuhBn67VKbvp7ZCKdJegwhgfqv/IiEk5xyysRNRbKSY3tyJ6LqHq9Om3O3Zv9Xfmsw==
X-Received: by 2002:adf:f250:0:b0:38a:5dc4:6dcd with SMTP id ffacd0b85a97d-38c22279dafmr4343550f8f.22.1737675965020;
        Thu, 23 Jan 2025 15:46:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c403asm989733f8f.93.2025.01.23.15.46.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:46:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/20] cpus: Register VMState per user / system emulation
Date: Fri, 24 Jan 2025 00:44:13 +0100
Message-ID: <20250123234415.59850-20-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6tvUmihyeLKW

Simplify cpu-target.c by extracting mixed vmstate code
into the cpu_vmstate_register() / cpu_vmstate_unregister()
helpers, implemented in cpu-user.c and cpu-system.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
XXX: tlb_flush() temporary declared manually.

Only 2 more CONFIG_USER_ONLY to go.
---
 include/hw/core/cpu.h |   2 +
 cpu-target.c          | 122 +----------------------------------------
 hw/core/cpu-system.c  | 123 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/cpu-user.c    |  12 +++++
 4 files changed, 139 insertions(+), 120 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fb397cdfc53..aadbd2e1122 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1163,6 +1163,8 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
+void cpu_vmstate_register(CPUState *cpu);
+void cpu_vmstate_unregister(CPUState *cpu);
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 void cpu_exec_reset_hold(CPUState *cpu);
diff --git a/cpu-target.c b/cpu-target.c
index 3d33d20b8c8..bfcd48f9ae2 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -21,115 +21,16 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
-#include "migration/vmstate.h"
-#ifndef CONFIG_USER_ONLY
-#include "hw/core/sysemu-cpu-ops.h"
-#endif
 #include "system/accel-ops.h"
 #include "system/cpus.h"
-#include "system/tcg.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
-#include "exec/exec-all.h"
-#include "exec/tb-flush.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
 #include "hw/core/cpu.h"
 
-#ifndef CONFIG_USER_ONLY
-static int cpu_common_post_load(void *opaque, int version_id)
-{
-#ifdef CONFIG_TCG
-    if (tcg_enabled()) {
-        CPUState *cpu = opaque;
-
-        /*
-         * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-         * version_id is increased.
-         */
-        cpu->interrupt_request &= ~0x01;
-
-        tlb_flush(cpu);
-
-        /*
-         * loadvm has just updated the content of RAM, bypassing the
-         * usual mechanisms that ensure we flush TBs for writes to
-         * memory we've translated code from. So we must flush all TBs,
-         * which will now be stale.
-         */
-        tb_flush(cpu);
-    }
-#endif
-
-    return 0;
-}
-
-static int cpu_common_pre_load(void *opaque)
-{
-    CPUState *cpu = opaque;
-
-    cpu->exception_index = -1;
-
-    return 0;
-}
-
-static bool cpu_common_exception_index_needed(void *opaque)
-{
-    CPUState *cpu = opaque;
-
-    return tcg_enabled() && cpu->exception_index != -1;
-}
-
-static const VMStateDescription vmstate_cpu_common_exception_index = {
-    .name = "cpu_common/exception_index",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .needed = cpu_common_exception_index_needed,
-    .fields = (const VMStateField[]) {
-        VMSTATE_INT32(exception_index, CPUState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static bool cpu_common_crash_occurred_needed(void *opaque)
-{
-    CPUState *cpu = opaque;
-
-    return cpu->crash_occurred;
-}
-
-static const VMStateDescription vmstate_cpu_common_crash_occurred = {
-    .name = "cpu_common/crash_occurred",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .needed = cpu_common_crash_occurred_needed,
-    .fields = (const VMStateField[]) {
-        VMSTATE_BOOL(crash_occurred, CPUState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-const VMStateDescription vmstate_cpu_common = {
-    .name = "cpu_common",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .pre_load = cpu_common_pre_load,
-    .post_load = cpu_common_post_load,
-    .fields = (const VMStateField[]) {
-        VMSTATE_UINT32(halted, CPUState),
-        VMSTATE_UINT32(interrupt_request, CPUState),
-        VMSTATE_END_OF_LIST()
-    },
-    .subsections = (const VMStateDescription * const []) {
-        &vmstate_cpu_common_exception_index,
-        &vmstate_cpu_common_crash_occurred,
-        NULL
-    }
-};
-#endif
-
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     if (!accel_cpu_common_realize(cpu, errp)) {
@@ -139,33 +40,14 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
     /* Wait until cpu initialization complete before exposing cpu. */
     cpu_list_add(cpu);
 
-#ifdef CONFIG_USER_ONLY
-    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
-           qdev_get_vmsd(DEVICE(cpu))->unmigratable);
-#else
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
-    }
-    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
+    cpu_vmstate_register(cpu);
 
     return true;
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
 {
-#ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
-    }
-    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
-        vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
-    }
-#endif
+    cpu_vmstate_unregister(cpu);
 
     cpu_list_remove(cpu);
     /*
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 0520c362db4..3e1f60f23df 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -22,10 +22,21 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
+#include "exec/tb-flush.h"
 #include "exec/tswap.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/sysemu-cpu-ops.h"
+#include "migration/vmstate.h"
+#include "system/tcg.h"
+
+/*
+ * XXX this series plan is to be applied on top on my exec/cputlb rework series,
+ * then tlb_flush() won't be declared target-specific in exec-all.h.
+ * Meanwhile, declare locally.
+ * XXX
+ */
+void tlb_flush(CPUState *cs);
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
@@ -189,3 +200,115 @@ void cpu_exec_initfn(CPUState *cpu)
     cpu->memory = get_system_memory();
     object_ref(OBJECT(cpu->memory));
 }
+
+static int cpu_common_post_load(void *opaque, int version_id)
+{
+#ifdef CONFIG_TCG
+    if (tcg_enabled()) {
+        CPUState *cpu = opaque;
+
+        /*
+         * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+         * version_id is increased.
+         */
+        cpu->interrupt_request &= ~0x01;
+
+        tlb_flush(cpu);
+
+        /*
+         * loadvm has just updated the content of RAM, bypassing the
+         * usual mechanisms that ensure we flush TBs for writes to
+         * memory we've translated code from. So we must flush all TBs,
+         * which will now be stale.
+         */
+        tb_flush(cpu);
+    }
+#endif
+
+    return 0;
+}
+
+static int cpu_common_pre_load(void *opaque)
+{
+    CPUState *cpu = opaque;
+
+    cpu->exception_index = -1;
+
+    return 0;
+}
+
+static bool cpu_common_exception_index_needed(void *opaque)
+{
+    CPUState *cpu = opaque;
+
+    return tcg_enabled() && cpu->exception_index != -1;
+}
+
+static const VMStateDescription vmstate_cpu_common_exception_index = {
+    .name = "cpu_common/exception_index",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_common_exception_index_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_INT32(exception_index, CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool cpu_common_crash_occurred_needed(void *opaque)
+{
+    CPUState *cpu = opaque;
+
+    return cpu->crash_occurred;
+}
+
+static const VMStateDescription vmstate_cpu_common_crash_occurred = {
+    .name = "cpu_common/crash_occurred",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = cpu_common_crash_occurred_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_BOOL(crash_occurred, CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+const VMStateDescription vmstate_cpu_common = {
+    .name = "cpu_common",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_load = cpu_common_pre_load,
+    .post_load = cpu_common_post_load,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(halted, CPUState),
+        VMSTATE_UINT32(interrupt_request, CPUState),
+        VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_cpu_common_exception_index,
+        &vmstate_cpu_common_crash_occurred,
+        NULL
+    }
+};
+
+void cpu_vmstate_register(CPUState *cpu)
+{
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
+    }
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
+    }
+}
+
+void cpu_vmstate_unregister(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
+    }
+    if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
+        vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
+    }
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index cdd8de2fefa..1892acdee0f 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -10,6 +10,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
+#include "migration/vmstate.h"
 
 static const Property cpu_user_props[] = {
     /*
@@ -30,3 +31,14 @@ void cpu_exec_initfn(CPUState *cpu)
 {
     /* nothing to do */
 }
+
+void cpu_vmstate_register(CPUState *cpu)
+{
+    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
+           qdev_get_vmsd(DEVICE(cpu))->unmigratable);
+}
+
+void cpu_vmstate_unregister(CPUState *cpu)
+{
+    /* nothing to do */
+}
-- 
2.47.1

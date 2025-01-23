Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485435njk;
        Thu, 23 Jan 2025 15:45:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYrIQ9e0JUej+5I5+IjeJPM50H3P/zcRN+TzFqnE2BUtef7DoeSKaHWgqYWD6jPTcePTU26FlhlkFl7w==@linaro.org
X-Received: by 2002:a05:600c:4e12:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-438913bdcd2mr235874385e9.4.1737675936411;
        Thu, 23 Jan 2025 15:45:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675936; cv=none;
        d=google.com; s=arc-20240605;
        b=g8pQTC2JJEMUTtIBrZ7LU6l4NBSf6jxma3/aVPd6hthIToRV5uY3cW+BbwQRS3Igvk
         YrqLUJ3L/ZhasF5G5V2VN9YwtC8TpIlTK6ZK+sykwJLFSEliNIQtUmvSWcamUExYI6bX
         EXoZal0eCrd7yxvj4tInWDNcAVcc6o2sHNPHMUuwMe8oHL1XT8v/eaYyd1VfpE89aQ4s
         g6a/uftyf/4MytCMwSem+578uFldBL9S6l2qfbapaTTjj6IeKklZ5sEUkA/B+5L3bwAO
         XXme4vlefceLt0n8DUjvX8yCRv0cXt+UbBjhM8TmHTxiPlcI8mIeZui3pcBOiLtIpCKz
         6UvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
        fh=/A7b2exL/6vTk7RfihY2YuQtnC1hRWuEs05ESxvoqNI=;
        b=iweB4ZiTDa6b4ICSBn6qjwsXwn6M3bcoOuiBAlEIqYbsWHlI5KdoHi03ZOXbEijZ1h
         PjWPlywc/2o1qVFRrNuLQeos8+wCojnRsf7ziQJUGX6VKYSlTYamvhIuKKIdbg30y1Uq
         w2okxSuwAPNIZGyyvvd/wroaeWEEQjBlbfr9/L17ZOH6waxPrPltq1yTWjfInP7H1Aa1
         +5Cf8OZn9hOr3CwsOBxp9BIKcvSD6dVKXRisj1Dey1VyMczOpijPBEICErnfDtCZsprE
         X/uqzYcBuB6EVr27m3MgiFqoO/r8n8up0hV0MKn2ke7MxW6GwQjN5B0PiSChPG2oLPm/
         pjPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIyDw1up;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4628c6sor2504385e9.0.2025.01.23.15.45.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIyDw1up;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675936; x=1738280736; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
        b=iIyDw1upz/0fI3YE6knMcm43i6dRKCGLizU6GW+QXsyXU0QydhZF/NGUTDZ1Dsn71G
         G9VZymoMs5PbxRO+BhNL+I7yC1P2Gy4QlHysOqwFn+cl5lefr2R6gWdACQrXu8B6z2Us
         d8GqTXRg6Y6UJmixguA41BnPzBvmxe8tycuwFr+YoS5/0PBGtIXt1UiP33K2pYeVjKet
         U95A+Tz7/teUg5IRe8QD+qCOB1H8fnS7yrbKI56KoIhZqyBE8rqccBxCtjrGEpO+e0cv
         FfO+RnvZGkYaxqvz/Xi/QbMITgOnODBNseAsYfYh/e2uAXAP6M96BaC3L7HNzO0e9s4o
         M3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675936; x=1738280736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhTovaxYyVYo/iAlHiQi1CfSH3sOOBet2z8bCBrBkk0=;
        b=SWvpo+vrmKFiEGc30NDBGnYVCuTe2WZhmd7Pdnsp5Mfb4YJr6hM1gnsSDb3UizmFB3
         c5/NNJ3vtoAQeGyOeJWEx8MjdPyzB8EywVQos/aThFQBrcE15/hKMAiuUjqCc7aGmx2f
         SGPtew1EMhys1phHxAToHfdZj9lXK0JcpJCDWIrc8btaLXoEtNIiAlPrTsWvuZczQ2Id
         6UHcTyloZRkHg1P61zlVfG+9iD8rRkWMpeg8D0thsXMJvsMAWCXZTPF9laJDajPhO/dy
         0iuj4g0/CH5rr+P47wxU5hE91uxrcxcq8sngwVYwlvu1mv/7wubaW25nsPp+LOPvhHnV
         4VTg==
X-Forwarded-Encrypted: i=1; AJvYcCVmuRWLwdiPNFexEfO29tfBujTIpwpunP0ol2ukYm3PRajDTKEIACi9J2C97qI/iMMysYBJ8AA3iVS+nQ==@linaro.org
X-Gm-Message-State: AOJu0YxdUDU8Y/GypoOkbgQO4T8cbdXh8DxFU1tiWADESCGLsQVgIS4b
	U+N4qm4HZ+Zy0Jd5N2QPd7eVzU5VU1xbh0Xx/hev4nreKMAMnz592DEi+nAgltV8lQ==
X-Gm-Gg: ASbGncsF9P8TavEukqVpkWnmvL//QfdLyJ4kI6nBIbtmshtpehsWKQS+oHR1oqZF6Sr
	JCNDgKMAWAFNbucae9hFfp1QI4NSAueH9GHb8fOeQJ372ou2F+MIWdDLSKUJ3eewEQcit5bZgl0
	YTtFdlEiT0/I/Cj27kaVmcnBn8kzNGXIhNvkQWs2922+6HgOCUAiQuGMrkT1xaWQ4rxLvqjDJi+
	50hO1XHs5huWuYxF9UadtrOZ1858Tp4mtlvt+qLXMVddwqwxqqPlUTfUO5wdIj9qRrKNWet+Oqa
	m/wE3XwKJOLSrPVy4eh3Y8o4Ew3772KG8w6K+aClEXO4E9dL1fJMc75at3WI8RhQfQ==
X-Google-Smtp-Source: AGHT+IE1g5Lka6yaX7yxmvTjxCMF9sNPmOLsz1lyorKlxhPYpXBg1FExyYB9qYVhhui8O2rA+ot5eQ==
X-Received: by 2002:a05:600c:3b0a:b0:434:9c60:95a3 with SMTP id 5b1f17b1804b1-438913ca93cmr282415605e9.11.1737675935797;
        Thu, 23 Jan 2025 15:45:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507d60sm6676495e9.18.2025.01.23.15.45.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:34 -0800 (PST)
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
Subject: [PATCH 14/20] accel/tcg: Move cpu_memory_rw_debug() user implementation to user-exec.c
Date: Fri, 24 Jan 2025 00:44:08 +0100
Message-ID: <20250123234415.59850-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q65G2YwhTbBA

cpu_memory_rw_debug() system implementation is defined in
system/physmem.c. Move the user one to accel/tcg/user-exec.c
to simplify cpu-target.c maintenance.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/user-exec.c |  92 +++++++++++++++++++++++++++++++++++++
 cpu-target.c          | 102 +-----------------------------------------
 2 files changed, 94 insertions(+), 100 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index c4454100ad7..e7e99a46087 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -19,6 +19,8 @@
 #include "qemu/osdep.h"
 #include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
+#include "exec/vaddr.h"
+#include "exec/tswap.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
@@ -35,6 +37,7 @@
 #include "internal-common.h"
 #include "internal-target.h"
 #include "tb-internal.h"
+#include "qemu.h"
 
 __thread uintptr_t helper_retaddr;
 
@@ -969,6 +972,95 @@ static void *cpu_mmu_lookup(CPUState *cpu, vaddr addr,
     return ret;
 }
 
+/* physical memory access (slow version, mainly for debug) */
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write)
+{
+    int flags;
+    vaddr l, page;
+    void * p;
+    uint8_t *buf = ptr;
+    ssize_t written;
+    int ret = -1;
+    int fd = -1;
+
+    while (len > 0) {
+        page = addr & TARGET_PAGE_MASK;
+        l = (page + TARGET_PAGE_SIZE) - addr;
+        if (l > len)
+            l = len;
+        flags = page_get_flags(page);
+        if (!(flags & PAGE_VALID)) {
+            goto out_close;
+        }
+        if (is_write) {
+            if (flags & PAGE_WRITE) {
+                /* XXX: this code should not depend on lock_user */
+                p = lock_user(VERIFY_WRITE, addr, l, 0);
+                if (!p) {
+                    goto out_close;
+                }
+                memcpy(p, buf, l);
+                unlock_user(p, addr, l);
+            } else {
+                /* Bypass the host page protection using ptrace. */
+                if (fd == -1) {
+                    fd = open("/proc/self/mem", O_WRONLY);
+                    if (fd == -1) {
+                        goto out;
+                    }
+                }
+                /*
+                 * If there is a TranslationBlock and we weren't bypassing the
+                 * host page protection, the memcpy() above would SEGV,
+                 * ultimately leading to page_unprotect(). So invalidate the
+                 * translations manually. Both invalidation and pwrite() must
+                 * be under mmap_lock() in order to prevent the creation of
+                 * another TranslationBlock in between.
+                 */
+                mmap_lock();
+                tb_invalidate_phys_range(addr, addr + l - 1);
+                written = pwrite(fd, buf, l,
+                                 (off_t)(uintptr_t)g2h_untagged(addr));
+                mmap_unlock();
+                if (written != l) {
+                    goto out_close;
+                }
+            }
+        } else if (flags & PAGE_READ) {
+            /* XXX: this code should not depend on lock_user */
+            p = lock_user(VERIFY_READ, addr, l, 1);
+            if (!p) {
+                goto out_close;
+            }
+            memcpy(buf, p, l);
+            unlock_user(p, addr, 0);
+        } else {
+            /* Bypass the host page protection using ptrace. */
+            if (fd == -1) {
+                fd = open("/proc/self/mem", O_RDONLY);
+                if (fd == -1) {
+                    goto out;
+                }
+            }
+            if (pread(fd, buf, l,
+                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
+                goto out_close;
+            }
+        }
+        len -= l;
+        buf += l;
+        addr += l;
+    }
+    ret = 0;
+out_close:
+    if (fd != -1) {
+        close(fd);
+    }
+out:
+    return ret;
+}
+
 #include "ldst_atomicity.c.inc"
 
 static uint8_t do_ld1_mmu(CPUState *cpu, vaddr addr, MemOpIdx oi,
diff --git a/cpu-target.c b/cpu-target.c
index 20933bde7d4..6d8b7825746 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,18 +19,12 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-
-#include "exec/target_page.h"
-#include "exec/page-protection.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
-#ifdef CONFIG_USER_ONLY
-#include "qemu.h"
-#include "user/page-protection.h"
-#else
+#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
@@ -38,16 +32,15 @@
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
-#include "exec/tswap.h"
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-#include "exec/translation-block.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
+#include "hw/core/cpu.h"
 
 #ifndef CONFIG_USER_ONLY
 static int cpu_common_post_load(void *opaque, int version_id)
@@ -367,97 +360,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
     abort();
 }
 
-/* physical memory access (slow version, mainly for debug) */
-#if defined(CONFIG_USER_ONLY)
-int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
-                        void *ptr, size_t len, bool is_write)
-{
-    int flags;
-    vaddr l, page;
-    void * p;
-    uint8_t *buf = ptr;
-    ssize_t written;
-    int ret = -1;
-    int fd = -1;
-
-    while (len > 0) {
-        page = addr & TARGET_PAGE_MASK;
-        l = (page + TARGET_PAGE_SIZE) - addr;
-        if (l > len)
-            l = len;
-        flags = page_get_flags(page);
-        if (!(flags & PAGE_VALID)) {
-            goto out_close;
-        }
-        if (is_write) {
-            if (flags & PAGE_WRITE) {
-                /* XXX: this code should not depend on lock_user */
-                p = lock_user(VERIFY_WRITE, addr, l, 0);
-                if (!p) {
-                    goto out_close;
-                }
-                memcpy(p, buf, l);
-                unlock_user(p, addr, l);
-            } else {
-                /* Bypass the host page protection using ptrace. */
-                if (fd == -1) {
-                    fd = open("/proc/self/mem", O_WRONLY);
-                    if (fd == -1) {
-                        goto out;
-                    }
-                }
-                /*
-                 * If there is a TranslationBlock and we weren't bypassing the
-                 * host page protection, the memcpy() above would SEGV,
-                 * ultimately leading to page_unprotect(). So invalidate the
-                 * translations manually. Both invalidation and pwrite() must
-                 * be under mmap_lock() in order to prevent the creation of
-                 * another TranslationBlock in between.
-                 */
-                mmap_lock();
-                tb_invalidate_phys_range(addr, addr + l - 1);
-                written = pwrite(fd, buf, l,
-                                 (off_t)(uintptr_t)g2h_untagged(addr));
-                mmap_unlock();
-                if (written != l) {
-                    goto out_close;
-                }
-            }
-        } else if (flags & PAGE_READ) {
-            /* XXX: this code should not depend on lock_user */
-            p = lock_user(VERIFY_READ, addr, l, 1);
-            if (!p) {
-                goto out_close;
-            }
-            memcpy(buf, p, l);
-            unlock_user(p, addr, 0);
-        } else {
-            /* Bypass the host page protection using ptrace. */
-            if (fd == -1) {
-                fd = open("/proc/self/mem", O_RDONLY);
-                if (fd == -1) {
-                    goto out;
-                }
-            }
-            if (pread(fd, buf, l,
-                      (off_t)(uintptr_t)g2h_untagged(addr)) != l) {
-                goto out_close;
-            }
-        }
-        len -= l;
-        buf += l;
-        addr += l;
-    }
-    ret = 0;
-out_close:
-    if (fd != -1) {
-        close(fd);
-    }
-out:
-    return ret;
-}
-#endif
-
 bool target_words_bigendian(void)
 {
     return TARGET_BIG_ENDIAN;
-- 
2.47.1

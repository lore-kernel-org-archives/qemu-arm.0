Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26957njc;
        Wed, 13 Nov 2024 17:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXK1qkozXs72cSRz4t1D9F/c1VPI/wFIfptXyi5AukI3ocDb44BFK+nx444JazldT2UFqK1jlz1ouFoPQ==@linaro.org
X-Received: by 2002:a05:600c:1d1d:b0:431:3b80:6ca7 with SMTP id 5b1f17b1804b1-432d9767819mr11749305e9.13.1731546970073;
        Wed, 13 Nov 2024 17:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546970; cv=none;
        d=google.com; s=arc-20240605;
        b=Yt/vG8mGqlxNtuwj7AAKzjJzuHxnm+uKD71NdjdCsyuJJ2xFPEC9hDWio/picitV/d
         Tnm4IdKt/snQUmdDKzbhO8twr7P+Vnqfp1tu+o/FGDkJY/pPGKmxithz1mc9D0Gtmi/a
         aSZ7e5ri9S+3xoB6qMC44jEHDQ+H71kzx5sJAk5Tv/6KF/kDMQgfHY1n01p753uOUjro
         emSkpUW36umdpeHLVt+3QCJ9HFn4m6mqaye4Cp7ksPnYGfbN9ow//CC1zC6y//nxYF2V
         pjjPmz14SyuwLeSOiqyN7Hb7bDuAY3PZL02hW+y7CL/HfZMhNmkHq78brio1CYDnXqnR
         8Zsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dJnPLBXDUWt9APABFP9RtiuQUlaLpT6eHtJy+a+Whyg=;
        fh=9jYECzQJmTP9j/R8mNGgFhWPptGqYXIwZkW0ks9duCU=;
        b=XPgIbJEUbGE+U6cSFaYDQ+tCJ+PLx9Mwe39mImmjvHxh+wpuuFBzZBLC5B/5p6JY1Q
         qcYuGzdwwoWTp0fdV+9ahWIj9ikiOFULv/7dV5ld1jBSP1MN707S5q0sB53ev89/ZLC3
         DyEOtx2IFdDRNOD69iKuq5ojzI3uXsxgk3PA9P/nhFaBW7+OARo2a1zCVJS8AW5/JvDJ
         H+qiETMoLDWn6dpYdj6rtW/RDQN106x3uuu7jPco1Ks+a1oYHR0RtMUm0+NlaPCQ/Itp
         28IhAdsJX2zMy1gBKbJIwycv/0KX0Q4MzQSpCToH9TccoE13BdfR8gK/dNim+l6gloVs
         V6RA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N6xPR9Ll;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432dab7871bsor389805e9.2.2024.11.13.17.16.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N6xPR9Ll;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546969; x=1732151769; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJnPLBXDUWt9APABFP9RtiuQUlaLpT6eHtJy+a+Whyg=;
        b=N6xPR9LlGLEefLp9iiw33erEO2A8JbS9xPv4gR0WtWCrydq60sI/pQT0DzVri+r7Gc
         H9EGcbm3KI09dQ7UrzdGkf/42CaKvXWfyVnJaRe0BjprVV9usQpblfTfRKfwbvlWdlsW
         tkY3ZSP8mxmmrLWsTGfnNUQ48aOeulO/JmWRAxC2xn9NXy2XeyocWiawfe5IBl3OcCOz
         zkAOPwBs2F5S4C1aSjmiwUF02qZCPUe4dk7YxVNgVncVpM3CrzjpLy9CPOf4dFKF+onG
         lME9/s2JSq2cXWd/c35Vvvpn94lDqAtAJITwiMAsGvNJAg3fvrF72yvJw9gqI/CArBSB
         o0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546969; x=1732151769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJnPLBXDUWt9APABFP9RtiuQUlaLpT6eHtJy+a+Whyg=;
        b=LAUcCxL8dWhQXUVDj+rt9HTGcJQxPjN39qIoJDKo4utpCTfh8JyXwap3Zi+HvIY2D9
         luVSK2sdlOMggZ4RyYwZirK+uSzgW26AYtM04tKaGSJ4jC+jSJe+cmv/k/CMLexciI2V
         Vrj/r09AtvIsoEVjPsDARiuYPKMnxrYU7+JX71Ffkipa0wBW70WwGdjzHPRkFNibcgIh
         ltbqaqT0CYAkv4upZlObYjSZQ07ZGlLlcbfKeAXyA/bojz9wBJJcHRZPfx7Y0FwWdHHH
         kfmpCbopiFtwIYYOC7IcBs161v9Pqjsar5Fs7WyQKgx7aaRh8Rol6fFe+hwAag/UPWxw
         Dpzg==
X-Forwarded-Encrypted: i=1; AJvYcCXEtatOvEy9ahWTPRPOkLkSka5R6+XhQI8CqlMf+s1NzqyJ2pcFQT6a4Fi9iaDvRMLoFRODFV6jQk7USg==@linaro.org
X-Gm-Message-State: AOJu0Yz+0b7M/dYoh44TNjtr2etCZ2dlHwu/DUzfI+buEN6sK7pAD3IO
	DPwjb1bJAnF41HBUwqT3o74RqvQuO1VpCwOIjbwjDtUiyQRnXfsuSyUjXv5KZXMjcQ==
X-Google-Smtp-Source: AGHT+IFNRYI+6+k6hzZD/Oqm3sK6NGybQN7v5rJRv2V4XIRC72YBhh+g6R+IRQke+T79tc6rz4+9zg==
X-Received: by 2002:a05:600c:4fc5:b0:431:55f3:d34e with SMTP id 5b1f17b1804b1-432d9761bdcmr12005115e9.15.1731546969598;
        Wed, 13 Nov 2024 17:16:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da280018sm4774385e9.26.2024.11.13.17.16.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:16:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 22/24] exec/cpu-common: Move ram_addr_t related methods to 'exec/ram_addr.h'
Date: Thu, 14 Nov 2024 02:13:07 +0100
Message-ID: <20241114011310.3615-23-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I2pxjFEc9Q7+

Move methods related to the ram_addr_t type to
the specific "exec/ram_addr.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h        | 56 +-------------------------------
 include/exec/ram_addr.h          | 56 ++++++++++++++++++++++++++++++++
 include/exec/translation-block.h |  2 +-
 3 files changed, 58 insertions(+), 56 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 638dc806a5..b790202c56 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -54,61 +54,7 @@ enum device_endian {
 #define DEVICE_HOST_ENDIAN DEVICE_LITTLE_ENDIAN
 #endif
 
-/* address in the RAM (different from a physical address) */
-#if defined(CONFIG_XEN_BACKEND)
-typedef uint64_t ram_addr_t;
-#  define RAM_ADDR_MAX UINT64_MAX
-#  define RAM_ADDR_FMT "%" PRIx64
-#else
-typedef uintptr_t ram_addr_t;
-#  define RAM_ADDR_MAX UINTPTR_MAX
-#  define RAM_ADDR_FMT "%" PRIxPTR
-#endif
-
-/* memory API */
-
-void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
-/* This should not be used by devices.  */
-ram_addr_t qemu_ram_addr_from_host(void *ptr);
-ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
-RAMBlock *qemu_ram_block_by_name(const char *name);
-
-/*
- * Translates a host ptr back to a RAMBlock and an offset in that RAMBlock.
- *
- * @ptr: The host pointer to translate.
- * @round_offset: Whether to round the result offset down to a target page
- * @offset: Will be set to the offset within the returned RAMBlock.
- *
- * Returns: RAMBlock (or NULL if not found)
- *
- * By the time this function returns, the returned pointer is not protected
- * by RCU anymore.  If the caller is not within an RCU critical section and
- * does not hold the BQL, it must have other means of protecting the
- * pointer, such as a reference to the memory region that owns the RAMBlock.
- */
-RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
-                                   ram_addr_t *offset);
-ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host);
-void qemu_ram_set_idstr(RAMBlock *block, const char *name, DeviceState *dev);
-void qemu_ram_unset_idstr(RAMBlock *block);
-const char *qemu_ram_get_idstr(RAMBlock *rb);
-void *qemu_ram_get_host_addr(RAMBlock *rb);
-ram_addr_t qemu_ram_get_offset(RAMBlock *rb);
-ram_addr_t qemu_ram_get_used_length(RAMBlock *rb);
-ram_addr_t qemu_ram_get_max_length(RAMBlock *rb);
-bool qemu_ram_is_shared(RAMBlock *rb);
-bool qemu_ram_is_noreserve(RAMBlock *rb);
-bool qemu_ram_is_uf_zeroable(RAMBlock *rb);
-void qemu_ram_set_uf_zeroable(RAMBlock *rb);
-bool qemu_ram_is_migratable(RAMBlock *rb);
-void qemu_ram_set_migratable(RAMBlock *rb);
-void qemu_ram_unset_migratable(RAMBlock *rb);
-bool qemu_ram_is_named_file(RAMBlock *rb);
-int qemu_ram_get_fd(RAMBlock *rb);
-
-size_t qemu_ram_pagesize(RAMBlock *block);
-size_t qemu_ram_pagesize_largest(void);
+#include "exec/ram_addr.h"
 
 /**
  * cpu_address_space_init:
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 80f6dc7564..e0620ddb03 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -21,6 +21,62 @@
 
 #ifndef CONFIG_USER_ONLY
 
+/* address in the RAM (different from a physical address) */
+#if defined(CONFIG_XEN_BACKEND)
+typedef uint64_t ram_addr_t;
+#  define RAM_ADDR_MAX UINT64_MAX
+#  define RAM_ADDR_FMT "%" PRIx64
+#else
+typedef uintptr_t ram_addr_t;
+#  define RAM_ADDR_MAX UINTPTR_MAX
+#  define RAM_ADDR_FMT "%" PRIxPTR
+#endif
+
+/* memory API */
+
+void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
+/* This should not be used by devices.  */
+ram_addr_t qemu_ram_addr_from_host(void *ptr);
+ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr);
+RAMBlock *qemu_ram_block_by_name(const char *name);
+
+/*
+ * Translates a host ptr back to a RAMBlock and an offset in that RAMBlock.
+ *
+ * @ptr: The host pointer to translate.
+ * @round_offset: Whether to round the result offset down to a target page
+ * @offset: Will be set to the offset within the returned RAMBlock.
+ *
+ * Returns: RAMBlock (or NULL if not found)
+ *
+ * By the time this function returns, the returned pointer is not protected
+ * by RCU anymore.  If the caller is not within an RCU critical section and
+ * does not hold the BQL, it must have other means of protecting the
+ * pointer, such as a reference to the memory region that owns the RAMBlock.
+ */
+RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
+                                   ram_addr_t *offset);
+ram_addr_t qemu_ram_block_host_offset(RAMBlock *rb, void *host);
+void qemu_ram_set_idstr(RAMBlock *block, const char *name, DeviceState *dev);
+void qemu_ram_unset_idstr(RAMBlock *block);
+const char *qemu_ram_get_idstr(RAMBlock *rb);
+void *qemu_ram_get_host_addr(RAMBlock *rb);
+ram_addr_t qemu_ram_get_offset(RAMBlock *rb);
+ram_addr_t qemu_ram_get_used_length(RAMBlock *rb);
+ram_addr_t qemu_ram_get_max_length(RAMBlock *rb);
+bool qemu_ram_is_shared(RAMBlock *rb);
+bool qemu_ram_is_noreserve(RAMBlock *rb);
+bool qemu_ram_is_uf_zeroable(RAMBlock *rb);
+void qemu_ram_set_uf_zeroable(RAMBlock *rb);
+bool qemu_ram_is_migratable(RAMBlock *rb);
+void qemu_ram_set_migratable(RAMBlock *rb);
+void qemu_ram_unset_migratable(RAMBlock *rb);
+bool qemu_ram_is_named_file(RAMBlock *rb);
+int qemu_ram_get_fd(RAMBlock *rb);
+
+size_t qemu_ram_pagesize(RAMBlock *block);
+size_t qemu_ram_pagesize_largest(void);
+
 bool ramblock_is_pmem(RAMBlock *rb);
 
 long qemu_minrampagesize(void);
diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index b99afb0077..9c4757882c 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -8,7 +8,7 @@
 #define EXEC_TRANSLATION_BLOCK_H
 
 #include "qemu/thread.h"
-#include "exec/cpu-common.h"
+#include "exec/ram_addr.h"
 #include "exec/vaddr.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu/interval-tree.h"
-- 
2.45.2

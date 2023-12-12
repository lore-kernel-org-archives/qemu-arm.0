Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864464ejo;
        Tue, 12 Dec 2023 04:34:20 -0800 (PST)
X-Received: by 2002:a05:6512:128f:b0:50b:eee3:2391 with SMTP id u15-20020a056512128f00b0050beee32391mr3337279lfs.128.1702384460251;
        Tue, 12 Dec 2023 04:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384460; cv=none;
        d=google.com; s=arc-20160816;
        b=xiV906rtG9cai37x8uu5qVKvtV3SikDF3vKpqfgDJixkgfd1g+PsEcaUZAXrHVulo3
         SoymZ/oM4czU2nF2qRPRDkdmx0xRSd8GgrlKDyfc3qy57RSEkVC4B7cjJNdo+wN2Ofi2
         0A0a8bk+YPTHIn6wDUhVMtFczs4b35/g0u5lObH78+I8iTwmBa3K8O4GxMkxKuyeAySi
         JAhGnlth05vKoD8L0AQRK2FFhVJHk1TW5dcg4HX/uCFUN2KMD9UxbQrBUelD4Z/7WMkO
         ZX9yHtYvcLwtKGej5XYoFCs6x24WSqD4WB9Gck542j2Mw2sJ1lJVs8g0ryfPx955rt8l
         FPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NDQDiSIXlkgjP0mASXiCW1Z5PDJEfauay7W7xh/vCZQ=;
        fh=L9+xlWXyKm6KsUaf8nJ3E7Oku33KOKYECsFhykRkiiE=;
        b=sjjqIHT6tC2+UUbikMOKEwLnm/pkI4mClu/akIuCLkJ4E4cEJIpiDrFvYncSLGzmTZ
         QrBW5gw3PWh/ZvoC4kNKBlDlsfGCjuWEcXeWXQ2344u31GWvobySCLlpd3mMZLImLEPK
         RLZ9xwYe+vqpwC1A4hzHnZ7CXMMBUFtas7Bm9W/TyakL4oRq6Rh6nZYAhubMVFmAXqwI
         gHlLa5DPQ0qzHm3vImyQ7XbjoyCkr1jZmJu/MO93hMv1pO+/HrEgC96iInlOY1Ln/r7b
         dqigQ/JR0s/o4Dzk6GxBgmu4DGHKjG50tT3Btewwix5wUGkaZYtAmF3Qvns/dF5kXuvY
         1JVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/9v6VtL";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n17-20020a170906379100b00a1844763fcfsor2293281ejc.20.2023.12.12.04.34.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/9v6VtL";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384460; x=1702989260; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDQDiSIXlkgjP0mASXiCW1Z5PDJEfauay7W7xh/vCZQ=;
        b=b/9v6VtLrIsrNbMFKC/RLyOSRDkzo42YnZtylz9goQj0UCM5XSn+fZDvpPef+oL3rM
         vftr6Jjz1teVGShtkR08/mjA+Q5EmADUNK3J3Glw7BZEWI3DaAzs21b87W3x+1qnGZPM
         Kyge89f8bJfE41k+5i6iN8NZc05a22HFrzpKZMZUVxyOQ9wAQU8XNVJhUMoGKDw8q0Mm
         MtuEB2PGh5dyoMbfpv6cd0N/VAP+LYF+BTEQ750mO/5U1UMrmwAiX2EGBgBjeSxUZuBp
         ryWIFH6dD/4TzrxDDFPB8L/fO4tw16jmsfLT8jtaVdzt9/V05IIl9hJfl75YYRHGDGoc
         vVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384460; x=1702989260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDQDiSIXlkgjP0mASXiCW1Z5PDJEfauay7W7xh/vCZQ=;
        b=C9qiZy2RQOmTBRav5C9LWUogaLff9g3VQGhE7OYjdrXwCletcq/ChRZA83F4U3JGbA
         igsbQaB6Ag9mKVd5UE+d0rJs+qRRPRHv4KnGfAkWfJiQRF0+z+iTnctXCuvlyajXZ5UM
         ITCQEO7vnTTh3pnLNX0tzFF9PplCrCSQzlaEnV4nsd9AIVAU9dssexSdjkoDpUYoR5bg
         I1G/W7FGX9wav8o24Gbfu+nnnj6ou1hCh+e1eEHz1S1CPnv8U2o7uuvUg5d+W98HZxmU
         SJyMNNwOXFudVUg1KxuiOhdkVT6Zf8ikX299LyiTbKhj+1bRbyvunLRiifW0bMWpSOED
         NXiQ==
X-Gm-Message-State: AOJu0YxM27zRV5uafzVwdtdQysWAX1ggJKn89KmXUIRackoBk2mM+Jhc
	fVX3twWLmmCb95EWGkV70zWLsskf
X-Google-Smtp-Source: AGHT+IGrAKWazBmkRMdjtf5u/OosF1/95f731ICTz5WW04wb8ZG5X/7DPApb4EFzSdlFdmwtRgbyWw==
X-Received: by 2002:a17:906:74cf:b0:a1a:7568:1d4d with SMTP id z15-20020a17090674cf00b00a1a75681d4dmr3498417ejl.27.1702384459881;
        Tue, 12 Dec 2023 04:34:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ub27-20020a170907c81b00b00a1df4387f16sm6285128ejc.95.2023.12.12.04.34.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 02/23] exec: Expose 'target_page.h' API to user emulation
Date: Tue, 12 Dec 2023 13:33:38 +0100
Message-ID: <20231212123401.37493-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5lZWXOn4MEId

User-only objects might benefit from the "exec/target_page.h"
API, which allows to build some objects once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build      |  2 +-
 page-target.c    | 43 +++++++++++++++++++++++++++++++++++++++++++
 system/physmem.c | 35 -----------------------------------
 3 files changed, 44 insertions(+), 36 deletions(-)
 create mode 100644 page-target.c

diff --git a/meson.build b/meson.build
index d2c4c2adb3..5fdc4ef8db 100644
--- a/meson.build
+++ b/meson.build
@@ -3488,7 +3488,7 @@ if get_option('b_lto')
   pagevary = declare_dependency(link_with: pagevary)
 endif
 common_ss.add(pagevary)
-specific_ss.add(files('page-vary-target.c'))
+specific_ss.add(files('page-target.c', 'page-vary-target.c'))
 
 subdir('backends')
 subdir('disas')
diff --git a/page-target.c b/page-target.c
new file mode 100644
index 0000000000..d286e2d58b
--- /dev/null
+++ b/page-target.c
@@ -0,0 +1,43 @@
+/*
+ * QEMU page values getters (target independent)
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "exec/target_page.h"
+#include "exec/cpu-defs.h"
+#include "exec/cpu-all.h"
+
+size_t qemu_target_page_size(void)
+{
+    return TARGET_PAGE_SIZE;
+}
+
+int qemu_target_page_mask(void)
+{
+    return TARGET_PAGE_MASK;
+}
+
+int qemu_target_page_bits(void)
+{
+    return TARGET_PAGE_BITS;
+}
+
+int qemu_target_page_bits_min(void)
+{
+    return TARGET_PAGE_BITS_MIN;
+}
+
+/* Convert target pages to MiB (2**20). */
+size_t qemu_target_pages_to_MiB(size_t pages)
+{
+    int page_bits = TARGET_PAGE_BITS;
+
+    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
+    g_assert(page_bits < 20);
+
+    return pages >> (20 - page_bits);
+}
diff --git a/system/physmem.c b/system/physmem.c
index a63853a7bc..4bdb3d0592 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3422,41 +3422,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
     return 0;
 }
 
-/*
- * Allows code that needs to deal with migration bitmaps etc to still be built
- * target independent.
- */
-size_t qemu_target_page_size(void)
-{
-    return TARGET_PAGE_SIZE;
-}
-
-int qemu_target_page_mask(void)
-{
-    return TARGET_PAGE_MASK;
-}
-
-int qemu_target_page_bits(void)
-{
-    return TARGET_PAGE_BITS;
-}
-
-int qemu_target_page_bits_min(void)
-{
-    return TARGET_PAGE_BITS_MIN;
-}
-
-/* Convert target pages to MiB (2**20). */
-size_t qemu_target_pages_to_MiB(size_t pages)
-{
-    int page_bits = TARGET_PAGE_BITS;
-
-    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
-    g_assert(page_bits < 20);
-
-    return pages >> (20 - page_bits);
-}
-
 bool cpu_physical_memory_is_io(hwaddr phys_addr)
 {
     MemoryRegion*mr;
-- 
2.41.0

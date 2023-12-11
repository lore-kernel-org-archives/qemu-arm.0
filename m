Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp491921ejo;
        Mon, 11 Dec 2023 13:20:27 -0800 (PST)
X-Received: by 2002:a05:6512:406:b0:50b:f400:ab3 with SMTP id u6-20020a056512040600b0050bf4000ab3mr1476111lfk.108.1702329627256;
        Mon, 11 Dec 2023 13:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329627; cv=none;
        d=google.com; s=arc-20160816;
        b=I0ugHuoR4aKaGKxa6BBEQf+QsRiNstlMUMs90KsRLAZf6Rnh22kIEa39wOL42nxANu
         vDZtR7ltk3uCDecl5O8Oel07NX66eiUEpJbO8ZYjtai73hX8R79RBOS+YxRh/XuT37Hv
         77zglkQbyVyeVfcZgfyEx3dBSBu4X735dZuN4nRWZW7Ll7arfMj7QgjWO3lx6uJdaczk
         o5uEWdAAjG0F/fPZaA1xhD6s59MKr0WopdoMQHdIplPgKjFNWgurhVT34cZmTEEkzRRd
         8Oo9kIFp6SPAVtTBOvuloHG1eOhLI5uIf5qUGFCoKx6BH4iuLZl2VwwBwGa1yZ4JZcst
         lDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wgiAOK8BuLaD0cXDs62KfIAvV8sc/YA5HaZCqiUDiy0=;
        fh=jr6BeAjRBF2hKKiijQk6ZwQLKxSmFaSzke8XrKLKGCU=;
        b=a+/Rxme2L48hx8ZQbgJeefUpY1Pd3wA4m/fxLMXXGcZ5kSk0qSlnYo6wgzSq61YWBx
         yh5XpzSbGlD9/k3rh3AAmT3IbsJUxf/AhFbGLB3vEICwRuK+900rpfPr1AtaEP05b9tN
         5gXiuCBpltHgeMdq60C6GNjPl1fc5m6h6IC/KfnvgPROauzzLAQ1GlBvvTCdRXh3FRf+
         y8OOqjQmn1WBRLFdDNdM2DAurbCsFVB2BiM78GYipXl9ryXo7xgBNd940HwAJP8bj2OQ
         ANXFVc/UXWa5WB10l/pd4mjlsjV7ucDvRpmjvM4o5D6slvIXX7R+YwzFRPbLf6qzFMuO
         EAeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/UbsMqq";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i27-20020a198c5b000000b0050beaf49110sor1249302lfj.23.2023.12.11.13.20.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/UbsMqq";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329627; x=1702934427; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgiAOK8BuLaD0cXDs62KfIAvV8sc/YA5HaZCqiUDiy0=;
        b=q/UbsMqqzxHUclLfgoySLUllKJ1NQas9G+f4YabGlo65TGayC+Z6p5F40jFTZ3nuRK
         CQ6U5VSQfQsgdZ3eEOG4m03/QgrpCXwzCwMB0nYw0FDGKA0Tnkux4qMtgnNkf8AztzAY
         OQpAeFcfPaykw0PvHTwMb/o3prxgyfBn68tils/H7ouBz2foIPlJSN26J3lzqzKdbC0C
         Rzv2JXBmCpjxfaL+IyOwInEa+KIds9WC69dRpO5/Tyfn3aN0wKLSA+oEy3Hsxu24Dbsg
         i7OzzRFFaDdbQY+SKiGsTzS5vxLVgzqo85msWGOoMUpFWXACde+WYSzYFKxaPyTMVcJ9
         92yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329627; x=1702934427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgiAOK8BuLaD0cXDs62KfIAvV8sc/YA5HaZCqiUDiy0=;
        b=hSBodp4baZXLlzMLTfV+rHTQI8wPXfcImtZVO0H6Rq/Oh6p30KX0iGGbUFe6KcwkYv
         snDSor7b3MKo0KTwrBR/5yX1/hdP/EeFEWGtkhl74ZgCUYznYiUrm4oi8cueafrdR0st
         ldXSqm/F6fgLTErwpetx+tGqpN7r0D0if89Wc1JzPyVj96XmquGj+5wLwOkgi0r0yaV8
         XTpWwCPLtY7RsMa93KojcYHdtTZT4V2L/Sb3bkrh9NzUXbSOReM3eTtMpSvQI3fiWBH3
         LFt/YylmbC+SfbwLZbp89zIvvqjOWAejIxAJL5g323VjvPhJNA1F4zXPuFJPhaN8dC4p
         cIyQ==
X-Gm-Message-State: AOJu0YxbJFnOtkXhvDd3AicVHxDV8sfABSknoq2NwqKvPYbrggq5zttJ
	/szIPsCIePG5kLUtRABnZMEHppEJ
X-Google-Smtp-Source: AGHT+IEs4f16yITKu9ESGF3sYemei7SRIH+ratgBSuKGdsJp+f7TQSU4vhxmpbCTPj2yD2qXXhIKpQ==
X-Received: by 2002:ac2:5f59:0:b0:50b:f300:204 with SMTP id 25-20020ac25f59000000b0050bf3000204mr1399873lfz.70.1702329626915;
        Mon, 11 Dec 2023 13:20:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id cf8-20020a0564020b8800b0054cfef2fe21sm4026966edb.41.2023.12.11.13.20.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:20:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 02/24] exec: Expose 'target_page.h' API to user emulation
Date: Mon, 11 Dec 2023 22:19:39 +0100
Message-ID: <20231211212003.21686-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0aLmoN8TnSfK

User-only objects might benefit from the "exec/target_page.h"
API, which allows to build some objects once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

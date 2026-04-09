Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89123E98FA6
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 03:50:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAgPZ-0000dW-9Z; Wed, 08 Apr 2026 23:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPX-0000dC-PB
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPW-0003sJ-98
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:31 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2aaf59c4f7cso2285385ad.1
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 20:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775706629; x=1776311429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUCaCRnG5cO0Qr9pSbvI++qV5vg2E3jOIqFKVDItLZk=;
 b=X07824hQFj9JcH7/V4M2UnBihPQYMbVGo55YAle6lneHwfOcWZghk7CkBEa13QhYP7
 whtRIurIcoR0cn3yktSYCUDxOwXQO5i0vGfSVVBbXL0GIDqYTEWXSgsEFYMPSkNedTVd
 c63LDRoK6LQRG2dtwmpGPhwQFOxgX6ttUFtCl28mETWmcQU/cfANoyj/Hi3DKWUJGL+3
 jfJXlkrf/JBs3DIibZppkjbGiwHIDjWXRDPSimaTyhE4w754S/wURPdbWW+Sg5fby1tZ
 jO3MB/VFcT7fAUz5qpUee7Z116AMOlnNrwFWY8buq/W9fh1r6u3zvuUxDQaoo0TwxEmm
 AZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775706629; x=1776311429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BUCaCRnG5cO0Qr9pSbvI++qV5vg2E3jOIqFKVDItLZk=;
 b=fFlP12VH6D+Qq0J9Prlbygf7au6nAZrRtt8U/ph/1BXK7O0i/PWKDgRZufcLAIUwMY
 SOmdgWTnNpwY7qEn0lkLyIdhzFTi2CRnEEsaS/W712C69AsXS2AJc2RK1Ps8rdVllyxb
 advMBCH9daGOLheqkd7hRTlYo3mlpgQP5UIF2evo3oDZ1n6nWhNkXZclDX/KcK7oQiPG
 /aS8g0cCH0wkrSpkJnipSkxnYMatIgTAoDmfcUAyMkmUaxH6M5xDMVNogsELNO8Ul1Qc
 M/3LyqAXocB2Iqozdjo7n2eJvqY/6r05bKIjRagzimXHOPUNAKV1iZ6lJM36jByESNbe
 u4rA==
X-Gm-Message-State: AOJu0YzQ66CWRDmZKj/CpQI5ywwAbwbxaVK/TXjkkABEi6ecwWEIVtU+
 P4Zqo4CtBBGqVd8ggN8Htx+NXyIFd7TmyheMs1vLC5IdAxbkW+zQsmT7KBWqBhkycTA=
X-Gm-Gg: AeBDieuzq7+mZalNPXyXrepSgBxD57QnrmJt+fyIvDsy+GvQxbf5oTICHvPA2PaKehY
 3TCFMb7a2l5ORBJDS5QQwMliyi9YZKfZJ5ohJVQyq8ktMmUgoRptoomqawZKQODCt5I6j/Fpbz0
 iG8SEKB6WpKT9zI2/wstDoCBp0VoqkG/Y1iaIawlELWIUh+DPh8QYjUrF7VYZsrA7nOHz2QPNCq
 Zi04zW6jeHFN6PI+Hiq2/9AbvrI2EAnRkHTMVU0ezX85mptw6z2mq6xzX6LrIaFcn4d/dvn5PjD
 5XvNy/i8+bYRxfeQEv5o+3IZGlk7h0/FHmHruc+1DWoo/4ztzv+bbcTTGqNkS8jTQnVtds2s2qV
 7KIWa2W8lxqkv9QPeWqa630BoaMxOdRF2RT4Vtj22Fv+Izmaj3lDY85IfnBIOkA7MgtXMJOp0V0
 uwP7oo+GH96lFZ2R6NuiYIRZp0Js9mPIV8D0jW+FJ6QoTiOemLEZ/r10RM
X-Received: by 2002:a17:903:3804:b0:2b0:59c4:e9dc with SMTP id
 d9443c01a7336-2b28170f376mr252658085ad.22.1775706628778; 
 Wed, 08 Apr 2026 20:50:28 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm277830605ad.0.2026.04.08.20.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:50:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v2 2/7] target/arm: Only define aarch64_untagged_addr for
 aarch64
Date: Thu,  9 Apr 2026 13:50:10 +1000
Message-ID: <20260409035015.132370-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
References: <20260409035015.132370-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b62de8addf..35b661904f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,7 +2262,19 @@ static const char *arm_gdb_get_core_xml_file(CPUState *cs)
     return "arm-core.xml";
 }
 
-#ifdef CONFIG_USER_ONLY
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+
+static const struct SysemuCPUOps arm_sysemu_ops = {
+    .has_work = arm_cpu_has_work,
+    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
+    .asidx_from_attrs = arm_asidx_from_attrs,
+    .write_elf32_note = arm_cpu_write_elf32_note,
+    .write_elf64_note = arm_cpu_write_elf64_note,
+    .internal_is_big_endian = arm_cpu_internal_is_big_endian,
+    .legacy_vmsd = &vmstate_arm_cpu,
+};
+#elif defined(TARGET_AARCH64)
 /**
  * aarch64_untagged_addr:
  *
@@ -2286,18 +2298,6 @@ static vaddr aarch64_untagged_addr(CPUState *cs, vaddr x)
     }
     return x;
 }
-#else
-#include "hw/core/sysemu-cpu-ops.h"
-
-static const struct SysemuCPUOps arm_sysemu_ops = {
-    .has_work = arm_cpu_has_work,
-    .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
-    .asidx_from_attrs = arm_asidx_from_attrs,
-    .write_elf32_note = arm_cpu_write_elf32_note,
-    .write_elf64_note = arm_cpu_write_elf64_note,
-    .internal_is_big_endian = arm_cpu_internal_is_big_endian,
-    .legacy_vmsd = &vmstate_arm_cpu,
-};
 #endif
 
 #ifdef CONFIG_TCG
@@ -2340,7 +2340,9 @@ static const TCGCPUOps arm_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
     .record_sigbus = arm_cpu_record_sigbus,
+# ifdef TARGET_AARCH64
     .untagged_addr = aarch64_untagged_addr,
+# endif
 #else
     .tlb_fill_align = arm_cpu_tlb_fill_align,
     .pointer_wrap = aprofile_pointer_wrap,
-- 
2.43.0



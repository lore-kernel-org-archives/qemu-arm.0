Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636641ejb;
        Fri, 26 Apr 2024 12:42:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl/ve43XZNsd4UDbAzAlf2xbJydtCSr983efYaKcaV1Yw+Wsfnig+ijL+VeuKSGZpgDLh1/LA2JgyEqzwDuf+624rE6bbb
X-Google-Smtp-Source: AGHT+IHhqOzhpjnZPXrZ5w7mWk8Lq1TBiEIXR5QnvXIGxt3+EFCU+B4qi9OAYlkQ8DAsyJYAOLur
X-Received: by 2002:ac8:5f8d:0:b0:43a:7e2a:7ee with SMTP id j13-20020ac85f8d000000b0043a7e2a07eemr2545848qta.0.1714160572528;
        Fri, 26 Apr 2024 12:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160572; cv=none;
        d=google.com; s=arc-20160816;
        b=cBvRh+DWjQGMercaFdH7V56XGegw5sjwiNNVTqsdTVDQHYNMXgD3CpOkNh5aqEpiR+
         3J7n4GF04o8KKiLvqobj00dYhgva+6fYbfDBV3dw865jPUH8+wOkUPEzLsfRagHQTo69
         sxU4G0eouw9lg936mJp1al8gWoO1XWfAB5/GqT4j5alZKqQNnzEHsZVEMhq7Gy0kXb1a
         eo6sEmDgcY/7+ad8RvecYoaM2GTO1SfQwmyTMYg3Rqge9gpa8qIBgGPrpNjqYYuClyOu
         G3f+WiSgI1KG3vJca+oxIVuHlkB3+RoI9ddkZi8d/rNfcgGVFkPF3ai5ovp1rSpYigeS
         NIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S4r3G1A3uieLAlLtfe4V5hp04cU912Q1LgbF6VzVX8w=;
        fh=qazebhOlHzaBfxrU5INcXm/HHTlsf/tJJNQLTH50jKQ=;
        b=LCBsipjVqXCpsryuhng0S5VZoX5a4/+pPTMUL+pv8lArJ0P0yN7rk9xbfGpoSk9HhH
         xnpgeATNnecxbcEJXDeDXiFwx1jGK8jcQpGGh0pHEh89SLNqlrEMqmWelDEf9WVb64Yb
         sTlxRgZxB1hSQkuO3A7H0AHt1yRY3wb+N5U/yZVk20cmtjq6ezJHfiwBlhjd71G/4PmO
         WKSrrZKCcSWhiJuMeMrdDdDzra6LTnmqenh9Afn11Sm5oIENeCt6fvXm4tTujWP8O29g
         wWILF5IwSTgDgdiQZd4FPEu5TgJDh8yVfIU5Q4qrKVTNu5kmfNn9R8AM7SryH257ZjxY
         n6ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtYOCSNP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf21-20020a05622a609500b004346094de7dsi20491352qtb.338.2024.04.26.12.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtYOCSNP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RSw-0000XX-CQ; Fri, 26 Apr 2024 15:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSs-0000Nh-RL
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:34 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSp-0002q0-8w
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:34 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5176f217b7bso4408386e87.0
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160548; x=1714765348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4r3G1A3uieLAlLtfe4V5hp04cU912Q1LgbF6VzVX8w=;
 b=rtYOCSNPRvlTRkjO3j1jcvOoMrUCNJVjC34gA/YJ6U7r31pVKuFrOTp0gzobW5O91I
 zpdiq55+fWg+lWmYcy8of8j38ElSnSEyxWLNWvRf9ggs2Tv3AcHbnBonAtvk9fc19Zi5
 DVQyFckW1mu4GhW93/EbgwwZXT3XGUOtlc6GxVliT3+m5acn06H7DqWcXj4sEQrM/zwa
 R7G7hqyLIZ9Z71Dnogjta4WHlkSaYXbn3FYbj9axP1k8Zar38Zqz3Bjk84WwNFOueYHj
 imK0e6y0AbiTZ/Chhidv5ho9zV5Sl+mSaGtQEb02rGthluHd7psRihwrvZUI2kzM5ARV
 ZDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160548; x=1714765348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4r3G1A3uieLAlLtfe4V5hp04cU912Q1LgbF6VzVX8w=;
 b=dITBHzrtKZW12Bbu/XwSYcQHIexe184ErxCRipnBGnnn/N3ZLCa7pV4Zqyx7B7VryB
 0q3p3+hoxZH+ce2GYYdzY6w86b1K8qxBkZh5Aby07VC3Dh+1cIkoT+24NuDZjMfRb1/g
 whszlb66rq0n6Kc5sNhwcoASdE4msrBd/U2gmNlxZGiUA0qHih8b6iIARezndpyKCBnk
 XdTNzBqoio7j/9J3U02uF/17DtCuIrlTnv95OhN6NnpbTMe9QlJaUr80InMwwCwz2qhB
 xcG/7BleI5LjePdsHbSMbDY94eONGBLmbNPypW5KO0hnoMR2BM8WjfSOwOpDp4uEXsac
 CyOQ==
X-Gm-Message-State: AOJu0YwHSjkx8dfjwWOMoZhHoS5PP7nOlv0avt6DQUg8Ecjw+ty6pzeS
 9cwaS1+UQiNmAV7GpVYgb8MxfmptczFcDb5L+7J0N6px3a3S5DEJ6JKeTV2Szrs=
X-Received: by 2002:ac2:483c:0:b0:51c:5570:f570 with SMTP id
 28-20020ac2483c000000b0051c5570f570mr2916306lft.59.1714160548267; 
 Fri, 26 Apr 2024 12:42:28 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 r25-20020a170906351900b00a55b5c365dfsm6435433eja.199.2024.04.26.12.42.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 04/38] exec: Expose 'target_page.h' API to user emulation
Date: Fri, 26 Apr 2024 21:41:24 +0200
Message-ID: <20240426194200.43723-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pbhz/l0sx3r5

User-only objects might benefit from the "exec/target_page.h"
API, which allows to build some objects once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231211212003.21686-3-philmd@linaro.org>
---
 meson.build            |  2 +-
 page-target.c          | 44 ++++++++++++++++++++++++++++++++++++++++++
 system/physmem.c       | 30 ----------------------------
 target/target-common.c | 10 ----------
 target/meson.build     |  2 --
 5 files changed, 45 insertions(+), 43 deletions(-)
 create mode 100644 page-target.c
 delete mode 100644 target/target-common.c

diff --git a/meson.build b/meson.build
index 96fdc6dfd2..5db2dbc12e 100644
--- a/meson.build
+++ b/meson.build
@@ -3523,7 +3523,7 @@ if get_option('b_lto')
   pagevary = declare_dependency(link_with: pagevary)
 endif
 common_ss.add(pagevary)
-specific_ss.add(files('page-vary-target.c'))
+specific_ss.add(files('page-target.c', 'page-vary-target.c'))
 
 subdir('backends')
 subdir('disas')
diff --git a/page-target.c b/page-target.c
new file mode 100644
index 0000000000..82211c8593
--- /dev/null
+++ b/page-target.c
@@ -0,0 +1,44 @@
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
+#include "cpu.h"
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
index c3d04ca921..1a81c226ba 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3540,36 +3540,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
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
diff --git a/target/target-common.c b/target/target-common.c
deleted file mode 100644
index 903b10cfe4..0000000000
--- a/target/target-common.c
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-#include "qemu/osdep.h"
-
-#include "cpu.h"
-#include "exec/target_page.h"
-
-int qemu_target_page_mask(void)
-{
-    return TARGET_PAGE_MASK;
-}
diff --git a/target/meson.build b/target/meson.build
index 59b46b2ef4..1c2e6f2b19 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -18,5 +18,3 @@ subdir('sh4')
 subdir('sparc')
 subdir('tricore')
 subdir('xtensa')
-
-specific_ss.add(files('target-common.c'))
-- 
2.41.0


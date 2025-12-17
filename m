Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF703D6554E
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:35:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaa-00025z-QV; Wed, 17 Dec 2025 09:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsaZ-00023f-8x
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:33:15 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsaU-0007Gn-4R
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:33:14 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso36165315e9.2
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981982; x=1766586782; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npahtTZPNb59B+CU/KRSE/J9yiwWz2PKpOjmrQGOCdA=;
 b=g7Z3X3osHDGvLVW+0g5KjQMQj8GN1odZCDTdd8KzbhojdHwXGqd1SVPmnByP+aTL57
 CobuU3TNyOnH1ehCCXzpD+SAJzUtyUKrVArtVoHpQYF/QKOA8kbDrHlrfeN/7O+4THgt
 kfi61o1KZW/rU0R1g9TXx+Zs4efXOJ1knrRUBF4qHLHy4gQSUNRSBIGw0priWIulQRr1
 RBUlvLjbEXhHcSMpChP/m0gb6ZCviXRXrIAdQcHVapQ273lNWEQginTze+4JEH011oso
 W791bJAahRrkNYn4FQ7NlbkWa28qEum5m4+vprcexy2oNvmZlng6Lyb9siJ88V81rnnL
 nFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981982; x=1766586782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=npahtTZPNb59B+CU/KRSE/J9yiwWz2PKpOjmrQGOCdA=;
 b=PEADNeKNUG2dG0qdok0XpIU1RXIyAHqVBFiwXrQf1WBxL+OdOwkXgkdUUYlQBmNN4n
 pfMZNRG5b74uf4gofhI0Kyu6QhFwaG8NxRDdWeJUJb9gjFqD0YehmYYrHGGVVC6b5Vb0
 HuoyF1Fi/fdKMnJ8nhlGfzq0q8ZqHj7gldUSCnztSf9M25IJrUtlsG7An5wj/EBDuBkg
 bXQ0hFdLYh8qrGm7NERACQe/Rr151iox528tHazX+YrRf92nzYiUnjG3TpcA779T70EZ
 IbCOOgGmXEkYXnUlXrT4hhR9bsf5KZ2UFsJ2P3Z6A9QZauuRlXuKG4EWE8B0pLIPYzFR
 mSOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKJq1iT8AU4lwOAcoLiJ9LpmBbn9TASsO5Pydilc8G7VQlxkPuv/vkZYw/m5s9vkejg4exfehDEA==@nongnu.org
X-Gm-Message-State: AOJu0Yzb71/CiSRG4WeHFi0R0JJGzirAWZPsRti4pzBq7OM8qRbWXvPQ
 QsbN0lh0Iic2FldU5aSGI+faz8QJoWsjuurx6wvdLkafvBXF4e/Ry/W6vtBG/x14yuw=
X-Gm-Gg: AY/fxX7tm23XD3czJJMCj4dZXGAC7NI8Lku6jHWSVTDWG1YbXNNtu4MpQnnRxtZtYhT
 jCUJb/tUf7lmbdJum06pYeWbOIMm9ERL4jSqdCtzfvNbhfUp5t5bHf+z9Ln7dqelUeofLycAXMw
 UcTApLJkTNIAkwWHz0/9O+WGS8traJopx+DRV7mkiq5sRaCy1trJT75vhb9SZtGCRhhEhE2edN2
 PXYSNqHb4z2SrTFD8p7rGaH1xT6oyXdJi4Mx3ET8wJoJwZUFV5lUWTXhuP1AytZoBH6U87fIPLr
 ydNvnmtsZ/impa6swxy3AN7+iQPNxXkSIJHSn6A/3ctwCN5gV152Jht7jth8gflXooE90f4vBYH
 XU2lq6YUkHSpH+GT8QBFpT4FTVyXW+AqMhywGXld66EL+9nmMonmzKQ+yQAtpyCo3f2IFMxjugB
 aiB7CFJEzkAigdnHTSuihTi5uGmZw2Snwooh+k0m/UAwRugIzV+W80nxMgomc8
X-Google-Smtp-Source: AGHT+IFz4aB2FClE+JBr9xpGXt0+LxuKd8VzhrJ8yc0DmbmXqBBLLPlemFmogH3RTY8odeSjZ8qLpg==
X-Received: by 2002:a05:600c:8b61:b0:477:6d96:b3ca with SMTP id
 5b1f17b1804b1-47a8f89b69fmr211658035e9.5.1765981982100; 
 Wed, 17 Dec 2025 06:33:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ada846bsm5016541f8f.9.2025.12.17.06.33.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:33:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 09/14] system/memory: Define address_space_ldst[W] endian
 variants via template
Date: Wed, 17 Dec 2025 15:31:45 +0100
Message-ID: <20251217143150.94463-10-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Like we do for other LD/ST APIs, use one template to declare and
define all endianness variants of the address_space_lduw() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                                  |  2 +
 include/exec/memory_ldst.h.inc               | 21 ++++----
 include/exec/memory_ldst_phys.h.inc          | 45 ++++------------
 include/system/memory_ldst_endian.h.inc      | 25 +++++++++
 include/system/memory_ldst_phys_endian.h.inc | 37 ++++++++++++++
 system/memory_ldst.c.inc                     | 54 +++++---------------
 system/memory_ldst_endian.c.inc              | 42 +++++++++++++++
 7 files changed, 136 insertions(+), 90 deletions(-)
 create mode 100644 include/system/memory_ldst_endian.h.inc
 create mode 100644 include/system/memory_ldst_phys_endian.h.inc
 create mode 100644 system/memory_ldst_endian.c.inc

diff --git a/MAINTAINERS b/MAINTAINERS
index c299b84d418..41a45904cd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3256,6 +3256,7 @@ F: include/system/ioport.h
 F: include/exec/memop.h
 F: include/system/memory.h
 F: include/system/memory_cached.h
+F: include/system/memory_ldst*
 F: include/system/physmem.h
 F: include/system/ram_addr.h
 F: include/system/ramblock.h
@@ -3265,6 +3266,7 @@ F: system/ioport.c
 F: system/memory.c
 F: system/memory_mapping.c
 F: system/physmem.c
+F: system/memory_ldst*
 F: system/memory-internal.h
 F: system/ram-block-attributes.c
 F: scripts/coccinelle/memory-region-housekeeping.cocci
diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 173164fee3a..73c0366a247 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -19,24 +19,16 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint32_t glue(address_space_ldl_be, SUFFIX)(ARG1_DECL,
@@ -47,10 +39,6 @@ uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stb, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result);
-void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
-void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
@@ -60,6 +48,15 @@ void glue(address_space_stq_le, SUFFIX)(ARG1_DECL,
 void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 
+#define ENDIANNESS
+#include "system/memory_ldst_endian.h.inc"
+
+#define ENDIANNESS              _le
+#include "system/memory_ldst_endian.h.inc"
+
+#define ENDIANNESS              _be
+#include "system/memory_ldst_endian.h.inc"
+
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index db67de75251..71c2e64ff0f 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -19,12 +19,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-static inline uint16_t glue(lduw_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
-{
-    return glue(address_space_lduw, SUFFIX)(ARG1, addr,
-                                            MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 static inline uint32_t glue(ldl_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldl, SUFFIX)(ARG1, addr,
@@ -37,12 +31,6 @@ static inline uint64_t glue(ldq_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                            MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
-{
-    glue(address_space_stw, SUFFIX)(ARG1, addr, val,
-                                    MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 static inline void glue(stl_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
 {
     glue(address_space_stl, SUFFIX)(ARG1, addr, val,
@@ -61,18 +49,6 @@ static inline uint8_t glue(ldub_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
                                             MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline uint16_t glue(lduw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
-{
-    return glue(address_space_lduw_le, SUFFIX)(ARG1, addr,
-                                               MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-static inline uint16_t glue(lduw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
-{
-    return glue(address_space_lduw_be, SUFFIX)(ARG1, addr,
-                                               MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 static inline uint32_t glue(ldl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr)
 {
     return glue(address_space_ldl_le, SUFFIX)(ARG1, addr,
@@ -103,18 +79,6 @@ static inline void glue(stb_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint8_t val)
                                     MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
-static inline void glue(stw_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
-{
-    glue(address_space_stw_le, SUFFIX)(ARG1, addr, val,
-                                       MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
-static inline void glue(stw_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint16_t val)
-{
-    glue(address_space_stw_be, SUFFIX)(ARG1, addr, val,
-                                       MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 static inline void glue(stl_le_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint32_t val)
 {
     glue(address_space_stl_le, SUFFIX)(ARG1, addr, val,
@@ -139,6 +103,15 @@ static inline void glue(stq_be_phys, SUFFIX)(ARG1_DECL, hwaddr addr, uint64_t va
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 }
 
+#define ENDIANNESS
+#include "system/memory_ldst_phys_endian.h.inc"
+
+#define ENDIANNESS  _le
+#include "system/memory_ldst_phys_endian.h.inc"
+
+#define ENDIANNESS  _be
+#include "system/memory_ldst_phys_endian.h.inc"
+
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
diff --git a/include/system/memory_ldst_endian.h.inc b/include/system/memory_ldst_endian.h.inc
new file mode 100644
index 00000000000..4efd7f19f7e
--- /dev/null
+++ b/include/system/memory_ldst_endian.h.inc
@@ -0,0 +1,25 @@
+/*
+ *  Physical memory access endian templates
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *  Copyright (c) 2015 Linaro, Inc.
+ *  Copyright (c) 2016 Red Hat, Inc.
+ *  Copyright (c) 2025 Linaro Ltd.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#define ADDRESS_SPACE_LD(size) \
+    glue(glue(address_space_ld, size), glue(ENDIANNESS, SUFFIX))
+#define ADDRESS_SPACE_ST(size) \
+    glue(glue(address_space_st, size), glue(ENDIANNESS, SUFFIX))
+
+uint16_t ADDRESS_SPACE_LD(uw)(ARG1_DECL, hwaddr addr,
+                              MemTxAttrs attrs, MemTxResult *result);
+void ADDRESS_SPACE_ST(w)(ARG1_DECL, hwaddr addr, uint16_t val,
+                         MemTxAttrs attrs, MemTxResult *result);
+
+#undef ADDRESS_SPACE_LD
+#undef ADDRESS_SPACE_ST
+
+#undef ENDIANNESS
diff --git a/include/system/memory_ldst_phys_endian.h.inc b/include/system/memory_ldst_phys_endian.h.inc
new file mode 100644
index 00000000000..6c00edc2148
--- /dev/null
+++ b/include/system/memory_ldst_phys_endian.h.inc
@@ -0,0 +1,37 @@
+/*
+ *  Physical memory access endian templates
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *  Copyright (c) 2015 Linaro, Inc.
+ *  Copyright (c) 2016 Red Hat, Inc.
+ *  Copyright (c) 2025 Linaro Ltd.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#define LD_PHYS(size) \
+    glue(glue(ld, size), glue(ENDIANNESS, glue(_phys, SUFFIX)))
+#define ADDRESS_SPACE_LD(size) \
+    glue(glue(address_space_ld, size), glue(ENDIANNESS, SUFFIX))
+
+#define ST_PHYS(size) \
+    glue(glue(st, size), glue(ENDIANNESS, glue(_phys, SUFFIX)))
+#define ADDRESS_SPACE_ST(size) \
+    glue(glue(address_space_st, size), glue(ENDIANNESS, SUFFIX))
+
+static inline uint16_t LD_PHYS(uw)(ARG1_DECL, hwaddr addr)
+{
+    return ADDRESS_SPACE_LD(uw)(ARG1, addr, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+static inline void ST_PHYS(w)(ARG1_DECL, hwaddr addr, uint16_t val)
+{
+    ADDRESS_SPACE_ST(w)(ARG1, addr, val, MEMTXATTRS_UNSPECIFIED, NULL);
+}
+
+#undef LD_PHYS
+#undef ST_PHYS
+#undef ADDRESS_SPACE_LD
+#undef ADDRESS_SPACE_ST
+
+#undef ENDIANNESS
diff --git a/system/memory_ldst.c.inc b/system/memory_ldst.c.inc
index d5776678edf..c37a07b4f4a 100644
--- a/system/memory_ldst.c.inc
+++ b/system/memory_ldst.c.inc
@@ -240,27 +240,6 @@ static inline uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     return val;
 }
 
-uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
-                                                     DEVICE_NATIVE_ENDIAN);
-}
-
-uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
-                                                     DEVICE_LITTLE_ENDIAN);
-}
-
-uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
-                                       DEVICE_BIG_ENDIAN);
-}
-
 /* warning: addr must be aligned */
 static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs,
@@ -401,27 +380,6 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
     RCU_READ_UNLOCK();
 }
 
-void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
-                                             DEVICE_NATIVE_ENDIAN);
-}
-
-void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
-                                             DEVICE_LITTLE_ENDIAN);
-}
-
-void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
-                               DEVICE_BIG_ENDIAN);
-}
-
 static inline void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs,
     MemTxResult *result, enum device_endian endian)
@@ -486,6 +444,18 @@ void glue(address_space_stq_be, SUFFIX)(ARG1_DECL,
                                              DEVICE_BIG_ENDIAN);
 }
 
+#define ENDIANNESS
+#define DEVICE_ENDIANNESS       DEVICE_NATIVE_ENDIAN
+#include "memory_ldst_endian.c.inc"
+
+#define ENDIANNESS              _le
+#define DEVICE_ENDIANNESS       DEVICE_LITTLE_ENDIAN
+#include "memory_ldst_endian.c.inc"
+
+#define ENDIANNESS              _be
+#define DEVICE_ENDIANNESS       DEVICE_BIG_ENDIAN
+#include "memory_ldst_endian.c.inc"
+
 #undef ARG1_DECL
 #undef ARG1
 #undef SUFFIX
diff --git a/system/memory_ldst_endian.c.inc b/system/memory_ldst_endian.c.inc
new file mode 100644
index 00000000000..8aa6ebeebb2
--- /dev/null
+++ b/system/memory_ldst_endian.c.inc
@@ -0,0 +1,42 @@
+/*
+ *  Physical memory access endian templates
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *  Copyright (c) 2015 Linaro, Inc.
+ *  Copyright (c) 2016 Red Hat, Inc.
+ *  Copyright (c) 2025 Linaro Ltd.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#define ADDRESS_SPACE_LD(size) \
+    glue(glue(address_space_ld, size), glue(ENDIANNESS, SUFFIX))
+#define ADDRESS_SPACE_LD_INTERNAL(size) \
+    glue(glue(address_space_ld, size), glue(_internal, SUFFIX))
+
+#define ADDRESS_SPACE_ST(size) \
+    glue(glue(address_space_st, size), glue(ENDIANNESS, SUFFIX))
+#define ADDRESS_SPACE_ST_INTERNAL(size) \
+    glue(glue(address_space_st, size), glue(_internal, SUFFIX))
+
+uint16_t ADDRESS_SPACE_LD(uw)(ARG1_DECL, hwaddr addr,
+                              MemTxAttrs attrs, MemTxResult *result)
+{
+    return ADDRESS_SPACE_LD_INTERNAL(uw)(ARG1, addr, attrs, result,
+                                         DEVICE_ENDIANNESS);
+}
+
+void ADDRESS_SPACE_ST(w)(ARG1_DECL, hwaddr addr, uint16_t val,
+                         MemTxAttrs attrs, MemTxResult *result)
+{
+    ADDRESS_SPACE_ST_INTERNAL(w)(ARG1, addr, val, attrs, result,
+                                 DEVICE_ENDIANNESS);
+}
+
+#undef ADDRESS_SPACE_LD
+#undef ADDRESS_SPACE_LD_INTERNAL
+#undef ADDRESS_SPACE_ST
+#undef ADDRESS_SPACE_ST_INTERNAL
+
+#undef ENDIANNESS
+#undef DEVICE_ENDIANNESS
-- 
2.52.0



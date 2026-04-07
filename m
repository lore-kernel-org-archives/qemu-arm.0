Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908CA10F996A
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:47:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXsI-0006cV-VZ; Wed, 08 Apr 2026 14:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAXrI-0005YI-Bt
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:42:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoK-0000lp-Hj
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so30000795ad.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600535; x=1776205335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zw7oDmqglvqKl8+MyBKQqhDwyqmly7OMJWrGEtetrjU=;
 b=LdoOnDkjiG4zWUvc317baa3BiHDwtF6HPL+Il99oL/w6RITmqgGpb3nKejZ4GhgZj/
 RJ7P7a2M9X8uVYVxobm1FBiNmherKDXNe4xI3i0We5ypy++z7YmYloj5tyxslo90pxqR
 Uduu+UPoxWIYYE/qi4x8rM5UaEjMOreLV131iS5zpdYCJfTbqHkbxKA4/uf8qr1kV7sJ
 xd8oSvKshssIHL7zatE5iuci83HbrNIY1U/WUZn9UH3ZyODxN9ZcXC4h6B5dZbrzS8PM
 lbY4/xoSPu5DAc9aDmHC3dFLzTw06UoOLpjkkGzW0nBrot81WyxxxXTTn30wGNMULkAU
 aMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600535; x=1776205335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zw7oDmqglvqKl8+MyBKQqhDwyqmly7OMJWrGEtetrjU=;
 b=JdlwBGbzOTONlrAWsRvwH4vf+yyQvuwSNe0Xu9YZxx8QT3nOPvDHGoqadVElslsIel
 Pwhd7tn3BdvB7D0XUm2P1vml15tusuQqfW8PWnQBIrrXv5TQWbGWjXh9cUzI7I2zymHA
 6QJT/KoWgqlGFVNWPczxOQ5738aBh37WnDQX0YRAeCqTo2hGCi4mP9NAb913mvjQBOiS
 FYh4cH9jVGcX2RPNoRdxGtrZwdzlWssg3obWDqZA53eTGsInbpMpzrqQ2hruM/y9vmaW
 Mh0mP2C+6ot8B3QqOmt14ubFocjPZZBwI2fRgmiBkAagQpjEQyA1YES5156iRgTqGBTE
 A4Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPhtc5meI5F1uo++aqLI3OFCyFFoExBG2kzbPeSd5YMav9wh0GJZ7pja8I+QwCLx0nB/yC1+qS+A==@nongnu.org
X-Gm-Message-State: AOJu0YyE/5PMcrvSSrsfFN7CYRXbTG4WanTidl6gOUCuJ2VwOM0q1g01
 4AEd0IT0sPmVS4O7rLHRROICCVG2qR3XrSySsyryFFfCglZR3lvaHdO17wMJPbr9SPk=
X-Gm-Gg: AeBDievEu1ZZx9o2lgLiJdYN5y1LTN3mVxhcBvmZvjVVFRcYkIzcVg+fWhvNxpktSDM
 tQjQwOZeU7vyNNy/L0Pt+IN4FbrwT2S68b2MmCymW5kc4CDvuTFgI/BJ7+vOtukucxJWhcF+esX
 9c9cfIU9J7kJLSzoaM4yG9TsKAlAEnmUs/0VoCeK5wrG276ynzE/3KryHkvLROa5eRYUYdgNGsE
 drpCKnXqDtOuvLIYCmDsfURPkU8F1itLeskiOZfSsQ1URAg7cIy+0xZIo0qFLnPoJMJEGru9LMf
 UimKsPj38+eAKY38Z4BycBzWbrRBDlL6PCr8RKjlo+q1NTdFgmuShBhJdMaIXzz/rO9hdCsqmSe
 dukQIr3GHzaJyh+PojqAcoQBB5prQuoJ6WNdoQY5DX2XMQoOGhehDtcGCL3x5ZKJn6T3nRF9Enw
 7j/tDbT7kE/aF8lo7J+mIpVTA7DJVZ99tHEJDLIiLpb/ofOu5BFWyJ2VTTZdPBGmNtV7jIvKkcD
 7Hy
X-Received: by 2002:a17:902:ffcf:b0:2b2:b117:1d5d with SMTP id
 d9443c01a7336-2b2b11721a4mr34768015ad.33.1775600534949; 
 Tue, 07 Apr 2026 15:22:14 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 01/21] include/tcg/tcg-op: extract memory operations to
 tcg-op-mem.h
Date: Tue,  7 Apr 2026 15:21:48 -0700
Message-ID: <20260407222208.271838-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62f.google.com
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

This new header defines a new type for target virtual address,
independent from TCGv and is parameterized by a new define
TCG_ADDRESS_BITS (name was suggested by Paolo instead of
TARGET_ADDRESS_BITS).

By default, tcg-op.h include set this define to TARGET_LONG_BITS, but
it's also possible to include only tcg-op-common.h and tcg-op-mem.h and
set TCG_ADDRESS_BITS manually, which is what next commits will do.

We preserve existing MIT license when extracting this new header.

Implemented from:
https://lore.kernel.org/qemu-devel/a68321f0-3d54-4909-864c-9793cda05b2a@linaro.org/

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op-mem.h | 126 +++++++++++++++++++++++++++++++++++++++
 include/tcg/tcg-op.h     | 100 +------------------------------
 2 files changed, 129 insertions(+), 97 deletions(-)
 create mode 100644 include/tcg/tcg-op-mem.h

diff --git a/include/tcg/tcg-op-mem.h b/include/tcg/tcg-op-mem.h
new file mode 100644
index 00000000000..36931d1dd57
--- /dev/null
+++ b/include/tcg/tcg-op-mem.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Target dependent memory related functions.
+ *
+ * Copyright (c) 2008 Fabrice Bellard
+ */
+
+#ifndef TCG_TCG_OP_MEM_H
+#define TCG_TCG_OP_MEM_H
+
+#ifndef TCG_ADDRESS_BITS
+#error TCG_ADDRESS_BITS must be defined
+#endif
+
+#if TCG_ADDRESS_BITS == 32
+typedef TCGv_i32 TCGv_va;
+#define TCG_TYPE_VA TCG_TYPE_I32
+#define tcgv_va_temp tcgv_i32_temp
+#define tcgv_va_temp_new tcg_temp_new_i32
+#elif TCG_ADDRESS_BITS == 64
+typedef TCGv_i64 TCGv_va;
+#define TCG_TYPE_VA TCG_TYPE_I64
+#define tcgv_va_temp tcgv_i64_temp
+#define tcgv_va_temp_new tcg_temp_new_i64
+#else
+#error
+#endif
+
+static inline void
+tcg_gen_qemu_ld_i32(TCGv_i32 v, TCGv_va a, TCGArg i, MemOp m)
+{
+    tcg_gen_qemu_ld_i32_chk(v, tcgv_va_temp(a), i, m, TCG_TYPE_VA);
+}
+
+static inline void
+tcg_gen_qemu_st_i32(TCGv_i32 v, TCGv_va a, TCGArg i, MemOp m)
+{
+    tcg_gen_qemu_st_i32_chk(v, tcgv_va_temp(a), i, m, TCG_TYPE_VA);
+}
+
+static inline void
+tcg_gen_qemu_ld_i64(TCGv_i64 v, TCGv_va a, TCGArg i, MemOp m)
+{
+    tcg_gen_qemu_ld_i64_chk(v, tcgv_va_temp(a), i, m, TCG_TYPE_VA);
+}
+
+static inline void
+tcg_gen_qemu_st_i64(TCGv_i64 v, TCGv_va a, TCGArg i, MemOp m)
+{
+    tcg_gen_qemu_st_i64_chk(v, tcgv_va_temp(a), i, m, TCG_TYPE_VA);
+}
+
+static inline void
+tcg_gen_qemu_ld_i128(TCGv_i128 v, TCGv_va a, TCGArg i, MemOp m)
+{
+    tcg_gen_qemu_ld_i128_chk(v, tcgv_va_temp(a), i, m, TCG_TYPE_VA);
+}
+
+static inline void
+tcg_gen_qemu_st_i128(TCGv_i128 v, TCGv_va a, TCGArg i, MemOp m)
+{
+    tcg_gen_qemu_st_i128_chk(v, tcgv_va_temp(a), i, m, TCG_TYPE_VA);
+}
+
+#define DEF_ATOMIC2(N, S)                                               \
+    static inline void N##_##S(TCGv_##S r, TCGv_va a, TCGv_##S v,       \
+                               TCGArg i, MemOp m)                       \
+    { N##_##S##_chk(r, tcgv_va_temp(a), v, i, m, TCG_TYPE_VA); }
+
+#define DEF_ATOMIC3(N, S)                                               \
+    static inline void N##_##S(TCGv_##S r, TCGv_va a, TCGv_##S o,       \
+                               TCGv_##S n, TCGArg i, MemOp m)           \
+    { N##_##S##_chk(r, tcgv_va_temp(a), o, n, i, m, TCG_TYPE_VA); }
+
+DEF_ATOMIC3(tcg_gen_atomic_cmpxchg, i32)
+DEF_ATOMIC3(tcg_gen_atomic_cmpxchg, i64)
+DEF_ATOMIC3(tcg_gen_atomic_cmpxchg, i128)
+
+DEF_ATOMIC3(tcg_gen_nonatomic_cmpxchg, i32)
+DEF_ATOMIC3(tcg_gen_nonatomic_cmpxchg, i64)
+DEF_ATOMIC3(tcg_gen_nonatomic_cmpxchg, i128)
+
+DEF_ATOMIC2(tcg_gen_atomic_xchg, i32)
+DEF_ATOMIC2(tcg_gen_atomic_xchg, i64)
+DEF_ATOMIC2(tcg_gen_atomic_xchg, i128)
+
+DEF_ATOMIC2(tcg_gen_atomic_fetch_add, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_add, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_and, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_and, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_and, i128)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_or, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_or, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_or, i128)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_xor, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_xor, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_smin, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_smin, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_umin, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_umin, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_smax, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_smax, i64)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_umax, i32)
+DEF_ATOMIC2(tcg_gen_atomic_fetch_umax, i64)
+
+DEF_ATOMIC2(tcg_gen_atomic_add_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_add_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_and_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_and_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_or_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_or_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_xor_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_xor_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_smin_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_smin_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_umin_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_umin_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_smax_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_smax_fetch, i64)
+DEF_ATOMIC2(tcg_gen_atomic_umax_fetch, i32)
+DEF_ATOMIC2(tcg_gen_atomic_umax_fetch, i64)
+
+#undef DEF_ATOMIC2
+#undef DEF_ATOMIC3
+
+#endif /* TCG_TCG_OP_MEM_H */
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 7024be938e6..96a5af1a298 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -16,6 +16,9 @@
 #error must include QEMU headers
 #endif
 
+#define TCG_ADDRESS_BITS TARGET_LONG_BITS
+#include "tcg/tcg-op-mem.h"
+
 #if TARGET_LONG_BITS == 32
 # define TCG_TYPE_TL  TCG_TYPE_I32
 #elif TARGET_LONG_BITS == 64
@@ -46,103 +49,6 @@ typedef TCGv_i64 TCGv;
 #error Unhandled TARGET_LONG_BITS value
 #endif
 
-static inline void
-tcg_gen_qemu_ld_i32(TCGv_i32 v, TCGv a, TCGArg i, MemOp m)
-{
-    tcg_gen_qemu_ld_i32_chk(v, tcgv_tl_temp(a), i, m, TCG_TYPE_TL);
-}
-
-static inline void
-tcg_gen_qemu_st_i32(TCGv_i32 v, TCGv a, TCGArg i, MemOp m)
-{
-    tcg_gen_qemu_st_i32_chk(v, tcgv_tl_temp(a), i, m, TCG_TYPE_TL);
-}
-
-static inline void
-tcg_gen_qemu_ld_i64(TCGv_i64 v, TCGv a, TCGArg i, MemOp m)
-{
-    tcg_gen_qemu_ld_i64_chk(v, tcgv_tl_temp(a), i, m, TCG_TYPE_TL);
-}
-
-static inline void
-tcg_gen_qemu_st_i64(TCGv_i64 v, TCGv a, TCGArg i, MemOp m)
-{
-    tcg_gen_qemu_st_i64_chk(v, tcgv_tl_temp(a), i, m, TCG_TYPE_TL);
-}
-
-static inline void
-tcg_gen_qemu_ld_i128(TCGv_i128 v, TCGv a, TCGArg i, MemOp m)
-{
-    tcg_gen_qemu_ld_i128_chk(v, tcgv_tl_temp(a), i, m, TCG_TYPE_TL);
-}
-
-static inline void
-tcg_gen_qemu_st_i128(TCGv_i128 v, TCGv a, TCGArg i, MemOp m)
-{
-    tcg_gen_qemu_st_i128_chk(v, tcgv_tl_temp(a), i, m, TCG_TYPE_TL);
-}
-
-#define DEF_ATOMIC2(N, S)                                               \
-    static inline void N##_##S(TCGv_##S r, TCGv a, TCGv_##S v,          \
-                               TCGArg i, MemOp m)                       \
-    { N##_##S##_chk(r, tcgv_tl_temp(a), v, i, m, TCG_TYPE_TL); }
-
-#define DEF_ATOMIC3(N, S)                                               \
-    static inline void N##_##S(TCGv_##S r, TCGv a, TCGv_##S o,          \
-                               TCGv_##S n, TCGArg i, MemOp m)           \
-    { N##_##S##_chk(r, tcgv_tl_temp(a), o, n, i, m, TCG_TYPE_TL); }
-
-DEF_ATOMIC3(tcg_gen_atomic_cmpxchg, i32)
-DEF_ATOMIC3(tcg_gen_atomic_cmpxchg, i64)
-DEF_ATOMIC3(tcg_gen_atomic_cmpxchg, i128)
-
-DEF_ATOMIC3(tcg_gen_nonatomic_cmpxchg, i32)
-DEF_ATOMIC3(tcg_gen_nonatomic_cmpxchg, i64)
-DEF_ATOMIC3(tcg_gen_nonatomic_cmpxchg, i128)
-
-DEF_ATOMIC2(tcg_gen_atomic_xchg, i32)
-DEF_ATOMIC2(tcg_gen_atomic_xchg, i64)
-DEF_ATOMIC2(tcg_gen_atomic_xchg, i128)
-
-DEF_ATOMIC2(tcg_gen_atomic_fetch_add, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_add, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_and, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_and, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_and, i128)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_or, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_or, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_or, i128)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_xor, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_xor, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_smin, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_smin, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_umin, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_umin, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_smax, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_smax, i64)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_umax, i32)
-DEF_ATOMIC2(tcg_gen_atomic_fetch_umax, i64)
-
-DEF_ATOMIC2(tcg_gen_atomic_add_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_add_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_and_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_and_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_or_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_or_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_xor_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_xor_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_smin_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_smin_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_umin_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_umin_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_smax_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_smax_fetch, i64)
-DEF_ATOMIC2(tcg_gen_atomic_umax_fetch, i32)
-DEF_ATOMIC2(tcg_gen_atomic_umax_fetch, i64)
-
-#undef DEF_ATOMIC2
-#undef DEF_ATOMIC3
-
 #if TARGET_LONG_BITS == 64
 #define tcg_gen_movi_tl tcg_gen_movi_i64
 #define tcg_gen_mov_tl tcg_gen_mov_i64
-- 
2.47.3



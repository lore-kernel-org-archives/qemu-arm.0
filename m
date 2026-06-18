Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927F0CD98F6
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:08:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa42M-0000ta-IC; Thu, 18 Jun 2026 00:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42I-0000rF-PJ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42H-00045A-Ag
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:26 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-37ce68a54f8so131886a91.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781755643; x=1782360443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+G/PsSFawEHy7d66EG+jTgLqZ6ndIAaOYB9EFVfxJA=;
 b=Otd1RdcHWINHWSJHhTAC8LJnFt8OwkYoy/1hfAPlSym5a/yGgAjaoL6UUFLtzNcf+X
 0c+8GzhUcnvHZIxSJRSQ84n76/p0EZ9RHvBsbyZwJ7Cykh75E1VTm9DiM+7xH1aBsup/
 u3r7JfRPUegGeNNFBo6dLCM+qOjtMnA/zbo3LNJdf4jH+EvS/kog1KYB0K+wc40hJC+4
 ie9GZE3QlEh3em1T2VVOqwDbbq7rlEa9OsxGf9Sg/8909aIpE6fL0lHzn00YulktluPp
 UY32e7P7flLWHVv4J+rn6BCq05lhGtJvIc9e+esZpY7zCZ+BJ/GSQYP6NSWzc7TiGb0M
 A25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781755643; x=1782360443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M+G/PsSFawEHy7d66EG+jTgLqZ6ndIAaOYB9EFVfxJA=;
 b=hU8fbari3fG95UkG0AAoXAlIvRvRgHFnAeHP1egtysc5O4Xvcfa4K+X6Qe+xlcvIaM
 Hp9sDzobF1ySgPpZ9YxP7eQYL81a11QJkgfdHakBxFYN4O7M2J11qdEVBwp9uvlOVA1u
 nBXj6/JMKjxfdXzxLwBpNVwzXgNazNFo5bMmikeLRNpSNYSNp8UFSxbf8XG5lCFktV7Q
 5seB65goHS3iF4FHGiUyKkSHiJj+iegjg1BJkRTOehQEAfz4xxh2vn8pxpl5CoQgQe2A
 fBZv4pweTyFw8mM9sy+QADPLZ2IoYZP7Zfkf4jlkPgYUFkULrpH6aPg6WUI1rrWLfvC1
 3aJw==
X-Gm-Message-State: AOJu0YxCKIME6/mFpCP9bkizA3om0++Y8l7E6RgWEY/0UBIukrHf43VP
 kyPe51/xuwEHvPvnOLzKCtncmNS3Gvl/1z8BDlJZ2UpvC4FR9zB7KxTBptiZCAHzjqhygfF5z1M
 gUWyJ
X-Gm-Gg: AfdE7cnM5/Q0zJzOlS0TyTeY+BAV4rRTfGbskA+cDETLYDakedXGdqTNWj4KJGylNXm
 pfMlS6ANX9GLHkRGoJ6JrsdF/GVk/oNprXU5HRl5SIPumbz0Apbu4HJIXj99JsYWaUYWBEtKyPt
 GunrpndXRMyC2N4iKZKSDmaYz4zbkTPv8Z81knEe+V3FjaNU2BsrIcnSkRAS2dQ2NvqoeiFFia2
 akiMo3bJ4WJtlch0ZHiIHXNd8MHjwKO9tz7ekQdXUEKzXvMZxiF2w2eEJLz5/1mgKS4fd+3YanD
 UKTZCg1dJkijXEcIjl4dYsXuSrHUxm+AauJ80Wpp9xWoZTd+zgwam6m85WIDHpQ3AM38Ron+OfD
 ss33UwdUDIkKKqG7xxj7CFYqCB6aVg9sVzHRkVLHO10kjBN0HEuZmcMh8f2xq91ej3vOTYNdoAC
 ZdHhp8yP+XjlIo9Y3ZQJZTHjf8lpdZIWk0HoNIweXaDGGl9ZkDhw==
X-Received: by 2002:a17:90a:c2cc:b0:35b:9894:f6f9 with SMTP id
 98e67ed59e1d1-37c9e9d41a7mr5837359a91.18.1781755643100; 
 Wed, 17 Jun 2026 21:07:23 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c5222e042sm8830476a91.16.2026.06.17.21.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 3/8] target/arm: Generalize sve_compact_[sd]
Date: Wed, 17 Jun 2026 21:07:13 -0700
Message-ID: <20260618040718.572950-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618040718.572950-1-richard.henderson@linaro.org>
References: <20260618040718.572950-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement with a DO_COMPACT macro and general purpose
predicate handling.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 51 +++++++++++++++----------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 2517362189..9b45b0d331 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -3637,39 +3637,30 @@ DO_TRN(sve2_trn_q, Int128, )
 #undef DO_UZP
 #undef DO_TRN
 
-void HELPER(sve_compact_s)(void *vd, void *vn, void *vg, uint32_t desc)
-{
-    intptr_t i, j, opr_sz = simd_oprsz(desc) / 4;
-    uint32_t *d = vd, *n = vn;
-    uint8_t *pg = vg;
-
-    for (i = j = 0; i < opr_sz; i++) {
-        if (pg[H1(i / 2)] & (i & 1 ? 0x10 : 0x01)) {
-            d[H4(j)] = n[H4(i)];
-            j++;
-        }
-    }
-    for (; j < opr_sz; j++) {
-        d[H4(j)] = 0;
-    }
+#define DO_COMPACT(NAME, TYPE, H)                                     \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
+{                                                                     \
+    intptr_t j = 0, oprsz = simd_oprsz(desc);                         \
+    for (intptr_t i = 0; i < oprsz; ) {                               \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
+        do {                                                          \
+            if (pg & 1) {                                             \
+                *(TYPE *)(vd + H(j)) = *(TYPE *)(vn + H(i));          \
+                j += sizeof(TYPE);                                    \
+            }                                                         \
+            i += sizeof(TYPE);                                        \
+            pg >>= sizeof(TYPE);                                      \
+        } while (i & 15);                                             \
+    }                                                                 \
+    for (; j < oprsz; j += sizeof(TYPE)) {                            \
+        *(TYPE *)(vd + H(j)) = 0;                                     \
+    }                                                                 \
 }
 
-void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
-{
-    intptr_t i, j, opr_sz = simd_oprsz(desc) / 8;
-    uint64_t *d = vd, *n = vn;
-    uint8_t *pg = vg;
+DO_COMPACT(sve_compact_s, uint32_t, H1_4)
+DO_COMPACT(sve_compact_d, uint64_t, H1_8)
 
-    for (i = j = 0; i < opr_sz; i++) {
-        if (pg[H1(i)] & 1) {
-            d[j] = n[i];
-            j++;
-        }
-    }
-    for (; j < opr_sz; j++) {
-        d[j] = 0;
-    }
-}
+#undef DO_COMPACT
 
 #define DO_EXPAND(NAME, TYPE, H)                                      \
 void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)        \
-- 
2.43.0



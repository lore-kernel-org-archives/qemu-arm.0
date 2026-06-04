Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE8CD6E75
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoI-0006rY-5z; Thu, 04 Jun 2026 19:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoF-0006ot-Rd
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:11 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoD-0007y3-RI
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:11 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2bf3781ca51so13838895ad.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616948; x=1781221748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyZd4Axcmi17hT9uRHYw5WxR8cxng914FVY4xY+poHg=;
 b=U+k2ZDT6eS2l/G//mMcUW+he53jk7GbVp32dz+VPXDBBi4X8zpbl3ByyYoUVD29vST
 BF/pJSB46arOvbxIUO+wskDz3lGxgYGtt5StyoGrLPKTjjlA5/HLwknAbWNRzKOKEQ86
 hDu2Z2rO16yKaoHpn5WdXqnRpmgRdMf2JkuSfYgfk+14x4ZCve3izvs9nOUg3giO67Ib
 b4FRiEvAHCBi5Ov3KAgU90HqS2D7p1rVQxEJik0KIu6nkGdRJo6LoJUwVjC/nKigUDmh
 n+SN9Wn5/0g9aGTT4gzVp8UzU8uZkaIUVqI5EJdFJRxG8wODfPF64oact/6BbibBKba4
 EPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616948; x=1781221748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YyZd4Axcmi17hT9uRHYw5WxR8cxng914FVY4xY+poHg=;
 b=G1uItL3vPQij9sdGSt89IeNlLacCcy+Qki7XZ3V2WDKeLC7gX6gYpb+mKwG4Io0s2j
 vKutUUc8mQtuJoeDdYd3KNH0ILUi3gF9v6qDdPlToYN6le0CwitXqoxQfpJI+1eyqNGb
 FufDSCEwswVOCGMoMf/xN0XLDYhJQ2W4occdEunQ26LRi9hF22ISrPI/RVJ9Zc67310N
 DGxmb/ypHWr8poalM1ycCs4JEBa059H/NK5tXW/OOMhKoCHlX7AhVWNUX5MhD9wws5NE
 ht0wHRKeRNtrEEl+geuYKhoprgtyJOggpjz1NbcxpQja6YXMUmz8xEGEFcS4FUO4w3FN
 agFg==
X-Gm-Message-State: AOJu0YzmYAtHztykwouW1hde03CtoTjCceoDydiMWhCtk6ctcYYw0fDd
 qiIRNUjAkG4ZG864AbLhUzlq/3XpfydJZgBCw0hNdw9Hko87BiFcXwBsMsg+hL939fAbFBK4fJ0
 zB9SzoC4=
X-Gm-Gg: Acq92OG3mi6NznjuxcXFDa5RsOqHfLxxjFKZr5B5SxVDqpzMH9OTu64IXGeMr6OyYCP
 jyaCC8R+UDDJG07/JnLn1dUfMgXLZr8qzJ1Nq9jUkgRbRPUbNovtHDMaxGAYAc7IJXxW1Kh92iW
 WZ8KdMUU2mTjtP2niXI97mQJ2MXz1CbSsvKgjsNCpLw/8CUaPqn3otUBywHtJH4MRYqa3oHvrDI
 iejJJVHUcwktH8EUdQbbsPb7Vqh5yKCimoEFI05WxilHn8JJVIUXu0sJgSfdvo1z9nlk0uCW3EA
 5NelyxRczlyVspUEi2Tdc5BjZkw/X2JRyAoaoH7CPVt2zOzKIcRqrA99k7Hep5jqtGT0T4Rw1BS
 OBV0qyiPBA/dcitkJ/qkaJrx+1RQZX2lUImVIQr7caVXx710I1FAqTCuoEc3rW2wactm3b/XxNE
 SwPPb7iHuiokwxJmSonpIksn5eAB5yLQSlyWq3ogk2hyq71/VcwA==
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id
 d9443c01a7336-2c1e77d145fmr7615235ad.0.1780616948316; 
 Thu, 04 Jun 2026 16:49:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/25] target/arm: Generalize sve_compact_[sd]
Date: Thu,  4 Jun 2026 16:48:47 -0700
Message-ID: <20260604234852.573178-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Implement with a DO_COMPACT macro and general purpose
predicate handling.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 51 +++++++++++++++----------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index a13ccf4b85..40cf567b0d 100644
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
+    intptr_t i = 0, j = 0, oprsz = simd_oprsz(desc);                  \
+    do {                                                              \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
+        do {                                                          \
+            if (pg & 1) {                                             \
+                *(TYPE *)(vd + H(j)) = *(TYPE *)(vn + H(i));          \
+                j += sizeof(TYPE);                                    \
+            }                                                         \
+            i += sizeof(TYPE);                                        \
+            pg >>= sizeof(TYPE);                                      \
+        } while (i & 15);                                             \
+    } while (i < oprsz);                                              \
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
 
 /* Similar to the ARM LastActiveElement pseudocode function, except the
  * result is multiplied by the element size.  This includes the not found
-- 
2.43.0



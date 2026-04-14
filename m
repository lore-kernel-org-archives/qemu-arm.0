Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B541F531DE
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:54:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS2l-0000NL-HE; Mon, 13 Apr 2026 20:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2k-0000Mv-B8
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS2i-0000Kj-Pq
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso61990915e9.1
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128055; x=1776732855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNo1mYR/V/Hb3qL4J/cDVYDlyrB6sHdhhxeBEz2vg5I=;
 b=uHRaIq2ck0TWEQr/o0HnoCmAP++GB2Kc2v5RSMPUA6JPm7Uc/CiqHdfulQ7dlFPvyn
 RQnwVvjc1NyC64dook4Nxc1ggXJxpivxoUHIgcPEAmkGRZC9VmhskkaZEdkd6RXsm8qh
 ynWBm1JKHDWvYKEGXsS57/PCqXlydzn1qjVy6v/Xxvh4VVTrX7epr+Cd9GyvDd4oKInl
 y7Lp7mCblzo0rhwy6jByGc1h3PcA/YhrcHwolbdq0u3du3oecTqmPX7OP5rBiEFsewv0
 MQS6hCj5aB3VL4/vhhC9OoCtlKcqDF5NvUolkuyIZKdwrmzLEegY4KpVcoLAwfv4pCNI
 pHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128055; x=1776732855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NNo1mYR/V/Hb3qL4J/cDVYDlyrB6sHdhhxeBEz2vg5I=;
 b=fCCwxCXAWUZhOvsyvEgbSKnCmgp2jLFrqRf0s+UcfnrKE9SEV4gWANddCinBqBD/R6
 s6PpbIxWTvCdMiYNX2F3ONn2uLKr8UuJ42vZZ9IrmeRJWdXNaxzh7MCJhYu1TzjuenDl
 gxKg1tqnsI54SOj65JZQWEp6VSYyLGKJJ+dXBmqhDUYbw7/w7A7CNJ4A9JmI1TI22Jim
 dULffT0gW5dWcEc9XeuKYDhrGgWyiSN1UgPLT9xGpYmUY8eS5knBcUmadL9Zrawy4gnd
 mESLN9FF696oE833o/MqBDI2cyo/9V+TARTY8dO1sMD6PPa3zftjokSmPA4M6m6CLQGm
 kU1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ou34qDY3mOP+heLrZvhAufJKVhFdrvzfWNEfw5k62RRhcqah5gea+yP4FT1wpeXmh4Uc0Yp8atw==@nongnu.org
X-Gm-Message-State: AOJu0Yx7GzCHiTZF2uDC/T6qxZyz+QuGDQn8GpphUr4PFohmacj1741e
 0d/TR9WItuC716dMRby0garJSvR8nGrtkw6BwNyVMgDRzpuLDYn01pZp/Q6gQGtX7bQ=
X-Gm-Gg: AeBDieuxlZUtod9G5c2ea7H7XX0jQA2QnlNRnPAY3MCb8e3/xLmKIsf71gR5vf12j7t
 MaknJkI4nWy/Vmz+2Y8Lf4WoChGgwiIGsXPD8cTeTNe9jCB/zpNl1qCPx/c/yPV+bX6w/RfwFGv
 oo3gsctPmTLcnu3Osn+aJfDNoLryX2Y7nf2EMHUtKj/nWfxJdfx/CBSSywgaK0pIvIYeLC/D2u4
 lPL388pe2AUSePHU0u0c/pfqFgCmjL9yPG92RR2DyGVjVJNDgi3/gEmDo9SafTloEpqSK3R9ZvE
 OdCSMoDaa1ZkRYybKVbKMMYyVqy5Xe7SDIxfWfhWi8tWWRiBNizIdayRssM9r3ZknJL92sXKawg
 m0wjtvwv4EgaIPp92GaQD+THx8kTCeWS1HsmfBsIvigqrtQ2S9q2hec0GoGg3+YfTpij9mNU6QZ
 rbbKemzil0o/WL50yer63BYpHGs29+5wAIuf3G7Ff8PvNmRoYdyel1AK7R68WkPy38moIbUbpLZ
 pAs8srIgf8=
X-Received: by 2002:a05:600c:c16d:b0:488:be21:54ae with SMTP id
 5b1f17b1804b1-488d66504bfmr222636215e9.0.1776128055316; 
 Mon, 13 Apr 2026 17:54:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681f28esm105872435e9.16.2026.04.13.17.54.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:54:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/9] target/arm: Hoist MO_TE into mve_advance_vpt()
Date: Tue, 14 Apr 2026 02:53:42 +0200
Message-ID: <20260414005348.4767-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mve_helper.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index cc58e0502f5..fbb64889bf7 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -160,7 +160,8 @@ static void mve_advance_vpt(CPUARMState *env)
         uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned b, e;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MFLAG | MO_ALIGN, mmu_idx);        \
+        MemOpIdx oi = make_memop_idx(MO_TE | MFLAG | MO_ALIGN,          \
+                                     mmu_idx);                          \
         /*                                                              \
          * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
          * beats so we don't care if we update part of the dest and     \
@@ -183,7 +184,8 @@ static void mve_advance_vpt(CPUARMState *env)
         uint16_t mask = mve_element_mask(env);                          \
         unsigned b, e;                                                  \
         int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
-        MemOpIdx oi = make_memop_idx(MFLAG | MO_ALIGN, mmu_idx);        \
+        MemOpIdx oi = make_memop_idx(MO_TE | MFLAG | MO_ALIGN,          \
+                                     mmu_idx);                          \
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
             if (mask & (1 << b)) {                                      \
                 cpu_##STTYPE##_mmu(env, addr, d[H##ESIZE(e)], oi, GETPC()); \
@@ -194,23 +196,23 @@ static void mve_advance_vpt(CPUARMState *env)
     }
 
 DO_VLDR(vldrb, MO_UB, 1, uint8_t, ldb, 1, uint8_t)
-DO_VLDR(vldrh, MO_TE | MO_UW, 2, uint16_t, ldw, 2, uint16_t)
-DO_VLDR(vldrw, MO_TE | MO_UL, 4, uint32_t, ldl, 4, uint32_t)
+DO_VLDR(vldrh, MO_UW, 2, uint16_t, ldw, 2, uint16_t)
+DO_VLDR(vldrw, MO_UL, 4, uint32_t, ldl, 4, uint32_t)
 
 DO_VSTR(vstrb, MO_UB, 1, stb, 1, uint8_t)
-DO_VSTR(vstrh, MO_TE | MO_UW, 2, stw, 2, uint16_t)
-DO_VSTR(vstrw, MO_TE | MO_UL, 4, stl, 4, uint32_t)
+DO_VSTR(vstrh, MO_UW, 2, stw, 2, uint16_t)
+DO_VSTR(vstrw, MO_UL, 4, stl, 4, uint32_t)
 
 DO_VLDR(vldrb_sh, MO_SB, 1, int8_t, ldb, 2, int16_t)
 DO_VLDR(vldrb_sw, MO_SB, 1, int8_t, ldb, 4, int32_t)
 DO_VLDR(vldrb_uh, MO_UB, 1, uint8_t, ldb, 2, uint16_t)
 DO_VLDR(vldrb_uw, MO_UB, 1, uint8_t, ldb, 4, uint32_t)
-DO_VLDR(vldrh_sw, MO_TE | MO_SW, 2, int16_t, ldw, 4, int32_t)
-DO_VLDR(vldrh_uw, MO_TE | MO_UW, 2, uint16_t, ldw, 4, uint32_t)
+DO_VLDR(vldrh_sw, MO_SW, 2, int16_t, ldw, 4, int32_t)
+DO_VLDR(vldrh_uw, MO_UW, 2, uint16_t, ldw, 4, uint32_t)
 
 DO_VSTR(vstrb_h, MO_UB, 1, stb, 2, int16_t)
 DO_VSTR(vstrb_w, MO_UB, 1, stb, 4, int32_t)
-DO_VSTR(vstrh_w, MO_TE | MO_UW, 2, stw, 4, int32_t)
+DO_VSTR(vstrh_w, MO_UW, 2, stw, 4, int32_t)
 
 #undef DO_VLDR
 #undef DO_VSTR
-- 
2.53.0



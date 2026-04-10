Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34913F45A0A
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 20:08:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBI84-0002QE-KP; Fri, 10 Apr 2026 16:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI7x-0002N5-V7
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:06:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI7w-0008L7-C4
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:06:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso35760665e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 13:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775851611; x=1776456411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19g4LL15pWkb4dv+bZpUKR/vfD5RSE9eqoLEwRvWI9c=;
 b=bUocy3HuX2YR9WFkCjkWgld77av6OP9/CXpJVyRmV7mqwIPOOE7EtaZDx//J4ws144
 Ospm5ccmJA3BkLyjuNvxOZKj0KskyjOG84fWP8vpOgvhWYX8yp+D46fB1qQpg173Nlm8
 MAObq5S/LGey33k+QcI6ZALBw958fsH9AdzeR5fvG7l5pcshD1BW5w2ePGmMPADhKfqE
 lVv3YiTNvnIUmgVEwFMCLDiC11UHDfJPlAMor9X5AtP8BEkwKdWyBNZMLKpd/FnCDiFH
 dIetP1tBirwZJj4+ZLfpVMOw9ClqQvtW91ekwTpGCEVM+KnHoU9q67kCLfo8oyJSpgMP
 go2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775851611; x=1776456411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=19g4LL15pWkb4dv+bZpUKR/vfD5RSE9eqoLEwRvWI9c=;
 b=sX10x3GLYGr6smKGdwl+s3DBBDf7j/r76T2YWyneOgjV51EnADwZMhq4kq74H3amve
 rOxQs4tGWghs+oO7Ud86viUwjVUy5fU38vj2ulMAp+dMPic/Ycoq6nBSP0VUEov6rtJs
 Ivrq/EMgsk6Zsp2FTkaQIlsaK1nX+t3MMOb9mL8eBi9YNYou6oqrdkdWm99AaGlphmv5
 goLloJOHQBhJj1BwVTpxDZAaXOFjpb3LRoOi8bN0B6kTrC/rAIfPlan7DVdP91H0Npoz
 MWcFo3zp7IgtNpI5Pb6xp6lyTy30t7b/MYoZsLBuIOmBMkg1b0Q62L64cHdvb9DhNJRQ
 vHAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOBsf2VbipiarpRmZctyxmsUs3dUE1r3P/qass86qwWXv19THz4DuPvfP02D0z4ZS6TWHE+IKT6w==@nongnu.org
X-Gm-Message-State: AOJu0YyaiJyMXJL2sGp+4GxxDQgxPb4CZ5MR/5RNpQ1/Bc8llCiaRLWt
 1taBUDCSZmx6XaSeMZWOIDEHKYu34wmTzo+NcHghW6OUXfFKP2+zQTudNMnbtHpEmEpUKMLP7Z+
 Z6uX02mc=
X-Gm-Gg: AeBDiev5UlBfjYLWyJoECBa+/WNHZRE9ZPGWhVZjRheDbw18Fv+m2eL+GS1mD17ObbQ
 whrmiHck6XqOiV2GLZCprcNzq/Fln31s1am6wNESzPU0oZBej8wiPCo80x5yN6pZBJ0YqlSnR2C
 82tf2wfPXTrF8PMLgEnoCuVRo3lTiS+ZtXfPVqbsuwiuJIj1RIshpcHLrgfqUB3BNfgTlBkRVhy
 mqMkegvRURJe5zm3MKzT4xL3fziEmP/9Pz+2RuDWVmfGJPK/+dGDfe6Vmd5h+ymDupBuDJyKdXE
 AefnV75j+RAxDrBdD8YyNKrYzY45QfASeVZhC8Lz8rC4Opu/vKthf7jUPeUpdcjOQuwOxh3wkEQ
 8DQTTypkbYYPPquQBgPah9O/aN/sGOZ1+Q43pXMtq6/bB3y/+jvRktxY/URp//trJPcHIMv72Kv
 uXP5QsCAs8t49RhpAGBCJONHi2H0cgHQnpJbbyBGvfIDwVQhfV3B/g0WtaSolgyqfg9+mYagDs
X-Received: by 2002:a05:600c:890e:b0:488:bd79:94d8 with SMTP id
 5b1f17b1804b1-488d684331emr39617265e9.18.1775851610853; 
 Fri, 10 Apr 2026 13:06:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm92863755e9.12.2026.04.10.13.06.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 13:06:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/9] target/arm: Conceal MO_TE within mve_advance_vpt()
Date: Fri, 10 Apr 2026 22:06:22 +0200
Message-ID: <20260410200628.19378-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410200628.19378-1-philmd@linaro.org>
References: <20260410200628.19378-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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



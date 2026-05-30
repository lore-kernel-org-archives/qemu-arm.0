Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD78CD6E55
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:14:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrS-0000JE-MZ; Sat, 30 May 2026 19:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrR-0000HZ-G8
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:57 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrP-0007ZN-Pj
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bf1cda2b17so15187935ad.1
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182774; x=1780787574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nlZ6aEiuN3XiGycYwMYA5NFhsFBR0Mas87WbheZnGvw=;
 b=UOg92qJMxgaAQ7yJEWK1Lxoxtq7V4uAThkbY4dkTa9XK+NO8dI56+Wl449jWG/NwmL
 AGaNOOde1Y88LWtBWN8sQ7ujTA4KdoiEKnE5cKM+aUOCV2DMUPREMa5XZouyeAStryl7
 e9Yv7+hNtRvWo85VDnu9IMzlyLvcX/7eo1vmopORDHgY40TC1Ul3+Wja8tPmGmzJAwTo
 d7ndl0z+monbAbB31pCJZboJ9prKOJDoFN2s8qnpu+l3Ol2cwvJNgbP3YOPXkTfRqmh1
 TxRpCTAdF2UueCycDzwZi/CojJhn6Fg8cdG/XmuDQofsLCnEDCXfhwwoVaXWYUX0lZy1
 CFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182774; x=1780787574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nlZ6aEiuN3XiGycYwMYA5NFhsFBR0Mas87WbheZnGvw=;
 b=rYZzcoDvYJmIMDcN7oT9xKp8D3TTvxkJWCwBByuR0gYU+S+6ioHZ2X/GUgFnzLibK8
 v3PKpHUhgAwXIU+68I3V0Q7LNxDhvDkFoNhZBhPmZ06bj7OWU46PeHaaY660wAPQff8n
 ZKSAjnrr+abxO2qjAC8JtnAtuEJiDyFrxMkm3hJ3wkfW7FHvzu2PcLoUiBdX8xj89QR6
 5f2CKXDsgFYKuVS8MeFAkYt9JQ24zvbzsdkL+sOqdHAUbKT66muHRR3h9GC1SHKUPtQS
 20du9R9OPDX7Je5XOB1+DkU2uPR1UnHRstyPfQXii2DljiYhBW6VXrNmmHc+0380BzDD
 aaFw==
X-Gm-Message-State: AOJu0YzqnwCyWHTPr3C1xrT0F5J5wlOUIvWqUXUlgVPfzsE0l7yBF5TR
 XuuVP9+kVHq1RZcvDW2Agu2Zq0DK6exvzKlR6PuXob/a+G4plLjDp6pZTxS7fjiUYHI=
X-Gm-Gg: Acq92OGK/o2z/UV3boobAAlIxbIZ8rtbuuV2LD2p0YdSOI5+uPDhX2NFyUsFDzTLV0o
 YNtFSH1xzM+T7Smpl0cOfWPP/WZwvmagWRLFers6NVM+6qQWaYgEt+B5rW07gxWHueq2anStEp2
 fDmWL2llZU+lhGeTG0CTnAjIEJlYG4YGazXf0JZHo9HMRcWUDcdk60DJH5WHnEAwaaB6vOKUlYa
 Lr2TV4bdUylg+eymL5xnu+q7/8OiRI2nCsDE/4GfMbegt08lRU0v1FyZYEFEd4l1MK0UHVrMDfK
 mMj0rcr1QYAErukFpcaPgDOeHQqhLFLYZ0OgaddPnGoHjUosdLpAmgaqknG+t8SvU/h2QL2GCGo
 sILAz4VK8qpaNLM7PEBilTepW14QerJfzh6P+nxDpl+xWJARnZq+bWua7c435cQBKa/pZRdp+zW
 DkF4xtS3wlf6FJ3aAV5tEZw7KB/U9AeHbQgi/U/Wo=
X-Received: by 2002:a17:903:22c3:b0:2c0:b31b:b19 with SMTP id
 d9443c01a7336-2c0b31b0d81mr22333595ad.21.1780182774330; 
 Sat, 30 May 2026 16:12:54 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 23/41] target/arm: Implement LUTI4 (four registers, 8-bit)
Date: Sat, 30 May 2026 16:12:11 -0700
Message-ID: <20260530231229.400441-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/helper-defs.h   |  1 +
 target/arm/tcg/translate-sme.c |  6 ++++++
 target/arm/tcg/vec_helper.c    | 14 ++++++++++++++
 target/arm/tcg/sme.decode      |  6 ++++++
 5 files changed, 32 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 050a826849..b3ff825488 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1653,6 +1653,11 @@ static inline bool isar_feature_aa64_sme2_f8cvt(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_f8cvt(id);
 }
 
+static inline bool isar_feature_aa64_sme2p1_lutv2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2p1(id) && isar_feature_aa64_sme_lutv2(id);
+}
+
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 05ccf795e8..8ec6c16319 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -1120,6 +1120,7 @@ DEF_HELPER_FLAGS_4(sme2_luti4_2b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
+DEF_HELPER_FLAGS_4(sme2_luti4_4b, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index c4bede2ae3..98d3d18791 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1846,6 +1846,9 @@ TRANS_FEAT(LUTI4_c_2s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_2s, false)
 TRANS_FEAT(LUTI4_c_4h, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4h, false)
 TRANS_FEAT(LUTI4_c_4s, aa64_sme2, do_lut, a, gen_helper_sme2_luti4_4s, false)
 
+TRANS_FEAT(LUTI4_c_4b, aa64_sme_lutv2, do_lut, a,
+           gen_helper_sme2_luti4_4b, false)
+
 static bool do_lut_s4(DisasContext *s, arg_lut *a, gen_helper_gvec_2_ptr *fn)
 {
     return !(a->zd & 0b01100) && do_lut(s, a, fn, true);
@@ -1866,3 +1869,6 @@ TRANS_FEAT(LUTI4_s_2b, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2b)
 TRANS_FEAT(LUTI4_s_2h, aa64_sme2p1, do_lut_s8, a, gen_helper_sme2_luti4_2h)
 
 TRANS_FEAT(LUTI4_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti4_4h)
+
+TRANS_FEAT(LUTI4_s_4b, aa64_sme2p1_lutv2, do_lut_s4, a,
+           gen_helper_sme2_luti4_4b)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index cb633817d7..eaf15a0cb5 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3349,6 +3349,20 @@ DO_SME2_LUT(4,4,s, 4)
 
 #undef DO_SME2_LUT
 
+void helper_sme2_luti4_4b(void *zd, void *zn, CPUARMState *env, uint32_t desc)
+{
+    unsigned vl = simd_oprsz(desc);
+    unsigned strided = extract32(desc, SIMD_DATA_SHIFT, 1);
+    unsigned dstride = !strided ? 1 : 4;
+    uint64_t indexes[ARM_MAX_VQ * 4];
+
+    memcpy(&indexes, zn, vl);
+    memcpy((void *)&indexes + vl, zn + sizeof(ARMVectorReg), vl);
+
+    do_lut_b(zd, indexes, (void *)env->za_state.zt0, vl, 0,
+             dstride * sizeof(ARMVectorReg), 4, 32, 4);
+}
+
 void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     unsigned part = simd_data(desc);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 339de72b8a..495330aed7 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1014,8 +1014,14 @@ LUTI4_c_2s      1100 0000 1000 101 idx:2  1 10 00 zn:5 .... 0   &lut zd=%zd_ax2
 LUTI4_c_4h      1100 0000 1000 101 idx:1 10 01 00 zn:5 ... 00   &lut zd=%zd_ax4
 LUTI4_c_4s      1100 0000 1000 101 idx:1 10 10 00 zn:5 ... 00   &lut zd=%zd_ax4
 
+LUTI4_c_4b      1100 0000 1000 101     1 00 00 00 ....0 ...00   \
+                &lut zd=%zd_ax4 zn=%zn_ax2 idx=0
+
 # LUTI4, strided (must check zd alignment)
 LUTI4_s_2b      1100 0000 1001 101 idx:2  1 00 00 zn:5 zd:5     &lut
 LUTI4_s_2h      1100 0000 1001 101 idx:2  1 01 00 zn:5 zd:5     &lut
 
 LUTI4_s_4h      1100 0000 1001 101 idx:1 10 01 00 zn:5 zd:5     &lut
+
+LUTI4_s_4b      1100 0000 1001 101     1 00 00 00 ....0 zd:5    \
+                &lut zn=%zn_ax2 idx=0
-- 
2.43.0



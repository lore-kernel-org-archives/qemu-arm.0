Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F482CD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28p-0005lw-U7; Tue, 09 Jun 2026 15:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX22B-0003gh-FC
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX220-000488-10
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2c0bd02d97eso66980735ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032894; x=1781637694; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9oKYbnPufbrbmSGaoz/PENlfl8zm2sxYN6OzTnkZK0=;
 b=BfIR95sSR4QhSsMSQKtDaXBjOZwcJMFBadfWitX3ngyZx8fThhQuf5eZKEJJPMjXvu
 IXHHP57sEYiYGZKMT7sB7LWZKT/Lzv8R8wpSgc+TxswG9u5x6EG7FVhGwHP+YQpl+OuU
 ARaiSfs91/NS+WtS8ufnNzaB2HsYphBYVEt/zEImcABWRek8htpDYNj9ZuVcL1Rh9MJ+
 iL7mTOYezsUC3jTT0a65LlO6L5vfvNalyfYjVnMURkUkvGkiAdWIWtM1n0oXCk8Ww0I4
 eaKsVHKjitgk9nOXeJ3NJGYwniP2gRJjdCqtX5tQZRc9Q1l5tVXKAPSe4YHy6M4ksczm
 QHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032894; x=1781637694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N9oKYbnPufbrbmSGaoz/PENlfl8zm2sxYN6OzTnkZK0=;
 b=OJXlKJIAbK0K9L9vtywiHACeT2HGfhJOxz52vFVV317ijQ2iMKtunGMSekEcknnE0M
 r7n2GDhCavI71I6gLzSYqGsv2DMrZ1k5MBK7ok5JvE2WOInMUuc9z1S/wsnUAFyVQcOr
 lyRkE2PF3u71G5U6AeoHBGW4+Ir3VmOL6wb0+XBWM/jQjLWgsm3vX9tF1+9qC9N7XNTS
 fZedOw05FlmOvebUjbzWqZast2k2YCtovXBCeQAPOVwTYoNrbeTBx5M5D0wXBRQfaLfs
 GvTWhIt70NRKOu4UiLVE0cw7/WZY2grEDBHqzNXqjZ1L3zL+aVEWbELPfbhVToqniaD1
 pAzA==
X-Gm-Message-State: AOJu0YxQfP1bxmfMvLOcWDzMZ7RZNE7wI+z89qA6iJreqm4hFji3rcFH
 WUglgImKuYGZ9aenka19G1RJz4i8mVZlvyi+i1NX/KPygGPwDMUJWwFmZLS6ZbZmYXs=
X-Gm-Gg: Acq92OF8XDMYqzhTxXMhD8VeQa4T3olQdEEFt+d/CHp1j1gIxpIg97z7BQZTdoy/ekc
 FcVFftVOVLh9bJ9+eCjDFhuSh8wAKm2jW4mBhw8zYFudBRuo6F11QXSu2L8Je1T8AEWnIL9rA6q
 cGyUs25FI1SEAOKnvpYIkVfIWNGYaipMXfoHR3VDQdsDlUlnm5kFLCl7mp0jL2pO+8U+lW7W/oo
 cMLfK0uHUvHp9Z59aFRaRvPK2SW1/Pd1/Rqk9wifKkpmUu8q70JtIxfUIW8Qn62z70MyeZHIw3T
 eNHAlgRGAC1Gq8azOl+6PyvYKxgI8Q+vnjp7y7VA0PQzJhPAnSn060ARiSjzaL7BHONGd1ycMFy
 8ZBENvY0k6ZRb4a1p85HZjK9jWqYJAgGSk3WngSX5c5VzV3YdTMjcRyq2yA8frGoW9z3rSILF9w
 lQ40L9OPqp5fFLiiP0V1ReUqRiOzdVfx4EfFtDg+nBx6F6i21FYg==
X-Received: by 2002:a17:903:3c48:b0:2c0:eee2:fc40 with SMTP id
 d9443c01a7336-2c1e80cede0mr250127575ad.3.1781032894344; 
 Tue, 09 Jun 2026 12:21:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 30/45] target/arm: Implement FMLALB,
 FMLALT (FP8 to FP16) for SVE
Date: Tue,  9 Jun 2026 12:20:54 -0700
Message-ID: <20260609192110.752384-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sve.c | 33 +++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  7 +++++++
 3 files changed, 45 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 418abf33ab..5e9eb3405b 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1555,6 +1555,11 @@ static inline bool isar_feature_aa64_sve_b16b16(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, B16B16);
 }
 
+static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 0e0bc4cbfe..453bae3a0e 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8355,3 +8355,36 @@ static bool trans_LUTI4_2h(DisasContext *s, arg_LUTI4_2h *a)
     }
     return true;
 }
+
+static bool do_fmla_fp8(DisasContext *s, arg_rxx *a, gen_helper_gvec_3_ptr *fn)
+{
+    bool fp8fma = dc_isar_feature(aa64_f8fma, s);
+    bool ssve_fp8fma = dc_isar_feature(aa64_ssve_f8fma, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8fma || (fp8fma && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8fma) {
+            s->is_nonstreaming = !ssve_fp8fma;
+            ok = sve_access_check(s);
+        } else {
+            ok = sme_sm_enabled_check(s);
+        }
+    }
+
+    if (ok) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, vsz, vsz,
+                           a->idxn | (a->idxm << 2), fn);
+    }
+    return true;
+}
+
+TRANS(FMLAL_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
+TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index e2106fc7f5..71ec09393c 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -29,6 +29,7 @@
 %imm9_16_10     16:s6 10:3
 %size_23        23:2
 %dtype_23_13    23:2 13:2
+%index4_19_10   19:2 10:2
 %index3_22_19   22:1 19:2
 %index3_22_17   22:1 17:2
 %index3_22_12   22:2 12:1
@@ -73,6 +74,7 @@
 &rri            rd rn imm
 &rr_dbm         rd rn dbm
 &rrri           rd rn rm imm
+&rxx            rd rn rm idxn idxm
 &rri_esz        rd rn imm esz
 &rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
@@ -1864,6 +1866,8 @@ BFMLALT_zzzw    01100100 11 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
 BFMLSLB_zzzw    01100100 11 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFMLSLT_zzzw    01100100 11 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
+FMLAL_hb        01100100 10 1 rm:5 100 idxn:1 10 rn:5 rd:5 &rxx idxm=0
+
 ### SVE2 floating-point dot-product
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
@@ -1880,6 +1884,9 @@ BFMLALT_zzxw    01100100 11 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
 BFMLSLB_zzxw    01100100 11 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
 BFMLSLT_zzxw    01100100 11 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 
+FMLAL_idx_hb    01100100 idxn:1 01 .. rm:3 0101 .. rn:5 rd:5 \
+                &rxx idxm=%index4_19_10
+
 ### SVE2 floating-point dot-product (indexed)
 
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
-- 
2.43.0



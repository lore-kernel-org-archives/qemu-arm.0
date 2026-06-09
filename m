Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93271CD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:28:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX25x-00072P-Aj; Tue, 09 Jun 2026 15:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21s-0003Z9-DO
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:31 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21i-00049V-5h
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:24 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2c0a5354da1so48917915ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032899; x=1781637699; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3X6cHTMEhKqvTK1riJnePZp1c9cIoZy4I30BOx01ie8=;
 b=j0RswhS4GCIslUsnpADDWpN9HyBgUUrMeOYs5YemXnHdQUjly/qWRvbr2CFdxhQ8iQ
 VH4y07VnlIFt+EKdJQPWP2LcQGr7O4Ac73jsdAuNSrVBzSu3JZ34Yi/G9BmKELUQwGzj
 0A4d4t3mpGA0ahuTUj6gBytc49CJz/FQyiMvbgx57ynof1fducrt+y5FHq067ULSDmTs
 x6FpiaTYnl3fDN9+YW15tRIq59LdcSOrrA12ovO6nlHbQieaP/cXLN7MerAcSXjKyxgz
 CSygusGHEJmTwuEw7B1ClCqoOZ308UgyBs+GnO927x8mZzOohqqiqN3BbiOjrmRd7/2V
 SpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032899; x=1781637699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3X6cHTMEhKqvTK1riJnePZp1c9cIoZy4I30BOx01ie8=;
 b=sRrwu/y7v4FFAQfLS1ZW1IE3tIw5MLQQLD58+iNc3yQgJEpZxu3Dt1ZcVeB3pIagHx
 QIK3ADjrB+whnWRdx1oY5wEtytmf+CS6aP3Q4Yg5L1/EGBU8Wmb4Ba2B4VBvribZP4Bu
 eRca0jv/ECdWYJWYPP2yiNhe+IHPFC4A9RxZyvFvWLW7+UWt7B9W3Htvfgs8Ewoh+2Dv
 5GjBjQ0jxaVtCPKO8sNlWkkENcrqkWAhwjhxbjoW8Zwi0oQ47YjXT/n+JWZdc+bPqs0r
 V2gjTIwjzo2ixNH9DRqXMfV8sSP+xDN2EE+i5DOnEEu7er+IpszsMbQLkuXOEI4IyEHs
 ZmMw==
X-Gm-Message-State: AOJu0YxqPh5ua+OLtBfRtL6SNrrT7T4YPJBBIfRfCtDLmkE9hZF6FJBG
 JrfUK6qpUIWnOB4hpMSLN3gsEt2nNPIA24Pl9SkDgoqX2WvQNmEfFyi81qDzZihds8k=
X-Gm-Gg: Acq92OHPN4ha+yfO1weslzkoX1N2lm/DEX5/C5DPd4DHz41DfGc1wDPXHvS6yW17/gc
 rrqVlLtwNA8qfY/xvZ8bQvQtxrQEitTsEWqrtwsYKAtl/Lh5nrE05iEeZekenZilPGn+z4v3Net
 6Tj1WdYnTk+2p+6iuiO5kXQohfXcbtObFd1XI50l2YHeilBiVEONof7mfHm2vzpoMktzv+DIsgH
 2pHMsB2UEm5Q/DVF634GiirCmXPhTggkR1mE7DKhAw0DPzQlWX2ZjL3YPSy3zV30kr4+F8sSYFT
 EHSee6Vm1rCShv2hh5VotdKchrtANbcDZtF3cFe94RUGN7lnE0FwQtoI2qoMvDpWpBJT7tKEbcf
 W2tzQAW7bC9NA+JQ4lEpGpo1pW/fFrTPWegkMx3CyXjIW39O5qnltvJAjw9PbF3ZBfCr5r5URC5
 fuClglFDRpb7c7vzSOQPlPUqHfYOWyF1VKQ52pvjTeyGJcSqOpxQ==
X-Received: by 2002:a17:903:acf:b0:2b0:badc:c9cf with SMTP id
 d9443c01a7336-2c1ec551c58mr183633555ad.13.1781032898510; 
 Tue, 09 Jun 2026 12:21:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 35/45] target/arm: Implement FDOT (FP8 to FP32) for SVE
Date: Tue,  9 Jun 2026 12:20:59 -0700
Message-ID: <20260609192110.752384-36-richard.henderson@linaro.org>
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
 target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  4 ++++
 3 files changed, 44 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4342a2461e..fbf4decd74 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1560,6 +1560,11 @@ static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 9f207a32b9..582471b380 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8391,3 +8391,38 @@ TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 
 TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
 TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
+
+static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp4 = dc_isar_feature(aa64_f8dp4, s);
+    bool ssve_fp8dp4 = dc_isar_feature(aa64_ssve_f8dp4, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp4 || (fp8dp4 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp4) {
+            s->is_nonstreaming = !ssve_fp8dp4;
+            ok = sve_access_check(s);
+        } else {
+            ok = sme_sm_enabled_check(s);
+        }
+    }
+
+    if (ok) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           tcg_env, vsz, vsz,
+                           index, fn);
+    }
+    return true;
+}
+
+TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 06bbd7fa63..c49e992f10 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1874,6 +1874,8 @@ FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
+FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+
 ### SVE2 floating-point multiply-add long (indexed)
 
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
@@ -1897,6 +1899,8 @@ FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
+FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+
 ### SVE broadcast predicate element
 
 &psel           esz pd pn pm rv imm
-- 
2.43.0



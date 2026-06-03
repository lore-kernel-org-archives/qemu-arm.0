Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17F5CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:30:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIU-0007Do-KB; Tue, 02 Jun 2026 23:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI9-0006kp-KL
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:20 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI8-0003iP-18
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84237c55ef9so1482754b3a.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457355; x=1781062155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dF/XamizDFHvwhOgZesNBvMvEKMQrxAaauoIb0LzJE0=;
 b=X8lwDik46vvTaBHv1+kV57pWPHC2yCWB9TNI1pLnJiGAA8XcS8e6Vnq8PkCoy4l0Nj
 u6B7rZYbhaKPGdZ0QD3w8sXQoR9V6SlpItFNhh05+WtRB+B2u/eg0jq3ipmCYJuqE5wt
 WP3BuuOrGCABVLyhqw1mOVRRVBiWj6eItj4ppQ0DqQy1Ie/MdzEiKqKVGuoyYMN/4tE9
 AD+GDg18mlfG9+127JA1+nPzlJq+aQ61+lrIhH9OjMv7OOoGKHzQCNXAb2XUR6wnQeQL
 6zn1x/EzlArDj/VCRf64hOfH+rMbQXoWr2IhQNjM1+Qiidl5Ou1gD5HYHqhkzWo8IvU8
 8TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457355; x=1781062155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dF/XamizDFHvwhOgZesNBvMvEKMQrxAaauoIb0LzJE0=;
 b=qA7WzctL3pe99qS3oNmwhDARjadJwF+ieGhhA2Rw/afRmsRZpJNmAfDxnHVkWB+wEJ
 diMP7iVi2aCEau+JH/ySKBndxxEwc4brA6qSjXQj2tMBWEUBanwYaPtRlthnEjWKVOGn
 KiOY92prZB/defKTU4OjCxsGTU9PYIZbLgC0aNRyxOw327x1C5z5899dcPPPWmibvUxk
 klxFLcHXjxHJ0p3utP0ZVLqR5Rt9mHvuRvVN/pCDYjPby4ScN4orDoKcd+ezHXkuvFDh
 XlkHPT+zLpDQROB7Gb8ZlpK91lSYfzJfvDo35yUZELXAnsu9AFD0bt9dGqJWMbIMeLC1
 OThA==
X-Gm-Message-State: AOJu0Yz8PgYMGiNfPn93Z1KKp85WdIAUX8QhfaS5ZAryxCKmMd/iebk4
 fmo19eWaMruQqeBaY0/mbjZzc9EfHSwqlfBlQ3yarb0j5PV2yuj+hvWRT4BCKL/Jctg0UNbJF/l
 QiDqiTLg=
X-Gm-Gg: Acq92OGcXtJsAGGFNTrGA7ns1S2oCXXVNc5HKylXp+p1FSmHCxk7n+tOsadFxYodher
 Te2XduzJaA1/waXUn7uSn6wjBYlZfoZoirkSshgbFyTjUmawIg5coFco6H9CuzV2R8yxUSvdolD
 wERlyCG45L7EEeRTFw/f912buajAeGU/QH4rBFruXuKYFr36tO7UhFm2nN1BiqB7FNCVEJfHJzV
 qarGj4DuQWcC2ZbLqSsuXdLYuGJSRM/wCuwAArQysC8v7iwir5eBt1JeUlMbqfigjnU/f7yoISj
 hxq4iyhNweQ/BogA76UGhfd2fVvTC/tRL9ptbVhesLI2vauNs3YlgQmDT3BNSO3myVqy02Kqxvi
 sCFyjalx77mrPvTD1gKXf+qjkoIydAMRBy5nFtIn1mxWhCORXC5CjpLvzV7zrxkq3Rvf0eRG0AJ
 sVbDPEUEAahjWGwbjRWOvfio39lxWEXK2uyOO1zMY=
X-Received: by 2002:a05:6a00:3d4a:b0:824:a22c:c6d7 with SMTP id
 d2e1a72fcca58-84284e0bbb7mr1671666b3a.18.1780457354626; 
 Tue, 02 Jun 2026 20:29:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 26/45] target/arm: Implement MOVT (vector to table)
Date: Tue,  2 Jun 2026 20:28:35 -0700
Message-ID: <20260603032855.106930-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
 target/arm/tcg/translate-sme.c | 18 ++++++++++++++++++
 target/arm/tcg/sme.decode      |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 3a754f8d61..050a826849 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1580,6 +1580,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_sme_lutv2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, LUTv2);
+}
+
 static inline bool isar_feature_aa64_sme2(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) != 0;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 76bbacfb6e..c4bede2ae3 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -391,6 +391,24 @@ static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
 TRANS_FEAT(MOVT_rzt, aa64_sme2, do_movt, a, tcg_gen_ld_i64)
 TRANS_FEAT(MOVT_ztr, aa64_sme2, do_movt, a, tcg_gen_st_i64)
 
+static bool trans_MOVT_ztz(DisasContext *s, arg_MOVT_ztz *a)
+{
+    if (!dc_isar_feature(aa64_sme_lutv2, s)) {
+        return false;
+    }
+    if (sme_sm_enabled_check(s) && sme2_zt0_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int tsize = MIN(svl, 64);
+        int offset = (a->off % (64 / tsize)) * tsize;
+
+        tcg_gen_gvec_mov(MO_64,
+                         offsetof(CPUARMState, za_state.zt0) + offset,
+                         vec_full_reg_offset(s, a->rt), tsize,
+                         offset ? tsize : 64);
+    }
+    return true;
+}
+
 static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
 {
     typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i64);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 2b9e41a75a..339de72b8a 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -141,6 +141,8 @@ MOVAZ_zt4       11000000 11 00011 0 v:1 .. 00110 za:3 zr:3 00 \
 MOVT_rzt        1100 0000 0100 1100 0 off:3 00 11111 rt:5
 MOVT_ztr        1100 0000 0100 1110 0 off:3 00 11111 rt:5
 
+MOVT_ztz        1100 0000 0100 1111 00 off:2 00 11111 rt:5
+
 ### SME Memory
 
 &ldst           esz rs pg rn rm za off v:bool st:bool
-- 
2.43.0



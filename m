Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDC0FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:24:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAT-0007lT-L4; Wed, 29 Apr 2026 20:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAN-0007Tj-4b
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:07 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAL-0006Zw-I3
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-82f4a53ae20so246825b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508524; x=1778113324; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qClXpzIkhY6HXQLVy4Ou0WWe411jsSWReuNJ6IrI5vs=;
 b=l/SwTU0hKKhiUIYh7GKhmAlR2Z3CM9S9EmKsNWWzXodLDfgDRmGKgRTvZLe0ZVtLlV
 bq+LhmRReziu0aDsLA2H6bOnhgCiDwBsGdE3Nfn0Uftn/WZEXDG5PJ0fZnVMRQVFtcoh
 wGHm4JMaR8aYOVScKmGR24q3q1EZHTs8kf9HJ1v+J26HAwEWmt3/k8cBjHk9eUF75eVK
 WqS0mCvz3hqsH9LzhK0AA7FO27+WQcFuCmOjbSUKbKBYRqjZWx5xfZNSuBMh5AWT3Bdr
 hHp364JT51tXaAmKfUOyd0lsbtipShu98C9bkOdQAOjDo5c8cllnhjmPRJH8xmiL0uGi
 xcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508524; x=1778113324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qClXpzIkhY6HXQLVy4Ou0WWe411jsSWReuNJ6IrI5vs=;
 b=SPFadeHPHJTOZebb+GLc9M/6IMvtuQFYwYz/p/DoFXnjmKNc99JmCPPYPBIVIOiVCY
 fr5UAHNSilzEJGp5eMyDzR1mnvXUtiKk4TQ5XxRArk//ayN6KGdeWk4Eb71TVhUE4KQF
 s4KU6mbg4caImSTOkh03RkIBdr95UG6hgxu3tSnkCx/NczrQ/cyp/UxqQAiU8DCfzJMB
 XqwbxDpxH0Cu+fYI9lt2d8Jw7qzt7cjivD/GA9/8aDJ6hs7wR5vjC1EMkPHRYQAonlOd
 xdBXAURJva/WSUinL4SWLrK8PXIGglS8RCFZVM3p7Gb8MSUL+CF9fZrTN9e4UxGEv5mU
 Tcfw==
X-Gm-Message-State: AOJu0YyVaRGbOvACCb0TsNEJls6YwLcL7oSC6V2UpKb+Hf+/swkJAcfA
 GdXdg+ebIdy/G1KMSqtCMOOYkxuevpMUqHOBp3a7YvEflUWj1JAIyhMuJzF0mLvzwsg=
X-Gm-Gg: AeBDietZoE0mvyY/yl7GAOl6hg6lPcLukW0UEL9T4z4E5gkLSvhV4Ju/Qr9tNpJq36r
 gGWdvjTjGNtBrJx3ysDsJz/jkP4ko4eeUHEADEdaxshuNyTevs6Fy34W2AyjwDd67yhKFbT8rmu
 i8kI/YiJX7+4HKAmH6yo6STZgKd8iA6z/nidB+TEd5hWbU1adoOcF0+mcmS3arqbaBGwQa/WiL8
 IOY3NC4rmtUU4BR+g6wcAoRc5Yz6rlYTFQmzVEVgLE62OsM+fkGcHLoa4+VJvzLfzjyCTLQQ/iJ
 aM9idspsiJicWC32m6KUd4UmrUgMXszfp73OdunACgy4edpOafOLNIAn2uJ74XTAJ8B34HJqdso
 rRRq3tq9QNNSy2tU2v23URbI4HyZB0sCsn9/C/Dt0fc71LuDi/acU283qX8UXolzXquJdpgbWgH
 +omMptW79umgCwRLACj/tEbdruDqhxuYRwfvh7kkxZ
X-Received: by 2002:a05:6a00:90a3:b0:82a:65fa:cecf with SMTP id
 d2e1a72fcca58-834fdb0dfcemr862664b3a.4.1777508524072; 
 Wed, 29 Apr 2026 17:22:04 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:22:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 33/47] target/arm: Implement FCVT (FP16 to FP8) for SME
Date: Thu, 30 Apr 2026 10:20:32 +1000
Message-ID: <20260430002046.59739-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 16 ++++++++++++++++
 target/arm/tcg/sme.decode      |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 0cbad3e006..050c3cfefe 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1556,6 +1556,22 @@ TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
 TRANS_FEAT(BF2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 1)
 
+static bool trans_FCVT_bh(DisasContext *s, arg_zz_n *a)
+{
+    if (!dc_isar_feature(aa64_sme2_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           vec_full_reg_offset(s, a->zn + 1),
+                           tcg_env, svl, svl,
+                           FPST_ZA << 2, gen_helper_gvec_fcvt_bh);
+    }
+    return true;
+}
+
 static bool do_zipuzp_4(DisasContext *s, arg_zz_e *a,
                         gen_helper_gvec_2 * const fn[5])
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index d6192eb59d..a02bcc0e22 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -863,6 +863,8 @@ BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
 BF2CVTL         11000001 111 00110 111000 ..... ....1       @zz_2x1
 
+FCVT_bh         11000001 001 00100 111000 ....0 .....       @zz_1x2
+
 ZIP_4           11000001 esz:2 1 10110 111000 ...00 ... 00   \
                 &zz_e zd=%zd_ax4 zn=%zn_ax4
 ZIP_4           11000001 001     10111 111000 ...00 ... 00   \
-- 
2.43.0



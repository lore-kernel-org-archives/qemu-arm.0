Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDB4CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:06:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY0z-0005bM-OB; Fri, 22 May 2026 18:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXyD-0007rG-Ni
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXy7-0008QZ-NY
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3695bf7d082so7056334a91.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487425; x=1780092225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qClXpzIkhY6HXQLVy4Ou0WWe411jsSWReuNJ6IrI5vs=;
 b=Z65kUocnMGIUnmkv9tBx3h3R/AONhbPbINtU7ZSnmIBaPB2g5TY6fkub15TFcNrZoR
 cTA8xKLD8mp3YYfYr3G1I7QE18puQ421gWdyUFjmoPlOQzg0a8QcVojo8FWECW+VycBO
 2ECkmJ29NynOIv7EZdjIc1/ViwCdn7mHkM1h6tAv/sP+hU4ZYwE4ZetVp7xamtfR4Yui
 kxXOhRMiwQiz0IgFX2KUtTSRJWmabPMK3b/oKAyf1BMA6K0ZvJVEmpyr0JvGEr7yQuyC
 wCjxKKHkruUwre+dqXDolyukBS+4G43ifwjDCtgemN5HHFI6i+MwuizXEXoOaXsk3U3j
 gRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487425; x=1780092225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qClXpzIkhY6HXQLVy4Ou0WWe411jsSWReuNJ6IrI5vs=;
 b=idhxAqknXiUxlbOfZ5rO8o7WXIS/6Iifxru2QI9k/srI72B/lNVT4g06p2oe/jCx82
 uwvK73VoJya0/m980oakAVdQ8poSo+V6EpVwKSLB9V1ZtfY9TIOzQPq8KI1WbC71pEr4
 wDg+tNPwajjIYPmctsrbixuInc9j7oB9BLKuy8yDoHTZoH7I+YXaGKGC7nR0Zz2L1ZYA
 RWtCKXPKqvpmyfqvEoFsVCxegNyaC4eBN52CqXPpTIRYj4+KEF+AoQpg9Zp9z7ZkoTLh
 RB3CUfJ00fs5vAJuDl+cM/4nCbCeDP4Yr2nMdSFgCeNi6JVRzk6gq2caPZanI34d3O82
 GxlQ==
X-Gm-Message-State: AOJu0YzfNv2w2YG/G1ji+r5Zm84Ux60fRi9COnwyDKtaQxp2Pwnu0hDy
 Ej84L3EaPfVlA+ktDrBfCanuZEiIDLPDRV2YDeLOAIEKTWLbPCs/gEMKzUpxXV01QET9VCKEEla
 2+ims
X-Gm-Gg: Acq92OG66ZXbirAEyG3igmsuCqToqdvev/69VcWNI3GASbxnQr6p36/zAtZNECpX0sa
 rYYciDO4Bl5yzKhAl0YweyR7T9ko9f+W6WuAIqMui7IRW8zYa7i2Z8wmkRt5TeYDs6zJkgA6qrw
 oPykw7U4da1981+xtWJYdqu5sPa9gY6ND8M/RgowraouSbLMpy4ieY9t3A2VwA05LOqddyaLEnW
 lUzfgHhxD0X5R8MxEDnRFEtM7OBv5CnnWQsWDutJw3/nkcQ23T5kEXaj0qJ2didFmtJfLxqK0tC
 Zd7E6JmFDS7G4s2B6bQlLvNrbYs3p+jqdKoOwV4zUZBT5tNdT8hY3Jt/ssL2+kB1XiT6EdDaoSg
 0569yaqF+KpzC8pW0BQXjH5U4Q1nTGsQ/+AKcVef0p7JaDz5ACPFTd3WN2AGLyzP05GJwL2Spkn
 DTTPaQ0AtyLsHzXE1uGUauSlyLt8fUvf1d2hwNudwyjeLto6lYJA==
X-Received: by 2002:a17:90b:548d:b0:367:d850:6a5f with SMTP id
 98e67ed59e1d1-36a6761ec34mr5425277a91.25.1779487424769; 
 Fri, 22 May 2026 15:03:44 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 38/64] target/arm: Implement FCVT (FP16 to FP8) for SME
Date: Fri, 22 May 2026 15:02:40 -0700
Message-ID: <20260522220306.235200-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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



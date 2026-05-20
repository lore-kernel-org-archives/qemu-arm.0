Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADFCCD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:32:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZX-0008VI-19; Wed, 20 May 2026 14:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZB-0007Pf-LZ
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:49 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlZ6-0000ew-LF
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:48 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3660ab73adbso3661716a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301360; x=1779906160; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qClXpzIkhY6HXQLVy4Ou0WWe411jsSWReuNJ6IrI5vs=;
 b=cHqitFOZgz/9P89MbgSaHXdnCb0iMnmKzif1KDcN4zVYQ4xlu8evvGaeorrRQZ19pp
 pyH2VJUhcwqH58Dqca0N5L/TkQeKJpk8h6wiHiWyAaNA/SDut5jAti/jhj2lDUWmjM2d
 pZ7Rxh8xcq6TPSee3UzTCoxlyy7BEV9cBhJHJugWb7qrjAiS26usOHoe0Q5sEIy2qrbS
 AH09l34nnqo8p+81dOEVaQ86fXKy4qhBWRN2XjtCKv8aamkwiOSKdMdI7xtalRLFn9p8
 fIzlQPjRmL/LJHuHZo1VZHqONHBbtkDfeRUHqc4gY/nIKLf61mRFqCctzh5s5fgQG29U
 bbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301360; x=1779906160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qClXpzIkhY6HXQLVy4Ou0WWe411jsSWReuNJ6IrI5vs=;
 b=ae1b4SVmN/vcuW/+WW3EawUbMOZzgbd8TymuZCPisfTM46qevwc9na9+69IfYFqNQb
 /Tcc7qrRCRyS3uuiOWfqWUwCCENq+5TuKdsED3sTiDiIYbMGtkHF3QEjoZTenw/x+bU/
 drWWqYeNJEurbjOSCd317klMMzZGKlGrAXadjVrpp9yKKhXvCjBowCHkT2HOAjnXCja0
 jJMfapI7O2gp91774DA46F35iS+fAe1jQFvGKQo3BKPUg8B4YemnsRhQjLzFpurFWpwC
 alaKqd2/GQ3hN3pbARYZ/HcbDiZdxkCA/zGt1Jc3IronzcnplAO4EOb18kA9+fPwCV21
 5i9A==
X-Gm-Message-State: AOJu0YyXP5JOmqb19vHvsF/TXUpupYsXPKXg8zPfjh2hUMJkkoZx15sX
 0AYQ2iD2Gs6Ducg4fol6uEqs7cgZuf7qUR4WXeIelfBpk6K0Npgp784qRma8vDz1fhU=
X-Gm-Gg: Acq92OF3sN+ELdc1d4z3tUCkODEyN0WCLPQ0dRpn9L/a4RbEC2pi9J8PjZMBzmOicfQ
 5kZptr9YsLNuA6n9SAUEdCbmvqj3HG5ZNe/DNMdYFuoJE2fE0mXsB2UpNG+R6GFyRwR3OPHWKR0
 nmOfEs06rL4Z/62l+zwUudA+swEkrfulDZ0/wZppe0Pbz5ovuYfgxetTOvihwkkeSXO4fIS62/X
 WwgW3oPRQl+IUkuoIR80N+04r0Cq5/6R5Wer8kx6i0Yz04jYUPM1M69TZAjviEyuCJzytdxCNp7
 OGGhLKg+D7AX8pPc1nGjjhSyfIGNFOD04keI1VKrGZ44xNOt0EuEOCfJgcF3esUS7WI3AxbDzq/
 mvWHsovNqvURW4+3KnStRGWUJ/u6XCJxYqac/otuUl/7Reun3BmMlfEJ6bkkgyeAvWU0OIKTTl3
 p4GgQgIHSRrmFTPtCPqn7aExOskQV2
X-Received: by 2002:a17:90b:4c05:b0:369:7944:d723 with SMTP id
 98e67ed59e1d1-36a3cb2805bmr429772a91.4.1779301359668; 
 Wed, 20 May 2026 11:22:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 36/64] target/arm: Implement FCVT (FP16 to FP8) for SME
Date: Wed, 20 May 2026 11:21:45 -0700
Message-ID: <20260520182213.872945-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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



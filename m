Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0511CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIX-0007GB-5d; Tue, 02 Jun 2026 23:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI4-0006h5-JN
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:12 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI2-0003fc-VP
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:12 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8423f420455so1391916b3a.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457349; x=1781062149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPwmmJFUjef+Kqfhm4rFoijt4nOcoSJTA+5hXdlp2cI=;
 b=qkBEInEa+aC1u7b9oiLtJtw1l/YyKdhNm6XPhO1Y1lRxLu3KJ9Z7cIvnW4BcjNNm3T
 sD41vkWbl2x2j9naman74KVe8qjvcSMZl3Ush4ZXhyhETzNZ5MFowWdg242mLRjBOMkY
 xHvdAGpdOdApadLmsxyMWPnWGE+eL3aabmx5vDNWT9hjQi9JIbMOPK/0Rzr80eeGU8Dc
 r9wo1d6SMB5hfNGKYfg6GVzvNrF3B2VRrNeLbwNw+dWTd3Z03ShDQmlLnM5gEOwhPffH
 BKj4oD0TWv5KRiNA53nsXeDJGRFsW7krotoVPnBXCkVwjxtd8ivIvmQHUpLKepKHgPOm
 y8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457349; x=1781062149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XPwmmJFUjef+Kqfhm4rFoijt4nOcoSJTA+5hXdlp2cI=;
 b=Y3mMBk0cdfwrBxixzYhv1TEier00/0TAijuwVBqeeD4wS885Z/V1pJ3HQWjaeu91J9
 /0NrsQXYDEwadWu38G97ObTGxbKm09/I1dHyS9/2Ijfl+/3BltqjzauR0DR74RkrKbiD
 5uv2MmRCbHgJmdqeS8TgYN/zRitcESrI9xdpsSd8/Tp+kZKvyG/AsHfXQHj+9g4pC8sE
 bEf9kh86ZgJ3+JsweZZwG+JUTzko+Z1IikRpLrZ9CCOSCy2yEHVy01vXwixlOhxnjHWQ
 gqXBU9fOcbiFskzsrsfYZTecocTj5rQB48b2kHxVoCn0fQ4hzWLt1aCJU94Q0DlOvE6o
 MznA==
X-Gm-Message-State: AOJu0YwZtLKumPStTn5dCnPq8rFaav2/+hmjIXbI4OdR5z7k4JhoZi/4
 HD2l0m99nDlVs/ntsk4CIWUTs7pPPHDFSdytumnODdMzBZV3WShf5tdutK1ob7O903Rq/l/Vwb0
 qNZXX1ag=
X-Gm-Gg: Acq92OEDRAdF9rB2yJexpVUfXjglCEM52v/eKtCrxT0Bm8qaoi+4wWLX/XXKe4kYqx0
 ovNbqo9EpSyFpXko5EO4n1hdHdi6I5YYE6d0ai09B/dDIlzouOvm/ksiuN2l1W8rO/zaeWf7VZe
 7TreM8tzo5Jl/3l1yLzgx9RiR3I8qPd6DstDB81OplLF1kRvE41w9GHLKKqoVwfDLH+5bx8jaMV
 Vs8jC3sSzYj+EjGdv3YnSkkvumWk7u2ZkZLkJF23xNgC2xWq3YoGu+Q02WW+24EjJKp8nNf9X9H
 x/0nBsVYVlgAzRKVfbO6pufq4ZI8dxE4mnS6VqpTVFtW0DITg8e+c5Gi4uva2GDYPUJXpgpPIMB
 305971Ni4LKU2/FpwMzW8az62iCIw7hffKvjYNREU7sHAcc762exn5Gi4zpV8KCq1vxMqxZLXkV
 BfIehguJ7wOzmbybAf8CQnNBlJvULaYbQuH8aqGik=
X-Received: by 2002:a05:6a00:218f:b0:835:6bdf:c87f with SMTP id
 d2e1a72fcca58-84284df01f6mr1445693b3a.9.1780457349493; 
 Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 19/45] target/arm: Implement FCVT (FP16 to FP8) for SME
Date: Tue,  2 Jun 2026 20:28:28 -0700
Message-ID: <20260603032855.106930-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
index c0fe77242b..49eee95d88 100644
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



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B08CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa42R-0000zd-CP; Thu, 18 Jun 2026 00:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42O-0000vh-4Z
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42L-00046u-90
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-36d98b9aa9aso277981a91.3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781755647; x=1782360447; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3sDxn60tZijXHrH39BE9L+baesYT2v8cGj36MJTLIM=;
 b=ZnB9kiyz0TMlQjjPBbqQDEUzPRBsmYSMu7xqBUEvxJZ2eTjYK/MDCdNfgDwLbNlT5P
 idHebKdu9Rr5nrLmFdNdei83q2irl9rPcR08W2wfmB4JAvbb7f2/iQ9X+2PA97G78j0E
 tPvy/PwTA3We03lcT9NyLwnITl7892zaluEXj/+Gz9BB80efsXxa+kj58kEG2qoImbqw
 ibpiTbzhLOL62mcqFTiDfMo7rSN3PECCzTwLf1hJFjP/j34GRJQ84Ga0NUEhqNssromG
 TXj7nNLAVC0wMdRiu5xzkGR9HsSFDdA2LoSujezK/uKF6psWWB4Uy+TRF2W1LXI5QZlD
 +iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781755647; x=1782360447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t3sDxn60tZijXHrH39BE9L+baesYT2v8cGj36MJTLIM=;
 b=lS56Mw+YMSk4PUFuef+JJihUt5bAJU33mKbe/CLCQWvPKvo8LRN9CQkO+DiTDXBU7k
 IWAJXiq7nemgRVMxYJ08Y4aCd2feHKCMu8kzLtiP7kRD4a6pp5pUA6TsrmtX1ZjWWEvc
 6YF2dyIqHNG+fYHucBOdNL1S+LUU9rtdWsiYt7tcZCePtitIkMfqTiAnP+W45lvChJGZ
 S/lWB05NJOUU+LC4msGjTOSKHiQRtJRo35XaXTi7C/etz+Ah5vvvu3jU/LrJOsKAqOcF
 0PhMvFQ1JMNoaNoiFMYXdtT2BA9kE3MavvhEQziCdTDC4SN7vB7R6BLWSqPGhr/b5czA
 UFOw==
X-Gm-Message-State: AOJu0Yye5q36sSqLJi0jVFLIl1qSbjvlDbieA86+eMmivKpKdUz4gV7t
 q+OeMu1OoxOz1fNh5GfhC9DxUMyriEhtIVLcowilyMh0gcRzPRsZKkXnT+dow0oxlOw=
X-Gm-Gg: AfdE7cmvyeH15C6eyoz/yP7ETyiVEUUKzvTX1sh+ch1W/H8kmmIcDJlGk4qNz0diaCq
 d1nbqm5hQgDtN1KH23HgWj2cN8C2BHNUC4ipWgE1Y8nkVFPEIJPA3zLJndU3XXIYVB9/l+kqRuR
 /z5EWqRLGqz2j6CciAZn2RZY/eCBRSbYjhtCHmUMOvxQM5Ivyt9EWOpzZ04Oma9zUoYYhEAMk8j
 ZoW8FcmV/NICXGA85FL/n3bqZHYL0Feq7MloJd/Kzx1nGZti6Bi4t9XJZqdPxS9338W9aEqJ72u
 shlWClTe7jG0PtVt8IbNbtacvezEa1aI4StqNedUGKF3BoGg3JhyAhOrSWGLuwaZTgSOiLdnHSy
 W8O0IxobBFKoaIrxlT4IQtxS+BOHMi6QU2HrenQck19PdoESpY9/7vd9t6muf6Yx37oAUoqxD0q
 r7J5g5IWnwOEb+SDPyRBqFzCctPzcWPr9/hBsGdQ6G7tABB1/1169ASCUCCvCL
X-Received: by 2002:a17:90b:3d92:b0:36b:2179:6d23 with SMTP id
 98e67ed59e1d1-37c9dbbc953mr6972616a91.7.1781755647054; 
 Wed, 17 Jun 2026 21:07:27 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c5222e042sm8830476a91.16.2026.06.17.21.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:07:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 8/8] target/arm: Use expand_pred_N for helper_sve_not_zpz_N
Date: Wed, 17 Jun 2026 21:07:18 -0700
Message-ID: <20260618040718.572950-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618040718.572950-1-richard.henderson@linaro.org>
References: <20260618040718.572950-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

These is a bitwise operation; with expand_pred_N,
we can always operate on uint64_t.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 43 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index b2875a559b..ac96b18784 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -917,12 +917,45 @@ DO_ZPZ(sve_ah_fneg_h, uint16_t, H1_2, DO_AH_FNEG_H)
 DO_ZPZ(sve_ah_fneg_s, uint32_t, H1_4, DO_AH_FNEG_S)
 DO_ZPZ_D(sve_ah_fneg_d, uint64_t, DO_AH_FNEG_D)
 
-#define DO_NOT(N)    (~N)
+static inline void
+sve_not_zpz(uint64_t *d, uint64_t *n, uint8_t *pg, uint32_t desc,
+            uint64_t (*expand)(uint8_t))
+{
+    intptr_t opr_sz = simd_oprsz(desc) / 8;
+    bool zeroing = simd_data(desc) & 1;
 
-DO_ZPZ(sve_not_zpz_b, uint8_t, H1, DO_NOT)
-DO_ZPZ(sve_not_zpz_h, uint16_t, H1_2, DO_NOT)
-DO_ZPZ(sve_not_zpz_s, uint32_t, H1_4, DO_NOT)
-DO_ZPZ_D(sve_not_zpz_d, uint64_t, DO_NOT)
+    if (zeroing) {
+        for (intptr_t i = 0; i < opr_sz; ++i) {
+            uint64_t p = expand(pg[H1(i)]);
+            d[i] = ~n[i] & p;
+        }
+    } else {
+        for (intptr_t i = 0; i < opr_sz; ++i) {
+            uint64_t p = expand(pg[H1(i)]);
+            d[i] = (~n[i] & p) | (d[i] & ~p);
+        }
+    }
+}
+
+void HELPER(sve_not_zpz_b)(void *vd, void *vn, void *pg, uint32_t desc)
+{
+    sve_not_zpz(vd, vn, pg, desc, expand_pred_b);
+}
+
+void HELPER(sve_not_zpz_h)(void *vd, void *vn, void *pg, uint32_t desc)
+{
+    sve_not_zpz(vd, vn, pg, desc, expand_pred_h);
+}
+
+void HELPER(sve_not_zpz_s)(void *vd, void *vn, void *pg, uint32_t desc)
+{
+    sve_not_zpz(vd, vn, pg, desc, expand_pred_s);
+}
+
+void HELPER(sve_not_zpz_d)(void *vd, void *vn, void *pg, uint32_t desc)
+{
+    sve_not_zpz(vd, vn, pg, desc, expand_pred_d);
+}
 
 #define DO_SXTB(N)    ((int8_t)N)
 #define DO_SXTH(N)    ((int16_t)N)
-- 
2.43.0



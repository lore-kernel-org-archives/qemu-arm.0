Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B954DCD98C9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:31:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28G-0004Ox-Do; Tue, 09 Jun 2026 15:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24x-0005i2-8n
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24u-0005XI-6g
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:38 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2c0aa420401so46252025ad.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781033086; x=1781637886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/Nwiw9t72saqAIpJgwvgLiVqmULMLb29nkCaEYkMzk=;
 b=H/Mmzvt/bE7CTHL9Bae9JLbYlMf5V6YkkVp4ZFTMva0TIsPTyJwA9oFu+s4Fh88CzZ
 PaaBo4wd8ZwZI3jK0Pl/zCM+p5EVS5VRYKC6P5yN27Xo4XZ0mF+XvUIscnKklX0Z/Rl5
 2NBEESUJh0xXP9V7CUln+yqbsrFIdxpS7ZnsbsU5YY3G0sAgPwQDjn7JDwaK8JlvCMoN
 gXGF9yE9o7PtSTvgpQ616JP1UatcaOGyXr6JXcMzX0jiESUyoa4X6xW5/KS5Un7mrLZ9
 OWMZWl4DtbyfaO3TE9GqYvJnikx1dAV60M6bwXXyJ6iU9YAscvw+KQHZlym8GD6vaD/B
 99DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781033086; x=1781637886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J/Nwiw9t72saqAIpJgwvgLiVqmULMLb29nkCaEYkMzk=;
 b=cedrIJWkNSS5kT+QYgYKK+H3dNBlhnsymhGPJnjFTXrohLoaUDkkV4jegwK+fa0yfE
 872opNhMpk+jR4KJqP1FX7iQa62U94fxbsuYvd9/5SrrkBgbvD2oU5cvllHxS2zoWDGH
 2qhjpTgzP0LxDbuMKRCxF7aQlh//r3dzVJGnCoHYaX3OA1UTZSgiDmSybxn7sfQPrdkt
 Is0WxktzmK5a5JFGCS2eZ8R9Ft9HEPOYNQTlYOQQugYGdqa6xITXSORHdfH/DdY/Yf3z
 nN+gtYiHckRXdxCCECMHgcrLZeejNoj9Nvr/4/swSoAPU7gJkO5taAVmBZ2ccVNbxDsb
 ZDbA==
X-Gm-Message-State: AOJu0YxLM8Zfl5rFI6r18vLhD6hS2EiaeXLzst+CP2BFtlOf6FUGNJjS
 e+pOR+QlcgzAQjeXLAd5+/aNrz4jwv0JlwTmtyjXiclW+i6f8P7jNIVUULay4NOGN1s=
X-Gm-Gg: Acq92OFROkO1q55o/LEVhKBg+UD79vcUrEY71TVOSkOCScAvn3v17zeMcH1EtRr48p+
 tPwmJ+ISxIgjgvSsPUid2lc6nSQgoNjrBw7pc/kanrpVn3q8yCC4J+/Iji9ITMdhC9FZ3eegxPO
 2pamMdzSpCt6XthKqr+Bvn5axsPUh5rSPwL4MP1hU2hpm4ragp2CoW9tK1BolMWsyBtCm6oYs9S
 7iXS2WEsYgUgAhJQwgNA+CbyeEwKJdpqrVd+JbXt4pALg81IlWvJt4DXUjypDrGZRfcDhXXG8DZ
 2Mh7Nk8HWX9XrmssxGmS7k8Jc8gSW1qA+PrhpUTvJzXFcxZbD3uKju6pN3wDA5VOGQ7zyV78ZkR
 abInO81o/LToX2K2xSOUc8Lou8bbJHryqCdgQ2nr4+2feHz/vIG6aluhmuRRr0GKO/pWFZkA2Vl
 Lq9FNAU6py4Ud7OoOUQ2fOY9VicOmaMyBacetrZSU=
X-Received: by 2002:a17:902:f745:b0:2c2:2a8a:af69 with SMTP id
 d9443c01a7336-2c22a8ab1a9mr197825995ad.9.1781033085791; 
 Tue, 09 Jun 2026 12:24:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa00b3sm212247045ad.32.2026.06.09.12.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:24:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 44/45] target/arm: Implement FMMLA (FP8 to FP16) for SVE
Date: Tue,  9 Jun 2026 12:21:08 -0700
Message-ID: <20260609192110.752384-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      | 5 +++++
 target/arm/tcg/translate-sve.c | 2 ++
 target/arm/tcg/sve.decode      | 1 +
 3 files changed, 8 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 6d65706186..5a14507682 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1713,6 +1713,11 @@ static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
     return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm8(id);
 }
 
+static inline bool isar_feature_aa64_sve2_f8mm4(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm4(id);
+}
+
 static inline bool
 isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f6705ee95d..a85558bdaa 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8477,3 +8477,5 @@ static bool do_fmmla_fp8(DisasContext *s, arg_rrrr_esz *a,
 
 TRANS_FEAT_NONSTREAMING(FMMLA_sb, aa64_sve2_f8mm8, do_fmmla_fp8, a,
                         gen_helper_gvec_fmmla_sb)
+TRANS_FEAT_NONSTREAMING(FMMLA_hb, aa64_sve2_f8mm4, do_fmmla_fp8, a,
+                        gen_helper_gvec_fmmla_hb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 6610432528..b53fe6a58f 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1809,6 +1809,7 @@ FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=2
 FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=3
 
 FMMLA_sb        01100100 00 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=2
+FMMLA_hb        01100100 01 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=1
 
 ### SVE2 Memory Gather Load Group
 
-- 
2.43.0



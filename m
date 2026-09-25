Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6F7C9830E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADoo-00083q-Po; Fri, 25 Sep 2026 17:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoE-0007lg-Bd
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:27 -0400
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo8-0007ly-V9
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:19 -0400
Received: by mail-pz2-x2b.google.com with SMTP id
 d2e1a72fcca58-880adb5d043so399529b3a.2
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373012; x=1790977812; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FSdoU+FSdyC2v2sCymw+VLzuXFDHBTG/nVBUdUuu2oQ=;
 b=lN3NmtmCehdzXBeTnVAifJwnZoHluxpJRQt0vrxWPxLMlgxAPa0FpJE9enDQy3Hm/7
 zOg6ei3qapoEAwvbNy+4TqNdFtm5aH8g+e4KCfFEkcvqRjcmfetfx9kxeOzTvuJAPdt7
 f1/c7GiIeX7ez+5lFw0pRGpWreLbmyPUy+nQe8KaQ16PPXEcfjzAwxthjWqlHwxGqQsy
 8rLEJj7HYBRozSPjYQ9CaiuaS5/Vrfp5xNz/vZVXAMSKCMfae436jIIaeK+lJlQGFD4g
 MS5VyH2hh8QgJKVAZXB9x2XGnL2JBPQQjjYzDSJqTgKg31FuXjTlK9+CaLsDQSNlfCKY
 McxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373012; x=1790977812;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FSdoU+FSdyC2v2sCymw+VLzuXFDHBTG/nVBUdUuu2oQ=;
 b=PLHUH/kH2xJLh542Bfo6PDTFo0/HxcfSLLr25FemPyDIcmmm7E+i6z2Zvmg+wuQdUE
 J/WNgspeyUIND+PXJVTcdVXtXl8AWmpJJ/YCp/DbKgUuMHNtYsn59FyIZgrRtYNIBNC7
 wZMa7SWcAGkJA2oGNAJOQlpQyXk8x9z7M5l3HRZLEUg9IWDWcAA64Tqjv6PZd0XdNMJj
 HeZ/wylQ4Fo7q5hz37dTEiSqnrEBwiW/JzPrgkb7laOLgqBlntZ59rwzZTmUiFNgFSEv
 HYu2E07GqhTmSFYcJGniSh6QtLLp0pryvPBrvKS8pK97pAiHeOe0/uBk4JR2DWBX4knO
 oz7g==
X-Gm-Message-State: AFuF++n6RvFeeO1DcIvhrD0pINk5109BIkfznRrG5uJlebgj3Nt1qMMr
 hBBjqHI0q57WERJtEj1umr+9w7ZZu4aYiXplIuSiiSrmmIixye8Qw7YXmlW8n++Z+1k=
X-Gm-Gg: AYBFou0a8AIO244IVwMk8/MFAWiqSErCI54N526JfTn9k8tL371GbJ6kk956b6fGKIP
 SzkxWUjaA2wVjsUhy4h5q+TOzGIlvRoZOv2HITAm7t7XyVDSFp8+zB+E0tlSGaTSjkWh8K2RM+U
 whTu00Uorp98hjIGU5Cs1Mh8tKPTAyj3oW5TONxqaoCIhBZn40uMAWKq+Yv0ZKrpQhWNI2G/PgA
 aQfpCjyqs9I87KvNBZs1NBeijUn4Vh2/VSknZaVpqc4IHovoOqhJxVe64B9JHdn5zhzw7RRe/jn
 vclH744GcgsZGNY2FdLsmDuoZuOheWHt/L8/171BzY2juEH2wGO9H7gHgRBbjQD0RujOylgDrn0
 iPNtFRiIM5cmhFezYtFi+f3gUBtwwvMguU9+3Hj0Lu2/lj0+NoPWtQbz23DpQjCG+jPd/ar8vU8
 klQPbMiBSSaLZOf9djrEPIIujQo0kITA0Zz011xilLpVDm0t0u7erQofuQTPoTx65r+NknM3h02
 X0lfZZhvPIT6mTQaUMxcRcfnIuudw==
X-Received: by 2002:a05:6a00:c30c:10b0:880:7dad:3e5 with SMTP id
 d2e1a72fcca58-8807dad12a7mr1413681b3a.51.1790373010436; 
 Fri, 25 Sep 2026 14:50:10 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 05/14] target/arm: Move ID_AA64PFR2 feature tests together
Date: Fri, 25 Sep 2026 14:49:55 -0700
Message-ID: <20260925215004.456336-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Currently the MTE feature tests are clustered together,
but those are spread across two ID registers.  Sort the
functions by ID reg and bitfield order, like most others.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index eecbc3b889e..06318d12f9f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1207,16 +1207,6 @@ static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTE) >= 3;
 }
 
-static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
-{
-    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
-}
-
-static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
-{
-    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
-}
-
 static inline bool isar_feature_aa64_mte_mtx(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, MTEX) != 0;
@@ -1237,6 +1227,16 @@ static inline bool isar_feature_aa64_gcs(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, GCS) != 0;
 }
 
+static inline bool isar_feature_aa64_mteperm(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTEPERM) >= 1;
+}
+
+static inline bool isar_feature_aa64_mte_store_only(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, MTESTOREONLY) == 1;
+}
+
 static inline bool isar_feature_aa64_gcie(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, GCIE) != 0;
-- 
2.53.0



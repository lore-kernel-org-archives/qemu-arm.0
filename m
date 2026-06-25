Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F1CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:54:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGB-0004ot-9Z; Wed, 24 Jun 2026 21:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG9-0004nj-NH
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:05 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG6-0008Qc-OV
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:05 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2c7f5869cddso2876855ad.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352321; x=1782957121; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eQncSFZsFgVseAuhiRF3eFkhO3t/hu3jVm0WVWbPxQ=;
 b=EWHxEnoRLhJl+4jikAxh3eVoMgYK9eH+WyCeMFxZPoiY11KoaIUlrLDPyU3rnzkjS8
 X9ylb68MO2UoQZSmeuWLRlxIa7mGXKEyIqPXppItsqxbZg72f7L13DapAH5hBmYqkuwo
 8lfYQ+obyPczRuBKpdOgIxS2lfBJy/wvJHanw38iPTtl8dNpee+FvPAYL7tLGvnXdv35
 +WecckKER0Cl/PN0YgVVIiAxfx7R1IL7i1XLBVmeAu643xKRxln+HdqM40lRKX+3vX1M
 S7FK19ItpQU9beoxI7Np6Z04Iu10Q87si8xyqrLC3zE1+AaST0RhGvCm7BbId16Sax4m
 jqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352321; x=1782957121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2eQncSFZsFgVseAuhiRF3eFkhO3t/hu3jVm0WVWbPxQ=;
 b=gFRboVSesXj260VX+R8KLL2vFIO2hqU8TES7MlB4/AyJJ9vofUqZvWYv6YKSv97bEd
 m9GirpV/8XLaRQ6Aah/MBeJtF4pYB/Z+bwQTmENZZ2yY5TrKFJNGAou8kVIv+PgF1ch5
 35T5HnBw8LuXqw0Go+qvD7b00kNSZgK+f6o47yAdBcJAH9ZkpkYKcwCrV7H/YIIZ5ZQT
 W9uZML+gqBLx0cOyMaZ3so7Wur2NBKVcD0i2I8XfsuyCaMm779bDVpx8cmSd/M1GSlYy
 bLKoULWz5YOtch5/XHSmbsW5F4ySJR4heHHCFVnM+HlrBuKYzSjMagwyT6eNTe+k3slW
 CNug==
X-Gm-Message-State: AOJu0YxY0hMjWQbStFDDNsOwc+LBRF/fWjaaJUCRA95p884zC5AaOXDR
 V1grm8vy73t+UChp+KC4KBlWfOU0mUwMBHM4UXMNWWb+Sk73lTQuLpIZ7NG9UXIIr31o3zz8K2X
 6EL6z
X-Gm-Gg: AfdE7ckTqh5w/sx/paw+9iZ+5t+ZLpCtMOl7kxQAnFsx3Y521V0oN2rrK1hKzGSBGOB
 SdFeryt5mQjUAdlICb6ax+aeSiYQZ4/fX2l24f6xwd3EToethQ4rg3N0RrVBzAkI37npxuH6XLe
 nNbh8VAVlxFpZMrl7tGhi8DioFeMCv4XS6emn1xrstk+uenIGMjJaKvaVx6WSbq6gjZWD+9BBie
 X2FPLIG2bV5vs/t89vrJe4mCTxZxRdHvHXDG8I8yRdE9R4rBLkrbhtszNVHSOyXIe8nRjGs0DHa
 OppEYszIl0lSDc6gx2sONDeBa6a7jmEL83D0A2QUl2HcqsGau5CQPiZOpmY7vd00ylN6yx27E6T
 Z8Yeb9r6kYH6CBUMR0J0wqHuceixP5HRsrYXV2jCM+39mQlg5EmDjvuc2zU2CFNbImFZM4BvWqh
 ciwyHdktRBthxjWmiEBr6cKpU6JNm7+xYvUOgnzMtPyy1Fw0bgKA==
X-Received: by 2002:a17:902:e78d:b0:2c7:f12d:5d37 with SMTP id
 d9443c01a7336-2c7fca15751mr6766505ad.17.1782352321096; 
 Wed, 24 Jun 2026 18:52:01 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:52:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/10] target/arm: Enable FADD/FSUB (half-precision) with
 FEAT_SME_F8F16
Date: Wed, 24 Jun 2026 18:51:49 -0700
Message-ID: <20260625015159.719300-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625015159.719300-1-richard.henderson@linaro.org>
References: <20260625015159.719300-1-richard.henderson@linaro.org>
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

These two instructions can be enabled with either
FEAT_SME_F8F16 or FEAT_SME_F16F16.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      | 11 +++++++++++
 target/arm/tcg/translate-sme.c |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 45213f71ab..cd78353609 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1605,6 +1605,11 @@ static inline bool isar_feature_aa64_sme_f8f32(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, F8F32);
 }
 
+static inline bool isar_feature_aa64_sme_f8f16(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, F8F16);
+}
+
 static inline bool isar_feature_aa64_sme_f16f16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, F16F16);
@@ -1776,6 +1781,12 @@ isar_feature_aa64_sme2_or_sve2_lut(const ARMISARegisters *id)
     return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_lut(id);
 }
 
+static inline bool
+isar_feature_aa64_sme_f16f16_or_f8f16(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme_f16f16(id) && isar_feature_aa64_sme_f8f16(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index a79b0a9b80..b8dde80c20 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1335,9 +1335,9 @@ static bool do_faddsub(DisasContext *s, arg_az_n *a, ARMFPStatusFlavour fpst,
     return true;
 }
 
-TRANS_FEAT(FADD_nn_h, aa64_sme_f16f16, do_faddsub, a,
+TRANS_FEAT(FADD_nn_h, aa64_sme_f16f16_or_f8f16, do_faddsub, a,
            FPST_ZA_F16, gen_helper_gvec_fadd_h)
-TRANS_FEAT(FSUB_nn_h, aa64_sme_f16f16, do_faddsub, a,
+TRANS_FEAT(FSUB_nn_h, aa64_sme_f16f16_or_f8f16, do_faddsub, a,
            FPST_ZA_F16, gen_helper_gvec_fsub_h)
 
 TRANS_FEAT(FADD_nn_s, aa64_sme2, do_faddsub, a,
-- 
2.43.0



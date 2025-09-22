Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A7BCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:50:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbj-0004k2-Ht; Mon, 22 Sep 2025 14:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbV-0004dW-5R
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:38 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbO-00043E-Ek
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:36 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-77dedf198d4so5063358b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566968; x=1759171768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PO0Xi+l8mZtLQEAvQVUzx/DN6qW1/Pe1V+/XNJEzQZI=;
 b=VhbsvFzFPdDRAF1snKzIe9PUajBFEmXDClLnQsEkOAK62HjAycgjiu3wA6TlC9IH8c
 6FxUaRoYc2lpDPOyvP5lKWEoeiRXf6ay5CbMC0AGIIeCUNkp8uxE39gmCrKpF4PDTYjl
 YGInA2Fuf7gRILmrw42QPguUCiMR1xlmG9fUwwq/tc2MB/lPDm1FojU6VyvjLlPavVTQ
 w72d3/DZ/aHCKAUQlzaZ6TspJbgUJPHceZQk6Gb+zJH1PrfTetusZLfD3O53pIvdpZq0
 zw8jXH0CScHJlGbOXBkTp0kTL7706lD0Nl8WpFxVgNlCmIr2lhlml9JWqFwFOnBdppmk
 gwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566968; x=1759171768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PO0Xi+l8mZtLQEAvQVUzx/DN6qW1/Pe1V+/XNJEzQZI=;
 b=ZOheyfSSzkwg7ADZHDHSYj5S783fdNdkGjdIxANMaf2wOIUbFU5Xp1ZnSFQhAf/A72
 iW2rHhi46IUjy5J2aIc3EDszFCFBOsZgreU1c1+P4pOVDuoLhKmzCwovQ0//i2vKryKs
 8sLY6xPiZt6csOgUepktrJHVhs9VHiRDWS9D/EFlVBwwwWK0uMiNYxVcM61ZQus8NV1d
 i/CpHveRkanbDCMvSETWFGImhY60VF8RnAezN+xEcARGqk10H8tFf49M7gE7b4GPflX9
 XMRF9Z0yq0X2PRT3WqoKQpxSATJdP8ojhTTnKO7RP9EMOc0WsCDoUvk06q9ruqSTrCdB
 KPCg==
X-Gm-Message-State: AOJu0YwyR387XUUDQcvriyYgcDhhEa19trVZRgZrZ0Q+PiEpycJwhf/8
 e+oFT3CyLg30LCeaaRDh//CSU0PVRVBjor43qjC5mojo0N3f4F+GJp6VLcQJnzl0ILI=
X-Gm-Gg: ASbGncurbdnUx9X3XgjITOSNJOFnmCMv45JXyBnIHCRFPJ590ZG/0HHG7h7VHTj7tct
 xwWBPlTE29PvOgb5PS8OlGt8JL/iJQ4+iwOfFoPDj9A6Vc9fY2glqALZi+aKiT4UiAWyX65vXCh
 Yycef1/X2Eg3Ibw/hXsWytfxlT/Ic83JKC6nApe3+jUAjZ9XkRQByyEXT8tck7nE4QaTYYEKu4E
 7LjRK7qgR/+ynxCDSTxD1RXORyourCS/3K3mHhNkhm6GrL1xYfsgJF+Ez88AZfkQuvenusYopcc
 y04bmqeIrDLitXPA2ocxMNPlk67Pq1z+Tc1dfWapqgLLgSIZqPlrWPbB8y6DVkv58rw6vyzl6pz
 SgXqeK2JvJ8sSCcvgu03+mwOVbR6m
X-Google-Smtp-Source: AGHT+IFAoWDE2Xo5VUCA3sTCW37h4xh9J8gZ12D9tXkpg4J86+p1egZF12lbfBiVGMzhlPTGj2OHLQ==
X-Received: by 2002:a05:6a00:188d:b0:76e:2eff:7ae9 with SMTP id
 d2e1a72fcca58-77e4d224dfdmr16519530b3a.12.1758566967868; 
 Mon, 22 Sep 2025 11:49:27 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 01/76] target/arm: Add isar feature test for FEAT_S1PIE,
 FEAT_S2PIE
Date: Mon, 22 Sep 2025 11:48:09 -0700
Message-ID: <20250922184924.2754205-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 512eeaf551..30226814bb 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -929,6 +929,16 @@ static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, SCTLRX) != 0;
 }
 
+static inline bool isar_feature_aa64_s1pie(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, S1PIE) != 0;
+}
+
+static inline bool isar_feature_aa64_s2pie(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, S2PIE) != 0;
+}
+
 static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C27CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:02:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9R-0003xO-7K; Wed, 08 Oct 2025 17:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9N-0003wE-Nm
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:45 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c90-0006cU-St
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:45 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b6093f8f71dso156857a12.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960576; x=1760565376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SQAAU0LUd+YJ4w3rVEYpCD6XNIllbO9nR7KElVuTa0=;
 b=jZY9nQNY3Fvk5OI+JzkZ0a8tQV3Z3aF1YoRXtyebTN8MyowidecGnJGgiSjwTDf0vP
 6Qy47kx7heMzyoSjr7vCYPwA2C4kJB/dtKSLjbuahXrK9ugPuEUT4Q+Hgr2L+G8oIxls
 3E+0c82hFHpUXpWLVU5Us3TNDsHEqEGA4YlhbODYuy4XRz6usB4MPTDxe8ok5iC05tNZ
 Eskr7J80yo6NW6kyr7cTsa1+69GrCNmZV0Hb6LHfyvHXSOEyDu9OX3vZXEfrghVecIJ4
 83GuT/41VREjSp5eI37jg3EaEhKlE14WfKD556rHiZeVRelpK0+QTXRTKmCwBFpeZQE/
 dj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960576; x=1760565376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6SQAAU0LUd+YJ4w3rVEYpCD6XNIllbO9nR7KElVuTa0=;
 b=mTx/csRI5ooaa/uq5+qjhAaof6Mr4AI5zpDG/Sc+GzOcGlJO2/K8zHFGLzktbnnLAl
 NR62m4a0zeHbbRX0oJQFfI0+73/TLqHTXbwsFvbEpcMA8WtfR4SAezmq3/R2hio9/G3u
 58nn6gedogAE6wr1KyaTWLMucf4KKr9kTwnP+XahLOxWKQwHiQws7NxtEF4Td2fFHLrY
 KJyHWXLQX1BNaZGhREIR4t9lCy67cCZ42eTmm47ZpJpCOjAZvpkEDa9VMHj7U36in86x
 vl+QpkD8IO+zVuYAuwWXV9WiewMQNNujENxp0PCmwsGgQAHaNgVVP9j3JcNbt0daq75g
 jXEA==
X-Gm-Message-State: AOJu0YxyaZyQn6o1dhyA596nHJ64qqmhOqRcdLAw+xWaAZOqtceoIu+N
 GSHWUZoLLEqNJnR8RsXl/kwyquAxKi0y4PAwlmtMcH0pc7j+xPvI4Tr5iX/lpBdWEog=
X-Gm-Gg: ASbGncsxE9FRlzdTX1mK1nyzbYq2hDy/wtu5DKKcTmUvjStbucpQOyBsdMiGc/fxFCU
 CDdZlBZzid0ujTjLq+20+MvyhIFcveAvrCjf3gS4wEUF2iogoRc5zrRtmdO5iys4bYD7a4hOqB8
 CICTyyZk2hvan1mQ9FerCoMvZn8CXBNHkjRmBLEwu54gJmPcjmxmnL/jxP7RFdXz0y+uu6g83vv
 Pb+1sY5ey4UOyc+hISl4t37OuolRiZzMfYzQUrKYG+7JclqMQPlYrsguKTfi83vsVXdlDs0sw1H
 hZCJiBxEnGYlbfW8d05kwXkoZv5ewe4q0Es7PN45Z3oLsmy5k2FPwzIZVvg9EPmN7c/4qbKjnm5
 d95tUT4S+Jvd8JzcByHefTkF44Mod8WTqvxEdqKVa55CPTt4AY1BiJXwN
X-Google-Smtp-Source: AGHT+IH6btP/21lQ4QAi54Y29iKhyNTAJKPbBZY3akXiWVz6M94tk3uBCAQBX64ZMjMVJm8tEv2pjA==
X-Received: by 2002:a17:903:948:b0:249:37ad:ad03 with SMTP id
 d9443c01a7336-290273ee21fmr66086965ad.34.1759960575974; 
 Wed, 08 Oct 2025 14:56:15 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 02/73] target/arm: Add isar feature test for FEAT_S1PIE,
 FEAT_S2PIE
Date: Wed,  8 Oct 2025 14:55:02 -0700
Message-ID: <20251008215613.300150-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f59c18b6ef..f3e90408f7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1349,6 +1349,16 @@ static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
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



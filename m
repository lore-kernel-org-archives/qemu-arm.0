Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D486CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 12:59:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXq-0001Xo-LI; Thu, 14 Aug 2025 08:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXn-0001WL-K6
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:59 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXc-0004Fz-C0
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-244581d87bdso5489765ad.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176323; x=1755781123; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aml6O/ihqRQ5/Olxx3E4fWtWtO1GlytBAF8K5CE0V54=;
 b=m42BEU381FgNZ4SozdJtRDmgR3/KIjESREHcYSJtZE86Xg2BNC5yBSRoPUYvqTYFxn
 TCZFun8uv9x2xKJQvnWiu/OJCh8ua0RouiLxRcvY5p3mQGe4RB9IEBOBtPUkxWHBP3MD
 1FKRJ/jszg/TAnIYrvcJp4LW9fW7iVjZdw/RtHkpLm4ACUP7+rjtlmjwIyC2BFNcmjis
 X1p3TpZVj1xtiraqeggvxRxNR6+ewi4Czm+PFYJ34zgbJ/YaszDGUQWZ6OOcYcWoqsLX
 4gf19p/PRytdsMmOTBK0KtFh6ePQDr0lfcpAYetFkdl8wPvIxGO7S+ceMRDjqt/xZdVz
 25bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176323; x=1755781123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aml6O/ihqRQ5/Olxx3E4fWtWtO1GlytBAF8K5CE0V54=;
 b=o0/+ImoSvNXmJCqBFTU0k9yOnRTpbbuhW2O+8BAmsyU08duZOCB10M3AuK/yaD6SGN
 ObrnTUoaL2ZxR4BKA29NE7BdE4ngeBjeguqTN8tNAMzsd4GfoK8/fGsxYirgRH8Ir2Kr
 wSjPjSjhZtZa7V0sBvtFaa35s19H8CK0pKh+thjdZjGCPNwg89Y0LWheczqIdd4BkZXE
 QECSsgVxHtjxL0ZsOIMBOjcS4yTXm7BjQLGeFUzneGX65z2MV+kzq3ljqP7AoJnOKv6Y
 0U0hQboufXdCrx17sJOEYy4viZApHkAb4ZAYgE0KnO6+gYvuP1urUhCSksG/P/k4oGiB
 8auA==
X-Gm-Message-State: AOJu0YwTOZa0u4bouLNNEr3ygNngpitYjAQwj/Oy34jMjBRcXTwvsK0Y
 RnMw0HvU2q0ucuL8/9QbxvS676HfYUU8J+wumnw7nVmXLWZTsuFizPmziwL3iD0SLfBCIutX87L
 lc7sjrJc=
X-Gm-Gg: ASbGncsm1kFdKufQPbQI2xsqJA6SAuu1Apmzap+j+qYTx5ryO6wXc4GeWEKTNyo5Dcg
 HQYigcf2H+e9khFL1kRevFfphtk72t8/v7mLfh7suZmeXBgtAhT1fPWxbcllOqiRgL+TnwjRGuf
 KwWqofsL7lONa7mRXNob9gaMq022LELq7Kthfgc7t1DnuYq3cnkVXQRuhBe/T3OehSj6iK739j5
 /Pk+0SrLwp5YiVkqrI03wMZbIf7k63vgfE1tX1694nnNTu0XP9sxWawGgxUM/AkdogHEDPPB5CA
 cMZPSO7n0kqaWlt9XheDjt0Xn8y1JIQmx2eQqUEpCRZoLGuqaS7JZWCagjss1R9AHw2Da4mcGXs
 IIwAtDKlwKoCua7L7JF0Qkq27koQ98P7xTDgRbTc4X0ECn8s=
X-Google-Smtp-Source: AGHT+IGj5yB0d1ShlTVoJsVLT8+9MrMZWzhgwawR9hoaK8Sv+u2CEFTzBYu8//3+dJCYYs5abF9VDg==
X-Received: by 2002:a17:902:e790:b0:240:9dd8:2194 with SMTP id
 d9443c01a7336-244584f4d84mr42849855ad.22.1755176323204; 
 Thu, 14 Aug 2025 05:58:43 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 13/85] target/arm: Add isar feature test for FEAT_S1PIE,
 FEAT_S2PIE
Date: Thu, 14 Aug 2025 22:56:40 +1000
Message-ID: <20250814125752.164107-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
index 7f2ca51b4c..83875c06bb 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -919,6 +919,16 @@ static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
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
 static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, MEC) != 0;
-- 
2.43.0



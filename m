Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B62BCCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:08:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJE-000265-MI; Tue, 14 Oct 2025 16:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJC-00024x-II
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIs-0005Jw-OQ
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:07:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-27eed7bdfeeso3553365ad.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472440; x=1761077240; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83gITCsTSz6Z2rymdsqW04YSPMva2dhKn7k0rNEW+ko=;
 b=cwYpe8bE0Yvzh6TMNLlB6mSkrDO/qF/b4mB2wGIQ7ujWHcw8LXmeZyxywLJRDwV2GX
 exsVCpaA8lijEQz438BmQSfdlRyiGHuqtDi2E9gVrYm5bljmNXojx6vPU7irOevPyotD
 h0QF5t/A83BMdDzSfBJfpTybmmGp46Dh4T/hHngkM3yBq8oqtuqIDzSJdhFbVHolpzLk
 3jJdFQiGbtkCqxdwopy00H7WxjsUIXqctl0WSKjvBQjP2KiLplIDvKzRHcRcve2qCZU9
 4r+i4vTL5C0mZZsEUNQDeuSKp06soX2A7d7l9OBx07ij6uAi2aGTeL8FVK1Nc1wkg/Ya
 yHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472440; x=1761077240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=83gITCsTSz6Z2rymdsqW04YSPMva2dhKn7k0rNEW+ko=;
 b=Jt+1iMrfzdTNu6ZXlV1fozGpCOT7m8SyCHdv22j5k7EyyK39LVWvf8imvCSxyMXzVb
 GQfqmtZvzbgMe1Z5aRfdIQRgX4LOJxUeLZQakJfCy8skTHdbOl87pYIIduGYBqQ7WPGn
 YzwwJJ6VBa0P6viVa4PeW9jHfxbWLovZNY5IKctMNQOFYTb6Vos4fHP6YO5swis272C6
 2vGLcK3an6RvSsySZTlPSmbDPoopG/1LmwKyy0sfmGZvatyC5hX//gsMqAP5a8DRZ5KU
 EVDxzzVBgZMpQAxGAezhE2WHfMlKPm31NtIpzq1DEtSi49rpG992Urxum0UNW5hSQWFN
 l0ug==
X-Gm-Message-State: AOJu0YxyOKn03/1KrQr//EdwlBTzf6BjeTPvD4NHcQyw4IHfGK5nuDLV
 jvVtVVrL/+oKXwH+LvMJfvlKrw2nP9JdJs9d+x7RnA9pirYMDBjBNyyn7s8VikHwJKw=
X-Gm-Gg: ASbGncvbOR+m/Qn7Jt6jZaPaEjcneeTrhzgCzdLw6P2gOB93VcPOhxeiVJgCbgB6jop
 NevR+QZZclu7yk4kREi3XOeFZqw4NQca9Q9paJiBW+MRzI2r/b6fTl837QDvpieKX2S03SZSFKa
 Ani/AHG6QduWXbFojf47yyps0/BqQ4gcjVWVzE2joV3D655MHTGh0lAxaxynOsDTzFXC4CROg/b
 5S3KgDMju4DzXeZJ9Sf0v5t+yP5PG2zAZMLZ5V+hfv3PEzJA2fwWLAnyS1NnqtTQaJZzwsgPaSG
 04LUXLGXPdca0QaIIcO8G+RpThXcXqiyA6v36I6g4DrU3Ss/NJg4jHwysMhAiXyyqFTtTWBHriM
 AUm0QETXfb1GEQS1KYfk0AveG75E5xhvPjexF3ixMX/dbkSudE0g=
X-Google-Smtp-Source: AGHT+IGttS3HusLzPEQjBbOn4URsYgIGZ8JWt57lHAZ4NlDOxPAE7DL1Rn+1bZHTbL2m2zRycqNiEw==
X-Received: by 2002:a17:902:c410:b0:249:71f5:4e5a with SMTP id
 d9443c01a7336-29027f3e32emr368783955ad.26.1760472440113; 
 Tue, 14 Oct 2025 13:07:20 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 01/37] target/arm: Implement isar tests for FEAT_SYSREG128,
 FEAT_SYSINSTR128
Date: Tue, 14 Oct 2025 13:06:42 -0700
Message-ID: <20251014200718.422022-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 579fa8f8f4..9b7fdde0d7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1019,6 +1019,16 @@ static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, MOPS);
 }
 
+static inline bool isar_feature_aa64_sysreg128(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, SYSREG_128) != 0;
+}
+
+static inline bool isar_feature_aa64_sysinstr128(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, SYSINSTR_128) != 0;
+}
+
 static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
-- 
2.43.0



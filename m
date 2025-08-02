Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C53DC87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLhj-0008Oc-7u; Sat, 02 Aug 2025 19:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgv-0007Dd-L7
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:05 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgt-0004xr-Dr
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:04 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-2ff8d43619cso1934490fac.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177462; x=1754782262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aml6O/ihqRQ5/Olxx3E4fWtWtO1GlytBAF8K5CE0V54=;
 b=hHAgiJup/4T9U4W5zZuJ1Zl6QBV7g9dBS4VHYvc8TE7Ecl9yNLCXBZeIOCQ+Dn8LML
 6A8PvPiywCB9eB5EAnGgWaAHzk1yF1/nc/506Qan4X+p/Aqogo5Hx8QKX+Ixeq6wW4mV
 VEms/ri2KKSuejiGYPjzIsVQj+TteTusVvUlcaK221jP/4OZD7WvWUx6ko4VFClvCskt
 /RWUppRWnvWpIUjix90NnbP7agpz/6ou2O/1DNd5Kcc3WYEq1kB0LgZeOu9nzprCfaVS
 oLvUS+RMReJ9CzFuyXxdPWkTuZ4Y7NOI6S0Sqdkj5xMqRV6JYGkaPTAiothYJdyBOLyf
 DDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177462; x=1754782262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aml6O/ihqRQ5/Olxx3E4fWtWtO1GlytBAF8K5CE0V54=;
 b=nHfbiK7X7Z099sEJdELyxAoYxJopcuDrPko/UVgahFACGIK9+lSkglhO+p/6gmg7j6
 y5/HFMiuen0cPIoiB8QgJ7UJfHH4g20yZP4OeB8fso1faDq5kdoHApemD2kCCISt6YMD
 ZdDSUIV+17X5bFPSzwafJ7S87fYFytRbxiP493EeSYqRG7hyqtg29NRNkAGEroSN4pfG
 DrAFVJBMoopQffrLPdUrC3AT2u8e78dgoMh8DGu9uGMm0FtURo7c+sUFv83jLXUQo6Jz
 o/yTn6bED/Vh3/pZjMJXI2A9WhxlYdD1Hdb/LM3TUUxJ+OwR6fZpqES6Zgxkc9LbD/8c
 wLjw==
X-Gm-Message-State: AOJu0YwzIbZORQua559BLNaxk4jUo3Bu47BaD3fZx/a7lY1/eBQFf+cg
 FB4g8GppPE5Vba5wVvXo4JfWQW7RYx1RCdoD0leWqW7/POQdXjSJKBFjMhzRZ4oyidE=
X-Gm-Gg: ASbGncsHXGHWWRy7WhiCQsz/DHelpdCZw0xbAkzt5+SsJgOrY381XZxuTdYKWP+3wWo
 vrpnKfo6vJVT9O18WUNsKGHIf84TAcXW/D0DQ7iu+ZeYsf6LHB2QMxGSgFwSff6g8AFIZtSHrRO
 6ZZb4QPgsuF+E3DBDsItzYkhKKyUIZK09LfVUYXA6PijIxHiigIydecJfhHqsEAET6D0N2empf2
 Vrq/drW9VpC50+lk6Vz8lTLXCa/OIP41UNgo7tWBBDGGnb1n3MqDZKZUCPtUqzt51JtSiM+RIV0
 LFnGw0eGw+oasjDUUPiMDZRrKgk4TdkxMMxOrC5TDBKqpttLLufI5PT/GJjv0WsEbsGsmEKLePt
 vh3ju/02DuW50niHX4ONdMGAAZ+Q5yRlLaHZXdcgQncf+wz3BsYPY
X-Google-Smtp-Source: AGHT+IHEjCMcvfy7+bS+jsFRopBQ+lrDRgn1osJStQjwas1hmXKdNq7MJ+xSJ0LZP44zwGZi/9PNww==
X-Received: by 2002:a05:6871:490:b0:2f6:c9a6:4f7f with SMTP id
 586e51a60fabf-30b679eeea9mr2326164fac.39.1754177462252; 
 Sat, 02 Aug 2025 16:31:02 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:31:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 13/85] target/arm: Add isar feature test for FEAT_S1PIE,
 FEAT_S2PIE
Date: Sun,  3 Aug 2025 09:28:41 +1000
Message-ID: <20250802232953.413294-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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



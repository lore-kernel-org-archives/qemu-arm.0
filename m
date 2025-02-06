Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1785345njb;
        Thu, 6 Feb 2025 12:10:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFaDGC7BoilUXZ9ht0CNLsXTv+o99rau73kQHQWWH9jBkujhreDHqMfvpCswb2fWXJe+ZRzh29pPKmUw==@linaro.org
X-Google-Smtp-Source: AGHT+IE17Jpzok0VSf2YX67+Bwf26F+zbi/u4ScD+2v4mkCZuBmSOxkNFxPzmFeY3PjcSj9i1rF0
X-Received: by 2002:a05:620a:43a1:b0:7a9:b914:279c with SMTP id af79cd13be357-7c047afd8e7mr77862885a.0.1738872605147;
        Thu, 06 Feb 2025 12:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872605; cv=none;
        d=google.com; s=arc-20240605;
        b=He4RL5SVQX4QMgN9sjYO2dOj4ZKfvt2vTpcPIBmkPAeIdnh5FCowmlDQL38KpI3uJk
         1WXyxLSexex2xDr79k5WKPdXAo4Mn8yz/5j/chLxg9LeqCW+uCEDCvi0Huts/SFtcHZ1
         3Cq2Aovp2Dr0SHyCsA4YFlKT9QtjPC49g2BivtfrRKt8bSHI3wsQbhXc95Pcsn4n21Cu
         mFGpFhgiWc9+Cs5eS/unimK/tKuv1dsWTnPFIFo+77nAvfsMD1KwbQA1paYEFCJFMHBF
         KqUYIKzRixBHkma7+U6ytwJam8dRRV7viBtESURfJhwUVLD1V4U0HcAeRFxqTHTu3Bs6
         HJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=s5OnYjU6bDZdIf9DMwSFEWlUN2+/QNMerChlgqp1dLo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=DCS06IPVj4fK/z/cgb30O64LCIwGlP5O1kNt1tDbHnNXOAxjg6rIopYPd3iuc09cbR
         6AniwpwoNoViV2FZW0VKYuljf5f2A7uoVMOm85MpXMIhCKHuMCewiCYLebGQP3hDKvhs
         n3bFPhcqRxl7o1rEAH7dVxGr2UjHqAi8wGTb4y5bc+hUxW2v1jbcQrh79xoNOzYlyqDo
         q7wydaGBhmpdFcQe6i5zqvcyfZlmuMNqq9VuluHEEhGQwmvS64XYn5cD2exSg7MGSQTo
         MZ0g2tvizh0s3ygAMECCS2ET0eQJzAqvXK5snEapOefzO1I5YX4HJu7AkZqWZHhM3U4V
         pyFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iv/JDB2m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ecf27esi171153585a.479.2025.02.06.12.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iv/JDB2m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80X-0007Qu-5v; Thu, 06 Feb 2025 14:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg808-0007Ba-V9
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:29 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg807-0000UK-3W
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:28 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21f48ab13d5so13345565ad.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871846; x=1739476646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5OnYjU6bDZdIf9DMwSFEWlUN2+/QNMerChlgqp1dLo=;
 b=iv/JDB2mRaqkvYmu5kzua8qt7Twwde8LQn81Mtlx4uo4OKRG34WUC2NpjFnSfaAyW9
 YlNnWKI0FhoZg4aY3ptYI6LeqVsJOb1h1K7iburG8JEKYy8P6lrQcl3uHbW0TurHanLH
 ejQxtZs+gyRTgmFUDrPdal59BXqwOyY8GDHp/WY6xg1sM3+DwZWr6yiTUgOo1/EjE//R
 olLuJiYQt6Ka8/MjeqeOLfEO0Kh0mB6/WYnyoAz4MSr6dCMxayKCsweQEtsbLBwl5LgI
 OfXZj06HU/75sB1oIukWadfmh6xW6bgHkWmAvs+6S00Mec+F0NWIDCsYK9fsrwfN9498
 +FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871846; x=1739476646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5OnYjU6bDZdIf9DMwSFEWlUN2+/QNMerChlgqp1dLo=;
 b=Us6vzVvWTtQpFHkKjaUrG/UZreULqgC3GBh7lTeSHX/Zxo1Y4yF+y2M/LHsIogJZ/g
 WKVnamr8N5Lu2UMczlyHqxINFAk+Q9VAyFLI91Ybr/qPDC/zknYul+b/kOV3bZbHCVhB
 Q5evHr0kKmWY1j+EASy/OxIHyzUKF+nlrWtPupKP3UuOfFUI4LjIuBMz4/ALgAjMgMUd
 ILsJ7jrEQwkk+oqYY9fNibZLWfyb+9ETcihH0Ww9hupgGebQti/xgt8yOTCWtYVhx1Tf
 iU7Ewe3l6384qBB/uSCF7nxyKZtMdWeh9avlm0lepSJW7zp1R9nkHUjyRJ/ps6LEasGA
 MqHg==
X-Gm-Message-State: AOJu0YwCCeyDi/THToGvz1gVlsrkDceEd97puaHzUyG/5yfWxV5wue9P
 +6JO+AZS7hl4wYMeRpywhWOpbAE3Vqk71ddeIv68W2NJ/O7PMl6ztggLMmYanzI=
X-Gm-Gg: ASbGncsjsvwNRqrkUEPYL4kjKTBMstxRNmHBAmjZKRMsopMH+uG8PiH7vbJ8q6N1LoQ
 qBmFGdRu/5WzXKJ5uQneZyquPJu6NuDZtrh0Pa8g4gNful4U2p3+O1rQZwZCWtE0RSJ5zE+67Ed
 KeYxWGFyKnl91YNGgVFAIiIN5rWDIXtRBOQwhwBN0ryFRL/0b2/BZrEs9LIpFToGKFb9YInwrto
 iJsEfIbPYD8yonLxLIQsc4ajjmsxSJ1GMWDAOH9nPgP8NxJfczkgpWoibnqCE7MZZBPTiEcfiRI
 41cBZY99L8nZ4GVmLp/Tq4lGPZMCYhdKTds1jCMULp1gRYk=
X-Received: by 2002:a05:6a21:9011:b0:1db:e536:158e with SMTP id
 adf61e73a8af0-1ee03a8f46fmr1240893637.22.1738871845667; 
 Thu, 06 Feb 2025 11:57:25 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/61] target/arm: Add isar_feature_aa64_sme2*
Date: Thu,  6 Feb 2025 11:56:26 -0800
Message-ID: <20250206195715.2150758-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aCo/syeF2uAk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 525e4cee12..5383d6b2d7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -930,6 +930,11 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2p1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) >= 2;
+}
+
 static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
@@ -990,6 +995,36 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_sme2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, SMEVER) != 0;
+}
+
+static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, SMEVER) >= 2;
+}
+
+static inline bool isar_feature_aa64_sme2_i16i64(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_i16i64(id);
+}
+
+static inline bool isar_feature_aa64_sme2_f64f64(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_f64f64(id);
+}
+
+static inline bool isar_feature_aa64_sme2_b16b16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, B16B16) != 0;
+}
+
+static inline bool isar_feature_aa64_sme2_f16f16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, F16F16) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
-- 
2.43.0


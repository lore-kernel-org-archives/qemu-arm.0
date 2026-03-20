Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59091098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:08:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYP-0002pa-WA; Fri, 20 Mar 2026 09:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYN-0002nG-KL
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:15 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYK-0005z7-5J
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:15 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b941762394aso223661966b.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011970; x=1774616770; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ACqQ25GaMsLx1AR6X4JG/cERT+D9ImfITj+Bq5qPC/8=;
 b=BuzXJwAxcMFYl4UAqA8VmRzDKfBY2Xr7tRyXUkiEpwynw8Llzki2YqOqTAWsSv6423
 OGUAtyWCDErCWbvY/G8m7w0Udn0UFwOBIEPFNC0jLvktQzgrjb3ziecdP5Q2pLVdC12S
 ZjdLZPFdkAWfKhIhVhiI12MDz1lc++zDSnED0Ezyq01HRnZO/xGpNGfHVI9iwny5SjNQ
 qsPfi51XKwBe10gjDKo62Aoi43K4nKcOPIHxkIAtxTRjjT8L9nRv9fGAeJtFU42OCc9o
 q+2qKTFXCLI+0wpOKTcFnmur4MUa+IqZwqYvuZzIUX/4YkwuZTKjLW1skPcjvH2UWqnR
 RfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011970; x=1774616770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ACqQ25GaMsLx1AR6X4JG/cERT+D9ImfITj+Bq5qPC/8=;
 b=BIiUuh1Ty15v9NNTxGgkOZnHEijpXyV4a249BOwKKAnK9rfqa61HqPNCefeFWocNd+
 3vDLlwQ94QT12hoLMXxaUFMH5nMqBXQG1u4/FLz/h3lvPqhcc/9nh1SCgBlbHg0qqPub
 aIJdQg27UeBtwFN1EiHLHSQhaXS0y+gTalkqWPAUbq7m80CRjEWGTliyyUT7pvmJbFlu
 z5DehYd2P2J0NjktNyHghMoWoS3mFzxkCQEOpfIifUVZDvAI/IloLBYupdNvgT0KA2vm
 VCbYIS6v9LaeoLnNiEiEMB+E+5or8g2C+jECnZrNWgf4GlEYnHQ6MQ5V5iE9/YsBkrdG
 Emng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYclzesI6pAIx8Sr47/xK10x4DBfTWwlR/51bGDvD8tJbJDhLoV3Yscz0B/OgSqWE5qJHuIqwiUw==@nongnu.org
X-Gm-Message-State: AOJu0YxaMeAuwyxOt9xgoAQYom2UKvsnnWqVZad3gumH8lnvMt6isDUd
 aNeKXp5B/jk2VtWpR4USAZEYzusaiK6BGzj0KHEitA1lSIW+RyyKSMXNv4boaU1HvwY=
X-Gm-Gg: ATEYQzwCVloFeaMsUDlLp3Y+3q/BiTWdyECsaa153/cieu6KMFwl7/DHYv1jFuq7Y2X
 HymakvikR5In+8AWcxZLnECaBLXgQXCG0xERraWBvRObuetVOBLv+/kMFIKNWepSUHievEV/PmZ
 3HHTD57t7Qx2SjwkgacWLwwT+UwNkJYHdINjFeqWgG067+xoC+vX5h4LJG6vDL/GWE4K7UDi24M
 iKfXRrDSC4Zk8Ku3b1fNw9WOdAK8Ox0aRGuoKP4tJZR3dz9w0AyZOMLlx5JBgtzPV3EwLRFSHB+
 RoBIL/N5WekHghb1c02Mxp7loA9ZDFBu08whhmHSHAFp0jfBAJZizp4eP7GenMaWT4URaIs9WW2
 2hIULKcwyxFKxHldsVUhBjoeINzvb70Sj5kn6S7bF4t8IE5ZJDQnnZw2YijVlBUhDfnHQPHSR9i
 krt6NCz8LkhUhLbmDgepKFCf6s9elB9TEosA==
X-Received: by 2002:a17:907:8d85:b0:b97:4e42:23f4 with SMTP id
 a640c23a62f3a-b982f0ab4a0mr200254066b.11.1774011970086; 
 Fri, 20 Mar 2026 06:06:10 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b983365f607sm154749466b.50.2026.03.20.06.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B1D9E5F911;
 Fri, 20 Mar 2026 13:06:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 03/35] target/arm: migrate FP/SIMD trap syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:34 +0000
Message-ID: <20260320130607.2071996-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

The syn_simd_access trap was never used so remove it. We should only
see the COPROC encoding on v7 architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 3d2660614c6..5b5a5cb182e 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -337,21 +337,26 @@ static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
     return res;
 }
 
+/*
+ * ISS encoding for an exception from an access to a register of
+ * instruction resulting from the FPEN or TFP traps.
+ */
+FIELD(FP_ISS, COPROC, 0, 4) /* ARMv7 only */
+FIELD(FP_ISS, COND, 20, 4)
+FIELD(FP_ISS, CV, 24, 1)
+
 static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit,
                                           int coproc)
 {
     /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 */
-    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | coproc;
-}
+    uint32_t res = syn_set_ec(0, EC_ADVSIMDFPACCESSTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);
 
-static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
-{
-    /* AArch32 SIMD trap: TA == 1 coproc == 0 */
-    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
-        | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20) | (1 << 5);
+    res = FIELD_DP32(res, FP_ISS, CV, cv);
+    res = FIELD_DP32(res, FP_ISS, COND, cond);
+    res = FIELD_DP32(res, FP_ISS, COPROC, coproc);
+
+    return res;
 }
 
 static inline uint32_t syn_sve_access_trap(void)
-- 
2.47.3



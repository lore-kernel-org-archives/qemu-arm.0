Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0106CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:59:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lfv-00050n-NB; Mon, 22 Sep 2025 14:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfP-0003rR-4v
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:42 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lf8-0004wE-Q6
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:53:37 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b5229007f31so3489332a12.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567193; x=1759171993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=fuWP2z2sb74PddQvvSCzQIBYzeEy3CbgJujj7ZDKngHs0aaWLKT253Sp2lDScu05Hy
 xwlFwhhJAyHl21iLVLSvljlym5uhX/8363mIwWdDKQImlkfpneTD4aQRGMBvJZPCrr3q
 +eXeLGxblu995/vRat7UeekojDielL0fQ69MFA2tNnArEIukA1qwUWIv8tNn1Mb+l2Ua
 Nu5keNTqfzH/t2okv5xb/MckZLMlhpsRqQ4eTyzN4X1Mrcy1ROItjQE8A+My0H7h0dua
 G92YiKCUP2ZBYdYJywKsN7T4awk73vx+YRIVJiABzuVF8c3+pxaMJFgrQ7NncObb6KMP
 WKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567193; x=1759171993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=mZqD+WCzF9bvJbQBxu8PCg9kch8tgHsO6rbxetXOjezq35xo98DtLrpg7PnvfOlSB+
 80rzUTQjMvV4SkEH09NImOANPJhu2iXQ8oTAG2SrIwQtoTL817/tbPd1aGg0alqEDoFA
 xpLVMiBcqUQ4YT5toRnqU34lym33iw/pvK5gwH1vEQiraNiWC5YhZc8GL+GhuxMAcrH1
 7u+TlkbHdvxy2KyDIXSFzyf0YBhII+9/FLtOf1p3msbHj8URNgVWrb8HNDNsOSVgEe5k
 xPGYcWxqZPRhp7hKHbmVYY6K5ZU1ZB7cQFo3V2OFJGJWgdztHgLCnyw1gqQi/yJptskM
 /2Og==
X-Gm-Message-State: AOJu0Yx39auiYAj/6LLsoN6WK2hdhwkJUZTAQuFrdiDs8bQxKLqjv5xj
 B1tKp0QvtNY6WgZEgjoVHgRts4R94fCKmPEqcaa69yCtA6WBLp2OMoPAWa03UWVVGJlPGLWNP+Z
 Opew3
X-Gm-Gg: ASbGnctxb6TRLt1I6O7c/YP8QINWWlwYkObM7jRngCoH5rhS897r/TKOkETBRMMe510
 uRou7oFzfU9RZGplSsnib1DMj1cnjbEqC/hafRfP09uVZ6Rjdl0fRtpcFJtD7rbRVIWNY4/JlFL
 ZN52r0Y/Llo9FojZj1FSnBKt/n1TwgE2sd5wunqlROr3p253XeKCoFPbBm3KemwqmTAyifRadHw
 zeWW9uvW7WjWgaDP8azhENKa8ZLY1B6U57epYkwzWbZlDRT3y2NlRam9jThqDi8EV8dxJLbkDkk
 +R171Q1K2WAANxteCAZKuBRQf80KKw0oxCL15lfcQVfwgFgFQxTD0RIxNqNaMYXmvabHc01m/X3
 /5JWmXCQxsfS92+AfCfX6RRm3kF2F
X-Google-Smtp-Source: AGHT+IHX7slCyFV8nVKI7ApmZuCvisgxKvN0EoqauvZlFT5a4Fhhkp97BlbadwpD+PEAWyzsgquOVw==
X-Received: by 2002:a17:902:e84c:b0:24b:640:ab6d with SMTP id
 d9443c01a7336-269ba538bb4mr210912855ad.49.1758567192963; 
 Mon, 22 Sep 2025 11:53:12 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 40/76] target/arm: Add syndrome data for EC_GCS
Date: Mon, 22 Sep 2025 11:48:48 -0700
Message-ID: <20250922184924.2754205-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/syndrome.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c48d3b8587..bff61f052c 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -63,6 +63,7 @@ enum arm_exception_class {
     EC_MOP                    = 0x27,
     EC_AA32_FPTRAP            = 0x28,
     EC_AA64_FPTRAP            = 0x2c,
+    EC_GCS                    = 0x2d,
     EC_SERROR                 = 0x2f,
     EC_BREAKPOINT             = 0x30,
     EC_BREAKPOINT_SAME_EL     = 0x31,
@@ -83,6 +84,23 @@ typedef enum {
     SME_ET_InaccessibleZT0,
 } SMEExceptionType;
 
+typedef enum {
+    GCS_ET_DataCheck,
+    GCS_ET_EXLOCK,
+    GCS_ET_GCSSTR_GCSSTTR,
+} GCSExceptionType;
+
+typedef enum {
+    GCS_IT_RET_nPauth = 0,
+    GCS_IT_GCSPOPM = 1,
+    GCS_IT_RET_PauthA = 2,
+    GCS_IT_RET_PauthB = 3,
+    GCS_IT_GCSSS1 = 4,
+    GCS_IT_GCSSS2 = 5,
+    GCS_IT_GCSPOPCX = 8,
+    GCS_IT_GCSPOPX = 9,
+} GCSInstructionType;
+
 #define ARM_EL_EC_LENGTH 6
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
@@ -351,6 +369,23 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_DataCheck << 20) | (rn << 5) | it);
+}
+
+static inline uint32_t syn_gcs_exlock(void)
+{
+    return (EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL | (GCS_ET_EXLOCK << 20);
+}
+
+static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_GCSSTR_GCSSTTR << 20) | (ra << 10) | (rn << 5));
+}
+
 static inline uint32_t syn_serror(uint32_t extra)
 {
     return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A4CAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:29:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWaY-0005vn-7u; Tue, 16 Sep 2025 10:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaL-0005nx-Nj
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:11 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWa7-0008KO-S8
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2570bf605b1so54503435ad.2
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032572; x=1758637372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=977BcuDeql0kPwyP7xy6f+rDemPgbKM+wEyJIH6/QAM=;
 b=bjh2M2KbErnSmRH9mjG6+9cyI1XosvBCOoyNwVC82rtMukTyO1CSvTtvapPdIpy7lu
 ZJ1YXmwHwZUKfQdr86z3Q6QV59JJb7W6YoPNxoh0u9oN4I+iFRumEsxP4LLdRNwPXtTJ
 zDX5YejJHZbCRKxh+yc0GM2BKznG2xWDi8znoMNY/+Nxdzozcw8aNeF3lWK8YAwWSrgB
 vrByH+6pRUI26W0IMABi3NMvxZWavBU5rRt9QeiZiLw4oU4FAhbkUu3pQ1GtWpralKKP
 Zdp9XN5c9eDSZe/aAz4kEXLuXTiWRshQx1Px4BssjQOxg+249Mgtg/hQkhsASOZ/20oK
 Dp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032572; x=1758637372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=977BcuDeql0kPwyP7xy6f+rDemPgbKM+wEyJIH6/QAM=;
 b=J1A0tfm6WOZCE5qAOZ9sugj58Snm9X65XAfMKEeysIGRsZF0jbNp3XYt2WUeJQvSGQ
 8IqDRV7tS01tib0+JK/qMqGGt6Gv8ENFtQRSTQ+qMeky6JrFoZLq90iXT/08zZ1oiIq5
 1LfB2mDlzswmW1AEBQuavXekaroBJyltfDkFMh5t/OI5ag1PpJJUB8EVtzMiLTK9BCog
 wsVLclaZO9GQKyhLS3wvhwxu6jMnLFdVsuo4bLyrqoy5AhiXvHY0rsLW2RQxwy/Um8Q9
 ucMbzMxCLf08Gp/HCVWzDoL7hc5IJHESG/wmNp4MqUYUcb9HvRWibkh3XNN0PJxbmGqp
 oM0g==
X-Gm-Message-State: AOJu0YzkeGAw2MDogERmGcH+95WE1Xb/yq7L1i9GUqOEGSl+eIf//kkJ
 Z4vntMiPMmebNUIcezMnhc1A2ua4C/bg70vP+cY6zVgve7+jwbdK84/il0ZdUaTfN3Q=
X-Gm-Gg: ASbGnct/VGaNzbH7rr0Vy9DPxDcplr/yxjRQo1X1HpFonCOXXp6A8Fc81QpuDtE9/kb
 cMT4GG81aI/Hvb7/ZExGnbU6PXHa1VXYD1bAl5hikdIGEzGMnB7TsC9O7JEHzH4EAlno97kiDJg
 PtgnbIXfMkyPq1bcvcJo48nFB8VEIUYHKWIRXBHHZy49NBOYlk8KuaqZr+gX7J8zvCAlgfqGWx+
 UCGJRxDP8kMKiAgoZfjL9gs2Yc+ZYqFJcTJ9XFDQotT8kY6z5wO7s7TCdrQA6fJCAWmY/i5SzZr
 zeHFsSXnypup/rp2ENEKsLyEbOENq/KbLPSsVfnjnHrLqfG2Enj4Vs19AYGh9730TIVakMntkrE
 Cf1PghYPOlylz7No2FXVTrgdZsviJ
X-Google-Smtp-Source: AGHT+IG2iXOitsj0rIiXECUvXk5tueRmn0QeAqPPunkUAzstgAMO/bL/1uU/1fB8l8EmmejQ3taH3Q==
X-Received: by 2002:a17:902:e849:b0:267:d4c8:c50 with SMTP id
 d9443c01a7336-267d4c81797mr30152665ad.27.1758032571765; 
 Tue, 16 Sep 2025 07:22:51 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 15/36] target/arm: Add CP_REG_AA32_64BIT_{SHIFT,MASK}
Date: Tue, 16 Sep 2025 07:22:16 -0700
Message-ID: <20250916142238.664316-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
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

Give a name to the bit we're already using.

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index b6c8eff0dd..3dc4c9927b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -178,9 +178,14 @@ enum {
 #define CP_REG_NS_SHIFT 29
 #define CP_REG_NS_MASK (1 << CP_REG_NS_SHIFT)
 
+/* Distinguish 32-bit and 64-bit views of AArch32 system registers. */
+#define CP_REG_AA32_64BIT_SHIFT  15
+#define CP_REG_AA32_64BIT_MASK   (1 << CP_REG_AA32_64BIT_SHIFT)
+
 #define ENCODE_CP_REG(cp, is64, ns, crn, crm, opc1, opc2)   \
-    ((ns) << CP_REG_NS_SHIFT | ((cp) << 16) | ((is64) << 15) |   \
-     ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
+    (((ns) << CP_REG_NS_SHIFT) |                            \
+     ((is64) << CP_REG_AA32_64BIT_SHIFT) |                  \
+     ((cp) << 16) | ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
 
 #define ENCODE_AA64_CP_REG(cp, crn, crm, op0, op1, op2) \
     (CP_REG_AA64_MASK |                                 \
@@ -202,7 +207,7 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
         cpregid |= CP_REG_AA64_MASK;
     } else {
         if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
-            cpregid |= (1 << 15);
+            cpregid |= CP_REG_AA32_64BIT_MASK;
         }
 
         /*
@@ -226,8 +231,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
         kvmid = cpregid & ~CP_REG_AA64_MASK;
         kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
     } else {
-        kvmid = cpregid & ~(1 << 15);
-        if (cpregid & (1 << 15)) {
+        kvmid = cpregid & ~CP_REG_AA32_64BIT_MASK;
+        if (cpregid & CP_REG_AA32_64BIT_MASK) {
             kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
         } else {
             kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
-- 
2.43.0



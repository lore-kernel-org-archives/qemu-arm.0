Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E790CAC5B5
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w45-0002G2-R5; Thu, 25 Sep 2025 20:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w44-0002Fa-H0
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:11:56 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w3s-0005Dz-M1
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:11:54 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b57bf560703so1149949a12.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845496; x=1759450296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4B0sed8fcKcEBs00RcNhGZcUvjaD+FLFaLTVM+s8BDA=;
 b=sJp4uP9lQ1H/KibGWs17LLSqU9pzVTN92WXJ6QjmA3igJLmdxKTpxEtvrtLhkDBEX1
 15cDgduyGLpn7v4u6HrjAf0FYFLWVnA3kY0LYgi6iZLVMHwYee/FroemwuKN/HpfF5co
 WrMTZ29Mw4FJ8YApdd7cAA3l5MTPDtVSRyjgPaqmZYCx//3IEVoLIbcOip4wIc80F0/g
 5ALWReAK8+Fu7412JDVibOL6osKNWcZ+jiK4HVoIU5+1zhL9VHGgC5LD86Wo94G3B6VX
 +fxUbCPE89z+tERPdMf2hgxbg3ap7zusA6NDRWa9EiaIhKmMzqyYNABsl68jXXI8US5t
 ozBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845496; x=1759450296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4B0sed8fcKcEBs00RcNhGZcUvjaD+FLFaLTVM+s8BDA=;
 b=rNfARYLkpn2KJwoNMSoj0s9YShSrHl7eqy1Lxs2SMhX/200Lpr03d9wtDdbeZH5oye
 IAru2tnnZ7nBzHn0EaefxCz7huPUnuieXl84wFoy6ZSMC3yoz4hriPCQJ1TBapYgoUtv
 SV23OQ96o7SshwOJppe9RLtQAesFC4qCyk6JFfqDd81CsYky9N/N4ULaY+BXlIen+sEe
 bPZG7dOciNWb75mAvDW4QtBBAA78VcQJjI9Qmf+c/862NX4mg946qAEMKCAUZ/eVzWFw
 UxfF6JYa/h2mwNM3iAY/kMedjxkIMBWzp4+5dGEFyc9FsRD2tDyu3qpg8/AGCLbuqVdX
 hBWw==
X-Gm-Message-State: AOJu0YwksEbzmcHPFqCSNlzNF/q+7oHzZppPtyiQ9PwmNLJUkcCnuGCF
 D+cG+FX+4RzKxVm+s2ifNIq6wq0qo2GwNFT1cyvtQwSoMcAQucm4tnCMSKcRgrNTU6J8Q1DHx/S
 vNHZa
X-Gm-Gg: ASbGncvPTsT3SifNIJ1gAo4bmRkqPJ2X502C0jPsK5m6xZWFQ4QoujlCgQj0wHXLEfl
 SjKkHhf1BJ95592gd2zC66CNafws8kesxhwtnZy8dPkOYMW0sTD2aRyYKY61RVgvKd2Z1Hz4jLD
 JcuWiaSG1bhlfuNvbsVKLP24Z5+uuUu/ZbIK3/ZpzBSv61JFORI50sUSEzxrJ59z7XWMg7dea0T
 2CpXov+/b4rF+t0thLoxPJV8aDwFgfLTvUx782yRAhPmo/HB5p1mN9xD+QLLFck+u5h+XlDKi9O
 bHSLqO8S9e2Xn8GF9UhWUh0p5p2vCj7J3D3GwkdzGKxIwxqhrh0u5b4xV2gXZqEo1rmhf7lP+3H
 vo9cZxb4B5iyxRbCYIAFnesAzoWH6
X-Google-Smtp-Source: AGHT+IHO4ZBpku6huVja5uunEa1NdGZhwig/6rs5Hy3NFPHdHcvALDmDQp+JM5fRjosFkOYSMqIgQg==
X-Received: by 2002:a17:902:f60f:b0:27d:6f37:7b66 with SMTP id
 d9443c01a7336-27ed4ac78b0mr52183065ad.47.1758845496634; 
 Thu, 25 Sep 2025 17:11:36 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/10] target/arm: Add isar feature test for FEAT_RME_GPC2
Date: Thu, 25 Sep 2025 17:11:25 -0700
Message-ID: <20250926001134.295547-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
References: <20250926001134.295547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 512eeaf551..2214b0ee08 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -676,6 +676,11 @@ static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) != 0;
 }
 
+static inline bool isar_feature_aa64_rme_gpc2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR0, RME) >= 2;
+}
+
 static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64PFR0, DIT) != 0;
-- 
2.43.0



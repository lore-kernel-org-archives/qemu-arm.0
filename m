Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67F7CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:20:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNub-0001jM-S3; Sat, 30 Aug 2025 11:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELy-0005w9-AB
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:21 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELu-00049C-Ko
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:17 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b47174c3b3fso1688749a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532533; x=1757137333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XuSNhIuWtZ+D9TGrKCnrrzHc63/oKkL0AUYE0riaIqA=;
 b=m3+dtxVgW/ToMz07vuHYSEMzc93x3gbYVQ6AORxMjNPErphGzfD4KQwIQ0kTrJj2KY
 FZ/ap1nytlII0Wd4I+gAFkL3FkG+h2o99BIUC5OL8QRYKrRlqXKbZ95MVfuzJvI8pBoV
 oUzDW7ppzp0dSu3uXP5vsMFtobtN0xXW+2Jo22KSNbBcpsoVGQhvR1rXZ+UDUUaObUbZ
 Vg16mPOM2jyhQuAGrBYWK9L8niqbmVWgqIpu8X8s6+oO+sgXMT+A1i4CEMyzKvuYWhXN
 PcpiDOTMrdMqw4ZKCRbHvhydkDLFrMKJyxzq5i3K73N/lU8uCvac3VZfktKvDnznkhYc
 QWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532533; x=1757137333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XuSNhIuWtZ+D9TGrKCnrrzHc63/oKkL0AUYE0riaIqA=;
 b=pXdBJ+juQpsmog87l9v81vUCPCFwSxJSv6q1BxyrJKBz3rn/3C3eCAzx5QlCrZlun+
 vL87keFbY6erzqIDZxuYDnaXu6V3K9AhyX0NhxWLswYG9IQfy5H+zOv/dSFAZ8RSgxPn
 6G+QcKL88TvBBfvhTKneJYi+lcaSfP9COGk0Xfoq8A6QdDmI94CoNtSBC3X03iaskxbS
 KZMJxal0nG2K4Bd4OpWRmin/KYtNI7tO+a3CN4NwiYsX5j0XtiegDX10+dQ+yG+vZ6Db
 mnf0OM3B2pbHLUElskocoEnEYIHpsIftuPJcaDX/W5DWyU7RgewBdA4t6KdJ1rfqO/Tc
 w9eA==
X-Gm-Message-State: AOJu0YxqMALBq5WNIkPL0hknFd/96FLEW+KcPa9GsJ6ZavIP8iaSKSd/
 TmvKqX4lGLQp3JDtzFFGQi8kJowJawN25mAHeHZSyDLpX2L3YQqlNsuWAi/iBMdDH1Y=
X-Gm-Gg: ASbGncsTidpotDW2oenyLcG1gGgu4DzF0EdMdDy2ryEY81jOhwhZM+PtSq/w07Gd18H
 larXFo5AnFlnBH4Vc9DK3yDx2xB2YYQ9Zu78YfvuHnPJP/CofI1KGVR6Xeh5Q1N5zIJG4FSBwys
 CgslOjFBC6nHtYQ+9qES4boSk2bxALnOJ9v8AXpP0TtLSqb/7FO3XVjhvMQ+bUmpuZ35TI7nrCY
 6H/tHd+WnjANLWIRX/VwR9na6a4k56VhSZkSUVkoz4+UZBhL06nVYNPX7KcEcHGNrpbCxBBMISJ
 CgWwhnE0gyJ9MpymHMhJXPfARaZUMvB1CNAireexlwbYvWgtX91DV+qYXsvhKASw7SCZe5lJl3J
 9ZzY1+voirebPewQjsc863U7jBxF1Aq2Zkn9uzdf5GBq9ykZtc8MQ4EVXOp2W
X-Google-Smtp-Source: AGHT+IGIjdh2FkR5dIXbHOOqp/Ubl5RjhkPk+tHofOEa+kUEq/0F9Ef619D2/ehLduPzRypXjbmCMg==
X-Received: by 2002:a17:903:1b6e:b0:246:648f:80a3 with SMTP id
 d9443c01a7336-24944b5734amr13349865ad.50.1756532533087; 
 Fri, 29 Aug 2025 22:42:13 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 14/84] target/arm: Enable TCR2_ELx.PIE
Date: Sat, 30 Aug 2025 15:40:18 +1000
Message-ID: <20250830054128.448363-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11e1c52b70..167362e32c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6106,8 +6106,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -6115,8 +6119,12 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C1BCCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:08:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jGj-0001RN-T6; Fri, 03 Oct 2025 13:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGh-0001Py-Rp
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:32 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGN-0006EZ-BX
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:27 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-273a0aeed57so44596265ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511285; x=1760116085; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFO/J5i0pr7FzpqmUiWNjCfcLoazi7NKc+9g+2eCsmw=;
 b=q+d7tVaM7Ao8W/8Lcqu0odhwaYiG7VUmkKYu1MxL1VbPPxmhSo0dDfHY1cOd5/hKEe
 SL+yLNdb+bWA5IH3+Ro7c6KzBv0mvx+d4vFurhRj/qnF0Hrp55U75Dk5VJL2Aqk+utm/
 8z0GGwrpa8BD7rvhpE6xO7zDtP2PahQUEPVqMlr+N/qzJnmoJdzrT5KQX6jv1y2Hk58b
 zOOdsTcf1elL2poun1InNQpuynOPPGZfoNZyF+RXj669+r7zld9oRi3VqnZge2iBQlWa
 J1nIml9cghCZddLA4aiqvI2TlBECTEJqyef2NYUI3GeEk2whKo03O5pAzumiRX1hrwlu
 Q5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511285; x=1760116085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFO/J5i0pr7FzpqmUiWNjCfcLoazi7NKc+9g+2eCsmw=;
 b=mHCV37ifPI2TzwSv4O+ysqaSYAFu6auOTkGaeu4I6ezz66RuzbrKsq+sXRcbIaMMuP
 pApRZC3r8fTj1HanJVzyFd0ihM1PS4+21KSnBGqbjP3DOX4pF+7EieQjutZsKDI7SWS3
 G8XeBi7RNkPW0UGRpX+qTY/htMQtf+6WNjbnpi/v+cliih+4arI4ld52ibib2LtoJDnY
 JZe9B3/cgV+bvDtAMpsa0PxItx6cT9iwchj0LgwnKt5jdC5qKU2pNCzI85mbtpeEfbKG
 STuHN63dEUmCEteqavEqaiWoy5gDhQmryopcycon/wYpKx+NqjKx8zDJigeswBVNLUxj
 8knQ==
X-Gm-Message-State: AOJu0YwUQrJhVT1qjDmkDkyywaf/sqdn5OZky73iLXOhkdlDQLo2tLBD
 7iLyuhU4FgWayhUYKbr6lY9Jr0W/1PDxwPi4U1TAaTLjo/SSWEkutSarrLs2Ce9j9WU=
X-Gm-Gg: ASbGnctR0jAkGtH7QbV/UTzd6vmROrXeDAiypnS9niLMJ+/SlBKn/33Tpep+WWen1Ir
 jlSLf7ql3csOBgg4qn5Q00s0w1Z2KrJ0XiQmFs4AxYUjvSEmTwaHl3zq5PBQVUR+mpTkJTc5vKS
 ktLZAKh/L+WPQvXtFuEdW08iQioSLOXC92xlcuQeGeEFB/a0/r9zQ8Sq+OZIdYUh3TnW6gW37Ae
 R2bjW0M8WJ/smm/iDKJnhwjTVgwRTf1sopEQGSyfhiIe4oC9fmGUKbEJWWiF3XrQPX5OkhlJuFa
 BevfKvi5qLWg6rTHAXBECeSvwGI3Mz5JQKmq9F8VE+lgL5c5eFrjgz9InuxRjXLttfIyQgV+Eff
 5Wk1m9hIOY5uyK/Zmlk0v4Hu9QHJKw4D9QWwxPoOzvsJNkJsTXZibfba6
X-Google-Smtp-Source: AGHT+IHgQM+N7EyEiWh/dGCYkiX4SYwL2QXAGPuOU6KZuC2XDEEmxSQRxBANgfCuG2C+OkMMXF7vyA==
X-Received: by 2002:a17:903:230a:b0:281:fd60:807d with SMTP id
 d9443c01a7336-28e99bab430mr48253145ad.2.1759511284895; 
 Fri, 03 Oct 2025 10:08:04 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 03/73] target/arm: Enable TCR2_ELx.PIE
Date: Fri,  3 Oct 2025 10:06:50 -0700
Message-ID: <20251003170800.997167-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index aa730addf2..a2149c105a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5896,8 +5896,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -5905,8 +5909,12 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
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



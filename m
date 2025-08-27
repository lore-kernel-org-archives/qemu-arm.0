Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF59FCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:18:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4jP-0004ao-Fo; Tue, 26 Aug 2025 21:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hg-0001XZ-LH
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hV-0000Dc-J9
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-76e2eb6ce24so4998556b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257102; x=1756861902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5zRWZgnToutMzLlMb+7iuvcy8Qg5Qy4VHsxh6P34qc=;
 b=qdl5+6BGMG74Q4c004Jaoixp9o5Kjk9ijDDKeID9o2h2e3EZ4bAJcYvT6Ytn43JCyh
 0R6JsEw/ep/nGLYJLcOkQVnVK1lHzpYBwrdtxsQXJpDHWde8lIVHo16oXszVv7BVdxEn
 i6un3tiAbAidrSN1xoewA4Pw8DyNcRXeNT7h+j/7BRxYuEzjSfifINLueapV/xwtg68e
 QZ2GaQEQSQ3Aq/LttsgB9+gErD+J2nzEJprBjIAm74NXX9a8Mf3pBN+0p9s/Nox83XEL
 EV3t1+ahd4gGVqCkvj/NecHE4AQvUxwI4LBt5WX7Qtne8UpiF3Shj1+HV0G3tionecbF
 KzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257102; x=1756861902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U5zRWZgnToutMzLlMb+7iuvcy8Qg5Qy4VHsxh6P34qc=;
 b=mR/OnQIZMV0Sv+cbzP55aOafsgC6jqPGF2NB7p5VCEMzJHzIqOcOdOxnlPJrwwLtE6
 MyhhLudFwJQgo1QBdShnbQgV50JesfYZuTHARyd8w8IazkzC21ge36HKnhnCBhx409Pz
 vyTjEQy7FA08rkqoV0J6BEO3VZEw49a7lOrq4KgKemoeROEbhWPAzWY8GgehN1l3XqxQ
 BPuXN1yQobjzIn/TNZBdiGI+AzlMnwXN5aVJPddKXJAeHzktkjWV3C/XzYSn77iIy66E
 YUQ2s3AdorpE1O6Rnxg7RWHM2VChZuZcnNs/Fs9l8Y6MV9huiKZ1i7CNDnaXWY2w7Nwl
 h/1g==
X-Gm-Message-State: AOJu0Yx+Ti0hJEMdOQsy0b2v+mdiGGofdv7dQzXUHRXnfkjf/JeeolSb
 sj1R9d1dEztZqnRIyaQi9lTisLzalL/tHSL/5Z1N9yF+fbdLjuZwWmCThXbeFumy5G8=
X-Gm-Gg: ASbGncsDFZdRiOHJvX9sJ/b2VgMV3UzvRvQ3KcLJ+jaLx5QT65ee9HD9ZDhIzoVOcgG
 CcJbuY+MrSyWDoHgKCzrrZ3mWx6UKN4SoI9kNhH+x8tkXQAdfv8xELHs/eC7bZVrJH/J/zbyOni
 eVDje/yaE7MSobcEGLUffQ9eTJ9NgO0T+BGViSZpqzxhm+RB8EMRhbSx/+x93+rTc8BpMQMfIAS
 qBny6rDYOgo/iuMmeyWcswFZGXKPlFXQGS+CLxYZlLg7MCh4aXB+BYWVls9LldLxx3/+MfoThQ3
 /ehbpVTzu5ILLsBs3Qegl2pYcXgFtUmt/rXstI9NDagbWHRSDLHod+VVRyMB4tE/a6H2oG9FkJa
 XIAhYnCcjm2NHcI1HcTgHc8/KHf3iffXXCviv
X-Google-Smtp-Source: AGHT+IHmxIfZbrCHAe35cVtBbSlqOUD07ACd40KHOx2bENw4CzEVyKFFXdDDf88ecJEw6j0jEfCJXg==
X-Received: by 2002:a05:6a00:234b:b0:770:4eff:a300 with SMTP id
 d2e1a72fcca58-7704effa4bamr15895697b3a.8.1756257102401; 
 Tue, 26 Aug 2025 18:11:42 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 50/61] target/arm: Introduce helper_{get,set}_cp_reg128
Date: Wed, 27 Aug 2025 11:04:41 +1000
Message-ID: <20250827010453.4059782-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Helper functions to invoke the write128fn and read128fn
methods of ARMCPRegInfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h    |  2 ++
 target/arm/tcg/op_helper.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 4da32db902..82592d070d 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -90,6 +90,8 @@ DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, cptr)
 DEF_HELPER_3(set_cp_reg64, void, env, cptr, i64)
 DEF_HELPER_2(get_cp_reg64, i64, env, cptr)
+DEF_HELPER_3(set_cp_reg128, void, env, cptr, i128)
+DEF_HELPER_2(get_cp_reg128, i128, env, cptr)
 
 DEF_HELPER_2(get_r13_banked, i32, env, i32)
 DEF_HELPER_3(set_r13_banked, void, env, i32, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 575e566280..a3ae175a45 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1025,6 +1025,34 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, const void *rip)
     return res;
 }
 
+void HELPER(set_cp_reg128)(CPUARMState *env, const void *rip, Int128 value)
+{
+    const ARMCPRegInfo *ri = rip;
+
+    if (ri->type & ARM_CP_IO) {
+        bql_lock();
+        ri->write128fn(env, ri, value);
+        bql_unlock();
+    } else {
+        ri->write128fn(env, ri, value);
+    }
+}
+
+Int128 HELPER(get_cp_reg128)(CPUARMState *env, const void *rip)
+{
+    const ARMCPRegInfo *ri = rip;
+    Int128 res;
+
+    if (ri->type & ARM_CP_IO) {
+        bql_lock();
+        res = ri->read128fn(env, ri);
+        bql_unlock();
+    } else {
+        res = ri->read128fn(env, ri);
+    }
+    return res;
+}
+
 void HELPER(pre_hvc)(CPUARMState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAEEE66884
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 19:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWfrH-0000yV-Uj; Fri, 19 Dec 2025 14:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWfqZ-0000cu-BV
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 14:09:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vWfqX-0006rD-Dv
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 14:09:03 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so1774055f8f.1
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766171339; x=1766776139; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNnO369o5RyODW40YP5PUoZ8MigxvrSBu+tgeyebTyU=;
 b=uCi57RPHJaxATgectNUY9mGSninUKVMOW9uk3FYTOxOIPMQMdacNUn3XujAgg4cQwm
 NjFVuV1/i/LIkmNbZSaU/Wg4RWsRZmF9Ws1BhjcnZBWQnMbBqeOaFuagLaGiYvrV7CC1
 kepTCh2TD7xzpsDrq5nxYxL6jHdq8zFVM6a76v1jkJbwuRLTeJaG6bK3IVXBo0dtFsWk
 DvsNQfDTKANOxZDqIhzPJ/zulogjDb2RRc7KQUJ0hgkYxWsSshm6Ha4MsqLYlATSw1du
 J0tgYvHJTHt0Hd8LT40Mqp+qI6QaBpCZXXH54bQYUmltHXm3WusOilGE6TuF8nNKrIRg
 oGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766171339; x=1766776139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TNnO369o5RyODW40YP5PUoZ8MigxvrSBu+tgeyebTyU=;
 b=vqNdsVT9vZCaaNVvIDegUVNh/06ehWRQEdExNe3YAelrbDyh8Q1RecR6i0GByeL3jx
 lpcWMWNbR+R69JrQc532cz6WiCvK0B+r3f8FZBu0cj61X5d0P66liCg8WfISKDq43n19
 wyr/VuKNhQvvRmEwKcG5vi8jyOdN5ZhURJBFS4tHms3x7ctDhVbFIIS0+JYKMY8Sy3W9
 tIanhhlf1FtXwCybkiVlQCvW6Ximiswnh/mZuP4mgLP+fBzyc3ENQVzBAlU8IuYWgNzh
 ZbQ7TJQBssNU1sAmkR0GAcMMPOBNZatNBJq6BReLON1yQCVMJq+LbKssXaVqoOz47Iyj
 gpCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfWfgxyGUuBQu7ElivpAcsePccgZguJInQRcdmIJ1yzxm3jwNKugi2GxIlkqps1FwYUTr7YMiIgA==@nongnu.org
X-Gm-Message-State: AOJu0YxshyWuH1k3vaz0FOt6yqOn4tKG2EwMiCDC8EsoyK7HnJ6x3lPG
 CRgrE+sD4zjytr5+D0Lrdkj1sq9U1xK8dWHHZ7pD2BM6/P9LYHI+upBcZHZL8w+E6BQ=
X-Gm-Gg: AY/fxX4tGC2QwxIzLbXY0oGf4ua90pG9VujedVgUH4KorBK4tGuaOCB6iobXg0wLaC/
 hgD21mM+6w5ow4en/sZNwg1Mw213mZxb+vY8mg5KTBY+qDbgQa/gdZEJuCilGcb8Nd0v72rDe2V
 Xmyv4JhiLQGx8haynvGJ29/s9ADJ8qOgQv3ZQZcICGnqGnzUGpUCHrJlO6mV/1CgGnJ6Dfs0/Jn
 hB8QLmIhX/7msqeppYVBkDZZmHvj/ksNPXCkfVkDpx392J8BBe5mVO3X+fkEROQuszQTbFM9ZdM
 r3A5vA6ZFxJLJe0IPUn/chfJzYUSxKLd46uCYcXFfdmKesoiP+DmsYR4rIsd3JQdcOvSPzGYD9r
 TW9Kr4AVdWQGq4JIbbhLPnDVxIynp+OyzzHAq21fQje12WeIbiHTByd6LLj0QwO89dtZ4MKMsr4
 eiDL2ktvc6a4k=
X-Google-Smtp-Source: AGHT+IE/djsvq7V5yPEwmnhCaYtBAJh0llME81JdJRIYDw/vscbT8puxC23HWIyG+lk4mLByaL1eLw==
X-Received: by 2002:a05:6000:178c:b0:430:f41f:bd5a with SMTP id
 ffacd0b85a97d-4324e709017mr4626110f8f.57.1766171338905; 
 Fri, 19 Dec 2025 11:08:58 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea2278dsm6612935f8f.18.2025.12.19.11.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 11:08:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2298E601D0;
 Fri, 19 Dec 2025 19:08:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alwalid Salama <asalama@qti.qualcomm.com>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Mark Burton <mburton@qti.qualcomm.com>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 12/12] target/arm: allow gdb to read ARM_CP_NORAW regs
 (!upstream)
Date: Fri, 19 Dec 2025 19:08:49 +0000
Message-ID: <20251219190849.238323-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219190849.238323-1-alex.bennee@linaro.org>
References: <20251219190849.238323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Before this we suppress all ARM_CP_NORAW registers being listed under
GDB. This includes useful registers like CurrentEL which gets tagged
as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
registers. These are registers TCG can directly compute because we
have the information at compile time but until now with no readfn.

Add a .readfn to return the CurrentEL and then loosen the restrictions
in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
be read if there is a readfn available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20250507165840.401623-1-alex.bennee@linaro.org>

---
vRFC
  - this is a useful debugging aid but a bit haphazard for
    up-streaming. See thread comments for details.
---
 target/arm/gdbstub.c |  6 +++++-
 target/arm/helper.c  | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 8865f27089d..205bab811da 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -292,7 +292,11 @@ static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
     CPUARMState *env = &cpu->env;
     DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
 
-    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
+    if (!(ri->type & ARM_CP_NO_GDB)) {
+        /* skip ARM_CP_NO_RAW if there are no helper functions */
+        if ((ri->type & ARM_CP_NO_RAW) && !ri->readfn) {
+            return;
+        }
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
                 arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 27ebc6f29b8..1fbc45263d5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3529,6 +3529,17 @@ static void ic_ivau_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 #endif
 
+/*
+ * Normally the current_el is known at translation time and we can
+ * emit the result directly in TCG code. However this helper exists
+ * only so we can also expose CURRENTEL to gdb.
+ */
+static uint64_t aa64_currentel_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    int el = arm_current_el(env);
+    return el;
+}
+
 static const ARMCPRegInfo v8_cp_reginfo[] = {
     /*
      * Minimal set of EL0-visible registers. This will need to be expanded
@@ -3567,7 +3578,9 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     },
     { .name = "CURRENTEL", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 2, .crn = 4, .crm = 2,
-      .access = PL1_R, .type = ARM_CP_CURRENTEL },
+      .access = PL1_R, .type = ARM_CP_CURRENTEL,
+      .readfn = aa64_currentel_read
+    },
     /*
      * Instruction cache ops. All of these except `IC IVAU` NOP because we
      * don't emulate caches.
-- 
2.47.3



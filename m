Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51448CA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 13:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGGOd-0004Jw-CM; Mon, 12 Oct 2026 09:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGGOb-0004Jf-Nk
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 09:48:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGGOZ-0003Su-01
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 09:48:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso22496135e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 06:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791812928; x=1792417728; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9KMOnTIgzXJ5irf8RQDp+yn0jKO0xSxRv0zm0tDhx9s=;
 b=AWB3lwZR6Ien/OEwWJC4UPXeINlpeF0Br8/KATVge5WU/WfuKuyQCOauq3tJpBEBra
 aQzkByR4tIiPNXRAhvujmZq1otVOkQEWMESb8sthaHydNUqcXLYjyjcEuFp0NoTCoNl3
 DnmHawoiQh/tFBt/Laz+AxZF3+Mekh5QJwd89XdEDF8RLH3LPLm4Xot9TVGKuLn7ZxL0
 PrulSASicFIYdc2QSUaBPOlKLG04iNVU8HUB6pGWHvPoYbH/ZFldZlfqmHtXg3tEZD1f
 YjWvnKPmxdmHa/GohSjXBOOayFecleoZjiDU+e8LNM7ClKLTa0F9xjJoMIkLxm3EI4uY
 bOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791812928; x=1792417728;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9KMOnTIgzXJ5irf8RQDp+yn0jKO0xSxRv0zm0tDhx9s=;
 b=gDbDj8/lBgoXMGyzF8cExaDSyJGb0g7YhLQkCw20McOVr6ksXo3FBiIkrHHQQN0M2b
 rGJ/Lpk/yK/ndvTUxcj1s0Me8/6Cfx46FBws1AuXpFoKAavVvCrqQ8DF6PvuLrL5gQpd
 JBDHTraozf60UgbH5zzGiCreILVrmqTo12wNKrMm/s1CbfgaVEepj3kB5AHX+AlpxOAE
 eyEDpezQWVGcN/TxSeDVsej+LshbXloshrf1e07FLzyz8Qcjj2BezmPN2AbUzeY0wwwY
 iiAQiqk9+/y8Oa+nhga4hgNw+YdRq7ZE2c4nbggtJfUrFoYZgp/CVM2isc/hZpqCDmde
 FfHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMxGMpNOEkKP9ySZPWVks+6rhEh6JXtngfXPprP6+9ATIXhBVPEcmcPFuzXuCibC4xVvnWlhuUAg==@nongnu.org
X-Gm-Message-State: AFq9FYL4JeZbSrJMMGWzmOUPLzXibXu9P1pciaHs+BvN/bd+cov+70Yl
 cFbAA/1bGEyrnWTAe9IU2cHU6PM5dCpuzae6hVbgvDOIYv7nwVdF0H6u6SfJN5XUzLU=
X-Gm-Gg: AYBFou0YO/4QChJgerEL8N0ZlRMRy67FPp4rwXIdS9XUg/EaGiciz91aXImAdBTVJ8b
 ePrjILO3MDMqNwJMyiKu5SpX7v/UGwTKqqi1/MBEVNqQ87qRTcGVu+8f/Fn+f2zyoolpJk0qD9L
 tSSMf/XO22/b2ToQvRUmhIfl6aaQRQkpKQG8fZ2W5h3caKATj0VQLfRsntBnTY4uou63tLI4dW0
 sFc5mfzRKOosyi41/9jVjQPEXYmDvy7QkFIVsIUSc+fZ30qUQp29Ni4lWYQnQHSCF7ZOqueUGf5
 v1XK7P23FH6ldW8nisQDtCjmxEkuqsV/wqPoYK+7Of3SXtaVLwuAK5zLY1lg2kEcSw5p7m9Q90j
 eIpF9/w6PbN8akw2j+n/sewSweokw0tYg3tEnHR0tvi6FP28rjGx9QCTpDRttfOlMqo6PoL5YA5
 8HHtN+lsLVSsREHQ7zsKLmrrFd+fY7JAioBKLSwAp6KyTvFqWMWnTufw6P1TZdsQvMXJCX/g==
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id
 5b1f17b1804b1-4a18e4988ecmr178045235e9.7.1791812928277; 
 Mon, 12 Oct 2026 06:48:48 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea1021sm266193165e9.10.2026.10.12.06.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 06:48:47 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5022E5F8CE;
 Mon, 12 Oct 2026 14:48:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: hold bql when SEV sets the event_register
Date: Mon, 12 Oct 2026 14:48:40 +0100
Message-ID: <20261012134840.1051969-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

There is a race in qemu_process_cpu_events and sleeping on halt_cond
where we can miss the setting of the event_register which would cause
arm_cpu_has_work to report we shouldn't sleep. As by definition the
bql has to be held when we go to sleep against halt_cond guard the
kicking of the cpus by the SEV helper with the BQL to ensure things
are properly serialised.

The other places that set event_register are fine as they are either
in the same vCPU context or are already serialised by the BQL.

Also use qemu_cond_wait_bql like the other halt_cond users.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4660
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 system/cpus.c              | 2 +-
 target/arm/tcg/op_helper.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/system/cpus.c b/system/cpus.c
index e11a5aab6a6..985732217fb 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -412,7 +412,7 @@ void qemu_process_cpu_events(CPUState *cpu)
             slept = true;
             qemu_plugin_vcpu_idle_cb(cpu);
         }
-        qemu_cond_wait(cpu->halt_cond, &bql);
+        qemu_cond_wait_bql(cpu->halt_cond);
     }
     if (slept) {
         qemu_plugin_vcpu_resume_cb(cpu);
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index af56eff9f18..7c1fdab79d7 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -471,6 +471,9 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
 void HELPER(sev)(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
+
+    BQL_LOCK_GUARD();
+
     CPU_FOREACH(cs) {
         ARMCPU *target_cpu = ARM_CPU(cs);
         target_cpu->env.event_register = true;
-- 
2.47.3



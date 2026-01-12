Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D13C9EC67
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDy-0006Ka-Al; Mon, 12 Jan 2026 05:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDw-0006EY-N1
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDu-0001v9-TS
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so42905845e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213953; x=1768818753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/H3tcHxNV5Gv+ubcRhcnU/eZQeg+lU3aNVd2Ihjkzg=;
 b=jYHZG/qqK/CpEdjFP53CRqNv4IK3KAru6dAdiVUSiLKRcWZUiFsuMss42mx9MJNrkY
 9CTL2hiIABM7G+FdTEiSCRXknYXLGaHXK9jCI9hlAZp4UHNbtgkYwganYHSuIAYBgswy
 fFmlOaC76VRF+HGgXkBr6uAyV5vzGCDc6NMYGsTa/IT/mX+GKmhkJJFOpHxF+3WOBbaO
 yWs/ymzjd2YslrJ0QMEnv1GH+S0rTaD0qLxYiExiCIST4CUOZ+HiZ9HHP2tvyqfi7qKI
 Q0udx2jRoi4x4id4HMBvYbh7pXUvw3o4xfZ5p0VwsmpwVbKu+ipOpSHGHy3hICxIdqHy
 riQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213953; x=1768818753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z/H3tcHxNV5Gv+ubcRhcnU/eZQeg+lU3aNVd2Ihjkzg=;
 b=sYCCzgp8+ubET+bPfu7xezkcBwFyeuE8frwm5bNQwSpmcGCh7KrzpKa7HGAH9i0wi1
 gVKGxqZNQe9jOUIy/aSoyTM3Q+i4FHPEgrHIBYa+D31o6wSdZ4/w3pkqWMlqOiuqm87f
 mzZZSFY82S3lxLi+RSfeCKF/q0Zs1TFmUTpKjNqFmeEK0vX0v7niZgBOP23czWUUeQHa
 VdpVW42xNsbN2M8k4IA+0EhdcMmiarcpno9JQQSZ3dMGcWy/XEyngb0Vk8TBZymZ63A4
 uhiOV8Ta9a57HTpEo6hRXyus1NXALdnZrzps4/75KJD4444ysS+dnYjZ3iDNwQCqVB1m
 GSfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgIQE9AE8n/8o9ktq+qg4jrjar2E2gF+3fPgJi38quL8fGYEihScq9Hwgwa/nYJkzBuWMu7jWc0Q==@nongnu.org
X-Gm-Message-State: AOJu0YzFxk7pAU65Cdic3G9mHlGVwV2vzVb7Q95IdcdW6ozg/NPZUIVv
 jXzJ0ZNuiTBYjIJUYHTgHL3vycW3OCnkbzoj7MP3WEntHRRIalaXYRXNF/OABwb1e3s=
X-Gm-Gg: AY/fxX7VEF5HjwoaYdyaskrVV0RPG86/IaJ3OLrPaQHaekJMRohLddv6kNnaA0LnT/H
 vktRcwX92s+7M2tJF7r5dtiWseY5U08CendzwJVK7fgyX1h28tzfGcTNSiBqQ6IHMxNtZ5Met3U
 ePV75FMUfP05IOcOJa2VDtknAMlXC4Ir5MEAvGNAXWK9oq0qmloC0Aw8uoY8umQvKBak3LoDeKQ
 rutvAomnQLiL0qN0aFWG+2CvFEXZdAyyUxnCBYsbMQRZlsXN+aEkGLMfzHQkpAk/RP35sU0GCp/
 Os5VSebjhXB4tWly1RYZEeCWv/I1OC/3/5yyiYXYkm3v3VCutuTBtPjuNVZnfHP8HK4fdvtM7Nc
 Ik21KULSaRJtSXurWb2Z8iKRvWS6qbLhZGySZh5cQrWxqpIEmfW4cQDj+yfzA3lTU277aV5yV2x
 BHe2IQflOfEkOyvWtFaekq3CDDQYqA759GsTjk5VvqCSwNy4COqF5ZYa8IrfRb
X-Google-Smtp-Source: AGHT+IG6yLqjnscPJXeLpTyo/wSaOXniJA2BzbGl8RcqHrdI8Wgzk4BeJql8k1Iyk3EihGerbBf8Qg==
X-Received: by 2002:a05:600c:c491:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-47d84b5b5d4mr168633285e9.29.1768213953442; 
 Mon, 12 Jan 2026 02:32:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f418538sm347941935e9.5.2026.01.12.02.32.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 17/19] target/arm: Create GTimers *after* features
 finalized / accel realized
Date: Mon, 12 Jan 2026 11:30:31 +0100
Message-ID: <20260112103034.65310-18-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Call generic (including accelerator) cpu_realize() handlers
*before* setting @gt_cntfrq_hz default

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index caf7980b1fc..c1087bf5b92 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1636,26 +1636,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!cpu->gt_cntfrq_hz) {
-        /*
-         * 0 means "the board didn't set a value, use the default". (We also
-         * get here for the CONFIG_USER_ONLY case.)
-         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
-         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
-         * which gives a 16ns tick period.
-         *
-         * We will use the back-compat value:
-         *  - for QEMU CPU types added before we standardized on 1GHz
-         *  - for versioned machine types with a version of 9.0 or earlier
-         */
-        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
-            cpu->backcompat_cntfrq) {
-            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
-        } else {
-            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
-        }
-    }
-
 #ifndef CONFIG_USER_ONLY
     /* The NVIC and M-profile CPU are two halves of a single piece of
      * hardware; trying to use one without the other is a command line
@@ -1702,7 +1682,40 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
             return;
         }
     }
+#endif
 
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    arm_cpu_finalize_features(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (!cpu->gt_cntfrq_hz) {
+        /*
+         * 0 means "the board didn't set a value, use the default". (We also
+         * get here for the CONFIG_USER_ONLY case.)
+         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
+         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
+         * which gives a 16ns tick period.
+         *
+         * We will use the back-compat value:
+         *  - for QEMU CPU types added before we standardized on 1GHz
+         *  - for versioned machine types with a version of 9.0 or earlier
+         */
+        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
+            cpu->backcompat_cntfrq) {
+            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
+        } else {
+            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
+        }
+    }
+#ifndef CONFIG_USER_ONLY
     {
         uint64_t scale = gt_cntfrq_period_ns(cpu);
 
@@ -1723,18 +1736,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    arm_cpu_finalize_features(cpu, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
 #ifdef CONFIG_USER_ONLY
     /*
      * User mode relies on IC IVAU instructions to catch modification of
-- 
2.52.0



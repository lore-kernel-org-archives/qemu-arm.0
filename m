Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B26DCEACCB
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK0Au-0003cg-FC; Fri, 14 Nov 2025 15:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK047-0008W9-Fg
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK045-00059n-BQ
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:38 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477632d9326so17110415e9.1
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150793; x=1763755593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3F2C6kHHPWBiLc/P72P8z+qmvtuhzoJzLzlQGryUqk=;
 b=u/VJ9xt11jYvqbDh7ZkWgBjRcSRwIqEPyxs4+kSJZBF1bB6FVsA4VwrdNLvAPOSyyP
 OXj2F3zzup8r7Wspru2pGVneavsJ/YQsnR2pZsloNFqnRSysNKgLLVMamJy/V/Y3T2VV
 KK2Z0GpMBJA1amVv2ENfxM2mpwqgYTDchkBChy0fSZOrlI2q1OIDl5y/LDI5OvHIkVdB
 /olz6ywhlYxErWF/ta/YugD6LSaGkY+Ql1dS5LrOrUxZYws7W2UmI6y9z5QGzPnvHODE
 tk0zLU/OBqoINfKsVeYgR47loFqWkA7RsynoI+f5GG5KM7MzzAHtLzN4epHwWVpRSSg6
 kD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150793; x=1763755593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R3F2C6kHHPWBiLc/P72P8z+qmvtuhzoJzLzlQGryUqk=;
 b=Hwj3/JEION+mEMSlWAjNUgazQsSYY3RJESwS8I3ev8jaqt2R1BvT0bt0nxyyRbDwkD
 z2X6qJLdNWfctBhKL5OUiKrNpAfG91NQg3FUn7jDhq/g/pmijsASnOQ/p4LhZa+txOHp
 GXslmi3jqA0pRz3XTosyJtu/t/u9HsuFzw5DMo3tmuUwN16P9d7FGUkaw+Tffx+fve4K
 xkO6h1ho2q6fWGA2YySHyQBM4yVKYP2i5Taz455FE5wbs2PU50H4K5zklT4EuSC44kLi
 KpShYW9XjIosvpJgbZJo9nk4tDbV3sj+VViMwGTgHuwCLe1OdwUjXMQZlXpIXrahVXx1
 JjFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWboamHIqC7MsJUCIT1oVNsyvFU/ay13t43yv969mhkFi1j6hBmGUnu1dqkCma8Ep++jpyPig7yg==@nongnu.org
X-Gm-Message-State: AOJu0YwCyhF6MYoa3rtQMn2rM9cw06CAhWjROlaSjlnj16vIQY9koF3h
 zrS8nphz4mlqYLau8XW3neMTrNkzKf0/H+WvhE0zzlB6eg+zvUe2JM7YfGj5zNmBsHs=
X-Gm-Gg: ASbGncuMyWoUiMF7DUweQhvgI62J+dlgXIcCUwwV3joqDbuq7JzMGc/+qpQ34Ngru/+
 OCmIcXD66NHzZ12wg4fhF4CWyPGxLl2UOTQKGoJI7N5FGFSgozPWW2c5V4HHyQvPVRyEatNj07i
 lIhpaGHVRhxQcvoP+DpB4FS8YRYza5CT2Tq8gSqY/vBhBdT6tAOLbzvKwwAVGsI7Kea2qgTRa/s
 X1OIttYBzvKKy6Chsfix/s8m2P7UOgwO7r5ZpYY8P/8t8b7mYPmdmRdzcVy0KvI0mrxo0uu74f9
 Uho3wKNWS9ZhGeTQFs78aadiqRwaEqhrno5hY9gcTkOQe4QyOe4PWisWjb8IS2sgYR7EyD+/UBT
 +tnyBlCkOa92KLOd8fhGyQBfVJG5cb5hQlQjPJX2iR040pjxRyEC0Duito8ycS/FCvHc68frQnu
 BZ3TeUQs/tH+2H4y9Hv0/5IUTB6Vr03n8F93oLatDvJ0e35/c7hA==
X-Google-Smtp-Source: AGHT+IEn8axmdlThJoOIpCHIUcegfWVBb8SZB6bu/ErdlYyUDFfP+9Hh2RA09EyvCjVirGQcLS9EsA==
X-Received: by 2002:a05:600c:4505:b0:477:7a87:48d1 with SMTP id
 5b1f17b1804b1-4778fea8810mr51352655e9.30.1763150793439; 
 Fri, 14 Nov 2025 12:06:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b60csm11771751f8f.22.2025.11.14.12.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:06:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 17/19] target/arm: Create GTimers *after* features
 finalized / accel realized
Date: Fri, 14 Nov 2025 21:04:19 +0100
Message-ID: <20251114200422.4280-18-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Call generic (including accelerator) cpu_realize() handlers
*before* setting @gt_cntfrq_hz default

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 39292fb9bc1..b392374df98 100644
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
2.51.0



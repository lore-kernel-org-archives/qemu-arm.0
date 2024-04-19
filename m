Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2604094ejd;
        Fri, 19 Apr 2024 11:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzbGRfdQII/bwnc4+UU2PYLuM0NzjbibQQra8ngiAwuVsZgHtWz+IMVjanLAegH/t79AXtdINugsHMlU8CJ8KMHSC2REyI
X-Google-Smtp-Source: AGHT+IF8Qikau24lj/9eOTvKnYV3sISM/tqIzVYzMKPFcrRX1Q4mwdhJZDadzLKZLpyT6LcPP7He
X-Received: by 2002:a05:690c:f8d:b0:61b:97c:5ffa with SMTP id df13-20020a05690c0f8d00b0061b097c5ffamr3919789ywb.22.1713552439911;
        Fri, 19 Apr 2024 11:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713552439; cv=none;
        d=google.com; s=arc-20160816;
        b=NdzX2EFQ9nQhOMqyy5Js2MyN3rWDeaGckLvux8NbmcVRs7/LW/w34z3AIzLIZ7se39
         QGUDFidAqppcjcRK/44KknZqs9Q07ybLYkW8s/ti8bi8tLeF8eQ1rXy6rMf/2W3bf9wE
         0VD58ujQ8fo9CxoD5PW7dgS9rjZq6UquYVmWaplE1pVfisGJX6XpVuXfM6IbmYOgAbKq
         DcQkkQhOtBc8BzjOnJL41d8y67EoxXIlyWZ11ojmbf/ay9gy6DxH0zdFxdy1t51UlyWb
         JO2fZhkchJv6i2dSxJwsPLFso0to5LtSEYtLHQSHmtH0QPC5q/ycXvyevLnOasYKa172
         gxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cD15Yu4sqNz4RqnI7YL4Ofu26geh4vOxHGToCiBD3jE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=sZ4V0txZRsaijPJRoq5dENs0nRqXc7erK3xUNlQLu42hICNYmALgh1K4KVMsbPqBKe
         bfE4spl3Fgv3T9eVqBcGLF5S2b/5Tthwa6vRyDYhJPIlsmPCzboYWAQhBr6tafReBRSf
         qklGpXdwUbTL1FyW2Q7OkeIK+YyhfjP5pTYNozMO1fd0icVI55qZD4aIIxB24++plhrU
         emkEJoxoIj6k9Z5eaeqqRQqUbtbVQOsxbBYxbZu0dTNEtvG83bk2TxvsHrhhMnA92zV3
         UNl849A8OoJ8ybLVGsULVSICy4Z1h7HncQhPXuPeXckJ4LL6Hj4yUH/R/Bxs3gDREjGT
         LlKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c04mI1x0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb18-20020a05622a1b1200b00437b3e243efsi3253420qtb.82.2024.04.19.11.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 11:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c04mI1x0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxtFc-00087h-RQ; Fri, 19 Apr 2024 14:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxtFX-00085i-LD
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 14:46:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rxtFU-00011y-8f
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 14:46:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so1586108f8f.3
 for <qemu-arm@nongnu.org>; Fri, 19 Apr 2024 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713552371; x=1714157171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cD15Yu4sqNz4RqnI7YL4Ofu26geh4vOxHGToCiBD3jE=;
 b=c04mI1x0RibMi2WGYX6R0ljpHHK217XENKr/ySn3LWJlZAwhzZGeAHdeOVmjnenIp0
 23xSWR5IBEQlco5NDZdqAckocQpK5AkQGUAhK07L/BoUriF4mqfYKefax7knKD2hYdM1
 IGpnC5WzIlM/tFgTlQr8Xq54ud603QWgLO2/CT0w75WHThi3XrL60gdaF29w3P4lOKro
 Kz33lK2FYKvUsR/tagNXEduyZ7lpeiqh6zur1VK5SdKxqEGvzqY/x616v4hq6X5r+rxx
 1QN2BA6eoDSB7tOv7KDREUwTV1XHW/CGTqcn9jn8mq3qIV2wy/toLcy0OG//RECw9c+8
 uKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713552371; x=1714157171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cD15Yu4sqNz4RqnI7YL4Ofu26geh4vOxHGToCiBD3jE=;
 b=vbBpgYbCg7FQ+iBGnsYiSUQxVTO+vWIE6+ELefnZlbBihY8vPDfBb9xz+RLa8VxvA+
 sWWMGs4H7p1J92ZtUnQ8ZcAqli2wOxD2r9r0K5TclheBgMNY+sVBezKSYw2sgGkD14/c
 iFI0a+huernydYsIqrPHQaAAnwph8NNe8R+H+A0NsjmuvCd5DKfX8UPn88ziBSBJxH59
 B3v5MjNt+mUZQLetNjx+YcJleV9Zy9kvPQvaBYyJzYD6ez+i8tm2YvPbkTGeZ+/BJVXl
 2p5Ouuc9bWDWfBDQtq3zkrTwApC3cH3IeXWmnWD1sfIeW9c75YEf8SFOQ7hWJWzf7/r8
 /onA==
X-Gm-Message-State: AOJu0Yy/pFCkuGUJHxs8qxohpJIf0ZhC7iQnWlA4myHEhjob3ZINILVH
 CQd/zziAdNnlBMAz8UH9YgQRUkFr1stsnr/1pCx/8n3hvaLOrp4jXarDhK91OF66yVV1UUUAAVo
 I
X-Received: by 2002:adf:f6c3:0:b0:343:71c2:287e with SMTP id
 y3-20020adff6c3000000b0034371c2287emr1771485wrp.59.1713552370825; 
 Fri, 19 Apr 2024 11:46:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 cs18-20020a056000089200b003437799a373sm5108718wrb.83.2024.04.19.11.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 11:46:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Refactor default generic timer frequency
 handling
Date: Fri, 19 Apr 2024 19:46:07 +0100
Message-Id: <20240419184608.2675213-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419184608.2675213-1-peter.maydell@linaro.org>
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 86nXwPS9VajJ

The generic timer frequency is settable by board code via a QOM
property "cntfrq", but otherwise defaults to 62.5MHz.  The way this
is done includes some complication resulting from how this was
originally a fixed value with no QOM property.  Clean it up:

 * always set cpu->gt_cntfrq_hz to some sensible value, whether
   the CPU has the generic timer or not, and whether it's system
   or user-only emulation
 * this means we can always use gt_cntfrq_hz, and never need
   the old GTIMER_SCALE define
 * set the default value in exactly one place, in the realize fn

The aim here is to pave the way for handling the ARMv8.6 requirement
that the generic timer frequency is always 1GHz.  We're going to do
that by having old CPU types keep their legacy-in-QEMU behaviour and
having the default for any new CPU types be a 1GHz rather han 62.5MHz
cntfrq, so we want the point where the default is decided to be in
one place, and in code, not in a DEFINE_PROP_UINT64() initializer.

This commit should have no behavioural changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  7 ++++---
 target/arm/cpu.c       | 31 +++++++++++++++++--------------
 target/arm/helper.c    | 16 ++++++++--------
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd3da211a3f..74d4b1b0990 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -59,10 +59,11 @@ static inline bool excp_is_internal(int excp)
         || excp == EXCP_SEMIHOST;
 }
 
-/* Scale factor for generic timers, ie number of ns per tick.
- * This gives a 62.5MHz timer.
+/*
+ * Default frequency for the generic timer, in Hz.
+ * This is 62.5MHz, which gives a 16 ns tick period.
  */
-#define GTIMER_SCALE 16
+#define GTIMER_DEFAULT_HZ 62500000
 
 /* Bit definitions for the v7M CONTROL register */
 FIELD(V7M_CONTROL, NPRIV, 0, 1)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ab8d007a86c..b248b283423 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1381,9 +1381,12 @@ static void arm_cpu_initfn(Object *obj)
     }
 }
 
+/*
+ * 0 means "unset, use the default value". That default might vary depending
+ * on the CPU type, and is set in the realize fn.
+ */
 static Property arm_cpu_gt_cntfrq_property =
-            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz,
-                               NANOSECONDS_PER_SECOND / GTIMER_SCALE);
+            DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz, 0);
 
 static Property arm_cpu_reset_cbar_property =
             DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
@@ -1829,6 +1832,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (!cpu->gt_cntfrq_hz) {
+        /*
+         * 0 means "the board didn't set a value, use the default".
+         * The default value of the generic timer frequency (as seen in
+         * CNTFRQ_EL0) is 62.5MHz, which corresponds to a period of 16ns.
+         * This is what you get (a) for a CONFIG_USER_ONLY CPU (b) if the
+         * board doesn't set it.
+         */
+        cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
+    }
+
 #ifndef CONFIG_USER_ONLY
     /* The NVIC and M-profile CPU are two halves of a single piece of
      * hardware; trying to use one without the other is a command line
@@ -1877,18 +1891,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     {
-        uint64_t scale;
-
-        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
-            if (!cpu->gt_cntfrq_hz) {
-                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
-                           cpu->gt_cntfrq_hz);
-                return;
-            }
-            scale = gt_cntfrq_period_ns(cpu);
-        } else {
-            scale = GTIMER_SCALE;
-        }
+        uint64_t scale = gt_cntfrq_period_ns(cpu);
 
         cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                arm_gt_ptimer_cb, cpu);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8bdbb404195..01cf231a861 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2461,6 +2461,13 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .resetvalue = 0 },
 };
 
+static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    cpu->env.cp15.c14_cntfrq = cpu->gt_cntfrq_hz;
+}
+
 #ifndef CONFIG_USER_ONLY
 
 static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3215,13 +3222,6 @@ void arm_gt_hvtimer_cb(void *opaque)
     gt_recalc_timer(cpu, GTIMER_HYPVIRT);
 }
 
-static void arm_gt_cntfrq_reset(CPUARMState *env, const ARMCPRegInfo *opaque)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    cpu->env.cp15.c14_cntfrq = cpu->gt_cntfrq_hz;
-}
-
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     /*
      * Note that CNTFRQ is purely reads-as-written for the benefit
@@ -3501,7 +3501,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 0,
       .type = ARM_CP_CONST, .access = PL0_R /* no PL1_RW in linux-user */,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_cntfrq),
-      .resetvalue = NANOSECONDS_PER_SECOND / GTIMER_SCALE,
+      .resetfn = arm_gt_cntfrq_reset,
     },
     { .name = "CNTVCT_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 2,
-- 
2.34.1


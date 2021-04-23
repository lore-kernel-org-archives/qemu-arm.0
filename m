Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1521533lfb;
        Fri, 23 Apr 2021 09:56:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqu7ZXP5MumGZX6yx7oQjPjbu8gh8GTH1vKDcK0zQvJPgrgZ3ijLLz9vwVG8j0CmotAfHX
X-Received: by 2002:a05:6e02:20ce:: with SMTP id 14mr3725227ilq.102.1619196983947;
        Fri, 23 Apr 2021 09:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619196983; cv=none;
        d=google.com; s=arc-20160816;
        b=rIq7/agPrDaFjhgwInVviyCvoUivrIM+fb8OgmriIuNDv/qSw/qRZnCAVfoJpsuMTV
         pVox9rn73ul4at/ZoWNgRmBX8BhG4OkMYvXhMf8fCusLloCn+9p+Tbq8yX3El33OMiST
         KfbWFQ5ecE0POJLar/K+VsV5E5C1t24YdO7Gm8n8S3egTpEytB4HNK3ynKa4XVIKFrs8
         CCc65ymWeQoUov7VzFWQUpOSiidEXblEJ/2h8XRZ81cc3qYOTfiSw90hs6zXGYQk3ZK8
         q14OLtGfcynb+irVdyApHwLYxla+9Jb3Wl6BULvwpe6j+rVeBo6ynKZ/mG62RyeZR8Gs
         Fxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o32ekfL5QFhqhaXYyN+uFzVuIh/l+z5aZIxS+8hP4yY=;
        b=hxU9OC08KDz51YW6vPCP16IlFYGCkhP+gYTzJpmM1FhBNrD75nYDMc3zAuQg3izb03
         HyHWYoPuRpmoobO/ivHAjSiFGOyhV+dkAA2EByBXa9SxmjQ7ne3E4edtuGoO5PpD0q66
         C9xRtCdvLotLvo01iXaTJO1zPfw3L+ncSUghRHkeWIaqgWMe+8N131zWX/h0WhPANWes
         bHaFujAX9CR5S6+kbXN15tj84fAjqzt+OnFP5nQRpNspGtnz4FNFBYdGfRK4THXfqGjb
         lOVuXsVL17CpDAQFKwwYCDx1gjDDPQtVN5N3LASnayCOkEIDckjP+mzQBixArONoGe7J
         oFiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOuGbMbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si6537448ils.113.2021.04.23.09.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 09:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOuGbMbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZz6N-000107-8V
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 12:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4f-0008R6-GQ
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 12:54:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZz4X-0008BV-Ez
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 12:54:37 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so4751908pjb.1
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o32ekfL5QFhqhaXYyN+uFzVuIh/l+z5aZIxS+8hP4yY=;
 b=gOuGbMbmFNaIRjnyhhfjad3JYE57M2fB0AgjuztoDAuvuLllwEaKZhMNWCY1o9AfPs
 pt8oPlQEh05aJJ/x4XC2HqmblZIA740/wOpPm2ohvrsJUc4uqrQGiSHqWvzw8pr1zyRS
 h4gVgvk/LGHfpVy//9xMZi5tn5ZPGB5WtTyybvqxreDpOK1CzlyBrXrHzm31NAmOJG9F
 9Ap7pP5UGjGVl+8Yg6LF6JwGFKYkP2W9OLuzkUlmPJ5btVq6B6FFkqmoF84N44+rFB52
 ERct4m3uOYzMujLUcoNkj788SQlixBAmX3jvB3EP/K5xMm6rK3y9U+1brke51QyVH9r1
 i2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o32ekfL5QFhqhaXYyN+uFzVuIh/l+z5aZIxS+8hP4yY=;
 b=P0QxzwBYx8HwnIhRtdPD8POA/77IOdsr7dpWOXqq3fjQrP7E3xSXH1IB/9djSgrYtt
 MDzVACk1sCj5irsDzAQlD9dS0xwS0cnHa1C6eOCKVggEg2T92+j0NypKmg0EN2K2d9q1
 KvsPVnIf+94pEQdckZq4JXmIGf29yYIEU1jq5NGa1smDX2vGVYIUNPzs6avivVp4WuKK
 s08sqtB6TTkZU/5JyZIAc7XU/4D2SAD05hrG84HLg2SeXkhI+R54Tzz31ycfIRxANfJB
 5HeNqFeYQ57rtTa7Kqx8l3ldpG5YxtzmJkqaUMqIFLXuvVwa22MT7wtz6kT5LZSZhftL
 PnLg==
X-Gm-Message-State: AOAM531IST2OpkXwGwrbOI+DAzMToi+1nsJ0s8wwT3nM5tbRozJbroqq
 roayjDS0xo2+R/xD90chMtKggi5VLyce1A==
X-Received: by 2002:a17:902:361:b029:e9:8392:7abd with SMTP id
 88-20020a1709020361b02900e983927abdmr4670089pld.8.1619196857454; 
 Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q5sm4918151pfu.5.2021.04.23.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:54:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] linux-user/arm: Simplify accumulating and raising fpa11
 exceptions
Date: Fri, 23 Apr 2021 09:54:13 -0700
Message-Id: <20210423165413.338259-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
References: <20210423165413.338259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0f+ZX5rGSrY

Use bit masking instead of an if tree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 50 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 5f61d25717..69632d15be 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -228,6 +228,7 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 {
     TaskState *ts = env_cpu(env)->opaque;
     int rc = EmulateAll(opcode, &ts->fpa, env);
+    int raise, enabled;
 
     if (rc == 0) {
         /* Illegal instruction */
@@ -240,28 +241,31 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     }
 
     /* FP exception */
-    int arm_fpe = 0;
+    rc = -rc;
+    raise = 0;
 
     /* Translate softfloat flags to FPSR flags */
-    if (-rc & float_flag_invalid) {
-        arm_fpe |= BIT_IOC;
+    if (rc & float_flag_invalid) {
+        raise |= BIT_IOC;
     }
-    if (-rc & float_flag_divbyzero) {
-        arm_fpe |= BIT_DZC;
+    if (rc & float_flag_divbyzero) {
+        raise |= BIT_DZC;
     }
-    if (-rc & float_flag_overflow) {
-        arm_fpe |= BIT_OFC;
+    if (rc & float_flag_overflow) {
+        raise |= BIT_OFC;
     }
-    if (-rc & float_flag_underflow) {
-        arm_fpe |= BIT_UFC;
+    if (rc & float_flag_underflow) {
+        raise |= BIT_UFC;
     }
-    if (-rc & float_flag_inexact) {
-        arm_fpe |= BIT_IXC;
+    if (rc & float_flag_inexact) {
+        raise |= BIT_IXC;
     }
 
-    /* Exception enabled? */
-    FPSR fpsr = ts->fpa.fpsr;
-    if (fpsr & (arm_fpe << 16)) {
+    /* Accumulate unenabled exceptions */
+    enabled = ts->fpa.fpsr >> 16;
+    ts->fpa.fpsr |= raise & ~enabled;
+
+    if (raise & enabled) {
         target_siginfo_t info = { };
 
         /*
@@ -275,24 +279,6 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     } else {
         env->regs[15] += 4;
     }
-
-    /* Accumulate unenabled exceptions */
-    if ((!(fpsr & BIT_IXE)) && (arm_fpe & BIT_IXC)) {
-        fpsr |= BIT_IXC;
-    }
-    if ((!(fpsr & BIT_UFE)) && (arm_fpe & BIT_UFC)) {
-        fpsr |= BIT_UFC;
-    }
-    if ((!(fpsr & BIT_OFE)) && (arm_fpe & BIT_OFC)) {
-        fpsr |= BIT_OFC;
-    }
-    if ((!(fpsr & BIT_DZE)) && (arm_fpe & BIT_DZC)) {
-        fpsr |= BIT_DZC;
-    }
-    if ((!(fpsr & BIT_IOE)) && (arm_fpe & BIT_IOC)) {
-        fpsr |= BIT_IOC;
-    }
-    ts->fpa.fpsr = fpsr;
     return true;
 }
 
-- 
2.25.1


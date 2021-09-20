Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1695318lfp;
        Sun, 19 Sep 2021 19:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMLsr3y3c8lCwmGvVvA/6+zpWVeZb68lFV1wlyPGC6WzR/rR7sa8vjd2KZENctznTTC2RU
X-Received: by 2002:a37:688b:: with SMTP id d133mr1656957qkc.352.1632106297069;
        Sun, 19 Sep 2021 19:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632106297; cv=none;
        d=google.com; s=arc-20160816;
        b=LNezuVLTp4TeovViPqnEjJ8/DzQ5oy84qp55hx05FewIagl93kLcugVdZF77OUGMAs
         XAWaaNXxQoH9FWmaCL3PrOGJWTUS28NEOYgEWJqWzCIAPct5gTmz/VIm7un+JsZUmQan
         l94LI8ZlCVQHVmYplddzZgqLMLqH/eVKDBc0ZAhcHyvt47ZojrJv0Gl9DA2Vwxc8ShXa
         eku3PQMdlxWnd6qk3gD1sun4MyM8iweHEjkDkqtyoQVIg0HGs1njFlid3DnlSnM2saVz
         6tOwVEbuJ/It+s2nTb4Y4vRDRRJp1g/huA/4T3GC7bzNq4lOhBUX3zwm6OgrS+x+Y9Le
         JV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
        b=B0VloZGa0Yn7PGBql2qqYSeiyuLy5FMaOV/JCqxtteCAf+PBG2Law4uqF1D+ACKbyP
         Ke2tli/rWuC+A+wDF71RrEzWz0Ki46cBLakEeSYDZhfg1l9icLPi880p76KPZixAG6N2
         XgFUoXqMZHeIdbN0JoOntIZVSb++enDrrlT3SE10wo07T7+TjwkMHZvC9EqPUNq6DSZR
         1UulZ0HFtlpYqD0FqPUoCmqWhRkOVBHZsXOhdGdkpuGDLen2kxsDlZ6H3sup6rIxjwex
         soLoOLolTWbAbOrV2AI/6LV8Ji3WzQ1MggBuE+Xgx4qgCuYMJ/GlzHvMc8+xC6qNUJ/W
         5jsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b59t+xSI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16si5310017qko.5.2021.09.19.19.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 19:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b59t+xSI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS9P6-0005Sg-GS
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 22:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iw-0005DK-Gs
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:14 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Iu-0008Fr-L1
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 22:45:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id t4so10114338plo.0
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 19:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=b59t+xSIgNEcDZu1q+PD3N4Lxi2N0VDrWDmYJ6T3JxH+8+sSykxh7as3gGkZ5tSXo/
 /hona2CR2Ecl8Pg3dh6TY2YfjGwPUv3NDWUDXX3/3baPw9hIlRwb59imAtzXyxO6W0ch
 0AMMdPzJ5u/WhVnLK/lMi6ip1PkaAM9fhAk3z6TefBbeiRMEh31vKHKRPaXcgIkANHJf
 +b9Clk6ncLvPicZo5LxJS3kKdv4HPnNyKcfuXnE2Z/Mf1am0VPVf9bIxytG7qP3mft80
 vvLCQgguUq5tv49qHxJMitnESN+bfNvCTfNHMf/VeFOEa0j0sQODWNY53vVIM9ta5KHj
 FZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=xAXIicPyu2UmOvdLiVEuzFh91+MJ+kmgrMWMIoMTuto3BZSMi/zObUvOwls27tLuKG
 XIHRXVUFR9Pxvi9jjmsHcCA5WsIM3kfFG16xmu8X0WzGUibGy4mughKtM5Eu5y8uZqn8
 y0nqeyI8b6cVk60IrCWer/tnjl2tr5NPL29Hl/7oApHHI109HeXOu3hy9J3Ct6fHi0Uy
 RCCcJ8a3NHC492Dd8OUAgNkTQEyyColwGk/qFemLjCiKO6n17weYTmtBQ8S2FkdHnb45
 ZFOoFd4D2MLtGylgdeC60ymhJWADxtbcajixe8bgaU9zqMjq7f27KtVc8OBkc2jmxJ4t
 jI9A==
X-Gm-Message-State: AOAM532kRLcwz3sAP0cbO5T4kZZij/x58YhC50qH7ro+/+Jyij+NXAr3
 GwVXP/hOVXgWhgemsu5HUZDOIf7qrCAkaQ==
X-Received: by 2002:a17:90a:19d8:: with SMTP id
 24mr26935696pjj.57.1632105909850; 
 Sun, 19 Sep 2021 19:45:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] target/arm: Suppress bp for exceptions with more
 priority
Date: Sun, 19 Sep 2021 19:45:03 -0700
Message-Id: <20210920024504.625965-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jo6GY7oBiv1

Both single-step and pc alignment faults have priority over
breakpoint exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2983e36dd3..32f3caec23 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -220,6 +220,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    target_ulong pc;
     int n;
 
     /*
@@ -231,6 +232,28 @@ bool arm_debug_check_breakpoint(CPUState *cs)
         return false;
     }
 
+    /*
+     * Single-step exceptions have priority over breakpoint exceptions.
+     * If single-step state is active-pending, suppress the bp.
+     */
+    if (arm_singlestep_active(env) && !(env->pstate & PSTATE_SS)) {
+        return false;
+    }
+
+    /*
+     * PC alignment faults have priority over breakpoint exceptions.
+     */
+    pc = is_a64(env) ? env->pc : env->regs[15];
+    if ((is_a64(env) || !env->thumb) && (pc & 3) != 0) {
+        return false;
+    }
+
+    /*
+     * Instruction aborts have priority over breakpoint exceptions.
+     * TODO: We would need to look up the page for PC and verify that
+     * it is present and executable.
+     */
+
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
-- 
2.25.1


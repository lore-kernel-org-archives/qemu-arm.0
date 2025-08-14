Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2258CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 12:59:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXX9-0001Er-IX; Thu, 14 Aug 2025 08:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXX5-0001Cb-NS
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXWz-00047h-6n
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-323266d6f57so1061906a91.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176284; x=1755781084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXFPXM3hA75ijMb6S6fD97bAchtn4q6g88SCdLIAfR0=;
 b=Cyiv/JhbyYXnYqB+otslFW/fp+tABskE7Q1m9T4hK0b2TnktsDEftrUyt9tnyWdvtX
 7EZmIgw7Zqt0U35j1oIgNQ3Rl+yHBIjVAd7dYLfFzsArfpU6k4yI/J5CY/AQx0Ygp5e3
 jZbkYsr257juH9y1tc7+NiXzJd2FWblpm8knhzJz77PSg3ZkDLQAgr3b04eG1QaUcrU+
 jouMig8Gn1faso4ro3ciX2qT18AZxbwEi9e4qbzbbgQxN9Ga7vraNNuRgpR+JM4HDWwp
 4T0iGXn3d/a4ncGl5E+RkWH0/pIj7yucRCdzbIxSTbXHAla3OZJhdGaM6rZRWZRL5/ca
 aYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176284; x=1755781084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXFPXM3hA75ijMb6S6fD97bAchtn4q6g88SCdLIAfR0=;
 b=MPpEQPuBtP4vh8DHSMu+kMJWNysYhz02EF+P4yJy0Jbjt7nEEOoPcq2XwMj6XdPUsP
 rjtpD8XnEP3s1a4yTY5x9XroQlCEKBXc4nvBftIyCVppXmE+JQJNuFNJA2+pchVTDkCS
 0TDQt80EKUoYEtGPXIh0C6/cf8m2D43UK4CkEwapgj5OQPrtP85+0V0CVvyp9CEWzzkr
 st9F780HjSeKhs+38fp2kHsXO64qZNYuItrdDgj6oirU/BoIwZwMocaznZ4Hws37NdCV
 Kn1huxE4KP6IP3/7oQes4sCZcG3QyBV0PrVAl8iWDf8Wy4VlbjP29+T/xCAG7MRJghSA
 3SUQ==
X-Gm-Message-State: AOJu0Yyr/DrmIO7zlrcay8O6Qm/3LBrPA4Iq+jbfZYK+xAj2cZei1SXp
 3LV1eqOu3SbvROL8+kgSElAK8KmIu7a0CXRz9hvA0yDYMMGY6FYt8LS/bHh+PsDAczM35crBmbw
 nOfsLh/U=
X-Gm-Gg: ASbGncvXGlVQZz+8K53qn4ab1qtXjE5BR9/7OcLC0G3BnDf08tCCWw7xkI/4Sr0OkQW
 scu2Bnn1pwM6spMyRKoNhbBAG7Kwrxn5m85fVcBCDQ5QsU52+Fnfs0inf93m08lX5zAYWqMsQkL
 26hWf8V8qW7UFtZqYfRb1VohZVAEw3kcy0rbR6lzkGqttREc3+YZndBtvzRVIe151otjwmtbYg6
 YeS3MRa5M4qM0FpY1NJqexFC+7aFrXYZGG7XgyUkHnaJglQliL6irS2OyqTu/n6O/e0hFEqvat/
 3PG9uVrQEXFbTWq1at+VWaqc9alM5ISwA3tqp9Qy/urvRVhOFMuIdLjaqypVFCJeE0/JYtS4EJn
 qLTnKFSqsXfudZ2gOrMwABFdWwdS0rxH0pojGxbUxPHKpSm4=
X-Google-Smtp-Source: AGHT+IFXACubsrmkv2hoTYG83FYMxnPYdCnxYQbJlHc46BjnMg5JwI97On6Ik9/1bhOJdQM5Wrtc8Q==
X-Received: by 2002:a17:90b:5627:b0:31f:b51:eef9 with SMTP id
 98e67ed59e1d1-32327c87748mr4967466a91.17.1755176284229; 
 Thu, 14 Aug 2025 05:58:04 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 01/85] linux-user/aarch64: Split out signal_for_exception
Date: Thu, 14 Aug 2025 22:56:28 +1000
Message-ID: <20250814125752.164107-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 84 ++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 37 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index fea43cefa6..85d455d018 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -27,11 +27,56 @@
 #include "target/arm/syndrome.h"
 #include "target/arm/cpu-features.h"
 
+/* Use the exception syndrome to map a cpu exception to a signal. */
+static void signal_for_exception(CPUARMState *env, vaddr addr)
+{
+    uint32_t syn = env->exception.syndrome;
+    int si_code, si_signo;
+
+    switch (syn_get_ec(syn)) {
+    case EC_DATAABORT:
+    case EC_INSNABORT:
+        /* Both EC have the same format for FSC, or close enough. */
+        switch (extract32(syn, 0, 6)) {
+        case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+            si_signo = TARGET_SIGSEGV;
+            si_code = TARGET_SEGV_MAPERR;
+            break;
+        case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+        case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+            si_signo = TARGET_SIGSEGV;
+            si_code = TARGET_SEGV_ACCERR;
+            break;
+        case 0x11: /* Synchronous Tag Check Fault */
+            si_signo = TARGET_SIGSEGV;
+            si_code = TARGET_SEGV_MTESERR;
+            break;
+        case 0x21: /* Alignment fault */
+            si_signo = TARGET_SIGBUS;
+            si_code = TARGET_BUS_ADRALN;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
+
+    case EC_PCALIGNMENT:
+        si_signo = TARGET_SIGBUS;
+        si_code = TARGET_BUS_ADRALN;
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    force_sig_fault(si_signo, si_code, addr);
+}
+
 /* AArch64 main loop */
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc, si_code, si_signo;
+    int trapnr;
     abi_long ret;
 
     for (;;) {
@@ -67,42 +112,7 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            ec = syn_get_ec(env->exception.syndrome);
-            switch (ec) {
-            case EC_DATAABORT:
-            case EC_INSNABORT:
-                /* Both EC have the same format for FSC, or close enough. */
-                fsc = extract32(env->exception.syndrome, 0, 6);
-                switch (fsc) {
-                case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                    si_signo = TARGET_SIGSEGV;
-                    si_code = TARGET_SEGV_MAPERR;
-                    break;
-                case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
-                case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                    si_signo = TARGET_SIGSEGV;
-                    si_code = TARGET_SEGV_ACCERR;
-                    break;
-                case 0x11: /* Synchronous Tag Check Fault */
-                    si_signo = TARGET_SIGSEGV;
-                    si_code = TARGET_SEGV_MTESERR;
-                    break;
-                case 0x21: /* Alignment fault */
-                    si_signo = TARGET_SIGBUS;
-                    si_code = TARGET_BUS_ADRALN;
-                    break;
-                default:
-                    g_assert_not_reached();
-                }
-                break;
-            case EC_PCALIGNMENT:
-                si_signo = TARGET_SIGBUS;
-                si_code = TARGET_BUS_ADRALN;
-                break;
-            default:
-                g_assert_not_reached();
-            }
-            force_sig_fault(si_signo, si_code, env->exception.vaddress);
+            signal_for_exception(env, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.43.0



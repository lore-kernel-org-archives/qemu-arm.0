Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528D6C87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 23:09:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufRXC-0002rs-Bf; Fri, 25 Jul 2025 19:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufRXA-0002qT-CC
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 19:09:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufRX8-0001oe-Na
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 19:09:00 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-235f9ea8d08so24967055ad.1
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753484937; x=1754089737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwS5enWBqWLAF6dbF1XYZSIiH0+6jDOiUSGG3x6eJCk=;
 b=XYLhxozxxLd8x9uj0fLeLfKfoUtc8dtxgGRgdIFMhsZ3J/xtAy/SQBVeiCQKn+s+HG
 sfjaKxRHeKGKY570hacUzhej/sLgRyVlLOEyE5m/rRJ6nSuCNqK4+z4g7WIDkep+Mbe7
 3vsXnYjyMQFaoU8+iQzYfoeG6DlUxtjLx16EzJ9WJ2iZs/bbQcmhJLxhWHQ4jQ/0gTvr
 lHYbf3Tsm7bz6rl8fhSvmvFwLG+gCjjdbXCIClvtbLoFkRAGQ+dAFoc7ToN2DJR2eixP
 0tomgKbJMjUfj8rWVnFU1TXNatlbY3KrYwCnjWuAQWv+syfqCHsOYhl3fkWQk3EV8re3
 ciCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753484937; x=1754089737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwS5enWBqWLAF6dbF1XYZSIiH0+6jDOiUSGG3x6eJCk=;
 b=uIksPfPzIURVl/f8HSMS1ayetgn7YPCUGEtvihIGmGsemt8nN6IdlCI4V4pJ3UHdYH
 jQGMRQjrr6Yh/mPB3i4EMcXKbytBYjR6ag2/tz2MlHneHRnz21M590C1RQPTFHgv4QXi
 lZbCUThYJqDlRThWUWipKaEZVibWLt50mif6BvKGyyXwgkKEFWKh8OM6fx3AMlxl2iYD
 sztWbD1CjHKPWA5qUEIaTTl1W70bPKtx4ydYohEEsM+Dhr/JVT/mzF0qMiemjAm208+M
 8HWl6Fmo0nou7ewHCwd+qL2vGTwvols8ZrhE70Ox3DCssBwsC1vRd1h4c9E+3gtJnb6V
 62Tg==
X-Gm-Message-State: AOJu0YwdRMvnQsCAHZodnsrlauXC2k+PJ1ESo7SoK2igLnPkZvuIh7A5
 AB9G9GICr+iiKT2du5Rc01ViNHfeC3HGSssLpcKQWd+Cw3+8RQgya/J9GvycsotyoNk=
X-Gm-Gg: ASbGnctghGZ2AaoENzM1IXNMCiNheLQubaIGIr7hvD/HJvbqMOxtyD3Royb0mEH2fhA
 S/xRtLcCDk8CnTMa4H7qZVVedpx1x12aJJ4M7yI99lctbjsjrFo47qOjmETvB3f3dKU8TZ30ZWx
 3+Ql1Fn02bBTboLlNaQFRHm/OKuIKorreWpMP7EGbu1ITFTdnnBkNP/Tq2PkoeUyyaOvSJR05Tl
 iS+7KofRU9KHpJO6NZboq3CKcHoIClKs41zrgaQWcSdzTp5IxoSKfaeSaNLhC01EMnjPkasIDQm
 p1Jhw72P3ZmbMOrjpGYqpgXBKqJn43q0+Cuyh5I5kMlgmL+XYaVHk7a+KK7jX1hgqWeJ2+SqjS4
 dJD4OcKpPmEnKyZ4U/XiV7jgdGdojRZXGSrS5aGLNe+lzckDlckxkpYvN2j50cDExDq4clAyIhU
 kpyuPljllnBfMsPQYxoHtK
X-Google-Smtp-Source: AGHT+IHzZg9Xatj5BxMqVD8nP1xF0HLa6TbnWyPZ+sAPC9nIj89ZWnTgMagW9M8kslh8ptHKwaLmAQ==
X-Received: by 2002:a17:902:f252:b0:234:ed31:fc94 with SMTP id
 d9443c01a7336-23fb30bb5edmr26394585ad.26.1753484937073; 
 Fri, 25 Jul 2025 16:08:57 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe545368sm5033375ad.172.2025.07.25.16.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 16:08:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 1/3] linux-user/aarch64: Split out signal_for_exception
Date: Fri, 25 Jul 2025 13:08:47 -1000
Message-ID: <20250725230849.13026-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725230849.13026-1-richard.henderson@linaro.org>
References: <20250725230849.13026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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



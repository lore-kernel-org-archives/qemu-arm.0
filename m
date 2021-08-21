Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp554944lfg;
        Sat, 21 Aug 2021 13:03:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdpNW7pq8xfv+GCQDKIiYsQ6LSjZ3MvHyjylIGP5PwiOMSI2l/j6qNyNFwVXX6ULY2uMqk
X-Received: by 2002:a92:c609:: with SMTP id p9mr1197649ilm.135.1629576237644;
        Sat, 21 Aug 2021 13:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576237; cv=none;
        d=google.com; s=arc-20160816;
        b=B7fkp+w+zKVrCp+b0POBX+EubVp17sxUks+AGju2LjeLzs5D5ZAPaszErxLCIqfZV5
         gMPKevt1OCX+XoK6UWgPj4B5lDQVu5kFaCy8sO+TO35FYa1HkIkPixBDPBBetzIEIrO/
         61h/EGAHvnXVjP2NerU/Gy6QnC+82xRUtq35CQQ9mvdoyIvcpGWJqOhTnfuS+/Cd8GA2
         wJcaILNyyWFaHnjJzPju5lvsxbDYXP1qp5+gtJCC8jCoo3qrXF6zuhuPiSWPNixxWcYJ
         5UM6x7kvUcW0sL680EYQehEC9R3P59wu3kT4XXQVFT576vMTpm/1StqkTx9Ap426+API
         4NKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nW9fMChnRBXVS7c8vZgjblWrAXidwfTLKIZtt2ybyaE=;
        b=U1VSavo0uy2KSFSMRSViunEjprRT7vjIbsEYZFUYDWPnzPoHdpWkxMmwNNsW/5A/yS
         pS+BPfyVVjCLutWqS2KRLRu+N33+ueODHfpSM5RCL9fEDymEMjnkcL1lHPUpjDaUpqj3
         1y5vMeoIhh86HrBVKkz7Ma+3b5sIYQvq0NfVlDI38ZAOPDehPTnMJkMckF+kbQ9sXhn8
         pRnpb+J99s4lVBy2bk80WKLwt2CSRjYc0MF0xau1/PM6PuF7FGfFXNljlIO0ZXA7xN0Q
         E/WroQdpnTS2d+wf7YfhwQQcgDb1EQt/C/wjRVYgx2lE3JVvREdeKaOgeLcH0ReLG18d
         qSwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/A6Bnyb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si11706250ilh.121.2021.08.21.13.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/A6Bnyb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXDh-0007ep-0Q
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9z-00029u-GQ
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9v-0004UL-KC
 for qemu-arm@nongnu.org; Sat, 21 Aug 2021 16:00:07 -0400
Received: by mail-pl1-x631.google.com with SMTP id a5so7880080plh.5
 for <qemu-arm@nongnu.org>; Sat, 21 Aug 2021 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nW9fMChnRBXVS7c8vZgjblWrAXidwfTLKIZtt2ybyaE=;
 b=N/A6BnybYHaEQ0iErEI5N9lHcQCR1qT0aUkfWVo35cgh9mNImUZNbfE6yQYSN3mL5X
 N2c97P5BfN4DqnKC+5ZKMcldTVoNDQaHLP6b/TFu9SDHZ2T7JxId4thCzOS/jPX8juwN
 P529i7ge1OTyybd2JThNWAz76YlmwIi5NTByU+gq/e9cvDdoXO4pxwvirHSj8FNJrnW0
 nJ7hkTrlhC0EW9zbiId+rEkmt7aGHu8M1eQRVzaPntCLbN1VKwFOV8B2nRU6r3ascUjr
 c7/GihWKYXGnB2P8Q6vsPzOChhtMA//pyfRkqMIqHnteeL/susz8Oi1EaGR6cmyJb7NP
 5ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nW9fMChnRBXVS7c8vZgjblWrAXidwfTLKIZtt2ybyaE=;
 b=RyLL6bJ8vEDw8c7U61SiBYvvt/+PUNyfRjJfSJPNCJd5embyyOn1fg8/vkwYEKHBQ6
 w9nT8osTBGntypqygIPzVJEzM5c6/o5R/rsv5Xl21Tc+brRMAhgmr0KtVl/CQqdM4GaR
 MvdP6eRSd2pcVbV8qgvCaKA0z6zmofAlxYYTiXjJblQVK/fP0XVwbVfgm3kpbDaM+Z21
 56/6Y/EsPPy2p30m6PfXuYwvQyDBRwuceEUg5HvhY6/IX989c3owC7Uayoke4h+MLfj0
 oQz6sboYRLDLrueVhKKnrl4KZ0vwfOFtTItc6KhSzCriC92ytfhBQk5U7ZOR3iNFOM1w
 cXUQ==
X-Gm-Message-State: AOAM530MWGIyAe/Lw1iaJNGgkO76crXECimrD6COjs8L3qlVCAYhH9FX
 TaET/FSW9liCf6LQoEatzhEHeaDH0XTYaw==
X-Received: by 2002:a17:90a:d814:: with SMTP id
 a20mr7933793pjv.130.1629576002369; 
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
Date: Sat, 21 Aug 2021 12:59:54 -0700
Message-Id: <20210821195958.41312-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
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
X-TUID: GYlgIQvPNYJC

Pull the fault information from where we placed it, in
arm_cpu_tlb_fill and arm_cpu_do_unaligned_access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Pulled out from the larger unaligned data patch set.
For short-form FSC, pc misalignment is reported in the same way.
---
 linux-user/arm/cpu_loop.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index d4b4f0c71f..5731d3c937 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -24,6 +24,7 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -279,8 +280,8 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    unsigned int n, insn;
+    int trapnr, si_signo, si_code;
+    unsigned int n, insn, ec, fsc;
     abi_ulong ret;
 
     for(;;) {
@@ -422,9 +423,37 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* XXX: check env->error_code */
-            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                            env->exception.vaddress);
+            /*
+             * For user-only we don't set TTBCR_EAE, so we always get
+             * short-form FSC, which then tells us to look at the FSR.
+             */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            assert(fsc == 0x3f);
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permision fault, level 1 */
+            case 0xf: /* Permision fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1


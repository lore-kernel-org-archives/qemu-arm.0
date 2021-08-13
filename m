Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp136543lfk;
        Fri, 13 Aug 2021 06:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykE8rbzemllywl16b2zBlv0paATmrwfiJQtAS7CuH3I+rln0a5y0NTf/Ebsxs0fAICwRC6
X-Received: by 2002:a05:6402:1385:: with SMTP id b5mr3072738edv.276.1628860923089;
        Fri, 13 Aug 2021 06:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628860923; cv=none;
        d=google.com; s=arc-20160816;
        b=hUlaLwo9kIDFuIe+zj8xP55N9gr1LNoCRnrQx/q20iBsm0j58Y04GYroaKEmNesgao
         +v2jXa/bFlAUY27nAQCoW13DozHaOsKX3E7gisQeeLLbxdhB2q9Grse0QTXSf9SRXrW1
         kEKLMseOoVNt/VlbyWEoN8AQn5Rn7wwCwexhhaqViSzSIFaJWMdJ3F+WExfDydMzt/ga
         bNiZ4Q9NNfPNtJs5FUrEZtZVqB8awVH80IEM6b/eSGAmmghuvcyRrrDEo1q+A/1D4QIA
         y+h5b++IeSM5bZZRZvZSbxPOtbd6gnEOHcvSL73mvWkDxnD/pDQBbM5Jx6403FeBisna
         zsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FaVpNm4zi8LBLF74GF2v06M6jAfCJGSvBMAfoKeKoug=;
        b=XVYuEvDbnJX1YrtrIsTHylxHaVwSTTpAvE5TUIYblaf0ZnBzns9CfsTMBaF6zTRlYB
         sZOxj1kYocIQLmrUIBZiEHkbYiSSXVqbWURLBuquO2EQbanqk9Q6repIGuEbFdDeKiGL
         2z6QCl5V7DM6l+BhW36K9H/ffo7cYincg5iecPmPY+h6ReW46tvyJ3loeFkFHWIdawgF
         vgTKxb/0mslCFjx87hH/FCa3XIUVLOCcDXxB54ALJrVRCQKpyzSR/V4YTxFsVqZG7w2V
         i4Zh8H9WRdsedmvj5cIYuSVwh0h1MkQyXX/N3OFeTLCg8UcSVsYGFSRNlRbEJDwOapYP
         nHXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOaLi687;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si1733558eds.344.2021.08.13.06.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 06:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VOaLi687;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEX8M-0004Hc-2C
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 09:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4o-00063b-AN
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4k-0001Bi-JL
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:22 -0400
Received: by mail-wr1-x430.google.com with SMTP id b13so13290853wrs.3
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaVpNm4zi8LBLF74GF2v06M6jAfCJGSvBMAfoKeKoug=;
 b=VOaLi687fL6Is7ILAK3PKrUw3xskbJEMqf2kZdrf1Gr08zJIzt4R+rkRJtYjplg26g
 u2MK7poz6mnWwSRliLVouV2CblX5gFGKwrCYDxpYBfgWYDwu/t101sYG72Tpw3ZSPW0A
 6HsXDsXxN/ERbko1IqZ+7LMerfw2jbnMgfBevG7EOhGAp7YkkNK/qYYfYSeiVJFDzRxL
 u0FcgX7DiA3SwTyfXqKwJvkp2KF6To9jbpUq4EKPUtQTd4bx1LewVIg3S9V2X/Y63OwU
 exf/hLuKkgDE3DmsWkVfOyQV195mcBJi14D5oZgpPklYj/ysOoNbcbVwYMkiFf0O/yC2
 OjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaVpNm4zi8LBLF74GF2v06M6jAfCJGSvBMAfoKeKoug=;
 b=pBKm6M0CHVQe7cUqzGIYM4bJV89wvFZl1fewmsHYngdYbDErvv0tWw7xV6flVy5Fye
 hRx7xzXtgFv6fcidChkzOutieY1HxONkyr05QoIrlvnR/0qeKKb+L95a8thMYL9LDx64
 D91X6PueZtkcRrexkhiOMMZyPYleFvGLuqqC4SvgmsS0Ssre1CY4lEJggAONyXYL3+Un
 9TsQwV/fT6z2zg6J+prlgYco9lKfIniThcR5l9oB0MeziONLlTZP2Oc0dIj8F6Lav/4s
 c31DzuC2I/IUX1m4lEj2GLKB4xD54/iwaHcNWzjn6vyhiQ1Fw4POGK/dd9ChVSPDXw8U
 60UQ==
X-Gm-Message-State: AOAM531Mlhp9iMPX2Oe56SWxik+qP3FP1Z3x/RGJeYjQWJi3gVug59Ck
 9ToGW+Y/F5FPDPX/T+zd+SS75iT+TFOq/g==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr3151012wrr.92.1628860697168; 
 Fri, 13 Aug 2021 06:18:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 7/7] linux-user/aarch64: Use force_sig_fault()
Date: Fri, 13 Aug 2021 14:18:09 +0100
Message-Id: <20210813131809.28655-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fo58eExteoJ+

Use the new force_sig_fault() function instead of setting up
a target_siginfo_t and calling queue_signal().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5d8675944d9..11e34cb1007 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
 #include "qemu/guest-random.h"
 #include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
@@ -77,9 +78,8 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc;
+    int trapnr, ec, fsc, si_code;
     abi_long ret;
-    target_siginfo_t info;
 
     for (;;) {
         cpu_exec_start(cs);
@@ -108,18 +108,10 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = env->exception.vaddress;
-
             /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
             assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
@@ -128,28 +120,24 @@ void cpu_loop(CPUARMState *env)
             fsc = extract32(env->exception.syndrome, 0, 6);
             switch (fsc) {
             case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                info.si_code = TARGET_SEGV_MAPERR;
+                si_code = TARGET_SEGV_MAPERR;
                 break;
             case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                info.si_code = TARGET_SEGV_ACCERR;
+                si_code = TARGET_SEGV_ACCERR;
                 break;
             case 0x11: /* Synchronous Tag Check Fault */
-                info.si_code = TARGET_SEGV_MTESERR;
+                si_code = TARGET_SEGV_MTESERR;
                 break;
             default:
                 g_assert_not_reached();
             }
 
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_SEMIHOST:
             env->xregs[0] = do_common_semihosting(cs);
@@ -169,11 +157,7 @@ void cpu_loop(CPUARMState *env)
         /* Check for MTE asynchronous faults */
         if (unlikely(env->cp15.tfsr_el[0])) {
             env->cp15.tfsr_el[0] = 0;
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info._sifields._sigfault._addr = 0;
-            info.si_code = TARGET_SEGV_MTEAERR;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MTEAERR, 0);
         }
 
         process_pending_signals(env);
-- 
2.20.1


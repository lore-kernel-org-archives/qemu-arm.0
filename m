Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp554394lfg;
        Sat, 21 Aug 2021 13:02:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPtYFXstIKUqTgscE/zT29vEB3YFrwMpz/9MVwDNOHaG9DtK+GEM4k1IQSJ2tioWOVDFms
X-Received: by 2002:a05:6638:3048:: with SMTP id u8mr22948062jak.91.1629576178721;
        Sat, 21 Aug 2021 13:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576178; cv=none;
        d=google.com; s=arc-20160816;
        b=cBXF7mSp5ri/w6aFa5xaqqvcLl4bsZDthhXP2L60HKH+T79AVGgFntcNs3bJLqEgJ5
         pr++lvdiQULVcHhEBSaIWSFx+Hlqh/vO0W6XDCoom+t5ZdCFcA0pWJHhmGFs7g7YYWKs
         dVIpb9/S8H7bvn3j5av0tGgCP+WRGRL0NkmOdZhIsO1ZRY3AnwA4OzTuaWeplyMNVAHB
         c2TgP8n5Zn6b0Z27wVeZomX5Jk0JOWEW8pLwuErH8yzoFdi3RWAi1gqCJXzqV9d7SFXS
         4NbE8X8AtYR5jdxKCEBVIWTT4DtmFlNMWQxKVHC4Tlc2gT2ip5Hu3vuaqf1hhtsh0z0R
         +MzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S3Ic6iGbb2NTPoozAwoc6s7WItVnl35pmUzWVFyhl0M=;
        b=W4YRc5rY7HI44L+jxUEk9gmSNSCHHHvMTlUIJOMdTLkjHKgEwcSF4HlyEdI8l6GFj/
         opc1ILq6/MBacHkp7O5u0sdQR6EKHFBoQY4UOOWQzcrblkfzSAZoKGHHWKivY+fQiNEq
         bL22BuzOHVOUoWrA/JPWqCjVHn3IR+kJ0H2yh3a85BiIZ4KFUYe3cXL31WtGPYq1L9kY
         e5qE0gyww0EKzAWWJoq8ngo1b5UsyaJliY+CZPZXuBKtmmSHartGx3fii9az0bWoHJSy
         Bn1l87KI/AS2F8u6o7W0xqUcixgKgj30PkExgKA5sau6DnVN0/QEqaVxw4ibxsS+IqXu
         jmxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v16q45jb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si3886168ill.70.2021.08.21.13.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:02:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v16q45jb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXCg-0005OR-KM
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-00028E-U8
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9v-0004Te-4P
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m26so11717912pff.3
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S3Ic6iGbb2NTPoozAwoc6s7WItVnl35pmUzWVFyhl0M=;
 b=v16q45jbY0Bm/F9kON0YGyVoryrkJwCvBW2A/deLNRcp1d22BKL4IYCTzBd59Xn7zJ
 0AaQXu87hv6aB67MJRVJNdf+kBpZtgsvMSvgMfPPuH6d6YPFYhfFtV0flPWgwFPDDV7x
 bBtiz8GWUCoL9f+xRTCPqe54KD5ln6LJn8JQBYTS8dIj30lJfoM2r3dB9mgn43WDgtmK
 Tl78iBelCV5fGKRwU5F76zie1xjwfEjqfCUxYu2lPXxpNabf6qt3wutqO1Z6lMmOf0sw
 /yPQ/87BXX8mM4vRM8Xjk0ENLTCGH2ezQVvK0Uog+dW8MnamJcFH2Al31pCl0KpNjShj
 bBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S3Ic6iGbb2NTPoozAwoc6s7WItVnl35pmUzWVFyhl0M=;
 b=LDHWHgvW+fEg7OWRCJxNIcDlhZF/2s2xQqRdzeM9UF3YY83LnUzGvDnDm2U1N3uJZx
 EvzPBoysX0RaUUx+8MI1lY1cz3boMgwSmhAr5ez/xUwnYTtz+6yIG557X/Isueqp91DW
 sFhY9jzL3LH2xsQAE7ZH6hi5msxMUgvBHN3PqRbE6I5PHoxNEcg9DJm+UM41I0kOBnSI
 yqFmv5oAM5Of674WNTeLqXIP6qDMe2Q2I1fwN8guqoCSni6U7qe+CD0vbkd8HblMj0BK
 jChXkUTZqHMyUy01/BZcxPBeBF8Dh/srqm691ndWtYgllyasOsQ7umBG4YYKeDgLg+L7
 1aXA==
X-Gm-Message-State: AOAM533JH/Ff92+nMCLWuJGVw5kGG2xVHzWFhCXHBy3h+aSleCZcJ228
 TtMX+STSo4Ksmd4M8H9IrMz0CFLTKUkPeg==
X-Received: by 2002:a62:9288:0:b0:3e1:c44f:a1b7 with SMTP id
 o130-20020a629288000000b003e1c44fa1b7mr26538632pfd.63.1629576001839; 
 Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] linux-user/aarch64: Handle EC_PCALIGNMENT
Date: Sat, 21 Aug 2021 12:59:53 -0700
Message-Id: <20210821195958.41312-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KznWZ6Vc2m2T

This will shortly be raised for execution with a misaligned pc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 11e34cb100..6e03afb2bd 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -78,7 +78,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr, ec, fsc, si_code;
+    int trapnr, ec, fsc, si_sig, si_code;
     abi_long ret;
 
     for (;;) {
@@ -112,28 +112,38 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
             ec = syn_get_ec(env->exception.syndrome);
-            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
-
-            /* Both EC have the same format for FSC, or close enough. */
-            fsc = extract32(env->exception.syndrome, 0, 6);
-            switch (fsc) {
-            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
-                si_code = TARGET_SEGV_MAPERR;
+            switch (ec) {
+            case EC_DATAABORT:
+            case EC_INSNABORT:
+                /* Both EC have the same format for FSC, or close enough. */
+                fsc = extract32(env->exception.syndrome, 0, 6);
+                switch (fsc) {
+                case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MAPERR;
+                    break;
+                case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+                case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_ACCERR;
+                    break;
+                case 0x11: /* Synchronous Tag Check Fault */
+                    si_sig = TARGET_SIGSEGV;
+                    si_code = TARGET_SEGV_MTESERR;
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
                 break;
-            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
-            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
-                si_code = TARGET_SEGV_ACCERR;
-                break;
-            case 0x11: /* Synchronous Tag Check Fault */
-                si_code = TARGET_SEGV_MTESERR;
+            case EC_PCALIGNMENT:
+                si_sig = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
                 break;
             default:
                 g_assert_not_reached();
             }
-
-            force_sig_fault(TARGET_SIGSEGV, si_code, env->exception.vaddress);
+            force_sig_fault(si_sig, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1


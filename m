Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp757628njc;
        Tue, 25 Jun 2024 12:19:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+V3Nbg/uHtc+p3puOF6MtyKVbe7bUGJWx7lLZX7sX5/MsfLoAhciz5V/gtEHLmlSNjy+f9FEh4BnzAmvyQAlTiTf3Gwdr
X-Google-Smtp-Source: AGHT+IEoZAmb3L5zZltHqKWJe9PaCzsYsoKmezgQCCxbiFMFHKAyMTgwJmaiLTvTbZtsAtDWMzG1
X-Received: by 2002:a05:6870:b254:b0:25b:7c67:64bf with SMTP id 586e51a60fabf-25d06cb7710mr8671661fac.27.1719343140366;
        Tue, 25 Jun 2024 12:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719343140; cv=none;
        d=google.com; s=arc-20160816;
        b=AHHUCT1AX3/rCqPJ+8bgvfVmZinkRmufmcbB6ehXRrML2qVmc64GbDNrcVfSKklLzl
         0CIpvSskSs95VA2ui5tlOmQ5sP/kIdFyHRsK+9NAaenWUBoRqSy1buQCUpsBWhZRxL/8
         3wi1jIR43VcoClK20mqmFDPB2xYXDr5ieYLvfh4P2RibpJoj9+pLn6+0kL+NQOKEA18Z
         XNDFstRf43eNpDKaiCUUNDF77GykKEB/yESfta1y6Kh/1LKbDLZtN3ItkYuz9vfT4Fd0
         iMw8ALBxTKE5K0KPQ0Cy+k0cU2qyDkuxdZxSS8vt95Udd+qIcJBwXbT+76tRxt7/b4+S
         QZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SkIsJKtZUJAkO/lpIvhYyVEDLS6NoChogP/TAxQnzSI=;
        fh=ZcJeIuJ0l6vALYCr1DZMZXnfBb1Sl86FXIV/sEmtGxc=;
        b=v1qsnTipz+BdDg2mnHE1kT8W8AiKfF8tQ0vUOhWo4eA0+z7YNzZkJMakxhhdBXj+37
         ke/+TiX862LVX+bKmMxT68aEKkbrH9h6EU5QEiBr0H3g5gnsAVuL0kdwWNvJD430UhKy
         X5TAXpk0xmAfvti59bcyiKyYgf0Ae4OjGwvd9NNb4SIllelQZd9GCFR3jDMwwGVvaMt5
         rkGmj0o+fYE8dqlmabo+AlI7LIDoYbXa9XzbqSMkIRfRuva56nAR80RXnrFGp6DkYH6X
         7QjnoQr025IdVMsbecf33RMpu7fQ0KP62iwmOt8t50skh4u2mAZq2Ya/i6TY4yXluJC6
         8Feg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o6dJeh8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9411c4si1208814985a.617.2024.06.25.12.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 12:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o6dJeh8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMBeE-0001yz-7o; Tue, 25 Jun 2024 15:16:49 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMBWI-0008Nw-7F
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 15:08:22 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMBVF-00012L-P4
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 15:07:38 -0400
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-445033fbc24so1812281cf.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 12:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719342306; x=1719947106; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkIsJKtZUJAkO/lpIvhYyVEDLS6NoChogP/TAxQnzSI=;
 b=o6dJeh8sDYhBOYftwRACWbnvHQ4wDjEsHZGLz/g9H+d77C/nk7mMCAWwH+6L3T/ykl
 x7C9oJVpx/2L9jjEUXaK7QpmrENfCIV3GvKFm4whNPO2+D1Tc+67bg+badQ6NXhyms1s
 BcVJuQ7GzNSxQOLyJ9bOV7E+eaAdlp/b50rAJJ4R6Pz3N3/asK7JgiBopquDNpHo7R1b
 05G7Hmn/pgH+KwuGjt8L4L2aZvfciPXJHK/YL7dlakuTRBE6SIYMRdRlnBqJgYDm1bQl
 jsVmme9I1mfEsFK6a9X+zQ6qQ2lrqQHfYK9LBcluVViBShWvubWok4zxyKGJ6wffTKzp
 2g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719342306; x=1719947106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SkIsJKtZUJAkO/lpIvhYyVEDLS6NoChogP/TAxQnzSI=;
 b=Vs9yfDTebz50OitL9KrzNLgxHi8DyTx3Hvf3sdiZmbtTsWXfh47APyCydis/8XkXgf
 EwW02O12c2n4yqQyV9+60S8/MpWc9CWi18eDAa1hVEwX+G56OC+jEF7DqEn4qtkbgYAp
 zjJpRtJnBgNW7gWWOE2377O1KbOAJ5NotzeKLf3f3gqCI0/Wup0e/azEWfgXcHXITqZY
 Z1qdY5f9CoeNoT4e/Bwllyx6vHZesXakrfGR+VQjnRiaFEiNJInRgpEgdJcEtnoKc4Kh
 cLa42dQX4lOrW9MQLa6e3RBuuICu4QVqRWkRTNTvYZ81FN79Jgc6qTSO/dW2GqaeeIpH
 0cbA==
X-Gm-Message-State: AOJu0Yy4Wh6SWqMf3+sEfUiIhHxW4sXgikDbZutS9npfD9pmSuz//Sxx
 qC3UD/MfgNF+R5NT0uLxQYhT+FIzhbZVDGPuGfeMbmrBFaey163ZhAxl+8HRK4+lqtdWK5+g/tG
 S
X-Received: by 2002:a17:902:c40e:b0:1fa:2568:5895 with SMTP id
 d9443c01a7336-1fa256858femr93716095ad.63.1719340540561; 
 Tue, 25 Jun 2024 11:35:40 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/13] target/arm: Fix FJCVTZS vs flush-to-zero
Date: Tue, 25 Jun 2024 11:35:26 -0700
Message-Id: <20240625183536.1672454-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: EUoenPDs5ewT

Input denormals cause the Javascript inexact bit
(output to Z) to be set.

Cc: qemu-stable@nongnu.org
Fixes: 6c1f6f2733a ("target/arm: Implement ARMv8.3-JSConv")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2375
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c           | 18 +++++++++---------
 tests/tcg/aarch64/test-2375.c     | 21 +++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  3 ++-
 3 files changed, 32 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/aarch64/test-2375.c

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index ce26b8a71a..50d7042fa9 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1091,8 +1091,8 @@ const FloatRoundMode arm_rmode_to_sf_map[] = {
 uint64_t HELPER(fjcvtzs)(float64 value, void *vstatus)
 {
     float_status *status = vstatus;
-    uint32_t inexact, frac;
-    uint32_t e_old, e_new;
+    uint32_t frac, e_old, e_new;
+    bool inexact;
 
     e_old = get_float_exception_flags(status);
     set_float_exception_flags(0, status);
@@ -1100,13 +1100,13 @@ uint64_t HELPER(fjcvtzs)(float64 value, void *vstatus)
     e_new = get_float_exception_flags(status);
     set_float_exception_flags(e_old | e_new, status);
 
-    if (value == float64_chs(float64_zero)) {
-        /* While not inexact for IEEE FP, -0.0 is inexact for JavaScript. */
-        inexact = 1;
-    } else {
-        /* Normal inexact or overflow or NaN */
-        inexact = e_new & (float_flag_inexact | float_flag_invalid);
-    }
+    /* Normal inexact, denormal with flush-to-zero, or overflow or NaN */
+    inexact = e_new & (float_flag_inexact |
+                       float_flag_input_denormal |
+                       float_flag_invalid);
+
+    /* While not inexact for IEEE FP, -0.0 is inexact for JavaScript. */
+    inexact |= value == float64_chs(float64_zero);
 
     /* Pack the result and the env->ZF representation of Z together.  */
     return deposit64(frac, 32, 32, inexact);
diff --git a/tests/tcg/aarch64/test-2375.c b/tests/tcg/aarch64/test-2375.c
new file mode 100644
index 0000000000..163eba422b
--- /dev/null
+++ b/tests/tcg/aarch64/test-2375.c
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (c) 2024 Linaro Ltd */
+/* See https://gitlab.com/qemu-project/qemu/-/issues/2375 */
+
+#include <assert.h>
+
+int main(void)
+{
+   int r, z;
+
+   asm("msr fpcr, %2\n\t"
+       "fjcvtzs %w0, %d3\n\t"
+       "cset %1, eq"
+       : "=r"(r), "=r"(z)
+       : "r"(0x01000000L),	/* FZ = 1 */
+         "w"(0xfcff00L));       /* denormal */
+
+    assert(r == 0);
+    assert(z == 0);
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 70d728ae9a..4ecbca6a41 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -41,8 +41,9 @@ endif
 
 # Pauth Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
-AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
+AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5 test-2375
 pauth-%: CFLAGS += -march=armv8.3-a
+test-2375: CFLAGS += -march=armv8.3-a
 run-pauth-1: QEMU_OPTS += -cpu max
 run-pauth-2: QEMU_OPTS += -cpu max
 # Choose a cpu with FEAT_Pauth but without FEAT_FPAC for pauth-[45].
-- 
2.34.1


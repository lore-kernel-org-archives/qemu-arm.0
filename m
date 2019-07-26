Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207371wrv;
        Fri, 26 Jul 2019 10:51:20 -0700 (PDT)
X-Received: by 2002:a63:5d45:: with SMTP id o5mr93791883pgm.40.1564163480662;
        Fri, 26 Jul 2019 10:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163480; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8yjonDE2gJdaCxyPf31c67QtQI5dW4/vLImI4EcbbrWTmtKKhmkLJl/3c7fD3JEA6
         PTKl3un1b661V3xKqx6GcmFa0TTVnV12mYTdKgTXVWS+D8hvCo7hZN632EYXllb1w+9x
         a1WNww2PISGv37JUseRibmTaCdmJA6tOo22fDmtXP6E+y7W864E8o40PNrjLvYkI8aiJ
         DxlP/NKPUESeJCSfmd9Z8bZ+VEHXL9TIUdjTTX9KKMFHhomdRvASS3v+Zk2IeB3mEeZf
         u7KMCiluyOX3oLLEewwTL3j1w7oTeN2Q1/18h+vFlyGSRjFOjkK5Xv7Ohi5jdpVoGNgl
         ziog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Nxa/cuCHMs3HeU9P7ofD/RBscm9ah4Tq+3WaXVFVTi8=;
        b=iKNZsjGAd0QG7az9HfGKBpxIjQGK/LDEI/4cQggEEFODlCUGgqGvqhd/hQxmwRmmgQ
         ch4NYlrnBO46IKtQurjchURVG1Iuk7utsyOI7+OKFtCXr5iShBzcRI5nFw/inwnv43Cc
         maQJODX1Z5+Srz1zODFuRhNov4LJ3DGWScYEOPS7X2K8f1QwsuC7K3iD6hF7XnTN5Vz2
         hBUKGeCXCGhwKJseYM5YsxOh9ncVKEUqkGuSrmeiRMT/L7IRVh7L4ZR67U+RqK9T+gB6
         mltoA7F0zc0jg3RoX7wEqm7BAANBQc/jWsUPrUiBGEeJpnzOwNniNWSNpjvB8ApL6Nro
         ESkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khOm4Ns3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y7sor65901456pjv.3.2019.07.26.10.51.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=khOm4Ns3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Nxa/cuCHMs3HeU9P7ofD/RBscm9ah4Tq+3WaXVFVTi8=;
        b=khOm4Ns3aOhzviXJxUgm0+U2fW4iOx0h/eq74+vKDGl0DyGQuc4eDWoSE4OzDkBOhs
         xvQkkAtF7ajTyt1lFY9jhcACRUSCCCDesn7Z8XZRKDVbT9u2Bu0vxFscV8ZP9pW5KEMG
         l9h6BJYyqh2qF5Ja1rZSe2610pr8qQ9XFeIevU4Uct4VWbPIGWM9sz0+H7EjRqxpUf9D
         9KGs23yt1JJ0Rh6hbhxoJtd06zf8yR6wBM0l8NwGyQFAbDARrKuJ+FgNXa8QOy0ShCPb
         2DX392DuNA0ktSa9h9kw5BboG6n04lCwB5hg6IH0q5eXUe3Ku8N2fwgGZMd+N3pVhJiP
         IlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Nxa/cuCHMs3HeU9P7ofD/RBscm9ah4Tq+3WaXVFVTi8=;
        b=BYun156czrl6GHMSLAEMC4uGbwG8yPabv2vlXXej8V0avFYCjw+qAjO7noix1uWQjK
         y3huPWUBw+v9diwU0+CsAu2xcWGO7MW28tN47uHgdnCE2lobO1t1okMg5+Eci6V7R9bg
         VdDYYbioyuSpu5wOWUwbFSTuIa6hoZ/o+uTeQA3wlFhO/M6jgETe2KZ58HrdsTJqL5Bm
         ypAejdIXuCF2EnoL1ivTHsqImMhQ7cC9O9nMu7VBdhAiLRJJnZYJcq2y1AA498NeeUNV
         3QLtgE5Zybc3JSaYsEJgkakOEntY6+C/T6B+cxbHAtrokG+s0sT8XVCGWUP+3Cy2pvGL
         4G0g==
X-Gm-Message-State: APjAAAUKGKcduktoKl8jLWTeJoaXFYw0ejK7MQc5Td9M23wNg/BQMwiF
	AtpQtWS3DMWo+/N1RPuPx0sCUoex
X-Google-Smtp-Source: APXvYqxmpZEOEVxwMHsB/etbw9ZUfDwVt4F+lzPC5QwCv/B4ZUmGVqr0wgHFFcg1lidqt/3aTunSCQ==
X-Received: by 2002:a17:90a:ac11:: with SMTP id o17mr100549798pjq.134.1564163480128;
        Fri, 26 Jul 2019 10:51:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 39/67] target/arm: Convert SG
Date: Fri, 26 Jul 2019 10:50:04 -0700
Message-Id: <20190726175032.6769-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: ++N+eDczpoC5

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++++++++++++++++++++++++------------------
 target/arm/t32.decode  |  5 ++++-
 2 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9c6623fb6b..df515e9341 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8497,6 +8497,34 @@ static bool trans_SMC(DisasContext *s, arg_SMC *a)
     return true;
 }
 
+static bool trans_SG(DisasContext *s, arg_SG *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_M) ||
+        !arm_dc_feature(s, ARM_FEATURE_V8)) {
+        return false;
+    }
+    /*
+     * SG (v8M only)
+     * The bulk of the behaviour for this instruction is implemented
+     * in v7m_handle_execute_nsc(), which deals with the insn when
+     * it is executed by a CPU in non-secure state from memory
+     * which is Secure & NonSecure-Callable.
+     * Here we only need to handle the remaining cases:
+     *  * in NS memory (including the "security extension not
+     *    implemented" case) : NOP
+     *  * in S memory but CPU already secure (clear IT bits)
+     * We know that the attribute for the memory this insn is
+     * in must match the current CPU state, because otherwise
+     * get_phys_addr_pmsav8 would have generated an exception.
+     */
+    if (s->v8m_secure) {
+        /* Like the IT insn, we don't need to generate any code */
+        s->condexec_cond = 0;
+        s->condexec_mask = 0;
+    }
+    return true;
+}
+
 /*
  * Load/store register index
  */
@@ -10445,28 +10473,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
              * - load/store doubleword, load/store exclusive, ldacq/strel,
              *   table branch, TT.
              */
-            if (insn == 0xe97fe97f && arm_dc_feature(s, ARM_FEATURE_M) &&
-                arm_dc_feature(s, ARM_FEATURE_V8)) {
-                /* 0b1110_1001_0111_1111_1110_1001_0111_111
-                 *  - SG (v8M only)
-                 * The bulk of the behaviour for this instruction is implemented
-                 * in v7m_handle_execute_nsc(), which deals with the insn when
-                 * it is executed by a CPU in non-secure state from memory
-                 * which is Secure & NonSecure-Callable.
-                 * Here we only need to handle the remaining cases:
-                 *  * in NS memory (including the "security extension not
-                 *    implemented" case) : NOP
-                 *  * in S memory but CPU already secure (clear IT bits)
-                 * We know that the attribute for the memory this insn is
-                 * in must match the current CPU state, because otherwise
-                 * get_phys_addr_pmsav8 would have generated an exception.
-                 */
-                if (s->v8m_secure) {
-                    /* Like the IT insn, we don't need to generate any code */
-                    s->condexec_cond = 0;
-                    s->condexec_mask = 0;
-                }
-            } else if (insn & 0x01200000) {
+            if (insn & 0x01200000) {
                 /* load/store dual, in decodetree */
                 goto illegal_op;
             } else if ((insn & (1 << 23)) == 0) {
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 17e6dae688..c0b962479b 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -485,7 +485,10 @@ STRD_ri_t32      1110 1001 .100 .... .... .... ........    @ldstd_ri8 w=0 p=1
 LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
-LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+{
+  SG             1110 1001 0111 1111 1110 1001 01111111
+  LDRD_ri_t32    1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
+}
 
 # Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
-- 
2.17.1

Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp117739njb;
        Tue, 9 Jul 2024 20:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHklHBkRHaTugf3FoU3BYDzUiciItU0ykDIpw/hIN6KCZ9RgJxQMAZfMTI4b5W2tDufsoHxrwoIt3YPdd2gSB9sOrMYyCK
X-Google-Smtp-Source: AGHT+IGNFCqh5fFXRRbWY5E96K57Y6ahxIaF2flASKFKbXYOY0zpPklVoIH12pndEwY+o1mGto3h
X-Received: by 2002:a05:620a:1376:b0:79c:103b:af44 with SMTP id af79cd13be357-79f19c07e95mr425859485a.65.1720582175887;
        Tue, 09 Jul 2024 20:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582175; cv=none;
        d=google.com; s=arc-20160816;
        b=kOWPHIU6I8suHsDX1XUXLhU3xC2J46wa4+MiRxqu1VGCmbaP7Yj/uq29/ErCNUGeH5
         toQShJMK508YwdsLNDEScRUo3TRXfYKhnvV/r+UUweSDEjcj9WIsc7aBQXPyLnTQ/jPv
         L3mlPsArdhxdfG4I0E+QQNTaQDZXPKAzeA3CRPzSWDt5M7NFbJm9RLpoXlytXJL3F/UK
         p8sbd+CqsX2o+52NjWktak1Z+QLvOHeenn0gkGaO8zYcEtUu2ae0CfsilwRpv4FQ3w7C
         ULd8UN6OcIBi3vUB5w6OIhfP5Vc3FzN3lHhpQBrFRb2UAdC4DM5gulRAqixxN9HwScye
         33Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/jbXp+ktkX7+TZy4xaNziEFN/kKK08frm4LETYQOrf8=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=Q32/KArdN6+maFis1xV7pc4W9X58vuJBULhZGP1l9XJ+Y2AzJv+pAnTvBm8B86I0oP
         LgBrIgxJ1io/BahFHdYjt7OyiBks7nEf7J0me944ZDkJWqRLUVC7/l0naS11FAxtRIO7
         +6LdHYvWQqCXhhKgryFaUeRfgQl7jvfmi7GENasK7fxCfJnDa5eXeucQY2NS2XrkXGDQ
         2gT0rnzV54mPSJ2ivMDZQ5cfvdaD3LHfE/LUoAI8LZRfzvLaDhjowWKxmATkvTA0fuKB
         f1ykg5WwPWHowG4I4tdpT+u+NRP7fxb6kqp1fKmJLSCF9NNwj9yRi6aJP/XvacS8EMYN
         168A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KR2kA/WF";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c1ba7fsi41557481cf.758.2024.07.09.20.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:29:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KR2kA/WF";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRO0S-0000Q9-Bi; Tue, 09 Jul 2024 23:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0R-0000Jz-2q
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 23:28:35 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0G-0003lE-Tu
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 23:28:34 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-70448cae1e0so233437a34.3
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 20:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582102; x=1721186902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jbXp+ktkX7+TZy4xaNziEFN/kKK08frm4LETYQOrf8=;
 b=KR2kA/WF5tqWitx/+XeXRxgxgehrHoLEAJzDmvnv0E1aLxFD9wVS/InXW7I5wiY128
 UO2IuEYc1Bev3rBBgkMwhkofk/5LM429h1yikY9SJlQDibNgACyBGOof8dPWDRT4XOlH
 C0zBelcGyHDZIQgRs9NeHon+WySszWgCFq/dA8gjkbFeMQiAGbw8c09dX+Nw4ox2C+ZB
 x3gBRzTPlkUCnIM/ir9rrDrHhL8TAkLpHTEM0eqHU3jBYGXdvoYSI+9oRr9L1f6yRWuY
 rWvpT/bYyw2fwud5EaH6IoqD12ZFASec6woJ/z4mvp1dwFUV0vi3SJGRS+NZVCKLVX9Y
 XEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582102; x=1721186902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jbXp+ktkX7+TZy4xaNziEFN/kKK08frm4LETYQOrf8=;
 b=fbub/uSz6yRBe548mFTHYc6vQigL7tK5HXNkVxzbrJarZAP+w8v3zzY5tX3h4JY1Qd
 TUKbiL2ZngXAuVlSmWhWqF96iYPU/yfTOVVgFENNtXY1bEJ7g+7lD/lp6Q93SSNvwILb
 t5BdCJChwh1pPtAGBsYac9TQsIMZlAbD+4QUhGA+BgfQ4iWVHdpTxhr029rhriOVUGiL
 xQjPuQNAIMPPMzkhmp4BRdBj6nBhj0gRzD9hoQmdUhttLWf+zhr5mR5UtMDzu3f3LPQ8
 3AanK219zTRtTn8JKWAKKnW/8Mu0/D5t+rY+3bLystzwURTbFIqzTQNerkxCZUkLNZ4d
 P4fw==
X-Gm-Message-State: AOJu0YxB/FElvBB/6dlFx5lmNAoplIw0zTwViMjF5/YjTtyY3M+Q7yg2
 /Qj8FqWNFpijPxvBriFRy0zvhvQn/AFgo3o3jewqWpXJDB7gFWTW0+XSdl0CpBZnoYjIbMgfFgb
 iAz4=
X-Received: by 2002:a05:6830:1e75:b0:703:7775:c0cb with SMTP id
 46e09a7af769-7037775c2c7mr4193125a34.31.1720582102257; 
 Tue, 09 Jul 2024 20:28:22 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 06/13] target/ppc: Hoist dcbz_size out of dcbz_common
Date: Tue,  9 Jul 2024 20:28:07 -0700
Message-ID: <20240710032814.104643-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8ohw1KySYfn/

The 970 logic does not apply to dcbzep, which is an e500 insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mem_helper.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 361fd72226..5067919ff8 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -271,22 +271,12 @@ void helper_stsw(CPUPPCState *env, target_ulong addr, uint32_t nb,
 }
 
 static void dcbz_common(CPUPPCState *env, target_ulong addr,
-                        uint32_t opcode, int mmu_idx, uintptr_t retaddr)
+                        int dcbz_size, int mmu_idx, uintptr_t retaddr)
 {
-    target_ulong mask, dcbz_size = env->dcache_line_size;
-    uint32_t i;
+    target_ulong mask = ~(target_ulong)(dcbz_size - 1);
     void *haddr;
 
-#if defined(TARGET_PPC64)
-    /* Check for dcbz vs dcbzl on 970 */
-    if (env->excp_model == POWERPC_EXCP_970 &&
-        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
-        dcbz_size = 32;
-    }
-#endif
-
     /* Align address */
-    mask = ~(dcbz_size - 1);
     addr &= mask;
 
     /* Check reservation */
@@ -300,7 +290,7 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
         memset(haddr, 0, dcbz_size);
     } else {
         /* Slow path */
-        for (i = 0; i < dcbz_size; i += 8) {
+        for (int i = 0; i < dcbz_size; i += 8) {
             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
         }
     }
@@ -308,12 +298,22 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
 
 void helper_dcbz(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, ppc_env_mmu_index(env, false), GETPC());
+    int dcbz_size = env->dcache_line_size;
+
+#if defined(TARGET_PPC64)
+    /* Check for dcbz vs dcbzl on 970 */
+    if (env->excp_model == POWERPC_EXCP_970 &&
+        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
+        dcbz_size = 32;
+    }
+#endif
+
+    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
 }
 
 void helper_dcbzep(CPUPPCState *env, target_ulong addr, uint32_t opcode)
 {
-    dcbz_common(env, addr, opcode, PPC_TLB_EPID_STORE, GETPC());
+    dcbz_common(env, addr, env->dcache_line_size, PPC_TLB_EPID_STORE, GETPC());
 }
 
 void helper_icbi(CPUPPCState *env, target_ulong addr)
-- 
2.43.0


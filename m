Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp117586njb;
        Tue, 9 Jul 2024 20:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNpQaPL5HAvU80yw667+59j/lbePoaDnxq2x7mjA7phc80Bp/a35Sl7nLruNlTKm3mlMfAbIUC7GE0CpjIy5J/agi+tDK5
X-Google-Smtp-Source: AGHT+IGu8bjODexUAPPb7oc/DaSpF1FgcDTxuO8VVeQUzbAk1xRMEeYpAY/oi9BYpC/9bM4N1lpQ
X-Received: by 2002:a05:622a:294:b0:446:560e:ca08 with SMTP id d75a77b69052e-447fa88edb0mr52643371cf.27.1720582138998;
        Tue, 09 Jul 2024 20:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582138; cv=none;
        d=google.com; s=arc-20160816;
        b=SL9fMEIeXr7DzB5jeVeFB4crNGhmyfJoRXuD46chY+Zdm9Ymw2b5gFL/I57QeprMMn
         3zXn04wGaUmuR2pxzQhHR80YW1FRldIYYZrcsmo05sUgVvzfjVs0YRY7thN3UQuJh5wf
         L0zkgXfqB5jm8VUTnDe1EQcry07H5WIXstArxNoYPFZ7Ab9lM4OLVgterln5MO4fQjcR
         1go3K+OmAD10OT8qojuMSn+4jNjrRGb2KwYqalXIZz8DD88gAqoJO1fgn3MhK9KaXxcA
         5vuN2BBApf+60DRYd/RsbUEB8+izoTEchO4lEUvN6e+chzRCuFMTA/WNHXcYUMspxnV2
         GWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q2ROPOTsOZR6XgFa32G2l+m6EsgEMNZclNZBvV6yeOg=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=oZFg+MoPw5v05QDiLJIVzacWkkOgFPAokh+tVV2NpeXBPulmZEbTfK9K5h76lRU9PO
         y7A0P15tXc69Xdat25mIVMpGVocj5KWONtm3Uiu6ZzDBJp2ywtbf1t1i+7XVPA6639N6
         pg7YDCR3Gf263IXB/dcDAfUoLofAQz72DHyOBYyuI1B89foHaNFum+8bLJSCKTjMLOO0
         FXPO+qFQgSi7PDaI1R6Ji8dz/HgFg/hAN8gcSxcPe94N4RMMtVgnNS+ZUNOPjvkeXoGM
         FUGToQZc56vGqE4ORUSe5YjfFs2eHvN95sxhYWrha4gGyFVJFDqNeSfb6AGTDU9HArOA
         TGXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WelwTHQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bdaccbsi36347871cf.532.2024.07.09.20.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WelwTHQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRO0a-0000zx-DC; Tue, 09 Jul 2024 23:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0Y-0000rz-Ku
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:42 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0I-0003mm-Fa
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:42 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-70b12572bd8so2943018b3a.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582105; x=1721186905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2ROPOTsOZR6XgFa32G2l+m6EsgEMNZclNZBvV6yeOg=;
 b=WelwTHQrBKJCZ7mD4FflzdLlXczc9T96H+bEVRqns4Ovded2fFekoyhknDRa7R+oYW
 gIZ+ylRkuJK4+kyCGt4ncSZzHnTbz4CmOUVDb6DKs51qbqq5eNbxGssHLI1UBtRQq8AA
 clkorqqMe0oRBrOkEqOdDSmkxSWaUpFfY3n6V3gFLoNKhAc/JKLsu+IP7PchuwGuYmDa
 12RRWP/IYn/px3tk3gDYcSP/FP5b4Qjlej52g/cQKF0e3DfdVOIOcbx6KCtgshjzm4qm
 qwwdQ0o97OzVTiS4BIYJBnxfBCxswAiMO0jVPbwhl2tzJI6/pxKyvlaiGqv2PoPNKPXo
 ekGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582105; x=1721186905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2ROPOTsOZR6XgFa32G2l+m6EsgEMNZclNZBvV6yeOg=;
 b=RX6zPb6930zhrCweS60p6QtEGVfjSJQGsc/RVR5fe1j9pXI2zgu4SzZsPTUvxSlHHq
 nl1Xe0WrzTT5vN0NC9q8DFP2A/PpFmAZb4Ee7ud4pysoaD1ISAvYUzCFk902tPaWIlpg
 XAhbFdW6UfFJvjgpwlpD7NSfJfDpdp97zDZnFcMUoLrpnzfBGLYlZJqt9cLPg09jCXwC
 6ATydjnFkg27XYT6ze9pGthgnPYQlYEjHCAkivuireWH5Q7byejrafeZInzvkVCmEilh
 oelTx6ZizE05hZE5ZSO1L8SCbywM15yVdps6QFpqSCYYs6vnIXxp4x0P5c3uOzc2yfrd
 OhfA==
X-Gm-Message-State: AOJu0Yz3Vq2y+TfdlJ+brQGw49rgw0Ad/QFTtcc7y5nloOEx6uSvgVtH
 DiZIp8Gt+wGRBrpT2NuYCK15IfgWFgtqkRWwHRcRcAhQpCNue/exmd8dw12EvAE=
X-Received: by 2002:a05:6a00:9285:b0:704:32dc:c4e4 with SMTP id
 d2e1a72fcca58-70b4351f97bmr5273776b3a.1.1720582104861; 
 Tue, 09 Jul 2024 20:28:24 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 09/13] target/ppc: Improve helper_dcbz for user-only
Date: Tue,  9 Jul 2024 20:28:10 -0700
Message-ID: <20240710032814.104643-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: q9U5lhdV4b4V

Mark the reserve_addr check unlikely.  Use tlb_vaddr_to_host
instead of probe_write, relying on the memset itself to test
for page writability.  Use set/clear_helper_retaddr so that
we can properly unwind on segfault.

With this, a trivial loop around guest memset will spend
nearly 50% of runtime within helper_dcbz and host memset.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mem_helper.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 24bae3b80c..fa4c4f9fa9 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -280,20 +280,26 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
     addr &= mask;
 
     /* Check reservation */
-    if ((env->reserve_addr & mask) == addr)  {
+    if (unlikely((env->reserve_addr & mask) == addr))  {
         env->reserve_addr = (target_ulong)-1ULL;
     }
 
     /* Try fast path translate */
+#ifdef CONFIG_USER_ONLY
+    haddr = tlb_vaddr_to_host(env, addr, MMU_DATA_STORE, mmu_idx);
+#else
     haddr = probe_write(env, addr, dcbz_size, mmu_idx, retaddr);
-    if (haddr) {
-        memset(haddr, 0, dcbz_size);
-    } else {
+    if (unlikely(!haddr)) {
         /* Slow path */
         for (int i = 0; i < dcbz_size; i += 8) {
             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
         }
     }
+#endif
+
+    set_helper_retaddr(retaddr);
+    memset(haddr, 0, dcbz_size);
+    clear_helper_retaddr();
 }
 
 void helper_dcbz(CPUPPCState *env, target_ulong addr, int mmu_idx)
-- 
2.43.0


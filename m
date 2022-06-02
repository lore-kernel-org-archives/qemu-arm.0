Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5214145lfh;
        Thu, 2 Jun 2022 15:27:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF/nwKDrK6KjrVwKKuUgmEwQrmOGEBlUKtmwfvWSmvZEN86U/nQ9QAzH8btUuGSPa4TnrK
X-Received: by 2002:a05:620a:4015:b0:6a3:9b92:56ef with SMTP id h21-20020a05620a401500b006a39b9256efmr4709698qko.488.1654208831530;
        Thu, 02 Jun 2022 15:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208831; cv=none;
        d=google.com; s=arc-20160816;
        b=aA5uu2zYqioMCzAqkGV/SlxCUWYb+PtGaVjpKiv20lF6VnGaSRtlJnoUTc9UWiWP0J
         tR+MX4oIuWgR2ycT05kft4KMdwCYSSOfdW6//WVjUgWntrzShXHRpRnh+2jO602RvMNC
         8m3XLCAnK80/pFH8plOyYmY1F1WYsccV5JNYjI0UZoQD78OlEUe7KD0pvTAunta6gh0Y
         p28MFknbwtCYqCOctSJkYV+KVvjvyXcTfFmvSEY+1zefHmORYgjUNQyDKgwdsXsxbs4n
         gBJReoas+xo9/lug7wKxYt1aH60u+K3IXJ3ndCc5uWCseo5Q2xvtsLyQ/9MxwBY3rxFh
         RT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oKx3qB6wck18vUMVl01RfDqyuqu9f6LE7LHxyySYjNc=;
        b=yKRZyDf/dAk3uFIYxk1+y3VflSKqLL3yiNmZnpoS1aVl24/6DLMWcPMy/i7VvT7Y0t
         uq0pDGJkEIeHlk6F2YFJvz8Rw/wTKdvB8rgODAMnHJx/KNGBe+SVBOBusP1+bBi3ZPuL
         P1GsUKCR7JfqnX+TJUzfTl9eGw+Kuc4GOg36uMX4H0IwTuNnhg1D/lGTpjnKQvouGpae
         an5UfdV6OwiZ1SvMH43Vsz3o/Vjq4Ze6fmfR3+LaWYsNs/cTv4KtADJM8uYPI7MYrh9s
         3mHXqn8X8BelKVjTt3jDZXCmWXPCo6MZ6qPNDuvGB83eVpgUMmgKb20F48+0e/moWEOj
         KdHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luK8tQFY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e63-20020a378242000000b006a3ae33a2fbsi2685657qkd.622.2022.06.02.15.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luK8tQFY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtHa-0007fC-VL
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgy-0004sE-Q7
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:20 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgw-0008Vf-Vp
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:20 -0400
Received: by mail-pg1-x536.google.com with SMTP id u4so2827460pgk.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oKx3qB6wck18vUMVl01RfDqyuqu9f6LE7LHxyySYjNc=;
 b=luK8tQFYY7IDXAysCP92Tgd5Afu+hV5r2kFhE5U/Z0Ln5Ek7g9O5oTjugRtsYPVFML
 BfqqX+i3oBakFEdpZxZ7vU0vk57wiKewk01l/BHBjqWdC8sL/+2kJL3KRO4HxcfSSkd2
 EshIuzT+wE9FbyiXPtKR2buTmH/3oY+mfEVZ/xyOkW6sLMKwvd5SRL3xoGIbM1MmBQa6
 iQJEFhk03aSF9vPaaC50PIjP2tO/WJG/+UNEqktDapK2TZOjlt5sJ8srLmNAgImidNuY
 QQBIqCSo63o9AeY+Pq3dwOx77dE1FVA88yOaR/h/DsUbZfOeENqdjaps2rhrl/tIJo0K
 qCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oKx3qB6wck18vUMVl01RfDqyuqu9f6LE7LHxyySYjNc=;
 b=oWGnvY8Mz3lx6SFlcBjkgJZ1z8yOLNXi+ADQqkyV71sZNSqTqV0h1oKj1VGT0sh1NM
 z7Hiydu51moorxH567HZ5dZE+Wq89N6LjF91dT0pUez1ZZMirofxZAs8kZzik4wCQHkD
 YVoXeK1KartGiCcf+q3xx6RvzmvCUO94y5ZYur+MpixQ4yCOMDp44tStsUqAvDHIyC9y
 9IzY/ShSWMwOUAunjf441PxdtE/lXWKPiiKEryIm/7GiX0qFTf//vsKjdAsJzstIZCyT
 1s8/WJhrdWrkKl6Hf+v0ZSmgdteYUneDdGcvCCKgYyu7dKGagVc+Jad+3W+Ul7mshRju
 PvDA==
X-Gm-Message-State: AOAM531KAMGsIIJg8ciiTFtl6MsNIUNZEe2neqKWuAwHLrgtsHz3M/uo
 ddRt3a7Wp8A0fc7zIehH2snvZ/oUGc+3sQ==
X-Received: by 2002:a05:6a02:204:b0:3fc:1d96:db11 with SMTP id
 bh4-20020a056a02020400b003fc1d96db11mr6091167pgb.168.1654206558046; 
 Thu, 02 Jun 2022 14:49:18 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/71] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
Date: Thu,  2 Jun 2022 14:48:09 -0700
Message-Id: <20220602214853.496211-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qG+/beLlT6Sq

Implement the streaming mode identification register, and the
two streaming priority registers.  For QEMU, they are all RES0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4149570b95..f852fd7644 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6355,6 +6355,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -6412,6 +6424,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
       .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_aa64_tid1,
+      /*
+       * IMPLEMENTOR = 0 (software)
+       * REVISION    = 0 (implementation defined)
+       * SMPS        = 0 (no streaming execution priority in QEMU)
+       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
+       */
+      .type = ARM_CP_CONST, .resetvalue = 0, },
+    /*
+     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
+     */
+    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1


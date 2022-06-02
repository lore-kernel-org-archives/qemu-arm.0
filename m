Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5198656lfh;
        Thu, 2 Jun 2022 14:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg+oV2AEWIVKHOb0H6TrbOMDj9IHcO61DCT/jbdIF3j4rMlJnefkl4P0eJcwWIBTX7rm42
X-Received: by 2002:a05:6214:e82:b0:464:5df4:8ce6 with SMTP id hf2-20020a0562140e8200b004645df48ce6mr4996208qvb.29.1654206969751;
        Thu, 02 Jun 2022 14:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654206969; cv=none;
        d=google.com; s=arc-20160816;
        b=VM92zFoVgPMx8evuc8jVMBLXiJdxFWiDgquKCp2E3mTKyQ23qhLAkUxdhwzLh8qyUF
         g0IsEDL73HT0qV01FTjZYX2DkabQkGzE3P2LOvOn1LYMsce/7WG+1JpeDduRI0avjRv6
         bBSQ0zhq9ifpOXTM1E5u0JdBmwF6TZnv9WQZ6/HQSG2matfuVUZSbpTM8MBcTVu6tlc3
         Ofix6j5qjhH0Tmj65/2/cJfJQmAa0d2ejVdjnFyQJRMUJYxvn2/4K90xzOMbAi5/aSt8
         LZJdesrSMWGEsmheYlyYKHH5sVh+RiJRnq/N42aT2zd5nmDxN5HNpPy6rnHra17vuPNr
         sKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=76vB8wrE1Opihq5ZL4xDfiTWT29p2624W3Se2XeubnM=;
        b=jFmyslbykJrYbpC3r64H4nzSnNJ/RRwxUlwVPbO1mH5PEZ9QnDFR4xE7nGWbZaejj/
         2V+k/rFupodSIClUlpN6vfdD+BvsQdM4ZkCsJUFz16zsnI44q0efUafQQGFg79sLrWMO
         Bn4ERyCCo2meh42lm8nD1WEwIckB8s9qedmw0CsFA9TBxbXprHTW5u+/jOh7kpqbVWWQ
         /vEVO/HaG2z6iOfFMs867WlrnZ0VnTZCcM135MTsfKaO0PVk993HLCSOK6vsQNPyQ4tj
         gtMY1A10aLVkHOyWYwS3WL0ec/MaTICWKDKMxUwkWW+XHCvMHSrWJGy8/ngHY3d8YYxU
         cPNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RTyDCht9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp37-20020a05620a45a500b006a5ea58f26esi2712247qkb.758.2022.06.02.14.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 14:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RTyDCht9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsnZ-0003ma-1D
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 17:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgj-0004YB-O4
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:06 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgg-0008W0-Mf
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:49:05 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 137so5793965pgb.5
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76vB8wrE1Opihq5ZL4xDfiTWT29p2624W3Se2XeubnM=;
 b=RTyDCht9+yNtoXqwwpW6Lk2yOdUEKbX73tD5t69qtR5/egnInjoqAsn0e68hs7V8Uv
 qdf+S1ThrSmNZeudZjhkrlaEx75q8SsCdiCpE70tFHELyRR+yaV78EcK8CYv3dgBrxT5
 jLWRMg/Ii+r8FpGpqli0zyhOoY9o0H5stawH7Q78C/7KQ6sKXKNV9ER28gLMItvzrG7U
 KO5h6RraxOXTFGo7zsHO2MwTLTkEuycaDSqPN+3X7pl5kvzC+6gmBiaAmXpO/ryVaYYa
 51+IXXrFeRPmpIppG+eVfv2fJgB4UHp8w1GlzMKuWDdH0zNcMG7agQnpuV6Ff6uDTpl4
 S+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76vB8wrE1Opihq5ZL4xDfiTWT29p2624W3Se2XeubnM=;
 b=yHxlCIV0HFnRgrHk+LU+3GT16VvjyX5uDPXdfDBh71GvoItztJhyhHJWT5U/g0P9RC
 Bq6NaJuI9ras3HbMNG7+aaBdMKza3FvRubdgFQMN6Z4/+BK3+gS5EpEFlMPQbYuB2OSO
 /ykOMvgp7KLXKhesplo5Wevq1pOZ85hl6vdIOdxQ3bw6/5P/95AT50nSVvZ7p9Z4DZqP
 uut5eEcF+f9wBqVsYIIQqEGzuD2046LTeO4JJSzuWKD7sMpm1WT5pw8xhEIXzXIlBgvu
 2FDQwZjfC5F/cWYw/oh3x1sgvP422Wb8gQWip+s9i3xh+3FyAcTMzH2PUX8gxPWXm/dQ
 xVTQ==
X-Gm-Message-State: AOAM531sREJzigJi6gY+BpNJMUbXh9Za+SfsiA/reH8mWpgaRq5vLkgZ
 uIIv86UQGn1UQPKOXOXFpj5R2w==
X-Received: by 2002:a05:6a02:105:b0:381:fd01:330f with SMTP id
 bg5-20020a056a02010500b00381fd01330fmr5875797pgb.483.1654206541335; 
 Thu, 02 Jun 2022 14:49:01 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/71] target/arm: Hoist arm_is_el2_enabled check in
 sve_exception_el
Date: Thu,  2 Jun 2022 14:47:50 -0700
Message-Id: <20220602214853.496211-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gEW80grjJAsL

This check is buried within arm_hcr_el2_eff(), but since we
have to have the explicit check for CPTR_EL2.TZ, we might as
well just check it once at the beginning of the block.

Once this is done, we can test HCR_EL2.{E2H,TGE} directly,
rather than going through arm_hcr_el2_eff().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7319c91fc2..dc8f1e44cc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6193,15 +6193,12 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /*
-     * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
-     */
-    if (el <= 2) {
-        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-        if (hcr_el2 & HCR_E2H) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-                if (el != 0 || !(hcr_el2 & HCR_TGE)) {
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
                     break;
                 }
                 /* fall through */
@@ -6209,7 +6206,7 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-        } else if (arm_is_el2_enabled(env)) {
+        } else {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-- 
2.34.1


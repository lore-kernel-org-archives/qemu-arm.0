Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201121wrv;
        Sat, 3 Aug 2019 11:48:34 -0700 (PDT)
X-Received: by 2002:a17:902:758d:: with SMTP id j13mr135806253pll.197.1564858114157;
        Sat, 03 Aug 2019 11:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858114; cv=none;
        d=google.com; s=arc-20160816;
        b=SZgrSQS5Heloe0Uj7Lq4z/BA+NzEAapvQdpfB6/TAb2o6BEqFLkRx10GJTb08iu87L
         HUcL/n4m0P0RIoIlOiXQWWZM+b8wVeB8jyqN9zBXmqLbIfPdwkPojNOp9ZjXhLHIuJ7T
         buAZzlc3ZVrqh2IIx8cBSrEGInfzWbqa1/3KYkvkdV9aCtj6/vg95rpGlaPqGOzh4z13
         lnjgDjWWsRcjXh+GxcxX8wgTahy2J6vHcVnsoq6cd5KET85G6k07VoTRfMUCGLVfXZBg
         /lke2+/52tr8FrT1AmWcwFbuLeU7v/Iw4VeN2PF3x8M4k25XGyDs21bzPlULC/8Y3HEF
         CaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+czGE1389+p9Ry0JcTeQCKYKOo7/YkTFZC4yltahS2c=;
        b=ChX4zYJRqCBTbFs7qPP0abdGr5DFlt8J7Ergfwbyea3DMEh1hbzDbVilgr93F5zQA2
         Swg+yn/blRR7BM0z3wRzWYZP+M9NRtmyuuQN52BcEqQbT9+PSGlwNkUf09519133UPIY
         ys1xszPAY0cE8l50CPfILzrxzpeSBnbqANBvQ2WEehh8Zisb2oKTSaFqjwBH4yIAReJ+
         2sHJ0rS+r6PIvsM1BXkeY83YK55ny4WuQl/MMHBlzIEs66CQ2Cuwf7DgV0xNUlmEFjFm
         JldUbEKpfiPAGQ2MLPRputVn1wGLuYF/YZ8W8zlg48KAQjEIn2605IYqSDC1MGeE1B/j
         Cg8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyjg5s19;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t128sor47115263pgt.34.2019.08.03.11.48.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyjg5s19;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+czGE1389+p9Ry0JcTeQCKYKOo7/YkTFZC4yltahS2c=;
        b=Xyjg5s19r/WRWUfR6xaWgAyr8CsYpH1Dr1oYlq23QP+aj6s+bmdUNjI9ShzPR/5bnD
         8MtEvO474wOlswxFWfcG976klTMfYNrp2yo7J5Mj5ul/UI5FsIpB1iNE2+6AVR9CjG/q
         AayUcEl14Gm7TZL84nQm+/2sVXDCVtdUoLRPJoLyuxCe78jcvMfCya7ikbRPUnpg29y+
         MGss9X0u+c9rabYdQZX7JAGTwIb3FNrEn2HiYEqMRIDE798KSq2aJMY/ykeQlm5vxoib
         Tm7V6QmSqeXMlMBhQFeo04Qrdfr9jYnyjyR1JSGmWLeD/g9KQGISk4DjevZtQOx1+gGz
         KUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+czGE1389+p9Ry0JcTeQCKYKOo7/YkTFZC4yltahS2c=;
        b=FPpMvZP+5z2/2v0JeE70KHgX3qW6bIf5QlLqdXxm4fWePQiCrtXVsJNwyqoGlTmDDf
         NnCjaEtI/Wxp/J49CDXcv25gPOh6VwkHsy/R5GYlmuoFxyD3aFF3y4UaTIjWliAfPCBr
         TbpdUyQvYY9bj/9smo47hpqzY4kulGzM5dN22v/GsA9sJ0HhkZxMXscVtKbI8fyeqaco
         EyAuLHHjPjcjMMWuzbsdKWWDfWMexs1NdutpVrcz4cTEftn8GYT3XmXNfRAzdeIWY7fE
         Dy2zdZ5IVUlGVEJJb9bc6Gn7Ex63jNjLMVs1LcP/Yvh6+Z+wkfKdV3tSfj61jV9p8LkE
         Ad/A==
X-Gm-Message-State: APjAAAUhYgAf+V/5v3X/YMVd+rn9qsuQHDuNetJwXrnYo3hgBz9WHDaT
	g1zteczDu/1av4Oa9vqham+2xstE
X-Google-Smtp-Source: APXvYqxd5/9+viNsBVQVD55FqfdoyCeNMDAhjpNUvd3wgZV9Jk4QnMFb+7iGOnZQIhlJa1MG8uCZzQ==
X-Received: by 2002:a63:784c:: with SMTP id t73mr133510686pgc.268.1564858113670;
        Sat, 03 Aug 2019 11:48:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 26/34] target/arm: Update ctr_el0_access for EL2
Date: Sat,  3 Aug 2019 11:47:52 -0700
Message-Id: <20190803184800.8221-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: n7Mh8d0b1+yo

Update to include checks against HCR_EL2.TID2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 37c881baab..b8c45eb484 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5361,11 +5361,27 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
-    /* Only accessible in EL0 if SCTLR.UCT is set (and only in AArch64,
-     * but the AArch32 CTR has its own reginfo struct)
-     */
-    if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UCT)) {
-        return CP_ACCESS_TRAP;
+    int cur_el = arm_current_el(env);
+
+    if (cur_el < 2) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+
+        if (cur_el == 0) {
+            if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                if (!(env->cp15.sctlr_el[2] & SCTLR_UCT)) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            } else {
+                if (!(env->cp15.sctlr_el[1] & SCTLR_UCT)) {
+                    return CP_ACCESS_TRAP;
+                }
+                if (hcr & HCR_TID2) {
+                    return CP_ACCESS_TRAP_EL2;
+                }
+            }
+        } else if (hcr & HCR_TID2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
     }
     return CP_ACCESS_OK;
 }
-- 
2.17.1

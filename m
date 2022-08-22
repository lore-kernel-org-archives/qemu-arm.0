Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1024979ejc;
        Mon, 22 Aug 2022 09:55:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Sf/7ZyQ4m6gXcUpbdrjZJd7CkuJoCEd0ViQBWakumtCB/wxKABDIlmuHCB9BrCfuKDH+P
X-Received: by 2002:ac8:4e41:0:b0:343:5c49:951a with SMTP id e1-20020ac84e41000000b003435c49951amr16092328qtw.25.1661187322537;
        Mon, 22 Aug 2022 09:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661187322; cv=none;
        d=google.com; s=arc-20160816;
        b=iRD9N8tT99WBHpqqn08xIQPbtaf4wE9PiYTWi9k+d3GzH9tfA/qs+dyBMlafLZNYo8
         3rbFymsQaHnKbpeptd0z17ESvmAPFojsPoTuqmgabcvK0IKz95wGOFZbyTQbHLoM2Naq
         hX1zHCf9jmiNtZuz69N1UOHzFMn/EUquAhxIunh0xdXt243Ffmrnec251dV9Acjv23BU
         BcEZryS9V2yXDEZpg94eKD6wqZQKqZn6xZ6oHaseFiPwGdbWlQHym1f7R4Anbt9DKv/r
         WpR1fCrem0ZGWjzmSyvsxOOHOK4kCKlSOdAwYfNiRY446AklNPvyzZFCF2T7s2Nbuaz0
         d1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/p3yDPLt+Od/3xnGbXYFjezvrkF5xsGGNiyT/7WuzN8=;
        b=QRuvKpnV7SBVAMpkUNXzCLDRDBLy0vfCuOIS0AXNgtY3p6V8AA7X3W5iyW6XWA9E+X
         mmmBwFkoJPetUFQY3VyZcP6QohbVKU+Eanw0MEteR2fB1SLU8epl0ufrc+ptBPShjz03
         3Xe5FvvQlp6SRn8iHpuDCeU165LvpaKfW0BluILVfwUelIgo4LA/+uu4gBSAYmkMQ09Y
         2eMig7lXvGQ8Oje76eO7cWEutf3HLsjrSRelrKm9U+HcfqdsKdpL9N3hUap4sPwdw/C/
         0GZcyn/qWDY6qvpTwpAIZb4SOnEeolFGKuPEgemEfYFFnFfRxG5dTBWTtc8Fo2aKylIT
         Az6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqoAnd08;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1-20020a0562140c8100b004749a93aecdsi4699381qvr.355.2022.08.22.09.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqoAnd08;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQAhu-0005GE-0w
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LW-0007sY-M4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:11 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LO-0000fv-Nz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:09 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso14346975pjl.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/p3yDPLt+Od/3xnGbXYFjezvrkF5xsGGNiyT/7WuzN8=;
 b=cqoAnd08DlfOlL03+zlJ7HxSbAXTccGkSgA9TmTuUr35gNuKan2/0UrqQGIjQH81cP
 iaWpjL/p/bS/x88t09DHvKoU6C0H/+47mkOFcD3TAqLgk6G72wISYO3DAx1rJbosyort
 In5vZ3jlj82jimOLT7N1HR8FFT9tiWeq0KLaO1MDtGa4K60PZrOkmOwcFchSCCptxyzw
 scbNkS5crs4joKzVBuHkRhTZgdg0+ILb1Hp8DCjHw1lqwLrVCRBxqqBA2SBWLSYcxJW9
 gNajQQlU+gZlTqEYsm+jjeTNwvK35iirjWFVbBeXTf40ThDSXeqbvF46VOxSMn79btwy
 jppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/p3yDPLt+Od/3xnGbXYFjezvrkF5xsGGNiyT/7WuzN8=;
 b=uTAvz1SjhL99cJ9R9ztZV1fZsr7mShAqGs37GTJ2x4w7YGt0/iX/KNG3X5g9ooSdon
 9TjGHYypWawPsK7VHOWX3OJt1hMndBpSpQ4mH1a5bjmJri7WXhRqFkXLK8O4UEM103+S
 68WPahaU4dDU4WneYVjSCHIVD8w3I/76H6rGiQQ4V5LThXhQjwbKnjBLooRD+kU7oqrB
 unnwXK56qyzF/4eo8o59IRUJj/EiUJ/EUW5HLsgfzTTUgLdA2R/D4l0up0YtIaRQV3Kx
 DySzT3X5RnihRV+hMCgCv80XzvOP03DQAN16VICzHSgVg6XwouPJfzf9WTCLaefm6lx6
 vKnA==
X-Gm-Message-State: ACgBeo0C5qzIK0qdRsIopcvEk2T1yyfOQP/xppJen68Ut0r7zoNdkeHn
 pkrshrHWCDtCClB1ykLxhEW5XU6GSq93TQ==
X-Received: by 2002:a17:90b:3889:b0:1f5:88cd:350d with SMTP id
 mu9-20020a17090b388900b001f588cd350dmr29355928pjb.9.1661182081822; 
 Mon, 22 Aug 2022 08:28:01 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 24/66] target/arm: Merge regime_is_secure into get_phys_addr
Date: Mon, 22 Aug 2022 08:26:59 -0700
Message-Id: <20220822152741.1617527-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: QPtv5JvAxgKu

This is the last use of regime_is_secure; remove it
entirely before changing the layout of ARMMMUIdx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 42 ----------------------------------------
 target/arm/ptw.c       | 44 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 44 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3ccc79f3d9..a231000965 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -670,48 +670,6 @@ static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return true if this address translation regime is secure */
-static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E2:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-        return false;
-    case ARMMMUIdx_SE3:
-    case ARMMMUIdx_SE10_0:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_SE20_0:
-    case ARMMMUIdx_SE20_2:
-    case ARMMMUIdx_SE20_2_PAN:
-    case ARMMMUIdx_Stage1_SE0:
-    case ARMMMUIdx_Stage1_SE1:
-    case ARMMMUIdx_Stage1_SE1_PAN:
-    case ARMMMUIdx_SE2:
-    case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c132d0cada..400ef00b63 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2518,9 +2518,49 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
+    bool is_secure;
+
+    switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E2:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+        is_secure = false;
+        break;
+    case ARMMMUIdx_SE3:
+    case ARMMMUIdx_SE10_0:
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_SE20_0:
+    case ARMMMUIdx_SE20_2:
+    case ARMMMUIdx_SE20_2_PAN:
+    case ARMMMUIdx_Stage1_SE0:
+    case ARMMMUIdx_Stage1_SE1:
+    case ARMMMUIdx_Stage1_SE1_PAN:
+    case ARMMMUIdx_SE2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        is_secure = true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
     return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     regime_is_secure(env, mmu_idx),
-                                     result, fi);
+                                     is_secure, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-- 
2.34.1


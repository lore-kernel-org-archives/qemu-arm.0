Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4344312lfm;
        Tue, 23 Jun 2020 12:42:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO5xp52voCiEMDanrDKxt5DKcxKz+x/m+uGBAWP+XUJdKolB07e/a9yfKjDy0eXWD5LqRQ
X-Received: by 2002:a25:c089:: with SMTP id c131mr18937165ybf.504.1592941372484;
        Tue, 23 Jun 2020 12:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941372; cv=none;
        d=google.com; s=arc-20160816;
        b=WPvowrjxA9Z2I+Eax8AUJZJ6xeFnjQqT+NGL6vwt2dv9zevm0eLfQA/0IvsDkdeSnX
         ogDrXyBAvsxwVNSfEs8YlpYfOYlTaVIRTGxj3Yr+Q5zcqR7qKyLyJKD2fyeobu9lVF5e
         OlEnv7Qzvr6ETJVLldd7fJdo0CjyRw/ixUaHsXY21GTR88DBY0jWmHYRbWBrqtRK6aKU
         Z+vJ6V00FEPQ9DFcq9HM4wsFVrmIgFyJfAXLwBp3qikc9Im/5qJa9Ht49BOW5IjI95kQ
         O0E+y4qzINXN3iM4fPktGVbYat16VxPtKLYTlx4ZM75VWRJxK2CzAIyZ3yEhrXLHUliU
         54SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2lKr79btPsGcUrr83LCqC7k88F7L5S0PZjZ4KnKs9Y0=;
        b=WkPDKh4Y+XmtIT2Z4OlbLrtz/sJcueCs/NHRX5vITqgs1ROH/xSeHZ8HZyVcrFlnTU
         kBAHqyjrNehYOYY2HqA5rBIQEfRC7ogkH4eqY9Tn9zzvAYFRx76iJ9iBevhJOYUlylH3
         Ehet0hlwEe4UXD1IARqn5SRqZcvMQw0T+Iru4TcffpnIdFvoReUwidl+n2u8GvVX+BJI
         ifwTZHD16Ib9Etw5heszyOkhmABwTGzOVRzddeHxw9Dv5JM1PurHUi8yQQ5wEdXbT7zK
         iz8UkkFL6wSEJ2S6RdjRmsLfAvNWtb7CEZyrPc0gvaKZM3yvXwpwUaIjiCVdQp491+IC
         EsAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjeYyAR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i24si14755171ybj.388.2020.06.23.12.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TjeYyAR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnool-0005iT-PA
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnoje-0004Bn-DT
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:34 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojc-0005kg-PE
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:34 -0400
Received: by mail-pl1-x62d.google.com with SMTP id g17so357479plq.12
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2lKr79btPsGcUrr83LCqC7k88F7L5S0PZjZ4KnKs9Y0=;
 b=TjeYyAR2DEJL84rAE96rILlRyL9UNPVxiEFpirLpOUtfE6NS0mcbNOiqbV3uL7Xizs
 ryfsnT3t4+8TGnyhz7fzNDnel7Wxj+wtXtJFp/hE7wj/JH6u5jeHoRug2xNzWJsUz9YD
 1JbJy05JyXsjzvC4OHkYycen319dclV6SF9P8AqKANoKiu+MuupUGI1gtjf4B91ZrzcN
 t3k/TblrDISZ0GzT/lHs5PFsLUm3syHnjkLtDxtXz9d0u1e6goyr8LJS6vyeVvUtMSlY
 AQHH5zRvoOh6e/EJUZj0RS8S0nCWIO8rx/7mgy8OjlOboVNwPUCUtLA2YElhLWniJj8/
 /tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lKr79btPsGcUrr83LCqC7k88F7L5S0PZjZ4KnKs9Y0=;
 b=aVg0twCmIKzH9+rhVHZdGosjmYhi6EowDvsqk3F/M6q0bQJfFfRTcupcn9D67y5YlW
 rgOUmvSqJC3SYHVEPqpFVFgfB0hmGRbjG7KqOr8GGRBGev3gntS/ordj2oLete7uYdPb
 Bu+APjEpP9AJZ2IDzszeGtyUpjJvnfZ4NiSf5+WEWD7XQpvgZbAjDir2b/lw4ZmDwmze
 PsfRiP64Sd1IQncIvSjnH4M8o8utJ+9oONZ7mWLHeZS9095Nw6tywQdSi7XcmB7rrRvs
 atK52l5r0fOICnk22Sm3SYLpZpZb0Xyto/5TD83CinHkWOnr/Mg6xqfAf+X0TaY/Y890
 R1JA==
X-Gm-Message-State: AOAM530Ehwa//Wk30ZfNI6s1fjz2aF2i8qdIhx/mSgluBCPTJ0MWwdIN
 y0yb/nAwcQiC8Ut91FKsKAbPyw==
X-Received: by 2002:a17:902:ee93:: with SMTP id
 a19mr25801905pld.144.1592941051465; 
 Tue, 23 Jun 2020 12:37:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 22/45] target/arm: Move regime_tcr to internals.h
Date: Tue, 23 Jun 2020 12:36:35 -0700
Message-Id: <20200623193658.623279-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fHMjo00YC0XD

We will shortly need this in mte_helper.c as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 9 +++++++++
 target/arm/helper.c    | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c36fcb151b..7c9abbabc9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -949,6 +949,15 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the TCR controlling this translation regime */
+static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return &env->cp15.vtcr_el2;
+    }
+    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d14313de66..33f902387b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9875,15 +9875,6 @@ static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the TCR controlling this translation regime */
-static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return &env->cp15.vtcr_el2;
-    }
-    return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
-}
-
 /* Convert a possible stage1+2 MMU index into the appropriate
  * stage 1 MMU index
  */
-- 
2.25.1


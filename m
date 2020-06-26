Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp51082lfm;
        Thu, 25 Jun 2020 20:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJMd4zkxtbXgxYAmuJ0P/afM0qnE/uSTV502dUWGUoZGQQIkIKFfFL30PTB4PN/HctRMUp
X-Received: by 2002:a25:4f0a:: with SMTP id d10mr1807596ybb.238.1593142713064;
        Thu, 25 Jun 2020 20:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142713; cv=none;
        d=google.com; s=arc-20160816;
        b=VJnsJjLDykkjctlWEkQpcWrCr5FITdEvG5vGIoBzJahp245Tbzmr5BAl3h7K8Md4xn
         O5IF2QB9nAV5MvLbjTWH78lS9/KXtf1Mt0aruBxS/i6wfMSCJzzpnxScU4SiqNSwZeay
         K5WrTYeF/jjclZ5DfWeX61VXuJ8Uqk3cVziHXTkofnaItdgU6MX3hkPT+Nkk+sOBnCjc
         auVizMcivRtnVa4pjCPiSEC//jmYfo79Wd2vjBS7IqMBduVw1oSX2heFahu1bhkawCzu
         W0XHhyQwavlIdAWwtSVGIfCiC/CNVBF+ujkhMMnKxtGc5MtWhldldflmFaicon2PPxMx
         zqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zif4Iu0ibSPdlekVkL/Ps4sAAAkBV8vgNAczaYynkk8=;
        b=yzix6prS6XXJh6cseFaFtHOOb+uRWrm/viGzygodWqyQGtkdG0w65RTFxIUNaOzNCH
         DdaJP9OdpDQm7iA3HgHMejhwfrz1EiEvEp84z8RbUXHgE42BaYl0a6IDbfXSYoLH+btP
         dDVazS3cKd60B8sU73pfxzc7HofW7klLt2LP+Xtv9gAIIdGdkXJfa4M9vGNJLKOVvpTD
         rvEdRzNuXUors8OhmOfvqpkPGSV70SvN2xrrD8hd9ZWWxIPaXtJ/8oaQOdCGEHYIxB2L
         WuEVdEGqmkoQPdmYPOgbxG96XzVYojIPxLydxts3oTWIxEMgM0bI3aFS5eaiWUNzQORI
         1Gqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bmN9zkoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si24018964yba.198.2020.06.25.20.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bmN9zkoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofCC-0003VR-Cy
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof69-0000E4-QD
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof67-0001uq-Rl
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:17 -0400
Received: by mail-pg1-x534.google.com with SMTP id g67so3463493pgc.8
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zif4Iu0ibSPdlekVkL/Ps4sAAAkBV8vgNAczaYynkk8=;
 b=bmN9zkoX/l7EMd2DZFwP78WH/jHAepb6WNBwh2TkCHdvpekI0TuM409yE6cN8NRlrt
 Fhwwb2qqx10va8+PM9UsKSY5lDbKRQvjyhxtLDf9D4ipfADhFUqqHgBLWsuUt/JjM+p4
 I/7fEFJc+UQaejai0lHJ9DVDhe2MCzVXAE3RnqkTloInu1iD2N/8Mi/IYlF55c9R11lO
 8LnsvwgdYu60r4/yraO4ZatdsJBMhoNX0A2iHcJfrnWEcdDUbmZs0acZenxEqYKCORW8
 oFht5mSXfBgFslbvPvLnEdJN6H/Svllv0QQWcarxkJvhVwJqX13TlG5/QbnxQHhiPPhs
 N+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zif4Iu0ibSPdlekVkL/Ps4sAAAkBV8vgNAczaYynkk8=;
 b=Lua63GrZ6XxQ4siKuil5VTx1UkpgL1YLm4KZBNsTxjRK6/2tL1ycWtGsDTl26h8ubI
 BvsbgHtk+XylqnIBR0EFyWin1h/t9eLqnXzk6dSh+KgLRbAG9jqFzLwxqp8zi2E5iIo5
 jUraSSNtS/xOMl5JS32SvoBFiXlob3zxJV60YH+9g/96y6S/Roujuv+QGYgG7scZ/SUY
 1rcHtUyn3pVn/2mJl+kMayvLm3elVzC6j1xTIHN0o9LLV3AH6D+lOA71KIC3iyFmMEZt
 e49+S1Oqdoivvo/xKgiQARFLp45DfVShcRB+VE28VtHlG0c8XRtPFi2gstby5ebcLJFR
 El4A==
X-Gm-Message-State: AOAM533tfmRyMLojtOLaj3IeU9BrUe5vqKMRpcdhpjgzxbn6GI1WW9MQ
 d2kEKNsH9KBp4GLg+xUIAKvMKA==
X-Received: by 2002:a62:7883:: with SMTP id t125mr841219pfc.59.1593142334529; 
 Thu, 25 Jun 2020 20:32:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 21/46] target/arm: Move regime_el to internals.h
Date: Thu, 25 Jun 2020 20:31:19 -0700
Message-Id: <20200626033144.790098-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: mY9YXY5mkUhj

We will shortly need this in mte_helper.c as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/helper.c    | 36 ------------------------------------
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5c69d4e5a5..c36fcb151b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -913,6 +913,42 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the exception level which controls this address translation regime */
+static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_E20_0:
+    case ARMMMUIdx_E20_2:
+    case ARMMMUIdx_E20_2_PAN:
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_E2:
+        return 2;
+    case ARMMMUIdx_SE3:
+        return 3;
+    case ARMMMUIdx_SE10_0:
+        return arm_el_is_aa64(env, 3) ? 1 : 3;
+    case ARMMMUIdx_SE10_1:
+    case ARMMMUIdx_SE10_1_PAN:
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E10_1:
+    case ARMMMUIdx_E10_1_PAN:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSUser:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Return the FSR value for a debug exception (watchpoint, hardware
  * breakpoint or BKPT insn) targeting the specified exception level.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d8c31d03da..d14313de66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9793,42 +9793,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return the exception level which controls this address translation regime */
-static uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_Stage2:
-    case ARMMMUIdx_E2:
-        return 2;
-    case ARMMMUIdx_SE3:
-        return 3;
-    case ARMMMUIdx_SE10_0:
-        return arm_el_is_aa64(env, 3) ? 1 : 3;
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_MPrivNegPri:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSPrivNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-    case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSUser:
-        return 1;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-- 
2.25.1


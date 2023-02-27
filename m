Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5119482ejc;
        Mon, 27 Feb 2023 15:04:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+YtjXanMMNABvdM+f1u/cTM0lpiga9B8eUoyLl0m0Nmsy//K7dsTzy3HhEbf8dhh95o8uw
X-Received: by 2002:a05:6214:29ce:b0:56e:b21c:61e5 with SMTP id gh14-20020a05621429ce00b0056eb21c61e5mr1695387qvb.47.1677539046555;
        Mon, 27 Feb 2023 15:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539046; cv=none;
        d=google.com; s=arc-20160816;
        b=MPrARPwwZPVMn2yKxqA5seX4hj0feWKU/WnAoN7/ZEhUij46KvRexpTTal477gwbjW
         94mYhH5Hrh0HVym72m8rZqVmqq64NghQeDmnzqE2kc7l5kwWJOEBw8PJcqldAqZ46Nn1
         roKN3C7FqEe6xRU8SG4FVfqEhzdDhN8NdWvpKlavYaoRuc25cP4rWXIYaNgPbDf5pikC
         jJ/E3XUntePXKXU0MHgcTSN9ZuJExcIC1EQERv2kY7MC1hDlH2P/VHP0gID3d+8QJfgK
         qPD4hrE2cm9usQ3Nllv1AolZR71vdCMoZp5vZVw8yC9WHMz/rXWzJduPBWae2Xm6+M+y
         V1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TNo1abJPmKBNh/vFLOZMsXlNw7z0lrzbcY3tJpdOOx8=;
        b=OyD1aGDbwR8B45u6IBdCuWdVwx0vbPrLHUXKBqK9JBik9IVx9x3O/+Ezt+84jRMidC
         PEX2E/u56rXSj5MUD/B9cszAUcQ5oRwM70HiskWcToF0WdBzWIolnjthWwx9/9TJ9fGk
         vhf2eTYFpRf6OqnnRnBq9cyOVLpvBf2LYRnsoF4Knk5UlpXq2eizR3+D9bPRKQ6XlBd+
         tUAUZGJ40GDVAQUNAhH4RRDBUUtiyp8ieDLDJIeTd8xum58J8jP0qKdeSTnj2QD/lR4o
         YI9O6wtR4xQDpQotP/Iq722ZnLVbMtXmTwbwRK/5afeA8tryldymPLkJpJAw4l8swtUl
         5cRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqmlJ+7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j124-20020a378782000000b00742b61e66e1si2735394qkd.363.2023.02.27.15.04.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqmlJ+7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVR-0008QQ-A0; Mon, 27 Feb 2023 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVD-0007w9-NF
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:56 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVA-00013y-4i
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:50 -0500
Received: by mail-pl1-x629.google.com with SMTP id y11so4355196plg.1
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNo1abJPmKBNh/vFLOZMsXlNw7z0lrzbcY3tJpdOOx8=;
 b=mqmlJ+7fY3f9OsbmAn+FuYU7GfWjo36K2WF6bsKZaFN5hUZpCaX1+XH9imPNSVgC8I
 EC0EQkj+xHq+v58Fa98jjLQmwkBRRyuXUqiaQjkWkMVC1lCobz6lNUzHupVnBcBSvxoW
 RUp8RpuDxCIZ3Uz4f7HGhIfN9GiaaGz/A/MrJ7PuNMnEIJc8sinmDpRJFLZSNXxJW/pC
 TDywzz/ZKqOQkYNe+qrS/fx2dbfVStTy0iyAcSxiHVxZGIi4EIktzdIrxEcnY+C9TdDP
 gDUyzhhsGuTmthDrgWMF/9qWRQr3RTmwl5I5lnZ4/JWiNZ9WiltGr9qETwvDthTNUn+l
 UmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNo1abJPmKBNh/vFLOZMsXlNw7z0lrzbcY3tJpdOOx8=;
 b=4qajDHmgpfDDAmxvVQ78TMmTCaFRx7t32lCFob99XUGyP93F7Q+2ixdccTJY7GBIk3
 UgZjf4V+4s5VyqE/CTXNjJ8rbfmu/cTDps8eW9ULoVPndkR7b1hqNoNDCQhA3MmGWG2K
 UVmQ1gp/k+fbV7nszOdn6JKZDRd0WA38jPEVWWPS4yzlS0Ay9z8L1h7S3LjmEulYxdGk
 fBvVuJcT9EU0ZRQqjwJTfO2ddQIzSjw3lZ7KF6aUIbBbVbkfSezW4wmrOSJcS5952ipk
 KRzi4oswwyOa/dl+REoKrP7yv67g4gVimAoMILWrgn//EYeyOQEgeUIjML5lVHxVxIUO
 ASig==
X-Gm-Message-State: AO0yUKXS+fsnc39f3gfSuaHqNSTRwtBBHRRAywHj4R8r7APHK8+FzUE8
 PeqyS6mDlV4Bxjf2xTUUht9RlA==
X-Received: by 2002:a17:90b:3881:b0:234:1645:5266 with SMTP id
 mu1-20020a17090b388100b0023416455266mr825456pjb.30.1677538906751; 
 Mon, 27 Feb 2023 15:01:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 13/21] target/arm: Handle no-execute for Realm and
 Root regimes
Date: Mon, 27 Feb 2023 13:01:14 -1000
Message-Id: <20230227230122.816702-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qQ5ELLsXfTwj

While Root and Realm may read and write data from other spaces,
neither may execute from other pa spaces.

This happens for Stage1 EL3, EL2, EL2&0, and Stage2 EL1&0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 52 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 887c91ed13..2eae7a69cb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -911,7 +911,7 @@ do_fault:
  * @xn:      XN (execute-never) bits
  * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
  */
-static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+static int get_S2prot_noexecute(int s2ap)
 {
     int prot = 0;
 
@@ -921,6 +921,12 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
     if (s2ap & 2) {
         prot |= PAGE_WRITE;
     }
+    return prot;
+}
+
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+{
+    int prot = get_S2prot_noexecute(s2ap);
 
     if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
         switch (xn) {
@@ -986,9 +992,39 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         }
     }
 
-    if (out_pa == ARMSS_NonSecure && in_pa == ARMSS_Secure &&
-        (env->cp15.scr_el3 & SCR_SIF)) {
-        return prot_rw;
+    if (in_pa != out_pa) {
+        switch (in_pa) {
+        case ARMSS_Root:
+            /*
+             * R_ZWRVD: permission fault for insn fetched from non-Root,
+             * I_WWBFB: SIF has no effect in EL3.
+             */
+            return prot_rw;
+        case ARMSS_Realm:
+            /*
+             * R_PKTDS: permission fault for insn fetched from non-Realm,
+             * for Realm EL2 or EL2&0.  The corresponding fault for EL1&0
+             * happens during any stage2 translation.
+             */
+            switch (mmu_idx) {
+            case ARMMMUIdx_E2:
+            case ARMMMUIdx_E20_0:
+            case ARMMMUIdx_E20_2:
+            case ARMMMUIdx_E20_2_PAN:
+                return prot_rw;
+            default:
+                break;
+            }
+            break;
+        case ARMSS_Secure:
+            if (env->cp15.scr_el3 & SCR_SIF) {
+                return prot_rw;
+            }
+            break;
+        default:
+            /* Input NonSecure must have output NonSecure. */
+            g_assert_not_reached();
+        }
     }
 
     /* TODO have_wxn should be replaced with
@@ -1565,12 +1601,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         /*
          * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
          * The bit remains ignored for other security states.
+         * R_YMCSL: Executing an insn fetched from non-Realm causes
+         * a stage2 permission fault.
          */
         if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
             out_space = ARMSS_NonSecure;
+            result->f.prot = get_S2prot_noexecute(ap);
+        } else {
+            xn = extract64(attrs, 53, 2);
+            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
         }
-        xn = extract64(attrs, 53, 2);
-        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
         switch (out_space) {
-- 
2.34.1


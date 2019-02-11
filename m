Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp103080wrp;
        Mon, 11 Feb 2019 15:53:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia/HWHfQEe3Q610GXOe7bxA5sjKtf3hk9DUs1SCCfbwKg/nh+k6SCf8BRE1I9Hr0FbcvROW
X-Received: by 2002:a81:9404:: with SMTP id l4mr606605ywg.81.1549929199578;
        Mon, 11 Feb 2019 15:53:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929199; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdNBGO+CBu8DMyu3ZsorjcBAztKRHAk6rlkG4M6vzDQnWjEL8IaQxhps2RwxuRiVca
         F9wtJyQQEpVD2Ui8pFt+xFU/yTglx+YYvJ6dF/xK6NPyn1QBcXrPAHO3G8y/d6/i/Iha
         bvZfR696QeAogrl1XTFi4PMRrqFLHHiGgEkS0DKr6hvMm9yFd6b2k7PFleQSP1lj6gpz
         2oXdVXJTeozhTEhmXXfplVadmQ38xp+3HEYvUZBs3x5AXnFHV0bzVf00Id/goOLnSj0P
         qc1G1voD8WhrpQuyLCFgqBwDMGe7hz9KWuZQAcyjrvxH7HVLtyT40MM8apz9nnq/CUho
         CyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=t1Ac8wdCYYJyzUaPePYMhujZZB6jvuYyMH+INQ2PV8M=;
        b=MenwPt3B9mMAT4/2vOjm9zBnr1h+ApqmL9NXvQxZ9uI1DcMiWKhCg0Vek9HZDFMAcM
         PKC7bpqVWdZN8nR4JrhWYdbrQRK2K3q0BqVXXv+N3BMwjUpbMG26TpD7RizAOU4hofQg
         zOgXsyQ/u2Y0IeSjQLTVRRIFUojoVf8RX9CwfRMNSF8pbppeUV4o1x5b93PvBcVwZ/IS
         XsAp192AlOBFrb53ZfR9diMegWIodb7SUPwAcGYlEjxa2HxwxsuE6Mrv34G0RBVyULoJ
         dpQJ/+OLPHTNamhC/Q1kyW9kFH+HBzMbPMCfvfvEvg4BwXFl6lfnVEH8n93ELr19MGXD
         I7rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwwJx1d3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t196si6970261ywc.93.2019.02.11.15.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:53:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HwwJx1d3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLO3-00050a-23
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNo-0004zy-S8
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNn-0004Er-TH
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:04 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLNn-0004Df-M0
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:03 -0500
Received: by mail-pl1-x643.google.com with SMTP id r14so316192pls.12
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t1Ac8wdCYYJyzUaPePYMhujZZB6jvuYyMH+INQ2PV8M=;
	b=HwwJx1d3vmxrCDnIg8oMe4dN+LC+cxuIYMkEuOoCfce0dxzK6igk2RrKtmHMRvzPx6
	Dv2k+SKB7igThqeu39CN9O4KBBLDnLxke+tqqAh8UYdlGcgSkv3LqHjjV1Fmj26s1H+N
	yxRKVj6Un5cJHJd8CYUF14kM8loxfaAOTtAwgkf8V42CsuBHbW4Z98I8ttL/q9JeSVmn
	RLUmnVAB+DTggkQIRadlHrsMS/w/iZ1Ikh6GUVrqYTwbz5JEe9mkABNKTAcS3yDqF8gz
	PxCC5pP6o5JLTKGiyxXtOBYCaQESTSOSApfnoR3hbMNhcMPQSfI0WW5DX8jyQVAeA3EZ
	wQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t1Ac8wdCYYJyzUaPePYMhujZZB6jvuYyMH+INQ2PV8M=;
	b=odwAONNx8W9nEl5knkKunVuLYy10+gbNoZ7sWi1g/NBXEzV//Pex2xwYwkz2tx3Vns
	Dwc/YB7yfLLdvyzvCj0yuZV9RWuFiG7P/71wblKL9iTdq7O28oWTxTe7ApjGI18HICAa
	WKiu2MfOTttlf5jNUa40VqwiMZ8woMqTvUm6hs75TkkoBnqkeB0GQLWix48ullvKCy+O
	sn3Ckyt6SL+ewjFRqt7YuI5bxpXrsYR+vLSdLtjuXawuoPJSxtlOStFi1uwJPXSi7RnI
	qdz73pSzzKcC/u+9RZUHApM8eh/Up59bmo8qaE9+hFkkqd/wmtxGIN+4IA3keiGzi+Zx
	2+3A==
X-Gm-Message-State: AHQUAua5GOTULcfn2DQKluhp8jezUFvpQe72P1EBxPvqnAXxckqQkwig
	Lwf5OlBTjVEmFJuzVAbu72Y+xA==
X-Received: by 2002:a17:902:a58c:: with SMTP id
	az12mr860401plb.299.1549929182714; 
	Mon, 11 Feb 2019 15:53:02 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:31 -0800
Message-Id: <20190211235258.542-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v3 01/28] target/arm: Split out arm_sctlr
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O7KItAp9dEkm

Minimize the number of places that will need updating when
the virtual host extensions are added.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 26 ++++++++++++++++----------
 target/arm/helper.c |  8 ++------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 29663a264d..20be9fb53a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2987,11 +2987,20 @@ static inline bool arm_sctlr_b(CPUARMState *env)
         (env->cp15.sctlr_el[1] & SCTLR_B) != 0;
 }
 
+static inline uint64_t arm_sctlr(CPUARMState *env, int el)
+{
+    if (el == 0) {
+        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+        return env->cp15.sctlr_el[1];
+    } else {
+        return env->cp15.sctlr_el[el];
+    }
+}
+
+
 /* Return true if the processor is in big-endian mode. */
 static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
 {
-    int cur_el;
-
     /* In 32bit endianness is determined by looking at CPSR's E bit */
     if (!is_a64(env)) {
         return
@@ -3010,15 +3019,12 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
             arm_sctlr_b(env) ||
 #endif
                 ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
+    } else {
+        int cur_el = arm_current_el(env);
+        uint64_t sctlr = arm_sctlr(env, cur_el);
+
+        return (sctlr & (cur_el ? SCTLR_EE : SCTLR_E0E)) != 0;
     }
-
-    cur_el = arm_current_el(env);
-
-    if (cur_el == 0) {
-        return (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
-    }
-
-    return (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
 }
 
 #include "exec/cpu-all.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 520ceea7a4..d4abbb5076 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13796,12 +13796,8 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
         }
 
-        if (current_el == 0) {
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            sctlr = env->cp15.sctlr_el[1];
-        } else {
-            sctlr = env->cp15.sctlr_el[current_el];
-        }
+        sctlr = arm_sctlr(env, current_el);
+
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             /*
              * In order to save space in flags, we record only whether
-- 
2.17.2


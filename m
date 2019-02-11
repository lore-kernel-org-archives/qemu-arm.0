Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1941769wrq;
        Sun, 10 Feb 2019 17:08:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY5rgB9uO8jBz9R/sscj+kuVj8njJWfiXlllRSDLti4sVpCfNpLSRrJKZUaQKt5garR0mXQ
X-Received: by 2002:a5d:6b46:: with SMTP id x6mr24465080wrw.305.1549847331631;
        Sun, 10 Feb 2019 17:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847331; cv=none;
        d=google.com; s=arc-20160816;
        b=eiaskdquxP4hEZ+TPAKaBa6cGEdOMytgl4Rm84LBEa/cNP1CrScFiX0fqKXdTURrxy
         veeowb/c9+TmI2AnDDDm+sqpoQPyyKbMTZxbsgOWQeDo+Rj7b3sUiF3d+IUTFodmLWXA
         V0O0Fy9ZeCCkM8zDj3V2uKhRhzco/z/W8DGuoWolcny/0J+F/NkT/7MqAhitftOhIqIc
         Ms4Nw3xOVdzkyfdotuy+Hn9o0829UwOqoqK3F7Of3I1poqFJV+ArmFAxaBE/eXAZXCnC
         McT+a2KjBwxQYgzvul5fQHMz2HktTenTShm+06Eu0lqyv4Br7WLfc3+XXMiSoyOpWO6k
         x1cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=t1Ac8wdCYYJyzUaPePYMhujZZB6jvuYyMH+INQ2PV8M=;
        b=LmFOouxmkUfW3DatfIWPJgx4X2xpMcFXq4S81Z74BqwSkx/5VUb8p4kIUQ2MIF2WuP
         JE9T8dbPHJoheu8YP+bleaGJkfXZoxyn76Iq3BmkaYdez3amKtnHdq7SVuNU8jgMxUPp
         FdA+VepuZdOSHza/k069LCZE98R80vxJgh7EIgi4Ubu21eFt9XycE8YkoQz9cmfRs7oV
         Luqd9hVK+w12cqjaQTmlU4WKKSGEjvz+vFajMxKtVfESSyHKTUCyy7fr7Fp8FLwHSFp6
         bxRXHXUoBXvsF32zHiIJx1gco2MEh6biyhw2hyU3ZHEUBQrvSmHi/n/u30QY/GhBhH43
         sJgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zFz7sTPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si6064386wmc.95.2019.02.10.17.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zFz7sTPf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt05a-0005Mn-Ht
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05L-0005MB-Nb
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05K-0007xJ-Rx
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:35 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36711)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05K-0007wY-Cb
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:34 -0500
Received: by mail-pf1-x444.google.com with SMTP id n22so1717205pfa.3
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t1Ac8wdCYYJyzUaPePYMhujZZB6jvuYyMH+INQ2PV8M=;
	b=zFz7sTPfqDnYF/jbhcnb/KEZRnordxjRQ+IJglgMBj+JArhgiwbROjQ/dQS/WC5oBS
	kokP0wQ2jKpTS8zfONNip6cMNr6KXQ/OxVSqnlSx0KeJUxFSE98mg8JkncvoupCR8Swd
	eJHGH7wukmoPPjBivleVo5N3pcMuJj5ztSO3wzGPo6YjbHhn52Otp/+oJTYSwtAwzwhP
	KrNz40VoDXADBqT7uXDgowgRUBTw9UkGzXMk+QJOmncu13mAfbjO7uSikcLVO3SIsdEV
	pHveLwIr/O+CZyRrUpsVBdwGGyOpIfUrn2BW27Q29RAvp7jff7Xey1bwjSDUPzlnp7P2
	075Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t1Ac8wdCYYJyzUaPePYMhujZZB6jvuYyMH+INQ2PV8M=;
	b=NzvVQQ806NBEY77wVjtgsDdD0nm4OcxHKeHJxbmYgHS6lsQ08IrkBx0gkduUDprUuI
	iXxZxzFl/j5ILl/hafXQwSX2Wr6SHeHAmgH9xfornWcxym3QMYhTH9urOOwKReEa9UCR
	atBxS7ku9hn7o3yWIExoBDBcnPOcUvhe2KBUxZBj3svWbbDzgH2mwBVXwkSLELrSwC6l
	sNWfkVssoteRqpC8icZEijIDS6eiJyMUOsQVyghmD8N0D7djnkFv/ZaAHGVQGjwUpqLj
	MtYD+jHqifAq5VWIOnbImPBhv92mlNuii6EhtJQRdArRWnVEBClFXh/kr/xjVCZ0QosJ
	AXKQ==
X-Gm-Message-State: AHQUAuYAlAlq/YVWyfnvREmFSeL2oe3/jbMPbdd8vPQNdhFdjZbF/u3u
	7OQv3nxKPR1wQK+/9l7T5b4Vng==
X-Received: by 2002:a63:5462:: with SMTP id e34mr20081740pgm.97.1549847313272; 
	Sun, 10 Feb 2019 17:08:33 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:04 -0800
Message-Id: <20190211010829.29869-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v2 01/26] target/arm: Split out arm_sctlr
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
X-TUID: fJh9/jO85ULI

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


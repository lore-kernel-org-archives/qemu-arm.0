Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5782990wrq;
        Tue, 26 Jun 2018 21:55:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcQpQefh6a+ZyPoF2oP4BQCW6t2kDDK9AkqRCrJo03XmqVtlHosj61MraNY9RUeBTzLAEZS
X-Received: by 2002:ac8:3a86:: with SMTP id x6-v6mr3991678qte.143.1530075317183;
        Tue, 26 Jun 2018 21:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075317; cv=none;
        d=google.com; s=arc-20160816;
        b=QjRSLls3azzGB7/1NVzCHF7C1Bx/IbGAdWgcoAG6nza2NCSGDIZ7xWqBFYrakZppC5
         Vc2Kv7Oc9mXf4miy8sIOix+d2kjGwaukb21WdeOXSrMBjEPEIJ6YlB79K1LHOPG4cysA
         fb13C/WI1ZogFgNSgDWvppD3R/HhlJhE9vJ49PoGMw5rm5wfRG37GEC/bdJMuBpzLVeH
         qeN3rm4cb/OpTvQUgqNvhgnuF02cOCsFlzOzulZCAwhcVhXFKYYRLiXTHwWHWhwxztU9
         9gfiSPowzwLSJebyZ2TTsq2uIA4pyEkoL6xn76xl+tW9MsJy68+yZKyQbejOhUJ2UTdW
         t6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=z9Jmsw8tQfNqgdH0zzy7MGQpGBhTgMjmj8JLLOriGMI=;
        b=NWwGX2IU9tsEOqbKAjW6IjShb+Q20zno54072I1jE5/VDT/k75GYbHbPRFb9iXlFMp
         rvH8gU31fkr8kOvGoZsCg8qsyS7/yZSj/NOVXRwkswaSM1wyf3VUSqOinuKVjSXa3qN2
         c0+/3mt0rlEwjxj2uLPCBdcpyUWuLcpQOCedxfoUjOEuYsUYK2g6hElZJLafW+B0q8to
         Q8uP0eVGJ1AKf5nXHy3zoy+JY2jLlpzR877ssrYcSrxlpHHCfSaI3278teAEwCAXPn0Q
         qwE2AvH8U4JMafRHh6MrLO2eoRVEtcfZFq8NN4fyxbNPWB6Y/KHIWgFvUxUJMhqEv+W6
         /HKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jA5Ssl3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10-v6si408098qvd.106.2018.06.26.21.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jA5Ssl3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2U8-00055g-Kx
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:55:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29v-0004lG-1A
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29r-0001AW-VB
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:23 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:45696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29r-0001A5-Ot
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:34:19 -0400
Received: by mail-pf0-x242.google.com with SMTP id a22-v6so380948pfo.12
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z9Jmsw8tQfNqgdH0zzy7MGQpGBhTgMjmj8JLLOriGMI=;
	b=jA5Ssl3N7FWqWEse2DYt3YpcZWiAfOEGZBiHJWrmiZKKdhOeb7MLNzKtlgqRRLS2u6
	+Ifo1ObrOH7AjVWVVbLHuSQXO+47DClZyxgyRpz846QcR2oq6fJ9xOSHekB9okSWKC7w
	/OPDFIJ7kgWoS0ZLiK4QBHO24kkCXp+KPrMU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z9Jmsw8tQfNqgdH0zzy7MGQpGBhTgMjmj8JLLOriGMI=;
	b=HKvkNrG5wLghPLC7s0/d/vuTRZMmIPpJlzLzN9y9c5yglXBA9wMRJSkZeOTRgCr/DJ
	/B3ABJhFx+UJTSKG3QqF0f46rB0seLX5cOuq6yNujsYFwxeS7yzcIUbQvM7N3L2RxOde
	tmWkeh3BgEenKOE6YDTNpGrOSsR6EL88XmghgAkoSUVzZAeZEvdLc5EgZPhZOL+QLBpx
	ILjxU50TNj+jv5NjWdHoHVc5DFSqDoe7e/SnkKA7YEFqSNmevgkPDW8WYkVWBtFXHMHT
	OARQJyS83Vp/RHwHp5VMCxR9A66Z5QxQnCGm/i5Qfz0XasBQPh6BuosDt3QeV/nzYW+u
	OLRw==
X-Gm-Message-State: APt69E08Kgd/eAQBxlzFgkoSwRcWoNJW/2+oqbVzS4EcwuALDDSHxzbG
	LOP+YWfa8SXQJRS+ttyj2tg16A==
X-Received: by 2002:a63:5014:: with SMTP id
	e20-v6mr3692043pgb.133.1530074058871; 
	Tue, 26 Jun 2018 21:34:18 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:27 -0700
Message-Id: <20180627043328.11531-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v6 34/35] target/arm: Enable SVE for
 aarch64-linux-user
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
X-TUID: xl8bPDGDTEZd

Enable ARM_FEATURE_SVE for the generic "max" cpu.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6: Set ARM_HWCAP_A64_SVE.
---
 linux-user/elfload.c | 1 +
 target/arm/cpu.c     | 7 +++++++
 target/arm/cpu64.c   | 1 +
 3 files changed, 9 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 13bc78d0c8..d1231ad07a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -584,6 +584,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_ATOMICS, ARM_HWCAP_A64_ATOMICS);
     GET_FEATURE(ARM_FEATURE_V8_RDM, ARM_HWCAP_A64_ASIMDRDM);
     GET_FEATURE(ARM_FEATURE_V8_FCMA, ARM_HWCAP_A64_FCMA);
+    GET_FEATURE(ARM_FEATURE_SVE, ARM_HWCAP_A64_SVE);
 #undef GET_FEATURE
 
     return hwcaps;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2ae4fffafb..6dcc552e14 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -164,6 +164,13 @@ static void arm_cpu_reset(CPUState *s)
         env->cp15.sctlr_el[1] |= SCTLR_UCT | SCTLR_UCI | SCTLR_DZE;
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
+        /* and to the SVE instructions */
+        env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
+        env->cp15.cptr_el[3] |= CPTR_EZ;
+        /* with maximum vector length */
+        env->vfp.zcr_el[1] = ARM_MAX_VQ - 1;
+        env->vfp.zcr_el[2] = ARM_MAX_VQ - 1;
+        env->vfp.zcr_el[3] = ARM_MAX_VQ - 1;
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c50dcd4077..0360d7efc5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -252,6 +252,7 @@ static void aarch64_max_initfn(Object *obj)
         set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
         set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
         set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
+        set_feature(&cpu->env, ARM_FEATURE_SVE);
         /* For usermode -cpu max we can use a larger and more efficient DCZ
          * blocksize since we don't have to follow what the hardware does.
          */
-- 
2.17.1


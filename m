Received: by 10.28.71.27 with SMTP id u27csp2069534wma;
        Sat, 17 Feb 2018 10:23:45 -0800 (PST)
X-Google-Smtp-Source: AH8x227Iwy0ypnX34zkXJ84f4jsdNAXgK10Pikz7AuCkaRlHm5LRBffJN6lpTPIqEbaJqAp3eVuO
X-Received: by 10.129.207.11 with SMTP id u11mr7330381ywi.126.1518891825538;
        Sat, 17 Feb 2018 10:23:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518891825; cv=none;
        d=google.com; s=arc-20160816;
        b=aceKUDMoyOMuB+MINGk6LCsQZx5szFZSDCMJ1uAZpFmfk9m/sL3l5OYdWOOb+tk3cX
         8XbeJjZokRh2vQnDGOeyt2XvOFULyDEJ4HPP/ljWwvV+zg162PP4vxMZt5kbySnpyEKq
         Ik5mOilwEgIO2frSF94a1JaGwHYp8gqt+t/DnggCKFZHcuf8R0yO6+xXSZEpOFALCuY6
         lrbf/smerkGvd7nKMBxfHviNtW4DInPnD9/ROodjpt6j/J4nYkcm50TyKCjAcLGR4U7G
         xaMLQfP/svEN/g5Oj6ncRwukgCVpQzfOuOUNMINkV8A0dhoqUBsTx2IyAq5HIsOa8Oky
         y3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GKTCp6bvksh14RttFM3Mt9UNkxVgwo6yVS4bRZKIG/8=;
        b=KzTGvqr37JZCHcnPV3547s8d+g1NJz/GnkYryrfEZ+YlDHOsAZQgMykddfwPWk5aNe
         7y42x20zbSv1IexxIzBBpMU5iiLnhpK2T+A0BrVYs0j6zzaok3dPh8V8zKojOaXG7xkc
         kW6B/rNVcqFeP4AS4mPhgfxVcHwfjmRFWajbYeeqExzkS9C+bcaB5R9zxiIg8Ccy1ylV
         b5uBpDU3PmyeQ3p4BGCft8+sbUPv0ZNqbSdIhmM3V2kEZHxwV9vrVt3Y3BUEIVReevE9
         00R2wfKNN9Jz0BHsvmu3fLFwHUYfV18uIhfSmaESsvz0dGyduLxtsgFUSL80mLqRWe99
         Y/Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XsENO705;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si817284yba.354.2018.02.17.10.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:23:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XsENO705;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en79E-00006b-Ri
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:23:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en792-0008W7-DE
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en78z-0001Qj-AD
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:31 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:38165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en78z-0001QK-4b
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:29 -0500
Received: by mail-pl0-x242.google.com with SMTP id h10so3438745plt.5
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GKTCp6bvksh14RttFM3Mt9UNkxVgwo6yVS4bRZKIG/8=;
	b=XsENO705oCj3EEvARe2kDxAKzc6yB5FChZN+2zjJDYeidOU2EZl953Q4WtV+meFwSS
	QR9mr4zHmzh7lBikyjvhqM4Bg+iJM7deo/gqrlIPde40NXj9qQYVADwzGYVABb1kdMRD
	3i8PXJGwhKnksw6a7Gky1u4FYErzaFgNuhbwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GKTCp6bvksh14RttFM3Mt9UNkxVgwo6yVS4bRZKIG/8=;
	b=UrOU7Eelanl8MD8MHQg8vioaoiOmIQVzJ/kDU8d9nL25XZOnhz1JmAChjMa3x/GfrW
	d5Aw74UYUVpg7ubtIQC3jZXzQH5IUTMuX5jsab2rAi77asag9qZDnZ029k4/Ptn8jAwy
	OKEBlkveKXqXbGZncsSiI2RRQnYd8W43ObFswAS81Jlp7vs+MSa++7HMqeY1Sxzfu8DJ
	MGllfnkZ3wcTn8ZqQT/6xwFM8VP9gNbO8X1Yk1w25H0QgV5RIU22TLakthrxxZ6k3jD5
	/4rOrEFr4GBmR4tlhepnomzEVzvo2L0+sBlP0rVM3L+HvjLn/McuKKHS8286OcChoUAu
	rHyA==
X-Gm-Message-State: APf1xPB8fHOYbfJlgWnv1nP7N3/j5SIZ9xEZC1SLriYqfS1JXMzMMphP
	HY9hhjSDGxVU0eyspB77/qjZug==
X-Received: by 2002:a17:902:ab85:: with SMTP id
	f5-v6mr9592147plr.199.1518891808245; 
	Sat, 17 Feb 2018 10:23:28 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:17 -0800
Message-Id: <20180217182323.25885-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 01/67] target/arm: Enable SVE for
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4CdGfKZ+QSGQ

Enable ARM_FEATURE_SVE for the generic "any" cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 7 +++++++
 target/arm/cpu64.c | 1 +
 2 files changed, 8 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b3ae62db6..10843994c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -150,6 +150,13 @@ static void arm_cpu_reset(CPUState *s)
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
index efc519b49b..36ef9e9d9d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -231,6 +231,7 @@ static void aarch64_any_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+    set_feature(&cpu->env, ARM_FEATURE_SVE);
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 }
-- 
2.14.3


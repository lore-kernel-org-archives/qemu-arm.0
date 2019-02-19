Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3382496wrx;
        Tue, 19 Feb 2019 05:05:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYtqGRSffnBVOBs9aGvhI19zK+ej4wV0aQjap66fB1cauVYlIWSN1DYvAP84szgW1ftS0VC
X-Received: by 2002:ac8:3501:: with SMTP id y1mr22016159qtb.209.1550581523797;
        Tue, 19 Feb 2019 05:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581523; cv=none;
        d=google.com; s=arc-20160816;
        b=us2NhLyd1qIxWUG6S1R5He1i2NwWi+LItXrwL082JsDUx5p5DStBsq3pQjRm5GrM61
         fxjZdxaoZGv9SPx0Um1dgfrSRc6mci5vpFsu0P4zc6xg1cnXw6cH6wl11ckUqxiioh3k
         jp6JdN7/pZfgt5xmsZEw9w09snxQLRZr+5qMfba1JSQR5wkBdMOE7N0Jdx0Fm/azosis
         aOBwSBKY34F+T7KEaf3FqSrnoWaDCHG7JgUvf2rJmFF4XpNlwrwMp2G4bSx3Hz0LXBtN
         elK46Fuwih5OO8YhbZj68irJhTfQ+BlmyDtWHUrsu/VwHsNSngh1XbzES6rYGzFVMywU
         en6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yXhjNBRfk4bgBthdgKq2jkIg12QhrODqy/sEJjyPMGI=;
        b=MIpm3ujVNEmZBiDm1H6NhFWApUlTTOXi43rtUU2+u4699iky62ur+jkDLq52W6ZEC0
         Q6qFAtq4Yr6IZRqRSseXeHi7OLkg972KZuBXv6gqhiTJgKEgmAbg4Y8my2YauOzl7WSv
         bvf9lCRaOYvby2pimn0wLD7DAFX6R2rZNg1VY5PIstzA8LI9nO8mgbkiYkJdyww+FVlv
         cb8NX/D/N60WrCrh273Lu8d17juAH73gwMvbwPyBrQOM/OjxrbgR/axiTJOthjBIqYxg
         pjKvrWGR5nV4wJvALXW/y08LQU3B56DrD1ha2w/p6SqJNCZt9Zp9fd6Xwx80cAtSj6Pf
         o/Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y3BDzJJ+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si2457627qvj.193.2019.02.19.05.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 05:05:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y3BDzJJ+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw55P-0006uW-3c
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 08:05:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yZ-0001hd-9n
	for qemu-devel@nongnu.org; Tue, 19 Feb 2019 07:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yY-0002pm-6C
	for qemu-devel@nongnu.org; Tue, 19 Feb 2019 07:58:19 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4yX-0002pB-Tl
	for qemu-devel@nongnu.org; Tue, 19 Feb 2019 07:58:18 -0500
Received: by mail-wr1-x444.google.com with SMTP id v13so21841278wrw.5
	for <qemu-devel@nongnu.org>; Tue, 19 Feb 2019 04:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yXhjNBRfk4bgBthdgKq2jkIg12QhrODqy/sEJjyPMGI=;
	b=Y3BDzJJ+PbAW8IfpHbGIAdSi/a28nybW5Mqyrqom8pwlh/+DJGgnSBDdHd83Q1NbvE
	XEDrtbSx+m3mSmU8jM+Dt6OgDcJCD0z29/+7UWutfCi82HiXogtJVKLDsjhiwKWM1bwK
	3sa7JEFp6jv7uSfnpsQYIkqsWK3obbhNEWtn4BFDnYvY4hunvnH0AKewcvCEnWPiCpLu
	B583iYokjOv0tVPKZmYqGMGW+qSrJ2C5zFiTz8SYrUWyDnlxn45UEja1BAus9O6/X2y4
	WWTNJ7khUR3dVj/khvsHIVKWUV2SSd41M4Uq97flSI9ShUtfn7UdguKxh5v5D91iSidl
	8NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yXhjNBRfk4bgBthdgKq2jkIg12QhrODqy/sEJjyPMGI=;
	b=L+Ks5tdpsHXAH6r4p3/+28rpGFLC2c2UaR8oNNhQ0ig2fMK3KVAsKXatqY3D6jeQaZ
	rSt3w87vGYbh6SslaRbqYnUAtVpF+CD+zCk/rTnrBmGmd+Gq2xWVHba97+C4dTLS1VgT
	Yw05N+FBPEEiFzuc9rkA0KUVVFcfDmAu5N6Rwqjn0cHPObzOIvyPGalMOJP3RCQxL49r
	KCYUtLGW4D/zRhrBMtU+f9Ie5ke3Jf9nVeqpgNHzBGZBq3cn8GaDxt2U8YOfxrezDiSl
	ahWBQTCwvOZCqDDcsUW1xI52U9YwwU0toY9A5uKKwjfWYc+yWjNwRl2VJHYhYP/4i0Pn
	BGDw==
X-Gm-Message-State: AHQUAubFt1jtX5fSPHp4cB7snSZ+TJg5OU2hYREpAofeLPlVGVzrowO7
	aqbqNj4VrCLPguEmae9N0+FHGA==
X-Received: by 2002:a5d:500c:: with SMTP id e12mr7667572wrt.27.1550581096927; 
	Tue, 19 Feb 2019 04:58:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:04 +0000
Message-Id: <20190219125808.25174-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219125808.25174-1-peter.maydell@linaro.org>
References: <20190219125808.25174-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 4/8] target/arm/arm-powerctl: Add new
 arm_set_cpu_on_and_reset()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xdUHkqL95pJ+

Currently the Arm arm-powerctl.h APIs allow:
 * arm_set_cpu_on(), which powers on a CPU and sets its
   initial PC and other startup state
 * arm_reset_cpu(), which resets a CPU which is already on
   (and fails if the CPU is powered off)

but there is no way to say "power on a CPU as if it had
just come out of reset and don't do anything else to it".

Add a new function arm_set_cpu_on_and_reset(), which does this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-powerctl.h | 16 +++++++++++
 target/arm/arm-powerctl.c | 56 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
index 04353923c06..37c8a04f0a9 100644
--- a/target/arm/arm-powerctl.h
+++ b/target/arm/arm-powerctl.h
@@ -74,4 +74,20 @@ int arm_set_cpu_off(uint64_t cpuid);
  */
 int arm_reset_cpu(uint64_t cpuid);
 
+/*
+ * arm_set_cpu_on_and_reset:
+ * @cpuid: the id of the CPU we want to star
+ *
+ * Start the cpu designated by @cpuid and put it through its normal
+ * CPU reset process. The CPU will start in the way it is architected
+ * to start after a power-on reset.
+ *
+ * Returns: QEMU_ARM_POWERCTL_RET_SUCCESS on success.
+ * QEMU_ARM_POWERCTL_INVALID_PARAM if there is no CPU with that ID.
+ * QEMU_ARM_POWERCTL_ALREADY_ON if the CPU is already on.
+ * QEMU_ARM_POWERCTL_ON_PENDING if the CPU is already partway through
+ * powering on.
+ */
+int arm_set_cpu_on_and_reset(uint64_t cpuid);
+
 #endif
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index f9de5164e55..f77a950db67 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -228,6 +228,62 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
     return QEMU_ARM_POWERCTL_RET_SUCCESS;
 }
 
+static void arm_set_cpu_on_and_reset_async_work(CPUState *target_cpu_state,
+                                                run_on_cpu_data data)
+{
+    ARMCPU *target_cpu = ARM_CPU(target_cpu_state);
+
+    /* Initialize the cpu we are turning on */
+    cpu_reset(target_cpu_state);
+    target_cpu_state->halted = 0;
+
+    /* Finally set the power status */
+    assert(qemu_mutex_iothread_locked());
+    target_cpu->power_state = PSCI_ON;
+}
+
+int arm_set_cpu_on_and_reset(uint64_t cpuid)
+{
+    CPUState *target_cpu_state;
+    ARMCPU *target_cpu;
+
+    assert(qemu_mutex_iothread_locked());
+
+    /* Retrieve the cpu we are powering up */
+    target_cpu_state = arm_get_cpu_by_id(cpuid);
+    if (!target_cpu_state) {
+        /* The cpu was not found */
+        return QEMU_ARM_POWERCTL_INVALID_PARAM;
+    }
+
+    target_cpu = ARM_CPU(target_cpu_state);
+    if (target_cpu->power_state == PSCI_ON) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "[ARM]%s: CPU %" PRId64 " is already on\n",
+                      __func__, cpuid);
+        return QEMU_ARM_POWERCTL_ALREADY_ON;
+    }
+
+    /*
+     * If another CPU has powered the target on we are in the state
+     * ON_PENDING and additional attempts to power on the CPU should
+     * fail (see 6.6 Implementation CPU_ON/CPU_OFF races in the PSCI
+     * spec)
+     */
+    if (target_cpu->power_state == PSCI_ON_PENDING) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "[ARM]%s: CPU %" PRId64 " is already powering on\n",
+                      __func__, cpuid);
+        return QEMU_ARM_POWERCTL_ON_PENDING;
+    }
+
+    async_run_on_cpu(target_cpu_state, arm_set_cpu_on_and_reset_async_work,
+                     RUN_ON_CPU_NULL);
+
+    /* We are good to go */
+    return QEMU_ARM_POWERCTL_RET_SUCCESS;
+}
+
 static void arm_set_cpu_off_async_work(CPUState *target_cpu_state,
                                        run_on_cpu_data data)
 {
-- 
2.20.1


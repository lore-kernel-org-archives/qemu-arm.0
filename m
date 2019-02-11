Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1948397wrq;
        Sun, 10 Feb 2019 17:19:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib8bqvJVOBrN+yeOvd2A5gKlV/8MO7H7OG3IzVgKaW8YZPt1JiU7Io2l7uhHhBM4jYCjTm4
X-Received: by 2002:adf:8366:: with SMTP id 93mr15255593wrd.20.1549847958954;
        Sun, 10 Feb 2019 17:19:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847958; cv=none;
        d=google.com; s=arc-20160816;
        b=xiQ+Gq0qSkniFkgEhOVCwye74r4gWI7HgqvKlyJAhMffpLlxaxM3FtuSyYzgPPqskq
         RbQHpXBrTFBwx1PTeLrX3+xMLE42N5GMW5wJbIt4ejiRbNNWRXMw5aM9VyLJIVr3F2Of
         KdDTduDhR3KGsb8kJPL+2eO0KuLo9rzrqfs42RDeH8iQRMkUxx6IG5r/YhZqOQInv2s+
         OP3kj1nst7cZVaCd/PxrSBhP/YhAMJmLd3Sf8DUpA60U++f8avtGrB5DRYlnGIPQcFRr
         YF7RM2I8Kzy8VzdxpT53wszL0zIElbhoPttj1j3t5Tj9gY2LiAKpyUV6wcyD0r3PlFQj
         ebRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wOgP7lobhsemXB3OvFkJ+c0fo71lcU0DJjKscTksgDY=;
        b=G/n5OV7kQfWgzNC4LieMeqR1UC0VICeinUeYbvpNgEbZrdDq97FTqQBKIvjG7u16dB
         cxem2V25q3YyAYUrRSbRx/taYzEUOInMFmN2+6+DMMo4sWn5dmaRXGrGW7sCLaQtT4rY
         eKXomG98s0fz817+gX+hLO8VrawjvuXd5yliuqRZodP7/Nl4wnJAxMkeP2c3emLuk8o8
         4ReOV4vWKS42wJ0n7o4+RsgllJaegpHkO+5HkgfqrLPGg5wcRIvyyT5mEGUw3kNn3UO5
         BJBt3OGitWgIeDaQWdxS0mjOI3K1oKGPF0DTmHh/x8oSlRYIrfWhZIkVUF7Fw+ePqXnu
         JP8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LhHuHHso;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si2605055wrv.243.2019.02.10.17.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:19:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LhHuHHso;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Fh-0005PH-Q4
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:19:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05r-0005sf-MV
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05q-00005M-MF
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:07 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05p-0008LT-Og
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:06 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 101so4506121pld.6
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wOgP7lobhsemXB3OvFkJ+c0fo71lcU0DJjKscTksgDY=;
	b=LhHuHHsouSudzJgxA6esj9Dxhq3q4AUyafQvjtnA1+FemlnXj1cNFR+F96mJ+m8yaK
	nhlaBSV10xPPH+BNG5xgwE+7FnA6K29TAmYMNx2nuuDbFVb/INHJ6weI8CZsWBwbFDal
	z+wyHOSfyeqcEJ5bS6uZvIJgVrjGmxxN6Qr/vQbYvYppX6iOsl2IRsXghpcuVdHWKaVJ
	5PUEfip/ZMCalKWaixJNQQJ4MRQFCE0artppcNiu40fiJZieX7hVBAWStPAyzj85pB54
	vebBdocE9S7x8xV4lr84jGS2/aS4xX5NqYnXip2BUOD9VdLOmkEDnn9Kes8tTb71EblZ
	ooCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wOgP7lobhsemXB3OvFkJ+c0fo71lcU0DJjKscTksgDY=;
	b=HhuYkK4VdaON1CDJcQQVthI2n61qDckZ/NaSd7Qyed2iJyPsvV9MFlzk+zqvq/DJrC
	8tMGOD0qdYMUcfLxhPTNL4hr3QrAIpv6VqttDjpKi7nzUaYMWdU6rvWlN9lFSw8D9ERQ
	zK5OmJWg16TMJEqn4IX7thlNSAAPilMzH47UYbfd55dcGGBk2gjeDjYUOSuszcwrhSlB
	wsWLX/8iKRw1w38H18CKcXvwQw7ncoqrnffZ0ieITNXQ4qUxVvDGbtkuE1kBlmoFHfrw
	2TMTZyxWRpBFaIeUtFg1+pwi6i7qGr3OMXX2tNFDs5LM1QRpjYhC5HLMukPkaOJliGFK
	XV2g==
X-Gm-Message-State: AHQUAuYJee+h1mBEC0lYrtGH6+E07ytECL1XIj3ykf21NoR9YVGX7wso
	38evBI0w2MwUUuHVb6hrjUdF4g==
X-Received: by 2002:a17:902:a50e:: with SMTP id
	s14mr23328196plq.311.1549847336348; 
	Sun, 10 Feb 2019 17:08:56 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:22 -0800
Message-Id: <20190211010829.29869-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62f
Subject: [Qemu-arm] [PATCH v2 19/26] target/arm: Set PSTATE.TCO on exception
 entry
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
X-TUID: r0xqUHbpGDwh

R0085 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9fac3628e5..a3ad5bc54e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9455,6 +9455,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     target_ulong addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int cur_el = arm_current_el(env);
+    unsigned int new_pstate;
 
     /*
      * Note that new_el can never be 0.  If cur_el is 0, then
@@ -9548,7 +9549,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
                   env->elr_el[new_el]);
 
-    pstate_write(env, PSTATE_DAIF | new_mode);
+    new_pstate = new_mode | PSTATE_DAIF;
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_pstate |= PSTATE_TCO;
+    }
+    pstate_write(env, new_pstate);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
 
-- 
2.17.2


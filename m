Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp871297wrm;
        Fri, 11 Oct 2019 06:58:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5lMIIXfZyasSH44IrIXwnckELDB+0zsBlX4qK0Om0EDN17MdOPkDJLjfkwaavMhoArWh/
X-Received: by 2002:a05:620a:718:: with SMTP id 24mr10378800qkc.157.1570802335414;
        Fri, 11 Oct 2019 06:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802335; cv=none;
        d=google.com; s=arc-20160816;
        b=YZO773eJmXPSzMibgmBdDFg8ftVVpM4Ps9b0OH8ZNicEJbpfDguqMrwvnu6ZK+37xB
         0KKTr+B6glSJFqW7ysQdqU0ElnCXXhtxZUpWof57LJ30r/Th0+sidPrVPuxM6SSeBvYH
         Us+1BlDYcMO4XZM2g0S2iocY7O4EliQFdEiPG95Ru6aRW1QgRIQUeUFDEPzHko5E0fhs
         VNq37g5BCE+ln+VCVk7KEbFZAxuNSQAHcFD9tmYHdGBWyRIoXFYtzaqZ2TQ5aoIg+ch9
         J8+rII0aNOP3aeZUHLwsw9M0SP4PIO3ypaZQgwB5fS2SvCSJV579YPVzaJwUGCnFzfra
         j97A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=XGJIZDe8e48mjnd3S1UnH/xuMhjquSRYJ/YgYFRxSl4=;
        b=MqsMPlqIrXdeEXrtl7Ydn98zSNwW5sqKoO/7R4nvU4EEHW2oBDPy21GqpLifUd0cp4
         2FLMkEOgj5dZV3AgVwsbhwcwQq/NoerpkP1NOdkHyfFlj7x2Fs6nKO6jq82ae5pDLccO
         qAqOM+M1XC6si18yKdmKqRGxQRebBDGN0I+uUzP8NoJ072D4xV5fO39HND6/47Iaose1
         Lqvfn2mR1zXTjrmwv8m8F76Eb+wRQ5DfVxfT4al38qPuvvBwEzH/6yQ0cN5EfN9zU0/6
         4y9qeOLlpXNP6PaBjhLDBT5gXrNvVlFVmCpw92hnE/G6NXFt58DVwVUtfF0BzDCyrSy0
         3bYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W6SHTLM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l32si8823796qtd.42.2019.10.11.06.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W6SHTLM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvRW-0008Bb-Go
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39301)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJM-00064k-2X
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJK-00049S-Of
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:27 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:37194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJK-00048u-Hh
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:26 -0400
Received: by mail-yb1-xb42.google.com with SMTP id z125so3119843ybc.4
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XGJIZDe8e48mjnd3S1UnH/xuMhjquSRYJ/YgYFRxSl4=;
 b=W6SHTLM1x7e1T4AuRr+qe1lW5dgNk0JSG4O6ttxTNvnWs2DoR4p80QHSkJ5IGkf17R
 w2a1AAZX4NwS1586L6OGsSubrOml5J5is/pFeobTC+rVhll7oaiXCN3Ahq7ziuAbKK/y
 7hA105SQYNrRHpCTot1wFywnaDN4IEMqc4HqlnezwsYtDlNGJRYqqOIEeCXppHrT+r4O
 j2KZX7qk/v4mNoLDyXO3PKf5wGEi2JwpQA6kkw5OqmbENZatIPElawjV8rWzqglyz4Jc
 AT1LQwU2ZLlu4za50/KHujxayAZdN1ZsbPSVKZH0X9ZOXxAPVzmhKLpKfXlhYcKieXnf
 0quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XGJIZDe8e48mjnd3S1UnH/xuMhjquSRYJ/YgYFRxSl4=;
 b=YyoQ7G5FWGgBM3kM0WFC1Hw0CQgLyGzGHLtrjJ7ZtkKRepAVET4VO5OOyWDETjyd8R
 yEWqIZE6OeuMEdDZoW+Z+ebRzxueHggBFz64+MSGBGPEIKyuqhzZPe32Uxg16UceJwQb
 eNZqFWdj3Vy1Kpk5hcUb/h/TY86fGVwYqIUV3XSx68yxB9Gnix6dQsLkdYSEJ+O3Gfpq
 wRpdkI3WIn0e5oB2tdDQGOSWYitMoamK/LofRTK9Rnvk6Y7+SYgNVVMcv8aQVA7fGaGU
 epQX+R6rm2c/+ae2gQ6XJxF64YnvFjUKX5z2Gjw1SNXpZ8bbLFiSiEM4tEI5fS9w4RJO
 reKQ==
X-Gm-Message-State: APjAAAUJztseCrJllaJhEizgEVwdM3RKw0BNLaKFKbEZk6CueXQSTBJa
 GoNpRUT7TOI/3F8+0MnB7iEkiA==
X-Received: by 2002:a25:3041:: with SMTP id w62mr10789764ybw.67.1570801825958; 
 Fri, 11 Oct 2019 06:50:25 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/22] target/arm: Enable MTE
Date: Fri, 11 Oct 2019 09:47:40 -0400
Message-Id: <20191011134744.2477-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b42
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PDGneGlLJ4FO

We now implement all of the components of MTE, without actually
supporting any tagged memory.  All MTE instructions will work,
trivially, so we can enable support.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 10 ++++++++++
 target/arm/cpu64.c |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2399c14471..12fffa3ee4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,16 @@ static void arm_cpu_reset(CPUState *s)
          * make no difference to the user-level emulation.
          */
         env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        /* Enable MTE allocation tags.  */
+        env->cp15.hcr_el2 |= HCR_ATA;
+        env->cp15.scr_el3 |= SCR_ATA;
+        env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+        /* Enable synchronous tag check failures.  */
+        env->cp15.sctlr_el[1] |= 1ull << 38;
+#ifdef TARGET_AARCH64
+        /* Set MTE seed to non-zero value, otherwise RandomTag fails.  */
+        env->cp15.rgsr_el1 = 0x123400;
+#endif
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d7f5bf610a..ac1e2dc2c4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -350,6 +350,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.17.1


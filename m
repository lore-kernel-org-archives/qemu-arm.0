Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp103410wrp;
        Mon, 11 Feb 2019 15:53:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbbLeMRQuNNVprOPfy8Scw96226kpMQPca2Rtkd/Jbc1M43O0M/B7hmzVUGwOsTLLf61/80
X-Received: by 2002:a81:6087:: with SMTP id u129mr629570ywb.115.1549929229111;
        Mon, 11 Feb 2019 15:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929229; cv=none;
        d=google.com; s=arc-20160816;
        b=qwWtp7E5D0q71JurDqeBYDmUwUDB3Um35AmGF4E4RHNh1KZdOGv0s5rMe32PciyW0K
         N1kPHV+d8rJQZpN+npARUaRJ3HCioB71tYJ4mi8UfjcfBTKbKgaccwFegepoNEt8EodH
         jdZ5fSm3h66aR0rw5YCbkEI2EFNntOZxncoRtnourhBtErgPQCBGIMMak68GHvRejNCc
         rGLPGjeprbYrXnFxMlm0NZjYkArG3dyNC1Pr7N4fwXX/OT9Fc8PptVcgeMYTKSHlsUP1
         KWdPwqp66zxL2UEVgRE8zMiaS3B7Vvf1jq7HFK0EpaYMthKvozSIVHIPNFMjZGFpkTRT
         qfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=U/D4l6oEbeVfp8+t8gRAbmKwAQMWeg+He9HLmsCdEd8=;
        b=0e7I4dfnSt7WjBn2cqrtTd6Y2xguTrq/4kM91OCLQd4YtubLVRRscEKEcYa3kMGUKB
         hh0athy5s0V2SgC2Ec38+rGZXtIllgINQCm9JYIg5FjZ32kvu7WNZi6Gz/rTiYlxuALY
         BV4BIHWVgtkSbAmYtYyP2Q9qFxn8KNfEfoDWm0WRr512zGWH4UscudU5X8lIyINiYAoH
         Ogg7+v11KKjsNNL9iAHmmQh0L/alkJBgYWEJ2bw0RHzxy0QAGQq8ikSQD+6umgsEGFXD
         Fc7ZcKYHgnHKdHrF/YPBV6ZzomrAtHZC4clDzGCi/NN32j83YseUcGq1s6WLsdh4ufi8
         G44g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yXtHJj9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si6317681ybj.173.2019.02.11.15.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yXtHJj9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLOW-0005R9-IB
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0005Me-F2
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOC-0004Y4-5F
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOB-0004VG-UL
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:28 -0500
Received: by mail-pg1-x541.google.com with SMTP id m1so314466pgq.8
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U/D4l6oEbeVfp8+t8gRAbmKwAQMWeg+He9HLmsCdEd8=;
	b=yXtHJj9A0xh1tU/MvUGbr9MqdbBUSpW+sWIsLaEfg3MuyeNmkK7cFvsj7OjFmbrwWu
	RG/dfxG8/16hQkHiCNinPoguazaJVALwo2AVfm9dCCy29c8ri7ttgIyxwleETawQmuZU
	UCYtZVetEhlM1X/i48O1kKjy8RpnyKqvoPLULYW+6gHrU0yUhe4VZoGcyDPlEW/jghYo
	aEI8rDfC8yKnWiDXgRQtX7Y9+XibMrxzRGncH+RCbEALrwAQSbs7c2Las9p+8OP/78v4
	dOrglZyEdnw6m4t83c5xRqKu22fJud/khYYfNa6gHMJKByKzCBP2q4SUkO3xw8KWAT8U
	6hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U/D4l6oEbeVfp8+t8gRAbmKwAQMWeg+He9HLmsCdEd8=;
	b=iN/fO+DoA+IkjOhwWe3O+CVGukXC/eh/37teU1yhtWRPXWVjto2SmnlIMxtiN8/5IP
	3sMTM61O0ElUKr5sZUgJ1f+FlNuep9ToLZxF4IAbbFDeaJP0oFLNbbMvQxlvGxxM+wyM
	I+WvEVtGfwF3Yrm0xFYDsvSru79ekFu4CvzwBjtmIL6Mc3f/euqfLyrwRyKpGK6KsEkq
	NOnHRssm3Dkot8qOh36fCSByC5FdZCO89cE0iWJNZwu5fTD8BVwa14e3FXEpj4rGlYii
	0MDgFYmRrhbe+MMdYiSMN72Iurp1tct7FwAgLNSn0b+qcDfI+idMNKPsIIRqCt1CQqGY
	iy9w==
X-Gm-Message-State: AHQUAubwc8QFDmYCo+5An00URfZzlwtmnNbkF8JKuUZmx8kXTzT+Agu+
	/O4EaMUFUCBKru/1zjWEPdEnJA==
X-Received: by 2002:a63:5922:: with SMTP id n34mr789964pgb.435.1549929205011; 
	Mon, 11 Feb 2019 15:53:25 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:48 -0800
Message-Id: <20190211235258.542-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v3 18/28] target/arm: Implement the access tag
 cache flushes
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
X-TUID: WXJkCbAp7AE0

Like the regular data cache flushes, these are nops within qemu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f8e4e6f8ae..ed1b258497 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5793,6 +5793,54 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
       .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },
+    { .name = "IGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "IGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CGDVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
+    { .name = "CIGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W },
     REGINFO_SENTINEL
 };
 #endif
-- 
2.17.2


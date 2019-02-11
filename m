Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp114584wrp;
        Mon, 11 Feb 2019 16:08:00 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbwdWpn8yUDTgZalU8q8ubSEGCxZvgubtXvLm/kikV/sr7JqgWN6i3YrpiWco2wz7wjC8/S
X-Received: by 2002:a25:3055:: with SMTP id w82mr717834ybw.216.1549930080560;
        Mon, 11 Feb 2019 16:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930080; cv=none;
        d=google.com; s=arc-20160816;
        b=TPdeiK4gilXixrsVZPAtWREKegldQ30uhlsOx6WeV2byPhH7ZktvJilZ3ebgSfY6fi
         DLxnJeTDcdrLve1DaSvYbsGrP3pSiiUlTLTLdEUPpplqedJWXWr1p5oGVYkVugXB567J
         kR5lJgJCL16/TG3VII4/9tLIiOZWchU3IaXzq83UEIXx0PqXk7+7+CdhELQk0VZybEVB
         vVfqt8kjNv/HJKf6VnyvPep2PptCpvpzCxuN77v6s1pYahb7cls4CxD5yMqjY8a3hWmM
         L6xxCy9N7mQs5Wkio9fbynU5YvIpubq96FvthP1SSIytiDkerqNiiWVkgpwQ1RvVu0pM
         Z6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=g7oNh1d8VWGEQw+YCuZLsLZ9OlLSdLVyb8nPu7OZ0AM=;
        b=f1DhGsfSsQFts8Tfc4R4XWI+EoJwP/t2AC4OzbwTeHG8KqZI0rHq6qbyTrTK2UwNYB
         87111yux4PwDzGidWMJin8FTIziX9Mg7Lbq9wcbFglV9VY8sa/Yr8LrLv/VoZiWS6xLH
         3ceer6KuMhHkekZheSEwkCDCQ4bVpmJunY19TYB4TC0WE94xCAw3a9PkZxVPDZZrtwFk
         IRM7mrm4Q5ctbIY990BULPmCdsrAVhwyRu1IT6+NDOhZHB2Bk7HowoY+wazJjyNBvNK9
         2s7iwX4VvZ1+lA1R12E5vS13Xc9MARBCgeItMFDpX6o4Yb1UJDQYp2kbD3N//lX+tSos
         5Omw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="W1/tgCF5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si1685488ywa.316.2019.02.11.16.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="W1/tgCF5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLcF-0008E1-Ri
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOh-0005sL-Pm
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOf-00051a-Lk
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:59 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:40693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOf-0004k3-6A
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:57 -0500
Received: by mail-pl1-x642.google.com with SMTP id bj4so328327plb.7
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g7oNh1d8VWGEQw+YCuZLsLZ9OlLSdLVyb8nPu7OZ0AM=;
	b=W1/tgCF5U4YtukldkxB1PagvZ0FLkJZUzhnU3ZjVhiuaBL20g06kGBa07g+VKlGSFs
	W40seklOowkg7Sc0MdHkKPQcz6w9FxoDAO+aQN1oGnFqnvhJn5Om+y4OJQ5OtsSmzmqf
	ulvLLGoteMCtHlHLktohNii6qJ9grcEoLXMIoSZncPVTXrgLtPxxix0+8ep+jmumBvQ5
	8erevH4S1OZeEagNrwRpX3cLwRZZbWx9/Tzrsyaf6ozCKVPE2o5Vr/QZmKzgpWVb6RrD
	CKrOYsdUNZIA+7CzichGB8LJPBa1HKQyc13ot27/wcpqbtnv1eKTPJkt71Rg/huepOaW
	7uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g7oNh1d8VWGEQw+YCuZLsLZ9OlLSdLVyb8nPu7OZ0AM=;
	b=mXYssk8kM/kNEDitDOm+dBTMP/N76SgMROQorWaopOeYa0cXKmyb1pFg2gB/klV5QX
	oM+MBq4X2PkYBQbgOj1mUaVo8kaR4bBZvzfMzeGRNQvUYq7d5AR2EWp+nDSte+nccCrb
	lyI5mOo1d0vcoz3wVsPEcgafzDWDVd6yMDFlrnpHnmxYKmVqyJtGNhH6LBPSp+C2OTIv
	f2YFkwsOjriRfL3mQNzOy2mrdE4Gs+Gdqoh5WMyNl/k/PzYO7ae+2iQcnXVW00tC6Zzw
	dgWKX051n6LEH4BvT3hpk3vgVTUoPmqd9fHofkKnWmpPEq5srGrRh4MGYAdxWTWQZWM0
	WDHg==
X-Gm-Message-State: AHQUAub83Wn77/hAXGvJCB6r54nyW5qfVHos4xdEXuGUMHFTX0ur3PWm
	QEXEB7GOyuyXLgZwgZe1fKlFmdZlXp8=
X-Received: by 2002:a17:902:9008:: with SMTP id a8mr971403plp.38.1549929216742;
	Mon, 11 Feb 2019 15:53:36 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:57 -0800
Message-Id: <20190211235258.542-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v3 27/28] target/arm: Enable MTE
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
X-TUID: YyFDvIURwcom

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   | 10 ++++++++++
 target/arm/cpu64.c |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index decf95de3e..a5599ae19f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,6 +206,16 @@ static void arm_cpu_reset(CPUState *s)
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
index 53a7d92c95..7bd761b8f5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -352,6 +352,7 @@ static void aarch64_max_initfn(Object *obj)
 
         t = cpu->isar.id_aa64pfr1;
         t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
         cpu->isar.id_aa64pfr1 = t;
 
         t = cpu->isar.id_aa64mmfr1;
-- 
2.17.2


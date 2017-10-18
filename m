Received: by 10.223.197.9 with SMTP id q9csp6175444wrf;
        Wed, 18 Oct 2017 15:41:41 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TilFb7mdHpl7Xf0oYMqrQr8WZOKEeBEqdufJT0GoJFyjJeIB1T4poyJWUQgppQqrQIUlEg
X-Received: by 10.200.45.178 with SMTP id p47mr5255652qta.263.1508366501374;
        Wed, 18 Oct 2017 15:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508366501; cv=none;
        d=google.com; s=arc-20160816;
        b=qcBxuJfrsKL7Rq2lsH14AnpAnRFX8sU4KKY6S3BpTB4vuv1SsxL9wx50xaexLUNzuS
         k5ZG/B0FtPkqkxu5sWEdnVDAWUIkEeXfIIae1eFFXQWmSnEYFL+BbcpM8zPnVCn78Byb
         xQTCy3W4SNyKrZWB5ug96tQSOciwTEwEwUbxlrtRR0Fi4EQsOt/XxmFAgBJk6KzM8g9T
         10YU6JAqCWz17uX3NMWjsJvlXss1jToHIG8afKJljlO7TZtPNuo0CFGvq0oy5HKZc+LB
         xkQfANgSwb1Nc5scevAoRKFwgwYqqQExN01fZI8MdxMDE9JYvGR8Do4IFLOxzi69wVMn
         623w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:to:from:date:dmarc-filter:arc-authentication-results;
        bh=26yCz52jAJpEGyZ2qc8ypP+yPrEyY4QagrSACK93Jvk=;
        b=mknZAWUuj7pH0n4dTyRj+rdAn8MF+owVlpXFz97WDOiIHyzlq9VCpyi+gFwp5tFK4X
         c8tnk2BwMakGiY04PwVpYE73Vwt5twO2V5DF6DcpTBbAqDlu8Km3KFUAkn9kDqlNoY6F
         WWqcnhny/B7tnmjFhYBHrL/w1Sg9L1tbSODj+CYu1Aed/VRJr4BducfeLAPauRuT0n06
         iz624e/Ea6sR7oyzKuHUO10so64t2c3Lf9eNTGy+UskTDCskxliLuHUAt/HkcKhwS8EC
         p3vPMkYlCZrOdz04hI+buTTd4fP7xygEU5VTGR72MVcLjmNTYpw3zSHCodpxdovX8HsA
         GNlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si5313264qth.379.2017.10.18.15.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 15:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4x1v-0003l4-92
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 18:41:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e4x1m-0003jm-8J
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 18:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e4x1h-0001XQ-C5
	for qemu-arm@nongnu.org; Wed, 18 Oct 2017 18:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:38724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e4x1h-0001X0-5x; Wed, 18 Oct 2017 18:41:25 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B88B920C01;
	Wed, 18 Oct 2017 22:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88B920C01
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Wed, 18 Oct 2017 15:41:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: peter.maydell@linaro.org
Message-ID: <alpine.DEB.2.10.1710181539580.27209@sstabellini-ThinkPad-X260>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH] don't hardcode EL1 in extended_addresses_enabled
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
Cc: qemu-arm@nongnu.org, sstabellini@kernel.org, qemu-devel@nongnu.org,
	julien.grall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pjmUksn2G0G7

extended_addresses_enabled calls arm_el_is_aa64, hardcoding exception
level 1. Instead, retrieve the current el calling arm_current_el.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1f6efef..63507d9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -187,7 +187,7 @@ static inline unsigned int arm_pamax(ARMCPU *cpu)
 static inline bool extended_addresses_enabled(CPUARMState *env)
 {
     TCR *tcr = &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
-    return arm_el_is_aa64(env, 1) ||
+    return arm_el_is_aa64(env, arm_current_el(env)) ||
            (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_EAE));
 }
 

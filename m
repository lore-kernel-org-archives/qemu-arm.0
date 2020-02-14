Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2211863lfp;
        Fri, 14 Feb 2020 10:04:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqz+i34DXnowYxvCZ2Olled1g/BwUT9oaYaYqLqPo7/8CBdvkPxD3WZbSJLJ08jopMmRDwpH
X-Received: by 2002:ac8:4a02:: with SMTP id x2mr3603036qtq.388.1581703483478;
        Fri, 14 Feb 2020 10:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581703483; cv=none;
        d=google.com; s=arc-20160816;
        b=H1E+qDjAhJEB3G/TWfhRLHVwBmyEIGAFKcpiWMCR+15uSLJc2mP6+T1ND8bYAcExyn
         9HaBBDYB7CaMGExsZbWLQhphDh9luWH+dp9SCB/lNuhDnC2NfNWxNlREaXBzN29T04gJ
         yN63l1Y8IMMoDlfMz7/Uo+DmelKE7OiUn1k15NDYMRWeKj13sDZ+iHLcyKGNR6hdnFZc
         l6XbOP6Bt15JBu+f/D1oqUz7q1EgJMhI8QOPHBc6lxuPqpXLz2A0OOeYmuwrh+YURPcu
         Qrkt8cPxw3W/6as5JqhOz0I2+uG5TGNIl7cMxSSast9n8/Q2oOico6CUIzHi1HVVI8qf
         sZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I7VGzJKa0emO5iag6GpwHNYHbTYM9xvXNaLqgVHooL4=;
        b=L3HKGjC9dRggp+KzfLf3/oJB3DV0tfhSPsXGqOWAXJWaF56KkhU2ObsWevuip95E1f
         P7338YlZCS9ekMC9zP4jDTZYOyje6NqBzEjXcHURQSpkyxkkUKPCx70PRtv5yD/cw5D0
         sBOMVq37kegtLoXXgVBOJ5RKJiplO0+kmIzmyWkLRVeO3IKcypOjo4P0sFr4Ah9HRLLT
         dFmjlN0Oe5AQB3bLAlsF6BoGs+VawoI8IoJJZT2j5jfJo7BDzXski7LAFYvPhOEQYpGn
         mdBd5Q3PjesI6vw2lji9hKS5+GHxDdjzaIxpSRrWCJ08k5sEPWOXKYDXvFyK+0eho9M+
         ZQhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="mKoc/y89";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q184si3425189qke.300.2020.02.14.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 10:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="mKoc/y89";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fKU-0004BA-Sm
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 13:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7y-0006Bt-Ve
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7x-00019C-TY
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:46 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7x-00017B-NL
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:45 -0500
Received: by mail-wm1-x342.google.com with SMTP id q9so10829760wmj.5
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7VGzJKa0emO5iag6GpwHNYHbTYM9xvXNaLqgVHooL4=;
 b=mKoc/y89McFeR3+YyDh2nlQqYLnNRHzAyph+9ZMPYXnpyCs23OVW2JrjyDK/6bqERB
 FD9eXNOnHA9s7hz0LWQKGo+eWKMgJqT3f5gzjWNwJtcBF612R69bfky9l9M+IMgUDzbS
 cKBJR1woYwsVVNLsDL6gxs8usCzeo2ajQzjGuU0OuBV2a1sqjO8YJhsFJVojkA1/vUKd
 LMwNvTUNz2MJbdrffZQVBVHwV9kvMSn0eJM4y9oLCMkSpT9TOkXSrJ8FQ4FHkFxZzB9J
 u/eiVSmK8pOLwGaIjffPIQ/F0t8HPfwK94n50GJDJ2HNcLysTEnsJIiyp/mZXOGpwYB9
 aoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7VGzJKa0emO5iag6GpwHNYHbTYM9xvXNaLqgVHooL4=;
 b=Lx9bi4WeQZ4D7DjMCLleWXnBSxXTK/aPnfC5ZyMjuwNDv8OcWSaQdlE/8YeeuridTl
 nWHvCCn7rbg66Iu1GyrtbVm9MIxjmuMVNccdB7MjMODEMxyiDf1tSCVyhBV77Li43X+B
 FGUWn4qZy1HfDBFm8lEX/fNQaWpvmw8RUkroe9vg4y5YMiJ8bIggIN1jQ8QfVn9YklqE
 nsIWTvoLkiPEhbAyB6P0WWUvohClplNlHzxHMs1R5yzVdHRQ4vDKVI4KuhnYDIaRBbSf
 m4IY2I6UvWeZ0V1GUzExud8+1bL8JpADAp8wSoKYW8NAPVvkBaCZC1PGBLClVI4BCQ0b
 lGlw==
X-Gm-Message-State: APjAAAXPUO8eEWHmCyK+NTCZhdz6GRb5XAZXMJcG4VA8ezIww8nyS4+A
 YMNHt3aFdR6n5wkV21YYbC92fhBfaIk=
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr6110868wmf.56.1581702704511; 
 Fri, 14 Feb 2020 09:51:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/21] target/arm: Use isar_feature function for testing
 AA32HPD feature
Date: Fri, 14 Feb 2020 17:51:14 +0000
Message-Id: <20200214175116.9164-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H2HGSI39BQin

Now we have moved ID_MMFR4 into the ARMISARegisters struct, we
can define and use an isar_feature for the presence of the
ARMv8.2-AA32HPD feature, rather than open-coding the test.

While we're here, correct a comment typo which missed an 'A'
from the feature name.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ba97fc75c1d..276030a5cf3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3526,6 +3526,11 @@ static inline bool isar_feature_aa32_pmu_8_4(const ARMISARegisters *id)
         FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
 }
 
+static inline bool isar_feature_aa32_hpd(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_mmfr4, ID_MMFR4, HPDS) != 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 492741a2b0b..56b1c08f027 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7408,8 +7408,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     } else {
         define_arm_cp_regs(cpu, vmsa_pmsa_cp_reginfo);
         define_arm_cp_regs(cpu, vmsa_cp_reginfo);
-        /* TTCBR2 is introduced with ARMv8.2-A32HPD.  */
-        if (FIELD_EX32(cpu->isar.id_mmfr4, ID_MMFR4, HPDS) != 0) {
+        /* TTCBR2 is introduced with ARMv8.2-AA32HPD.  */
+        if (cpu_isar_feature(aa32_hpd, cpu)) {
             define_one_arm_cp_reg(cpu, &ttbcr2_reginfo);
         }
     }
-- 
2.20.1


Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp684841wrg;
        Sat, 15 Jun 2019 08:59:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4QecJdEfazrAGnMFtfiBctJbMbGPk+RtChCqEKWmVn2PKc9XevL+izwEzaR+ZId59MMtS
X-Received: by 2002:a0c:8722:: with SMTP id 31mr13571600qvh.164.1560614386738;
        Sat, 15 Jun 2019 08:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614386; cv=none;
        d=google.com; s=arc-20160816;
        b=So/n0tBxttb1So3XbuzaoB2uEhVSGuR5Vphw58cX4EkoWupvvt1STJGXRaGGuMbtdS
         DqJMl2Uq1XxMLeod86fX9ZssRZ0bcfA35u1q3t//rKdApZvGpIdZ+1ig93UrDnXAeYvX
         Je/0rtwzqp87p0g47E0Yy079oiFDylQp05oHwx6aqNVMrlM7KdA4/N/Z2EaxbYJuSCes
         qTSgEwDFtZcmYPh7PZhc5sHjNxrd4yBMrfHPWR+INfwHD1qxAj3fMJWks5mt2sDoOMLJ
         sdZkZIbVjsAPVGpA0stBruFgJlSjnvb6vnX725zyOVJQm0e/TlNbXzfisJFYHnoTtuF3
         8Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zkcocp8Aq4UnFdcgn1e1FJ8kQLnwW/GyZ+0NqUC1VqU=;
        b=mr3cFZYlahhiUCeqNzzQ1UlMsLqMJkRHx0DOjJpAYEK3+exOa55QE5B/zgl7uxt1S4
         9uKtmjmIrb09rSfylCuPUHySvVfrXF/mUrFXOeqZUiBHQ10xQPjcUti/cwuKl4OFyYwZ
         JO0firtPYA0IPrZHBkGZypEQz3Zt3pCXHsDPPKyrOJYvhEVMPxJofCPeKLURS9Td/CSn
         n/EDHnWUNJkC7CUUdxs/oOGhJTtCLB6ISMUsEgan/DrNBf9spLn6fFvplqy5A/clj9gZ
         SVBwVeec2ubjRZduN7g3pMqO83pIzRlk4o7JJOuJRMkHIlKqpSqiUyp8UIj+wxTsaViR
         X3Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l28si4138343qtc.376.2019.06.15.08.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcB5m-0001c9-9I
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAr4-00044S-1R
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAr2-0000u4-LH
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAr2-0000oz-Ax; Sat, 15 Jun 2019 11:44:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B465F2F8BF4;
 Sat, 15 Jun 2019 15:44:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 753FE1001B05;
 Sat, 15 Jun 2019 15:44:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:45 +0200
Message-Id: <20190615154352.26824-17-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Sat, 15 Jun 2019 15:44:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 16/23] target/arm: Make arm_deliver_fault()
 static
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 61tlFutagxzs

This function is now only called within op_helper.c.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/internals.h | 3 ---
 target/arm/op_helper.c | 5 +++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 37ca493635..06e676bf62 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -767,9 +767,6 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,
                       bool probe, uintptr_t retaddr);
 #endif
=20
-void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_typ=
e,
-                       int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
-
 /* Return true if the stage 1 translation regime is using LPAE format pa=
ge
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx=
);
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e43c99ebf0..63bce32810 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -127,8 +127,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t =
template_syn,
     return syn;
 }
=20
-void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_typ=
e,
-                       int mmu_idx, ARMMMUFaultInfo *fi)
+static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, ARMMMUFaultInfo=
 *fi)
 {
     CPUARMState *env =3D &cpu->env;
     int target_el;
--=20
2.20.1


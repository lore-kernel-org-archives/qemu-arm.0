Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6728641wru;
        Tue, 24 Jul 2018 05:00:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe94MMbXQxJ5Zd4rgWiDsZJejcr3/oHedsqcKVy2GdvCcemYrqjK/Isc/mHLAOsJXJ7g1Lq
X-Received: by 2002:a37:9904:: with SMTP id b4-v6mr12491020qke.102.1532433608288;
        Tue, 24 Jul 2018 05:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532433608; cv=none;
        d=google.com; s=arc-20160816;
        b=JAD+JLqYlEea8j/NbT13HCo6NAzkYeG0fks4zxsOLTqG9EDlP6xyDhhzs7zKGKTuub
         pTO3sy4LdKdfDf4oLZJlGX4wDv4MjGvT0Zq144OOxRTcZjGrdmsYOQMjuamsduZAftlV
         g/5aGdhssNCToluOe8EEtgyPFvtKMQsuegFkbN1/46+5NKLYa/mOmY7XhYeh0oo7ekoK
         ScOZAkBEDHA5X7wQYApEK6XnzjaRqx4VCTdb6prhUGBJ6u5glBz45Ra08fqZOcUutP0Q
         2lX5msWfYPyADfP6l9yZZeoww7xTo9tn+RXsRn+L0F0IVeKQgoylljxqXHKn55smH/Ai
         fk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pL+4spCQMMlMmgsz58D82B/NetNSL/kz9hbPKJGjYSQ=;
        b=kIR9aV/0TOj0w2JQfipbxmUrCr7moiXmA6TlUZl7z9+prw72N9HgU/O/a3B+/ODDVY
         iGOqpmjpxxfEu1kk3LwkmCEvNVmGTBi9ehqXUa/NTycxFEb6AJEPbMPFYewGRkd6KNDf
         PDr53bwZ0BjALwGD3IaU3TBFVlf8HKqtNkOgigjxGwK1dP/MXowwxKLNuWGOUxNiaAd5
         OX402MxFzqrXDgxJ+ktQLUG6plkXOlghnWvY9CsQrE10M8EKAEThRHKycXQkWFEQNn7F
         MNORfhPODyLc5ddcMGdpMrBg9jh5yHiQu/Zz7Cunho8xgHJ/PcTrEmwOKTSZYQLE7aI0
         ecDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n13-v6si4703024qvl.82.2018.07.24.05.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhvz5-00089m-Kh
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:00:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyu-00086x-AC
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyt-00035p-Hm
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:56 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhvyt-00034o-9d; Tue, 24 Jul 2018 07:59:55 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhvyr-0008Pm-QK; Tue, 24 Jul 2018 12:59:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 12:59:48 +0100
Message-Id: <20180724115950.17316-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724115950.17316-1-peter.maydell@linaro.org>
References: <20180724115950.17316-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/5] target/arm: Honour HCR_EL2.TGE when raising
 synchronous exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2MafcfUeG4y

Whene we raise a synchronous exception, if HCR_EL2.TGE is set then
exceptions targeting NS EL1 must be redirected to EL2.  Implement
this in raise_exception() -- all synchronous exceptions go through
this function.

(Asynchronous exceptions go via arm_cpu_exec_interrupt(), which
already honours HCR_EL2.TGE when it determines the target EL
in arm_phys_excp_target_el().)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index f728f25e4bf..d550978b5b9 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -33,6 +33,20 @@ static void raise_exception(CPUARMState *env, uint32_t excp,
 {
     CPUState *cs = CPU(arm_env_get_cpu(env));
 
+    if ((env->cp15.hcr_el2 & HCR_TGE) &&
+        target_el == 1 && !arm_is_secure(env)) {
+        /*
+         * Redirect NS EL1 exceptions to NS EL2. These are reported with
+         * their original syndrome register value, with the exception of
+         * SIMD/FP access traps, which are reported as uncategorized
+         * (see DDI0478C.a D1.10.4)
+         */
+        target_el = 2;
+        if (syndrome >> ARM_EL_EC_SHIFT == EC_ADVSIMDFPACCESSTRAP) {
+            syndrome = syn_uncategorized();
+        }
+    }
+
     assert(!excp_is_internal(excp));
     cs->exception_index = excp;
     env->exception.syndrome = syndrome;
-- 
2.17.1


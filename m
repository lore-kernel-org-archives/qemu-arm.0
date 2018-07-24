Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6729042wru;
        Tue, 24 Jul 2018 05:00:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdSe2r9QLhaQD9JouPXlwfpEDvmA05P8yN3vUHFtwBiifLfzmC9FVKb99+pLdK/9IgJ8CYi
X-Received: by 2002:a0c:ba0f:: with SMTP id w15-v6mr14719736qvf.9.1532433626574;
        Tue, 24 Jul 2018 05:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532433626; cv=none;
        d=google.com; s=arc-20160816;
        b=kxA+AsNaTDIm6QOXX+UoWep/L+3zjaqGrxSlAw3aVxENbBFDx5CgyEpLc09X0KniNL
         lFWVhgZCIgNSEpfVW7siVLwZm94OwVSKNvIVUfAnNQqhc4KvY9ytBIfMCloZVhh/aVo1
         L00zKqZz/SaR2CkYPeQPgoyFiIbT6s/4zJ3QIUZbIS2ZiMSAeLYN0vwmQ4QAFqrtd1XO
         vXtRdOGhrNlcfAXkyrt37W0i5A8rDZgLkdEOSxn6ByuouuK6bYlhuIYmhdYYlxTZCBe3
         k0Rrrw7QPyijPzu0HGkUmEsHJCi+3Xmz++a7nhC/xjCEbqtWjsu2+ftj5PUjM8/XAaWy
         K29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JJoXo0y76qJAFHHw8/8igcdqHtM2YZh383JPCE8rHk8=;
        b=C84OD+pz2Dishz9b/bmdZ8HsaZwboqALazPnmFprowLRdGpRUrXfCzsLf5Vddetchr
         L19RubxZIejgHL+tOjDjYgrtzBdubh0zdNW0cQoisS/wqU+6Jwi+o1g8OGAFtEVl7DFn
         s6Bux3buMFY3xsoxfhzj7iWGItNmos6Dg+VfpDuSqhfdkuXA06qws/gav0sdDwPF2zPr
         TtcZJ6YrSmOWqM8VmERvj8f7oKwI/fwHmeiwn0bK+fSRM/eDH87UmKwOrecH0uMFC5gE
         1ysJCvpLOCVBtbkBv7qcQPJVVR+9cfbaQF6VEOZG0uzX1QADq1D80lw4biyf3a6Zd1MJ
         g7kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d4-v6si9358586qvk.287.2018.07.24.05.00.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 05:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhvzN-0008T5-Vo
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 08:00:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyw-00089q-1f
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhvyv-00037G-CX
	for qemu-arm@nongnu.org; Tue, 24 Jul 2018 07:59:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhvyv-00034o-4u; Tue, 24 Jul 2018 07:59:57 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhvyq-0008Ow-Gi; Tue, 24 Jul 2018 12:59:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 24 Jul 2018 12:59:46 +0100
Message-Id: <20180724115950.17316-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724115950.17316-1-peter.maydell@linaro.org>
References: <20180724115950.17316-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/5] target/arm: Mask virtual interrupts if
 HCR_EL2.TGE is set
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
X-TUID: 6bk1ZL8Aq3D/

If the "trap general exceptions" bit HCR_EL2.TGE is set, we
must mask all virtual interrupts (as per DDI0487C.a D1.14.3).
Implement this in arm_excp_unmasked().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e310ffc29d2..efb2a8d3f3d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2261,13 +2261,15 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
         break;
 
     case EXCP_VFIQ:
-        if (secure || !(env->cp15.hcr_el2 & HCR_FMO)) {
+        if (secure || !(env->cp15.hcr_el2 & HCR_FMO)
+            || (env->cp15.hcr_el2 & HCR_TGE)) {
             /* VFIQs are only taken when hypervized and non-secure.  */
             return false;
         }
         return !(env->daif & PSTATE_F);
     case EXCP_VIRQ:
-        if (secure || !(env->cp15.hcr_el2 & HCR_IMO)) {
+        if (secure || !(env->cp15.hcr_el2 & HCR_IMO)
+            || (env->cp15.hcr_el2 & HCR_TGE)) {
             /* VIRQs are only taken when hypervized and non-secure.  */
             return false;
         }
-- 
2.17.1


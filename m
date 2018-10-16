Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5624036wrt;
        Tue, 16 Oct 2018 02:37:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60ZvS2b4mci1onugWqWHYgC1x9n0eq/KhdYnGJ13MPLyt/h94d/oELfc6EPgaEGbCVx6SHp
X-Received: by 2002:a37:ec3:: with SMTP id 186-v6mr19410644qko.236.1539682655531;
        Tue, 16 Oct 2018 02:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539682655; cv=none;
        d=google.com; s=arc-20160816;
        b=BlPXwE3q3jGFiq7zjv3GRTS26yAuQ7/+lMPSTAD/udjSqOR32pwMZAGdz31ikUsYdv
         uJhhLaAdVyv8a73vliS6eEtHxq8iswnVS/pzzHrruiWMns2fCznroMrgJo+NvHRZl3q+
         mICcsc0C5sAX4pt9N7wjogIMsq6uzIw/w452oUeI3q7KIJc8YZ/CJ5c2llbqtl0yMSlK
         rrKvSMoHa/zjBV4Y/OhUP3mSKCUZsmU0b+9jXfxHanjelnaq3dFWLkuYuTpC2C5qNEbW
         VjxypV7f0hhE3ahEit/YxbHUMVFc/kSdYHIkfKPUBEbgmcT+GFqHlv1aFsI0mLdc9tcM
         udOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TWI0JLsWSvaiNlF/5BQgzp0jZ0r0RVNROZvu/U6jXVQ=;
        b=zcM2VwnoWbGPFim2XMXK0pB5U3Jun5VfBYbPukjS9/BThi3wIWk47C6S/PNk/5t8Ro
         a8A3G8DDwNh74cCER91FQ3vNh5DQ5TbOWjhkvGPhk3suI7VUe2y/NrZyEZ8283fUXE+X
         C2Z0/KBD/qF5aB7hqa80i0CQlWNG2uDbIlzxrKV7DuYPNNcQvk37l829RBmuvJbGxQQz
         GNiTAbR8Y2iP03jWPiuhU7mjyCpYIMGBNjpW+c4KSrrz2fDLrKM6rYfn1RpXhJDYzrse
         1NmTy89pbggxDdqTdYmTkOxuaIbmXCqEMIB76L50IIHvQS1Oln9uii4SmIwkx7b8RKLB
         OifA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j24-v6si3745823qtk.203.2018.10.16.02.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 02:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCLnD-0007GQ-1S
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 05:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gCLmu-0007Ft-Rc
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gCLmu-0000yZ-4R
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:37:16 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gCLmt-0000qT-Oi; Tue, 16 Oct 2018 05:37:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gCLmm-0003Y7-Ja; Tue, 16 Oct 2018 10:37:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Oct 2018 10:37:03 +0100
Message-Id: <20181016093703.10637-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181016093703.10637-1-peter.maydell@linaro.org>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] target/arm: Fix ATS1Hx instructions
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
X-TUID: T9yG6yDa1ggB

ATS1HR and ATS1HW (which allow AArch32 EL2 to do address translations
on the EL2 translation regime) were implemented in commit 14db7fe09a2c8.
However, we got them wrong: these should do stage 1 address translations
as defined for NS-EL2, which is ARMMMUIdx_S1E2. We were incorrectly
making them perform stage 2 translations.

A few years later in commit 1313e2d7e2cd we forgot entirely that
we'd implemented ATS1Hx, and added a comment that ATS1Hx were
"not supported yet". Remove the comment; there is no extra code
needed to handle these operations in do_ats_write(), because
arm_s1_regime_using_lpae_format() returns true for ARMMMUIdx_S1E2,
which forces 64-bit PAR format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc849b09893..903a832f1fa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2316,7 +2316,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
          *
          * (Note that HCR.DC makes HCR.VM behave as if it is 1.)
          *
-         * ATS1Hx always uses the 64bit format (not supported yet).
+         * ATS1Hx always uses the 64bit format.
          */
         format64 = arm_s1_regime_using_lpae_format(env, mmu_idx);
 
@@ -2441,7 +2441,7 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S2NS);
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S1E2);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 }
-- 
2.19.0


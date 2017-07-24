Received: by 10.25.44.15 with SMTP id s15csp3951393lfs;
        Mon, 24 Jul 2017 07:33:36 -0700 (PDT)
X-Received: by 10.55.163.212 with SMTP id m203mr20179276qke.332.1500906816734;
        Mon, 24 Jul 2017 07:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500906816; cv=none;
        d=google.com; s=arc-20160816;
        b=H6DXWLsiocQvFS3aOxLuHT4Ja1SB13fpVCLfkCuZlsvYj7O1rvx6rLG8x1Sl8YORrw
         nETwMwJEpcF2t7lDo/wPBJJuyG8yupzFLnLc4K/7U7kCNu0+RYFDXxfg2NoJz2mmCabA
         uyRLOr/JyUa0fV/HhdAqY26aptvrXxq+Wz0i5Ueq20fbdELjCrSk1twXOiT1VVxuUkAs
         cF4abzn3E6HmkcXkIREGn1kLch2eTWz9NJbmiYFcs7ayek4cpntwWEYEQjjrW5ynFGyK
         jH+81Q11qh+tHtn3sHLWS8TYfosCp+kUSvkG9F/duUAg7AbJaqHrnyyyUOZFxfmywfph
         qDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=wV6I9klR8v0275Dji5MZpBJ2BbiIA7oUfX8t8tvAQX8=;
        b=D8dr8XhIsBN+M1fYZaRx7h6QJ5377DfiVCq8hfIa/Rp48jvWDPaIiFzwkgpE7VI7ly
         epYXEIfyHSGn9ftyOEpjAfd5h2ffZRABPzhpHoe3bB0MTZz1A9knIiCFAC49rpuZEJTy
         jTveoXc7lMGI4kjMd0EQsOoPZUWoDSPxUrsyaq3zT7FIsV6nZA2MZ52dVmwJyJFdGQNb
         wixkJfTfseHM19VjRaazJVFyM9dB7uaNJl1GTpIzyFkdSE5jm1+K5rZXpqhpcKE1PtG0
         3py/v0JDXL5eznk6B0n9dNEED3NqNoWyGYjfr98BMfdcdEz+dqSnjjdn88MNonbWldgc
         EBgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13si8135620qtg.375.2017.07.24.07.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 07:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZeQQ-0002IH-6O
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 10:33:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dZeQE-0002ED-0S
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 10:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dZeQD-0007wm-7R
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 10:33:22 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37704)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dZeQD-0007q7-09; Mon, 24 Jul 2017 10:33:21 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dZeQ5-0008TE-6l; Mon, 24 Jul 2017 15:33:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 24 Jul 2017 15:33:12 +0100
Message-Id: <1500906792-18010-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10] target/arm: Correct MPU trace handling
 of write vs execute
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
X-TUID: AzHvErv4Ta3M

Correct off-by-one bug in the PSMAv7 MPU tracing where it would print
a write access as "reading", an insn fetch as "writing", and a read
access as "execute".

Since we have an MMUAccessType enum now, we can make the code clearer
in the process by using that rather than the raw 0/1/2 values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We should update all this code to use the MMUAccessType type and
the enum values, but that's work for 2.11 (I'll put together a patch).
In the meantime, this is a bugfix for 2.10...

 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4ed32c5..9ed5096 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8558,8 +8558,8 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
                                    phys_ptr, prot, fsr);
         qemu_log_mask(CPU_LOG_MMU, "PMSAv7 MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-                      access_type == 1 ? "reading" :
-                      (access_type == 2 ? "writing" : "execute"),
+                      access_type == MMU_DATA_LOAD ? "reading" :
+                      (access_type == MMU_DATA_STORE ? "writing" : "execute"),
                       (uint32_t)address, mmu_idx,
                       ret ? "Miss" : "Hit",
                       *prot & PAGE_READ ? 'r' : '-',
-- 
2.7.4


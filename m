Received: by 10.28.4.212 with SMTP id 203csp733557wme;
        Thu, 19 Apr 2018 07:40:44 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp0DSvEB+nrTEbd6Htg2xdZqwHx+gSlFv1wk9h8yNHxXDn7lEwWFWueeAkHE8rjmPJJb/ds
X-Received: by 10.12.150.19 with SMTP id 19mr1090694qvx.211.1524148844015;
        Thu, 19 Apr 2018 07:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524148844; cv=none;
        d=google.com; s=arc-20160816;
        b=02ppZzagknYnSdF2HH0+wuSgrTVOtTKg/GZahgMCOg/eTKF7iIAP/m5Hj+sn2eoi5I
         OYoG+XShdMfu/RbmUq6gTRkf7GB7HyZGXuiePUJnAY+C8RUtIhPyDJRmM/MsygA+tiHf
         FvRk2UogQvV12m2Dk9CQjGswzdqn8BF/TY9GQUyyLsURFRsDKoq/AXQPnDPkKRkFWG2S
         Z1FeEMMcXfw2OMjUrqv18ZoFl1Wi8zt8w3hvsPrwKIDcQjohHqbpmFfrScSR0DcA2ptH
         k654tU8DQn+43NYk8A9bWVjMVRexfAdXYdsOxu+tg4zyb4agsMZABqu+4+33Jas4af7b
         GqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=zb1cA921zL52auEm0soJ59nEtMLMScoA3sEFcfO1EC0=;
        b=piK4WsIMoXromU8f5M3INIrw2VardUsDfiUu/bYvX/HNtoX+/TlIk8MIRaTMkOkkVS
         yVDfIYOgAHh5lfOp08gox3GxTzmisIhtwXPzU+kFd0Op8ew3HYKHsu/UqXpvCgNYzh0/
         wsp4Y4wn8kchNo3tHwpCBFqP2gla9xppM21tckn7CcpkY7FFDAw59INsuDPo8z0G3SmP
         e/lwALk0v63wDowEsP2bgsIyrJx+pdrT7PqnnCZFhN3meySxYvCkb4KlTlekqG7UFbEE
         2tadQt6wt21pJXtFzheQ4LHBZp146CLU7MNbETrNM3POcesXumWPc6jDSIYbJiWCLNuP
         vk+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p54-v6si1173441qtj.296.2018.04.19.07.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 07:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9Ajr-0001qW-8v
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 10:40:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9ARd-0002vL-Tt
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 10:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9ARd-00032T-0s
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 10:21:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9ARc-00031u-PH; Thu, 19 Apr 2018 10:21:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9ARb-0003Gg-Pp; Thu, 19 Apr 2018 15:21:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 19 Apr 2018 15:21:51 +0100
Message-Id: <20180419142151.9862-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Remove stale TODO comment
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
X-TUID: elxoKbXp8N7v

Remove a stale TODO comment -- we have now made the arm_ldl_ptw()
and arm_ldq_ptw() functions propagate physical memory read errors
out to their callers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ebd086ef2..0fa02c31e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8681,13 +8681,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
     return addr;
 }
 
-/* All loads done in the course of a page table walk go through here.
- * TODO: rather than ignoring errors from physical memory reads (which
- * are external aborts in ARM terminology) we should propagate this
- * error out so that we can turn it into a Data Abort if this walk
- * was being done for a CPU load/store or an address translation instruction
- * (but not if it was for a debug access).
- */
+/* All loads done in the course of a page table walk go through here. */
 static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
-- 
2.17.0


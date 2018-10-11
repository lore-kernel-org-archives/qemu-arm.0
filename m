Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2801477wrt;
        Thu, 11 Oct 2018 10:21:31 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61SNvYW+4TUtUugKvhFSCbxs6rf5Fth+OI1dTBPLoOmLp34xoH0gZdKkYzAzf2fokILjdyv
X-Received: by 2002:a37:ab12:: with SMTP id u18-v6mr2383483qke.305.1539278491086;
        Thu, 11 Oct 2018 10:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539278491; cv=none;
        d=google.com; s=arc-20160816;
        b=PiF5RYmH5BWKwlXcfTCFSEvTEjFzuDbXdlBIZXIApoK1GBmGngNUumm04bGdaZ1wJI
         LBuZwMAEr6k0/p945EIgBoMabQNOMuYuRNTMF63N0W5xx7yQq0yxNGs39Wn9wY6zgjvr
         zPddsDmcY1oiSWqRTKOknHm4FETctxFBY1QJSH4iFB3S1u72D3lhhXw5q5xD9KGMIEiv
         yY3VAB4C7Sx8Aqz8/f7axE2neH3zJ+0faRvigLVC48UgAinBibO/Qfn/5y/9Kyq2AHlz
         22EUoezlPPIZtClvElNR4WJNETBUxmutu39MZ48IEcT0BK3zJpZxdHbjck56W3cFl88t
         Axew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=eS983WYUXIlTcb9UV4ahE71TEERG/QaiF5Ngbd5UMWM=;
        b=bH8c3xw7TvzYsqxRduYPWkm1NBHoCKtCh/vB4TG8rXcLE1ww9fIU/OU4YY4SoEynh0
         ccVtjZLpgce7vSvAwE+wJ+O867CXxXpZ+Ja5iz34go/5BG7S9t5tmSV5aDfbY8+9FvBb
         zsAYkTSBeEy8dMLCIp1xNumlDDuxJ0Uy2Rc7xQFcYURnTJwNAA5euTpBKK08CiAqjMeg
         rwtkI6WigYyYD+5DtqR68KmaBw0DSwcWWaMMp1ORNP71z6/x/zY25h3wROpbPZxhAo+9
         JzsSV9RuMYDAru/IM5JvK05S5YGnJxCKCDqTXPsZI/Bv5P78li2CyIzFlnFCs8SoHLgE
         xHGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si9626300qvd.38.2018.10.11.10.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 10:21:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAeeQ-0005m1-FS
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 13:21:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAeeC-0005lq-78
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAeeA-0002zg-8H
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 13:21:15 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51780)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAee9-0002vl-LX; Thu, 11 Oct 2018 13:21:13 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAee1-0007Ho-JU; Thu, 11 Oct 2018 18:21:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 11 Oct 2018 18:20:57 +0100
Message-Id: <20181011172057.9466-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Initialize ARMMMUFaultInfo in
 v7m_stack_read/write
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
X-TUID: L9Fp6zKaSsuF

The get_phys_addr() functions take a pointer to an ARMMMUFaultInfo
struct, which they fill in only if a fault occurs. This means that
the caller must always zero-initialize the struct before passing
it in. We forgot to do this in v7m_stack_read() and v7m_stack_write().
Correct the error.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed this in passing while I was working in the file on
an entirely different issue.

 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c83f7c1109c..e3368e7edc5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6469,7 +6469,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     target_ulong page_size;
     hwaddr physaddr;
     int prot;
-    ARMMMUFaultInfo fi;
+    ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
     bool exc_secure;
@@ -6531,7 +6531,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     target_ulong page_size;
     hwaddr physaddr;
     int prot;
-    ARMMMUFaultInfo fi;
+    ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
     bool exc_secure;
-- 
2.19.0


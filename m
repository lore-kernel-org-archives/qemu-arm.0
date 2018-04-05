Received: by 10.28.71.155 with SMTP id m27csp6296210wmi;
        Thu, 5 Apr 2018 10:26:17 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+AF93RiVY5moF7xY6WbGw8OEx+jVXX2WjPWq8b1AyLGqXam993kbNd7zT0N8LNhtlwsDJB
X-Received: by 10.237.63.113 with SMTP id q46mr32965287qtf.308.1522949176980;
        Thu, 05 Apr 2018 10:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522949176; cv=none;
        d=google.com; s=arc-20160816;
        b=AJnxIcdnMw1SF1ukGZKkq0ImYS4bE9hQru3nIQcrnSCK0AW8yOG0++O/TzthH9oN4H
         023XGQnALf6RjcfYK6ANpt02IDFav1Y6L9kmuDl3KioOvRW5QS+jKUm6Z1rALLiXwUuq
         LB41D9cQX2jS9lkTp84uMkP4MFce71ZKW4V8G0We0uk2ZMDJ3jOnJZmshO2lazgs9+lP
         mmn5d7ngo/IaoABWGKQjxHKm1EA+3akpvhjj/btzxiyvxdduIml+oYGL+i65Tv90qBlI
         P0gue3gkAypdjhkEitb28f2MFRQhSDvKwqDTLqBpxhfqGOPcceqJu84Ta5bg+e0kQlf9
         K7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Q4uDNdaJ+4ogrLofV8kJ1HOCMRXLb6ZvGeVI4N+7IWA=;
        b=udAP9y0WUSeHKJSadrOWmbpov/19CHAc8dT7nJCGxbMhShs7lEO+2WB6KDIkhU4Zi/
         XANBRS4Zn/BjIUu0f+RuzKlvoqlVopG/VlVxHjg+hBDnfEMcZxYkUulgjNmezpI5yzdW
         inaqZMqzhQPu5iUNNBdOyTNUPbphEi0N7lRijC3I7BTh3pUjftsEk8vFF8AO0BWbsjgy
         0rRjjxHtWwOH03RX2Bfno/Tys0tJqGpdwAvqYx9zTNhIUKgQzLtxiT+qvcfi2ihepwu/
         btAvZE5KAiYTx8pMvQPIYcO1gHqEGZd6QUXAGmf8dNSdolJZ4aW67yvYPlHMOmEEpOjC
         Pe3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c64si1834674qkb.304.2018.04.05.10.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Apr 2018 10:26:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f48eO-0005DV-DH
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 13:26:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f48eC-0005C9-4B
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 13:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f48eB-0003Zn-AY
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 13:26:04 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f48eB-0003Xg-2S; Thu, 05 Apr 2018 13:26:03 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f48e3-0000o2-1M; Thu, 05 Apr 2018 18:25:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  5 Apr 2018 18:25:54 +0100
Message-Id: <20180405172554.27401-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12] target/arm: Report unsupported MPU
 region sizes more clearly
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
X-TUID: FVoBWPBYNGOH

Currently our PMSAv7 and ARMv7M MPU implementation cannot handle
MPU region sizes smaller than our TARGET_PAGE_SIZE. However we
report that in a slightly confusing way:

 DRSR[3]: No support for MPU (sub)region alignment of 9 bits. Minimum is 10

The problem is not the alignment of the region, but its size;
tweak the error message to say so:
 DRSR[3]: No support for MPU (sub)region size of 512 bytes. Minimum is 1024.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This doesn't really need to go into 2.12, but as a cleanup to a warning
message it's pretty harmless.

 target/arm/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dcb8476d9e..b14fdab140 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9625,9 +9625,9 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
             }
             if (rsize < TARGET_PAGE_BITS) {
                 qemu_log_mask(LOG_UNIMP,
-                              "DRSR[%d]: No support for MPU (sub)region "
-                              "alignment of %" PRIu32 " bits. Minimum is %d\n",
-                              n, rsize, TARGET_PAGE_BITS);
+                              "DRSR[%d]: No support for MPU (sub)region size of"
+                              " %" PRIu32 " bytes. Minimum is %d.\n",
+                              n, (1 << rsize), TARGET_PAGE_SIZE);
                 continue;
             }
             if (srdis) {
-- 
2.16.2


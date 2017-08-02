Received: by 10.25.44.15 with SMTP id s15csp6356996lfs;
        Wed, 2 Aug 2017 09:48:02 -0700 (PDT)
X-Received: by 10.55.137.71 with SMTP id l68mr17114311qkd.166.1501692482030;
        Wed, 02 Aug 2017 09:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692482; cv=none;
        d=google.com; s=arc-20160816;
        b=NRYUIKTlUz+SnFfwcpnuI5ibizGhX+veR/pW/WwqEsy4uhIkqwCy21Meuco/B+ARt+
         xoHGuwJ41V5fQSpYY2LuIDLRNaiNXgZLlZ2VfEb/O6giUKg9S3Z/rZ3ozJ4WOJO2MRYf
         6gUHd7M65d8Rkd55sMykZryKJqafiwf5OEBJwACwT4zVkwFusrb2K6p/kLpSXlItZfRd
         7wgS4W4W0xaGINA55asgVoiFeMOu3Y2v+NGpcbZXpRz3xY78XqHSKRx9bFdgLSIEBUI3
         V4Z2BdpMyAvqd04bd1dcUkIitrj/hTU13uEpZVDAiVHnzE14dT0ze50p9pQSQbnFI04w
         vrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+6Qar3r5X0EamItaEhpBe7+TPCOvZagGrw0SAlMkkRo=;
        b=TJS3v9Jjh048HrZWYyhA10s5RRyv2bd8rsZ4FV9/Ur8ZB0wwMV9CFgUQSZfmK2M39F
         gI9KRzmhaYXuoTNevrtN+1cdFS3wkJg2FYeRnpBg/wFJDYZc7Pebr5PvjAf1TC/0xG3f
         qCpu9k4mIA5MveP+jVv/soUrF0G/F8GHxD435BgKcInn0cN4qw6FxM0Twvk2/varP9Nc
         g31BZwopSMV86zYisKnDD59TTTDYkMjEMTe9mABP8pWTuLSmxNVZ8a7lzmRnVipOdSe0
         MdW7cUR2vHeXQloqExZkzgDBCeYzyCuG3mP+k4gfhJZDwXPpr6LpOb3XLExWfJ0xFFhp
         LR2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e27si29284954qtc.156.2017.08.02.09.48.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwoR-0006KE-BV
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:47:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlA-0003ZU-4H
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl9-0004mk-CU
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl9-0003zA-6b; Wed, 02 Aug 2017 12:44:35 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkf-0003xp-H1; Wed, 02 Aug 2017 17:44:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:52 +0100
Message-Id: <1501692241-23310-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/15] target/arm: Remove incorrect comment about
 MPU_CTRL
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
X-TUID: A8ksa1J3TnuT

Remove the comment that claims that some MPU_CTRL bits are stored
in sctlr_el[1]. This has never been true since MPU_CTRL was added
in commit 29c483a50607 -- the comment is a leftover from
Michael Davidsaver's original implementation, which I modified
not to use sctlr_el[1]; I forgot to delete the comment then.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b39d64a..b64474c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -416,7 +416,7 @@ typedef struct CPUARMState {
         uint32_t dfsr; /* Debug Fault Status Register */
         uint32_t mmfar; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
-        unsigned mpu_ctrl; /* MPU_CTRL (some bits kept in sctlr_el[1]) */
+        unsigned mpu_ctrl; /* MPU_CTRL */
         int exception;
     } v7m;
 
-- 
2.7.4


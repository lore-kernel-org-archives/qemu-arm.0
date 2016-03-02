Received: by 10.25.208.211 with SMTP id h202csp2298138lfg;
        Wed, 2 Mar 2016 10:08:18 -0800 (PST)
X-Received: by 10.140.20.39 with SMTP id 36mr34666213qgi.15.1456942098116;
        Wed, 02 Mar 2016 10:08:18 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x198si8012011qka.46.2016.03.02.10.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 10:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:58142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abBC5-0005uk-GX
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 13:08:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1abBBi-0005d5-J1
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 13:07:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1abBBe-0003QM-Qi
	for qemu-devel@nongnu.org; Wed, 02 Mar 2016 13:07:54 -0500
Received: from forward10h.cmail.yandex.net ([87.250.230.221]:49081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1abBBZ-0003Pg-O6; Wed, 02 Mar 2016 13:07:45 -0500
Received: from smtp4h.mail.yandex.net (smtp4h.mail.yandex.net [84.201.186.21])
	by forward10h.cmail.yandex.net (Yandex) with ESMTP id 343E821B87;
	Wed,  2 Mar 2016 21:07:41 +0300 (MSK)
Received: from smtp4h.mail.yandex.net (localhost [127.0.0.1])
	by smtp4h.mail.yandex.net (Yandex) with ESMTP id 7A1F62C00D5;
	Wed,  2 Mar 2016 21:07:40 +0300 (MSK)
Received: by smtp4h.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	9uqVAY8PrF-7d88xgbn; Wed, 02 Mar 2016 21:07:39 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1456942060; bh=8nSKKCkieYcoiPOEw1GiGlCmMpJ3hvxluO4fIvCdt2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=Dw8fCS+KSBubcvoNdDnG3Zibx3UDxmdpQST5s5F4CudmvrQNvE2nlVx2+MP0sMgoC
	WEhPnE25UbiuHoCSpomwK0zi/LSx9g2Mia9x70sSI6LMsLZGCgxaBiF/Eo4hL6pRHB
	OqgkK3N3WN1eULvX9PhMvp5bAsxe15LxRTXXO00o=
Authentication-Results: smtp4h.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Wed,  2 Mar 2016 21:04:32 +0300
Message-Id: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.221
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Subject: [Qemu-devel] [PATCH] target-arm: Fix translation level on early
	translation faults
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v0le01xmJjga

Qemu reports translation fault on 1st level instead of 0th level in case of
AArch64 address translation if the translation table walk is disabled or
the address is in the gap between the two regions.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 18c8296..09f920c 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7238,6 +7238,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
      * support for those page table walks.
      */
     if (arm_el_is_aa64(env, el)) {
+        level = 0;
         va_size = 64;
         if (el > 1) {
             if (mmu_idx != ARMMMUIdx_S2NS) {
-- 
1.9.3


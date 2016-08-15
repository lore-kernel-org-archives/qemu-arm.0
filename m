Received: by 10.25.21.156 with SMTP id 28csp1547903lfv;
        Mon, 15 Aug 2016 10:48:49 -0700 (PDT)
X-Received: by 10.55.168.22 with SMTP id r22mr32396302qke.148.1471283329682;
        Mon, 15 Aug 2016 10:48:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t75si13087547qkt.332.2016.08.15.10.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 10:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:38286 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZM0H-0007yJ-3s
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 13:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bZM0C-0007wN-Ov
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 13:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bZM08-0005Kj-KL
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 13:48:43 -0400
Received: from forward6p.cmail.yandex.net ([87.250.241.191]:55704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bZM07-0005He-9K; Mon, 15 Aug 2016 13:48:40 -0400
Received: from smtp2j.mail.yandex.net (smtp2j.mail.yandex.net [95.108.131.191])
	by forward6p.cmail.yandex.net (Yandex) with ESMTP id 676BF21255;
	Mon, 15 Aug 2016 20:48:27 +0300 (MSK)
Received: from smtp2j.mail.yandex.net (localhost.localdomain [127.0.0.1])
	by smtp2j.mail.yandex.net (Yandex) with ESMTP id B49841060C31;
	Mon, 15 Aug 2016 20:48:25 +0300 (MSK)
Received: by smtp2j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	0JZEHn2Nch-mOXKcT0c; Mon, 15 Aug 2016 20:48:24 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1471283304; bh=xevefoThVxOBeyFHV5lCTkpoDrJzfsip/VC9pspU+N4=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=DCiTuFe9/Rq84SKk/9yciuXL2BCIa4oWyBzopsaF+pbGhKtBXk9Gz+eWqTWw6PDIJ
	rB1QcbJHmLrUls4x2yR+vJLcXFGbYoUxROKldPe5IpPy7UO8fIRA2Wa1g+JfYztjC/
	TPM5xgndZAT4tRswDfALEuxT4g0E8ie6D+1j1ezU=
Authentication-Results: smtp2j.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Mon, 15 Aug 2016 20:48:13 +0300
Message-Id: <1471283293-169850-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.241.191
Subject: [Qemu-arm] [PATCH] target-arm: Fix lpae bit in FSR on an alignment
 fault
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OgkEdBjbBA2k

If an alignment fault occurred and target EL is using AArch32,
then DFSR/IFSR bit LPAE[9] must be set correctly.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 3e8588e..be27b21 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -194,7 +194,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
      * the LPAE long descriptor format, or the short descriptor format
      */
     if (arm_s1_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
-        env->exception.fsr = 0x21;
+        env->exception.fsr = (1 << 9) | 0x21;
     } else {
         env->exception.fsr = 0x1;
     }
-- 
1.9.3


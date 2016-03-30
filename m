Received: by 10.25.208.211 with SMTP id h202csp2603930lfg;
        Wed, 30 Mar 2016 05:32:32 -0700 (PDT)
X-Received: by 10.55.203.18 with SMTP id d18mr9511301qkj.25.1459341151990;
        Wed, 30 Mar 2016 05:32:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si3432749qka.125.2016.03.30.05.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 05:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alFIV-00017h-Eo
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 08:32:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1alFIS-00015G-HE
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 08:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1alFIO-0003ab-HZ
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 08:32:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1alFIO-0003aS-Ci; Wed, 30 Mar 2016 08:32:24 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 1B9D864466;
	Wed, 30 Mar 2016 12:32:23 +0000 (UTC)
Received: from thh440s.str.redhat.com. (dhcp-192-192.str.redhat.com
	[10.33.192.192])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2UCWLfF006523; Wed, 30 Mar 2016 08:32:21 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Mar 2016 14:32:20 +0200
Message-Id: <1459341140-16892-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 30 Mar 2016 12:32:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com, i.mitsyanko@gmail.com,
	qemu-devel@nongnu.org, d.solodkiy@samsung.com, m.kozlov@samsung.com
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Delete invalid maintainer entries
	of the Exynos section
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qVv226w7aEEJ

Mails to these e-mail addresses are rejected by the mail server
of Samsung with "User unknown" messages, so it seems like these
Exynos maintainers are no longer available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afbe845..12eb3fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -357,10 +357,7 @@ F: include/hw/timer/a9gtimer.h
 F: include/hw/timer/arm_mptimer.h
 
 Exynos
-M: Evgeny Voevodin <e.voevodin@samsung.com>
-M: Maksim Kozlov <m.kozlov@samsung.com>
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
-M: Dmitry Solodkiy <d.solodkiy@samsung.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/exynos*
-- 
1.8.3.1


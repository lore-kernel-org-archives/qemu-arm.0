Received: by 10.80.166.35 with SMTP id d32csp498323edc;
        Wed, 12 Oct 2016 05:14:36 -0700 (PDT)
X-Received: by 10.55.203.23 with SMTP id d23mr793458qkj.143.1476274476707;
        Wed, 12 Oct 2016 05:14:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d56si3694504qtb.37.2016.10.12.05.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 05:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buIQe-0001v8-4r
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 08:14:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buIQN-0001nQ-UM
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:14:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buIQJ-0007PR-Gm
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 08:14:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1buIQJ-0007OY-Bd; Wed, 12 Oct 2016 08:14:15 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98D6E3D949;
	Wed, 12 Oct 2016 12:14:13 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9CCEB6l026174; Wed, 12 Oct 2016 08:14:12 -0400
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Date: Wed, 12 Oct 2016 14:14:11 +0200
Message-Id: <1476274451-26567-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 12 Oct 2016 12:14:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/dma/pl080: Fix bad bit mask (PL080_CONF_M1 |
 PL080_CONF_M1)
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jx0CFOML+bVz

The M1 and M2 bits are both used for configuring the endianness
of the AHB master interfaces, so the second PL080_CONF_M1 should
be PL080_CONF_M2 instead.

Buglink: https://bugs.launchpad.net/qemu/+bug/1631773
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/pl080.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 3bed5c3..7724c93 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -351,7 +351,7 @@ static void pl080_write(void *opaque, hwaddr offset,
         break;
     case 12: /* Configuration */
         s->conf = value;
-        if (s->conf & (PL080_CONF_M1 | PL080_CONF_M1)) {
+        if (s->conf & (PL080_CONF_M1 | PL080_CONF_M2)) {
             qemu_log_mask(LOG_UNIMP,
                           "pl080_write: Big-endian DMA not implemented\n");
         }
-- 
1.8.3.1


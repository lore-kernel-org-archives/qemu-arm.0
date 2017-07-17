Received: by 10.25.44.15 with SMTP id s15csp4048901lfs;
        Sun, 16 Jul 2017 19:38:42 -0700 (PDT)
X-Received: by 10.200.1.17 with SMTP id e17mr8270621qtg.172.1500259122469;
        Sun, 16 Jul 2017 19:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500259122; cv=none;
        d=google.com; s=arc-20160816;
        b=qCrtxm2ukJEblWOSiqwABDFeE32XUsEbuu/k6OLnYLeg6YuF7j2d1jHRPSvzBfYUlU
         zTurAiCRayb+BgcOCJJew2PqXPCNRdAB4NP7FJlBVuiUfxs1Z9e57N8cReKbYVYT/kAc
         aNWWzMyBBC7LMJjBSSkfXWSo8KHcblsNxIcfc/V1Wd9mnaoFM8DluzXOqmNwraYOSxQs
         6vz+q66h/lIGNeyi/tE9+D3yTIKrGTA4/W/xzOHoCI+6xvb56vVwTOVLf4Jp+EEoeDg5
         3osJy3xHiX39IzSyo9UALDagtEp75Gyjudn3jbyzzoVNE5HA5F35db8ApcrHDgjGFQeV
         D4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=F6u4IFoyRDQUWoWErjv2zO/ym8kYXA2/rhW4QYzcC1U=;
        b=D0fxxd3dDuzW25QVUhWC1W7HvBaPaD0gMcjol0VGwRl8ubN/t3xx99kqaIb7QGPzV4
         wW8eZGNvnUODD2VEgPVEo19T28kK1SRGtGmU40/Bp/MW0ogVvbkyKcyG02wXmaUrN3vN
         09bLpljU0A4Rg4wwVa0y4fn+kRFgTM8Zhq52Vy+goebqF5Eq+6bGxp1x7JP+uHWBb7W1
         ScSOijO5ogFHWie1lbez+kc7pmQ/MxQGQ77CbVsCWlAGEwGu0/LmzPX4I68C8PONPZYs
         TMu136rQU9CdVu7WvZ0IhMSLagCIUga5n8Dd/dFE4V50/fxaRBg4FMk8KmUjC/VSFJfi
         6d8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b52si14576409qta.391.2017.07.16.19.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 19:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWvvj-0000Pu-SI
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 22:38:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvvf-0000IX-3C
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dWvva-0001Tt-Ct
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 22:38:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dWvva-0001SY-6i; Sun, 16 Jul 2017 22:38:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A43F7C049D57;
	Mon, 17 Jul 2017 02:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A43F7C049D57
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A43F7C049D57
Received: from lemon.redhat.com (ovpn-12-94.pek2.redhat.com [10.72.12.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F16C600C8;
	Mon, 17 Jul 2017 02:38:25 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 10:38:18 +0800
Message-Id: <20170717023824.18796-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 17 Jul 2017 02:38:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 0/6] arm: Make use of DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lSdDs9Pa6fDW

This is the arm part that was left out from:

https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04006.html

Make use of the new DEFINE_PROP_LINK, in favor of open coded the
object_property_add_link. The advantage of it is the property now get reflected
in the info qtree output, for a bit more introspectability.

Fam Zheng (6):
  armv7m: Convert bitband.source-mamory to DEFINE_PROP_LINK
  armv7m: Convert armv7m.memory to DEFINE_PROP_LINK
  gicv3: Convert to DEFINE_PROP_LINK
  xlnx_zynqmp: Convert to DEFINE_PROP_LINK
  xilinx_axienet: Convert to DEFINE_PROP_LINK
  xilinx_axidma: Convert to DEFINE_PROP_LINK

 hw/arm/armv7m.c             | 16 ++++------------
 hw/arm/xlnx-zynqmp.c        |  7 ++-----
 hw/dma/xilinx_axidma.c      | 16 ++++------------
 hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
 hw/net/xilinx_axienet.c     | 16 ++++------------
 5 files changed, 21 insertions(+), 53 deletions(-)

-- 
2.9.4


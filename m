Received: by 10.25.150.194 with SMTP id y185csp1557935lfd;
        Tue, 8 Nov 2016 04:21:59 -0800 (PST)
X-Received: by 10.202.183.195 with SMTP id h186mr7457046oif.67.1478607719884;
        Tue, 08 Nov 2016 04:21:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y14si17672954otd.260.2016.11.08.04.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:21:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45Pb-0004Fv-3e
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:21:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Lr-0001A5-2M
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Lq-0003yW-97
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c45Lq-0003y6-3h; Tue, 08 Nov 2016 07:18:06 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64D6531B31A;
	Tue,  8 Nov 2016 12:18:05 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA8CHsvk027755; Tue, 8 Nov 2016 07:18:02 -0500
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Date: Tue,  8 Nov 2016 13:17:50 +0100
Message-Id: <1478607473-25851-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1478607473-25851-1-git-send-email-thuth@redhat.com>
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 08 Nov 2016 12:18:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/5] sparc: Add slavio_misc.c and eccmemctl.c to
 the MAINTAINERS file
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
Cc: Fam Zheng <famz@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6VC5dhnxtU3S

Both files seem to belong to the Sun4m machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7eef43..451e7cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -710,6 +710,8 @@ S: Maintained
 F: hw/sparc/sun4m.c
 F: hw/dma/sparc32_dma.c
 F: hw/dma/sun4m_iommu.c
+F: hw/misc/eccmemctl.c
+F: hw/misc/slavio_misc.c
 F: include/hw/sparc/sparc32_dma.h
 F: include/hw/sparc/sun4m.h
 F: pc-bios/openbios-sparc32
-- 
1.8.3.1


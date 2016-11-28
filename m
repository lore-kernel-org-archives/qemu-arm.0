Received: by 10.25.150.194 with SMTP id y185csp1951977lfd;
        Mon, 28 Nov 2016 11:57:20 -0800 (PST)
X-Received: by 10.55.16.147 with SMTP id 19mr20474885qkq.255.1480363039416;
        Mon, 28 Nov 2016 11:57:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si32809677qkb.317.2016.11.28.11.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 11:57:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBS3C-0004g2-7z
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 14:57:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cBS37-0004fK-Mw
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 14:57:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1cBS34-0001nS-1Y
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 14:57:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1cBS33-0001nH-RW; Mon, 28 Nov 2016 14:57:09 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CFCC3F21F;
	Mon, 28 Nov 2016 19:57:08 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-107.phx2.redhat.com
	[10.3.116.107])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uASJv5kw001840; Mon, 28 Nov 2016 14:57:06 -0500
From: Laszlo Ersek <lersek@redhat.com>
To: qemu devel list <qemu-devel@nongnu.org>
Date: Mon, 28 Nov 2016 20:56:59 +0100
Message-Id: <20161128195701.24912-1-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 28 Nov 2016 19:57:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.8 0/2] loader fixes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v9QJerDDBaVT

While rebasing Michael's patch at
<http://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg02735.html>
to current master, I noticed something was wrong with rom_add_blob() in
current master. I'm proposing these fixes.

Thanks
Laszlo

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <zhaoshenglong@huawei.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org

Laszlo Ersek (2):
  loader: fix handling of custom address spaces when adding ROM blobs
  loader: fix undefined behavior in rom_order_compare()

 hw/lm32/lm32_hwsetup.h   | 2 +-
 include/hw/loader.h      | 6 +++---
 hw/arm/virt-acpi-build.c | 2 +-
 hw/core/loader.c         | 6 ++++--
 hw/i386/acpi-build.c     | 2 +-
 5 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.9.2


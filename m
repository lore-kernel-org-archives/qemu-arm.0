Received: by 10.103.98.197 with SMTP id w188csp388505vsb;
        Tue, 21 Feb 2017 05:36:10 -0800 (PST)
X-Received: by 10.200.42.227 with SMTP id c32mr24328071qta.70.1487684170240;
        Tue, 21 Feb 2017 05:36:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b204si297029qka.304.2017.02.21.05.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAbx-0006MA-Oc
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:36:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgAKv-0006VY-7P
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:18:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgAKr-0003Ww-BF
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 08:18:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cgAKr-0003WS-65; Tue, 21 Feb 2017 08:18:29 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 365ED80F94;
	Tue, 21 Feb 2017 13:18:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LDIPH6028228; Tue, 21 Feb 2017 08:18:26 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 14:18:18 +0100
Message-Id: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 Feb 2017 13:18:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] Allow direct vfio-platform device
 instantiation
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
Cc: okaya@codeaurora.org, pelcan@codeaurora.org, vikrams@codeaurora.org,
	shankerd@codeaurora.org, agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7eWkbUTU9MqG

Up to now, supporting a new VFIO-PLATFORM device has requested
to create a dummy derived device. The type of the derived
device was used to match the device tree node creation function.

Since the actual adaptation fits within this node creation function
and not anywhere else at the moment, let's allow to instantiate the
VFIO-PLATFORM device and pass the compatibility string with 2 separate
options, manufacturer and model. sysbus-fdt is adapted to associate
a node creation function with this combo.

The removal of the abstract characteristics was discussed on the ML
(https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03326.html)
in the context of HiDma integrayion.

This change should ease the integration of new devices and limit the
amount of adaptation code to the minimumy, ie. the node creation
function).

The AMD XGBE is the first device that can be instantiated that way:
-device vfio-platform,host=e0900000.xgmac,manufacturer=amd,model=xgbe-seattle-v1a
Note the legacy option still is available:
-device vfio-amd-xgbe,host=e0900000.xgmac

Eric Auger (2):
  vfio/platform: make the vfio-platform device non abstract
  hw/arm/sysbus-fdt: Allow device matching with compat string

 hw/arm/sysbus-fdt.c             | 59 ++++++++++++++++++++++++++++++++---------
 hw/vfio/platform.c              | 18 +++++++++++--
 include/hw/vfio/vfio-platform.h |  2 ++
 3 files changed, 64 insertions(+), 15 deletions(-)

-- 
2.5.5


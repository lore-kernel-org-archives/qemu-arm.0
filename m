Received: by 10.103.98.197 with SMTP id w188csp564035vsb;
        Tue, 21 Feb 2017 13:12:05 -0800 (PST)
X-Received: by 10.55.167.21 with SMTP id q21mr11563926qke.274.1487711525144;
        Tue, 21 Feb 2017 13:12:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i61si7687360qtd.319.2017.02.21.13.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 13:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgHj8-0005bc-LX
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 16:12:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgHiM-0004EI-MJ
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 16:11:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgHiH-0001IT-Tx
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 16:11:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cgHiH-0001Ho-NW; Tue, 21 Feb 2017 16:11:09 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1A0164450;
	Tue, 21 Feb 2017 21:11:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LLB5CR007269; Tue, 21 Feb 2017 16:11:06 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 21 Feb 2017 22:10:56 +0100
Message-Id: <1487711458-18198-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 21 Feb 2017 21:11:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 0/2] Allow direct vfio-platform device
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
X-TUID: 5HX3ikJr6dID

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
in the context of HiDma integration.

This change should ease the integration of new devices and limit the
amount of adaptation code to the minimum, ie. the node creation
function).

The AMD XGBE is the first device that can be instantiated that way:
-device vfio-platform,host=e0900000.xgmac,manufacturer=amd,model=xgbe-seattle-v1a
Note the legacy option still is available:
-device vfio-amd-xgbe,host=e0900000.xgmac

History:
PATCH -> RFC v2
- Fixed compilation issue when CONFIG_LINUX is not set
- moved to RFC since it needs more discussion and cannot apply to 2.9

Eric Auger (2):
  vfio/platform: make the vfio-platform device non abstract
  hw/arm/sysbus-fdt: Allow device matching with compat string

 hw/arm/sysbus-fdt.c             | 61 ++++++++++++++++++++++++++++++++---------
 hw/vfio/platform.c              | 18 ++++++++++--
 include/hw/vfio/vfio-platform.h |  2 ++
 3 files changed, 66 insertions(+), 15 deletions(-)

-- 
2.5.5


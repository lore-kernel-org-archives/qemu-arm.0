Received: by 10.25.0.144 with SMTP id 138csp186772lfa;
        Fri, 14 Apr 2017 01:40:33 -0700 (PDT)
X-Received: by 10.200.50.48 with SMTP id x45mr6760296qta.246.1492159233203;
        Fri, 14 Apr 2017 01:40:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g55si1212604qte.318.2017.04.14.01.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 01:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cywmO-0000X1-LK
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 04:40:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjV-0006gT-03
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjM-0008JW-2U
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cywjL-0008IQ-QH; Fri, 14 Apr 2017 04:37:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C8D519D00C;
	Fri, 14 Apr 2017 08:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C8D519D00C
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7C8D519D00C
Received: from thinkpad.redhat.com (ovpn-116-243.ams2.redhat.com
	[10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9ACD60A99;
	Fri, 14 Apr 2017 08:37:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2017 10:37:13 +0200
Message-Id: <20170414083717.13641-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 14 Apr 2017 08:37:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/4] qdev: remove all remaining
 cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9S1HOq+sQRm

This series removes all the remaining uses of
cannot_destroy_with_object_finalize_yet to finally remove
the flag itself.

The ARM patch has already been sent alone and reviewed by Markus.
I have tested the ppc one on ppc64 machine with KVM and using
QDM device-list-properties command.

For the versatile one, the flag allowed to workaround a problem
in the bus unparent function: the bus unparent is trying to
unparent all the children of the bus. To do that, it has a list
of the children of the bus, and calls object_unparent() for each
child, and object_unparent() calls object_property_del_child() if
obj->parent is not NULL.  As qdev_set_parent_bus() set only
parent_bus and the list of children, parent is NULL and the child
is never deleted.  We can avoid the problem by moving the
qdev_set_parent_bus() to the realize part.

I've tested all the changes with "make check" (including
device-introspect-test). I've booted a versatilepb machine
with a 3.16.0-4 debian installer kernel.

Laurent Vivier (4):
  arm: remove remaining cannot_destroy_with_object_finalize_yet
  ppc: remove cannot_destroy_with_object_finalize_yet
  versatile: remove cannot_destroy_with_object_finalize_yet
  qdev: remove cannot_destroy_with_object_finalize_yet

 hw/arm/allwinner-a10.c  |  6 ------
 hw/arm/bcm2836.c        |  6 ------
 hw/arm/digic.c          |  6 ------
 hw/arm/fsl-imx25.c      |  5 -----
 hw/arm/fsl-imx31.c      |  5 -----
 hw/arm/fsl-imx6.c       |  5 -----
 hw/arm/xlnx-zynqmp.c    |  6 ------
 hw/pci-host/versatile.c | 35 ++++++++++++-----------------------
 include/hw/qdev-core.h  | 13 -------------
 qmp.c                   |  5 -----
 target/ppc/kvm.c        | 10 ----------
 11 files changed, 12 insertions(+), 90 deletions(-)

-- 
2.9.3


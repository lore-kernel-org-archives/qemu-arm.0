Received: by 10.28.71.155 with SMTP id m27csp2120189wmi;
        Thu, 12 Apr 2018 09:42:14 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/DfqqNIC+xhmXtMb4/QkZTAjYnk6RVBOoENjiX/kAeBoiX6e69YRZwFIoBgt82FENndlu1
X-Received: by 10.200.26.251 with SMTP id h56mr2281784qtk.223.1523551334894;
        Thu, 12 Apr 2018 09:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523551334; cv=none;
        d=google.com; s=arc-20160816;
        b=qs31hVA+caubLtH7x1D6u0oBB2HPohmanmBUaQi/sfyWTFY9MatzagNuNy6S8XTjF4
         pdnx/7riB6j0oLWW2CiA/kTFOtUGMCMxfBTiGvOWg7Q0Rd90XPRJocUnZCM6/PV4tCRU
         jbwVvDGQTDW7Y86yn9xmRRzzt91v2ddIBfsxqZpcG54llY1nDtGMkFR+AG03UBINZBzO
         C5N8GXd6KrKnFR+QoLYN9qZ/f5dl6RhG1c3cObgggsNo6bJw4YboLhi/GB1MgTY98tba
         TD4snnUp5q8lF5GL5VdOhe4FpLGk9/2iLlSjV6lSa5ZjG/ldZyVXAQbAfXs2CiClpqDU
         C4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=kQ11OhlBjoQq9fqDavv6hgUvXvW6024q9VjSs6CY1XE=;
        b=zTEUEBQvC2EF3L6GUGgptF6MoAQbJ7rZQ1xPxinNwGCInVDwAWlRFy+geo4nQzpWMh
         3QJQFi3xfO7sSUeAH60D6THXptNX8mxhtar1DXC6tFFe5lZyIh9h+Wu1pJqeLynDZeze
         sdqdkVp6uF6CrsV6yMWTXHddAwcpesjmfWWGErQhNwtOsoyBJJZTAYDwvNd2hRWcKTgj
         tXGF31ER3Mz4GrFXeBoengi5EuoKbeluZ/C5swCyk52PI45JsNABgSPDULDOru+730Nf
         1XRcXu8KACp8N9LfI6v/Usjd6hXVo/lzK+FZ/cSJC+PVzkbYY28QV2+p1ojeWtgtMocC
         I89Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v40si4744727qta.444.2018.04.12.09.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fIc-0004Wa-Bw
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6fI6-00045X-4h
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:41:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6fI5-000180-5M
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:41:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51988 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f6fI4-00017K-VY; Thu, 12 Apr 2018 12:41:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BE0B40252F0;
	Thu, 12 Apr 2018 16:41:30 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF4EF10B00B2;
	Thu, 12 Apr 2018 16:41:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Apr 2018 18:40:17 +0200
Message-Id: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 12 Apr 2018 16:41:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 12 Apr 2018 16:41:30 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.13 0/4] arm: isolate and clean up dtb
 generation
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tjt2Akl2uYsi


While working on cpu hotplug for mach-virt, I've noticed that DTB
is generated incrementally across whole machvirt_init(). While it's
fine for machines with static DTB, it won't really work in case of
cpu hotplug and followed up reset since machine will load old DTB
that doesn't account for hotplugged CPUs.
So I've set on a quest to consolidate DTB generation and make it
reentrant so that on reset guest would see update DTB.

It's preliminary series which makes possible to call load_dtb()
later outside of arm_load_kernel() and in process of it drops
several machine_done notifiers, that were introduced to make
plaform-bus-devices work. Hopefully it makes code easier to follow.
It replaces machine_done notifiers with device hotplug framework
to allow for dynamic sysbus devices mapping at the moment they
are created instead of waiting for machine_done time and trying to
juggle with notifiers order to do initialization in propper order.

Mostly 'make check' tested +
manually with "ppce500" machine type and eTSEC device
(eTSEC is still initialized with the same IRQs as before series)


CC: qemu-arm@nongnu.org
CC: peter.maydell@linaro.org
CC: eric.auger@redhat.com

Igor Mammedov (4):
  arm: reuse arm_boot_address_space() in armv7m_load_kernel()
  platform-bus-device: use device plug callback instead of machine_done
    notifier
  arm: always start from first_cpu when registering loader cpu reset
    callback
  arm/boot: split load_dtb() from arm_load_kernel()

 hw/ppc/e500.h               |   3 ++
 include/hw/arm/arm.h        |  39 ++++++++++++-----
 include/hw/arm/sysbus-fdt.h |  37 ++++------------
 include/hw/arm/virt.h       |   3 ++
 include/hw/platform-bus.h   |   4 +-
 hw/arm/armv7m.c             |  10 +----
 hw/arm/boot.c               |  85 +++++++++++--------------------------
 hw/arm/sysbus-fdt.c         |  67 +++--------------------------
 hw/arm/virt.c               | 100 +++++++++++++++++++++++++++++---------------
 hw/core/platform-bus.c      |  29 +++----------
 hw/ppc/e500.c               |  37 +++++++++-------
 hw/ppc/e500plat.c           |  60 +++++++++++++++++++++++++-
 12 files changed, 227 insertions(+), 247 deletions(-)

-- 
2.7.4


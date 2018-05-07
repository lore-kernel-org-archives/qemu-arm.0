Received: by 10.28.4.212 with SMTP id 203csp2847148wme;
        Mon, 7 May 2018 04:13:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqq7K1iGAAU5RTdFDCYwgA3tApbY0ef10DzdSP78YCKl8EIOmLqHbrl8IS8wU2UZ6icqMae
X-Received: by 2002:a0c:e242:: with SMTP id x2-v6mr17221153qvl.60.1525691598506;
        Mon, 07 May 2018 04:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525691598; cv=none;
        d=google.com; s=arc-20160816;
        b=k8wWhjZlFCizcU/c6KnVuE+JZ8uNXymPEsuKHtWLRVAoKggNG+PHvNA6e3JmAtFaOt
         IuzYpF3XiSIWuJZKcJtvLXPP1Tkl98pYWgg2ZAXwtn6X4r5BKJDRa7W5Cm1LvfQ+vtdp
         IMLTQ4rozfQQdr+bvh0PdF1mM2o9rGOOt/ZBDD9vJOe1bS+CpbzXN3K0KaTGc54liL3u
         t2eUvB62riyJZYURkRe8lMTSzzQeS1uTk8Z3jCcIoNa6gYbU0xyjYK4B7gRWlbvwIvWs
         n+tZiyGur94nhOFFinmCWdqJNViKOWGcNLeBRN8P9zlSqwyQbkC+NT01Dv/env5fxATu
         wvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=q0zTQ+PnVMbRbpwzvb+QfsryiYxsiFc695WLvhQX0xA=;
        b=UEsMahrsWV1ZkfUyFAszbWxbR8Ko54Kw45U+X4pW09orfW4VWhQvDDRe09YSFR7q9X
         q+H7YzRxcf6PpVg+IuZieIlbLuqSYWysot55/8hlz1JvNwX3nuRHBCZmJu9MLzxQd1kZ
         P72DFV7+/7HM6nzggNT+TWVTE5ufADBbz2SUMmwknzFlY3z4AsiJyBp1YthseSECfCjO
         hJI1n0YQPSSmQXjfC7s9DEZzHqILZA43NU3WZTLegcbGBNNyWNBUs4C7FuGKX49FBr/p
         X2tNmwDfvSongVwjo10CMbyKeWdB0rnUyVSBNnQ65pBIGoTKL7GvDz7F376vuIRSYq1N
         8COQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v22si2050864qkl.392.2018.05.07.04.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 04:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFe4z-0002FI-Tl
	for alex.bennee@linaro.org; Mon, 07 May 2018 07:13:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFe4n-0002F5-Gg
	for qemu-arm@nongnu.org; Mon, 07 May 2018 07:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFe4j-00076v-Dw
	for qemu-arm@nongnu.org; Mon, 07 May 2018 07:13:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44652 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fFe4j-00076O-8m; Mon, 07 May 2018 07:13:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9589B42709D1;
	Mon,  7 May 2018 11:12:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EC1A57C45;
	Mon,  7 May 2018 11:12:52 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 May 2018 13:12:00 +0200
Message-Id: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 07 May 2018 11:12:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 07 May 2018 11:12:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 0/4] arm: isolate and clean up dtb generation
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQE/qRfm6X9C


Changelog v3->v4:
   * dropped "arm: boot: set boot_info starting from  first_cpu",
     since it's applied to target-arm.next
   * fix crash (in 3/4) when QEMU tried to load DTB but none was provided=
,
     get_dtb() hook isn't set by most ARM boards so such boards crash
     trying to call it. Check if there is DTB before trying to load it.
Changelog v2->v3:
   * drop already merged patches
       'arm: always start from  first_cpu when registering loader cpu res=
et callback'
       'ppc: e500: switch E500 based  machines to full machine definition=
'
   * add small not related cleanup
       'arm: boot: set boot_info starting from first_cpu'
   * add extra suggested patch
       'make sure that we aren't overwriting mc->get_hotplug_handler by a=
ccident'
   * make sure that dtb_limit initialized to 0
   * drop stale comment
   * drop not needed line movement
   * drop not needed extra new line
Changelog v1->v2:
   * drop "arm: reuse  arm_boot_address_space() in armv7m_load_kernel()"
   * move "arm: always start from first_cpu  when registering loader cpu =
reset callback"
     at the begigning of series and rebase
   * add "ppc: e500: switch E500 based machines to full  machine definiti=
on"
     and rebase 4/5 on top of it
   * fixup typo in virt_machine_get_hotpug_handler() name
   * add doc comment to skip_dtb_autoload field
   * 1-2/5 are queued in respective arm/ppc trees and are included for se=
ries
     completness so it would be easier to test, I expect series to go thr=
ough
     arm tree
  =20

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


Igor Mammedov (4):
  pc: simplify MachineClass::get_hotplug_handler handling
  platform-bus-device: use device plug callback instead of machine_done
    notifier
  arm/boot: split load_dtb() from arm_load_kernel()
  make sure that we aren't overwriting mc->get_hotplug_handler by
    accident

 hw/ppc/e500.h               |  5 +++
 include/hw/arm/arm.h        | 45 +++++++++++++++------
 include/hw/arm/sysbus-fdt.h | 37 ++++-------------
 include/hw/arm/virt.h       |  1 +
 include/hw/i386/pc.h        |  8 ----
 include/hw/platform-bus.h   |  4 +-
 hw/arm/boot.c               | 72 +++++++++-------------------------
 hw/arm/sysbus-fdt.c         | 64 ++----------------------------
 hw/arm/virt.c               | 96 +++++++++++++++++++++++++++++----------=
------
 hw/core/platform-bus.c      | 29 +++-----------
 hw/i386/pc.c                |  7 +---
 hw/ppc/e500.c               | 38 ++++++++----------
 hw/ppc/e500plat.c           | 32 +++++++++++++++
 hw/ppc/spapr.c              |  1 +
 hw/s390x/s390-virtio-ccw.c  |  1 +
 15 files changed, 192 insertions(+), 248 deletions(-)

--=20
2.7.4


Received: by 10.28.4.212 with SMTP id 203csp179499wme;
        Wed, 18 Apr 2018 07:29:21 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49BjXRjkPlWYRX/w5HGkooLUumzdtC9MrwVSWp9GiOm6vYKDiQQYX8wXPZHltFqCXDNecKM
X-Received: by 2002:a25:e695:: with SMTP id d143-v6mr1226535ybh.48.1524061761493;
        Wed, 18 Apr 2018 07:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524061761; cv=none;
        d=google.com; s=arc-20160816;
        b=Ii/pPYOGYsEmNaWZdewZWKgVF/mpo/tZwiY7qOYmHzsrkptJX104F+MB+KUbz1Fezu
         Q7OmaJBgbH3juWAoqYbcIwqRfqS/LGCq/56Qzqdkyg6jOdpqW1sd5yiQp/hljVvR8kqG
         AbYJFPbrksgEXuR4zzcjZz9hwrtSw1Ph9gPJ+IDzpQq+RQ95mMEJVUDaueuvQ9qP7hWg
         mOUFgaiN1vwQFzmLP/S4dEL5vG9wjqp8JWQhwjhXwEp3TnGf0BR2ZOggWkvDGi7Be+p+
         W2Kgby4E3vIqjGoJieIDxXnPIR47j96jWXTFS2355mR7qFeaNyAUnqPUw6ZQdGqVmLtd
         KeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=UQ2Irms0n8ezC8WNoPLEVAs1sMTlJm3QeoSyAbprA9s=;
        b=OBVovPKcmXCJl7+HU21GKHsp63O0gHiezyjhYsmAhes1QdyVg10PET5qFq+PVEwVqQ
         Pd2H1aNcuMtmFmIStSFuJm7l5+Blqn5afB609CJV4L7GEbnHfqgjLi0T9UmqKOWAXr+W
         rAz6p4y8meNXf0OU2GiNw822lL0TOz98tBoNYcFYmmyOFql/xaBOh6kfc2AgPyaZhuLo
         KatvFV6Z1Bev+yfv/JrcOxxMyNoa+BaAIGAWSt5uBfkjCFg66pulfHdO0bz902OBkCnf
         FpcH3UgnBeRvBgj7tpFvy3QMjFuVilIYQzG1G8XMy+wRrH3nL+lfuBVD4voE++uUt6ns
         Y8/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i68si1699717qkc.379.2018.04.18.07.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 07:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8o5I-0006kN-SB
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 10:29:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8o56-0006jO-Bp
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f8o53-0003tV-8T
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 10:29:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47724 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f8o53-0003tG-3B; Wed, 18 Apr 2018 10:29:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2088A406E8B9;
	Wed, 18 Apr 2018 14:29:04 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57C8E2166BB2;
	Wed, 18 Apr 2018 14:29:03 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 18 Apr 2018 16:28:00 +0200
Message-Id: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 18 Apr 2018 14:29:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 18 Apr 2018 14:29:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.13 v2 0/5] arm: isolate and clean up dtb
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
X-TUID: 9eKtOSObD9i2


Changelog v1->v2:
   * drop "arm: reuse  arm_boot_address_space() in armv7m_load_kernel()"
   * move "arm: always start from first_cpu  when registering loader cpu reset callback"
     at the begigning of series and rebase
   * add "ppc: e500: switch E500 based machines to full  machine definition"
     and rebase 4/5 on top of it
   * fixup typo in virt_machine_get_hotpug_handler() name
   * add doc comment to skip_dtb_autoload field
   * 1-2/5 are queued in respective arm/ppc trees and are included for series
     completness so it would be easier to test, I expect series to go through
     arm tree
   

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


Igor Mammedov (5):
  arm: always start from first_cpu when registering loader cpu reset
    callback
  ppc: e500: switch E500 based machines to full machine definition
  pc: simplify MachineClass::get_hotplug_handler handling
  platform-bus-device: use device plug callback instead of machine_done
    notifier
  arm/boot: split load_dtb() from arm_load_kernel()

 hw/ppc/e500.h               |  34 ++++++++--
 include/hw/arm/arm.h        |  44 ++++++++++---
 include/hw/arm/sysbus-fdt.h |  37 ++---------
 include/hw/arm/virt.h       |   1 +
 include/hw/i386/pc.h        |   8 ---
 include/hw/platform-bus.h   |   4 +-
 hw/arm/boot.c               |  73 ++++++---------------
 hw/arm/sysbus-fdt.c         |  67 ++------------------
 hw/arm/virt.c               |  95 ++++++++++++++++++----------
 hw/core/platform-bus.c      |  29 ++-------
 hw/i386/pc.c                |   6 +-
 hw/ppc/e500.c               | 151 +++++++++++++++++++++++---------------------
 hw/ppc/e500plat.c           |  95 ++++++++++++++++++++--------
 hw/ppc/mpc8544ds.c          |  47 +++++++++-----
 14 files changed, 342 insertions(+), 349 deletions(-)

-- 
2.7.4


Received: by 10.25.21.156 with SMTP id 28csp117973lfv;
        Thu, 14 Jul 2016 07:24:46 -0700 (PDT)
X-Received: by 10.237.54.33 with SMTP id e30mr21598770qtb.4.1468506286267;
        Thu, 14 Jul 2016 07:24:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si1466635qkk.34.2016.07.14.07.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 07:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNhZF-0002Wv-IP
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 10:24:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgvo-0002wT-1S
	for qemu-devel@nongnu.org; Thu, 14 Jul 2016 09:44:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1bNgvn-0001fb-0s
	for qemu-devel@nongnu.org; Thu, 14 Jul 2016 09:44:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>)
	id 1bNgvh-0001eg-5c; Thu, 14 Jul 2016 09:43:53 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4970C7F41A;
	Thu, 14 Jul 2016 13:43:52 +0000 (UTC)
Received: from work.redhat.com (vpn-202-40.tlv.redhat.com [10.35.202.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EDhkRM004016; Thu, 14 Jul 2016 09:43:47 -0400
From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Jul 2016 16:43:39 +0300
Message-Id: <1468503826-10617-1-git-send-email-marcel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 14 Jul 2016 13:43:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/7] hw/pci-bus: Fix PCI bus regression on
 several archs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, mst@redhat.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, marcel@redhat.com,
	leon.alrae@imgtec.com, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5eSwWjaRrtzE

Commit b86eacb (hw/pci: delay bus_master_enable_region initialization) delayed
enabling the 'bus-master' region for PCI devices until 'machine-done' event.
The event registration happens in the PCIBus realize function, however
the PCI bus is not 'realized' *at all* for some machines.

It appears to be a hidden issue revealed by the above commit.
Thanks Mark Cave-Ayland and Leon Alrae for reporting it!

For all the series:
Reported-by: Leon Alrae <leon.alrae@imgtec.com>
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Patch 1: Increase the timeout for the prom-env-test since I encountered random failures.
Patch 2-7: Separate fix for each arch so it will be easier for maintainers to ack.

Thanks,
Marcel

Marcel Apfelbaum (7):
  tests/prom-env-test: increase the test timeout
  hw/alpha: fix PCI bus initialization
  hw/mips: fix PCI bus initialization
  hw/apb: fix PCI bus initialization
  hw/grackle: fix PCI bus initialization
  hw/prep: realize the PCI root bus as part of the prep init
  hw/versatile: realize the PCI root bus as part of the versatile init

 hw/alpha/typhoon.c      |  2 +-
 hw/mips/gt64xxx_pci.c   |  2 +-
 hw/pci-host/apb.c       | 15 +++++++--------
 hw/pci-host/grackle.c   |  2 +-
 hw/pci-host/prep.c      |  1 +
 hw/pci-host/versatile.c |  1 +
 tests/prom-env-test.c   |  2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)

-- 
2.4.3


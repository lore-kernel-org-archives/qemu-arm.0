Received: by 10.25.0.23 with SMTP id 23csp322135lfa;
        Tue, 13 Jun 2017 06:31:42 -0700 (PDT)
X-Received: by 10.237.37.74 with SMTP id w10mr69318752qtc.14.1497360702084;
        Tue, 13 Jun 2017 06:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497360702; cv=none;
        d=google.com; s=arc-20160816;
        b=vMY28uM3BqEDe3X8P8JkV4O/G8AedxVZgAZGhHUYgCBwzcpRaHysIwgkXVAAHHjcmk
         DFqcdEYtVBme+6Vitq2rouSRhdP58FRpJ1Q8lvAEIANduuabLnglmCohRhR9vISt5xwW
         HM671q49gL6UsFgB96A9SwCQnIf2lXIfnAass2P+qIxCJq2qX8AUqMVEXK2vXsghJHjP
         8pCJvO29OJgpEs7YuIEkoYMaAFZ2ohJyhuchgqxFIzbIEIZrLVdZJpmuMVHpIfhmQtn4
         ruX08bZXPnyEZNJU+NtqQcjitZeps/JTxVEb75a8AV8dH56LSx5iaCsdT7jLDY0zm7Tv
         Kdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=Cm5JldSy8xzd/TO3twBz5r1T9U4FMg7EmhdFqABBwkw=;
        b=BUgt+FXTurO6J251txxKfBvkmCcR/m74o4PxozzL+UrpeyqvVKm4abj0wpSs9nIuAw
         2u8ef7G52nPRnhkkJ9OBBk46WrOlSIAltBTHNzu0ShhUmFZUhPiEzaXlfooca1br+hQQ
         rkGCyENGXEUorWb+Dm/B5hy4nlj5jIoKto/YXmpZiR6U3YuYMgWEJ+2KNu0iNW43KciB
         PYqdx8VpLo36op6RU/WQuZEamv73cuctwow4PrtwV9fw0s0G571gBj4DRQ2p02boXXxD
         lC6C1GBzrI5SxeFGkWRdqOv+8M+Wp/FHtxLjskeNejHc7Y1U1QUPtH48DvWXSFxGQb41
         SG4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j9si1577348qtb.249.2017.06.13.06.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Jun 2017 06:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKlv1-0007fG-Gv
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 09:31:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKlux-0007f8-4n
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dKluu-0008D0-25
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:31:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dKlut-0008Co-SG; Tue, 13 Jun 2017 09:31:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ED2E8FCED;
	Tue, 13 Jun 2017 13:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9ED2E8FCED
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9ED2E8FCED
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37A7885AE4;
	Tue, 13 Jun 2017 13:31:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 13 Jun 2017 15:31:14 +0200
Message-Id: <1497360677-4780-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 13 Jun 2017 13:31:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/3] Generic PCIe host bridge INTx
 determination for INTx routing
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
Cc: drjones@redhat.com, agraf@suse.de, christoffer.dall@linaro.org,
	pranavkumar@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PFaXLzVzTKAC

This series implements INTx to gsi routing for ARM VIRT/GPEX. This is
a respin of [1] which was lost in limbo.

ARM virt uses GPEX PCIe bridge. This latter does not implement INTx
to GSI routing. PCIe/INTx assignment works but the consequence is
irqfd is not used along with INTx interrupts and VFIO INTx handlers
are executed on userspace leading to an important performance degradation.

This issue is witnessed by the following messages;

qemu-system-aarch64: -device vfio-pci,host=0006:90:00.0: PCI: Bug -
unimplemented PCI INTx routing (gpex-pcihost)
qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)
qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing (gpex-pcihost)

So with this series, irqfd is set up for PCIe/INTx passthrough and we get
the optimal performance. Also we get rid of the above messages.

This series can be found at:
https://github.com/eauger/qemu/tree/v2.9-gpex-intx-v3

References:
[1] Generic PCIe host bridge INTx determination for INTx routing
   https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg04975.html

Pranavkumar Sawargaonkar (3):
  hw/pci-host/gpex: Set INTx index/gsi mapping
  hw/arm/virt: Set INTx/gsi mapping
  hw/pci-host/gpex: Implement PCI INTx routing

 hw/arm/virt.c              |  4 ++++
 hw/pci-host/gpex.c         | 22 ++++++++++++++++++++++
 include/hw/pci-host/gpex.h |  3 +++
 3 files changed, 29 insertions(+)

-- 
2.5.5


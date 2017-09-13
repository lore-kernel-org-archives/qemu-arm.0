Received: by 10.223.172.38 with SMTP id v35csp833972wrc;
        Wed, 13 Sep 2017 02:47:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDQqtO4NpLnTyMVHL/cwzs+G3DtExNZKSAVhfSKmMRoZAveDXIVpUuqN6YvkAsoNwkiytQr
X-Received: by 10.200.36.132 with SMTP id s4mr24202085qts.4.1505296034167;
        Wed, 13 Sep 2017 02:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505296034; cv=none;
        d=google.com; s=arc-20160816;
        b=V59a41Kri3PbPRWE8CXaSInlBBvZZ3KVOtYAeXttJNL4PBGKXNNEbZSfZOuVADa+Ug
         feMCDgkYs0hEpiJdaisipZdQFshk4evSg6rJhGTPhmvmnvQfbgyw/pfiUvWUIIDUFri8
         p635eRKZsRth01mVDZOhwCa5bastZX4+MZoCTGu6Kg3L0w6KR+6YFq52YN6oeFAlp88v
         AWyYu/BkvyvO08xD6B6byLfFguEWAn3bZHWIGtDx3GBIJfRimUN88oqNfkl1d4+8ejVE
         qoqgSbQtl5B85LjGtvKDYRMyqm4GzMQ6rW3sRvtTfqJ9UFapH0IaBSnl7Lvi9U49F3fr
         94lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=7Mdbnbw6t45AQZQkOSVg/uVykGj72U+p3q5TjYdk3fs=;
        b=O68l++J8265NNXJ7uGNHOA3Ko74LLyK3B0+VR0ScbPjBig5VJEXIWR7mDXkpCsU+1d
         iJb8IP8zga95QIdezSQ/+oHyqRSH4bCxMLMkyU/3bntuU3Lzp3nAJfTplmOe6oah/z79
         MsuwM6+UAmnx+giamZPkzmdcojaBRzE5UwvX25zROz70RiIHl2pUmVwqu5UcJkMYfBBM
         szSxOTpEm4YJZqQwIPVy7aQ8W+3bdzuy1blFVLxb9VN5mTwIksjGSHVLnfSU3h3M2CAB
         cxQolgjsRfLKJjkkleMKLzqkZ7l5QCU/6IPWhtqC5kvmJD/29RBG/6cwhYVOucCI1r/X
         lsTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si14687956qtc.341.2017.09.13.02.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 02:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds4GF-0008LB-Ue
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 05:47:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4G5-0008J3-Qs
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 05:47:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ds4G1-0006J0-Op
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 05:47:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ds4G1-0006I6-J9; Wed, 13 Sep 2017 05:46:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C99675F73C;
	Wed, 13 Sep 2017 09:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C99675F73C
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-228.ams2.redhat.com
	[10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8BE2D60841;
	Wed, 13 Sep 2017 09:46:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 11:46:41 +0200
Message-Id: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 13 Sep 2017 09:46:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 0/3] Generic PCIe host bridge INTx
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
X-TUID: tUztmSIqchQN

This series implements INTx to gsi routing for ARM VIRT/Gpex. This is
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
https://github.com/eauger/qemu/tree/v2.10.0-gpex-v4

References:
[1] Generic PCIe host bridge INTx determination for INTx routing
   https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg04975.html

History:
v3 -> v3:
- use int instead of uint32_t for gsis
- added Drew's R-b
- Added Feng's T-b

Pranavkumar Sawargaonkar (3):
  hw/pci-host/gpex: Set INTx index/gsi mapping
  hw/arm/virt: Set INTx/gsi mapping
  hw/pci-host/gpex: Implement PCI INTx routing

 hw/arm/virt.c              |  1 +
 hw/pci-host/gpex.c         | 22 ++++++++++++++++++++++
 include/hw/pci-host/gpex.h |  3 +++
 3 files changed, 26 insertions(+)

-- 
2.5.5


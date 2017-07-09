Received: by 10.25.44.15 with SMTP id s15csp2629216lfs;
        Sun, 9 Jul 2017 14:02:49 -0700 (PDT)
X-Received: by 10.200.52.242 with SMTP id x47mr711856qtb.70.1499634169001;
        Sun, 09 Jul 2017 14:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499634168; cv=none;
        d=google.com; s=arc-20160816;
        b=0Bim+jItqejE2ZI2Z7SxP8n0f+9R6Fra382R03VIx58KaHNJJdPpyOyOeGnhT5sfBx
         uoRTA8G8jtGRp9KbK5UAvEEZFiMCIrIN2EnKPElhqAfrBOiYbjuudpOkwpOSoX3vBxMK
         WSFyyv9Os9mfOb3A4jkEq1ozOZTab1CppBXzSu9Fp3FVcvSXdW1guuQZCXi0NO6AIyke
         ZurZ6jxOQbQDUt+0gQJuHk4Ss/C2W5h/ksgfj4nD02ZOrFbVOrIG6M+U3omj6sEeXixR
         N+GhKShPUEI14qZUTl31iHK3ea/IHk1YexnQxqF4PJ7rULAVmLSiitVSIQt6r7MhUkb1
         V+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=KXopOaIw+PVxkjvT33OmCOvSM58wbAyLoue6W5e/j8Q=;
        b=KEgtoUYsacSSERjXyHalWagMNthYmEzl1vN9PdWBdoJrhcA3xmzLaiUi6yuAD/9DZj
         7dAmJzICsVwq3oMHkSUu9ZLvaHhu9C/dhBcqCWZKkwOXc2jEXEnznb7Il6FzHawDRAkK
         wRgRtbw1+eihWV3BxXC99L+PrhniRKih6sG0vlIoFcpIkgAerwfX1wUDTU5+U3KYkoPO
         JBfkJruBaBZ1PneipP6P70GEvBQRHaXmUwwE7ffE0ULLvolKvb/PgPM+0WunJPLPl5pr
         JCgl9livvVr+D5knOg2kznxXWAqH2vHaMTAkcpzauGZLyB33d9ER+OkGzUHk+CFuB6Sw
         DL3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s5si8925672qkd.147.2017.07.09.14.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 14:02:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJLq-0000XX-7T
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 17:02:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLn-0000Wa-1d
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 17:02:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJLj-0004iN-VS
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 17:02:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJLj-0004i9-Ol; Sun, 09 Jul 2017 17:02:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C161C058EA3;
	Sun,  9 Jul 2017 21:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5C161C058EA3
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5C161C058EA3
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7678C53C32;
	Sun,  9 Jul 2017 21:02:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun,  9 Jul 2017 23:02:16 +0200
Message-Id: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sun, 09 Jul 2017 21:02:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RESEND v3 0/3] Generic PCIe host bridge INTx
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
X-TUID: cepNVY7HTSlo

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


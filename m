Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp886148wre;
        Wed, 23 May 2018 09:06:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKC+uYOJ7GD8zGi6Ro682VBucQzs1AgoJZs2JbaEB+PjSU97PAzrfy4x0ue1wTQGwTsBUbC
X-Received: by 2002:a37:9507:: with SMTP id x7-v6mr2977745qkd.232.1527091595075;
        Wed, 23 May 2018 09:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527091595; cv=none;
        d=google.com; s=arc-20160816;
        b=iMK7HV3dcm3nadLhRgUla0A/7iwosNsMtKnyleHuQ6mzUaGSxHSaf3nxzHHxMxmSUI
         t2oYyUHhoH1A0R66+rjevyHUGZUjGGOUwBRcUoKWqI0D4c3jW773dRT7Bzs7eS04oJZv
         IkBmUGM9PJQE11q11kW08iGzJUSoeMDj7beIA9fmrdJ5WmNL97cUaFu42xp7/nVBkPcZ
         bfYxJYo8EyzUCMoNzTSkNYWI3yLOQeZg3JObcTb0fW9eGp52uu0Kt+z9es5/TaBXR3Ju
         369DE/X6kHJkvTt9leqXqFfiMv2+YiH7kmK3kVlm1Jnr2YVU/+Rb2KBeqciE+kkEbwBA
         urFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=9GPuWPLjJl1qm+4VDcvBFHKF9XRJH8eUpkfFmuJheGM=;
        b=bv52bU6pElsBhsAkgH2gN778yx7BZzCYfOcWsx1gnF4vYuKPxum1bKF0sN39XQuyOp
         B5odbYErY2ltGL6mBcDgkXnxi0f05WN6Z916oof0fmAg7x9JJpiOG3m4Oqzs/KeEekJh
         SuaB1Cdzig8C6o6hjwVi+TPQ/oOjOabc9p14pwErL9N5lDvE1Zn/CTOG//2tc281MNVn
         TJvUm6ODWP+YeTv8muzFzq609hHEBALlbkfdLNVFvcfoTSBheikOf2507ycy3csw91Cm
         jWX+gkUDz/UT/uzNdVexB15TWyFj98ozwztkyZ+QKFmZVWV2UlOkGIm0+zvTEmlC6h4Q
         WD0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p40-v6si5492582qvj.176.2018.05.23.09.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 09:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLWHa-0004mo-H3
	for alex.bennee@linaro.org; Wed, 23 May 2018 12:06:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLWEy-0002yG-RI
	for qemu-arm@nongnu.org; Wed, 23 May 2018 12:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLWEu-0004Cz-UM
	for qemu-arm@nongnu.org; Wed, 23 May 2018 12:03:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57128 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLWEu-0004Cl-R9; Wed, 23 May 2018 12:03:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3597D857A1;
	Wed, 23 May 2018 16:03:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB5483B9A;
	Wed, 23 May 2018 16:03:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 23 May 2018 18:03:36 +0200
Message-Id: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 23 May 2018 16:03:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 23 May 2018 16:03:48 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 0/2] ARM virt: Support up to 256 PCIe buses
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, lersek@redhat.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BLbK8a40qrK+

Current Machvirt PCI host controller's ECAM region is 16MB large.
This limits the number of PCIe buses to 16.

PC/Q35 machines have a 256MB region allowing up to 256 buses.
This series tries to bridge the gap.

It declares a new ECAM region located beyond 256GB, of size 256MB
(just after the hypothetical new GICv3 RDIST region). The new
ECAM region is used as soon as the highmem option is set (default)
and disabled for machines older than 3.0.

Best Regards

Eric

Git: complete series available at
https://github.com/eauger/qemu/tree/v2.12.0-256MB-ECAM-RFCv1

- Tested with guest running in aarch64 and aarch32 modes (aarch64=off)
- In aarch32 mode I encountered the issue the vmalloc region may be
  reported too small for the needs (dmesg excerpt below). So I had to
  extend the vmalloc size by passing the "vmalloc=512M" option to the
  bootargs and this eventually booted fine.

[    1.399581] pl061_gpio 9030000.pl061: PL061 GPIO chip @0x0000000009030000 registered
[    1.402636] OF: PCI: host bridge /pcie@10000000 ranges:
[    1.404506] OF: PCI:    IO 0x3eff0000..0x3effffff -> 0x00000000
[    1.406606] OF: PCI:   MEM 0x10000000..0x3efeffff -> 0x10000000
[    1.408690] OF: PCI:   MEM 0x8000000000..0xffffffffff -> 0x8000000000
[    1.411992] vmap allocation for size 1052672 failed: use vmalloc=<size> to increase size
[    1.414895] pci-host-generic 4010000000.pcie: ECAM ioremap failed
[    1.427472] pci-host-generic: probe of 4010000000.pcie failed with error -12

- Maybe this issue deserves introducing a new highmem_ecam option?

Eric Auger (2):
  hw/arm/virt: Add a new 256MB ECAM region
  hw/arm/virt: Add virt-3.0 machine type

 hw/arm/virt-acpi-build.c | 22 ++++++++++++++--------
 hw/arm/virt.c            | 39 ++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |  3 +++
 3 files changed, 49 insertions(+), 15 deletions(-)

-- 
2.5.5


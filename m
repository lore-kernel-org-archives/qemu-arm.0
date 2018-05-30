Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4807989wre;
        Wed, 30 May 2018 07:26:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuhjkY82tetwGgKrrzX3PQ7jUxIRVFZ4PaZThW3kO3QoNWieIJHV5nwNVIaLtRpsufHaA+
X-Received: by 2002:a37:4f10:: with SMTP id d16-v6mr2548334qkb.323.1527690404299;
        Wed, 30 May 2018 07:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527690404; cv=none;
        d=google.com; s=arc-20160816;
        b=Hf4PG04lAF5kFBiA7kcjsjcwa61JTkzuWFwDAGty93vmDWV+/a2XVVxUyIxyHrtTsR
         GK/Ug+V10u79CAFEkm+4lfFZu6ArDCKJzFvM4+I3OJ1ExKFLEzxHOj36PQoV36k4fMTK
         AOBzXjWJj2ENkUGia3Zx2ZHijzKkNhfMWXysJQ95J04+RpdvWhjwVArosaMOi0Msf4AV
         9QFYufNraTeS5pA89roeSYeNUP1oPy7M2rxFZ8ndAqWgJ4JZQSTQsDF1ZtQ9qRkh/Z/k
         bi0zROfuvv9hQWuL5RYpSv9U8nPx1VmidEvlE+Uhi2KFYbGyllyjLAcP2ddfqsyS8T+W
         drhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=6J+Nuinn/8kqxPKxz44iNp6LTdFZ4RHAb2F41qfYd6E=;
        b=S+lwz3Zq5WkCSZnsk0r2DzVqIJHYwlTAGxONQ/IcgV7DtIS72mSvzO6U28r+c3MioE
         Yf6Lc5WEwc1iuybx3tYv58V0CIr+b19E1N0LWQb0bpacag6RBCQVfg5DJ0lVhwWv4ac3
         FwQHzTvsOdj8SQZqWETsLpGMTioXxDmingKq09ZT+9W/Ht3325R3C1/xf8Slia+nYhtE
         wc7a3LWirIyINegIOjKEQbMO/+eAzte9jhT292WNwxWmKdBYYjPOFII7KgWRSJc08csy
         Vqzju2JikfHgDPS7eb9KsWWr4D7l0AZ5Q+rl2hhPS9N/XmwZEKqRazTBdYhe/9dq0TE5
         hJCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e64-v6si7408945qtd.286.2018.05.30.07.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO23n-0003uU-NY
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:26:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO23c-0003tW-GA
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:26:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO23Y-0000Gh-22
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:26:32 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55908 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fO23X-0000Gc-Tt; Wed, 30 May 2018 10:26:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 353C4818BAF8;
	Wed, 30 May 2018 14:26:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE47763F3E;
	Wed, 30 May 2018 14:26:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 16:26:18 +0200
Message-Id: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 14:26:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 14:26:27 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 0/2] ARM virt: Support up to 256 PCIe buses
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
X-TUID: Hoa4rzHVtqaA

Current Machvirt PCI host controller's ECAM region is 16MB large.
This limits the number of PCIe buses to 16.

PC/Q35 machines have a 256MB region allowing up to 256 buses.
This series tries to bridge the gap.

It declares a new ECAM region located beyond 256GB, of size 256MB
The new ECAM region is used if:
- highmem option is set (default) and,
- either FW is not loaded or we are run an aarch64 guest
- machine type >= 3.0.

aarch32 FW does not support this highmem ECAM region. For guests without
LPAE support the highmem option must be turned off.

Best Regards

Eric

Git: complete series available at
https://github.com/eauger/qemu/tree/v2.12.0-256MB-ECAM-PATCH-v1
Previous version:
https://github.com/eauger/qemu/tree/v2.12.0-256MB-ECAM-RFCv1

- Tested with guest running in aarch64 and aarch32 modes (aarch64=off)
- Tested with aarch32 FW
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


Eric Auger (2):
  hw/arm/virt: Add a new 256MB ECAM region
  hw/arm/virt: Add virt-3.0 machine type

 hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
 hw/arm/virt.c            | 43 ++++++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |  3 +++
 3 files changed, 52 insertions(+), 15 deletions(-)

-- 
2.5.5


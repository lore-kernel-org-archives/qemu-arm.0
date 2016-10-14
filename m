Received: by 10.80.166.35 with SMTP id d32csp166498edc;
        Fri, 14 Oct 2016 01:55:10 -0700 (PDT)
X-Received: by 10.200.55.59 with SMTP id o56mr10261905qtb.65.1476435310446;
        Fri, 14 Oct 2016 01:55:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w21si9083232qtw.46.2016.10.14.01.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 01:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buyGk-00067u-0j
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 04:55:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1buyGg-00065V-Ie
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 04:55:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1buyGc-0004en-CE
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 04:55:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59076)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1buyGc-0004eg-5M; Fri, 14 Oct 2016 04:55:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F8D6624D7;
	Fri, 14 Oct 2016 08:55:01 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-131.ams2.redhat.com
	[10.36.4.131])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E8svlo031637; Fri, 14 Oct 2016 04:54:58 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	prem.mallappa@broadcom.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Fri, 14 Oct 2016 10:54:53 +0200
Message-Id: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 14 Oct 2016 08:55:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/2] ACPI IORT generation for ITS support
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
Cc: tn@semihalf.com, drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eV8iOixZT+Z+

This series completes the support of MSIs for ACPI guest featuring an ITS.

It generates an ACPI IORT table which describes the IO relationship between
the root complex and the ITS. This typically enables vhost-net support on
such guest.

The series applies on top of Drew's series:
[PATCH 0/2] couple ITS support fixups, which is now on target-arm.next.

Original contribution was sent by Prem Mallapa in
[PATCH v2 9/9] [optional] arm: smmu-v3: ACPI IORT initial support,
part of [PATCH v2 0/9] SMMUv3 Emulation support.
https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg04350.html

Prem's 1st integration targetted Root Complex - vSMMU relationship
description whereas this series targets RC - ITS description.

This was tested with a v4.8 guest + rebased Tomasz' series:
- [PATCH V11 0/8] Introduce ACPI world to ITS,
  https://lkml.org/lkml/2016/9/12/926

History:
v1 -> v2:
- addressed Drew's comments, see individual patches

Prem's version -> v1:
- split into 2 separate patches
- iort struct field names match include/acpi/actbl2.h 's ones
- added ITS node
- added ID mapping in RC node
- removed smmu mode


Prem Mallappa (2):
  ACPI: Add IORT Structure definition
  ARM: Virt: ACPI: Build an IORT table with RC and ITS nodes

 hw/arm/virt-acpi-build.c    | 73 ++++++++++++++++++++++++++++++++++++++-------
 include/hw/acpi/acpi-defs.h | 68 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+), 11 deletions(-)

-- 
2.5.5


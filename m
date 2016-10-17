Received: by 10.80.166.35 with SMTP id d32csp439096edc;
        Mon, 17 Oct 2016 05:31:21 -0700 (PDT)
X-Received: by 10.55.16.232 with SMTP id 101mr28451303qkq.28.1476707481559;
        Mon, 17 Oct 2016 05:31:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h64si17819348qtd.3.2016.10.17.05.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 05:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bw74b-0005ph-0x
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 08:31:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bw74W-0005oY-NK
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 08:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bw74T-0007g8-Lg
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 08:31:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bw74T-0007ft-Fp; Mon, 17 Oct 2016 08:31:13 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 000CBC05681D;
	Mon, 17 Oct 2016 12:31:11 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-5-127.ams2.redhat.com
	[10.36.5.127])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HCV8ex025127; Mon, 17 Oct 2016 08:31:09 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	prem.mallappa@broadcom.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Mon, 17 Oct 2016 14:31:04 +0200
Message-Id: <1476707466-14300-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 17 Oct 2016 12:31:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/2] ACPI IORT generation for ITS support
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
X-TUID: McfLwEZzKlGQ

This series completes the support of MSIs for ACPI guest featuring an ITS.

It generates an ACPI IORT table which describes the IO relationship between
the root complex and the ITS. This typically enables vhost-net support on
such guest.

The series applies on top of Drew's [PATCH 0/2] couple ITS support fixups,
which is now on target-arm.next:
https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg02013.html

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
v2 -> v3:
- used sizeof(*iort) as node_offset
- removed idmap->flags = 0;
- misc cleanups

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

 hw/arm/virt-acpi-build.c    | 71 ++++++++++++++++++++++++++++++++++++++-------
 include/hw/acpi/acpi-defs.h | 68 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+), 11 deletions(-)

-- 
2.5.5


Received: by 10.28.91.67 with SMTP id p64csp669591wmb;
        Wed, 28 Feb 2018 06:25:55 -0800 (PST)
X-Google-Smtp-Source: AG47ELsSgpo9CR26QBlwJyFLZSqxG4APfxunT4E9AhPov06tJZr/MGRXEc8eloAfKbpoNiNXAMoX
X-Received: by 2002:a25:d146:: with SMTP id i67-v6mr12440399ybg.495.1519827955551;
        Wed, 28 Feb 2018 06:25:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519827955; cv=none;
        d=google.com; s=arc-20160816;
        b=H25j5u/kIVQVOx17rsY/J+mwELAOQdG3v1z7fYJYvb/2BHOqWsY0qKS6EATrniPppk
         LvbuJdK9DS+d3/Y1vg+h4yFVr/YmR1yCDBNwRAW0W3NOIG15dHfs5y650O/e6mdcIYQs
         o6Bi1pQSvLZTD+r81NUjRCjELXv4buaqoPZK/bpyJHyLDVSpmrqTpx+xRpnvbg7xchV6
         cuV3KXyhnDKFADxmFVZ62i4BwFnIhyPJYxQxmhe6cRdbIk5dcKYlWMBPHf9P0QjwfzdQ
         rz5xt1bF06kXygnc7KwFaTKvlz892sXoz0gfkQXe/rm/Fbl8t7C1oeNSjRK3Lsf/mllz
         VWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=kcLJEZ95cK40lg90gp39j6UzIq3HJBOjRCim91BcDbU=;
        b=NHdd8W7M8yQN3FiQaoZcMe91pcoOTEmXviQ7ogtHB4yN/iW5c+epku7rhWVO+0h2Xg
         L8sfL2GVyHegPlpBxbecROXmQi8cD/TmTIKT9KvZF12vuG5xNwZ3ATzsRkSnv3rvoLyr
         n3k82WlB+nBMPIQT4dO2brBtgPeMMCeIhJ9AfEN2sXAONCXYZmMjn476kwWpT1MTFqq1
         CcXRNMa8Prz7RAKUWM7/RrMX22TdlBjmg8JutJQ1nmf+Yrdr/n58xNFIi+G28eSE+Bss
         0B6UEJ9cFTemzDq5wUimcYxbzouQ+nu9p3RXB9rhWf60ToH7Z3u5DjtE1V4M+3O+R7RT
         KowQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u130si278800ywa.39.2018.02.28.06.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 06:25:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er2g6-0004w1-V8
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 09:25:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fd-0004eK-Im
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fa-0001sE-5r
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40646 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1er2fa-0001s4-0s; Wed, 28 Feb 2018 09:25:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DAC7818535B;
	Wed, 28 Feb 2018 14:25:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 472FD946B7;
	Wed, 28 Feb 2018 14:25:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 15:23:45 +0100
Message-Id: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 28 Feb 2018 14:25:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 28 Feb 2018 14:25:21 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 00/10] generalize build_fadt()
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
Cc: Auger Eric <eric.auger@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dt0kuTej84ok


v2:
  * fix typo in "acpi: remove unused acpi-dsdt.aml"
  * split ACPI_PORT_SMI_CMD into separate cleanup patch
  * s/pm1_/pm1a_/, s/c2_latency/plvl2_lat/, s/c3_latency/plvl3_lat/
    and fix conflicts in followup patches caused by renaming
  * conditional FIRMWARE_CTRL, DSDT patching is introduced in
    the patch that makes build_fadt() generic instead of earlier
    "pc: acpi: isolate FADT specific data into AcpiFadtData structure"
  * update comment to mention that build_fadt() supports 5.1 revision
 =20


Series first cleanups ACPI code around build_fadt() and then
converts current packed structure approach to a build_append_FOO()
API, getting rid of error prone explicit endianness conversions
in code and making build_fadt() look more like APCI table declaration
from spec, which should be easier to read/maintain. After that
build_fadt() becomes generic enough that we could drop ARM specific
implementation and reuse generic build_fadt(), reducing code
duplication.

PS: tested only x86 which has make check coverage,
    ARM was only slightly tested.=20

git tree for testing:
  https://github.com/imammedo/qemu.git fadt_refactoring_v2

CC: "Michael S. Tsirkin" <mst@redhat.com>=20
CC: Shannon Zhao <zhaoshenglong@huawei.com>=20
CC: Auger Eric <eric.auger@redhat.com>
CC: qemu-devel@nongnu.org=20
CC: qemu-arm@nongnu.org=20

Igor Mammedov (10):
  acpi: remove unused acpi-dsdt.aml
  pc: replace pm object initialization with one-liner in
    acpi_get_pm_info()
  acpi: reuse AcpiGenericAddress instead of Acpi20GenericAddress
  acpi: add build_append_gas() helper for Generic Address Structure
  acpi: move ACPI_PORT_SMI_CMD define to header it belongs to
  pc: acpi: isolate FADT specific data into AcpiFadtData structure
  pc: acpi: use build_append_foo() API to construct FADT
  acpi: move build_fadt() from i386 specific to generic ACPI source
  virt_arm: acpi: reuse common build_fadt()
  tests: acpi: don't read all fields in test_acpi_fadt_table()

 include/hw/acpi/acpi-defs.h | 136 ++++++++----------------------
 include/hw/acpi/aml-build.h |  23 ++++++
 include/hw/isa/apm.h        |   3 +
 Makefile                    |   1 -
 hw/acpi/aml-build.c         | 140 +++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |  39 ++++-----
 hw/i386/acpi-build.c        | 196 ++++++++++++++------------------------=
------
 hw/isa/apm.c                |   1 -
 pc-bios/acpi-dsdt.aml       | Bin 4405 -> 0 bytes
 tests/bios-tables-test.c    |  82 ++++--------------
 10 files changed, 294 insertions(+), 327 deletions(-)
 delete mode 100644 pc-bios/acpi-dsdt.aml

--=20
2.7.4


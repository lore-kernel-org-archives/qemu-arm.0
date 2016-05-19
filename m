Received: by 10.25.208.137 with SMTP id h131csp3022257lfg;
        Thu, 19 May 2016 06:19:43 -0700 (PDT)
X-Received: by 10.140.233.140 with SMTP id e134mr14368199qhc.38.1463663983756;
        Thu, 19 May 2016 06:19:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si12462905qkd.274.2016.05.19.06.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 06:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Nrb-0006yH-5K
	for alex.bennee@linaro.org; Thu, 19 May 2016 09:19:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b3NrY-0006wC-6K
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b3NrU-0001x4-02
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:19:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b3NrT-0001ww-Pw; Thu, 19 May 2016 09:19:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBB0B552DB;
	Thu, 19 May 2016 13:19:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4JDJWQW016615; Thu, 19 May 2016 09:19:33 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 May 2016 15:19:24 +0200
Message-Id: <1463663970-23661-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 19 May 2016 13:19:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/6] acpi: simplify bios_linker API
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
Cc: zhaoshenglong@huawei.com, qemu-arm@nongnu.org,
	guangrong.xiao@linux.intel.com, ehabkost@redhat.com, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FbbyWAIxIjD+

Simplify bios_linker API by adding file name + blob tracking
so user would have to suppily less arguments which
reduces chances of mistake by using wrong blob pointer
with not related file.
And also refactor API to take file offsets,
which is what is usualy used in context of file APIs,
(and as it's what actually current API were doing only internally),
instead of using host pointers.
I hope it makes it easier for user to use API without
need to look at implementation in QEMU/SeaBIOS. 


Igor Mammedov (6):
  acpi: convert linker from GArray to BIOSLinker structure
  acpi: simplify bios_linker API by removing redundant 'table' argument
  acpi: cleanup bios_linker_loader_cleanup()
  tpm: apci: cleanup TCPA table initialization
  acpi: make bios_linker_loader_add_pointer() API offset based
  acpi: make bios_linker_loader_add_checksum() API offset based

 hw/acpi/aml-build.c                  |  33 +++----
 hw/acpi/bios-linker-loader.c         | 179 +++++++++++++++++++++--------------
 hw/acpi/nvdimm.c                     |  22 +++--
 hw/arm/virt-acpi-build.c             |  56 +++++------
 hw/i386/acpi-build.c                 |  92 +++++++++---------
 include/hw/acpi/aml-build.h          |   7 +-
 include/hw/acpi/bios-linker-loader.h |  28 +++---
 include/hw/mem/nvdimm.h              |   3 +-
 8 files changed, 235 insertions(+), 185 deletions(-)

-- 
1.8.3.1


Received: by 10.28.71.27 with SMTP id u27csp1913085wma;
        Thu, 22 Feb 2018 04:44:42 -0800 (PST)
X-Google-Smtp-Source: AH8x2254ks46OkSdUhMksPNdJIDztKo7qAYHcdaqiorOMdoyVV9zCa708nAxT5jHUH8Z8aBxNkel
X-Received: by 2002:a25:108a:: with SMTP id 132-v6mr4557012ybq.55.1519303482341;
        Thu, 22 Feb 2018 04:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519303482; cv=none;
        d=google.com; s=arc-20160816;
        b=AcRrTm9iOYnT6X8Gx3Vg0DEkYO3tmmn0OQDeUnbaZxVum26w9eA4dgDGbd33ZrytpL
         /OjMaRexjymE+p/FMSjpX/dtAuzlUB+EnOmBSqfFBK0Wi6QMJ3i5To1mYSXG/cCSfLfC
         +xZPepw/R8Pm5xAiKGNl1aQlx+TL5wgji65uPpPDs5p33fa3UC5rvcGsiAMM0NYnHHjY
         qVpBC8/AnkcSR/NCMhlPSwlIdkJC3cN1KDs5W7B9fS2XSdA8BLPTEcmsXB3cx9UZxB0x
         qylBAZXbs6pqT5UTI4/KUAG7ed5kgOoJ7vWiWlLtV15672iIjpDDTVn5O+gzezhV7utP
         pUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=SoRhGQApLVKc/mnnMrn5T+aXHsAVqrHs2mu2b1UV18E=;
        b=etLfV+iS/AtmDBodbwLogQWNRIusszoVWnx7fbDtx9gSNZLc5R60JBwkpLqqoEVB/H
         O9i8k9JRxN1sYlsSgQCqNt2Zd4uFE+zQ6YCesp42bQZrvsMMhxNKLA0Fs4artjTISFiu
         HcDNPDdWNPaVF2vIYcGk1/1dBDZzyPszdzmXSGVkC4uljZ2o7Kak38pnTqhFBrVCoQjU
         Ne4XFRlQ5TQGzKkNW3iQXTYYMqeKTk4vHNZ1R2J3HwTxTpbScWGPUfUpAjMTxqDnZHfg
         prgnP3AudVflYn47fLVC8s7bg1ebkIK2V1XdaGRoBJeUkxOBSyFYAWfc5++ABNyTgPGG
         PIoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j190si966ywd.529.2018.02.22.04.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 04:44:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqEr-0005Wh-Mn
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 07:44:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEb-0005Ur-9m
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEY-0004mZ-7c
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58218 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoqEY-0004m5-2t; Thu, 22 Feb 2018 07:44:22 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9871140FB647;
	Thu, 22 Feb 2018 12:44:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 906E02026E0E;
	Thu, 22 Feb 2018 12:44:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Feb 2018 13:42:47 +0100
Message-Id: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Feb 2018 12:44:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Feb 2018 12:44:21 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 0/9] generalize build_fadt()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eMTXA44T4uPg

Series first cleanups ACPI code around build_fadt() and then
converts current packed structure approach to a build_append_FOO()
API, getting rid of error prone explicit endianness conversions
in code and making build_fadt() look more like APCI table declaration
from spec, which should be easier to read/maintain. After that
build_fadt() becomes generic enough that we could drop ARM specific
implementation and reuse generic build_fadt(), reducing code
duplication.

PS: tested only x86 which has make check coverage,
    ARM was only slightly tested. 

git tree for testing:
  https://github.com/imammedo/qemu.git fadt_refactoring_v1

CC: "Michael S. Tsirkin" <mst@redhat.com> 
CC: Shannon Zhao <zhaoshenglong@huawei.com> 
CC: Peter Maydell <peter.maydell@linaro.org> 
CC: Andrew Jones <drjones@redhat.com>
CC: qemu-devel@nongnu.org 
CC: qemu-arm@nongnu.org 

Igor Mammedov (9):
  acpi: remove unused acpi-dsdt.aml
  pc: replace pm object initialization with one-liner in
    acpi_get_pm_info()
  acpi: reuse AcpiGenericAddress instead of Acpi20GenericAddress
  acpi: add build_append_gas() helper for Generic Address Structure
  pc: acpi: isolate FADT specific data into AcpiFadtData structure
  pc: acpi: use build_append_foo() API to construct FADT
  acpi: move build_fadt() from i386 specific to generic ACPI source
  virt_arm: acpi: reuse common build_fadt()
  tests: acpi: don't read all fields in test_acpi_fadt_table()

 include/hw/acpi/acpi-defs.h | 136 +++++++-----------------------
 include/hw/acpi/aml-build.h |  23 ++++++
 Makefile                    |   1 -
 hw/acpi/aml-build.c         | 140 +++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |  39 ++++-----
 hw/i386/acpi-build.c        | 197 ++++++++++++++------------------------------
 pc-bios/acpi-dsdt.aml       | Bin 4405 -> 0 bytes
 tests/bios-tables-test.c    |  82 ++++--------------
 8 files changed, 292 insertions(+), 326 deletions(-)
 delete mode 100644 pc-bios/acpi-dsdt.aml

-- 
2.7.4


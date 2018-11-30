Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3551228wrt;
        Fri, 30 Nov 2018 05:05:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WGODTmZELHB7ECY8Plhi8KPrbSCV8j/vgLz5R+gK5bsAtcmg6mB8CF5NNwM/u3AlU0Ovq9
X-Received: by 2002:a81:51c7:: with SMTP id f190mr5555942ywb.162.1543583117093;
        Fri, 30 Nov 2018 05:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583117; cv=none;
        d=google.com; s=arc-20160816;
        b=e3fMN6G/Aii7RTiFhiBiuUN7nuz1jUjxuB4VAj2+B+yiAqznQFcFrvWWTgORZVjeT4
         re+isHAno9TDUtAIpH8sAWLt6S+9RneVzAhSCZNALaSBh5IMtH8nb+9+qkxoOTD6/yOP
         Q0Spkym0/XKiFRa+B1xEdcK1R6fP6BOJb80tRd5iZ8pjH1W8bAOUcT6frvBFBLMxLZUN
         IVEe29/deHp+XFsfU5sTEAyefB6wOCEAATCWcHLf3aaFDqz2e2UXJ2kqYqteGg4oWfqa
         pwp71ZA6rZ5JXrO6aW5RkIKkkWMZvjfZzew33qwJn4vkX3CAORxCLUfrLjUVzwb3irZL
         awCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=R81XcgVB3S9vWBk1n7LzK1LpslEq7SccQEhWvN4LELE=;
        b=QXRRIYH+keNETKLgraKqvnaVIIs5/+5VVTJTUjIhKLHyU7050Ip5nnYz3MyKfssNEL
         2oX9/l48O3t4etbNWcjc7JC8uNew2aUKlj53Zi0QJww6zNdvlUJ5eiXdzcvYFeqhyHPJ
         4nq0lnohkCuNI5EcGE4m7ENQLwXT8/rcl8iaaeHRl9XynydMeYOVi/yjdM22Nk4QkvH4
         jKdIGtGaAl+TVIv/yDDvVwuA3BKduNEamBTj+mv9rTXfT+QxtFnEFMRfvQHSgs7V3IGa
         E0wbvK74iBWB9oNyXKin8moN/SanWQ9kL+k9myhUfdxq3X1uWWdaX+a1JVgGShe4j32t
         N3og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17-v6si3052495ybk.126.2018.11.30.05.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiTs-00084P-G0
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:05:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQF-00040M-5v
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 08:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQB-0004sk-Tn
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 08:01:31 -0500
Received: from mga05.intel.com ([192.55.52.43]:3956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiPv-0004cY-Rb; Fri, 30 Nov 2018 08:01:12 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293505156"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:05 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:24 +0100
Message-Id: <20181130130032.11835-1-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-arm] [PATCH v3 0/8] hw: acpi: RSDP fixes and refactoring
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qgskbGInB65P

This patch serie fixes a couple of RSDP checksum related issues:

- On RSDP rev2, we are not adding the extended checksum and computing
  the checksum on the full table instead of the first 20 bytes.
- On RSDP rev1, we are computing the checksum on 36 bytes instead of 20.
  We're lucky enough that this is only adding zeroes to the checksum.

A guest Linux kernel does not seem to care about RSDP checksums, so
those 2 fixes are mostly for correctness sake.
Any machine type that generates rev2 RSDP will see its RSDP table
modified but since x86 builds RSDP v1 and all ACPI tests only run on
either pc or q35, the ACPI tests tables are not affected by this fix.

The serie also extends the ARM virt ACPI RSDP build routine to support
both RSDP v1 and v2, in order to share this code between x86 and
aarch64. While extending, we also convert the routine to the latest
build_append_foo() API. The new implementation is a closer reflection of
the ACPI spec itself, is endian agnostic and allows for getting rid of the
AcpiRsdpDescriptor structure.

V2 -> V3:
  * Add Reviewed-Bys from Igor and Andrew.
  * Check for valid RSDP and XSDT pointers depending on the revision.
  * Use RSDP initial table len as offset for checksum and pointer
    insertion.
  * Do not explictly pass RSDP revision as the RSDP table parsing test
    utility.

v1 -> v2:
  * Add missing SOBs.
  * Rephrase some commit messages according to the maintainer's input.
  * Replace ACPI spec definitions with hard coded constants.
  * Replace init_rsdp_data() helper with open coded rsdp variable init.
  * Rename acpi_find_[rx]sdt_address to acpi_get_[rx]sdt_address.

Igor Mammedov (2):
  hw: arm: acpi: Fix incorrect checksums in RSDP
  hw: i386: Use correct RSDT length for checksum

Samuel Ortiz (6):
  hw: acpi: The RSDP build API can return void
  hw: arm: Carry RSDP specific data through AcpiRsdpData
  hw: arm: Convert the RSDP build to the buid_append_foo() API
  hw: arm: Support both legacy and current RSDP build
  hw: acpi: Export and share the ARM RSDP build
  hw: acpi: Remove AcpiRsdpDescriptor and fix tests

 include/hw/acpi/acpi-defs.h | 19 ++++-------
 include/hw/acpi/aml-build.h |  2 ++
 tests/acpi-utils.h          |  4 ++-
 hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 40 +++++-----------------
 hw/i386/acpi-build.c        | 36 +++++---------------
 tests/acpi-utils.c          | 46 ++++++++++++++++++++-----
 tests/bios-tables-test.c    | 21 +++++++++---
 tests/vmgenid-test.c        |  8 +++--
 9 files changed, 157 insertions(+), 87 deletions(-)

-- 
2.19.2


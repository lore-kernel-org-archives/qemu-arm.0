Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2336125wrt;
        Thu, 29 Nov 2018 05:27:27 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X2K71N0J118D7DfrB1f4dju7pj7tq52TM6a3fqe7xW93XiG0kx8ULXsbU7ADSeNj8jTk3s
X-Received: by 2002:a81:5142:: with SMTP id f63mr1276586ywb.11.1543498047730;
        Thu, 29 Nov 2018 05:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543498047; cv=none;
        d=google.com; s=arc-20160816;
        b=hjIT/s/aLnXY5bQfezanLNIjaVNo1wKvdbUjO0VPJdtSErCxL0EZiqr2hLnXAhkJ0B
         XjiM/6ck8IYvh3r9e+C778VYm+aDGkoXSyvYqdC3GR6eRmvi5LVWhZQw3KfkQewze9L7
         ew0rgLhZzoYXHYjZqw1uVRGH9vv5NDFNsvwGETmeLm+amY6A/OtDOZaF1CwUeAZZE5Fb
         2oxZcb4c+jBf/Bbhzntk2pHC2iU8i2bpENoL+MQzw4vgjH8u1+BH/gryiIbjQDYUJhWI
         NczBgdflNIWyhHevbQG7FFxoU/gyA2nrhd/6hqZOrpB5cBZ/39KPuwzfxT9vbbD7leYl
         sU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=EXTfIA3Sjun3Hcvbzt9iz8GJUc7/HL2TBSE6mAdjKxE=;
        b=Aed6PAWULCD1UQTjFxWI3HEMJgFa6ffSsICCuTuvLL+04tRxv3wYayQOx7OM9ye5NR
         i4Y3IsOIKuhjT7z/3sD22sSh1AIiRfPobo00g/5OaH57xiSMb8PrUWddviEzeOJ3mOzy
         o7bWTeIaHe9n3uUsxjkWzhqpdQtm6Ev5IjmWWObrWE6NQZYepkl4yzZJlmCE/L0k4Tae
         6QxWqNjLA5C0Hne6CA1Dw2GgC1K9d+PqmMikervyXPa1fS532BBBn17t/BJlkSPt3Nus
         OPnlcZTUQnUogH1aptK9dVBLOcS1smX67/pgnTF0RLvcZfJ9mNJAhvu59gRyxljhRbvA
         nz+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k204-v6si1110460ywb.115.2018.11.29.05.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 05:27:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSMLn-0001CH-4y
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 08:27:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMJf-0000BY-88
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 08:25:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSMJZ-0001Om-MV
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 08:25:15 -0500
Received: from mga09.intel.com ([134.134.136.24]:31202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSMJY-00019W-SF; Thu, 29 Nov 2018 08:25:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 05:25:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,294,1539673200"; d="scan'208";a="97547146"
Received: from hharjula-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.29.114])
	by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2018 05:25:00 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Nov 2018 14:24:20 +0100
Message-Id: <20181129132428.333-1-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v2 0/8] hw: acpi: RSDP fixes and refactoring
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /nTS4byxWV7T

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

 include/hw/acpi/acpi-defs.h | 19 ++++++--------
 include/hw/acpi/aml-build.h |  2 ++
 tests/acpi-utils.h          |  5 +++-
 hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 40 +++++++----------------------
 hw/i386/acpi-build.c        | 36 +++++++-------------------
 tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++------
 tests/bios-tables-test.c    | 27 ++++++++++++++------
 tests/vmgenid-test.c        |  8 +++---
 9 files changed, 143 insertions(+), 90 deletions(-)

-- 
2.19.2


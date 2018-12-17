Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2352474wrt;
        Mon, 17 Dec 2018 03:10:40 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WfHfHY/guDiLTC6g+ovdVJOa+crm+qNsW6lknCCwAhI52q7XGFOrzcamPTCsCnWKrDDpZK
X-Received: by 2002:ac8:2eb8:: with SMTP id h53mr12607528qta.18.1545045040640;
        Mon, 17 Dec 2018 03:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545045040; cv=none;
        d=google.com; s=arc-20160816;
        b=DtFeL1GgzYbT5BpgANN/rivKOIJ9ziT+eI4d0cnCSUd/I4mp5j/NPf1PpZqDIeMP8d
         JgTDFJFAAwlFXUpxNtGhItXdz922K96fwSOou77MmupBgndaQ+fapokJo8TcHSQ3NU13
         qBQ5iMNuS33Dz3IHyRM9+X6LEcdUjNy0tq2HUVc5OnUWplaIfbUwdBnhjAd5TfavKH7t
         95y8pUDygOvAXeFPs9L2KVp3Rj5+35JTPv6AOJXFR+3EZY1xPfdrO7NcQYPfSk4m99a1
         w2DHjmk5keNldBWDXgt6ACf6TR53za7T9TGF6bMbG1tgALfOrazYduvzoQAbxTAJoUJi
         vrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=xqdWCOX3905DwPpVsopWQSLGSBMh3f7t7GhsQpN5pbM=;
        b=cQLKomnDb0nQqkpFtiDQZ6f+HMEjKXFQvHHR8+a7NqbmquzjrF3Me8KL6NqIipeJjS
         tsZQKDbKi5e0PHrn3gZkT9Rfmi0OucvW6Djnts2uoYVUWQkUnbQo/cbxpCKqUzOHZSZu
         hqGTci8tczIjnh5UL2uHd9RayqDWWR78liujb3Val09UrtDao/hNs1WZ1qyCAPOQv9fB
         7IlA2VbXwt8WTawui5VgSmu7xt7YZlL7GpLHQX83x/MkhxQkibmH4kQwzecJJVAkrT56
         PrmGDLUEEuTDkxf4ZDXAEnOTJ9NpppnIaJUty7PJZ9TePVDIBXKdBGxE2k6pFkisG8cB
         3HxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p14si2548006qvp.222.2018.12.17.03.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 03:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYqnH-0002tI-TK
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 06:10:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqcS-0002Y7-TE
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 05:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqSe-0003Ju-KW
	for qemu-devel@nongnu.org; Mon, 17 Dec 2018 05:49:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:26404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYqSc-0003F1-O5; Mon, 17 Dec 2018 05:49:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 02:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="130583618"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.185])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2018 02:49:04 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Dec 2018 11:48:30 +0100
Message-Id: <20181217104838.18957-1-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH v4 0/8] hw: acpi: RSDP fixes and refactoring
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
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W8cliy9buYcf

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

V3 -> V4:
  * Add missing Reviewed-Bys from Igor and Andrew.
  * Removed unneeded white space addition.
  * Added 16 bytes padding to revision 0 RSDP structures for legacy (2.2
    and older) machine types.
  * Fixed a missing break in an ACPI RSDP test switch.

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
 hw/i386/acpi-build.c        | 46 +++++++++++--------------
 tests/acpi-utils.c          | 46 ++++++++++++++++++++-----
 tests/bios-tables-test.c    | 22 +++++++++---
 tests/vmgenid-test.c        |  8 +++--
 9 files changed, 168 insertions(+), 87 deletions(-)

-- 
2.19.2


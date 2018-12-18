Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3145270wrt;
        Mon, 17 Dec 2018 17:11:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U0Sq8gkT9S1HoMW3LBnJomo22G+WkyTOMtpBgmWYjR29skRNkeNauIXAUzTvZSRXiSgEXn
X-Received: by 2002:a37:a06:: with SMTP id 6mr13015675qkk.52.1545095470852;
        Mon, 17 Dec 2018 17:11:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545095470; cv=none;
        d=google.com; s=arc-20160816;
        b=tSQLNn36vzkanG2cNU6cRPNTqml+YzXmDwGOuZYg72+W9BHSKicVyYdpaffqJo+w7P
         EBpE37PhTF93tx3t9PSUpvdT60CJ+5wSyNFKZiYfoEQSOau/H9ea0Fm9npRlvzCGTej/
         bwis/4e5LZbkGsnnVDFtj1kkFr+vFtBkNUjzf4URnfG/pYxggB7hJoHsOw3iJtw/Cwxe
         WsHFfXMLC+wtH6y3umLR9e4sTkshgrEU7SeaKcah5R8SA17T0aFfYDRjLcT9mB3TW108
         qm9cjJEGYkk6gLce8yHmdeQjDn02BuIXCUnhu3RhN2Da35mZQObwRXk4fhcr9SkjMA2v
         So2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=cAsSt6KU18CjxqdhBkcvCDZxbflRxv8P1WStwcXbQug=;
        b=cdCDKZxNVKCRY9qMFiaP8vm7qZ915RgGPD4duqHOhfl/6SFhG/ARgMOgGb1IuUdspU
         18AvywSlulLvJIWwIUhKBAa62CiHM5p5ULJVSaYhjA+aJJ01+lE67jzWQN8yKKTqZbS9
         64FsBp7bCCber5InsAn7SQ/vxZRyz+Rzx2VWx7dsonCIr2nnYMozOoccLnm2CY6WH2Sa
         Rn3o00AVATecA1Rsmn6WhNY73xI1wYkKbro8itIJCgxLHNWPoQdkFZGmAn7iGWgNPs7V
         I4mKO2cgC1jzz1p/QMY/sM5WFHYlvUUBdl8J/2VfvIgVlq6J3kZjBr5RpAloGLn6zi1s
         FWSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11si4365469qvc.143.2018.12.17.17.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 17:11:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gZ3ug-0005Xq-BH
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 20:11:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ3ua-0005Xl-0X
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 20:11:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gZ3uW-0006FF-SC
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 20:11:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gZ3uW-0006EH-J4; Mon, 17 Dec 2018 20:11:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7798D432BF;
	Tue, 18 Dec 2018 01:10:59 +0000 (UTC)
Received: from redhat.com (ovpn-120-67.rdu2.redhat.com [10.10.120.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id C242960BEC;
	Tue, 18 Dec 2018 01:10:57 +0000 (UTC)
Date: Mon, 17 Dec 2018 20:10:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181217201034-mutt-send-email-mst@kernel.org>
References: <20181217104838.18957-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217104838.18957-1-sameo@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 18 Dec 2018 01:10:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/8] hw: acpi: RSDP fixes and refactoring
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JRqVXTQ7KK6R

On Mon, Dec 17, 2018 at 11:48:30AM +0100, Samuel Ortiz wrote:
> This patch serie fixes a couple of RSDP checksum related issues:
> 
> - On RSDP rev2, we are not adding the extended checksum and computing
>   the checksum on the full table instead of the first 20 bytes.
> - On RSDP rev1, we are computing the checksum on 36 bytes instead of 20.
>   We're lucky enough that this is only adding zeroes to the checksum.
> 
> A guest Linux kernel does not seem to care about RSDP checksums, so
> those 2 fixes are mostly for correctness sake.
> Any machine type that generates rev2 RSDP will see its RSDP table
> modified but since x86 builds RSDP v1 and all ACPI tests only run on
> either pc or q35, the ACPI tests tables are not affected by this fix.
> 
> The serie also extends the ARM virt ACPI RSDP build routine to support
> both RSDP v1 and v2, in order to share this code between x86 and
> aarch64. While extending, we also convert the routine to the latest
> build_append_foo() API. The new implementation is a closer reflection of
> the ACPI spec itself, is endian agnostic and allows for getting rid of the
> AcpiRsdpDescriptor structure.


OK I queued this, so we can proceed to do incremental patches on top.

> V3 -> V4:
>   * Add missing Reviewed-Bys from Igor and Andrew.
>   * Removed unneeded white space addition.
>   * Added 16 bytes padding to revision 0 RSDP structures for legacy (2.2
>     and older) machine types.
>   * Fixed a missing break in an ACPI RSDP test switch.
> 
> V2 -> V3:
>   * Add Reviewed-Bys from Igor and Andrew.
>   * Check for valid RSDP and XSDT pointers depending on the revision.
>   * Use RSDP initial table len as offset for checksum and pointer
>     insertion.
>   * Do not explictly pass RSDP revision as the RSDP table parsing test
>     utility.
> 
> v1 -> v2:
>   * Add missing SOBs.
>   * Rephrase some commit messages according to the maintainer's input.
>   * Replace ACPI spec definitions with hard coded constants.
>   * Replace init_rsdp_data() helper with open coded rsdp variable init.
>   * Rename acpi_find_[rx]sdt_address to acpi_get_[rx]sdt_address.
> 
> Igor Mammedov (2):
>   hw: arm: acpi: Fix incorrect checksums in RSDP
>   hw: i386: Use correct RSDT length for checksum
> 
> Samuel Ortiz (6):
>   hw: acpi: The RSDP build API can return void
>   hw: arm: Carry RSDP specific data through AcpiRsdpData
>   hw: arm: Convert the RSDP build to the buid_append_foo() API
>   hw: arm: Support both legacy and current RSDP build
>   hw: acpi: Export and share the ARM RSDP build
>   hw: acpi: Remove AcpiRsdpDescriptor and fix tests
> 
>  include/hw/acpi/acpi-defs.h | 19 ++++-------
>  include/hw/acpi/aml-build.h |  2 ++
>  tests/acpi-utils.h          |  4 ++-
>  hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 40 +++++-----------------
>  hw/i386/acpi-build.c        | 46 +++++++++++--------------
>  tests/acpi-utils.c          | 46 ++++++++++++++++++++-----
>  tests/bios-tables-test.c    | 22 +++++++++---
>  tests/vmgenid-test.c        |  8 +++--
>  9 files changed, 168 insertions(+), 87 deletions(-)
> 
> -- 
> 2.19.2

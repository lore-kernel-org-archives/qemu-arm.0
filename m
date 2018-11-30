Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3407895wrt;
        Fri, 30 Nov 2018 02:29:52 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W1iwYUg0vQ/ekLEotDUAzFJJqSZC/2ccOOLzh3cjS/jwC7YDY/uu2mKj6eQcYEE+hirFil
X-Received: by 2002:a81:83d6:: with SMTP id t205mr5031657ywf.497.1543573792111;
        Fri, 30 Nov 2018 02:29:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543573792; cv=none;
        d=google.com; s=arc-20160816;
        b=HaSSKMXUuPmUxBKqittIprufYVxwfn9hsCcFgQZVzQ82l/+hl6u0j71C8QdYs+G9Kw
         mpTPbnySN/yARkL56OvLWNm5MEKW+t4kug3QGjIfiBL0z3Nud4o/x8F/OEgElc9bHfUz
         BPsUPoAbLNWaA8H/zPz3VsDn7K7h9E1zDMc4dNpgTjjci6PnUqOfTLR5nqG+5ZQE3upP
         STPuHlNy0J+S0V8O6Evarnl5eHDRrQaHvJ3Z+6Hj5cVIXbEum9Kb0zzmxSt5HrL+xFjp
         kGGANJU+hHlLh+iX0LJBjYyAeibJS6c4Bbh/ckAClz6uwe5MQUmawgLtfDPpAS2+qpYo
         vYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=PafWzXWHa2u+fJjYt4kB0rKYdAV7/r5aUjfXNwdAXtk=;
        b=Yzu9wiOBE8mp60u6K7xiD/G+WBY15Nls67tlA6CA6dDtZWn4tcfc6sPF6FYF4MxmoU
         mbA5x5+a82PlN0tvzsw/nw401uSD1Nv36TqBiCnnFJoGODOM+fN/gLFPRpbCqDMDFcBd
         nvhr3QlqBS25G6uPllxFKvV+3XL8vckQ/f95fRSQjuhnEObqHbZUxw7NaeODJjX6w3t/
         KpW52YWDsA6ioP/dSNrVxYFRzx5rqvMC4qe++n08gsCePde6p2p9YtgHsg6mxv+PsGol
         Q3X1UbfJNlaHktpvFqnOimkc7X/PR0JmvOH3yAZcIdnN1aAlR3fhB7bN0uAmzKe98CXS
         p+qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b127-v6si2791102ybg.49.2018.11.30.02.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 02:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSg3S-0001wN-SZ
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 05:29:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSg3K-0001wC-4f
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 05:29:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSg3G-0005ko-4M
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 05:29:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSg3F-0005kW-LQ; Fri, 30 Nov 2018 05:29:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A191804FC;
	Fri, 30 Nov 2018 10:29:35 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06BDD19743;
	Fri, 30 Nov 2018 10:29:30 +0000 (UTC)
Date: Fri, 30 Nov 2018 11:29:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130112929.238fe26c@redhat.com>
In-Reply-To: <20181129132428.333-1-sameo@linux.intel.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 30 Nov 2018 10:29:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/8] hw: acpi: RSDP fixes and
 refactoring
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IuSnygzXrY+k

On Thu, 29 Nov 2018 14:24:20 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

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

Series needs to fix up minor issues but otherwise it looks good.

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
>  include/hw/acpi/acpi-defs.h | 19 ++++++--------
>  include/hw/acpi/aml-build.h |  2 ++
>  tests/acpi-utils.h          |  5 +++-
>  hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 40 +++++++----------------------
>  hw/i386/acpi-build.c        | 36 +++++++-------------------
>  tests/acpi-utils.c          | 46 ++++++++++++++++++++++++++++------
>  tests/bios-tables-test.c    | 27 ++++++++++++++------
>  tests/vmgenid-test.c        |  8 +++---
>  9 files changed, 143 insertions(+), 90 deletions(-)
> 


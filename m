Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp745387wrw;
        Fri, 9 Nov 2018 06:24:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5fhx6QSrZrqeDoOzzGLu80Y71X1u9qALEbQvR6m2WETD1e4I4CCwHM0DdSF++gMv2kmv5/l
X-Received: by 2002:ac8:2ccc:: with SMTP id 12mr1312793qtx.277.1541773470309;
        Fri, 09 Nov 2018 06:24:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541773470; cv=none;
        d=google.com; s=arc-20160816;
        b=L3zw9cb2BVmQH67Ps2nEbM09pIP+exllTuA/Efz5RSTh92YpaDS+m0wk3c/uOU3NrA
         2ANikibZwKtOK3aRJ1HAMiO/ZSJ4IEdX4uZ3GFPPLUOnvMdCJ+3/9W9NuBSId25arJ2f
         we3bid0GcbN9/cFC8uRDQ231xUFwsEsrBcNMIrh6A0tJ/eHD0tAQW2YOaE//b3Xt3U4B
         SjED0tbE7vXI4zMTqxZUkwujBpvlGlNgCGOs+rl6crTqCTwnp5/8oZn59R2pmqR07sQv
         S0O7+OtT50xvdBvQzlGQc48/vNTi/yLM1saRAbLW6GHtdE52NDMn/m+ihodwKfGLZv1l
         P/ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=wNLmwPht/dpa5TOMIb/3Qzw3mW6TcjzpwHWgDwbwioY=;
        b=uoe4JSBKoUgEvcOM7DC6kNPtyNoFjnMkBmQIg/0OWuFkJihTevl3kknxdw8p+KrZZf
         htg4DJmWUK+FsuKoSdOJZtJxrD7XdMavZz5RqBVFJ0RF2V9LzzfZ8jxGWTx3uEsZf6+X
         XEi40hHDU0kR/w7uvsttmSAwMUTyBJ82Y/OhQx39iEUXMRksKpBX4VcWOmrWFdJeVs14
         C+DAA/5t06E5FtsBO/t9CLacR+PirWDyxlHV0C/wKMXzMidpHQipmsso5vnLTZccQaxB
         LRrvUwx4Y8E8zz6nP6+bALblpE1vyOMLVzdco7VTY3z2G1jNeAF9nuHUEy7Q3ONCznTr
         j+bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o187si5911859qkb.117.2018.11.09.06.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 06:24:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL7i1-0007o4-OH
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 09:24:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL7hN-0007mo-Op
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 09:23:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL7hM-00081n-0E
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 09:23:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gL7h7-0007Z8-8q; Fri, 09 Nov 2018 09:23:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2211B3DE04;
	Fri,  9 Nov 2018 14:23:24 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C50C95C220;
	Fri,  9 Nov 2018 14:23:17 +0000 (UTC)
Date: Fri, 9 Nov 2018 15:23:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181109152316.43b79217@redhat.com>
In-Reply-To: <20181105014047.26447-2-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-2-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Nov 2018 14:23:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 01/24] hw: i386: Decouple the ACPI build
 from the PC machine type
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tWx9jpQZsyV4

On Mon,  5 Nov 2018 02:40:24 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> ACPI tables are platform and machine type and even architecture
> agnostic, and as such we want to provide an internal ACPI API that
> only depends on platform agnostic information.
> 
> For the x86 architecture, in order to build ACPI tables independently
> from the PC or Q35 machine types, we are moving a few MachineState
> structure fields into a machine type agnostic structure called
> AcpiConfiguration. The structure fields we move are:

It's not obvious why new structure is needed, especially at
the beginning of series. We probably should place this patch
much later in the series (if we need it at all) and try
generalize a much as possible without using it.

And try to come up with an API that doesn't need centralized collection
of data somehow related to ACPI (most of the fields here are not generic
and applicable to a specific board/target).

For generic API, I'd prefer a separate building blocks
like build_fadt()/... that take as an input only parameters
necessary to compose a table/aml part with occasional board
interface hooks instead of all encompassing AcpiConfiguration
and board specific 'acpi_build' that would use them when/if needed.

We probably should split series into several smaller
(if possible independent) ones, so people won't be scared of
its sheer size and run away from reviewing it.
That way it would be easier to review, amend certain parts and merge.

acpi_setup() & co probably should be the last things that's are
generalized as they are called by concrete boards and might collect
board specific data and apply compat workarounds for building ACPI tables
(assuming that we won't push non generic data into generic API).

See more comments below

>    HotplugHandler *acpi_dev
>    AcpiNVDIMMState acpi_nvdimm_state;
>    FWCfgState *fw_cfg
>    ram_addr_t below_4g_mem_size, above_4g_mem_size
>    bool apic_xrupt_override
>    unsigned apic_id_limit
>    uint64_t numa_nodes
>    uint64_t numa_mem
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  hw/i386/acpi-build.h     |   4 +-
>  include/hw/acpi/acpi.h   |  44 ++++++++++
>  include/hw/i386/pc.h     |  19 ++---
>  hw/acpi/cpu_hotplug.c    |   9 +-
>  hw/arm/virt-acpi-build.c |  10 ---
>  hw/i386/acpi-build.c     | 136 ++++++++++++++----------------
>  hw/i386/pc.c             | 176 ++++++++++++++++++++++++---------------
>  hw/i386/pc_piix.c        |  21 ++---
>  hw/i386/pc_q35.c         |  21 ++---
>  hw/i386/xen/xen-hvm.c    |  19 +++--
>  10 files changed, 257 insertions(+), 202 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
> index 007332e51c..065a1d8250 100644
> --- a/hw/i386/acpi-build.h
> +++ b/hw/i386/acpi-build.h
> @@ -2,6 +2,8 @@
>  #ifndef HW_I386_ACPI_BUILD_H
>  #define HW_I386_ACPI_BUILD_H
>  
> -void acpi_setup(void);
> +#include "hw/acpi/acpi.h"
> +
> +void acpi_setup(MachineState *machine, AcpiConfiguration *acpi_conf);
>  
>  #endif
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index c20ace0d0b..254c8d0cfc 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -24,6 +24,8 @@
>  #include "exec/memory.h"
>  #include "hw/irq.h"
>  #include "hw/acpi/acpi_dev_interface.h"
> +#include "hw/hotplug.h"
> +#include "hw/mem/nvdimm.h"
>  
>  /*
>   * current device naming scheme supports up to 256 memory devices
> @@ -186,6 +188,48 @@ extern int acpi_enabled;
>  extern char unsigned *acpi_tables;
>  extern size_t acpi_tables_len;
>  
> +typedef
> +struct AcpiBuildState {
> +    /* Copy of table in RAM (for patching). */
> +    MemoryRegion *table_mr;
> +    /* Is table patched? */
> +    bool patched;
> +    void *rsdp;
> +    MemoryRegion *rsdp_mr;
> +    MemoryRegion *linker_mr;
> +} AcpiBuildState;
> +
> +typedef
> +struct AcpiConfiguration {
We used to have a similar intermediate structure PcGuestInfo,
but got rid of it in the end. Even with other questions aside
I'm not quite convinced that it's good idea to reintroduce similar
one again.


> +    /* Machine class ACPI settings */
> +    int legacy_acpi_table_size;
> +    bool rsdp_in_ram;
> +    unsigned acpi_data_size;
 (*) well, all 2 are the legacy stuff, I'd rather not to push it into
generic API and keep it in the caller as board specific/machine
version code.

> +
> +    /* Machine state ACPI settings */
> +    HotplugHandler *acpi_dev;
> +    AcpiNVDIMMState acpi_nvdimm_state;
> +
> +    /*
> +     * The fields below are machine settings that
> +     * are not ACPI specific. However they are needed
> +     * for building ACPI tables and as such should be
> +     * carried through the ACPI configuration structure.
> +     */
if they are not ACPI specific, then it shouldn't be in acpi
configuration. Some of the fields are compat hacks, which doesn't
belong to generic API so I'd leave them in board specific code
and some are target specific which also doesn't belong in generic
place.

> +    bool legacy_cpu_hotplug;
> +    bool linuxboot_dma_enabled;
> +    FWCfgState *fw_cfg;

> +    ram_addr_t below_4g_mem_size, above_4g_mem_size;;
Just curious, how is this applicable to i386/virt machine?
Does it also have memory split in 2 regions?
Is it possible to have only one region?

> +    uint64_t numa_nodes;
> +    uint64_t *node_mem;
that's kept in PCMachine for the sake of legacy SeaBIOS
which builds ACPI tables on its own.
I'd suggest to use existing globals instead (like ARM does)
so that we wouldn't have to hunt down extra copies later
when those globals are re-factored to properties.

> +    bool apic_xrupt_override;
> +    unsigned apic_id_limit;
> +    PCIHostState *pci_host;
> +
> +    /* Build state */
> +    AcpiBuildState *build_state;
> +} AcpiConfiguration;
> +
[...]

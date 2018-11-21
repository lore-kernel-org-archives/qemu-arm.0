Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2477353wrt;
        Wed, 21 Nov 2018 15:13:20 -0800 (PST)
X-Google-Smtp-Source: AJdET5ec9nKLGtbO0A4SmyahEzkm9Vg81S3uschDz9zb93qeYb3yZkTWXi46W5Sh8aL5oadYhQ11
X-Received: by 2002:a81:b70d:: with SMTP id v13mr8923520ywh.477.1542842000760;
        Wed, 21 Nov 2018 15:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542842000; cv=none;
        d=google.com; s=arc-20160816;
        b=q/va9lME5tcWlTENaGefhBxSzbvntFEwEFNL7PnNEIYDBg83PjGmAU8whZ3G4ghTKS
         k4pHY6mVQNTqcjdE0fEvUuJXzBkbu9kt1M3USt5JUY9Oq48CwXHn0IHJzRLH6Aj+twii
         wp/pZltRlsAMG1yDkoABibx/zS5Rrw4JBcoIT9/vWcLGj6bYmrsb7jfCtsqkHqmearyk
         oD/AfgjQqgXMxR0xeeZaSpQsF8Qveu+bYAWIg0pP7WvSWUMdgjnd8ngDlS313ytDH0Lp
         EOvkH9Uwu2dRyE6La8fvDIDVrYi0Vyrz0fRwmuZSiScXjg7r+T9Jc11fPyiWwQPAzlAG
         z2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=CLwL2E6dd1fSmtOCbhEsiaPh07IifLU48V3faisCs24=;
        b=KyBXEttDvtjgtkMs+TiLNzIBo0zQurDRlub4NDj61r1Zo8rNh5bS4iMwXKxizmCEeR
         OX+NyVLpbpjlJY1OTw/L5TIjBzURexkMo5EPoPb1FlnQ8KwnnEgA9rWecwjKxeiThUlf
         g/uUkfRNAUAvF5j6meLYXh03Ol/EHBITb9nZdMIN6imrYGgS8kt+8erH3hjqlJ7qfqmI
         dcodC2c1BY3Fy/+gGsgYA2KK/BpnQu0mLock6eC3hi2o6djMraatae7ZLHcal1PglQVI
         N3St09u33Tcb4apXW/TyfzAYpMvHOSmdSXD9Pf6gqHI3cDeTCd0b0+MSQ6zydc9IDeRB
         R8sA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63-v6si26758362ywe.319.2018.11.21.15.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 15:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPbgO-0001wF-1K
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 18:13:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPbgA-0001mn-3G
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:13:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPbg6-00021F-QQ
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:13:06 -0500
Received: from mga01.intel.com ([192.55.52.88]:3801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPbg3-0001wa-0T; Wed, 21 Nov 2018 18:13:00 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 15:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,262,1539673200"; d="scan'208";a="102157257"
Received: from slgibson-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.202])
	by orsmga003.jf.intel.com with ESMTP; 21 Nov 2018 15:12:50 -0800
Date: Thu, 22 Nov 2018 00:12:17 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121231217.GA4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-12-sameo@linux.intel.com>
	<20181114115537.3357921b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181114115537.3357921b@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 11/24] hw: acpi: Export and
 generalize the PCI host AML API
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Rob Bradford <robert.bradford@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1e/n4q1pp1QH

Hi Igor,

On Wed, Nov 14, 2018 at 11:55:37AM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:34 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > The AML build routines for the PCI host bridge and the corresponding
> > DSDT addition are neither x86 nor PC machine type specific.
> > We can move them to the architecture agnostic hw/acpi folder, and by
> > carrying all the needed information through a new AcpiPciBus structure,
> > we can make them PC machine type independent.
> 
> I'm don't know anything about PCI, but functional changes doesn't look
> correct to me.
>
> See more detailed comments below.
> 
> Marcel,
> could you take a look on this patch (in particular main csr changes), pls?
> 
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > Signed-off-by: Rob Bradford <robert.bradford@intel.com>
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/aml-build.h |   8 ++
> >  hw/acpi/aml-build.c         | 157 ++++++++++++++++++++++++++++++++++++
> >  hw/i386/acpi-build.c        | 115 ++------------------------
> >  3 files changed, 173 insertions(+), 107 deletions(-)
> > 
> > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > index fde2785b9a..1861e37ebf 100644
> > --- a/include/hw/acpi/aml-build.h
> > +++ b/include/hw/acpi/aml-build.h
> > @@ -229,6 +229,12 @@ typedef struct AcpiMcfgInfo {
> >      uint32_t mcfg_size;
> >  } AcpiMcfgInfo;
> >  
> > +typedef struct AcpiPciBus {
> > +    PCIBus *pci_bus;
> > +    Range *pci_hole;
> > +    Range *pci_hole64;
> > +} AcpiPciBus;
> Again, this and all below is not aml-build material.
> Consider adding/using pci specific acpi file for it.
> 
> Also even though pci AML in arm/virt is to a large degree a subset
> of x86 target and it would be much better to unify ARM part with x86,
> it probably will be to big/complex of a change if we take on it in
> one go.
> 
> So not to derail you from the goal too much, we probably should
> generalize this a little bit less, limiting refactoring to x86
> target for now.
So keeping it under i386 means it won't be accessible through hw/acpi/,
which means we won't be able to have a generic hw/acpi/reduced.c
implementation. From our perspective, this is the problem with keeping
things under i386 because we're not sure yet how much generic it is: It
still won't be shareable for a generic hardware-reduced ACPI
implementation which means we'll have to temporarily have yet another
hardware-reduced ACPI implementation under hw/i386 this time.
I guess this is what Michael meant by keeping some parts of the code
duplicated for now.

I feel it'd be easier to move those APIs under a shareable location, to
make it easier for ARM to consume it even if it's not entirely generic yet.
But you guys are the maintainers and if you think we should restric the
generalization to x86 only for now, we can go for it.

> For example, move generic x86 pci parts to hw/i386/acpi-pci.[hc],
> and structure it so that building blocks in acpi-pci.c could be
> reused for x86 reduced profile later.
> Once it's been done, it might be easier and less complex to
> unify a bit more generic code in i386/acpi-pci.c with corresponding
> ARM code.
> 
> Patch is too big and should be split into smaller logical chunks
> and you should separate code movement vs functional changes you're
> a making here.
> 
> Once you split patch properly, it should be easier to assess
> changes.
> 
> >  typedef struct CrsRangeEntry {
> >      uint64_t base;
> >      uint64_t limit;
> > @@ -411,6 +417,8 @@ Aml *build_osc_method(uint32_t value);
> >  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
> >  Aml *build_gsi_link_dev(const char *name, uint8_t uid, uint8_t gsi);
> >  Aml *build_prt(bool is_pci0_prt);
> > +void acpi_dsdt_add_pci_bus(Aml *dsdt, AcpiPciBus *pci_host);
> > +Aml *build_pci_host_bridge(Aml *table, AcpiPciBus *pci_host);
> >  void crs_range_set_init(CrsRangeSet *range_set);
> >  Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
> >  void crs_replace_with_free_ranges(GPtrArray *ranges,
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index b8e32f15f7..869ed70db3 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -29,6 +29,19 @@
> >  #include "hw/pci/pci_bus.h"
> >  #include "qemu/range.h"
> >  #include "hw/pci/pci_bridge.h"
> > +#include "hw/i386/pc.h"
> > +#include "sysemu/tpm.h"
> > +#include "hw/acpi/tpm.h"
> > +
> > +#define PCI_HOST_BRIDGE_CONFIG_ADDR        0xcf8
> > +#define PCI_HOST_BRIDGE_IO_0_MIN_ADDR      0x0000
> > +#define PCI_HOST_BRIDGE_IO_0_MAX_ADDR      0x0cf7
> > +#define PCI_HOST_BRIDGE_IO_1_MIN_ADDR      0x0d00
> > +#define PCI_HOST_BRIDGE_IO_1_MAX_ADDR      0xffff
> > +#define PCI_VGA_MEM_BASE_ADDR              0x000a0000
> > +#define PCI_VGA_MEM_MAX_ADDR               0x000bffff
> > +#define IO_0_LEN                           0xcf8
> > +#define VGA_MEM_LEN                        0x20000
> >  
> >  static GArray *build_alloc_array(void)
> >  {
> > @@ -2142,6 +2155,150 @@ Aml *build_prt(bool is_pci0_prt)
> >      return method;
> >  }
> >  
> > +Aml *build_pci_host_bridge(Aml *table, AcpiPciBus *pci_host)
> name doesn't reflect exactly what function does,
> it builds device descriptions for expander buses (including their csr)
> and then it builds csr for for main pci host but not pci device description.
> 
> I'd suggest to split out expander buses part into separate function
> that returns an expander bus device description, updates crs_range_set
> and let the caller to enumerate buses and add descriptions to dsdt.
> 
> Then after it we could do a generic csr generation function for the main pci host
> if it's possible at all (main pci host csr seems heavily board depended)
> 
> Instead of taking table and adding stuff directly in to it
> it should be cleaner to take as argument empty csr (crs = aml_resource_template();)
> add stuff to it and let the caller to add/extend csr as/where necessary.
> 
> > +{
> > +    CrsRangeEntry *entry;
> > +    Aml *scope, *dev, *crs;
> > +    CrsRangeSet crs_range_set;
> > +    Range *pci_hole = NULL;
> > +    Range *pci_hole64 = NULL;
> > +    PCIBus *bus = NULL;
> > +    int root_bus_limit = 0xFF;
> > +    int i;
> > +
> > +    bus = pci_host->pci_bus;
> > +    assert(bus);
> > +    pci_hole = pci_host->pci_hole;
> > +    pci_hole64 = pci_host->pci_hole64;
> > +
> > +    crs_range_set_init(&crs_range_set);
> > +    QLIST_FOREACH(bus, &bus->child, sibling) {
> > +        uint8_t bus_num = pci_bus_num(bus);
> > +        uint8_t numa_node = pci_bus_numa_node(bus);
> > +
> > +        /* look only for expander root buses */
> > +        if (!pci_bus_is_root(bus)) {
> > +            continue;
> > +        }
> > +
> > +        if (bus_num < root_bus_limit) {
> > +            root_bus_limit = bus_num - 1;
> > +        }
> > +
> > +        scope = aml_scope("\\_SB");
> > +        dev = aml_device("PC%.02X", bus_num);
> > +        aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
> > +        aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> > +        aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
> > +        if (pci_bus_is_express(bus)) {
> > +            aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> > +            aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> > +            aml_append(dev, build_osc_method(0x1F));
> > +        }
> > +        if (numa_node != NUMA_NODE_UNASSIGNED) {
> > +            aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
> > +        }
> > +
> > +        aml_append(dev, build_prt(false));
> > +        crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set);
> > +        aml_append(dev, aml_name_decl("_CRS", crs));
> > +        aml_append(scope, dev);
> > +        aml_append(table, scope);
> > +    }
> > +    scope = aml_scope("\\_SB.PCI0");
> > +    /* build PCI0._CRS */
> > +    crs = aml_resource_template();
> > +    /* set the pcie bus num */
> > +    aml_append(crs,
> > +        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
> > +                            0x0000, 0x0, root_bus_limit,
> > +                            0x0000, root_bus_limit + 1));
> 
> vvvv
> > +    aml_append(crs, aml_io(AML_DECODE16, PCI_HOST_BRIDGE_CONFIG_ADDR,
> > +                           PCI_HOST_BRIDGE_CONFIG_ADDR, 0x01, 0x08));
> > +    /* set the io region 0 in pci host bridge */
> > +    aml_append(crs,
> > +        aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
> > +                    AML_POS_DECODE, AML_ENTIRE_RANGE,
> > +                    0x0000, PCI_HOST_BRIDGE_IO_0_MIN_ADDR,
> > +                    PCI_HOST_BRIDGE_IO_0_MAX_ADDR, 0x0000, IO_0_LEN));
> > +
> > +    /* set the io region 1 in pci host bridge */
> > +    crs_replace_with_free_ranges(crs_range_set.io_ranges,
> > +                                 PCI_HOST_BRIDGE_IO_1_MIN_ADDR,
> > +                                 PCI_HOST_BRIDGE_IO_1_MAX_ADDR);
> above code doesn't look as just a movement, it's something totally new,
> so it should be in it's own patch with a justification why it's ok
> to replace concrete addresses with some kind of window.
Ah I see your point now. Yes, I agree this should be in a separate
patch.

Cheers,
Samuel.

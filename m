Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2028681wrt;
        Wed, 21 Nov 2018 07:44:11 -0800 (PST)
X-Google-Smtp-Source: AJdET5eHODASZ+PtdFivPceJuV2MyQf6Hp583a/6zUPYkJJLOLKAqhbtenqgQm/h4oMw9/eOwZgR
X-Received: by 2002:a81:b649:: with SMTP id h9mr7038240ywk.57.1542815051505;
        Wed, 21 Nov 2018 07:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542815051; cv=none;
        d=google.com; s=arc-20160816;
        b=aJJ3TN/wWA+xW8cRRKw2zVUXMIy84Nv6G3a434XloEYBrWMxr4D69mfhRdcy+V9N6b
         RiHsh2QJ3FZDW/zgFejGgQR7cOOtTMTbmgKXx5MjXezVyTg/9KheWylMe/giuev59rei
         LX/aO1sh0jm7lFzKCjEFiI6Pmh+BsRMKiMznI45gdRJ2/wBlUZnfCpJMzrC5qzzLdydd
         Mdaq+0yHHnbaUmMlPYQ34Ba6ViPwpbtW+EcaPOZlwqST0lFXPHhU4ElSWkqXd92cIKSr
         wVPhJw5nXjWAOylDnoFfqr/2m46uKWtZHYCOvp+nQgxDA/7D6m2JkTq/MzULBsjAbyAL
         yP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xKqs81IR7nA9oEsMpnWftLpVxTQEyZT9jwgKbvY7Kck=;
        b=D1QbbbXvRRwYnzOiWLTsfQCCJgVSP76L3oSKncJE7t5eU+xAEOrcn1+sqvF0xqaCVd
         QwTXcs2FYC2BApPT4RB39WvOBTT0Vlxo9MT+f8aiD/LV6v8faUZj3P6RDz+OcasfuMdy
         /K6aSR9W9bF+vsO5YQJRd/u/FeKwGiP9S16355oNwY2D5yVnZ+rx7lMahqxa8ssk85ne
         hde8DeiwLQK8mWRThmVgpL0438nAce2APyurjqETm6kqKu2Lbu/IRmAzFRaAbVRTmRCS
         8/IEky98KSaAT0awiM3tZCwnA9IvvoR/ZWESuF9xaQd0NdyUkhxj2JiqbWd4It9lmbKD
         wwxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si27277016ybq.488.2018.11.21.07.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 07:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPUfi-0005dM-T1
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 10:44:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPUfT-0005cK-Qv
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 10:43:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPUfP-0001Zh-WD
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 10:43:55 -0500
Received: from mga06.intel.com ([134.134.136.31]:4965)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPUfO-0001Wh-B2; Wed, 21 Nov 2018 10:43:51 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 07:43:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="102066892"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by orsmga003.jf.intel.com with ESMTP; 21 Nov 2018 07:43:45 -0800
Date: Wed, 21 Nov 2018 16:43:12 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121154312.GI4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-11-sameo@linux.intel.com>
	<20181113165918.5cc2b2b5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113165918.5cc2b2b5@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 10/24] hw: acpi: Export the
 PCI host and holes getters
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GXJrNgLUDHPI

On Tue, Nov 13, 2018 at 04:59:18PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:33 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > This is going to be needed by the hardware reduced implementation, so
> > let's export it.
> > Once the ACPI builder methods and getters will be implemented, the
> > acpi_get_pci_host() implementation will become hardware agnostic.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/aml-build.h |  2 ++
> >  hw/acpi/aml-build.c         | 43 +++++++++++++++++++++++++++++++++
> >  hw/i386/acpi-build.c        | 47 ++-----------------------------------
> >  3 files changed, 47 insertions(+), 45 deletions(-)
> > 
> > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > index c27c0935ae..fde2785b9a 100644
> > --- a/include/hw/acpi/aml-build.h
> > +++ b/include/hw/acpi/aml-build.h
> > @@ -400,6 +400,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
> >               const char *oem_id, const char *oem_table_id);
> >  void *acpi_data_push(GArray *table_data, unsigned size);
> >  unsigned acpi_data_len(GArray *table);
> > +Object *acpi_get_pci_host(void);
> > +void acpi_get_pci_holes(Range *hole, Range *hole64);
> >  /* Align AML blob size to a multiple of 'align' */
> >  void acpi_align_size(GArray *blob, unsigned align);
> >  void acpi_add_table(GArray *table_offsets, GArray *table_data);
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 2b9a636e75..b8e32f15f7 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -1601,6 +1601,49 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
> >      g_array_free(tables->vmgenid, mfre);
> >  }
> 
> > +/*
> > + * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> > + */
> > +Object *acpi_get_pci_host(void)
> > +{
> > +    PCIHostState *host;
> > +
> > +    host = OBJECT_CHECK(PCIHostState,
> > +                        object_resolve_path("/machine/i440fx", NULL),
> > +                        TYPE_PCI_HOST_BRIDGE);
> > +    if (!host) {
> > +        host = OBJECT_CHECK(PCIHostState,
> > +                            object_resolve_path("/machine/q35", NULL),
> > +                            TYPE_PCI_HOST_BRIDGE);
> > +    }
> > +
> > +    return OBJECT(host);
> > +}
> in general aml-build.c is a place to put ACPI spec primitives,
> so I'd suggest to move it somewhere else.
> 
> Considering it's x86 code (so far), maybe move it to something like
> hw/i386/acpi-pci.c
> 
> Also it might be good to get rid of acpi_get_pci_host() and pass
> a pointer to pci_host as acpi_setup() an argument, since it's static
> for life of boar we can keep it in AcpiBuildState, and reuse for
> mfg/pci_hole/pci bus accesses.
That's what I'm trying to do with patches #23 and 24, but through the
ACPI configuration structure. I could try using the build state instead,
as it's platform agnostic as well.

Cheers,
Samuel.


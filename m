Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1844836wrt;
        Fri, 23 Nov 2018 02:55:53 -0800 (PST)
X-Google-Smtp-Source: AJdET5d+pLicEF+ykviCtNl8pMcD0YPmjBfLq5EHJAKhLBJFRLtZngD3RvNJg/g0Hph4r2kSICD3
X-Received: by 2002:a81:a943:: with SMTP id g64mr15772661ywh.374.1542970553469;
        Fri, 23 Nov 2018 02:55:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542970553; cv=none;
        d=google.com; s=arc-20160816;
        b=lVKdK6Xmz9QtepbOIYRf4YU0pgyLZ9pZd2EJvYY4lsfMAU5Zk+KnOrybeHRg9GoUYZ
         9guzTf5B09qDCEJEtROH8RLqjwLQtDLYBSFclZUCDImnwVBdqyE/dnosw55FApbqqp/u
         zbgbQ/Qptb6c18LmYFhxvvvLxWbHaDJyouEW93Fp7IAPDHjgd1K/EZ9VSRKKZUdy6Gb4
         lR3XKrHLMQmbnsHm9+s8byUy0+nCbhHK02wDzdm2KLpLUNO8y3zBvj5gVXsqMdmXbZrZ
         gKceJtNc6G//ts/mhy36dRl6wRwJ2DC8rvhKV6eKFEcD9MzqjXMq2kro4v68WVFEUjsW
         z6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=pKY8VQkoJX9FiQymLQSq12Qgfy+aEVEY0FEEHH90tS0=;
        b=DzORbkXNt7/ZWRaeKk+0/oOlJ1F4VhTw9U5w+Ri2wFUtrCA8qua45KaQeI1xDK4YbN
         fwb1ZIeKDE4HOkD5VJcaIyO7wf+lPvgkzedcjVfqLeJTVbJ+q2ulbipyjLGSjddjLvW6
         fij2FtcoZ4xJKh4qt5+tkGECjGRcH3d91vn6pDLn4Xm0/vATCnATskAg/9jDhITKKyNx
         iPVbLeH10eDlpzXOIZi69/2jM84oUhCOvHu6hp0CsD302OpKFoC4wpq45mHo90+WvWsK
         WjHoFOymcZVXfqiinICE1eit0DfYuJXQKiejEtwOW9KV3scO9Fwj7GKBbsdlY/1yKZp7
         qb2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si3245938ywh.69.2018.11.23.02.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 02:55:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ97p-0004QW-2j
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 05:55:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQ97f-0004QA-MI
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 05:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQ97b-0001ml-Hy
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 05:55:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gQ97b-0001kb-9W; Fri, 23 Nov 2018 05:55:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0B1D3084218;
	Fri, 23 Nov 2018 10:55:37 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 754EC1057062;
	Fri, 23 Nov 2018 10:55:35 +0000 (UTC)
Date: Fri, 23 Nov 2018 11:55:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181123115533.0d2c37c3@redhat.com>
In-Reply-To: <20181121154312.GI4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-11-sameo@linux.intel.com>
	<20181113165918.5cc2b2b5@redhat.com>
	<20181121154312.GI4426@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 23 Nov 2018 10:55:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: tLh6FBYExu/6

On Wed, 21 Nov 2018 16:43:12 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> On Tue, Nov 13, 2018 at 04:59:18PM +0100, Igor Mammedov wrote:
> > On Mon,  5 Nov 2018 02:40:33 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > This is going to be needed by the hardware reduced implementation, so
> > > let's export it.
> > > Once the ACPI builder methods and getters will be implemented, the
> > > acpi_get_pci_host() implementation will become hardware agnostic.
> > > 
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  include/hw/acpi/aml-build.h |  2 ++
> > >  hw/acpi/aml-build.c         | 43 +++++++++++++++++++++++++++++++++
> > >  hw/i386/acpi-build.c        | 47 ++-----------------------------------
> > >  3 files changed, 47 insertions(+), 45 deletions(-)
> > > 
> > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > index c27c0935ae..fde2785b9a 100644
> > > --- a/include/hw/acpi/aml-build.h
> > > +++ b/include/hw/acpi/aml-build.h
> > > @@ -400,6 +400,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
> > >               const char *oem_id, const char *oem_table_id);
> > >  void *acpi_data_push(GArray *table_data, unsigned size);
> > >  unsigned acpi_data_len(GArray *table);
> > > +Object *acpi_get_pci_host(void);
> > > +void acpi_get_pci_holes(Range *hole, Range *hole64);
> > >  /* Align AML blob size to a multiple of 'align' */
> > >  void acpi_align_size(GArray *blob, unsigned align);
> > >  void acpi_add_table(GArray *table_offsets, GArray *table_data);
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index 2b9a636e75..b8e32f15f7 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -1601,6 +1601,49 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
> > >      g_array_free(tables->vmgenid, mfre);
> > >  }  
> >   
> > > +/*
> > > + * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> > > + */
> > > +Object *acpi_get_pci_host(void)
> > > +{
> > > +    PCIHostState *host;
> > > +
> > > +    host = OBJECT_CHECK(PCIHostState,
> > > +                        object_resolve_path("/machine/i440fx", NULL),
> > > +                        TYPE_PCI_HOST_BRIDGE);
> > > +    if (!host) {
> > > +        host = OBJECT_CHECK(PCIHostState,
> > > +                            object_resolve_path("/machine/q35", NULL),
> > > +                            TYPE_PCI_HOST_BRIDGE);
> > > +    }
> > > +
> > > +    return OBJECT(host);
> > > +}  
> > in general aml-build.c is a place to put ACPI spec primitives,
> > so I'd suggest to move it somewhere else.
> > 
> > Considering it's x86 code (so far), maybe move it to something like
> > hw/i386/acpi-pci.c
> > 
> > Also it might be good to get rid of acpi_get_pci_host() and pass
> > a pointer to pci_host as acpi_setup() an argument, since it's static
> > for life of boar we can keep it in AcpiBuildState, and reuse for
> > mfg/pci_hole/pci bus accesses.  
> That's what I'm trying to do with patches #23 and 24, but through the
> ACPI configuration structure. I could try using the build state instead,
> as it's platform agnostic as well.
May be it will work.
Note:
try not to pass whole build_state to concrete tables builders and use
arguments/dedicated structures to pass data needed for that concrete
table.

> 
> Cheers,
> Samuel.
> 


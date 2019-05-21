Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1471989wrg;
        Tue, 21 May 2019 07:34:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwz+fZQfeF0crSI/eLMPfzSLSHd+OlJPKjhMhpejeXh5eg7o9B9v069FCgBKV/7yV+wTeoT
X-Received: by 2002:a50:95d6:: with SMTP id x22mr81804112eda.89.1558449265222;
        Tue, 21 May 2019 07:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449265; cv=none;
        d=google.com; s=arc-20160816;
        b=JlYEwc66eAb8mGKSwHIfY+mQRzLfv4+7eTvFsXgLB0x0fM3bImvQlHp7XRvfTrkd24
         NqFdqTcObJOjpPMzM13hyWFcUbBDEkfF3Xgr47XRvKzGFQFGypgTfxLjvHd8/9PTxsOO
         kk2nsf/MExG4XOAGNIRNYo6K5tW68gtqPGsf+aPbXD3ov9GQCrY96aWF6k512wCb9lRh
         ybsGikz+XnUIAShqJGrzKVSbGayncR67y1NMTW3R6xubJWDYSvDfw+onyI4rElv1G0eL
         qSJo5UY21YS+7QCNaswtFeqKx5Y5hYd8brqlOOB2q2JvgWOCtbTD+4aG4vim9hPXJZ1U
         JF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=SigsA1sP123ej8F2Zg21FNMenhvWldU7U/vGNqkotXI=;
        b=klfLL3o9HCxFEAH88zfFvsukcQa0FyP7z7tdaX4/xFNbomfoHZNpuSqDlqT6vhfAj+
         HTi3tBtAMlDPbr0hPLFtDl8FnT3kj8ZZgRzfk3TEg4J5UFzDeaYwT5KSw8w7a+AuShKu
         vPW87wUCfubVDXNA71ZZ0Q++zDsEuKBzP9Xnmf4LUL6+/aZ/YP8Egz15XZnJIDXJEsdx
         7Hl2CGWdm6f2vzy361XfmnNnFNsfgkhUfcyEhSrFQqJrU+l7F0eBIMFlXMnT7t/Hbnm4
         iJQkIM9v/BIAMEQ772ismOxVezWSF1h1/sivXMJD4lWQPPrzOwiNZQ+ub8jvgdK4rpMb
         BDHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si1188589ejk.89.2019.05.21.07.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 07:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hT5qS-0007LA-7W
	for alex.bennee@linaro.org; Tue, 21 May 2019 10:34:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hT5qD-0007Kn-5o
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hT5qB-000341-T8
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:34:09 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42281)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hT5qB-00033b-NE
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:34:07 -0400
Received: by mail-qt1-f193.google.com with SMTP id j53so20719287qta.9
	for <qemu-arm@nongnu.org>; Tue, 21 May 2019 07:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=SigsA1sP123ej8F2Zg21FNMenhvWldU7U/vGNqkotXI=;
	b=LydnyeBz6DD4TyJuxSFc3Zc0Bk2U3isJVroOpQNlECrqU6wdRqa6g3yem4zx4c0HLO
	I46Sk1BBcO0U9tmB9gaVVbKKJ71y/91uq1aLdowRlcoPtLXsXontqw6UouLzW/cwcS3q
	2wUrnVQD0dqn+jtZTdGgdH0d3yQA93J0f6V7GKMlT7UT09eB5Axb/2Zxolc/Ek5f8Mq+
	wBjn2qD+whkEkzZsk6n++xeQK2sQ38dGIOL9zODEVkuEHsmzm9EpT4bO/NJRaGN8ssQC
	5f6hCqXquC2W+aYpeLHMEN/Wnd+huBvVO1kBgf8TK/nUGVDxk8PSW+2vhzsfZkZTYiur
	LJwg==
X-Gm-Message-State: APjAAAV0PZKnEYEqYnxhSIUYpH0QRiOcz1lGbM2VI4I/qD5cjHcS1qpV
	wnGEjdkSXj7N6WJC9J67Aa1gTw==
X-Received: by 2002:a0c:96b9:: with SMTP id a54mr21171889qvd.135.1558449247015;
	Tue, 21 May 2019 07:34:07 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	s17sm12145560qke.60.2019.05.21.07.34.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 07:34:06 -0700 (PDT)
Date: Tue, 21 May 2019 10:34:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190521103215-mutt-send-email-mst@kernel.org>
References: <20190521033249.1960-1-richardw.yang@linux.intel.com>
	<20190521033249.1960-3-richardw.yang@linux.intel.com>
	<20190520233614-mutt-send-email-mst@kernel.org>
	<20190521162958.4415d4ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521162958.4415d4ac@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.193
Subject: Re: [Qemu-arm] [PATCH v5 2/2] acpi: pci: use build_append_foo() API
 to construct MCFG
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tGW9nt9Ix05c

On Tue, May 21, 2019 at 04:29:58PM +0200, Igor Mammedov wrote:
> On Mon, 20 May 2019 23:37:22 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, May 21, 2019 at 11:32:49AM +0800, Wei Yang wrote:
> > > build_append_foo() API doesn't need explicit endianness conversions
> > > which eliminates a source of errors and it makes build_mcfg() look like
> > > declarative definition of MCFG table in ACPI spec, which makes it easy
> > > to review.
> > > 
> > > Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> > > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > 
> > > ---
> > > v5:
> > >    * miss the reserved[8] of MCFG in last version, add it back
> > >    * drop SOBs and make sure bios-tables-test all OK
> > > ---  
> > 
> > 
> > Please do not add two --- separators. It breaks git am.
> that worked just fine for the last xx years and still works for me.

Because you don't use git am?
It's true I often am forced to edit your patches to apply them.
Pls do not do this it makes no sense.

> > 
> > One --- should come after the commit log. Anything after that and
> > until diff is ignored anyway.
> That's fine if we wish to commit change log into history, but
> Typically we don't want change log to be committed (as it's useless from history pov),
> hence we put it after separator to get it dropped on applying.

Then you should do

build_append_foo() API doesn't need explicit endianness conversions
which eliminates a source of errors and it makes build_mcfg() look like
declarative definition of MCFG table in ACPI spec, which makes it easy
to review.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v5:
   * miss the reserved[8] of MCFG in last version, add it back
   * drop SOBs and make sure bios-tables-test all OK

 hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
 include/hw/acpi/acpi-defs.h | 18 ------------------
 2 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c


Anything between --- and diff is ignored. Second --- is poointless and
harmful.

> > 
> > >  hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
> > >  include/hw/acpi/acpi-defs.h | 18 ------------------
> > >  2 files changed, 23 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> > > index fa0fa30bb9..49df7b7d54 100644
> > > --- a/hw/acpi/pci.c
> > > +++ b/hw/acpi/pci.c
> > > @@ -30,17 +30,28 @@
> > >  
> > >  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> > >  {
> > > -    AcpiTableMcfg *mcfg;
> > > -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> > > -
> > > -    mcfg = acpi_data_push(table_data, len);
> > > -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> > > -
> > > -    /* Only a single allocation so no need to play with segments */
> > > -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> > > -    mcfg->allocation[0].start_bus_number = 0;
> > > -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> > > -
> > > -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> > > +    int mcfg_start = table_data->len;
> > > +
> > > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > +
> > > +    /*
> > > +     * PCI Firmware Specification, Revision 3.0
> > > +     * 4.1.2 MCFG Table Description.
> > > +     */
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data, 0, 8);
> > > +    /* Base address, processor-relative */
> > > +    build_append_int_noprefix(table_data, info->base, 8);
> > > +    /* PCI segment group number */
> > > +    build_append_int_noprefix(table_data, 0, 2);
> > > +    /* Starting PCI Bus number */
> > > +    build_append_int_noprefix(table_data, 0, 1);
> > > +    /* Final PCI Bus number */
> > > +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
> > > +    /* Reserved */
> > > +    build_append_int_noprefix(table_data, 0, 4);
> > > +
> > > +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> > > +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> > >  }
> > >  
> > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > index f9aa4bd398..57a3f58b0c 100644
> > > --- a/include/hw/acpi/acpi-defs.h
> > > +++ b/include/hw/acpi/acpi-defs.h
> > > @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
> > >  
> > >  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
> > >  
> > > -/* PCI fw r3.0 MCFG table. */
> > > -/* Subtable */
> > > -struct AcpiMcfgAllocation {
> > > -    uint64_t address;                /* Base address, processor-relative */
> > > -    uint16_t pci_segment;            /* PCI segment group number */
> > > -    uint8_t start_bus_number;       /* Starting PCI Bus number */
> > > -    uint8_t end_bus_number;         /* Final PCI Bus number */
> > > -    uint32_t reserved;
> > > -} QEMU_PACKED;
> > > -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
> > > -
> > > -struct AcpiTableMcfg {
> > > -    ACPI_TABLE_HEADER_DEF;
> > > -    uint8_t reserved[8];
> > > -    AcpiMcfgAllocation allocation[0];
> > > -} QEMU_PACKED;
> > > -typedef struct AcpiTableMcfg AcpiTableMcfg;
> > > -
> > >  /*
> > >   * TCPA Description Table
> > >   *
> > > -- 
> > > 2.19.1  

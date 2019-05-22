Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp188288wrg;
        Wed, 22 May 2019 01:21:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXpUH0oHeCPU8ZnOkWfFAVrMQqXvV5+OGJ7V0T2HgWBcGlOoC9j9M8v8Y4HA3uZVdoXxwI
X-Received: by 2002:a17:906:4d4d:: with SMTP id b13mr28511756ejv.109.1558513291295;
        Wed, 22 May 2019 01:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558513291; cv=none;
        d=google.com; s=arc-20160816;
        b=b3H81FBvnoY8J3ey2f0UGeM33S7egZKS03XL0b7m7L/18jp11dcMA0dk9osHZp74OG
         IeGy01VASHOy1srPPfg/1ap1OR9tHDh0Mom4wZsBhP+edwYwdjAB4hhT02DSCGYPFvmd
         sOJfhECgHASFHggMFG8VY3EiyFpGtl2xBMYqUJo6xaY+WjyJQnu7CKALJM7G2F2wLYBF
         SQRU7tQ72Wdm0n5DHG6ROLazjUbYUUuE33nZWk3Tklut0gw1+1e7dMR93rQZFsfni2qA
         n3Y1EhCY93SNFRqcT7rmdmXcFOIC6uv7LbWl3tDv+v9HjY8hiMeF8YiRF6fszFkhbFDB
         JmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=eU3yjb19bzWPIW55LtxCJKJvOmfG1aEwrhqSx4AvaBU=;
        b=QKLm1Imn1UDyQCmjVeSivZnguCfJEVNKLaV0ZVvU/fqpfTRW9uLi8t8cWoVgRNQZHc
         vvWMXZoVilbhyNn6R7geIAsFVyhVxq8QZovG+gnJGekX5vjD1v7oq8TRMeuJ5XDKMpbT
         uLJIyBVHizoHSJHitQYBTcNzYMKAv6mMC91r8QxuRjoP7xDUVWJ9bPgJkmFAoc3g1nYg
         2IuPNYmB4GiBKbn5DTidYatAsy65J+xKleZHc8oD6fAxrUB+dZ5dB/a4FeMGViSeCO1e
         6Zc/3yqchf2FR6bwTFS3tAYLT8NxADjCYbh2IjR2AkdUvdcTOLAQzDwasy5xSsVhu1gv
         Zc8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n36si16088153edn.412.2019.05.22.01.21.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 01:21:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTMV8-0006gz-9K
	for alex.bennee@linaro.org; Wed, 22 May 2019 04:21:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hTMUu-0006ep-81
	for qemu-arm@nongnu.org; Wed, 22 May 2019 04:21:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hTMUs-0008AR-6s
	for qemu-arm@nongnu.org; Wed, 22 May 2019 04:21:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hTMUq-00087Z-8s; Wed, 22 May 2019 04:21:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73DA981E0B;
	Wed, 22 May 2019 08:21:01 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40B21646DF;
	Wed, 22 May 2019 08:20:54 +0000 (UTC)
Date: Wed, 22 May 2019 10:20:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190522102050.66515aa2@redhat.com>
In-Reply-To: <20190521103215-mutt-send-email-mst@kernel.org>
References: <20190521033249.1960-1-richardw.yang@linux.intel.com>
	<20190521033249.1960-3-richardw.yang@linux.intel.com>
	<20190520233614-mutt-send-email-mst@kernel.org>
	<20190521162958.4415d4ac@redhat.com>
	<20190521103215-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 22 May 2019 08:21:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: lI8O693B9hHM

On Tue, 21 May 2019 10:34:03 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 21, 2019 at 04:29:58PM +0200, Igor Mammedov wrote:
> > On Mon, 20 May 2019 23:37:22 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >   
> > > On Tue, May 21, 2019 at 11:32:49AM +0800, Wei Yang wrote:  
> > > > build_append_foo() API doesn't need explicit endianness conversions
> > > > which eliminates a source of errors and it makes build_mcfg() look like
> > > > declarative definition of MCFG table in ACPI spec, which makes it easy
> > > > to review.
> > > > 
> > > > Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> > > > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > > 
> > > > ---
> > > > v5:
> > > >    * miss the reserved[8] of MCFG in last version, add it back
> > > >    * drop SOBs and make sure bios-tables-test all OK
> > > > ---    
> > > 
> > > 
> > > Please do not add two --- separators. It breaks git am.  
> > that worked just fine for the last xx years and still works for me.  
> 
> Because you don't use git am?
> It's true I often am forced to edit your patches to apply them.
> Pls do not do this it makes no sense.

I do not use it as much as you, but I do use git am to test patches from
list and it works with double separator as expected (the second separator
is ignored).

> > > One --- should come after the commit log. Anything after that and
> > > until diff is ignored anyway.  
> > That's fine if we wish to commit change log into history, but
> > Typically we don't want change log to be committed (as it's useless from history pov),
> > hence we put it after separator to get it dropped on applying.  
> 
> Then you should do

the problem is that the second separator is added by git, so one
would have to edit it out after format-patch (which is error prone in
case of multi-patch series).

I don't know much about git though, so could you suggest how to handle
situation to avoid the second --- (i.e. how do you do it)?

PS:
There is 'git notes' to add/track per patch annotations, but it a bit
tedious to use notes compared to in-lining change log in commit message.

> build_append_foo() API doesn't need explicit endianness conversions
> which eliminates a source of errors and it makes build_mcfg() look like
> declarative definition of MCFG table in ACPI spec, which makes it easy
> to review.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> v5:
>    * miss the reserved[8] of MCFG in last version, add it back
>    * drop SOBs and make sure bios-tables-test all OK



> 
>  hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
>  include/hw/acpi/acpi-defs.h | 18 ------------------
>  2 files changed, 23 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> 
> 
> Anything between --- and diff is ignored. Second --- is poointless and
> harmful.
> 
> > >   
> > > >  hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
> > > >  include/hw/acpi/acpi-defs.h | 18 ------------------
> > > >  2 files changed, 23 insertions(+), 30 deletions(-)
> > > > 
> > > > diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> > > > index fa0fa30bb9..49df7b7d54 100644
> > > > --- a/hw/acpi/pci.c
> > > > +++ b/hw/acpi/pci.c
> > > > @@ -30,17 +30,28 @@
> > > >  
> > > >  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> > > >  {
> > > > -    AcpiTableMcfg *mcfg;
> > > > -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> > > > -
> > > > -    mcfg = acpi_data_push(table_data, len);
> > > > -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> > > > -
> > > > -    /* Only a single allocation so no need to play with segments */
> > > > -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> > > > -    mcfg->allocation[0].start_bus_number = 0;
> > > > -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> > > > -
> > > > -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> > > > +    int mcfg_start = table_data->len;
> > > > +
> > > > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > > +
> > > > +    /*
> > > > +     * PCI Firmware Specification, Revision 3.0
> > > > +     * 4.1.2 MCFG Table Description.
> > > > +     */
> > > > +    /* Reserved */
> > > > +    build_append_int_noprefix(table_data, 0, 8);
> > > > +    /* Base address, processor-relative */
> > > > +    build_append_int_noprefix(table_data, info->base, 8);
> > > > +    /* PCI segment group number */
> > > > +    build_append_int_noprefix(table_data, 0, 2);
> > > > +    /* Starting PCI Bus number */
> > > > +    build_append_int_noprefix(table_data, 0, 1);
> > > > +    /* Final PCI Bus number */
> > > > +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
> > > > +    /* Reserved */
> > > > +    build_append_int_noprefix(table_data, 0, 4);
> > > > +
> > > > +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> > > > +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> > > >  }
> > > >  
> > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > index f9aa4bd398..57a3f58b0c 100644
> > > > --- a/include/hw/acpi/acpi-defs.h
> > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
> > > >  
> > > >  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
> > > >  
> > > > -/* PCI fw r3.0 MCFG table. */
> > > > -/* Subtable */
> > > > -struct AcpiMcfgAllocation {
> > > > -    uint64_t address;                /* Base address, processor-relative */
> > > > -    uint16_t pci_segment;            /* PCI segment group number */
> > > > -    uint8_t start_bus_number;       /* Starting PCI Bus number */
> > > > -    uint8_t end_bus_number;         /* Final PCI Bus number */
> > > > -    uint32_t reserved;
> > > > -} QEMU_PACKED;
> > > > -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
> > > > -
> > > > -struct AcpiTableMcfg {
> > > > -    ACPI_TABLE_HEADER_DEF;
> > > > -    uint8_t reserved[8];
> > > > -    AcpiMcfgAllocation allocation[0];
> > > > -} QEMU_PACKED;
> > > > -typedef struct AcpiTableMcfg AcpiTableMcfg;
> > > > -
> > > >  /*
> > > >   * TCPA Description Table
> > > >   *
> > > > -- 
> > > > 2.19.1    


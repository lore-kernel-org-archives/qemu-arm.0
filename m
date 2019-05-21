Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1467570wrg;
        Tue, 21 May 2019 07:30:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMruKLEppp9n9xHDGpwLXNRxIuPantzh+dR37jTzxK/oh1yH0oCht+L9d48FsYEnDo22h5
X-Received: by 2002:aa7:c387:: with SMTP id k7mr83129689edq.73.1558449033292;
        Tue, 21 May 2019 07:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558449033; cv=none;
        d=google.com; s=arc-20160816;
        b=BIxQ0MJsTrv/X6Eok/IGOTZnMsi/y4LlQdK22/vAP2QRNZgddSmFdY08qVeWhDK5CN
         w+TyzFK1PoUI/upewPzfqd8wvrvVR5ko7MMVKFL4iktY+oaBF780H0oJzEMFvID0ftyB
         pidLxh4wo0AJtPyPVFjclOss1XngVMTdnMBWZzRGxiczSwa7tPXqKCN3l4TLPufEfCo7
         Lox2eJXvm9hlVd0NxBVGN48d18DMPNUXF/r01AOzawmR0sakjsex/gbD595Q9jbquEm1
         CnLWDQuB+dwnNf4OdJuNhdmGp4dj3GtSEf3Yy4YWpvXCLOx0JFFPi8SfHbxVpmlCIgVL
         IyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=KrU41GGdkcBmpfXQLAFcQOIOTc95h7w8QfXRFmgHWZA=;
        b=I3ePzV11cTDYmOv/6q/oaemO6Wbfy5U6lC2IH+4scf1W8wIgo9psFYpBqfD+czew3s
         tsIKpVMfd4bzzHjtu0ui59IwFqHvWDYTkjVb1C9q5D1DATUVcb84p4t89myoquoogxpd
         UPYm2QTAjJtB4NOwVMf4QMOxbJuB6TkoNlTwMvoNkVzePk5znMropGwLN4ch1Q0JBf0O
         z21+/L/2R3vq9Nmnda3/tui0318q9Q3du/LRY2ygZf7CkgAjoDE9YqN+KtkjAekL2j2E
         gmmZQiGLe9xrfBnaAGqOZrRIBDtssIGPyZ4OerWXt3h3SUQfYmyegOZROpMN3H66/yMh
         XdpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si3662063ejc.381.2019.05.21.07.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 07:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hT5mi-0005jS-5e
	for alex.bennee@linaro.org; Tue, 21 May 2019 10:30:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hT5mZ-0005jG-Ku
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hT5mY-0000JU-DO
	for qemu-arm@nongnu.org; Tue, 21 May 2019 10:30:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hT5mW-0000EP-5k; Tue, 21 May 2019 10:30:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 955217FDCD;
	Tue, 21 May 2019 14:30:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FAB617DFC;
	Tue, 21 May 2019 14:30:02 +0000 (UTC)
Date: Tue, 21 May 2019 16:29:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190521162958.4415d4ac@redhat.com>
In-Reply-To: <20190520233614-mutt-send-email-mst@kernel.org>
References: <20190521033249.1960-1-richardw.yang@linux.intel.com>
	<20190521033249.1960-3-richardw.yang@linux.intel.com>
	<20190520233614-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 May 2019 14:30:16 +0000 (UTC)
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
X-TUID: isyeI/vyW4Ji

On Mon, 20 May 2019 23:37:22 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, May 21, 2019 at 11:32:49AM +0800, Wei Yang wrote:
> > build_append_foo() API doesn't need explicit endianness conversions
> > which eliminates a source of errors and it makes build_mcfg() look like
> > declarative definition of MCFG table in ACPI spec, which makes it easy
> > to review.
> > 
> > Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > 
> > ---
> > v5:
> >    * miss the reserved[8] of MCFG in last version, add it back
> >    * drop SOBs and make sure bios-tables-test all OK
> > ---  
> 
> 
> Please do not add two --- separators. It breaks git am.
that worked just fine for the last xx years and still works for me.

> 
> One --- should come after the commit log. Anything after that and
> until diff is ignored anyway.
That's fine if we wish to commit change log into history, but
Typically we don't want change log to be committed (as it's useless from history pov),
hence we put it after separator to get it dropped on applying.

> 
> >  hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
> >  include/hw/acpi/acpi-defs.h | 18 ------------------
> >  2 files changed, 23 insertions(+), 30 deletions(-)
> > 
> > diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> > index fa0fa30bb9..49df7b7d54 100644
> > --- a/hw/acpi/pci.c
> > +++ b/hw/acpi/pci.c
> > @@ -30,17 +30,28 @@
> >  
> >  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
> >  {
> > -    AcpiTableMcfg *mcfg;
> > -    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
> > -
> > -    mcfg = acpi_data_push(table_data, len);
> > -    mcfg->allocation[0].address = cpu_to_le64(info->base);
> > -
> > -    /* Only a single allocation so no need to play with segments */
> > -    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
> > -    mcfg->allocation[0].start_bus_number = 0;
> > -    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
> > -
> > -    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
> > +    int mcfg_start = table_data->len;
> > +
> > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > +
> > +    /*
> > +     * PCI Firmware Specification, Revision 3.0
> > +     * 4.1.2 MCFG Table Description.
> > +     */
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8);
> > +    /* Base address, processor-relative */
> > +    build_append_int_noprefix(table_data, info->base, 8);
> > +    /* PCI segment group number */
> > +    build_append_int_noprefix(table_data, 0, 2);
> > +    /* Starting PCI Bus number */
> > +    build_append_int_noprefix(table_data, 0, 1);
> > +    /* Final PCI Bus number */
> > +    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 4);
> > +
> > +    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> > +                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
> >  }
> >  
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index f9aa4bd398..57a3f58b0c 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
> >  
> >  typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
> >  
> > -/* PCI fw r3.0 MCFG table. */
> > -/* Subtable */
> > -struct AcpiMcfgAllocation {
> > -    uint64_t address;                /* Base address, processor-relative */
> > -    uint16_t pci_segment;            /* PCI segment group number */
> > -    uint8_t start_bus_number;       /* Starting PCI Bus number */
> > -    uint8_t end_bus_number;         /* Final PCI Bus number */
> > -    uint32_t reserved;
> > -} QEMU_PACKED;
> > -typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
> > -
> > -struct AcpiTableMcfg {
> > -    ACPI_TABLE_HEADER_DEF;
> > -    uint8_t reserved[8];
> > -    AcpiMcfgAllocation allocation[0];
> > -} QEMU_PACKED;
> > -typedef struct AcpiTableMcfg AcpiTableMcfg;
> > -
> >  /*
> >   * TCPA Description Table
> >   *
> > -- 
> > 2.19.1  


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp284738wrt;
        Tue, 20 Nov 2018 00:23:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WQEHEHQhBvNvj858ji8khGsYs0eVJZCBxQR8UaXNcobRqgV5Ycdfz1QzS9w147eUnNBTW3
X-Received: by 2002:a25:a141:: with SMTP id z59-v6mr835558ybh.340.1542702225550;
        Tue, 20 Nov 2018 00:23:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542702225; cv=none;
        d=google.com; s=arc-20160816;
        b=wethpxh22b7Bn6w9u1MAWQEklF1QmIXTPGoxXckME1zgUl3JvE31puo2gpnjNeMWMx
         g6V3pBaZQj5lK7OgW4MdDZHIWZJd4OWuK3Tg1FyiJEwedk/bxRL6jiLjoX9GEfXQofXc
         bwErTUcm4ksT+AvkHrSwiGS/sn32jdkGpTgM4KyNwTvPv6x7kD+gygJY5kv4Zc481zGK
         ZFtuPDUJhbfkeWIgYGk3D8U4j3PSB5O+lZ5bsLUfiEZekWY71jbOGVLeZTAcivVAoiv7
         gwQNk6dR9BsyfZ9fI2YOoLPQtlJM0aGdufnhUDPbQvj20kdP0KMEexIcdhJ+gz8p9Fmb
         SoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=UblW4Vj9rD0JLAvCj2LYz0tTS/R5jkotdfTmWj0jRaw=;
        b=wuWTbitlT7LVoVNBTOJXVbZteCoHhz6vqGt59+nCu3YTX19ZrzgtfQdzuUIx+f0KI1
         7SlDJ6Q55sV8NKQ/kdHjeOaDKo5X9RtDv3qgUGN1r4WNvk7pbStguU8fzGOIdPD8vR+s
         hVJTW3MCjkNa9O47bGxy0k68cjyW/ZdB5WRFhWmBOo56oVJDshEU0lLzREd3WSpMrkcJ
         00iShuS6aFOC5vhn9zb0f2mqddnpw/n2h7QvKmiCChdasw+Ox55vRKccWTz8O9Ta9XDQ
         jjDhOoeUxKuOAGjyx8zvtG31w7CJeZ/YreD3hFB4RRGp461qCyAuA/t/HFCz76yR3PKo
         ZCiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3-v6si26213772ywj.336.2018.11.20.00.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 00:23:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP1Jw-0007iv-Rk
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 03:23:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP1Jl-0007io-Lj
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 03:23:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP1Jh-0000NJ-Md
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 03:23:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gP1Jh-0000MY-Eh; Tue, 20 Nov 2018 03:23:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 193343001921;
	Tue, 20 Nov 2018 08:23:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88A5868739;
	Tue, 20 Nov 2018 08:23:19 +0000 (UTC)
Date: Tue, 20 Nov 2018 09:23:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20181120092318.48f69fa4@redhat.com>
In-Reply-To: <20181119131625-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
	<20181119131625-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 20 Nov 2018 08:23:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 05/24] hw: acpi: Implement XSDT support
 for RSDP
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
	Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ApbVHboTXV1f

On Mon, 19 Nov 2018 13:27:14 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Nov 08, 2018 at 03:16:23PM +0100, Igor Mammedov wrote:
> > On Mon,  5 Nov 2018 02:40:28 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
> > > Description Table). RSDT only allow for 32-bit addressses and have thus
> > > been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
> > > no longer RSDTs, although RSDTs are still supported for backward
> > > compatibility.
> > > 
> > > Since version 2.0, RSDPs should add an extended checksum, a complete table
> > > length and a version field to the table.  
> > 
> > This patch re-implements what arm/virt board already does
> > and fixes checksum bug in the later and at the same time
> > without a user (within the patch).
> > 
> > I'd suggest redo it a way similar to FADT refactoring
> >   patch 1: fix checksum bug in virt/arm
> >   patch 2: update reference tables in test
> >   patch 3: introduce AcpiRsdpData similar to commit 937d1b587
> >              (both arm and x86) wich stores all data in hos byte order
> >   patch 4: convert arm's impl. to build_append_int_noprefix() API (commit 5d7a334f7)
> >            ... move out to aml-build.c
> >   patch 5: reuse generalized arm's build_rsdp() for x86, dropping x86 specific one
> >       amending it to generate rev1 variant defined by revision in AcpiRsdpData
> >       (commit dd1b2037a)
> > 
> >   'make check V=1' shouldn't observe any ACPI tables changes after patch 2.  
> 
> And your next suggestion is to add patch 6.  I guess it's doable but
> this will make a single patch a 6 patch series. At this rate this series
> will be at 200 patches easily.
> 
> Automated checks are cool but hey it's easy to see what changed in a
> disassembled table, and we do not update them blindly. So just note in
> the comment that there's a table change for ARM and expected files need
> to be updated and we should be fine IMHO.
Point was to move patches that change tables content first,
where we would pay extra attentions to changes in tables and
then refactoring which shouldn't cause any changes will be mostly
automatic  (at least at that point we won't have to worry about 
tables correctness)


> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  include/hw/acpi/aml-build.h |  3 +++
> > >  hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 40 insertions(+)
> > > 
> > > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > > index c9bcb32d81..3580d0ce90 100644
> > > --- a/include/hw/acpi/aml-build.h
> > > +++ b/include/hw/acpi/aml-build.h
> > > @@ -393,6 +393,9 @@ void
> > >  build_rsdp(GArray *table_data,
> > >             BIOSLinker *linker, unsigned rsdt_tbl_offset);
> > >  void
> > > +build_rsdp_xsdt(GArray *table_data,
> > > +                BIOSLinker *linker, unsigned xsdt_tbl_offset);
> > > +void
> > >  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> > >             const char *oem_id, const char *oem_table_id);
> > >  void
> > > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > > index 51b608432f..a030d40674 100644
> > > --- a/hw/acpi/aml-build.c
> > > +++ b/hw/acpi/aml-build.c
> > > @@ -1651,6 +1651,43 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> > >                   (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
> > >  }
> > >  
> > > +/* RSDP pointing at an XSDT */
> > > +void
> > > +build_rsdp_xsdt(GArray *rsdp_table,
> > > +                BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > > +{
> > > +    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > > +    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > > +    unsigned xsdt_pa_offset =
> > > +        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> > > +    unsigned xsdt_offset =
> > > +        (char *)&rsdp->length - rsdp_table->data;  
> 
> There's a cleaner way to get at the offsets than pointer math:
> 1. save rsdp_table length before you push
> 2. add offset_of for fields
> 
> If switching to build_append_int_noprefix then it's even
> easier - just save length before you append the int
> you intend to patch.
> 
> 
> > > +
> > > +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> > > +                             true /* fseg memory */);
> > > +
> > > +    memcpy(&rsdp->signature, "RSD PTR ", 8);
> > > +    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> > > +    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > > +    /* version 2, we will use the XSDT pointer */
> > > +    rsdp->revision = 0x02;
> > > +
> > > +    /* Address to be filled by Guest linker */
> > > +    bios_linker_loader_add_pointer(linker,
> > > +        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > > +        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > > +
> > > +    /* Legacy checksum to be filled by Guest linker */
> > > +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > +        (char *)rsdp - rsdp_table->data, xsdt_offset,
> > > +        (char *)&rsdp->checksum - rsdp_table->data);
> > > +
> > > +    /* Extended checksum to be filled by Guest linker */
> > > +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > +        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> > > +        (char *)&rsdp->extended_checksum - rsdp_table->data);
> > > +}
> > > +
> > >  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> > >                         uint64_t len, int node, MemoryAffinityFlags flags)
> > >  {  


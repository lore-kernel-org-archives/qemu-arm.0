Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1190881wrt;
        Mon, 19 Nov 2018 10:27:29 -0800 (PST)
X-Google-Smtp-Source: AJdET5cSPwY6KGe4/c+crsiUY/Sjr8X33jg7NMvoBGMUZwM+zdSFrkeSu5qoCH3cvgTAbkaKQOnI
X-Received: by 2002:a81:7307:: with SMTP id o7-v6mr21949716ywc.183.1542652049440;
        Mon, 19 Nov 2018 10:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542652049; cv=none;
        d=google.com; s=arc-20160816;
        b=dcC+gL1kt+H8/WfZ/6uIDZ86TckxQ83aer6bSRqjkerD7VDgiR9lonjmpR0AZsTBKf
         7kcwisM0JZxzSHYH1j0shWD3xH3z7rXU0R3m+CA58yBc+kvdS3VqaHKupxZVrmKfIRSR
         DmGrgCpBjDis3qPRLAsHgaYIAdmsZPeQ4iNuUQAGydo/NkCxbmd9WgFjrXr+a1t8gX3L
         aBq9ndi9VV/O5pGwLv4y4v9j5xLM+hKZXNmXc+ULlevqVpzX3KmuMsjaLkAf3cMLB6gx
         AlLynV72pFNDuyEFGWkoulSRoHvbqiCq3rJZcb/OOvFIZNus/09AkxIPx5SVwvLSJA2y
         qMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=cKCnRlrupFI/j5QcjMae0iF73H1P0f6tJva5O3tO/u4=;
        b=c/kzOZsJXAXCb3W9dshnC1Ftp2Xlwsjiqhu9sj+z487cc54xuJdDiVL0wo+YA7Lelc
         bS15nkDKQcsXkKdl0gSUK2T0uSJWywfJNktprizLkCXaq0E82o4vYuF46GIPV1/iiR7P
         Itj2SCMKEwxRHNndzvyvti0Jzoc5OGJQcvrToxWiOBKubJIpqVjB2OaWjHuJG4FqOGg9
         rL9y5l6BTHF/Jv9NFnhxdYaUFJS2CGthhyzqEYmkOAQ0QiSScPzOrUUYXxEcsdwzY4qF
         sBVNjKO/cvglhX+X2N7gxTNtlppfRjd29oya9LuUHqMFSakNZM60MmklIiHLuLXMn9gw
         fg5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s203si8027165yws.274.2018.11.19.10.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 10:27:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOoGe-0004C2-UT
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 13:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gOoGX-0004Bx-DC
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 13:27:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gOoGU-0006dF-5t
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 13:27:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gOoGT-0006b3-QW; Mon, 19 Nov 2018 13:27:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5F0730832D3;
	Mon, 19 Nov 2018 18:27:16 +0000 (UTC)
Received: from redhat.com (ovpn-122-92.rdu2.redhat.com [10.10.122.92])
	by smtp.corp.redhat.com (Postfix) with SMTP id 29DA9608E7;
	Mon, 19 Nov 2018 18:27:15 +0000 (UTC)
Date: Mon, 19 Nov 2018 13:27:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181119131625-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 19 Nov 2018 18:27:17 +0000 (UTC)
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
X-TUID: C9jTNG+po0Ir

On Thu, Nov 08, 2018 at 03:16:23PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:28 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
> > Description Table). RSDT only allow for 32-bit addressses and have thus
> > been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
> > no longer RSDTs, although RSDTs are still supported for backward
> > compatibility.
> > 
> > Since version 2.0, RSDPs should add an extended checksum, a complete table
> > length and a version field to the table.
> 
> This patch re-implements what arm/virt board already does
> and fixes checksum bug in the later and at the same time
> without a user (within the patch).
> 
> I'd suggest redo it a way similar to FADT refactoring
>   patch 1: fix checksum bug in virt/arm
>   patch 2: update reference tables in test
>   patch 3: introduce AcpiRsdpData similar to commit 937d1b587
>              (both arm and x86) wich stores all data in hos byte order
>   patch 4: convert arm's impl. to build_append_int_noprefix() API (commit 5d7a334f7)
>            ... move out to aml-build.c
>   patch 5: reuse generalized arm's build_rsdp() for x86, dropping x86 specific one
>       amending it to generate rev1 variant defined by revision in AcpiRsdpData
>       (commit dd1b2037a)
> 
>   'make check V=1' shouldn't observe any ACPI tables changes after patch 2.

And your next suggestion is to add patch 6.  I guess it's doable but
this will make a single patch a 6 patch series. At this rate this series
will be at 200 patches easily.

Automated checks are cool but hey it's easy to see what changed in a
disassembled table, and we do not update them blindly. So just note in
the comment that there's a table change for ARM and expected files need
to be updated and we should be fine IMHO.

> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  include/hw/acpi/aml-build.h |  3 +++
> >  hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> > 
> > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > index c9bcb32d81..3580d0ce90 100644
> > --- a/include/hw/acpi/aml-build.h
> > +++ b/include/hw/acpi/aml-build.h
> > @@ -393,6 +393,9 @@ void
> >  build_rsdp(GArray *table_data,
> >             BIOSLinker *linker, unsigned rsdt_tbl_offset);
> >  void
> > +build_rsdp_xsdt(GArray *table_data,
> > +                BIOSLinker *linker, unsigned xsdt_tbl_offset);
> > +void
> >  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> >             const char *oem_id, const char *oem_table_id);
> >  void
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 51b608432f..a030d40674 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -1651,6 +1651,43 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> >                   (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
> >  }
> >  
> > +/* RSDP pointing at an XSDT */
> > +void
> > +build_rsdp_xsdt(GArray *rsdp_table,
> > +                BIOSLinker *linker, unsigned xsdt_tbl_offset)
> > +{
> > +    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > +    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
> > +    unsigned xsdt_pa_offset =
> > +        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
> > +    unsigned xsdt_offset =
> > +        (char *)&rsdp->length - rsdp_table->data;

There's a cleaner way to get at the offsets than pointer math:
1. save rsdp_table length before you push
2. add offset_of for fields

If switching to build_append_int_noprefix then it's even
easier - just save length before you append the int
you intend to patch.


> > +
> > +    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> > +                             true /* fseg memory */);
> > +
> > +    memcpy(&rsdp->signature, "RSD PTR ", 8);
> > +    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> > +    rsdp->length = cpu_to_le32(sizeof(*rsdp));
> > +    /* version 2, we will use the XSDT pointer */
> > +    rsdp->revision = 0x02;
> > +
> > +    /* Address to be filled by Guest linker */
> > +    bios_linker_loader_add_pointer(linker,
> > +        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
> > +        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
> > +
> > +    /* Legacy checksum to be filled by Guest linker */
> > +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > +        (char *)rsdp - rsdp_table->data, xsdt_offset,
> > +        (char *)&rsdp->checksum - rsdp_table->data);
> > +
> > +    /* Extended checksum to be filled by Guest linker */
> > +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > +        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> > +        (char *)&rsdp->extended_checksum - rsdp_table->data);
> > +}
> > +
> >  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> >                         uint64_t len, int node, MemoryAffinityFlags flags)
> >  {

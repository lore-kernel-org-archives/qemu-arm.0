Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2512612wrt;
        Mon, 17 Dec 2018 05:50:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WzBEOG8+OZCR65YyVQQkmnNmbmxiPXPWZr3EA8aNLhz39g1m6JR9fCojbGj8wuFA00K/yo
X-Received: by 2002:ac8:7016:: with SMTP id x22mr12984632qtm.325.1545054645322;
        Mon, 17 Dec 2018 05:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545054645; cv=none;
        d=google.com; s=arc-20160816;
        b=nU7NlbC35onqHpxwW7hFFK7IUCrUG0TpXsZWDJz/FN8Ptvp+iGXFs+z8uzadm3tDQo
         g6uVJE0m/gpi/JDVCYozoAh0N+CCEnMHSMKM41khaYF5L6YE48Xdc5iDTFYji10tNTNq
         Sr9yql8RL4hqz8Dduck/FTz8E1XBpFrkxFnCQusALikE2L/V9AIHKz28yjx/GkfkjdjR
         zACtWEtWFyxevjRJkqH8ckzj/7CTFJpAIjCrOrIincmB8SQiyA46C6/qdaquVpljl8v6
         zgXNDwJo8ZJ3Od7LUzAMBxJt0tdZ0a07nqAPmmbi0cSN/Umo0FSY61r1XFe9ILA9yFp5
         GrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=aTLSXAlggwDvCIKoQ9Yt8Bd+JsToq5rvgPiu1T9ug0c=;
        b=xFfsq8dTOG2EiKXgI5/pnWBetVJq7xustHyEFs5+oUP2R2w+ITG1klGLh2NbeD5jhx
         LYlnILPZdamz1h/1idK3wa2pGBAP8sb+GfFe/wSMnWPYsciyneqaRjjipmQIaGVY29Z0
         G0U4P+djgZzgLwSqLkBL2FnI/8Vj6/vQNQ6s/E381x8G0CsVNtVRtqBk36qzx6BfzpJr
         O+0EoI50W3yTDcoONnlZOwGYm2BXqfxFoiKQf0TIzJMR24S1yVj9BMoYYOeCPeeyNJrZ
         NN5FkA5OmxyIf9ZUImY+MyEa75JFomzlFh3eJ1MnqjQXazDBY5pw9hYff5RBpJowwFgd
         JybQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s128si3963018qkb.115.2018.12.17.05.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 05:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:46941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYtIC-00081L-Aq
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 08:50:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYtI1-000814-Ca
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 08:50:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYtHx-0002vX-Cc
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 08:50:33 -0500
Received: from mga11.intel.com ([192.55.52.93]:28425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYtHx-0002ua-2P; Mon, 17 Dec 2018 08:50:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 05:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="128532655"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO caravaggio)
	([10.252.26.185])
	by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2018 05:50:23 -0800
Date: Mon, 17 Dec 2018 14:49:59 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181217134959.GB4456@caravaggio>
References: <20181217104838.18957-1-sameo@linux.intel.com>
	<20181217104838.18957-8-sameo@linux.intel.com>
	<20181217132028.4e387d2d@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181217132028.4e387d2d@Igors-MacBook-Pro.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 7/8] hw: acpi: Export and
 share the ARM RSDP build
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
X-TUID: RQilFOKHkzh8

On Mon, Dec 17, 2018 at 01:20:28PM +0100, Igor Mammedov wrote:
> On Mon, 17 Dec 2018 11:48:37 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > Now that build_rsdp() supports building both legacy and current RSDP
> > tables, we can move it to a generic folder (hw/acpi) and have the i386
> > ACPI code reuse it in order to reduce code duplication.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> for future reference, if one changes patch in a significant way,
> one is supposed to drop Tested/Reviewed-by tags so that reviewers
> would look at it again and we by mistake won't merge not actually
> reviewed changes.
> 
> [...]
> 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index fb877648ac..846cb6d755 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -2547,35 +2547,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
> >                   "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
> >  }
> >  
> > -static void
> > -build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
> > -{
> > -    /* AcpiRsdpDescriptor describes revision 2 RSDP table and as result we
> > -     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. Keep extra 16 bytes
> > -     * wasted to make sure we won't breake migration for machine types older
> > -     * than 2.3 due to size mismatch.
> > -     */
> > -    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > -    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
> > -    unsigned rsdt_pa_offset =
> > -        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
> > -
> > -    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
> > -                             true /* fseg memory */);
> > -
> > -    memcpy(&rsdp->signature, "RSD PTR ", 8);
> > -    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
> > -    /* Address to be filled by Guest linker */
> > -    bios_linker_loader_add_pointer(linker,
> > -        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
> > -        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
> > -
> > -    /* Checksum to be filled by Guest linker */
> > -    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > -        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
> > -        (char *)&rsdp->checksum - rsdp_table->data);
> > -}
> > -
> >  typedef
> >  struct AcpiBuildState {
> >      /* Copy of table in RAM (for patching). */
> > @@ -2732,7 +2703,25 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> >                 slic_oem.id, slic_oem.table_id);
> >  
> >      /* RSDP is in FSEG memory, so allocate it separately */
> > -    build_rsdp(tables->rsdp, tables->linker, rsdt);
> > +    {
> > +        AcpiRsdpData rsdp_data = {
> > +            .revision = 0,
> > +            .oem_id = ACPI_BUILD_APPNAME6,
> > +            .xsdt_tbl_offset = NULL,
> > +            .rsdt_tbl_offset = &rsdt,
> > +        };
> > +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> > +        if (!pcmc->rsdp_in_ram) {
> > +            /*
> > +             * Legacy machine types (2.2 and older) expect to get a complete
> > +             * revision 2 RSDP table, even though they only look at the
> not true, rev is set to 0 for pc machines,
Rev is set to 0 but they effectively expect to get a structure which
size is the rev 2 one. That's what I meant.

> the point of the original comment was
> that we allocate extra 16 bytes but not actually using them and why it's bad
> to drop it suddenly.
>
> > +             * revision 0 fields (xsdt pointer is not set). So in order to
> > +             * not break migration to those machine types we waste 16 bytes
> > +             * that we amend to the RSDP revision 0 structure.
>                           ^^^ added
> > +             */
> Perhaps amended original comment would be clearer:
> 
>    /* We used to allocate extra space for RSDP rev 2 but used only space for
>     * legacy RSDP and extra bytes were zeroed out. Keep wasting extra 16 bytes
>     * to make sure we won't breake migration for machine types 2.2 and older
>     * due to RSDP blob size mismatch.
>     */
> 
> > +            build_append_int_noprefix(tables->rsdp, 0, 16);
> > +        }
> > +    }
> >  
> >      /* We'll expose it all to Guest so we want to reduce
> >       * chance of size changes.
> 
> With comment fixed:
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> since it's minor fixup and doesn't affect applying remaining patches you can post
> v5 7/8 as reply to v4 7/8
I'll do that.
Since I assume the 16 bytes addition is a significant change, I'll also remove all
reviewed-by/tested-by tags from this patch, except yours.

Cheers,
Samuel.

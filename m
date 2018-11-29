Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2455512wrt;
        Thu, 29 Nov 2018 07:12:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UDLePlC1jdhwh6GTA6xayHNKFTBT58MWx8YaMzl8kSVXSTfXwleyz0N8ZWRgYQDPOfh+7v
X-Received: by 2002:a25:b944:: with SMTP id s4-v6mr1698776ybm.130.1543504352441;
        Thu, 29 Nov 2018 07:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543504352; cv=none;
        d=google.com; s=arc-20160816;
        b=hfxKwUW7UmC5QcAcE8f1M9pyV0DkcYzy6vZjyNEzEAn4I0sN/xW9IGEZzUzdmrcYs6
         0939vgiowINE60Pz3E8/KAhlF5ySm30tuUhQ4IgSD1mOzqN9uKQiyskIUO5CYto+iW41
         HP0vvATATCSC42tG70i0PjP9YvcGEXnJhL0ztqAVMSEliNNXoG0yByZYHJdhh5rC7Qfv
         BIAcK672bxSkBXZi+tXFM3JIN/BPrYfzZo3Ta98XoO7M+1AT8rV0q+kFgz9WWenxB4np
         WcQ7zPAimcQpC4gzZaktCt3vORTrFfF+NHkftf0h2TljDIm4xSDNNX4d2+AzF9D/RCsk
         AlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=GjmOtnl0+ljVXRiWScvEip/HSpzT2JuHB7/YYaYKSck=;
        b=HrM3jahBT23S4GTRJbyeiyqgVZ5Uygqn8wfeu/y4DllKSz+nxBrB/P8mPROqgMZMtf
         wXTyZI4wwYH4HwP7REpr8X/NxJaYAb4V5TN16PWZ1wRxnpe3GFm61m6tTqJFIKlw56em
         8839+e0bnOl2GKpMDkBBrt9fvTAyIC44rwVGKwpkIdbQk8OYrj/wnopDASQxabPILiEv
         mq7kToD3KHnNY7fydjgw84ts2Jh5Io+JqKxMk5hRgJWs/Sa/iu7UL20ek4V7nhXBeIMY
         rQ7vXhTwnVgNeI++YTzQpT0y9RfUH369tS8qKOSCywsquoFg97BxFAcsoOogYO9KdtU6
         YcQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p131si1359533ywe.5.2018.11.29.07.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 07:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSNzT-0003zq-Sg
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 10:12:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNx5-0002H9-QG
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 10:10:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSNx3-0000RK-SB
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 10:10:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSNwy-0000MX-BJ; Thu, 29 Nov 2018 10:09:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85DA830833A6;
	Thu, 29 Nov 2018 15:09:55 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A2F18BAB;
	Thu, 29 Nov 2018 15:09:49 +0000 (UTC)
Date: Thu, 29 Nov 2018 16:09:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181129150947.hqsnpf653vs53uci@kamzik.brq.redhat.com>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-7-sameo@linux.intel.com>
	<20181129144243.so22d2igis7a24xp@kamzik.brq.redhat.com>
	<20181129145942.GB4691@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129145942.GB4691@caravaggio>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 29 Nov 2018 15:09:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 6/8] hw: arm: Support both legacy and
 current RSDP build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t7OhUq6WDRus

On Thu, Nov 29, 2018 at 03:59:42PM +0100, Samuel Ortiz wrote:
> On Thu, Nov 29, 2018 at 03:42:43PM +0100, Andrew Jones wrote:
> > On Thu, Nov 29, 2018 at 02:24:26PM +0100, Samuel Ortiz wrote:
> > > We add the ability to build legacy or current RSDP tables, based on the
> > > AcpiRsdpData revision field passed to build_rsdp().
> > > Although arm/virt only uses RSDP v2, adding that capability to
> > > build_rsdp will allow us to share the RSDP build code between ARM and x86.
> > > 
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > ---
> > >  hw/arm/virt-acpi-build.c | 37 ++++++++++++++++++++++++++-----------
> > >  1 file changed, 26 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 4782aea4fe..e1338b6f5a 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -378,23 +378,38 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> > >      g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
> > >      build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
> > >      build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> > > -    build_append_int_noprefix(tbl, 36, 4); /* Length */
> > > -
> > > -    /* XSDT address to be filled by guest linker */
> > > -    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> > > -    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> > > -                                   24, 8,
> > > -                                   ACPI_BUILD_TABLE_FILE,
> > > -                                   *rsdp_data->xsdt_tbl_offset);
> > > -
> > > -    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> > > -    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> > > +    if (rsdp_data->rsdt_tbl_offset) {
> > 
> > I see why a pointer was used now. Using a pointer ensures a zero
> > offset won't fail this test. However the test could be replaced with
> > rsdp_data->revision == 0.
> > 
> > > +        /* RSDT address to be filled by guest linker */
> > > +        bios_linker_loader_add_pointer(linker,
> > > +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> > > +                                       ACPI_BUILD_TABLE_FILE,
> > > +                                       *rsdp_data->rsdt_tbl_offset);
> > > +    }
> > >  
> > >      /* Checksum to be filled by guest linker */
> > >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > >                                      0, 20, /* ACPI rev 1.0 RSDP size */
> > >                                      8);
> > >  
> > > +    if (rsdp_data->revision == 0) {
> > > +        /* ACPI 1.0 RSDP, we're done */
> > > +        return;
> > > +    }
> > > +
> > > +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> > > +    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
> > 
> > So here's the justification for the pointers. We sanity check the callers.
> We could sanity check the callers without pointers as well, I don't
> think there's a strong advantage for pointers here, except consistence.
> 
> 
> > We're missing the (rsdp_data->revision == 0 && rsdp_data->rsdt_tbl_offset)
> > sanity check though.
> I think there's nothing preventing a caller to include both rsdt and
> xsdt if it wants to be able to run on both < 2.0 and 2.0+ platforms with
> the same table. So if rsdt is set we should add it, regardless of the revision.

True, but if revision is zero, then we *must* have it. Otherwise we'll
silently return from this function with neither an rsdt nor xsdt linked.

Thanks,
drew

> 
> Cheers,
> Samuel.

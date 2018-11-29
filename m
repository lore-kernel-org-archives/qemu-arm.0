Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2632034wrt;
        Thu, 29 Nov 2018 09:49:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WeAP+zv16BZbH7eHgfZ2pdRzn1h9oSU1KEeOvr3VLdF4X5aP0XkYOuGsAh1OQhpWjekLS2
X-Received: by 2002:a25:b213:: with SMTP id i19-v6mr2274081ybj.414.1543513788516;
        Thu, 29 Nov 2018 09:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543513788; cv=none;
        d=google.com; s=arc-20160816;
        b=yok0llL1RTwtQbBh8F49JKrCG/taRAx+JHqBsXuT1mgX14XgT5SyWuL6sh+F9u9uKu
         G+QRbJsHxQNcmN7Vtk1gG3i7Y0qsQy6po5DmsvOnbNgq3weFvA6eph+iYhQ8DCeN15KF
         0SyqRONJ+pzmxduD2EcErwExI8Yf0qW7kZ3gx1yuHq5AOF8cWvYswywoTZImzBIKxmux
         yZX+TlpNMyEsail7h96Pnh1ldh+XwYLNx16QYaid7Bo4nMbPHxWIfyKUIDygVuzuXPpE
         DOWeoxne3SmRNEiZ00MOYKUoY9GvvYy0ZTokgbaFzQGHHrFNx5EoJOnZ3unuJowcH+NX
         nkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=/tbB/THHTt4g/fYDgqpuxj4xkhK+FV/jqyakIECm130=;
        b=lxIaMMZiKpar/sgclThFwqqXlP9UQzVlYiskSX4ijZhpm41hdbBHRvCo5RHARufYsJ
         ZFDF/HOIR1WGqEHkt+uscjw8+m8ZG4GDmD/KwPjtRhiR5BUciDNYl4W9gqxqwRUoCNWh
         bDokudoyl2w5hBwMC0yBCAqXiXk2mXO2WvJvOVn2+cHsP/gBKtr0FxL9HRo0es4RSDWr
         tlrQ7ZDkb539ehuuZeqD8yFjvyWiD78OBW8PaxSJTNfuOk79JXJhGKFqYSXRR5dWkRcg
         ct1U2UAHIMxiiQo5pYpk3xDePyhOPKJ5oLQcwU2VRgBDsY118BOwYOCX2lbgVFyEPQWS
         PWvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9-v6si1475525ybk.76.2018.11.29.09.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 09:49:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSQRf-00013Q-UU
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 12:49:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSQQf-0000WQ-5b
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 12:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSQQW-0006lI-ND
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 12:48:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:58492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSQQW-0006gX-D5; Thu, 29 Nov 2018 12:48:36 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 09:48:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,295,1539673200"; d="scan'208";a="290980552"
Received: from serenarx-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.252.25.254])
	by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2018 09:48:31 -0800
Date: Thu, 29 Nov 2018 18:48:01 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20181129174801.GA4195@caravaggio>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-7-sameo@linux.intel.com>
	<20181129144243.so22d2igis7a24xp@kamzik.brq.redhat.com>
	<20181129145942.GB4691@caravaggio>
	<20181129150947.hqsnpf653vs53uci@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129150947.hqsnpf653vs53uci@kamzik.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 6/8] hw: arm: Support both
 legacy and current RSDP build
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
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R1DSDYM257Kq

On Thu, Nov 29, 2018 at 04:09:47PM +0100, Andrew Jones wrote:
> On Thu, Nov 29, 2018 at 03:59:42PM +0100, Samuel Ortiz wrote:
> > On Thu, Nov 29, 2018 at 03:42:43PM +0100, Andrew Jones wrote:
> > > On Thu, Nov 29, 2018 at 02:24:26PM +0100, Samuel Ortiz wrote:
> > > > We add the ability to build legacy or current RSDP tables, based on the
> > > > AcpiRsdpData revision field passed to build_rsdp().
> > > > Although arm/virt only uses RSDP v2, adding that capability to
> > > > build_rsdp will allow us to share the RSDP build code between ARM and x86.
> > > > 
> > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > ---
> > > >  hw/arm/virt-acpi-build.c | 37 ++++++++++++++++++++++++++-----------
> > > >  1 file changed, 26 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 4782aea4fe..e1338b6f5a 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -378,23 +378,38 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> > > >      g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
> > > >      build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
> > > >      build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> > > > -    build_append_int_noprefix(tbl, 36, 4); /* Length */
> > > > -
> > > > -    /* XSDT address to be filled by guest linker */
> > > > -    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> > > > -    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> > > > -                                   24, 8,
> > > > -                                   ACPI_BUILD_TABLE_FILE,
> > > > -                                   *rsdp_data->xsdt_tbl_offset);
> > > > -
> > > > -    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> > > > -    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> > > > +    if (rsdp_data->rsdt_tbl_offset) {
> > > 
> > > I see why a pointer was used now. Using a pointer ensures a zero
> > > offset won't fail this test. However the test could be replaced with
> > > rsdp_data->revision == 0.
> > > 
> > > > +        /* RSDT address to be filled by guest linker */
> > > > +        bios_linker_loader_add_pointer(linker,
> > > > +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> > > > +                                       ACPI_BUILD_TABLE_FILE,
> > > > +                                       *rsdp_data->rsdt_tbl_offset);
> > > > +    }
> > > >  
> > > >      /* Checksum to be filled by guest linker */
> > > >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> > > >                                      0, 20, /* ACPI rev 1.0 RSDP size */
> > > >                                      8);
> > > >  
> > > > +    if (rsdp_data->revision == 0) {
> > > > +        /* ACPI 1.0 RSDP, we're done */
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> > > > +    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
> > > 
> > > So here's the justification for the pointers. We sanity check the callers.
> > We could sanity check the callers without pointers as well, I don't
> > think there's a strong advantage for pointers here, except consistence.
> > 
> > 
> > > We're missing the (rsdp_data->revision == 0 && rsdp_data->rsdt_tbl_offset)
> > > sanity check though.
> > I think there's nothing preventing a caller to include both rsdt and
> > xsdt if it wants to be able to run on both < 2.0 and 2.0+ platforms with
> > the same table. So if rsdt is set we should add it, regardless of the revision.
> 
> True, but if revision is zero, then we *must* have it. Otherwise we'll
> silently return from this function with neither an rsdt nor xsdt linked.
Correct, thanks. With v3 I'm adding a small piece of code at the start
of build_rsdp() that checks for valid rsdt and xsdt pointers (for rev 0
and 2, respectively).

Cheers,
Samuel.

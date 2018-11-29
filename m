Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2439790wrt;
        Thu, 29 Nov 2018 07:00:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V+k9LXGenHfsvUnoFmn5DqXj6xRpV3WOe+nV0Dq+pizmE0OhmyyFlkmoLEGdIzfhGGtJZH
X-Received: by 2002:a37:5107:: with SMTP id f7mr1677964qkb.124.1543503645837;
        Thu, 29 Nov 2018 07:00:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543503645; cv=none;
        d=google.com; s=arc-20160816;
        b=Uipq1NdHOn4f3Lgk1vDKSvVnpNSDLyjQgjxH/6gKn+oKkTd4639k2WEglPYYHDnUy9
         JJfTRJHcaYoGfukzexo6R468ZeWBmZdP3gNhgHquLUkFeTM2H27mHQdwT9VLvcngOsGo
         yk4DZOecroq8RFRLae2UbzWCuVaLMULR6QHKLYkIZv1i+kz+YJJRjnLzQKtsvpSgRg7P
         2eDisE3yobsy3DX0flAuPDlyLvsS83Kh4J5sPAq3UCIqC5Ucp16Ks/W1eZqiRRDF+4U+
         vMFW7YijwU+655kHgejhGjz9VuFiRbvymB4dLeZmzyW/optsYQmldcYcqvYhI9XV7l5K
         2Nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=GVDKjpN2lTw31Tr4+YTOAmu8TeizdVosO4OnlvEtdUI=;
        b=X6W/AByIcCgcpP+l8aELuITrizHrhW8M9GUkBsW1ZsomtX8CTZIxYK2ErsXE/iLRoV
         0FS8ZrU0YtnWb/bWjcZhRGji2bpzKnq1oTLIoaphVVCmVVKkM6FFfeXfZJ6+SmvmJIyh
         5bobu8olX82JmfR+f7TrBkya6nwYP55byi8VfCUxT+J7gEzoRaH2DfCHnwJkvpGoK04p
         K0kLw7uNg2yMekT4IAgkToLKRETQS6O9oLWCRDKUVMJKdGFn0FE8UqxESJtT2bUFpkIx
         dylJkq7BgXAAHBOU4b7BXIX2UaAnVD+COdiKxDq0u3vsi3ndMbssMcdimha2zl+fIh+I
         Fbag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c26si915444qtm.398.2018.11.29.07.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 07:00:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:54638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSNo4-0002dR-Ry
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 10:00:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSNno-0002bg-MY
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 10:00:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSNnj-0007Qu-Ng
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 10:00:28 -0500
Received: from mga14.intel.com ([192.55.52.115]:34996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSNne-0007Nf-Pv; Thu, 29 Nov 2018 10:00:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 07:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,295,1539673200"; d="scan'208";a="113710530"
Received: from hharjula-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.114])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2018 07:00:11 -0800
Date: Thu, 29 Nov 2018 15:59:42 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20181129145942.GB4691@caravaggio>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-7-sameo@linux.intel.com>
	<20181129144243.so22d2igis7a24xp@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129144243.so22d2igis7a24xp@kamzik.brq.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
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
X-TUID: qJ3cfYk2H0Ee

On Thu, Nov 29, 2018 at 03:42:43PM +0100, Andrew Jones wrote:
> On Thu, Nov 29, 2018 at 02:24:26PM +0100, Samuel Ortiz wrote:
> > We add the ability to build legacy or current RSDP tables, based on the
> > AcpiRsdpData revision field passed to build_rsdp().
> > Although arm/virt only uses RSDP v2, adding that capability to
> > build_rsdp will allow us to share the RSDP build code between ARM and x86.
> > 
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > ---
> >  hw/arm/virt-acpi-build.c | 37 ++++++++++++++++++++++++++-----------
> >  1 file changed, 26 insertions(+), 11 deletions(-)
> > 
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 4782aea4fe..e1338b6f5a 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -378,23 +378,38 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
> >      g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
> >      build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
> >      build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
> > -    build_append_int_noprefix(tbl, 36, 4); /* Length */
> > -
> > -    /* XSDT address to be filled by guest linker */
> > -    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
> > -    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
> > -                                   24, 8,
> > -                                   ACPI_BUILD_TABLE_FILE,
> > -                                   *rsdp_data->xsdt_tbl_offset);
> > -
> > -    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
> > -    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
> > +    if (rsdp_data->rsdt_tbl_offset) {
> 
> I see why a pointer was used now. Using a pointer ensures a zero
> offset won't fail this test. However the test could be replaced with
> rsdp_data->revision == 0.
> 
> > +        /* RSDT address to be filled by guest linker */
> > +        bios_linker_loader_add_pointer(linker,
> > +                                       ACPI_BUILD_RSDP_FILE, 16, 4,
> > +                                       ACPI_BUILD_TABLE_FILE,
> > +                                       *rsdp_data->rsdt_tbl_offset);
> > +    }
> >  
> >      /* Checksum to be filled by guest linker */
> >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> >                                      0, 20, /* ACPI rev 1.0 RSDP size */
> >                                      8);
> >  
> > +    if (rsdp_data->revision == 0) {
> > +        /* ACPI 1.0 RSDP, we're done */
> > +        return;
> > +    }
> > +
> > +    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
> > +    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
> 
> So here's the justification for the pointers. We sanity check the callers.
We could sanity check the callers without pointers as well, I don't
think there's a strong advantage for pointers here, except consistence.


> We're missing the (rsdp_data->revision == 0 && rsdp_data->rsdt_tbl_offset)
> sanity check though.
I think there's nothing preventing a caller to include both rsdt and
xsdt if it wants to be able to run on both < 2.0 and 2.0+ platforms with
the same table. So if rsdt is set we should add it, regardless of the revision.

Cheers,
Samuel.

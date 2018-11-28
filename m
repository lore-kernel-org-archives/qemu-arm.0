Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp833688wrt;
        Wed, 28 Nov 2018 02:06:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VHSJjQIHnNE2PlQnw7k35354WtJ1tJY0BmeSwmR71NCwKFVGLWa4uI4sjW1SbEV93ecRFl
X-Received: by 2002:a81:b54f:: with SMTP id c15mr36597224ywk.274.1543399592229;
        Wed, 28 Nov 2018 02:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543399592; cv=none;
        d=google.com; s=arc-20160816;
        b=HWTdt+/BcxoOAHARqhJOgUOKCWZihC7l74AaiKHmfLiZ8Fp+xbT+a1LOXb69L1XyLj
         B23LiyLa67E0jWVo/76P9QG5bGWo+DU+CWYpyvkQgwB/iEW226A5f9vwuh08k9FbHjPn
         3ovdNuZLMajUZUlAqB5L9rJpngrQcxnlgNYn/yjt0tbLCQwIUnag/sL+4kvHPeQap/g/
         FFdUcTqg5WXRl3Vo46EuJEITOxFhDLcbiYlw2KIa0jjq5D7atjmSro4xp3aSI6/6E0AD
         Z/U5/chdWY9tMzpoYm268zl5wtjgwMu6bVACfpmHDeIL4eYGpFl7fjkAjGc+5ww2FS/v
         ZcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=D5X9621DNHYKbk+GnYB/FNgzWwjqQUBZqmoaZTSWps0=;
        b=d9MvgFzyE1h2XLQoDC0qCh4j4v1WJllSUz7kd04NhLGDMGe8FKkwzXiJupDL1H38Hm
         Rz4SrbzWF5ZvEp5sMO5FEO8ud9zpNNOdIZdxKfqAADLVE1ih1Cy0nn/iH8SY0YNctY1Y
         wEjqdyMWvk5eSlNNNg0WertKCG8nyhFYjvFY+wWkA2+X0Pa8Qk+Mgo6kk6E5Ly7gW54j
         gjPq6ome5uWnQIIy7VpcaS/47CZA8tfJMuUfsXUG8v8iddGho3Nxi3mPD4ubX2OYpkoW
         jL2ML/K6qI8O45p74VKWgD3vtLZbqDMZ2mXyUgaMHxQZTycuMYMVJkHV7pqaKk7UztjT
         5blw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16-v6si4378852ybl.441.2018.11.28.02.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 02:06:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:46901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRwjn-0005rt-Le
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 05:06:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRwjZ-0005ej-0q
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 05:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRwjV-0002es-20
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 05:06:16 -0500
Received: from mga14.intel.com ([192.55.52.115]:53262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRwjU-0002dx-Ps; Wed, 28 Nov 2018 05:06:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 02:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,290,1539673200"; d="scan'208";a="93370507"
Received: from bdoyle2-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.251.86.101])
	by orsmga007.jf.intel.com with ESMTP; 28 Nov 2018 02:06:06 -0800
Date: Wed, 28 Nov 2018 11:05:36 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20181128100536.GC5677@caravaggio>
References: <20181126162942.21258-1-sameo@linux.intel.com>
	<20181126162942.21258-5-sameo@linux.intel.com>
	<20181127162551.29608eeb@redhat.com>
	<20181127154218.GA5677@caravaggio>
	<20181127172749.75a036b4@redhat.com>
	<20181127221515-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181127221515-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-arm] [PATCH 4/8] hw: arm: Carry RSDP specific data
 through AcpiRsdpData
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /KmeshfVPqmX

Hi Michael,

On Tue, Nov 27, 2018 at 10:26:30PM -0500, Michael S. Tsirkin wrote:
> On Tue, Nov 27, 2018 at 05:27:49PM +0100, Igor Mammedov wrote:
> > On Tue, 27 Nov 2018 16:42:18 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> > 
> > > Hi Igor,
> > > 
> > > On Tue, Nov 27, 2018 at 04:25:51PM +0100, Igor Mammedov wrote:
> > > > On Mon, 26 Nov 2018 17:29:37 +0100
> > > > Samuel Ortiz <sameo@linux.intel.com> wrote:
> > > >   
> > > > > That will allow us to generalize the ARM build_rsdp() routine to support
> > > > > both legacy RSDP (The current i386 implementation) and extended RSDP
> > > > > (The ARM implementation).
> > > > > 
> > > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > > ---
> > > > >  include/hw/acpi/acpi-defs.h | 11 +++++++++++
> > > > >  hw/arm/virt-acpi-build.c    | 27 ++++++++++++++++++++++-----
> > > > >  2 files changed, 33 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > > > > index af8e023968..e7fd24c6c5 100644
> > > > > --- a/include/hw/acpi/acpi-defs.h
> > > > > +++ b/include/hw/acpi/acpi-defs.h
> > > > > @@ -53,6 +53,17 @@ struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
> > > > >  } QEMU_PACKED;
> > > > >  typedef struct AcpiRsdpDescriptor AcpiRsdpDescriptor;
> > > > >  
> > > > > +typedef struct AcpiRsdpData {
> > > > > +    uint8_t oem_id[6]; /* OEM identification */
> > > > > +    uint8_t revision;  /* Must be 0 for 1.0, 2 for 2.0 */
> > > > > +
> > > > > +    unsigned *rsdt_tbl_offset;
> > > > > +    unsigned *xsdt_tbl_offset;
> > > > > +} AcpiRsdpData;
> > > > > +  
> > > >   
> > > > > +#define ACPI_RSDP_REV_1 0
> > > > > +#define ACPI_RSDP_REV_2 2  
> > > > it's one time used spec defined values so just use values directly
> > > > in place with a comment, so reader won't have to jump around code
> > > > when comparing to spec.  
> > > It's also used in the ACPI tests fix patch.
> > it's better to use in test it's own version (we just opencode them there)
> > see fadt_fetch_facs_and_dsdt_ptrs()/sanitize_fadt_ptrs()
> > same applies for length.
> > that way if we break it in qemu's code test would catch the thing
> > 
> > > Also the 0 for revision 1 is a little confusing, I feel the above
> > > definition is clearer.
> > that's confusion is in the spec, so we just mimic it, no need to add more on top
> 
> To be more precise, there is a huge number of constants in ACPI
> such that adding defines for them all would be a huge burden,
I find that defining a set of well named constants is a lot less painful
than maintaining code with at least the same amount of hard coded
constants. That's a personal opinion, for sure.

> and will not make it easy to check values against the
> spec at all (case in point ACPI_RSDP_REV_2 is actually wrong,
> 2 is version 3 and up).
I may be misreading the spec, but I understand 0 is for ACPI 1.0 and 2
is for ACPI 2.0+. The latest spec is a little confusing with regard to
this field, but when looking at the 2.0a ACPI spec for RSDP:

"The ACPI version 1.0 revision number of this table is zero. The ACPI 2.0
value for this field is 2."

> Thus the preferred style is to add a comment near the value
> matching spec name verbatim, so one can copy it and
> look it up in the spec. Sometimes one needs to reference
> specific spec version.
> 
> 0 /* Revision: ACPI version 1.0 */
> 
> and
> 
> 1 /* Revision: ACPI 2.0 */
> 
> and
> 
> 2 /* Revision: ACPI 3.0a */
> 
> For style consistency, if the value is used multiple times, we avoid
> duplication by using an inline function and not a macro.
Not entirely sure how this materializes. Do you mean that e.g. if I want
to check for an RSDP revision I'd have to define inline functions of
that kind:

bool is_rsdp_revision_0(uint8_t *rsdp_table);
bool is_rsdp_revision_2(uint8_t *rsdp_table);

or do you have something else in mind?

Cheers,
Samuel.


Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3383539wrt;
        Fri, 30 Nov 2018 02:00:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WDSIU+5IOzeeMRtaBmdOaxcBgJrSqcMLFuxLVP3zmlK6iwmg5YNSMiod4zCwFTaGuzF26t
X-Received: by 2002:a25:4184:: with SMTP id o126-v6mr4662145yba.166.1543572058306;
        Fri, 30 Nov 2018 02:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543572058; cv=none;
        d=google.com; s=arc-20160816;
        b=n2y2FDhySi86pqtvfvUsuwCJNDemxTpSP2tJRWXJhlppdctmLt04k64AUwlUaC5AmP
         q0hHOUZ6ngIavSpT0gUt1YX7WU0iOKQC5lCWURXVt/iesvT1UA1/UDw2T+b27qqEvo4O
         UA8yyT34VHKfOfdeUM5nfjnZbWRZUZ0yyRrfYyffJetPt7fvzTvv/ZcmJD+TKHoZhY45
         aIBN6rLltS9TvTCmoMdJ/ErWZYc1t8oekrO0/oZ8oemrhwdQzbhX7WuhYIjLD97No3j+
         MPc19kALUclBCanrPJPK62a9SbxfAPPGTwqybPQErVJzHLPO0wWgOKZnfsrFN0C+4S8d
         vTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=N3fbkICnBJTAmaRxuwQ1MeNW9sD4TYviCm7SUyy/IYY=;
        b=YJb7+1PORK6Ud5yyT+9rQ4ztu0M5AGWH0H0IBPMReMknLbtZmGv6PYg0xBUseeTAME
         EnaCKRAWkRe3X0tScuzHAkuFLAjZDjNXNb1jS8mHERZc37XGrmA0DRiZOgkpmwvEPkO4
         HRBdPN2ezfpo81Clg2jzrJoH9iTOHOGcub1wJSq1tdSbzpAfwp+KLyIYM+4Bz99iXsLT
         N7XYbvf7rOBPKYsOayj8gI9A3Gd8kuPNP5gGOBpXlL0DgguDebNBuQnQxVvKRRUGWGSe
         SCvKJTeHzW7X8ydO2TPScLcpTHTumurxgFMEMP80wP02pzHWpCVTSJ69WMpAxo0YuYHJ
         aDKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si2933870ywk.432.2018.11.30.02.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 02:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59089 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSfbV-0001wk-NC
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 05:00:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSfYB-0007TA-Cc
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:57:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSfY8-0007d2-5w
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 04:57:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44906)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSfY6-0007bN-4o; Fri, 30 Nov 2018 04:57:28 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A3DDC056794;
	Fri, 30 Nov 2018 09:57:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4FD15D9CD;
	Fri, 30 Nov 2018 09:57:17 +0000 (UTC)
Date: Fri, 30 Nov 2018 10:57:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181130105716.2131be19@redhat.com>
In-Reply-To: <20181129145942.GB4691@caravaggio>
References: <20181129132428.333-1-sameo@linux.intel.com>
	<20181129132428.333-7-sameo@linux.intel.com>
	<20181129144243.so22d2igis7a24xp@kamzik.brq.redhat.com>
	<20181129145942.GB4691@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 30 Nov 2018 09:57:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Osg0ruo2KRQe

On Thu, 29 Nov 2018 15:59:42 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

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
I remember now,
we need pointer to RSDT offset here so that we could skip bios_linker_loader_add_pointer(rsdt)
when RSDT isn't provided (0 is also a valid offset), as for xsdt field it follows
rsdt one for consistency and we can do sanity checks on it.

assert here seems not really necessary as it guarantied to SIGSEGV
on NULL point dereference at bios_linker_loader_add_pointer(*xdst) callsite.
But I don't care here, so I'll leave it up to Samuel.

> > We're missing the (rsdp_data->revision == 0 && rsdp_data->rsdt_tbl_offset)
> > sanity check though.  
> I think there's nothing preventing a caller to include both rsdt and
> xsdt if it wants to be able to run on both < 2.0 and 2.0+ platforms with
> the same table. So if rsdt is set we should add it, regardless of the revision.
agreed,
we don't do this in QEMU but it's correct, there could be both and it's better
follow better document spec in this case.

> 
> Cheers,
> Samuel.


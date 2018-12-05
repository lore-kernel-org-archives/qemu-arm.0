Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9594689wrt;
        Wed, 5 Dec 2018 08:47:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uc6VWt4f2UVuPMvtz6kg56GJLdrG8frt7TH6vznwxILFTQyLPhGedTC7FYFZtVkchVfzKg
X-Received: by 2002:ac8:7598:: with SMTP id s24mr16328630qtq.6.1544028471498;
        Wed, 05 Dec 2018 08:47:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544028471; cv=none;
        d=google.com; s=arc-20160816;
        b=R8qLfCt1qRYKdtNaBfsEKR8PbdIL20mA/Qh+4vr0WP/CagHk5TbQsoI5mrtsdRJ0yE
         RYirmeI1X/xuM90n7IeekUHCv3lM6nLmHfceDCsuLCauFFf9ifsutOhpCuuW4Eu7UYaK
         OysSsgQJIcL6gHBb9nt3GPFTM2xswJaGnEA4dprV0E7sSwT7TzgRpOvVgs8MjQHRZuXp
         xxLffhlj/vZ2FdosXWeaOWquL10cTBMwY1lP67PihKnT3Vid69OKNJUrWjfVtDSbI45E
         XjaWBkmuJSWBUJI9ITSabUkoCY8E0fhtY3hoiM773Ia13tTBaTaz3attxvB+4qS00Ew0
         sSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7kLeXWfHtLKDkT0MHhZnSorWcO620gh7qhdeZxpbZ4o=;
        b=YPOp72gLAJeFRDbYW4paRHmpcZKb0UF7QVIV+WzAQ3AAR78NsnhY9J3I5frCY6zRvR
         BQdcfqxELT1UoZyvYPdmmIxbga0mXa5rghmue4Qt1GiCCioqE+qcg7km9t8z0VM9YILX
         MwYkOgSWJLDfhM1DQs5iPl8lVtJ4D/r2DE2UFK7yEYRhilH/2NBPqgSCRwBHStyXPNYe
         iBg9aIt35mUXbTb5GI1Lffx6AuEa9FD+3vE0gx3Iyoz0gICq4dTgCEEsOxRBWuLaSlg1
         6fgpSeG42KqXMdXPjqz3AQyjpK6jEwMpcGs/3Hgf7UdARMq4puVVVwLGqHDOcJQcpeuR
         OCQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v30si13294456qtd.97.2018.12.05.08.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 08:47:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUaL0-0003lY-OF
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 11:47:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUaKR-0003k1-8R
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 11:47:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUaKQ-000452-Ce
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 11:47:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUaKL-0003pu-QF; Wed, 05 Dec 2018 11:47:10 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6260A4D4DF;
	Wed,  5 Dec 2018 16:47:08 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B71917B9D;
	Wed,  5 Dec 2018 16:47:03 +0000 (UTC)
Date: Wed, 5 Dec 2018 14:47:02 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181205164702.GR18284@habkost.net>
References: <CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
	<50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
	<20181204180607.GB18284@habkost.net>
	<CAFEAcA9JXeRGfKzouYJQKxgXuw_Z-up0a1ijZX9hZvXbdkwiuA@mail.gmail.com>
	<20181204190548.GH18284@habkost.net>
	<CAFEAcA9M3akT7sF-kjCg41ucuUhv2PxKaCBmkN3eacvqvf_w9Q@mail.gmail.com>
	<20181204194532.GJ18284@habkost.net>
	<f0a7fe11-61ff-6a60-f320-438e4e38f2da@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0a7fe11-61ff-6a60-f320-438e4e38f2da@greensocs.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 05 Dec 2018 16:47:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lUTO6ray8oRb

On Wed, Dec 05, 2018 at 03:02:45PM +0100, Luc Michel wrote:
> On 12/4/18 8:45 PM, Eduardo Habkost wrote:
> > On Tue, Dec 04, 2018 at 07:16:39PM +0000, Peter Maydell wrote:
> >> On Tue, 4 Dec 2018 at 19:05, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >>> On Tue, Dec 04, 2018 at 06:24:19PM +0000, Peter Maydell wrote:
> >>>> A cluster is a group of CPUs which are all identical and have
> >>>> the same view of the rest of the system.
> >>
> >>> With that definition in mind, why can't QEMU cluster CPUs
> >>> automatically by looking at CPU models and address space objects?
> >>
> >> That sounds like it is in theory feasible and in practice
> >> quite tricky. You would have to look not just at the CPU
> >> model name but also introspect all its properties for
> >> ones which change features of the CPU and are set differently
> >> on different CPUs (and I don't think there's any way to
> >> automatically tell which properties are ones which make
> >> the CPU different for which-cluster purposes and which aren't).
> >> And if we automatically checked whether address space objects
> >> were the same it would rule out implementing devices with
> >> per-cpu banked memory mapped registers by mapping different
> >> things into the AS for each CPU (though that's a hypothetical
> >> at the moment -- I've thought about implementing stuff that
> >> way but we tend to implement that sort of thing by looking
> >> at current_cpu->cpu_index at the moment).
> > 
> > I see.
> > 
> > Can't we at least do something to make sure the cluster objects
> > make sense?  e.g. by ensuring at least QOM CPU type is the same,
> > and that cpu->address_space somehow points to
> > cpu->cluster->address_space?
> Where such a check should be placed? Cluster realize function is not
> good since children can still be added after device realization. A good
> place would be when object_property_add_child() is called, but I'm not
> aware of a way of hooking into that with the QOM API...

Not sure.  Maybe it can be a post-machine_init hook.  Maybe this
can be done by a separate (avocado_qemu-based?) test script.

It looks like address space info is available through HMP ("info
mtree") and not QMP, so we'd need to fix that first.  CCing HMP
and QMP maintainers.

I don't think this should block the series, but it would be a
welcome addition.

-- 
Eduardo

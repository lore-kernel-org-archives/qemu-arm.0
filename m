Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp893245wrt;
        Thu, 22 Nov 2018 08:27:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X99Nc4FVuXJNpbLvXSudE7Ivu00ev2K1kni2knFZc1nTewYF/HJ40/pw/v4U4c9X6E9+7s
X-Received: by 2002:a25:4457:: with SMTP id r84-v6mr1779164yba.192.1542904034912;
        Thu, 22 Nov 2018 08:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542904034; cv=none;
        d=google.com; s=arc-20160816;
        b=gCyuIhX6dj670rEe7HzxBnfXkzRkIONdTdANs8zqVi1IuSpZZQfp9vhmkdqsRbTAMR
         R9ofzd+NLqefdMK5F4UPTSsf0OXTMKEuoX69+SZJaGq2Ddn5kOmwYoLPCy29d0bTqo8C
         UsYy4WRUQy+/hy1oyARHr6JgXL+/6HuHBXdRc6/IoZrNbPWWgbMWuUgxMd1hFaTFEeGA
         Ualk5EbAIIZkL+1z1kToPcIt9jIo5tBVgO1OfhT/dEa7gf8hScIq28jXyA0ffn/lasXM
         QpMrzOuEngndbebmMSulQaJii8/gWgDPMaAYqi/Sh2oxYo388vTvYun3ztOvY+7ANKRB
         aSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=K/mpK4iO+IVTKjvpGZHfx/mTq1DQKMMjTiBnxl1+IbY=;
        b=GUkhObbBTrOhphdHWrovwtIR6C5yJliG4Xomd2xz2jiuq2EnkqWw+TIvYfaI12s09R
         C3Z76OsteAW94ALAXh+pJJxHoWE7W7axmPXQQgb6qhZQAZQ5PIHKEUfN/2q1J4/3SuVh
         Jx+PQgl/CWk2xaXpopqVj137NstdqKdbZ65iI5vvmne5ik/yigGnM8fKaXKDHNcimLMN
         oVBVnb7D3nZhRGP1EeuNglDZk9216euFEKjxr/wbuFHFZAW9/8SdgT+t1nOGbQ6uTtEU
         HWGEwA0KdSHrctu0IQuWpCE/sEqjURcmiCPK/YxVKsQDdVs0zS5VDjLfi1ZeDpJcscIq
         RBNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x18-v6si29476624ybq.488.2018.11.22.08.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 08:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gProv-0003N6-Qb
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 11:27:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gProo-0003Ms-GW
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 11:27:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gProj-0007h1-Q8
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 11:27:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gProj-0007g7-BP; Thu, 22 Nov 2018 11:27:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F884308FC5C;
	Thu, 22 Nov 2018 16:26:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B58ED60920;
	Thu, 22 Nov 2018 16:26:53 +0000 (UTC)
Date: Thu, 22 Nov 2018 17:26:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181122172652.6b02aef6@redhat.com>
In-Reply-To: <20181121144211.GE4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
	<20181121144211.GE4426@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 22 Nov 2018 16:26:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement
 XSDT support for RSDP
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
	Eduardo Habkost <ehabkost@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yw6SBwVutC7m

On Wed, 21 Nov 2018 15:42:11 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> Hi Igor,
> 
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
> >
> >            ... move out to aml-build.c
> >   patch 5: reuse generalized arm's build_rsdp() for x86, dropping x86 specific one
> >       amending it to generate rev1 variant defined by revision in AcpiRsdpData
> >       (commit dd1b2037a)  
> I agree patches #1, #2 and #5 make sense. 3 and 4 as well, but here
> you're asking about something that's out of scope of the current serie.
/me guilty of that, but I have excuses for doing so:
  * that's the only way to get rid of legacy approach given limited resources.
    So task goes to whomever touches old code. /others and me included/
    I'd be glad if someone would volunteer and do clean ups but in absence
    of such, the victim is interested party.
  * contributor to ACPI part learns how to use preferred approach,
    makes code more robust and clear as it's not possible to make
    endianness mistakes, very simple to review and notice mistakes
    as end result practically matches row by row a table described in spec.
  * there could be exceptions, like acpi/nvdimm.c also contributed by Intel
    whole file written in legacy style (it probably started before I started
    enforcing conversions, anyways it's late now and should be done as whole),
    or odd fixes to existing tables, or too complex case.
    (depending on case I might still ask for conversion)

My ranting aside, conversions I've asked for here are trivial and for
everyone's benefit /QEMU gets more maintainable code, users less bugs,
contributor knows requirements hence his patches go through less iterations,
hopefully if contributor stays around and does contributions/reviews to
acpi code, QEMU could get another co-maintainer for acpi part/

> I'll move those patches from this serie and build a 6 patches new serie
> as suggested.

Thanks!

> 
> Cheers,
> Samuel.
> 


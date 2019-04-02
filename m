Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1240237wrx;
        Mon, 1 Apr 2019 23:25:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2sL3+plPGKvkwpHRaWFGdeKJPt+ZGRjtO7lE2gevtE2de7p7VJvzMWBw+PDwqX9MR5429
X-Received: by 2002:a25:57d6:: with SMTP id l205mr33671782ybb.399.1554186346003;
        Mon, 01 Apr 2019 23:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554186345; cv=none;
        d=google.com; s=arc-20160816;
        b=dV2DJqE4B4TigtJbXGbseXb/qZOoGnGraa4KMPa0WZWSzN5GHmwNgEb0hnYcgGpaEn
         /T7YEI2ZdWv4Xt2B/nfN4IYzKT9cOVfyjW+ZLWCkBk5jpwStlACTO6IXshulb5APOrb0
         e7URIkOpSXU82mbkpGMD2O5f/mHRA8AFOu2GIi55YQMi+SDMeKEnb8PjYo6B+fWgMa71
         Q4IHcdh/O13za+puwRB7tWJXUe2dF8JQeWLYKd1yjzcG5BgVsHAKEm6zYYNoXRLSuTl3
         KY9i8YCIs0QwI16O1CLkSFYW0Yy8v/2vlDHFuv+FPjQtS5CLFM628427Y9AtzgBB0HbR
         pQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=W7HqxmKUsiqAVYQTzbsDYU9q+9rWorR5DmESrQutTJo=;
        b=dFQnDoR1RWWMY4gCtEjz9ZTjjOvALiAQKAp1YDTSuabGKotf6VLd6L6ILAbboqS4gv
         OWsZ1tZhZWvH77cZ+JPN1Pt/KXcPVWtWJoKVoBcp2YW229XBDNe6APSlodw1mtZc7mEd
         tnudXWqrgU/H1SfxhJhBK8Ih+eYRO0ornUgSXzjqLocVT/dUEEH6h+0vMcgGkguXXqqV
         RVwtbQp47LGwpnsQi46JhNNsRxo1sYFDTf3ZgnrFyrj7YuWfMEIUu10ZNzVowei3GVNl
         Aq0faRJ8YOXOA6RaLgvdYqDGotMwGekFFYsRp705AYfr/VAlldqNRvE9xxk7T78f/YIK
         hODg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si7141324ybl.406.2019.04.01.23.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 23:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBCrh-00049s-Fv
	for alex.bennee@linaro.org; Tue, 02 Apr 2019 02:25:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hBCoj-0001Sg-KH
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 02:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hBChe-0007gJ-Pd
	for qemu-arm@nongnu.org; Tue, 02 Apr 2019 02:15:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52706)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hBChe-0007e3-Ct; Tue, 02 Apr 2019 02:15:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6222181E0F;
	Tue,  2 Apr 2019 06:15:21 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA2886B826;
	Tue,  2 Apr 2019 06:15:16 +0000 (UTC)
Date: Tue, 2 Apr 2019 08:15:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190402081512.6194a58f@redhat.com>
In-Reply-To: <20190402035343.GA6527@richard>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190402035343.GA6527@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 02 Apr 2019 06:15:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract
 build_mcfg
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o90W+PEP8OXN

On Tue, 2 Apr 2019 11:53:43 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
> >On Wed, 13 Mar 2019 13:33:59 +0000
> >Wei Yang <richard.weiyang@gmail.com> wrote:
> >  
> >> 
> >> I am lost at this place.
> >> 
> >> sig is a part of ACPI table header, you mean the sig is not necessary to
> >> be set in ACPI table header?
> >> 
> >> "skip table generation" means remove build_header() in build_mcfg()?  
> >I mean do not call build_mcfg() at all when you don't have to.
> >
> >And when you need to keep table_blob the same size (for old machines)
> >using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
> >might just work as well. it's still hack but it can live in x86 specific
> >acpi_build() keeping build_mcfg() generic.
> >
> >As for defining what to use as criteria to decide when we need to keep
> >table_blob size the same, I don't remember history of it, so I'd suggest
> >to look at commit a1666142, study history of acpi_ram_update() and
> >legacy_acpi_table_size to figure out since which machine type one doesn't
> >have to keep table_blob size the same.
> >  
> 
> Hi, Igor
> 
> It took me sometime to go through the migration infrastructure.
> 
> Before continuing, I'd like to talk about what I understand to make sure my
> direction is correct.
> 
> ACPI has a structure named AcpiBuildState, which contains all related
> information. During migration, those data in AcpiBuildState should be
> transferred to destination, e.g. table_mr, rsdp_mr and link_mr.
> 
> In the case related to mcfg, the problem lies in table_mr. And the reason
> breaking migration is the size of table_mr is different between source and
> destination.(This reason is a guess from those change logs and mails.)
This is about right if I recall it correctly.
 
> The migration infrastructure has several SaveStateEntry to help migrate
> different elements. The one with name "ram" take charge of RAMBlock. So this
> SaveStateEntry and its ops is the next step for me to investigate. And from
> this to see the effect of different size MemoryRegion during migration.
I don't think that you need to dig in migration mechanics so deep.
For our purpose of finding QEMU&machine version where migration between
size mismatched MemoryRegions (or RAMBlocks) is fixed is sufficient.

Aside from trying to grasp how migration works internally, you can try
to simulate[1] problem and bisect it to a commit that fixed it.
It still not easy due to amount of combinations you'd need to try,
but it's probably much easier than trying to figure out issue just
by reading code.

1) to stimulate you need to recreate conditions for table_mr jumping
from initial padded size to the next padded size after adding bridge
so you'd have reproducer which makes table_mr differ in size.

If I recall correctly in that time conditions were created by large
amount hotpluggble CPUs (maxcpus - CLI option) and then addidng
PCI bridges.
I'd just hack QEMU to print table_mr size in acpi_build_update()
to find coldplug CLI where we jump to the next padded size and then
use it for bisection with bridge[s] hotplug on source and migrating that
without reboot to target where hotplugged bridges are on CLI (one has to
configure target so it would have all devices that source has including
hotplugged ones)

> Is this sounds correct?
> 


Received: by 10.28.4.212 with SMTP id 203csp1011824wme;
        Tue, 24 Apr 2018 09:04:57 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoAEMaQopz2zPjhtvkDtoQ6eHxhhn8llBc8dqcuxnC4C3BT1iVOxNXyDiVjenmVoQH1H1UL
X-Received: by 10.55.168.140 with SMTP id r134mr27006902qke.41.1524585897850;
        Tue, 24 Apr 2018 09:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524585897; cv=none;
        d=google.com; s=arc-20160816;
        b=OGAcjl/Lx5Vjy9W1SAm9cxwaJYjy3TsFszPrck4qrJVTgvN6MyjLq78WXcqM1RpBIX
         YRwaU8zM63g++oFY20VzQEho1WzLQBz9I7SM1UDsJh3JYvB2/XLyxnl4LzvRK1ieQMRA
         U58tAS3Z4Y83bYJIm9nLBKtMtiUdXk8xWDgOUlg1eai9WuHRPf9n9HXi5JEb9kghY7x5
         Y8pSCTL0fqa/hSv2PTUFpT7XtB+alFlbTxxBa9oe9nQaz8x22aSYpxXGrXXpQQg7VnNd
         bCbTJDkKwVg32qi9CM99UWooi/2vwMrsUg88dXry4Yu5RhdXusLPEb2AuKqKfJcFBPsd
         PMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=HRk7Rsr9FzjVrmvLH+86RnLKToBvHgVWfWLjPJyv/gs=;
        b=UBb0GMWw3rBLgOOUVbHouVAa6/FELrPFAh1GCTUX/kVkmyoydcrwuCxhB8///AzDdr
         ZnghKZfYTs3jbgopjOrYepDuJcVNGBa000cde1Jlpe/kK7WIlBfq1vd85V2DKKZIrGrE
         Rob8fttY1IIosEB46o1um+iLOdc5eib2dumvRbuCcSjpgjEAL/U7gmI0WaIHMDdojfJw
         Ly/keF/2d5/E6DkrZ563GP03yEUb79iO7t+a8hoKRqWJHuAsj3EVZX6i9U1X4/50au8v
         K/LwuMKQXWLdEWBzd1BE6MKgUHh/mHacZ7DxVVC6roeHavhzXCYGyWyn4NBIYgFVp9cb
         J4Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m21si1111675qkk.216.2018.04.24.09.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Apr 2018 09:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fB0R7-00065F-9W
	for alex.bennee@linaro.org; Tue, 24 Apr 2018 12:04:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fAzsy-000395-M1
	for qemu-arm@nongnu.org; Tue, 24 Apr 2018 11:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fAzsv-0004xM-De
	for qemu-arm@nongnu.org; Tue, 24 Apr 2018 11:29:40 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59944 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fAzsv-0004wC-6S; Tue, 24 Apr 2018 11:29:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DCC9406F96F;
	Tue, 24 Apr 2018 15:29:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30A692023227;
	Tue, 24 Apr 2018 15:29:34 +0000 (UTC)
Date: Tue, 24 Apr 2018 17:29:32 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20180424152932.tszber3blx32luro@kamzik.brq.redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-4-git-send-email-zhuyijun@huawei.com>
	<20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83868CA39@FRAEML521-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83868CA39@FRAEML521-MBX.china.huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 24 Apr 2018 15:29:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 24 Apr 2018 15:29:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM
 memory region support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vdwqK4+6Ipin

On Thu, Apr 19, 2018 at 09:06:30AM +0000, Shameerali Kolothum Thodi wrote:
> > From: Andrew Jones [mailto:drjones@redhat.com]
> > Instead of using memory region aliases, it would be best if each RAM
> > region was modeled with pc-dimms, as that would move us towards supporting
> > memory hotplug and allow the regions to be explicitly identified
> > (start/size) on the command line - supporting migration. Actually, how
> > does this series address migration? What if the host we migrate to doesn't
> > have the same reserved regions in sysfs?
> 
> Thanks for going through this series and comments.
> 
> I am looking into reviving this series based on the new proposed vfio iova 
> interface[1]. The vfio interface will now provide  a list of valid iova ranges.
> That means, instead of working on reserved regions to find out the valid
>  memory regions, the code here will have the valid regions list directly.
> 
> The above comment of yours mentions about modelling the memory regions
> with pc-dimms. If I understand that proposal correctly, in case the iova list
> has  multiple entries in it(means there are holes in the memory) the extra
> regions has to be added as a pc-dimm slot memory.

Hi Shameer,

iiuc, the concern is that the valid region list may look something like
this made up example:

 0x000e0000000 0x000000011fffffff
 0x00180000000 0x00000002ffffffff
 0x02000000000 0x0000011fffffffff
 0x22000000000 0xffffffffffffffff

You then want to avoid overlapping the holes with memory, because the
holes represent regions that may have platform devices assigned, which
need to keep 1:1 gpa -> hpa mappings.

If that's the case, then I think the biggest problem with the made up
example is the initial hole [0x0 0xdfffffff], as that would overlap the
currently hard coded base of RAM (0x40000000). Indeed we were thinking
that the base of RAM would be modeled as a non-pluggable dimm of size
1G at the 1G boundary. As for the rest of memory (for memory > 1G), in
the made up example we could just allocate a single pc-dimm from a memory
region representing the [0x22000000000 0xffffffffffffffff] range without
any hassle.

> Having gone through
> the Qemu source, I am not sure what is the best way to accomplish that.
> (of course I am not that familiar with the Qemu source). Is it ok to invoke
> qdev_device_add() from here? Any pointers on this is very appreciated.

I'm not an expert on that (nor any of this stuff, really - hopefully what
I've written above isn't completely bonkers). I've CC'ed Igor for help.
I've also CC'ed Eric, because of the magic word 'vfio'.

> 
> One more point is, considering the fact that ARM64 linux kernel still doesn't
> support hotplug memory at the moment, not sure how much we gain
> from the pc-dimm model.

It will eventually. Moving towards the pc-dimm model now, in order to
handle the non-contiguous memory needs, will go a long ways to enabling
hotplug later.

Thanks,
drew

> 
> Please let me know your thoughts on this.
> 
> Thanks,
> Shameer
> 
> [1]. https://lkml.org/lkml/2018/4/18/293

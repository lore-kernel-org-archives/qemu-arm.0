Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4833225wrx;
        Tue, 9 Apr 2019 07:54:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8e7asmhO5e4SBJgFaZQ0eELBARO6axRwZL87+rO3l3/yg6giKTrXcNH2/Sd7a/hRxoaWg
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr2013846wrq.87.1554821677388;
        Tue, 09 Apr 2019 07:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554821677; cv=none;
        d=google.com; s=arc-20160816;
        b=I1PeMHdJwMLhxqM68BX6H4aWkAJUIhW6Kr/WkBf4hRhwKCkYaHwDuI+jK3DEmv21jq
         A1LTAazDkqq5TmcavF8e0bWhStVk6EWjK1Tr1XFtMBFP5MBtiSINW71ejTVIzC0mLH5o
         hVlGDGG4D0ti7D2n2Kwced1Tr4cEyqF94fW0OFjTLPYEYZbr5zD0wotsMGdFKCIH798q
         0NcBz6iU62yn+UBz1R7kCyxfhmBY6D8+W+/6FrSguclEilXL0GIvjqJbXCu+GpToCh1x
         eGilxPw3MRfMYG+K+LKJAT1mvFWk0/0Vbpk3UcHs5Ksso65+J7xWpLA3aXmPT5yYzDM7
         ozsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=LOHIciP9bPtfxwFv6upvj9fQgssgf5zPwrUCx9sKtRs=;
        b=RFZOhP6Whtpg3894G9wur6x+8dmTQyqOJanxWRZK5vdG7vTLx5CgjTPx8fyyz/S3ek
         sLWYTkdHX3IVCaFOOBwsvy0e4JisNR65ww1mOMaXVYlZMkn09x3KT1d71ex3BPB4XxiH
         Sb+A+Ojzz0xtg8DGqLf3IkHZrTXNBwuErV/Tht4KpGfofoQ44HB0361W4bJTXFv2gzFf
         WxCjgPNFrpx9nDDbNy46NFa2v44WncqC6OTNVIfkIW3bVNtGI2iKVcbITg8syRga68Wr
         QVbRHwGk34H0dD4J3D5pDmXO2vGPkY6RxUOL/Konwk1TBqoWa8LfzRWs9J1ufKGFjHMd
         +fOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b184si8453125wmd.17.2019.04.09.07.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 07:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDs8y-0000r5-Dk
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 10:54:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hDs8q-0000qk-Ag
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 10:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hDs8o-0005gQ-Dr
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 10:54:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hDs8m-0005eT-F4; Tue, 09 Apr 2019 10:54:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19D4D307EA96;
	Tue,  9 Apr 2019 14:54:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E9751001E65;
	Tue,  9 Apr 2019 14:54:20 +0000 (UTC)
Date: Tue, 9 Apr 2019 16:54:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190409165415.2e5df0c6@redhat.com>
In-Reply-To: <20190405085529.GA24071@richard>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190402035343.GA6527@richard>
	<20190402081512.6194a58f@redhat.com>
	<20190405085529.GA24071@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 09 Apr 2019 14:54:22 +0000 (UTC)
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, Wei Yang <richard.weiyang@gmail.com>,
	shannon.zhaosl@gmail.com, wei.w.wang@intel.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eGQXLTbONTPf

On Fri, 5 Apr 2019 16:55:30 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> On Tue, Apr 02, 2019 at 08:15:12AM +0200, Igor Mammedov wrote:
> >On Tue, 2 Apr 2019 11:53:43 +0800
> >Wei Yang <richardw.yang@linux.intel.com> wrote:
> >
> >   
> >> The migration infrastructure has several SaveStateEntry to help migrate
> >> different elements. The one with name "ram" take charge of RAMBlock. So this
> >> SaveStateEntry and its ops is the next step for me to investigate. And from
> >> this to see the effect of different size MemoryRegion during migration.  
> >I don't think that you need to dig in migration mechanics so deep.
> >For our purpose of finding QEMU&machine version where migration between
> >size mismatched MemoryRegions (or RAMBlocks) is fixed is sufficient.
> >  
> 
> ok.
> 
> >Aside from trying to grasp how migration works internally, you can try
> >to simulate[1] problem and bisect it to a commit that fixed it.
> >It still not easy due to amount of combinations you'd need to try,
> >but it's probably much easier than trying to figure out issue just
> >by reading code.
> >
> >1) to stimulate you need to recreate conditions for table_mr jumping
> >from initial padded size to the next padded size after adding bridge
> >so you'd have reproducer which makes table_mr differ in size.
> >
> >If I recall correctly in that time conditions were created by large
> >amount hotpluggble CPUs (maxcpus - CLI option) and then addidng
> >PCI bridges.
> >I'd just hack QEMU to print table_mr size in acpi_build_update()
> >to find coldplug CLI where we jump to the next padded size and then
> >use it for bisection with bridge[s] hotplug on source and migrating that
> >without reboot to target where hotplugged bridges are on CLI (one has to
> >configure target so it would have all devices that source has including
> >hotplugged ones)
> >  
> 
> Igor,
> 
> I got some confusion on how to re-produce this case. To be specific, how to 
> expand table_mr from initial padded size to next padded size.

here is reproducer:

$ qemu-system-x86_64-2.2 -M pc-i440fx-2.2 -smp 1,maxcpus=255 -monitor stdio `for i in {1..28}; do echo  "--device pci-bridge,chassis_nr=$i"; done` `for i in {1..24}; do printf --  " --device pci-bridge,bus=pci.1,addr=%x.0,chassis_nr=$i" $i ; done

## hotplug a bridge an migrate to file:

(qemu) device_add pci-bridge,bus=pci.1,addr=19.0,chassis_nr=25
(qemu) migrate "exec:gzip -c > STATEFILE.gz"

## exit and start destination

qemu-system-x86_64  -M pc-i440fx-2.2 -smp 1,maxcpus=255 -monitor stdio `for i in {1..28}; do echo  "--device pci-bridge,chassis_nr=$i"; done` `for i in {1..25}; do printf --  " --device pci-bridge,bus=pci.1,addr=%x.0,chassis_nr=$i" $i ; done`  -incoming "exec: gzip -c -d STATEFILE.gz"

# in case destination is QEMU-2.2 it will fail with:
  Length mismatch: /rom@etc/acpi/tables: 0x20000 in != 0x40000

# in case destination is QEMU-2.3 it will work as expected


> 
> Let's see a normal hotplug case first. 
> 
>     I did one test to see the how a guest with hot-plug cpu migrate to
>     destination.  It looks the migration fails if I just do hot-plug at
>     source. So I have to do hot-plug both at source and at destination. This
>     will expand the table_mr both at source and destination.
> 
> Then let's see the effect of hotplug more devices to exceed original padded
> size. There are two cases, before re-sizable MemoryRegion and after.
> 
> 1) Before re-sizable MemoryRegion introduced
> 
>     Before re-sizable MemoryRegion introduced, we just pad table_mr to 4K. And
>     this size never gets bigger, if I am right. To be accurate, the table_blob
>     would grow to next padded size if we hot-add more cpus/pci bridge, but we
>     just copy the original size of MemoryRegion. Even without migration, the
>     ACPI table is corrupted when we expand to next padded size.
>     
>     Is my understanding correct here?
> 
> 2) After re-sizable MemoryRegion introduced
> 
>     This time both tabl_blob and MemoryRegion grows when it expand to next
>     padded size. Since we need to hot-add device at both side, ACPI table
>     grows at the same pace.
> 
>     Every thing looks good, until one of it exceed the resizable
>     MemoryRegion's max size. (Not sure this is possible in reality, while
>     possible in theory). Actually, this looks like case 1) when resizable
>     MemoryRegion is not introduced. The too big ACPI table get corrupted.
> 
> So if my understanding is correct, the procedure you mentioned "expand from
> initial padded size to next padded size" only applies to two different max
> size resizable MemoryRegion. For other cases, the procedure corrupt the ACPI
> table itself.
> 
> Then when we look at
> 
>     commit 07fb61760cdea7c3f1b9c897513986945bca8e89
>     Author: Paolo Bonzini <pbonzini@redhat.com>
>     Date:   Mon Jul 28 17:34:15 2014 +0200
>     
>         pc: hack for migration compatibility from QEMU 2.0
>     
> This fix ACPI migration issue before resizable MemoryRegion is
> introduced(introduced in 2015-01-08). This looks expand to next padded size
> always corrupt ACPI table at that time. And it make me think expand to next
> padded size is not the procedure we should do?
> 
> And my colleague Wei Wang(in cc) mentioned, to make migration succeed, the
> MemoryRegion has to be the same size at both side. So I guess the problem
> doesn't lie in hotplug but in "main table" size difference.

It's true only for pre-resizable MemoryRegion QEMU versions,
after that size doesn't affect migration anymore.


> For example, we have two version of Qemu: v1 and v2. Their "main table" size
> is:
> 
>     v1: 3990
>     v2: 4020
> 
> At this point, their ACPI table all padded to 4k, which is the same.
> 
> Then we create a machine with 1 more vcpu by these two versions. This will
> expand the table to:
> 
>     v1: 4095
>     v2: 4125
> 
> After padding, v1's ACPI table size is still 4k but v2's is 8k. Now the
> migration is broken.
> 
> If this analysis is correct, the relationship between migration failure and
> ACPI table is "the change of ACPI table size". Any size change of any
you should make distinction between used_length and max_length here.
Migration puts on wire used_length and that's what matter for keeping migration
working.

> ACPI table would break migration. While of course, since we pad the table,
> only some combinations of tables would result in a visible real size change in
> MemoryRegion.
> 
> Then the principle for future ACPI development is to keep all ACPI table size
> unchanged.
once again it applies only for QEMU (versions < 2.1) and that was
the problem (i.e. there always would be configurations that would create
differently sized tables regardless of arbitrary size we would preallocate)
resizable MemoryRegions solved.
 
> Now let's back to mcfg table. As the comment mentioned, guest could
> enable/disable MCFG, so the code here reserve table no matter it is enabled or
> not. This behavior ensures ACPI table size not changed. So do we need to find
> the machine type as you suggested before?
We should be able to drop mcgf 'padding' hack since machine version
which was introduced in the QEMU version that introduced resizable MemoryRegion
as well.

I'll send a patch to address that

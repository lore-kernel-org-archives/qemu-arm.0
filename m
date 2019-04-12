Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp154324wrx;
        Thu, 11 Apr 2019 22:45:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEEYMDbM23ssh9oeO4I6Euv5TYmeGHSWayKsUeoAN68zECoEVPneF3MCbA5vmKs7VURfeK
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr9742995wmh.127.1555047952109;
        Thu, 11 Apr 2019 22:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555047952; cv=none;
        d=google.com; s=arc-20160816;
        b=FVqllqmAAHq1TDzbyY7LmfpRkz9Xp1CkX5u+Z5xqAK6qrxTn9Auk2NMB+iJhtMpOHT
         y1NzGbS4dg3kbTVzROYB70Tl+zUQSu4Oelc+mA3o9+ja4fgsL62dKLsoiw5Fjxc42e92
         dm4eXOdTyktxf9ymmRoiNy0+Ab7R8nf8JuZ7R+ZkZOoFhW4qtU4U1MfHxWfJH/kXHWmA
         Sp5T09sh4d0GMnoguF50vaZfL+QAs/j1x9Dvf6NHmcz/AsJmIyZEzXbBKvkNDLrZcHvK
         ++ZlXGehEgGY1KPH3cHkhzUXhnjvuESb5A11gBLcxCERpNiN0vGNmM7/VmqEaYjdy5UC
         i2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=0Tszx93Oho2x1LwxU+UZmhfkkpoy3rGMK9XgtyndMmM=;
        b=nZdrDO2sAG9KDlWHc/lYDk0+LBcImVB8L2pzYoUUh5/XrdTcLDgCL5HdkxXIayN+GV
         ioNTXGN0oBgQMuxDN1QHpjWdlSos9w/WUrivE9WRPWh0ovR8Ol9UuePme/Rjofcnj2v0
         HClvEgL9y4FBFmJllFqSSf+9Pg8CWwEfG2lMSRoVxtjGmiKcyI6iEfQ/JjNvuSqY+2ag
         3YiBP1MII44RtEkr/wHlcT0I3+UWBBWuo6dc0g0aGDcEkuq9GTkQjDhQvCBxXamNZg7R
         Th16ds5JqovpnVMRH673kjE5kxzW8SriWZWAmOsCTMHGeaI30rZ3EeqvcUt30NUbJW1l
         xLQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si4544128wmc.49.2019.04.11.22.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 22:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:59355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEp0Z-0002Sv-5r
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 01:45:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hEp0M-0002G1-Pt
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 01:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hEp0L-0007Yq-Fr
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 01:45:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:53628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hEp0L-0006Mb-3B; Fri, 12 Apr 2019 01:45:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2019 22:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,340,1549958400"; d="scan'208";a="142117065"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 11 Apr 2019 22:44:26 -0700
Date: Fri, 12 Apr 2019 13:44:07 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190412054407.GA5035@richard>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190402035343.GA6527@richard>
	<20190402081512.6194a58f@redhat.com>
	<20190405085529.GA24071@richard>
	<20190409165415.2e5df0c6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409165415.2e5df0c6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	qemu-devel@nongnu.org, Wei Yang <richard.weiyang@gmail.com>,
	shannon.zhaosl@gmail.com, wei.w.wang@intel.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fg+h8bh7i0TV

On Tue, Apr 09, 2019 at 04:54:15PM +0200, Igor Mammedov wrote:
>> 
>> Let's see a normal hotplug case first. 
>> 
>>     I did one test to see the how a guest with hot-plug cpu migrate to
>>     destination.  It looks the migration fails if I just do hot-plug at
>>     source. So I have to do hot-plug both at source and at destination. This
>>     will expand the table_mr both at source and destination.
>> 
>> Then let's see the effect of hotplug more devices to exceed original padded
>> size. There are two cases, before re-sizable MemoryRegion and after.
>> 
>> 1) Before re-sizable MemoryRegion introduced
>> 
>>     Before re-sizable MemoryRegion introduced, we just pad table_mr to 4K. And
>>     this size never gets bigger, if I am right. To be accurate, the table_blob
>>     would grow to next padded size if we hot-add more cpus/pci bridge, but we
>>     just copy the original size of MemoryRegion. Even without migration, the
>>     ACPI table is corrupted when we expand to next padded size.
>>     
>>     Is my understanding correct here?
>> 
>> 2) After re-sizable MemoryRegion introduced
>> 
>>     This time both tabl_blob and MemoryRegion grows when it expand to next
>>     padded size. Since we need to hot-add device at both side, ACPI table
>>     grows at the same pace.
>> 
>>     Every thing looks good, until one of it exceed the resizable
>>     MemoryRegion's max size. (Not sure this is possible in reality, while
>>     possible in theory). Actually, this looks like case 1) when resizable
>>     MemoryRegion is not introduced. The too big ACPI table get corrupted.
>> 
>> So if my understanding is correct, the procedure you mentioned "expand from
>> initial padded size to next padded size" only applies to two different max
>> size resizable MemoryRegion. For other cases, the procedure corrupt the ACPI
>> table itself.
>> 
>> Then when we look at
>> 
>>     commit 07fb61760cdea7c3f1b9c897513986945bca8e89
>>     Author: Paolo Bonzini <pbonzini@redhat.com>
>>     Date:   Mon Jul 28 17:34:15 2014 +0200
>>     
>>         pc: hack for migration compatibility from QEMU 2.0
>>     
>> This fix ACPI migration issue before resizable MemoryRegion is
>> introduced(introduced in 2015-01-08). This looks expand to next padded size
>> always corrupt ACPI table at that time. And it make me think expand to next
>> padded size is not the procedure we should do?
>> 
>> And my colleague Wei Wang(in cc) mentioned, to make migration succeed, the
>> MemoryRegion has to be the same size at both side. So I guess the problem
>> doesn't lie in hotplug but in "main table" size difference.
>
>It's true only for pre-resizable MemoryRegion QEMU versions,
>after that size doesn't affect migration anymore.
>
>
>> For example, we have two version of Qemu: v1 and v2. Their "main table" size
>> is:
>> 
>>     v1: 3990
>>     v2: 4020
>> 
>> At this point, their ACPI table all padded to 4k, which is the same.
>> 
>> Then we create a machine with 1 more vcpu by these two versions. This will
>> expand the table to:
>> 
>>     v1: 4095
>>     v2: 4125
>> 
>> After padding, v1's ACPI table size is still 4k but v2's is 8k. Now the
>> migration is broken.
>> 
>> If this analysis is correct, the relationship between migration failure and
>> ACPI table is "the change of ACPI table size". Any size change of any
>you should make distinction between used_length and max_length here.
>Migration puts on wire used_length and that's what matter for keeping migration
>working.
>
>> ACPI table would break migration. While of course, since we pad the table,
>> only some combinations of tables would result in a visible real size change in
>> MemoryRegion.
>> 
>> Then the principle for future ACPI development is to keep all ACPI table size
>> unchanged.
>once again it applies only for QEMU (versions < 2.1) and that was
>the problem (i.e. there always would be configurations that would create
>differently sized tables regardless of arbitrary size we would preallocate)
>resizable MemoryRegions solved.
> 
>> Now let's back to mcfg table. As the comment mentioned, guest could
>> enable/disable MCFG, so the code here reserve table no matter it is enabled or
>> not. This behavior ensures ACPI table size not changed. So do we need to find
>> the machine type as you suggested before?
>We should be able to drop mcgf 'padding' hack since machine version
>which was introduced in the QEMU version that introduced resizable MemoryRegion
>as well.
>
>I'll send a patch to address that

Hi, Igor,

We have found the qemu version 2.1 which is with resizable MemoryRegion
enabled and q35 will stop support version before 2.3. The concern about ACPI
mcfg table breaking live migration is solved, right?

If so, I would prepare mcfg refactor patch based on your cleanup.

-- 
Wei Yang
Help you, Help me

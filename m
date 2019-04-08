Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3233681wrx;
        Mon, 8 Apr 2019 01:12:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwG2j0f8WobVwsCyvsLlJcUMzqToX5a/g9hG+85ZFvQ8w2LGy4aKR1uHNz3pabs4XpejS8a
X-Received: by 2002:a1c:c8:: with SMTP id 191mr16083012wma.44.1554711120793;
        Mon, 08 Apr 2019 01:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554711120; cv=none;
        d=google.com; s=arc-20160816;
        b=augDzxkKNIpeoDPGXbDHYZDxXtw/C0qZo0qOQai41JpvF9q6ojqTYZOrM4IqvDZN0h
         oo3xdwIjnp87DnOSvTShGwVM/nyzg4oKgGO+EmiNq4Vela21VzlVjgaI03NcJ+o9qc1A
         8XUW5qzcZggcVXyXss0ZijDGCz/USBVDVd+fo3I+7doBnYPo2oIy58ingIEgavh7Wupk
         95qWt9wWlHu3fz2tLv3woAFPhcYfIE/K4ewd4ZIXyZ1iPLAcgng/x3VbGjJGBx6/U7DG
         9fZo8nrPIEf2Ucehh8LyOW+oCG/849bVlwKbUdGJSJVUYUA9DMbE7BgwVgZ7d650mgXx
         RbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=HoMnjxPnUK9/j+ZfJIBMmZR6prPiq1Uk++sNgzm1A40=;
        b=jOQABTGII0z1R8KANxhg+Y5gABJISHfZe3F8rDL5Itg4hnmIqOzOD9GfBncc/zbahp
         pOYMsVvErw7fqWavIzAQoH8sycmNZSTZ7sBfF5qtamUg+pvxIojGOz4YxZXwFqEUBSUr
         q+LFcYiAtTybfOwVnTDWxmljcVa4g7+rXuTBIZGM6rTlDMQKIRGgj+1YsNTwZz9ro9B7
         aNk3BEzKkjuKNQzdGcYQDpRKcgunNdEvYaRUTVm3AVhWcik8br34X1cQ9jKADDTdd4qe
         W5GxaqYu8W3Jm8unfIbTuhRKZZvgykbKL9Vxc4GyMIuZCKMOzj/LTXx3nMjToaydMbFP
         jETg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si5864111wmf.82.2019.04.08.01.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 01:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDPNn-0004MV-RV
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 04:11:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hDPNg-0004ME-9Y
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 04:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hDPNa-0008MB-JT
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 04:11:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hDPNX-0008LM-OE; Mon, 08 Apr 2019 04:11:44 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14A09308FE95;
	Mon,  8 Apr 2019 08:11:41 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 454931018A0E;
	Mon,  8 Apr 2019 08:11:36 +0000 (UTC)
Date: Mon, 8 Apr 2019 10:11:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190408101132.5d849d1f@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8393564E2@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
	<459862f9-18f7-0a37-dfb9-b8ca9aa6a2d2@redhat.com>
	<3de6adf3-30c7-5908-e153-2195bc6879c5@redhat.com>
	<9e939ea4-4be2-a165-dce4-47d8196020b0@redhat.com>
	<20190403114901.6e4ea653@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839353082@lhreml524-mbs.china.huawei.com>
	<ebf745ce-f5bc-be0c-c0ce-3ce25bd7afa9@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8393564E2@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 08 Apr 2019 08:11:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>, Auger Eric <eric.auger@redhat.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Laszlo Ersek <lersek@redhat.com>, Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yNHxsJ03PG6P

On Wed, 3 Apr 2019 16:25:49 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Laszlo,
> 
> > -----Original Message-----
> > From: Laszlo Ersek [mailto:lersek@redhat.com]
> > Sent: 03 April 2019 14:29
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> > Igor Mammedov <imammedo@redhat.com>
> > Cc: Auger Eric <eric.auger@redhat.com>; Ard Biesheuvel
> > <ard.biesheuvel@linaro.org>; peter.maydell@linaro.org;
> > sameo@linux.intel.com; qemu-devel@nongnu.org; Linuxarm
> > <linuxarm@huawei.com>; shannon.zhaosl@gmail.com;
> > qemu-arm@nongnu.org; xuwei (O) <xuwei5@huawei.com>;
> > sebastien.boeuf@intel.com; Leif Lindholm <Leif.Lindholm@arm.com>
> > Subject: Re: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
> > feature "fdt"
> > 
> > On 04/03/19 14:10, Shameerali Kolothum Thodi wrote:
> >   
> > >>>>> So, the condition for hiding the hotpluggable memory nodes in question
> > >>>>> from the DT is:  
> > >>>>  
> > >>>>>
> > >>>>>   (aarch64 && firmware_loaded && acpi_enabled)  
> >   
> > >>> While UEFI has bindings for both 32-bit and 64-bit ARM, ACPI has a
> > >>> 64-bit-only binding for ARM. (And you can have UEFI without ACPI, but
> > >>> not the reverse, on ARM.) So if you run the 32-bit build of the
> > >>> ArmVirtQemu firmware, you get no ACPI at all; all you can rely on with
> > >>> the OS is the DT.  
> > >
> > > Just to confirm, does that mean with 32-bit build of the UEFI, the OS cannot
> > > boot with ACPI and uses DT only.  
> > 
> > Indeed.
> >   
> > > So,
> > >
> > > If ((aarch64 && firmware_loaded && acpi_enabled) {
> > >    Hide_hotpluggable_memory_nodes()
> > > } else {
> > >    Add_ hotpluggable_memory_nodes()
> > > }
> > >
> > > should work for all cases?  
> > 
> > Yes.
> > 
> > Here's what happens when any one of the subconditions evaluates to false:
> > 
> > - ARM32 has no ACPI bindings, so the guest kernel can only use DT.
> > 
> > - On AARCH64, if you don't "load the firmware" (= don't use UEFI), then
> >   there won't be an ACPI entry point for the OS to locate (the RSD PTR
> >   is defined by the ACPI spec in UEFI terms, for AARCH64). So the guest
> >   kernel can only use DT.
> > 
> > - When on AARCH64 and using UEFI, but asking QEMU not to generate ACPI
> >   content, the firmware will not install any ACPI tables, so the guest
> >   kernel can only use DT.
> >   
> 
> Thanks. That makes it very clear. Much appreciated.
> 
> > >>> This "bitness distinction" is implemented in the firmware already. If
> > >>> you hid the memory nodes from the DT under the condition
> > >>>
> > >>>   (!aarch64 && firmware_loaded && acpi_enabled)
> > >>>
> > >>> then the nodes would not be seen by the OS at all (because
> > >>> "acpi_enabled" is irrelevant for the 32-bit build of ArmVirtQemu, and
> > >>> all the OS can ever get is DT).  
> > >>
> > >> It's getting tricky and I don't like a bit that we are trying to carter
> > >> 64 bit only UEFI build (or any other build) on QEMU side. Also Peter has
> > >> a valid about guessing on QEMU side (that's usually a source of problem
> > >> in the future).  
> > >
> > > If the above is correct(with 32-bit variant of UEFI, OS cannot have ACPI boot),
> > > then do we really have the issue of memory becoming non  
> > hot-un-unpluggable?  
> > > May be I am missing something.  
> > 
> > I think Igor and Peter dislike adding complex logic to QEMU that
> > reflects the behavior of a specific firmware. AIUI their objection isn't
> > that it wouldn't work, but that it's not the right thing to do, from a
> > design perspective.  
> 
> Understood. Hope we can converge on something soon.
Lets try adding a parameter to memory descriptors in DT that would mark
them as hotpluggable.

 
> Cheers,
> Shameer


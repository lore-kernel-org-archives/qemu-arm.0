Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp159834wrx;
        Wed, 3 Apr 2019 05:11:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWr+jNK5q/w8l9dtHprXUAgc3M/FTNBfjUEfXo5DOnvEGPfS3A2kaOm/7B0FM0wMGbd17R
X-Received: by 2002:a81:2357:: with SMTP id j84mr456718ywj.261.1554293483342;
        Wed, 03 Apr 2019 05:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554293483; cv=none;
        d=google.com; s=arc-20160816;
        b=0yk5HXgVmV3qo6aVTlf1fyi6tyQUQ35fpAaYBph2yvkPrf9n1bAGmgNjtX/8tbTCsI
         6dG8uqoK5dqCLtj1a+pXRy3EPwIh2gsHt4vmlKjzHm7FbvBTCsqrfGRE41Z2Swhsa7ni
         UX4xbFOk6pK3H0pjZordBfjtZHM6oN/mghBFFjFHIAZPvWPPQ20bCdywQucePfK++W4K
         49ThNMVaqaimyLYw7TCqIhkVnguD6YIQOz8UNxBBjtZq4EWJpS6sLtDhXth9Gc4+0k3c
         9dbNNJb5KORLDwPf2jpbK+MXhjXRfh1l4KVaDkqEmtuPVVGUdDflnZXaxC+My4Tzblaj
         YiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=kO4XP46uyyJc9wDpdDOzX+urY1MFqM6zLhN1fetr0ys=;
        b=lGSzDawnMqrBwRglinrDmD6EsFYC3FjLynFp6ycuieZMDIEaGl9a5EU+OVE1CX1yP8
         g4FSE7j25ItTWamx/bKd8VjGNXXOJgtbcXKoNphVu/5x5juWmUS2qCS8AgrMUoiPIOCC
         mbBDcIqFiQgNcTbOJc4PrSpgtaWndNuBc6QOJIlMdykxkHSNM7M1bo5B8FZKHwxonu2P
         McVinyQwevqviQTZ+3nZOSAxq1ldKRXruIKn7SMZt2Aj6CA33ss+raNL2C3+oC4qm/Mo
         LgnVmmPiSttlHxI6lMnVRFsVhlXcdXojZrnNpaXjLzZKWjZ+mVoDIjwXukrVYnjeKufv
         IBPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si9581714ybb.274.2019.04.03.05.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Apr 2019 05:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:56349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hBeji-0004vZ-O1
	for alex.bennee@linaro.org; Wed, 03 Apr 2019 08:11:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hBejW-0004uC-Bh
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 08:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hBejS-0004Mq-Uh
	for qemu-arm@nongnu.org; Wed, 03 Apr 2019 08:11:10 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45386 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hBejS-0004M2-IP; Wed, 03 Apr 2019 08:11:06 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 754E087DA1ED6188E6D9;
	Wed,  3 Apr 2019 13:11:04 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.229]) by
	lhreml704-cah.china.huawei.com ([10.201.108.45]) with mapi id
	14.03.0415.000; Wed, 3 Apr 2019 13:10:56 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
	feature "fdt"
Thread-Index: AQHU39PgLS6qaIxo3EqaH9uSQe0Wh6YiZMSAgAAFAfCAADi+gIAAAGKAgAALywCABJiAgIABuf+AgAACnwCAATC0gIAAM+4A
Date: Wed, 3 Apr 2019 12:10:55 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839353082@lhreml524-mbs.china.huawei.com>
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
In-Reply-To: <20190403114901.6e4ea653@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
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
	Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tdINpntYZhFd



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 03 April 2019 10:49
> To: Laszlo Ersek <lersek@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>; Ard Biesheuvel
> <ard.biesheuvel@linaro.org>; peter.maydell@linaro.org;
> sameo@linux.intel.com; qemu-devel@nongnu.org; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; Linuxarm
> <linuxarm@huawei.com>; shannon.zhaosl@gmail.com;
> qemu-arm@nongnu.org; xuwei (O) <xuwei5@huawei.com>;
> sebastien.boeuf@intel.com; Leif Lindholm <Leif.Lindholm@arm.com>
> Subject: Re: [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
> feature "fdt"
>=20
> On Tue, 2 Apr 2019 17:38:26 +0200
> Laszlo Ersek <lersek@redhat.com> wrote:

[...]

> > >>> Sure, sorry.
> > >>>
> > >>> This series:
> > >>> - [PATCH v3 00/10] ARM virt: ACPI memory hotplug support,
> > >>> https://patchwork.kernel.org/cover/10863301/
> > >>>
> > >>> aims to introduce PCDIMM support in qemu. In ACPI mode, it builds t=
he
> > >>> SRAT and DSDT parts and relies on GED to trigger the hotplug.
> > >>>
> > >>> We noticed that if we build the hotpluggable memory dt nodes on top=
 of
> > >>> the above ACPI tables, the DIMM slots are interpreted as not
> > >>> hotpluggable memory slots (at least we think so).
> > >>>
> > >>> We think the EDK2 GetMemoryMap() uses the dt node info and ignores
> the
> > >>> fact that those slots are exposed as hotpluggable in the SRAT for
> example.
> > >>>
> > >>> So in this series, we are forced to not generate the hotpluggable m=
emory
> > >>> dt nodes if we want the DIMM slots to be effectively recognized as
> > >>> hotpluggable.
> > >>>
> > >>> Could you confirm we have a correct understanding of the EDK2
> behaviour
> > >>> and if so, would there be any solution for EDK2 to absorb both the =
DT
> > >>> nodes and the relevant SRAT/DSDT tables and make the slots
> hotpluggable.
> > >>>
> > >>> At qemu level, detecting we are booting in ACPI mode and purposely
> > >>> removing the above mentioned DT nodes does not look straightforward=
.
> > >>
> > >> The firmware is not enlightened about the ACPI content that comes fr=
om
> > >> QEMU / fw_cfg. That ACPI content is *blindly* processed by the firmw=
are,
> > >> as instructed through the ACPI linker/loader script, in order to ins=
tall
> > >> the ACPI content for the OS. No actual information is consumed by th=
e
> > >> firmware from the ACPI payload -- and that's a feature.
> > >>
> > >> The firmware does consume DT:
> > >>
> > >> - If you start QEMU *with* "-no-acpi", then the DT is both consumed =
by
> > >> the firmware (for its own information needs), and passed on to the O=
S.
> > >>
> > >> - If you start QEMU *without* "-no-acpi" (the default), then the DT =
is
> > >> consumed only by the firmware (for its own information needs), and t=
he
> > >> DT is hidden from the OS. The OS gets only the ACPI content
> > >> (processed/prepared as described above).
> > >>
> > >>
> > >> In the firmware, the "ArmVirtPkg/HighMemDxe" driver iterates over th=
e
> > >> base/size pairs in all the memory nodes in the DT. For each such bas=
e
> > >> address that is currently tracked as "nonexistent" in the GCD memory
> > >> space map, the driver currently adds the base/size range as "system
> > >> memory". This in turn is reflected by the UEFI memmap that the OS ge=
ts
> > >> to see as "conventional memory".
> > >>
> > >> If you need some memory ranges to show up as "special" in the UEFI
> > >> memmap, then you need to distinguish them somehow from the "regular"
> > >> memory areas, in the DT. And then extend "ArmVirtPkg/HighMemDxe" in
> the
> > >> firmware, so that it act upon the discriminator that you set in the =
DT.
> > >>
> > >>
> > >> Now... from a brief look at the Platform Init and UEFI specs, my
> > >> impression is that the hotpluggable (but presently not plugged) DIMM
> > >> ranges should simply be *absent* from the UEFI memmap; is that
> correct?
> > >> (I didn't check the ACPI spec, maybe it specifies the expected behav=
ior
> > >> in full.) If my impression is correct, then two options (alternative=
s)
> > >> exist:
> > >>
> > >> (1) Hide the affected memory nodes -- or at least the affected base/=
size
> > >> pairs -- from the DT, in case you boot without "-no-acpi" but with a=
n
> > >> external firmware loaded. Then the firmware will not expose those ra=
nges
> > >> as "conventional memory" in the UEFI memmap. This approach requires
> no
> > >> changes to edk2.
> > >>
> > >> This option is precisely what Eric described up-thread, at
> > >>
> <http://mid.mail-archive.com/3f0a5793-dd35-a497-2248-8eb0cd3c3a16@redh
> at.com>:
> > >>
> > >>> in machvirt_init, there is firmware_loaded that tells you whether y=
ou
> > >>> have a FW image. If this one is not set, you can induce dt. But if
> > >>> there is a FW it can be either DT or ACPI booted. You also have the
> > >>> acpi_enabled knob.
> > >>
> > >> (The "-no-acpi" cmdline option clears the "acpi_enabled" variable in
> > >> "vl.c").
> > >>
> > >> So, the condition for hiding the hotpluggable memory nodes in questi=
on
> > >> from the DT is:
> > >
> > >>
> > >>   (aarch64 && firmware_loaded && acpi_enabled)
> > >
> > > Thanks a lot for all those inputs!
> > >
> > > I don't get why we test aarch64 in above condition (this was useful f=
or
> > > high ECAM range as the aarch32 FW was not supporting it but here, is =
it
> > > still meaningful?)
> >
> > Sorry, I should have clarified that. Yes, it is meaningful:
> >
> > While UEFI has bindings for both 32-bit and 64-bit ARM, ACPI has a
> > 64-bit-only binding for ARM. (And you can have UEFI without ACPI, but
> > not the reverse, on ARM.) So if you run the 32-bit build of the
> > ArmVirtQemu firmware, you get no ACPI at all; all you can rely on with
> > the OS is the DT.

Just to confirm, does that mean with 32-bit build of the UEFI, the OS canno=
t
boot with ACPI and uses DT only. So,

If ((aarch64 && firmware_loaded && acpi_enabled) {
   Hide_hotpluggable_memory_nodes()
} else {
   Add_ hotpluggable_memory_nodes()
}

should work for all cases?

> > This "bitness distinction" is implemented in the firmware already. If
> > you hid the memory nodes from the DT under the condition
> >
> >   (!aarch64 && firmware_loaded && acpi_enabled)
> >
> > then the nodes would not be seen by the OS at all (because
> > "acpi_enabled" is irrelevant for the 32-bit build of ArmVirtQemu, and
> > all the OS can ever get is DT).
>=20
> It's getting tricky and I don't like a bit that we are trying to carter
> 64 bit only UEFI build (or any other build) on QEMU side. Also Peter has
> a valid about guessing on QEMU side (that's usually a source of problem
> in the future).

If the above is correct(with 32-bit variant of UEFI, OS cannot have ACPI bo=
ot),
then do we really have the issue of memory becoming non hot-un-unpluggable?
May be I am missing something.=20

Thanks,
Shameer
=20
> Perhaps we should reconsider and think about marking hotplugbbale RAM
> in DT and let firmware to exclude it from memory map.
>=20
> > Thanks,
> > Laszlo
> >
> > >
> > > Thanks
> > >
> > > Eric
> > >
> > >>
> > >>
> > >> (2) Invent and set an "ignore me, firmware" property for the
> > >> hotpluggable memory nodes in the DT, and update the firmware to hono=
r
> > >> that property.
> > >>
> > >> Thanks
> > >> Laszlo
> > >>
> >


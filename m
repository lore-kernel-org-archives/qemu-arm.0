Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp12512448wrx;
        Wed, 27 Feb 2019 09:52:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZbyY6pmQRwHOyB6oFqSNtMKmvS/+Sc8QaC9dMwRxlCdYLcaTKv1Ykz/7zTDk9AGH84zwZR
X-Received: by 2002:a81:4f90:: with SMTP id d138mr2177967ywb.373.1551289921823;
        Wed, 27 Feb 2019 09:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551289921; cv=none;
        d=google.com; s=arc-20160816;
        b=Q129d+dY1rE8bOWQLzZ258muecIO8IjGZgAaLOFKzvQT/6iYLODPi4Y7Ku5TZ6eTBH
         FHA7zTz3i/1sLmc5O3DFLFYsZ6XN+Uz21hjLVwjCFfOSvELeXOHvbuAaiaBP5HSbA7ES
         DA3YzyOInT9E645c7xN4RquoPFqLwcxrvZ90tu910NllAYkx7/3M8v0lSpJJyroaj82T
         sVCyGph4M2s9JOpSbBCrtAi78cg2mo/+KvXC8DQCvix2x7T/RombbAoYCAFn0+Trbdqw
         ThWEWHyQc97Q5A0COG9yq7JUUattYR2tbHRA0S/tQ2hS7qSo8g8gJhgCsW9S9iVnGugE
         AaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=iT43vV/8uAHMn7FAg00g9i6Mme4+F8hCwy+JaDp9TpQ=;
        b=gtOyJPJml/nxM8fDqM6tlWr1EI5UutGhbwnX/Dsm4Ax4PK3rSTmhGR900rLw/FFPuZ
         papDQGN1Q0b0hv+eQRC+iAzcuzjBgCea+rfoPFb2IDS6icQvmwsg1ZUqbYuK+fQX3XJF
         NLCQfLiGfnZr/GTzUUJss6MY4Dt5Nh6LHLtrcshY55KRIf6qkrix59vB5AXYMKcH4NWo
         24hn18jBBnD4vH7+jqH8upXsf503SLOH+KIiJr2LuuPk+LWtkwcOhTLUguyNeoH5UZmS
         vvkxvuANRa1cUIzgzUJ9bQPtQeHiwv/xNgU/W7b5LHv3uib1/en2zqhkpS5Uwh+f+DlU
         WcuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b72si4340960ywb.133.2019.02.27.09.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 09:52:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gz3NB-00083w-33
	for alex.bennee@linaro.org; Wed, 27 Feb 2019 12:52:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gz3Mt-00080p-Gg
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 12:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gz3Mr-0001Xd-Os
	for qemu-arm@nongnu.org; Wed, 27 Feb 2019 12:51:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gz3Mr-0001Q0-DN; Wed, 27 Feb 2019 12:51:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A4947BDDE;
	Wed, 27 Feb 2019 17:51:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF47684ED;
	Wed, 27 Feb 2019 17:51:24 +0000 (UTC)
Date: Wed, 27 Feb 2019 18:51:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190227185123.314171ae@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8392D6690@lhreml524-mbs.china.huawei.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190222172742.18c3835a@redhat.com>
	<c016024e-9f4b-8953-f492-8802675f7e22@redhat.com>
	<20190225104212.7d40e65e@Igors-MacBook-Pro.local>
	<70249194-349e-37f6-0e8d-dc50b39082b7@redhat.com>
	<cd283485-49a9-ddd1-a020-26110ee093be@redhat.com>
	<20190226175653.6ca2b6c4@Igors-MacBook-Pro.local>
	<c68ba5a2-0d24-c1ad-c2af-c957768abf9f@redhat.com>
	<20190227111025.4bb39cc7@redhat.com>
	<116c5375-0ff4-8f91-ac05-05a53e7fe206@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8392D6690@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 27 Feb 2019 17:51:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM
 expansion and PCDIMM/NVDIMM support
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
	"drjones@redhat.com" <drjones@redhat.com>,
	"david@redhat.com" <david@redhat.com>, Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	Auger Eric <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQy7fEvLfKsf

On Wed, 27 Feb 2019 10:41:45 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Eric,
>=20
> > -----Original Message-----
> > From: Auger Eric [mailto:eric.auger@redhat.com]
> > Sent: 27 February 2019 10:27
> > To: Igor Mammedov <imammedo@redhat.com>
> > Cc: peter.maydell@linaro.org; drjones@redhat.com; david@redhat.com;
> > dgilbert@redhat.com; Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>; qemu-devel@nongnu.org;
> > qemu-arm@nongnu.org; eric.auger.pro@gmail.com;
> > david@gibson.dropbear.id.au
> > Subject: Re: [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM expans=
ion
> > and PCDIMM/NVDIMM support
> >=20
> > Hi Igor, Shameer,
> >=20
> > On 2/27/19 11:10 AM, Igor Mammedov wrote: =20
> > > On Tue, 26 Feb 2019 18:53:24 +0100
> > > Auger Eric <eric.auger@redhat.com> wrote:
> > > =20
> > >> Hi Igor,
> > >>
> > >> On 2/26/19 5:56 PM, Igor Mammedov wrote: =20
> > >>> On Tue, 26 Feb 2019 14:11:58 +0100
> > >>> Auger Eric <eric.auger@redhat.com> wrote:
> > >>> =20
> > >>>> Hi Igor,
> > >>>>
> > >>>> On 2/26/19 9:40 AM, Auger Eric wrote: =20
> > >>>>> Hi Igor,
> > >>>>>
> > >>>>> On 2/25/19 10:42 AM, Igor Mammedov wrote: =20
> > >>>>>> On Fri, 22 Feb 2019 18:35:26 +0100
> > >>>>>> Auger Eric <eric.auger@redhat.com> wrote:
> > >>>>>> =20
> > >>>>>>> Hi Igor,
> > >>>>>>>
> > >>>>>>> On 2/22/19 5:27 PM, Igor Mammedov wrote: =20
> > >>>>>>>> On Wed, 20 Feb 2019 23:39:46 +0100
> > >>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
> > >>>>>>>> =20
> > >>>>>>>>> This series aims to bump the 255GB RAM limit in machvirt and =
to
> > >>>>>>>>> support device memory in general, and especially =20
> > PCDIMM/NVDIMM. =20
> > >>>>>>>>>
> > >>>>>>>>> In machvirt versions < 4.0, the initial RAM starts at 1GB and=
 can
> > >>>>>>>>> grow up to 255GB. From 256GB onwards we find IO regions such =
as =20
> > the =20
> > >>>>>>>>> additional GICv3 RDIST region, high PCIe ECAM region and high=
 =20
> > PCIe =20
> > >>>>>>>>> MMIO region. The address map was 1TB large. This corresponded=
 =20
> > to =20
> > >>>>>>>>> the max IPA capacity KVM was able to manage.
> > >>>>>>>>>
> > >>>>>>>>> Since 4.20, the host kernel is able to support a larger and d=
ynamic
> > >>>>>>>>> IPA range. So the guest physical address can go beyond the 1T=
B. =20
> > The =20
> > >>>>>>>>> max GPA size depends on the host kernel configuration and phy=
sical =20
> > CPUs. =20
> > >>>>>>>>>
> > >>>>>>>>> In this series we use this feature and allow the RAM to grow =
=20
> > without =20
> > >>>>>>>>> any other limit than the one put by the host kernel.
> > >>>>>>>>>
> > >>>>>>>>> The RAM still starts at 1GB. First comes the initial ram (-m)=
 of size
> > >>>>>>>>> ram_size and then comes the device memory (,maxmem) of size
> > >>>>>>>>> maxram_size - ram_size. The device memory is potentially =20
> > hotpluggable =20
> > >>>>>>>>> depending on the instantiated memory objects.
> > >>>>>>>>>
> > >>>>>>>>> IO regions previously located between 256GB and 1TB are moved=
 =20
> > after =20
> > >>>>>>>>> the RAM. Their offset is dynamically computed, depends on =20
> > ram_size =20
> > >>>>>>>>> and maxram_size. Size alignment is enforced.
> > >>>>>>>>>
> > >>>>>>>>> In case maxmem value is inferior to 255GB, the legacy memory =
=20
> > map =20
> > >>>>>>>>> still is used. The change of memory map becomes effective fro=
m 4.0
> > >>>>>>>>> onwards.
> > >>>>>>>>>
> > >>>>>>>>> As we keep the initial RAM at 1GB base address, we do not nee=
d to =20
> > do =20
> > >>>>>>>>> invasive changes in the EDK2 FW. It seems nobody is eager to =
do
> > >>>>>>>>> that job at the moment.
> > >>>>>>>>>
> > >>>>>>>>> Device memory being put just after the initial RAM, it is pos=
sible
> > >>>>>>>>> to get access to this feature while keeping a 1TB address map.
> > >>>>>>>>>
> > >>>>>>>>> This series reuses/rebases patches initially submitted by Sha=
meer
> > >>>>>>>>> in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.
> > >>>>>>>>>
> > >>>>>>>>> Functionally, the series is split into 3 parts:
> > >>>>>>>>> 1) bump of the initial RAM limit [1 - 9] and change in
> > >>>>>>>>>    the memory map =20
> > >>>>>>>> =20
> > >>>>>>>>> 2) Support of PC-DIMM [10 - 13] =20
> > >>>>>>>> Is this part complete ACPI wise (for coldplug)? I haven't noti=
ced
> > >>>>>>>> DSDT AML here no E820 changes, so ACPI wise pc-dimm shouldn't =
be
> > >>>>>>>> visible to the guest. It might be that DT is masking problem
> > >>>>>>>> but well, that won't work on ACPI only guests. =20
> > >>>>>>>
> > >>>>>>> guest /proc/meminfo or "lshw -class memory" reflects the amount=
 of =20
> > mem =20
> > >>>>>>> added with the DIMM slots. =20
> > >>>>>> Question is how does it get there? Does it come from DT or from =
=20
> > firmware =20
> > >>>>>> via UEFI interfaces?
> > >>>>>> =20
> > >>>>>>> So it looks fine to me. Isn't E820 a pure x86 matter? =20
> > >>>>>> sorry for misleading, I've meant is UEFI GetMemoryMap().
> > >>>>>> On x86, I'm wary of adding PC-DIMMs to E802 which then gets expo=
sed
> > >>>>>> via UEFI GetMemoryMap() as guest kernel might start using it as =
=20
> > normal =20
> > >>>>>> memory early at boot and later put that memory into zone normal =
and =20
> > hence =20
> > >>>>>> make it non-hot-un-pluggable. The same concerns apply to DT base=
d =20
> > means =20
> > >>>>>> of discovery.
> > >>>>>> (That's guest issue but it's easy to workaround it not putting =
=20
> > hotpluggable =20
> > >>>>>> memory into UEFI GetMemoryMap() or DT and let DSDT describe it =
=20
> > properly) =20
> > >>>>>> That way memory doesn't get (ab)used by firmware or early boot =
=20
> > kernel stages =20
> > >>>>>> and doesn't get locked up.
> > >>>>>> =20
> > >>>>>>> What else would you expect in the dsdt? =20
> > >>>>>> Memory device descriptions, look for code that adds PNP0C80 with=
 =20
> > _CRS =20
> > >>>>>> describing memory ranges =20
> > >>>>>
> > >>>>> OK thank you for the explanations. I will work on PNP0C80 additio=
n then.
> > >>>>> Does it mean that in ACPI mode we must not output DT hotplug memo=
ry
> > >>>>> nodes or assuming that PNP0C80 is properly described, it will "ov=
erride"
> > >>>>> DT description? =20
> > >>>>
> > >>>> After further investigations, I think the pieces you pointed out a=
re
> > >>>> added by Shameer's series, ie. through the build_memory_hotplug_am=
l()
> > >>>> call. So I suggest we separate the concerns: this series brings su=
pport
> > >>>> for DIMM coldplug. hotplug, including all the relevant ACPI struct=
ures
> > >>>> will be added later on by Shameer. =20
> > >>>
> > >>> Maybe we should not put pc-dimms in DT for this series until it get=
s clear
> > >>> if it doesn't conflict with ACPI in some way. =20
> > >>
> > >> I guess you mean removing the DT hotpluggable memory nodes only in A=
CPI
> > >> mode? Otherwise you simply remove the DIMM feature, right? =20
> > > Something like this so DT won't get in conflict with ACPI.
> > > Only we don't have a switch for it something like, -machine fdt=3Don =
(with =20
> > default off) =20
> > > =20
> > >> I double checked and if you remove the hotpluggable memory DT nodes =
in
> > >> ACPI mode:
> > >> - you do not see the PCDIMM slots in guest /proc/meminfo anymore. So=
 I
> > >> guess you're right, if the DT nodes are available, that memory is
> > >> considered as not unpluggable by the guest.
> > >> - You can see the NVDIMM slots using ndctl list -u. You can mount a =
DAX
> > >> system.
> > >>
> > >> Hotplug/unplug is clearly not supported by this series and any attem=
pt
> > >> results in "memory hotplug is not supported". Is it really an issue =
if
> > >> the guest does not consider DIMM slots as not hot-unpluggable memory=
? I
> > >> am not even sure the guest kernel would support to unplug that memor=
y.
> > >>
> > >> In case we want all ACPI tables to be ready for making this memory s=
een
> > >> as hot-unpluggable we need some Shameer's patches on top of this ser=
ies. =20
> > > May be we should push for this way (into 4.0), it's just a several pa=
tches
> > > after all or even merge them in your series (I'd guess it would need =
to be
> > > rebased on top of your latest work) =20
> >=20
> > Shameer, would you agree if we merge PATCH 1 of your RFC hotplug series
> > (without the reduced hw_reduced_acpi flag) in this series and isolate in
> > a second PATCH the acpi_memory_hotplug_init() + build_memory_hotplug_aml
> > called in virt code? =20
probably we can do it as transitional step as we need working mmio interface
in place for build_memory_hotplug_aml() to work, provided it won't create
migration issues (do we need VMSTATE_MEMORY_HOTPLUG for cold-plug case?).

What about dummy initial GED (empty device), that manages mmio region only
and then later it will be filled with remaining logic IRQ. In this case mmi=
o region
and vmstate won't change (maybe) so it won't cause ABI or migration issues.


> Sure, that=E2=80=99s fine with me. So what would you use for the event_ha=
ndler_method in
> build_memory_hotplug_aml()? GPO0 device?

a method name not defined in spec, so it won't be called might do.


>=20
> Thanks,
> Shameer
>=20
> > Then would remain the GED/GPIO actual integration.
> >=20
> > Thanks
> >=20
> > Eric =20
> > > =20
> > >> Also don't DIMM slots already make sense in DT mode. Usually we acce=
pt
> > >> to add one feature in DT and then in ACPI. For instance we can benef=
it =20
> > > usually it doesn't conflict with each other (at least I'm not aware o=
f it)
> > > but I see a problem with in this case.
> > > =20
> > >> from nvdimm in dt mode right? So, considering an incremental approac=
h I
> > >> would be in favour of keeping the DT nodes. =20
> > > I'd guess it is the same as for DIMMs, ACPI support for NVDIMMs is mu=
ch
> > > more versatile.
> > >
> > > I consider target application of arm/virt as a board that's used to
> > > run in production generic ACPI capable guest in most use cases and
> > > various DT only guests as secondary ones. It's hard to make
> > > both usecases be happy with defaults (that's probably  one of the
> > > reasons why 'sbsa' board is being added).
> > >
> > > So I'd give priority to ACPI based arm/virt versus DT when defaults a=
re
> > > considered.
> > > =20
> > >> Thanks
> > >>
> > >> Eric =20
> > >>>
> > >>>
> > >>>
> > >>> =20
> > > =20


Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp290919wrx;
        Wed, 27 Feb 2019 23:50:24 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZHe5550z9W4thVtmoTrh/oyYS2di6T0deie4T4uVvU10bXQCBX+X3/JzgaZKIvDueO4d7o
X-Received: by 2002:a81:28ca:: with SMTP id o193mr4441690ywo.127.1551340223913;
        Wed, 27 Feb 2019 23:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551340223; cv=none;
        d=google.com; s=arc-20160816;
        b=exwva0GCJHMHcOFV3FkSZpFSE1IJQZ9XW2h+Xo5HoZr3TgBwAxZbDTakqOXYf3L43z
         lFeCCqB9/QcnYPZM109po7/km9IT9p1myU09anWzYBjvwpgQHxCuSFDObllBeAAsdFPo
         6H9DkGOL8AbZSuKUklAUANOOvt7dd1dAu7TjyRH9gLL3T3YYewq8D+bKRhDMcfrWMPFW
         RxgPpsXZR3SFx019B7n3n/4XtyOak3b2pAJWGC6weB0AmurYgmzH28PUd40dPPTkbk1r
         CkeAALZeetP9UZqgdvqpDzm+ayAYk1wDEb09Z9o9j5xDzHM48kujHPI1QYS45IMVH7Vd
         gRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=9uOmXX6EQjxLlng5zDIO5+iF4AO4UiWPWp5ZtRzaXtA=;
        b=zZVVmsg/uSVO46Blj7R84s0KXF+XOAyCkIWYOvTOWgNQQurpqmYrWwdxqcMYi33ONe
         2jgPMBz+Fq/a+GTcmfqfdn+d/wnvVlTx09pW8fI9Eh1dD7pi3aZQsIqtwNCmiZbF0Jyn
         1OmPweO88NwbN6ejkxflgZPdIGpzCzr3lYbdfVsPeRnDNHNnwuA/Jv2GflBezjwn8jkQ
         UVKRPbYter59z6+hFJ5b+537Q+8HboNqI6NbAh7ayBBKG2C7RSx2IeWZQfvI3TM+J8mV
         EIbNUXKhvdMplDIAGUqxVHR75zYo99cz9GllWDAYUfRyMTNvY5BlRtWUa17bnR7fbo4L
         9ZxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a81si10176790ywh.438.2019.02.27.23.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 23:50:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzGSV-0000zG-DG
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 02:50:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzGQm-00005t-LI
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 02:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzGQk-0007ON-EK
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 02:48:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzGQi-0007IU-PM; Thu, 28 Feb 2019 02:48:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5962230B4A47;
	Thu, 28 Feb 2019 07:48:25 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D45A619D5;
	Thu, 28 Feb 2019 07:48:20 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
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
	<20190227185123.314171ae@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f9518e2d-0e46-d25f-f9f5-809b21f744aa@redhat.com>
Date: Thu, 28 Feb 2019 08:48:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190227185123.314171ae@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 28 Feb 2019 07:48:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	"david@redhat.com" <david@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WzSK23sjl7XX

Hi Igor, Shameer,

On 2/27/19 6:51 PM, Igor Mammedov wrote:
> On Wed, 27 Feb 2019 10:41:45 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
>> Hi Eric,
>>
>>> -----Original Message-----
>>> From: Auger Eric [mailto:eric.auger@redhat.com]
>>> Sent: 27 February 2019 10:27
>>> To: Igor Mammedov <imammedo@redhat.com>
>>> Cc: peter.maydell@linaro.org; drjones@redhat.com; david@redhat.com;
>>> dgilbert@redhat.com; Shameerali Kolothum Thodi
>>> <shameerali.kolothum.thodi@huawei.com>; qemu-devel@nongnu.org;
>>> qemu-arm@nongnu.org; eric.auger.pro@gmail.com;
>>> david@gibson.dropbear.id.au
>>> Subject: Re: [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM expa=
nsion
>>> and PCDIMM/NVDIMM support
>>>
>>> Hi Igor, Shameer,
>>>
>>> On 2/27/19 11:10 AM, Igor Mammedov wrote: =20
>>>> On Tue, 26 Feb 2019 18:53:24 +0100
>>>> Auger Eric <eric.auger@redhat.com> wrote:
>>>> =20
>>>>> Hi Igor,
>>>>>
>>>>> On 2/26/19 5:56 PM, Igor Mammedov wrote: =20
>>>>>> On Tue, 26 Feb 2019 14:11:58 +0100
>>>>>> Auger Eric <eric.auger@redhat.com> wrote:
>>>>>> =20
>>>>>>> Hi Igor,
>>>>>>>
>>>>>>> On 2/26/19 9:40 AM, Auger Eric wrote: =20
>>>>>>>> Hi Igor,
>>>>>>>>
>>>>>>>> On 2/25/19 10:42 AM, Igor Mammedov wrote: =20
>>>>>>>>> On Fri, 22 Feb 2019 18:35:26 +0100
>>>>>>>>> Auger Eric <eric.auger@redhat.com> wrote:
>>>>>>>>> =20
>>>>>>>>>> Hi Igor,
>>>>>>>>>>
>>>>>>>>>> On 2/22/19 5:27 PM, Igor Mammedov wrote: =20
>>>>>>>>>>> On Wed, 20 Feb 2019 23:39:46 +0100
>>>>>>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>>>>>> =20
>>>>>>>>>>>> This series aims to bump the 255GB RAM limit in machvirt and=
 to
>>>>>>>>>>>> support device memory in general, and especially =20
>>> PCDIMM/NVDIMM. =20
>>>>>>>>>>>>
>>>>>>>>>>>> In machvirt versions < 4.0, the initial RAM starts at 1GB an=
d can
>>>>>>>>>>>> grow up to 255GB. From 256GB onwards we find IO regions such=
 as =20
>>> the =20
>>>>>>>>>>>> additional GICv3 RDIST region, high PCIe ECAM region and hig=
h =20
>>> PCIe =20
>>>>>>>>>>>> MMIO region. The address map was 1TB large. This corresponde=
d =20
>>> to =20
>>>>>>>>>>>> the max IPA capacity KVM was able to manage.
>>>>>>>>>>>>
>>>>>>>>>>>> Since 4.20, the host kernel is able to support a larger and =
dynamic
>>>>>>>>>>>> IPA range. So the guest physical address can go beyond the 1=
TB. =20
>>> The =20
>>>>>>>>>>>> max GPA size depends on the host kernel configuration and ph=
ysical =20
>>> CPUs. =20
>>>>>>>>>>>>
>>>>>>>>>>>> In this series we use this feature and allow the RAM to grow=
 =20
>>> without =20
>>>>>>>>>>>> any other limit than the one put by the host kernel.
>>>>>>>>>>>>
>>>>>>>>>>>> The RAM still starts at 1GB. First comes the initial ram (-m=
) of size
>>>>>>>>>>>> ram_size and then comes the device memory (,maxmem) of size
>>>>>>>>>>>> maxram_size - ram_size. The device memory is potentially =20
>>> hotpluggable =20
>>>>>>>>>>>> depending on the instantiated memory objects.
>>>>>>>>>>>>
>>>>>>>>>>>> IO regions previously located between 256GB and 1TB are move=
d =20
>>> after =20
>>>>>>>>>>>> the RAM. Their offset is dynamically computed, depends on =20
>>> ram_size =20
>>>>>>>>>>>> and maxram_size. Size alignment is enforced.
>>>>>>>>>>>>
>>>>>>>>>>>> In case maxmem value is inferior to 255GB, the legacy memory=
 =20
>>> map =20
>>>>>>>>>>>> still is used. The change of memory map becomes effective fr=
om 4.0
>>>>>>>>>>>> onwards.
>>>>>>>>>>>>
>>>>>>>>>>>> As we keep the initial RAM at 1GB base address, we do not ne=
ed to =20
>>> do =20
>>>>>>>>>>>> invasive changes in the EDK2 FW. It seems nobody is eager to=
 do
>>>>>>>>>>>> that job at the moment.
>>>>>>>>>>>>
>>>>>>>>>>>> Device memory being put just after the initial RAM, it is po=
ssible
>>>>>>>>>>>> to get access to this feature while keeping a 1TB address ma=
p.
>>>>>>>>>>>>
>>>>>>>>>>>> This series reuses/rebases patches initially submitted by Sh=
ameer
>>>>>>>>>>>> in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts=
.
>>>>>>>>>>>>
>>>>>>>>>>>> Functionally, the series is split into 3 parts:
>>>>>>>>>>>> 1) bump of the initial RAM limit [1 - 9] and change in
>>>>>>>>>>>>    the memory map =20
>>>>>>>>>>> =20
>>>>>>>>>>>> 2) Support of PC-DIMM [10 - 13] =20
>>>>>>>>>>> Is this part complete ACPI wise (for coldplug)? I haven't not=
iced
>>>>>>>>>>> DSDT AML here no E820 changes, so ACPI wise pc-dimm shouldn't=
 be
>>>>>>>>>>> visible to the guest. It might be that DT is masking problem
>>>>>>>>>>> but well, that won't work on ACPI only guests. =20
>>>>>>>>>>
>>>>>>>>>> guest /proc/meminfo or "lshw -class memory" reflects the amoun=
t of =20
>>> mem =20
>>>>>>>>>> added with the DIMM slots. =20
>>>>>>>>> Question is how does it get there? Does it come from DT or from=
 =20
>>> firmware =20
>>>>>>>>> via UEFI interfaces?
>>>>>>>>> =20
>>>>>>>>>> So it looks fine to me. Isn't E820 a pure x86 matter? =20
>>>>>>>>> sorry for misleading, I've meant is UEFI GetMemoryMap().
>>>>>>>>> On x86, I'm wary of adding PC-DIMMs to E802 which then gets exp=
osed
>>>>>>>>> via UEFI GetMemoryMap() as guest kernel might start using it as=
 =20
>>> normal =20
>>>>>>>>> memory early at boot and later put that memory into zone normal=
 and =20
>>> hence =20
>>>>>>>>> make it non-hot-un-pluggable. The same concerns apply to DT bas=
ed =20
>>> means =20
>>>>>>>>> of discovery.
>>>>>>>>> (That's guest issue but it's easy to workaround it not putting =
=20
>>> hotpluggable =20
>>>>>>>>> memory into UEFI GetMemoryMap() or DT and let DSDT describe it =
=20
>>> properly) =20
>>>>>>>>> That way memory doesn't get (ab)used by firmware or early boot =
=20
>>> kernel stages =20
>>>>>>>>> and doesn't get locked up.
>>>>>>>>> =20
>>>>>>>>>> What else would you expect in the dsdt? =20
>>>>>>>>> Memory device descriptions, look for code that adds PNP0C80 wit=
h =20
>>> _CRS =20
>>>>>>>>> describing memory ranges =20
>>>>>>>>
>>>>>>>> OK thank you for the explanations. I will work on PNP0C80 additi=
on then.
>>>>>>>> Does it mean that in ACPI mode we must not output DT hotplug mem=
ory
>>>>>>>> nodes or assuming that PNP0C80 is properly described, it will "o=
verride"
>>>>>>>> DT description? =20
>>>>>>>
>>>>>>> After further investigations, I think the pieces you pointed out =
are
>>>>>>> added by Shameer's series, ie. through the build_memory_hotplug_a=
ml()
>>>>>>> call. So I suggest we separate the concerns: this series brings s=
upport
>>>>>>> for DIMM coldplug. hotplug, including all the relevant ACPI struc=
tures
>>>>>>> will be added later on by Shameer. =20
>>>>>>
>>>>>> Maybe we should not put pc-dimms in DT for this series until it ge=
ts clear
>>>>>> if it doesn't conflict with ACPI in some way. =20
>>>>>
>>>>> I guess you mean removing the DT hotpluggable memory nodes only in =
ACPI
>>>>> mode? Otherwise you simply remove the DIMM feature, right? =20
>>>> Something like this so DT won't get in conflict with ACPI.
>>>> Only we don't have a switch for it something like, -machine fdt=3Don=
 (with =20
>>> default off) =20
>>>> =20
>>>>> I double checked and if you remove the hotpluggable memory DT nodes=
 in
>>>>> ACPI mode:
>>>>> - you do not see the PCDIMM slots in guest /proc/meminfo anymore. S=
o I
>>>>> guess you're right, if the DT nodes are available, that memory is
>>>>> considered as not unpluggable by the guest.
>>>>> - You can see the NVDIMM slots using ndctl list -u. You can mount a=
 DAX
>>>>> system.
>>>>>
>>>>> Hotplug/unplug is clearly not supported by this series and any atte=
mpt
>>>>> results in "memory hotplug is not supported". Is it really an issue=
 if
>>>>> the guest does not consider DIMM slots as not hot-unpluggable memor=
y? I
>>>>> am not even sure the guest kernel would support to unplug that memo=
ry.
>>>>>
>>>>> In case we want all ACPI tables to be ready for making this memory =
seen
>>>>> as hot-unpluggable we need some Shameer's patches on top of this se=
ries. =20
>>>> May be we should push for this way (into 4.0), it's just a several p=
atches
>>>> after all or even merge them in your series (I'd guess it would need=
 to be
>>>> rebased on top of your latest work) =20
>>>
>>> Shameer, would you agree if we merge PATCH 1 of your RFC hotplug seri=
es
>>> (without the reduced hw_reduced_acpi flag) in this series and isolate=
 in
>>> a second PATCH the acpi_memory_hotplug_init() + build_memory_hotplug_=
aml
>>> called in virt code? =20
> probably we can do it as transitional step as we need working mmio inte=
rface
> in place for build_memory_hotplug_aml() to work, provided it won't crea=
te
> migration issues (do we need VMSTATE_MEMORY_HOTPLUG for cold-plug case?=
).
>=20
> What about dummy initial GED (empty device), that manages mmio region o=
nly
> and then later it will be filled with remaining logic IRQ. In this case=
 mmio region
> and vmstate won't change (maybe) so it won't cause ABI or migration iss=
ues.


>=20
>=20
>> Sure, that=E2=80=99s fine with me. So what would you use for the event=
_handler_method in
>> build_memory_hotplug_aml()? GPO0 device?
>=20
> a method name not defined in spec, so it won't be called might do.

At this point the event_handler_method, ie. \_SB.GPO0._E02, is not
supposed to be called, right? So effectivily we should be able to use
any other method name (unlinked to any GPIO/GED). I guess at this stage
only the PNP0C80 definition blocks + methods are used.

What still remains fuzzy for me is in case of cold plug the mmio hotplug
control region part only is read (despite the slot selection of course)
and returns 0 for addr/size and also flags meaning the slot is not
enabled. So despite the slots are advertised as hotpluggable/enabled in
the SRAT; I am not sure for the OS it actually makes any difference
whether the DSDT definition blocks are described or not.

To be honest I am afraid this is too late to add those additional
features for 4.0 now. This is going to jeopardize the first preliminary
part which is the introduction of the new memory map, allowing the
expansion of the initial RAM and paving the way for device memory
introduction. So I think I am going to resend the first 10 patches in a
standalone series. And we can iterate on the PCDIMM/NVDIMM parts
independently.

Thanks

Eric
>=20
>=20
>>
>> Thanks,
>> Shameer
>>
>>> Then would remain the GED/GPIO actual integration.
>>>
>>> Thanks
>>>
>>> Eric =20
>>>> =20
>>>>> Also don't DIMM slots already make sense in DT mode. Usually we acc=
ept
>>>>> to add one feature in DT and then in ACPI. For instance we can bene=
fit =20
>>>> usually it doesn't conflict with each other (at least I'm not aware =
of it)
>>>> but I see a problem with in this case.
>>>> =20
>>>>> from nvdimm in dt mode right? So, considering an incremental approa=
ch I
>>>>> would be in favour of keeping the DT nodes. =20
>>>> I'd guess it is the same as for DIMMs, ACPI support for NVDIMMs is m=
uch
>>>> more versatile.
>>>>
>>>> I consider target application of arm/virt as a board that's used to
>>>> run in production generic ACPI capable guest in most use cases and
>>>> various DT only guests as secondary ones. It's hard to make
>>>> both usecases be happy with defaults (that's probably  one of the
>>>> reasons why 'sbsa' board is being added).
>>>>
>>>> So I'd give priority to ACPI based arm/virt versus DT when defaults =
are
>>>> considered.
>>>> =20
>>>>> Thanks
>>>>>
>>>>> Eric =20
>>>>>>
>>>>>>
>>>>>>
>>>>>> =20
>>>> =20
>=20
>=20

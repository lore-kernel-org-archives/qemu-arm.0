Received: by 10.223.197.9 with SMTP id q9csp477736wrf;
        Fri, 13 Oct 2017 00:44:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC0ZDcQ0mSW9cjACgIE7BydBZKxrQaPmSayPUr3rTnfwUNll2LXQYLoGnEx8/nrEnx9S1Nm
X-Received: by 10.200.46.132 with SMTP id h4mr798736qta.88.1507880660897;
        Fri, 13 Oct 2017 00:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507880660; cv=none;
        d=google.com; s=arc-20160816;
        b=ApzSVVQxyrwPQXrTA2uhlPOni2SKYaY8jgISMU7/PTxLm6VK48RYI0Mdvk9RFoxCA9
         yg21pXCs7bxwlKJPhSVsmL0xot3RBzYrlumwNak6mzv+9nrvbTAkVTZq5OwUuVZCTeu+
         QuCc52hPbOiwkqdup5BXt8X9TsmYirblubowatZ6aUr9AEU6a4xhxXfxm1boEF6Qkzt0
         V3KBnWXoxaT/o6sOpMpVHsBThtWnP8Y4zz/ia+srX9EtPY2EiqAVT1JQKA69IK7z2vrD
         n8/8EYFkVoCU4nfD61MQ5qKvQz7MyWgdbi73P3zmx8QgARoNoCenjfcCEwP6p1PnM3lQ
         Vgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=XdseiboXda6P3anSBRNYVcNl54lZ2093HhM/9duLhrc=;
        b=e+lxofldTJ1xIEZXJpDy78hD4VB9ztdSLj7Xc+WGvI8IPq4Oth8iQL+17dwiQlaD5Q
         WGr09ESK/mxrmZwmbOmLOp/FIu1Z76fPUHVnFiyxBABxFQK0LASK/0qsxQX8k972aLY8
         8DI1YQdBW6y9ZlzOT9FnRTKJPsVJQKEfL7nIu71l11ZhaG+ipRkna5aIQD4AiJCuSod0
         +4WPlNCYz5/ZjHZnMP5UiOz1x4YcjQIrzVo/3OSfv2I8V/quu9gbfeFHZF/b9SLq82Se
         ktszCW3WkSBVDSvL7pwE2C8z3OjtSQsleMs7TcAoK8+P+IujllafOUdHCRV6jO+vyBWD
         WijQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o70si305345qki.353.2017.10.13.00.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Oct 2017 00:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2udm-0002mj-Km
	for alex.bennee@linaro.org; Fri, 13 Oct 2017 03:44:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2udf-0002mT-5U
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 03:44:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2udc-000820-2k
	for qemu-arm@nongnu.org; Fri, 13 Oct 2017 03:44:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e2udb-00081a-Q9; Fri, 13 Oct 2017 03:44:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AFC17AEA3;
	Fri, 13 Oct 2017 07:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7AFC17AEA3
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-172.ams2.redhat.com
	[10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAEE05D6A4;
	Fri, 13 Oct 2017 07:43:53 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
	<f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
	<CAFEAcA_2RaRsvm_=V4iDNk_vMOtiWUZs3-SdMh+DSYqGyPE0PQ@mail.gmail.com>
	<08ce288c-610c-4dea-927d-262e7b75051f@redhat.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D190E139B0@SHSMSX151.ccr.corp.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4ce3a29a-6105-88ef-8b90-75658285dd78@redhat.com>
Date: Fri, 13 Oct 2017 09:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D190E139B0@SHSMSX151.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 13 Oct 2017 07:44:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: Andrew Jones <drjones@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, Will Deacon <will.deacon@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o5qvL3PUIHBm

Hi Kevin,

On 13/10/2017 09:01, Tian, Kevin wrote:
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: Thursday, October 12, 2017 6:10 PM
>>
>> Hi Peter,
>>
>> On 12/10/2017 11:54, Peter Maydell wrote:
>>> On 11 October 2017 at 17:08, Auger Eric <eric.auger@redhat.com> wrote=
:
>>>> Hi Peter,
>>>>
>>>> On 11/10/2017 16:56, Peter Maydell wrote:
>>>>> On 19 September 2017 at 08:46, Eric Auger <eric.auger@redhat.com>
>> wrote:
>>>>>> This series implements the virtio-iommu device.
>>>>>>
>>>>>> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0=
.
>>>>>> - probe request support although no reserved region is returned at
>>>>>>   the moment
>>>>>> - unmap semantics less strict, as specified in v0.4
>>>>>> - device registration, attach/detach revisited
>>>>>> - split into smaller patches to ease review
>>>>>> - propose a way to inform the IOMMU mr about the page_size_mask
>>>>>>   of underlying HW IOMMU, if any
>>>>>> - remove warning associated with the translation of the MSI doorbe=
ll
>>>>>>
>>>>>> The device gets instantiated using the "-device virtio-iommu-devic=
e"
>>>>>> option. It currently works with ARM virt machine only, as the mach=
ine
>>>>>> must handle the dt binding between the virtio-mmio "iommu" node
>> and
>>>>>> the PCI host bridge node.
>>>>>
>>>>> Could this work on x86, or is it inherently arm-only?
>>>>
>>>> Yes this is the goal. At the moment the ACPI probing is not yet prop=
erly
>>>> specified but a Q35 prototype was developed in the Red Hat Virt team=
.
>>>> This will be presented at the KVM forum.
>>>
>>> Since I have very little familiarity with virtio or iommu code,
>>> I'd be much happier if this was reviewed as a generic virtio-iommu
>>> by the x86/virtio devs and then the arm specific parts done second...
>>
>> Understood. I was rather expecting you to review the smmuv3 emulation
>> code which you did, in a comprehensive manner ;-), and many thanks for
>> that.
>>
>> Note sure this is time yet to get this RFC reviewed as
>> - the v0.4 virtio-iommu driver it relies on was not officially submitt=
ed,
>> - the virtio-iommu specification review has not really been reviewed,
>> - the ACPI probing method has not been discussed yet.
>>
>> Jean-Philippe, please correct me if I am wrong.
>>
>> So to me, this is pure RFC at the moment.
>>>
>>> I'm also not clear on what we're expecting the recommended or normal
>>> way to do device passthrough is going to be -- this virtio-mmio,
>>> or presenting the guest with an SMMUv3 interface? Do we really
>>> need to implement both ?
>>
>> I think the KVM forum is the right place to sync as both approaches wi=
ll
>> be presented and some pros/cons + performance figures will be given.
>>
>> As we talk about choosing, there is one alternative that was suggested
>> on the ML by Alex & Michael but never really get considered yet and
>> maybe should be: using intel iommu emulation code for ARM. I
>> aknowledge
>> this deserves a thorough impact study on kernel and FW side but I woul=
d
>> be happy to get your opinion about the QEMU side. Would you have a by-
>> principle rejection of this idea to instantiate such an Intel device i=
n
>> mach virt or would it be something you would be ready to consider?
>>
>=20
> bear posting a link to Alex/Michael's comment? interesting to know
> the rationale...

This was suggested here for instance:

https://lkml.org/lkml/2017/7/12/579

I think rationale was
- this is an emulated platform so there is more freedom
- vtd emulation code is rather stable
- it has pieces missing on smmu: cachine mode, IOTLB invalidation
command with addr_mask,
- intel iommu driver implements deferred IOTLB Invalidation which boosts
perf

But problems I foresee are:
- MSI handling. ARM MSI doorbells can be anywhere in the GPA address
space whereas Intel has MSIs within the APIC window: [FEE0_0000h =E2=80=93
FEF0_000h]. So I suspect the MSI handling may not work at kernel level.
- intel IOMMU input/output address ranges and page sizes may be
different from ARM ones.
- ARM uses ACPI IORT for binding RC <-> IOMMU <-> MSI controller whereas
Intel uses other tables
- Intel's dmar kernel code must be compiled/enabled on ARM

So personally I don't think this solution is viable but I prefer this
gets discussed on the ML.

Thanks

Eric
>=20
> Thanks
> Kevin
>=20

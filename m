Received: by 10.25.27.66 with SMTP id b63csp2063083lfb;
        Tue, 7 Jun 2016 08:17:14 -0700 (PDT)
X-Received: by 10.140.194.73 with SMTP id p70mr21785446qha.78.1465312634329;
        Tue, 07 Jun 2016 08:17:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z128si15374921qhc.114.2016.06.07.08.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 08:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50898 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAIkj-000872-NL
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 11:17:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bABuW-0008KD-3i
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 03:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bABuR-0006wC-T3
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 03:58:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bABuR-0006vb-O1; Tue, 07 Jun 2016 03:58:47 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 601353DD47;
	Tue,  7 Jun 2016 07:58:46 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-56.ams2.redhat.com [10.36.5.56])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u577wfmS017004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Jun 2016 03:58:43 -0400
To: Alexander Graf <agraf@suse.de>, Peter Maydell <peter.maydell@linaro.org>, 
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3110383c-909d-92de-333b-89b687dcacac@redhat.com>
Date: Tue, 7 Jun 2016 09:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <9d7c8c4e-1445-87d8-f367-8b3773c38365@suse.de>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 Jun 2016 07:58:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Tue, 07 Jun 2016 11:17:11 -0400
Subject: Re: [Qemu-arm] [PATCH 2/2] arm/virt: Mark pcie controller node as
 dma-coherent
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
Cc: Eric Auger <eric.auger@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lBZjleg4AaGM

Hi,
Le 02/06/2016 =C3=A0 14:45, Alexander Graf a =C3=A9crit :
>=20
>=20
> On 02.06.16 14:32, Peter Maydell wrote:
>> On 2 June 2016 at 13:26, Bogdan Purcareata <bogdan.purcareata@nxp.com>=
 wrote:
>>> A PCI device is marked either as coherent or non-coherent based on th=
e pcie
>>> controller "dma-coherent" property. This is further used when configu=
ring the
>>> IOMMU ops for the device DMA resources (e.g. descriptor rings, for e1=
000e).
>>>
>>> This dma-coherent property needs to be configured in the guest enviro=
nment,
>>> in case there's a directly assigned VFIO PCI device. Since the guest =
only
>>> receives one emulated pcie controller bus - regardless of the host
>>> configuration - add this property if there's at least one host pcie h=
ost
>>> controller that is DMA coherent (this implies that the host interconn=
ect
>>> is coherent as well).
>>
>> This patch seems to change the property of the emulated PCIe controlle=
r
>> based on the host PCIe controller even if we're not doing any PCIe
>> passthrough at all. That seems definitely wrong to me.
>>
>> (Should the purely-emulated case be marked DMA-coherent anyway?
>> I forget the fiddly details...)
>=20
> I do too, let's involve a few people who know :). Not exposing it as
> coherent is definitely wrong, but whether "dma-coherent" is the right
> choice I don't know.

For information, on AMD overdrive the PCI host controller is marked as
dma-coherent too but I do not observe any issue with 82574L (e1000e)
and it worked fine as well on X540T1 Intel NIC. I just tested with
e1000e and dma-coherent guest PCI controller and works fine too. Don't
have x540t1 anymore so can't test with that PCIe CARD.

With Intel I35OT1 and guest non dma-coherent PCIe controller I cope with
some issues when assigning the PF but I don't know yet if there is any
relationship.

Best Regards

Eric
>=20
>=20
> Alex
>=20

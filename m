Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1875990wrs;
        Thu, 29 Aug 2019 02:21:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxs2eFxSgx7jzKjYVO3c9C1vAeQPVlQjw/1K8dClABmwfIO2bxfbUiLl28QlBX9us1EqI0O
X-Received: by 2002:a50:89d4:: with SMTP id h20mr8542225edh.248.1567070497611;
        Thu, 29 Aug 2019 02:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567070497; cv=none;
        d=google.com; s=arc-20160816;
        b=OF55nKULcoq2vZV6wJiHhj6KdyDCOM4xNyMdCgmpSgtNe5zeIFYkAtjIEAIHvn3goK
         dsoq3UsgNoMxdGNC6bY6DC8/jpM/BcsNSO204tuAyUGD+6bh01Dtd+SXimjiErJF3A1C
         y8etaWH4Y5TalpTvCWR73WAd5AHdPpzhLp1RBkRQtPlg/By2FemqA+M1WpStthDVyjXJ
         GHlAhom1bl4e2TlSUk9Ywz6t9ndRf2j9kdzqa52IlNoc4L2I75wfSUtLKRnOT1SO+4zI
         mCVu/FBm30EKswc53oZeqKusHGsuRZqU88RMoPn7L5Qb8MCnFQgBVUWM/zdXscE/dy/x
         wOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=BNRmv/eqgcM0lvAbNTh0eok6Nt3lNiA1wISs4InPegM=;
        b=MkOpe2nDHPslBwedHFbqqrGI46Sx1rwCBqupsRyaqqUcCY57hrDV6/JyufhtpdgRMv
         YN4MqPV+R73OKtw76eMquTvs8UDMhBjhpZzEiKoL6jmCUKsKo2Ew3clxiVmMVCJog/Es
         xEYNzizmr67DL33I7kq+wG19YCdt9alGQTBI9lJOQJT+YFQEy3TSJVa4VQt7oPjMGzi1
         K8nDJJSjEd/uBkjtaUBbfHV47Tskji1iTbNG6WRlEWSswxXn8Cxy5texlfLYMLV1aZSZ
         r1S8xm/B6y/E54vO/QGbUN2EtECPcV1opsTTiTz6ZQ8/sNzv0KhLO7183NQj2kjFtu9K
         PFew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si786730ejm.349.2019.08.29.02.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 02:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3Gca-0002Vg-LG
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 05:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3GcB-0002Uc-Ho
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 05:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3Gc9-0002oe-WE
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 05:21:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3Gc9-0002oC-NJ; Thu, 29 Aug 2019 05:21:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D309510C696E;
 Thu, 29 Aug 2019 09:21:08 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF435D713;
 Thu, 29 Aug 2019 09:21:06 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-3-eric.auger@redhat.com>
 <29520007-f3fd-ed8d-f52b-2839f991556a@huawei.com>
 <0dd3bc89-8f91-0f8e-8908-18712240a115@redhat.com>
Message-ID: <bfe436fd-89e4-c157-23c9-8e75953bb572@redhat.com>
Date: Thu, 29 Aug 2019 11:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0dd3bc89-8f91-0f8e-8908-18712240a115@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 29 Aug 2019 09:21:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 2/3] intc/arm_gic: Support PPI
 injection for more than 256 vpus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pNfFpl0S/1lE

Hi,
On 8/29/19 9:58 AM, Auger Eric wrote:
> Hi Zenghui,
>=20
> On 8/29/19 4:53 AM, Zenghui Yu wrote:
>> Hi Eric,
>>
>> On 2019/8/28 0:05, Eric Auger wrote:
>>> Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
>>> allow injection of PPIs along with vcpu ids larger than 255. Let's
>>> encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
>>> ABI when needed.
>>>
>>> Without that patch qemu exits with "kvm_set_irq: Invalid argument"
>>> message.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
>>> ---
>>> =C2=A0 hw/intc/arm_gic_kvm.c | 10 +++++++---
>>> =C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
>>> index b56fda144f..889293e97f 100644
>>> --- a/hw/intc/arm_gic_kvm.c
>>> +++ b/hw/intc/arm_gic_kvm.c
>>> @@ -56,6 +56,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq,
>>> int level)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * CPU number and interrupt numbe=
r.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int kvm_irq, irqtype, cpu;
>>> +=C2=A0=C2=A0=C2=A0 int cpu_idx1 =3D 0, cpu_idx2 =3D 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irq < (num_irq - GIC_INTERN=
AL)) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* External in=
terrupt. The kernel numbers these like the GIC
>>> @@ -63,17 +64,20 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int
>>> irq, int level)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * intern=
al ones.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqtype =3D KV=
M_ARM_IRQ_TYPE_SPI;
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq +=3D GIC_I=
NTERNAL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Internal in=
terrupt: decode into (cpu, interrupt id) */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqtype =3D KV=
M_ARM_IRQ_TYPE_PPI;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq -=3D (num_=
irq - GIC_INTERNAL);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu =3D irq / =
GIC_INTERNAL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_idx2 =3D cpu / 256;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_idx1 =3D cpu % 256;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq %=3D GIC_I=
NTERNAL;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | (cpu << KVM_ARM_IRQ_VCP=
U_SHIFT) | irq;
>>> +=C2=A0=C2=A0=C2=A0 kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((cpu_idx2 & KVM_ARM_IRQ_VCPU2_MASK) <<
>>> KVM_ARM_IRQ_VCPU2_SHIFT) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 irq;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_set_irq(kvm_state, kvm_irq,=
 !!level);
>>> =C2=A0 }
>>>
>>
>> For confirmation, should we also adjust the vcpu_index in
>> arm_cpu_kvm_set_irq(), just like above?
>=20
> I am not familiar with this path. in arm_cpu_initfn(), there is a
> comment saying "VIRQ and VFIQ are unused with KVM but we add them to
> maintain the same interface as non-KVM CPUs." So I don't know when that
> code gets executed.
>=20
> But maybe it would be more cautious to implement your suggestion here a=
s
> well.
>=20
> Maybe Peter can provide more info here?

If this is supposed to get used along with kernel_irqchip=3Doff, it seems
this latter is not supported with GICv3 anyway. So max number of vcpus
with GICv2 is 8.

Thanks

Eric
>=20
> Thanks
>=20
> Eric
>=20
>=20
>>
>>
>> Thanks,
>> zenghui
>>
>>
>=20

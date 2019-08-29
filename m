Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1800607wrs;
        Thu, 29 Aug 2019 00:59:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpNgXPtKcDe6MXbLOyV3zbPOSgkc4gYIc91qmSKqvD0i3mjx0SvOuMNTC0iFNkQNjjdj16
X-Received: by 2002:a17:906:e294:: with SMTP id gg20mr6616782ejb.76.1567065544938;
        Thu, 29 Aug 2019 00:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567065544; cv=none;
        d=google.com; s=arc-20160816;
        b=u3opg5WvWzuz/sKp79FkOscvcIGA2xsCbbUroMiqFZ5E/uH1wLkV99DDBQHd060mDr
         8JoXzJqZYHLuxemWUT19z+vM7+nfXjLEJp7YSGvrkKoIvB7SVVHYpMpLWURRuKjamkYs
         tjugu+a/gwJ9XS1jddYTsJb8oBFdkSKMfE/Y1gvhfsWu07IFJivsPUUImEpXZ4Oz0ZJt
         tbXNBkk5KVA4A5tae5aSveZ/0Y+Q6bv24AAHI7PDRO23j7U8DFLiHvWn/1JxtOI/Q5KP
         zvJ51o4T3SNKo25F2IqPYC1aNQM6NY5cH3mV7zYMyNnJ6a6mTybicR1VRSJOEpDz27w4
         Fngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Pfoem1yvBH8B2BC970uZQxrwPrRoDSg4P9ZDIR0IljU=;
        b=yfQzOl6YHkIbHL1HJ0qaVvfERQYhWCVqkPEt7K1Ie6e0LLxV4EDsqvim1w9dmACwnH
         VmKJ4u2GijGAwq3WrgOOGB+yp7oSpAj6hh7lcPx5aYRshQzBSbJczM+yzselI8mdz5BU
         qTCeM3JPdeCBB4RYlkGlDXxTKWViPh/YmaFRzYc4L3fXZ/3TpJ+XIGGPOgNpoVQNQpSf
         izKOLPSViYCr10H+51F2PNgP+OxTB6LMjE+sUW4vMCTJVmOlFZ+ROipIQxLVhdR/8TrQ
         +kTLtnWtaiYwDmdPIIW+8xHdRh2yZB3o/FFeiJlZpZ44Ln5ovBmV+tESEWoOJ1J4qD5L
         t2Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x50si721164edm.174.2019.08.29.00.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 00:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3FKi-0001oY-1C
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 03:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51859)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3FKV-0001nq-FX
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 03:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3FKT-0000Xa-5S
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 03:58:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3FKS-0000XE-U5; Thu, 29 Aug 2019 03:58:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A6933082E66;
 Thu, 29 Aug 2019 07:58:48 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77395600CD;
 Thu, 29 Aug 2019 07:58:46 +0000 (UTC)
To: Zenghui Yu <yuzenghui@huawei.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-3-eric.auger@redhat.com>
 <29520007-f3fd-ed8d-f52b-2839f991556a@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0dd3bc89-8f91-0f8e-8908-18712240a115@redhat.com>
Date: Thu, 29 Aug 2019 09:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <29520007-f3fd-ed8d-f52b-2839f991556a@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 29 Aug 2019 07:58:48 +0000 (UTC)
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
X-TUID: 9LaaCgVTfZxo

Hi Zenghui,

On 8/29/19 4:53 AM, Zenghui Yu wrote:
> Hi Eric,
>=20
> On 2019/8/28 0:05, Eric Auger wrote:
>> Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
>> allow injection of PPIs along with vcpu ids larger than 255. Let's
>> encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LINE
>> ABI when needed.
>>
>> Without that patch qemu exits with "kvm_set_irq: Invalid argument"
>> message.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
>> ---
>> =C2=A0 hw/intc/arm_gic_kvm.c | 10 +++++++---
>> =C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
>> index b56fda144f..889293e97f 100644
>> --- a/hw/intc/arm_gic_kvm.c
>> +++ b/hw/intc/arm_gic_kvm.c
>> @@ -56,6 +56,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq,
>> int level)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * CPU number and interrupt number=
.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int kvm_irq, irqtype, cpu;
>> +=C2=A0=C2=A0=C2=A0 int cpu_idx1 =3D 0, cpu_idx2 =3D 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irq < (num_irq - GIC_INTERNA=
L)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* External int=
errupt. The kernel numbers these like the GIC
>> @@ -63,17 +64,20 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int
>> irq, int level)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * interna=
l ones.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqtype =3D KVM=
_ARM_IRQ_TYPE_SPI;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq +=3D GIC_IN=
TERNAL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Internal int=
errupt: decode into (cpu, interrupt id) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irqtype =3D KVM=
_ARM_IRQ_TYPE_PPI;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq -=3D (num_i=
rq - GIC_INTERNAL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu =3D irq / G=
IC_INTERNAL;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_idx2 =3D cpu / 256;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_idx1 =3D cpu % 256;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq %=3D GIC_IN=
TERNAL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | (cpu << KVM_ARM_IRQ_VCPU=
_SHIFT) | irq;
>> +=C2=A0=C2=A0=C2=A0 kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((cpu_idx2 & KVM_ARM_IRQ_VCPU2_MASK) <<
>> KVM_ARM_IRQ_VCPU2_SHIFT) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 irq;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_set_irq(kvm_state, kvm_irq, =
!!level);
>> =C2=A0 }
>>
>=20
> For confirmation, should we also adjust the vcpu_index in
> arm_cpu_kvm_set_irq(), just like above?

I am not familiar with this path. in arm_cpu_initfn(), there is a
comment saying "VIRQ and VFIQ are unused with KVM but we add them to
maintain the same interface as non-KVM CPUs." So I don't know when that
code gets executed.

But maybe it would be more cautious to implement your suggestion here as
well.

Maybe Peter can provide more info here?

Thanks

Eric


>=20
>=20
> Thanks,
> zenghui
>=20
>=20

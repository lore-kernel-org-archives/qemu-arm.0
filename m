Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp164249wrt;
        Fri, 1 Feb 2019 02:41:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN59fRD3M27VVGvYcPkRjI1RDUi0v373TslEpnqAQAWiNh1j2q2h+ynxXmbaRloTyQWh1gOQ
X-Received: by 2002:a81:5fd5:: with SMTP id t204mr35945719ywb.312.1549017671683;
        Fri, 01 Feb 2019 02:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549017671; cv=none;
        d=google.com; s=arc-20160816;
        b=MgZut0xFaMmD5hv6xSR44/SmcAqb+zPR+LV9wSoSibkMsFdKVe0szxz/Zm61Ot12uN
         JpJmEVOEsChr+W4ENQzLig+kgnoMf2I/Kh/mvBSJNRnqxkuj05kDrfi2Bysroo70LeiZ
         GH9uQ8fhVnopxXSdyqRLxwjqHQovkSB2g2FROMwALGVKuGMhxpwDsXIoQOeVGWf9qFQC
         5P9svAv9ZOb+ZN+mgqx3P58MZ09JXy5z6r8voMBNNUlRHm25uXBACygJDWXGDHG+/4TT
         Sk9TUf6e8k8rQ6NbajqHyXL1OtuFO/1zwbW3iJwLSOu+X2ErlH81bxB4bAmo/LGRn3lX
         1YNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=lmzERwM+J4ejrmdguGPwkj5bdugmFt8nKj+QoCH4Tmc=;
        b=pe2IGDp5wgY2voaj4xDWtdLhyVpiErokZ7TzdJrysjUZUdfp9MKVHEyi2HiOM42HsV
         fPO7btonQqx0b+SNiqGGViTxJCOeC8T1aIxMynnJCOHdtc3R7y9KzxXX+Ou3X8ER+wIF
         qb/PNKJljVtyMWQ3ch2r+LJ+r+LRk7pPEooRbzJ5hpmWeoUGJRM/BovyqJDVfTxWzQmS
         xb+H5DxRkSnVqU78D/b3LGA4XLv77mbplh2VQl4jQWcvSl6lF5rnDA0oE260+1hafD8n
         JOvOgsfKJwmfG+LaTeQBNHEC/EEhx8LorUOeNYWXCJN4JQYCgiw5aqZcRkYvq+ZCRRPy
         uc8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j65si4202790yba.141.2019.02.01.02.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Feb 2019 02:41:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpWFz-0000m5-1q
	for alex.bennee@linaro.org; Fri, 01 Feb 2019 05:41:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gpWFj-0000kR-Mw
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 05:40:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gpWFi-0002p6-Te
	for qemu-arm@nongnu.org; Fri, 01 Feb 2019 05:40:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60314)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gpWFi-0002oO-M0; Fri, 01 Feb 2019 05:40:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 247F67D0DF;
	Fri,  1 Feb 2019 10:30:53 +0000 (UTC)
Received: from [10.36.117.45] (ovpn-117-45.ams2.redhat.com [10.36.117.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D93E19742;
	Fri,  1 Feb 2019 10:30:50 +0000 (UTC)
To: Jia He <jiakernel2@gmail.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
References: <20190123101458.12478-1-eric.auger@redhat.com>
	<20190123101458.12478-8-eric.auger@redhat.com>
	<85896c69-2434-ee08-331a-2216704d25e0@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a6ff5732-5ba2-89aa-77ab-327c22dfbca0@redhat.com>
Date: Fri, 1 Feb 2019 11:30:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <85896c69-2434-ee08-331a-2216704d25e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 01 Feb 2019 10:30:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 07/18] kvm: add
 kvm_arm_get_max_vm_phys_shift
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jzb32ob+1BrX

Hi Hia,

On 1/29/19 3:25 PM, Jia He wrote:
> Hi Eric
>=20
> On 2019/1/23 18:14, Eric Auger wrote:
>> Add the kvm_arm_get_max_vm_phys_shift() helper that returns the
>> log of the maximum IPA size supported by KVM. This capability
>> needs to be known to create the VM with a specific IPA max size
>> (kvm_type passed along KVM_CREATE_VM ioctl.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v3 -> v4:
>> - s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
>> - check KVM_CAP_ARM_VM_IPA_SIZE extension
>>
>> v1 -> v2:
>> - put this in ARM specific code
>> ---
>> =C2=A0 target/arm/kvm.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++++++
>> =C2=A0 target/arm/kvm_arm.h | 16 ++++++++++++++++
>> =C2=A0 2 files changed, 24 insertions(+)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index e00ccf9c98..877c588ef5 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -18,6 +18,7 @@
>> =C2=A0 #include "qemu/error-report.h"
>> =C2=A0 #include "sysemu/sysemu.h"
>> =C2=A0 #include "sysemu/kvm.h"
>> +#include "sysemu/kvm_int.h"
>> =C2=A0 #include "kvm_arm.h"
>> =C2=A0 #include "cpu.h"
>> =C2=A0 #include "trace.h"
>> @@ -162,6 +163,13 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *c=
pu)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->features =3D arm_host_cpu_features=
.features;
>> =C2=A0 }
>> =C2=A0 +int kvm_arm_get_max_vm_phys_shift(MachineState *ms)
>> +{
>> +=C2=A0=C2=A0=C2=A0 KVMState *s =3D KVM_STATE(ms->accelerator);
>> +
>> +=C2=A0=C2=A0=C2=A0 return kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_S=
IZE);
>=20
> If KVM_CAP_ARM_VM_IPA_SIZE is not supported in host kernel, would it be
>=20
> better if kvm_arm_get_max_vm_phys_shift returns a default value
>=20
> (e.g. 40),instead of an errno?
Yes I can change that. At the moment kvm_check_extension() should return
0 if the KVM_CAP_ARM_VM_IPA_SIZE entry is not supported by the kernel.

Thanks

Eric
>=20
> ---
> Cheers,
> Jia He
>=20
>> +}
>> +
>> =C2=A0 int kvm_arch_init(MachineState *ms, KVMState *s)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* For ARM interrupt delivery is always=
 asynchronous,
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 6393455b1d..5969c41f83 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -207,6 +207,17 @@ bool
>> kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>> =C2=A0=C2=A0 */
>> =C2=A0 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>> =C2=A0 +/**
>> + * kvm_arm_get_max_vm_phys_shift - Returns log2 of the max IPA size
>> + * supported by KVM
>> + *
>> + * @ms: Machine state handle
>> + *
>> + * Return the max number of IPA bits or a negative value if
>> + * the host kernel does not expose this value.
>> + */
>> +int kvm_arm_get_max_vm_phys_shift(MachineState *ms);
>> +
>> =C2=A0 /**
>> =C2=A0=C2=A0 * kvm_arm_sync_mpstate_to_kvm
>> =C2=A0=C2=A0 * @cpu: ARMCPU
>> @@ -239,6 +250,11 @@ static inline void
>> kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->host_cpu_probe_failed =3D true;
>> =C2=A0 }
>> =C2=A0 +static inline int kvm_arm_get_max_vm_phys_shift(MachineState *=
ms)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return -ENOENT;
>> +}
>> +
>> =C2=A0 static inline int kvm_arm_vgic_probe(void)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>=20

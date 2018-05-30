Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4188319wre;
        Tue, 29 May 2018 18:15:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLG4oh+R2ML21YkTTbtso52tWC08Pz6C4sDry+OuRvNQWcnzAg9iYAGBdCLJLEoV+L11Afq
X-Received: by 2002:ac8:6612:: with SMTP id c18-v6mr652748qtp.343.1527642953292;
        Tue, 29 May 2018 18:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527642953; cv=none;
        d=google.com; s=arc-20160816;
        b=PmrKA7kYAc8gieM/bzZKPAeFhsDj6AHogfO4uFqlXAJNxyoSKv3rmhDUpfHwy/Mx5o
         RNNDc2cV2/DL/+Ap8NepAsO3Z+c4+ce/r0V9Q8o8Q2zs1+sBDwfmjUjFxm6XwLRruWbj
         ztGS5NRfQRSYUJF8UMfybQmuun3japV+mAjSbg/LonUI5+awVD8McxYZlDMObCsW3zr4
         wyC6wvzopnvpbfmhow5kMinGiRZ2Z9KGO422pzgH/XkpgxwNPAcj//8WuzYkBnoRiRP8
         pjXtacX6mgWtcDsdc2njiZB0wt4Lmv/uVYpR7inrdFKN9i+y6kC5jym9ArLntIbb0Ztu
         3fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=w2+I4ayhfjv1NSAEWWudwWZe26rULBgWEBDVLvqBhNQ=;
        b=IeGPeyu9wN+W+iTjPS/kzM0QOWq4dsuWLKFFq6lrvjfDKFLJtWs/kvSK9sc1EBL0bK
         +J8+wp//FFbWWOdOlD2zSqsaJ88lRvFkYdQgb62mInKo1HjMgIdXJfoZITODvH5Yz7pY
         7ny681xG0p9k7uYbrCUfjLUjTwFa5k63zEJbytJNULzbvaeWGYtqPDku3fg89rFRkEh7
         jGy0qcX0UIYBms5sQczazF7nXUN2lpfpgS1BpvPVnF6+zayOgq0sn4kF8OjQO0AMR2bL
         k8Aa7GfT/SWr8VF+Tl5oftlLVIUFvAytLS8O8HpUac/Y0PvchU3Z+mctrm6ecl5r+sNi
         FLFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e48-v6si672243qtc.97.2018.05.29.18.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 18:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNpiS-0008Ai-O4
	for alex.bennee@linaro.org; Tue, 29 May 2018 21:15:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNpiM-0008AP-0k
	for qemu-arm@nongnu.org; Tue, 29 May 2018 21:15:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNpiH-0006gB-Tk
	for qemu-arm@nongnu.org; Tue, 29 May 2018 21:15:45 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2623 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fNpiH-0006da-He; Tue, 29 May 2018 21:15:41 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id E3289F82505B1;
	Wed, 30 May 2018 09:15:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.382.0; Wed, 30 May 2018
	09:15:15 +0800
Message-ID: <5B0DFB0C.3000002@huawei.com>
Date: Wed, 30 May 2018 09:14:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>
References: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
	<65E224A1-C972-4C38-BD6E-41C59191D999@163.com>
	<383b0c0b-4406-869c-5493-df2f48896113@redhat.com>
In-Reply-To: <383b0c0b-4406-869c-5493-df2f48896113@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [PATCH v2] ARM: ACPI: Fix use-after-free due to
 memory realloc
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: irCAAc69CZrS



On 2018/5/30 3:53, Auger Eric wrote:
> Hi Shannon,
>=20
> On 05/29/2018 04:09 PM, Shannon Zhao wrote:
>>
>>
>>> =E5=9C=A8 2018=E5=B9=B45=E6=9C=8829=E6=97=A5=EF=BC=8C21:53=EF=BC=8CPe=
ter Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>
>>>> On 29 May 2018 at 04:08, Shannon Zhao <zhaoshenglong@huawei.com> wro=
te:
>>>> acpi_data_push uses g_array_set_size to resize the memory size. If t=
here
>>>> is no enough contiguous memory, the address will be changed. So prev=
ious
>>>> pointer could not be used any more. It must update the pointer and u=
se
>>>> the new one.
>>>>
>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>>>> ---
>>>> V2: add comments for iort_node_offset and reviewed tags
>>>> ---
>>>> hw/arm/virt-acpi-build.c | 19 +++++++++++++++----
>>>> 1 file changed, 15 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index 92ceee9..6209138 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)
>>>>     AcpiIortItsGroup *its;
>>>>     AcpiIortTable *iort;
>>>>     AcpiIortSmmu3 *smmu;
>>>> -    size_t node_size, iort_length, smmu_offset =3D 0;
>>>> +    size_t node_size, iort_node_offset, iort_length, smmu_offset =3D=
 0;
>>>>     AcpiIortRC *rc;
>>>>
>>>>     iort =3D acpi_data_push(table_data, sizeof(*iort));
>>>> @@ -415,6 +415,12 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
>>>>     iort->node_count =3D cpu_to_le32(nb_nodes);
>>>>     iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>>>>
>>>> +    /*
>>>> +     * Use a copy in case table_data->data moves duringa acpi_data_=
push
>>>> +     * operations.
>>>> +     */
>>>> +    iort_node_offset =3D sizeof(*iort);
>>>> +
>>>>     /* ITS group node */
>>>>     node_size =3D  sizeof(*its) + sizeof(uint32_t);
>>>>     iort_length +=3D node_size;
>>>> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)
>>>>         int irq =3D  vms->irqmap[VIRT_SMMU];
>>>>
>>>>         /* SMMUv3 node */
>>>> -        smmu_offset =3D iort->node_offset + node_size;
>>>> +        smmu_offset =3D iort_node_offset + node_size;
>>>
>>> In the old code, we used iort->node_offset directly as a CPU
>>> endianness order bitmap, which is initialized above using
>>>    iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>>> In this version, we use iort_node_offset, which is
>>> initialized using
>>>    iort_node_offset =3D sizeof(*iort);
>>>
>>> So we've lost an endianness conversion on big-endian systems.
>>> Which is correct, the old code or the new?
>> I think it=E2=80=99s the new one. I found this bug later and wanted to=
 send another patch to fix it. But to address Philippe=E2=80=99s comment =
I folder them together.
> Shouldn't we have
> iort_node_offset =3D iort->node_offset;
> iort->node_offset =3D cpu_to_le32(iort_node_offset);
> instead?
>=20
Hi Eric,
Have you read this patch and code carefully?

I think you mean
iort_node_offset =3D sizeof(*iort);
iort->node_offset =3D cpu_to_le32(iort_node_offset);

Right? If so it's almost same with what I write. I just use sizeof twice.

iort->node_offset =3D cpu_to_le32(sizeof(*iort));
iort_node_offset =3D sizeof(*iort);

> Otherwise subsequent computations are done with the node_offset already
> converted to le32 whereas the cpu mode may be "be"?
>=20
What I did here is to avoid the case you mentioned.
The iort_node_offset is host order, right? And I use iort_node_offset
instead of iort->node_offset for subsequent computations not the le32
one. So smmu_offset =3D iort_node_offset + node_size; will get the right
value as well as below ones.

Thanks,

> Shouldn't conversions to le32 being done at the last stage when
> populating the structs?
>=20
> May be worth splitting this into 2 patches then or at least mentioning
> this other fix in the commit message?
>=20
> Thanks
>=20
> Eric
>=20
>>
>>>
>>>>         node_size =3D sizeof(*smmu) + sizeof(*idmap);
>>>>         iort_length +=3D node_size;
>>>>         smmu =3D acpi_data_push(table_data, node_size);
>>>> @@ -450,7 +456,7 @@ build_iort(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)
>>>>         idmap->id_count =3D cpu_to_le32(0xFFFF);
>>>>         idmap->output_base =3D 0;
>>>>         /* output IORT node is the ITS group node (the first node) *=
/
>>>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
>>>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>>
>>> Here we're doing an endianness conversion on iort_node_offset.
>>>
>>> Overall something is weird here, even in the previous version:
>>> if we wrote iort->node_offset with cpu_to_le32(), that implies
>>> that it's little-endian; so why are we reading it with cpu_to_le32()
>>> here rather than le32_to_cpu() ?
>>> Both cpu_to_le32() and le32_to_cpu() are the same operation,
>>> mathematically, but we should use the version which indicates
>>> our intent, ie which of source and destination is the always-LE
>>> data, and which is the host-order data.
>>>
>>>>     }
>>>>
>>>>     /* Root Complex Node */
>>>> @@ -479,9 +485,14 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
>>>>         idmap->output_reference =3D cpu_to_le32(smmu_offset);
>>>>     } else {
>>>>         /* output IORT node is the ITS group node (the first node) *=
/
>>>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
>>>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>>>     }
>>>>
>>>> +    /*
>>>> +     * Update the pointer address in case table_data->data moves du=
ring above
>>>> +     * acpi_data_push operations.
>>>> +     */
>>>> +    iort =3D (AcpiIortTable *)(table_data->data + iort_start);
>>>>     iort->length =3D cpu_to_le32(iort_length);
>>>>
>>>>     build_header(linker, table_data, (void *)(table_data->data + ior=
t_start),
>>>
>>> This could just use 'iort' now, right?
>> Right, but for consistent as other places I think it=E2=80=99s fine to=
 remain unchanged.=20
>>>
>>>> --
>>>
>>> thanks
>>> -- PMM
>>
>>
>=20
> .
>=20

--=20
Shannon


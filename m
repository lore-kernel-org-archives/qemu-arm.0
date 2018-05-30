Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4398253wre;
        Tue, 29 May 2018 23:39:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKiMu0A6a3n/SJTJ98QJe942TI2b9J7hp8hiaqXnjmC3ZdSQHWEKmI10P4CmUUkKWVFwUgN
X-Received: by 2002:ae9:c00f:: with SMTP id u15-v6mr1217597qkk.383.1527662352315;
        Tue, 29 May 2018 23:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662352; cv=none;
        d=google.com; s=arc-20160816;
        b=F+raz20nH1pYbp2sNJB7FkNiVu+7q7CJbdEHh0yQGowy3834+9cnlzfHH4Ipo8zFWh
         QLt7+wmZn0Head9pfxVslUuJN19mGtHfz+j1AdnSs7Pd2L7kvj8Nb1gLxJvFDjsPVRc4
         yNIFGTjkiB2jOgxCQchNFHYwy9OA7bOdSXNwoaSvoC98zj+q56cs5bO3ILG/ya/oit2m
         qcl8mao3K5WsGqbksF3+QfctcpRc6aIXS0PGuUFxKN9EP569eUYfmgZfSNXcpc0ZL7r0
         SxHaE0GzzCaxRavvs5DtRGeXc4jNlqhRqAR0yxekporxhIb8LY0h4bApbdtx5E0yCd4q
         YMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=q5zW4JD813ZtKKehr/6h+ph6qavIGxk7uSmZZAw67TA=;
        b=KPuTQiIs4Odyzx1uIObol1zBkmbBp/PDzOEhibOCDrcZKIfRoykSBgdEa2/fnR8Cqz
         uMifSfTLbUyB3/CGkka/oxYtpnhdQj272+avdwjGJCiS3ZR/SeRgwO/4MJoqeaAMlXsT
         egmbZ30PwzOubIdylYxMSKw1hSM2Pk3LiyXdargKnvY+iA1FhO3Adt7zx2+vQ/nDhNc2
         q5c/IZv5QWgtI0s96URLL4EeR0vflk92NkBkoLd2BZaTYyLEftkj0efhTp//k9+IKoCq
         P4CQHFVnke2XuvEavoVNEhX9eWUTGCLQyI1oCRNU8Gbm2MzORtyWoA+tT9eiv2GzGMj7
         BCjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7-v6si5062641qkm.230.2018.05.29.23.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNulL-0000d4-SZ
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:39:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNuku-0000b6-Te
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNukt-0008Rc-FL
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:38:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53468 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNukn-0008O5-Dd; Wed, 30 May 2018 02:38:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B20D3BB421;
	Wed, 30 May 2018 06:38:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C3AA2166BB2;
	Wed, 30 May 2018 06:38:35 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
	<65E224A1-C972-4C38-BD6E-41C59191D999@163.com>
	<383b0c0b-4406-869c-5493-df2f48896113@redhat.com>
	<5B0DFB0C.3000002@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <81226dc7-4b0a-bd1b-6910-0b9a94b0128f@redhat.com>
Date: Wed, 30 May 2018 08:38:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5B0DFB0C.3000002@huawei.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 06:38:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 06:38:36 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2] ARM: ACPI: Fix use-after-free due to
 memory realloc
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4MXaSDcGhSlP

Hi Shannon,

On 05/30/2018 03:14 AM, Shannon Zhao wrote:
>=20
>=20
> On 2018/5/30 3:53, Auger Eric wrote:
>> Hi Shannon,
>>
>> On 05/29/2018 04:09 PM, Shannon Zhao wrote:
>>>
>>>
>>>> =E5=9C=A8 2018=E5=B9=B45=E6=9C=8829=E6=97=A5=EF=BC=8C21:53=EF=BC=8CP=
eter Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>
>>>>> On 29 May 2018 at 04:08, Shannon Zhao <zhaoshenglong@huawei.com> wr=
ote:
>>>>> acpi_data_push uses g_array_set_size to resize the memory size. If =
there
>>>>> is no enough contiguous memory, the address will be changed. So pre=
vious
>>>>> pointer could not be used any more. It must update the pointer and =
use
>>>>> the new one.
>>>>>
>>>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>>>>> ---
>>>>> V2: add comments for iort_node_offset and reviewed tags
>>>>> ---
>>>>> hw/arm/virt-acpi-build.c | 19 +++++++++++++++----
>>>>> 1 file changed, 15 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>>> index 92ceee9..6209138 100644
>>>>> --- a/hw/arm/virt-acpi-build.c
>>>>> +++ b/hw/arm/virt-acpi-build.c
>>>>> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
>>>>>     AcpiIortItsGroup *its;
>>>>>     AcpiIortTable *iort;
>>>>>     AcpiIortSmmu3 *smmu;
>>>>> -    size_t node_size, iort_length, smmu_offset =3D 0;
>>>>> +    size_t node_size, iort_node_offset, iort_length, smmu_offset =3D=
 0;
>>>>>     AcpiIortRC *rc;
>>>>>
>>>>>     iort =3D acpi_data_push(table_data, sizeof(*iort));
>>>>> @@ -415,6 +415,12 @@ build_iort(GArray *table_data, BIOSLinker *lin=
ker, VirtMachineState *vms)
>>>>>     iort->node_count =3D cpu_to_le32(nb_nodes);
>>>>>     iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>>>>>
>>>>> +    /*
>>>>> +     * Use a copy in case table_data->data moves duringa acpi_data=
_push
nit: duringa typo
>>>>> +     * operations.
>>>>> +     */
>>>>> +    iort_node_offset =3D sizeof(*iort);
>>>>> +
>>>>>     /* ITS group node */
>>>>>     node_size =3D  sizeof(*its) + sizeof(uint32_t);
>>>>>     iort_length +=3D node_size;
>>>>> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
>>>>>         int irq =3D  vms->irqmap[VIRT_SMMU];
>>>>>
>>>>>         /* SMMUv3 node */
>>>>> -        smmu_offset =3D iort->node_offset + node_size;
>>>>> +        smmu_offset =3D iort_node_offset + node_size;
>>>>
>>>> In the old code, we used iort->node_offset directly as a CPU
>>>> endianness order bitmap, which is initialized above using
>>>>    iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>>>> In this version, we use iort_node_offset, which is
>>>> initialized using
>>>>    iort_node_offset =3D sizeof(*iort);
>>>>
>>>> So we've lost an endianness conversion on big-endian systems.
>>>> Which is correct, the old code or the new?
>>> I think it=E2=80=99s the new one. I found this bug later and wanted t=
o send another patch to fix it. But to address Philippe=E2=80=99s comment=
 I folder them together.
>> Shouldn't we have
>> iort_node_offset =3D iort->node_offset;
>> iort->node_offset =3D cpu_to_le32(iort_node_offset);
>> instead?
>>
> Hi Eric,
> Have you read this patch and code carefully?
I checked against the v1 in my branch thinking you did not change
anything besides the comment (your log history?).

>=20
> I think you mean
> iort_node_offset =3D sizeof(*iort);
Yes sorry wrong copy/paste
> iort->node_offset =3D cpu_to_le32(iort_node_offset);
>=20
> Right? If so it's almost same with what I write. I just use sizeof twic=
e.
>=20
> iort->node_offset =3D cpu_to_le32(sizeof(*iort));
> iort_node_offset =3D sizeof(*iort);
>=20
>> Otherwise subsequent computations are done with the node_offset alread=
y
>> converted to le32 whereas the cpu mode may be "be"?
>>
> What I did here is to avoid the case you mentioned.
> The iort_node_offset is host order, right? And I use iort_node_offset
> instead of iort->node_offset for subsequent computations not the le32
> one. So smmu_offset =3D iort_node_offset + node_size; will get the righ=
t
> value as well as below ones.
OK checking again v2, this looks OK to me.

Thanks

Eric
>=20
> Thanks,
>=20
>> Shouldn't conversions to le32 being done at the last stage when
>> populating the structs?
>>
>> May be worth splitting this into 2 patches then or at least mentioning
>> this other fix in the commit message?
>>
>> Thanks
>>
>> Eric
>>
>>>
>>>>
>>>>>         node_size =3D sizeof(*smmu) + sizeof(*idmap);
>>>>>         iort_length +=3D node_size;
>>>>>         smmu =3D acpi_data_push(table_data, node_size);
>>>>> @@ -450,7 +456,7 @@ build_iort(GArray *table_data, BIOSLinker *link=
er, VirtMachineState *vms)
>>>>>         idmap->id_count =3D cpu_to_le32(0xFFFF);
>>>>>         idmap->output_base =3D 0;
>>>>>         /* output IORT node is the ITS group node (the first node) =
*/
>>>>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset)=
;
>>>>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>>>
>>>> Here we're doing an endianness conversion on iort_node_offset.
>>>>
>>>> Overall something is weird here, even in the previous version:
>>>> if we wrote iort->node_offset with cpu_to_le32(), that implies
>>>> that it's little-endian; so why are we reading it with cpu_to_le32()
>>>> here rather than le32_to_cpu() ?
>>>> Both cpu_to_le32() and le32_to_cpu() are the same operation,
>>>> mathematically, but we should use the version which indicates
>>>> our intent, ie which of source and destination is the always-LE
>>>> data, and which is the host-order data.
>>>>
>>>>>     }
>>>>>
>>>>>     /* Root Complex Node */
>>>>> @@ -479,9 +485,14 @@ build_iort(GArray *table_data, BIOSLinker *lin=
ker, VirtMachineState *vms)
>>>>>         idmap->output_reference =3D cpu_to_le32(smmu_offset);
>>>>>     } else {
>>>>>         /* output IORT node is the ITS group node (the first node) =
*/
>>>>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset)=
;
>>>>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>>>>     }
>>>>>
>>>>> +    /*
>>>>> +     * Update the pointer address in case table_data->data moves d=
uring above
>>>>> +     * acpi_data_push operations.
>>>>> +     */
>>>>> +    iort =3D (AcpiIortTable *)(table_data->data + iort_start);
>>>>>     iort->length =3D cpu_to_le32(iort_length);
>>>>>
>>>>>     build_header(linker, table_data, (void *)(table_data->data + io=
rt_start),
>>>>
>>>> This could just use 'iort' now, right?
>>> Right, but for consistent as other places I think it=E2=80=99s fine t=
o remain unchanged.=20
>>>>
>>>>> --
>>>>
>>>> thanks
>>>> -- PMM
>>>
>>>
>>
>> .
>>
>=20

Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3944401wre;
        Tue, 29 May 2018 12:54:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuF5T82y/kvNtr9y5pu4WKuHs3vQDpVQaGqtLRpIF4ykOltXjvIgB/9ryy3Zj6JfjC+T5/
X-Received: by 2002:a37:d913:: with SMTP id u19-v6mr16523404qki.172.1527623659439;
        Tue, 29 May 2018 12:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527623659; cv=none;
        d=google.com; s=arc-20160816;
        b=QsceFntUGNlRVlF59JWfM/s38ZmCIm3badCtgumf9gTL4nT50OJ/scNc8Q6U14vgjp
         HjlWUAGgSTufdrHKb/EbhXDF7rETdTqnx9eeAA/KcKAf99CTjofe9DBJp4ZZMCO7cM7a
         QtP1LQDtSCaOijdeR/lv0ZSY7bdrZpSk8r4KPqCyyE1/yvnBkbLJEzthWX2CgXPrwj1v
         PTZwXllfkhnNw881BPMyR1GMBIaQvokHhyJKvXntgUDL9ErzjQvxkbwisqDIydGFFs41
         t5iBg9Ok0RYEVw+nWGRESkJhWzrxxIRSXtx8X1O8FkiXue9SIZshH3RWhhu9Q+5eAmTQ
         PMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=JsxVoGAyZ15DAS3vVJc+bAUU6tGVidPTB7HWtXbYR8w=;
        b=Pq6sN+yNfx4lTmE0BoY6zeq1P7IJ6ouWYB+kYcYQAIngCEkzo2oLTHutAM+jwQ4ZYg
         KHW+tBg/V7un+nVsYDOUDmEfqiQqShsDeok0clYril8IGFTemiHK6HAWB3Aq1cVyvvTh
         S559ozfd9Hqqt2/mGfVPhQeZMi/Xdd53iXQwm4xH8rlIFhS9HQSIGXr3ru/zLKAC8GHK
         cgg8khHkHzzK9FE2XP36L1v4ZzlPLRJG1nkqy3HX6xF7HOUMJm7SXPoy9UcgNfvY6+Je
         qKlyXnBV7E8cWFhSZmMNNtVyt1bej5A4dWgitluQf0afSFhSuaNuPt0cgzAkNehxxSPj
         jrgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3-v6si4198176qvj.206.2018.05.29.12.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 12:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNkhG-00052Z-Sa
	for alex.bennee@linaro.org; Tue, 29 May 2018 15:54:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNkgR-0004gl-GY
	for qemu-devel@nongnu.org; Tue, 29 May 2018 15:53:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNkgQ-0008Ir-Cj
	for qemu-devel@nongnu.org; Tue, 29 May 2018 15:53:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49620 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNkgK-00089Y-FY; Tue, 29 May 2018 15:53:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3C95401EF08;
	Tue, 29 May 2018 19:53:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 242112166BB6;
	Tue, 29 May 2018 19:53:17 +0000 (UTC)
To: Shannon Zhao <zhaosl1988@163.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
	<65E224A1-C972-4C38-BD6E-41C59191D999@163.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <383b0c0b-4406-869c-5493-df2f48896113@redhat.com>
Date: Tue, 29 May 2018 21:53:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <65E224A1-C972-4C38-BD6E-41C59191D999@163.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 19:53:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 19:53:19 +0000 (UTC) for IP:'10.11.54.6'
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zUKxgfma7FtW

Hi Shannon,

On 05/29/2018 04:09 PM, Shannon Zhao wrote:
>=20
>=20
>> =E5=9C=A8 2018=E5=B9=B45=E6=9C=8829=E6=97=A5=EF=BC=8C21:53=EF=BC=8CPet=
er Maydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>>> On 29 May 2018 at 04:08, Shannon Zhao <zhaoshenglong@huawei.com> wrot=
e:
>>> acpi_data_push uses g_array_set_size to resize the memory size. If th=
ere
>>> is no enough contiguous memory, the address will be changed. So previ=
ous
>>> pointer could not be used any more. It must update the pointer and us=
e
>>> the new one.
>>>
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>>> ---
>>> V2: add comments for iort_node_offset and reviewed tags
>>> ---
>>> hw/arm/virt-acpi-build.c | 19 +++++++++++++++----
>>> 1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 92ceee9..6209138 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker=
, VirtMachineState *vms)
>>>     AcpiIortItsGroup *its;
>>>     AcpiIortTable *iort;
>>>     AcpiIortSmmu3 *smmu;
>>> -    size_t node_size, iort_length, smmu_offset =3D 0;
>>> +    size_t node_size, iort_node_offset, iort_length, smmu_offset =3D=
 0;
>>>     AcpiIortRC *rc;
>>>
>>>     iort =3D acpi_data_push(table_data, sizeof(*iort));
>>> @@ -415,6 +415,12 @@ build_iort(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)
>>>     iort->node_count =3D cpu_to_le32(nb_nodes);
>>>     iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>>>
>>> +    /*
>>> +     * Use a copy in case table_data->data moves duringa acpi_data_p=
ush
>>> +     * operations.
>>> +     */
>>> +    iort_node_offset =3D sizeof(*iort);
>>> +
>>>     /* ITS group node */
>>>     node_size =3D  sizeof(*its) + sizeof(uint32_t);
>>>     iort_length +=3D node_size;
>>> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker=
, VirtMachineState *vms)
>>>         int irq =3D  vms->irqmap[VIRT_SMMU];
>>>
>>>         /* SMMUv3 node */
>>> -        smmu_offset =3D iort->node_offset + node_size;
>>> +        smmu_offset =3D iort_node_offset + node_size;
>>
>> In the old code, we used iort->node_offset directly as a CPU
>> endianness order bitmap, which is initialized above using
>>    iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>> In this version, we use iort_node_offset, which is
>> initialized using
>>    iort_node_offset =3D sizeof(*iort);
>>
>> So we've lost an endianness conversion on big-endian systems.
>> Which is correct, the old code or the new?
> I think it=E2=80=99s the new one. I found this bug later and wanted to =
send another patch to fix it. But to address Philippe=E2=80=99s comment I=
 folder them together.
Shouldn't we have
iort_node_offset =3D iort->node_offset;
iort->node_offset =3D cpu_to_le32(iort_node_offset);
instead?

Otherwise subsequent computations are done with the node_offset already
converted to le32 whereas the cpu mode may be "be"?

Shouldn't conversions to le32 being done at the last stage when
populating the structs?

May be worth splitting this into 2 patches then or at least mentioning
this other fix in the commit message?

Thanks

Eric

>=20
>>
>>>         node_size =3D sizeof(*smmu) + sizeof(*idmap);
>>>         iort_length +=3D node_size;
>>>         smmu =3D acpi_data_push(table_data, node_size);
>>> @@ -450,7 +456,7 @@ build_iort(GArray *table_data, BIOSLinker *linker=
, VirtMachineState *vms)
>>>         idmap->id_count =3D cpu_to_le32(0xFFFF);
>>>         idmap->output_base =3D 0;
>>>         /* output IORT node is the ITS group node (the first node) */
>>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
>>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>
>> Here we're doing an endianness conversion on iort_node_offset.
>>
>> Overall something is weird here, even in the previous version:
>> if we wrote iort->node_offset with cpu_to_le32(), that implies
>> that it's little-endian; so why are we reading it with cpu_to_le32()
>> here rather than le32_to_cpu() ?
>> Both cpu_to_le32() and le32_to_cpu() are the same operation,
>> mathematically, but we should use the version which indicates
>> our intent, ie which of source and destination is the always-LE
>> data, and which is the host-order data.
>>
>>>     }
>>>
>>>     /* Root Complex Node */
>>> @@ -479,9 +485,14 @@ build_iort(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)
>>>         idmap->output_reference =3D cpu_to_le32(smmu_offset);
>>>     } else {
>>>         /* output IORT node is the ITS group node (the first node) */
>>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
>>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>>     }
>>>
>>> +    /*
>>> +     * Update the pointer address in case table_data->data moves dur=
ing above
>>> +     * acpi_data_push operations.
>>> +     */
>>> +    iort =3D (AcpiIortTable *)(table_data->data + iort_start);
>>>     iort->length =3D cpu_to_le32(iort_length);
>>>
>>>     build_header(linker, table_data, (void *)(table_data->data + iort=
_start),
>>
>> This could just use 'iort' now, right?
> Right, but for consistent as other places I think it=E2=80=99s fine to =
remain unchanged.=20
>>
>>> --
>>
>> thanks
>> -- PMM
>=20
>=20

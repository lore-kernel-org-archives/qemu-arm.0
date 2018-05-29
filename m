Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3704303wre;
        Tue, 29 May 2018 08:35:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJl+sYpmu2R3tH5a3gXfQIwz7pS7rq1vMoeYHUtJmld9OlFVfxuGyn8H+FLk352M2naApTo
X-Received: by 2002:a0c:b128:: with SMTP id q37-v6mr16532180qvc.19.1527608135182;
        Tue, 29 May 2018 08:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527608135; cv=none;
        d=google.com; s=arc-20160816;
        b=ciCrU6rkl5OAgQoo57pvnsDGZjyeQcW2x9PpPFlZRD4ygbAcif2/jgofB4kL8kPsJv
         gwlJHObzkWiRejJXKo7AKcqd6C8ClhOO1himwjHoj8xFezDGbE4HgTClF9rugnxY45gw
         Rz+wL8zoQeRGFL+QvAcbQbNIO948AXSkDSbp2bcOmIaIdcqjE+FDFpudoqMRK0hvtvVG
         ABIpBDFzUrj6HlkkyLcYUpo1/AFrQG18uwg4eJKl/fa2z8rfsULcOAOQfc/bTri9h3IO
         AzSonsfT9eMLkUoOvNouSrTzC0EcPAv/p6hSXzBw9MOxVN8kwojOzWeTdGH7Njijy04J
         OWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:references
         :message-id:content-transfer-encoding:date:in-reply-to:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=dzpAljTZvkOCJaimkTYWAtXYRPJvDSYadyu4Q520JDM=;
        b=k/Fqh6pD1aCVTTLX0cTDyRQifXRBVu/RBJCUdhele3oG99DNn9bqi11uU5lLLZa0HV
         /kE/cDD6nFuAVh/tLYU1nPDNdSzdQ1qCLoxPXQR+fXxhP9mRBpnt5HV+Fw5Jo4ZcAQmP
         IVzgiceJF40/yIFAoMFASlfL1MxMs2Rv3xiWK3DSecgTmJAkVsn5LEvv0JFEH7wmcP0O
         //+mUW0n9w+/ZE4FDLyDD6BTwSXjbLdR3EeI/srZEnnE/NapTsVk+/cmGUU1R0Ub8GmE
         hCSkCWcYENy+amNIDAJbDi75YKerCKkEs28UaV4ivEl2myiKFSP6fis3qoE8/rKajbuw
         S+nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@163.com header.s=s110527 header.b=DjIRbuRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si9441403qth.259.2018.05.29.08.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 08:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com header.s=s110527 header.b=DjIRbuRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNges-0000yq-Jo
	for alex.bennee@linaro.org; Tue, 29 May 2018 11:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaosl1988@163.com>) id 1fNfJi-0005Eu-2f
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:09:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaosl1988@163.com>) id 1fNfJd-0000hG-8J
	for qemu-arm@nongnu.org; Tue, 29 May 2018 10:09:38 -0400
Received: from m12-14.163.com ([220.181.12.14]:43041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaosl1988@163.com>)
	id 1fNfJc-0000bu-FU; Tue, 29 May 2018 10:09:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Mime-Version:Subject:From:Date:Message-Id; bh=dzpAl
	jTZvkOCJaimkTYWAtXYRPJvDSYadyu4Q520JDM=; b=DjIRbuRKs6XPE2BX85O6O
	7i94lwyyENjLtbUQSgfg9H/2VxWp4iyYocrXfmTdlr/hC5GtxTuR8h9zAFggNTWF
	WyM5wK9ftv7w6ZJOnaN4wOItLnP2lt9y8ZOfYPQsI3hwxV6t13bATuHXa0Vds+/t
	1q0ADeCPXtMbOYbvHEF6sA=
Received: from [10.157.129.113] (unknown [112.17.244.92])
	by smtp10 (Coremail) with SMTP id DsCowACnRB4TXw1boSztDQ--.8413S2;
	Tue, 29 May 2018 22:09:24 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
From: Shannon Zhao <zhaosl1988@163.com>
X-Mailer: iPhone Mail (15E216)
In-Reply-To: <CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
Date: Tue, 29 May 2018 22:09:22 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <65E224A1-C972-4C38-BD6E-41C59191D999@163.com>
References: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-CM-TRANSID: DsCowACnRB4TXw1boSztDQ--.8413S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4DAr1UAFy7uw1UKFy3Arb_yoWruw48pr
	WDGa4FqrW3J34Igwn7trZIy34kZws7Kw4jyrWkuFyakF95Kr1xtFWUKr9a9as8Zr1kur48
	Zr1YqF1DuF4kAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bYkucUUUUU=
X-Originating-IP: [112.17.244.92]
X-CM-SenderInfo: 52kd02borzmmi6rwjhhfrp/xtbBSRRVS1aDx2ej3wAAsK
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.14
X-Mailman-Approved-At: Tue, 29 May 2018 11:35:21 -0400
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
Cc: Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0cPFZQ78CrSH



> =E5=9C=A8 2018=E5=B9=B45=E6=9C=8829=E6=97=A5=EF=BC=8C21:53=EF=BC=8CPeter M=
aydell <peter.maydell@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>> On 29 May 2018 at 04:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> acpi_data_push uses g_array_set_size to resize the memory size. If there
>> is no enough contiguous memory, the address will be changed. So previous
>> pointer could not be used any more. It must update the pointer and use
>> the new one.
>>=20
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>> ---
>> V2: add comments for iort_node_offset and reviewed tags
>> ---
>> hw/arm/virt-acpi-build.c | 19 +++++++++++++++----
>> 1 file changed, 15 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 92ceee9..6209138 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>>     AcpiIortItsGroup *its;
>>     AcpiIortTable *iort;
>>     AcpiIortSmmu3 *smmu;
>> -    size_t node_size, iort_length, smmu_offset =3D 0;
>> +    size_t node_size, iort_node_offset, iort_length, smmu_offset =3D 0;
>>     AcpiIortRC *rc;
>>=20
>>     iort =3D acpi_data_push(table_data, sizeof(*iort));
>> @@ -415,6 +415,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
>>     iort->node_count =3D cpu_to_le32(nb_nodes);
>>     iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>>=20
>> +    /*
>> +     * Use a copy in case table_data->data moves duringa acpi_data_push
>> +     * operations.
>> +     */
>> +    iort_node_offset =3D sizeof(*iort);
>> +
>>     /* ITS group node */
>>     node_size =3D  sizeof(*its) + sizeof(uint32_t);
>>     iort_length +=3D node_size;
>> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>>         int irq =3D  vms->irqmap[VIRT_SMMU];
>>=20
>>         /* SMMUv3 node */
>> -        smmu_offset =3D iort->node_offset + node_size;
>> +        smmu_offset =3D iort_node_offset + node_size;
>=20
> In the old code, we used iort->node_offset directly as a CPU
> endianness order bitmap, which is initialized above using
>    iort->node_offset =3D cpu_to_le32(sizeof(*iort));
> In this version, we use iort_node_offset, which is
> initialized using
>    iort_node_offset =3D sizeof(*iort);
>=20
> So we've lost an endianness conversion on big-endian systems.
> Which is correct, the old code or the new?
I think it=E2=80=99s the new one. I found this bug later and wanted to send a=
nother patch to fix it. But to address Philippe=E2=80=99s comment I folder t=
hem together.

>=20
>>         node_size =3D sizeof(*smmu) + sizeof(*idmap);
>>         iort_length +=3D node_size;
>>         smmu =3D acpi_data_push(table_data, node_size);
>> @@ -450,7 +456,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>>         idmap->id_count =3D cpu_to_le32(0xFFFF);
>>         idmap->output_base =3D 0;
>>         /* output IORT node is the ITS group node (the first node) */
>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>=20
> Here we're doing an endianness conversion on iort_node_offset.
>=20
> Overall something is weird here, even in the previous version:
> if we wrote iort->node_offset with cpu_to_le32(), that implies
> that it's little-endian; so why are we reading it with cpu_to_le32()
> here rather than le32_to_cpu() ?
> Both cpu_to_le32() and le32_to_cpu() are the same operation,
> mathematically, but we should use the version which indicates
> our intent, ie which of source and destination is the always-LE
> data, and which is the host-order data.
>=20
>>     }
>>=20
>>     /* Root Complex Node */
>> @@ -479,9 +485,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
>>         idmap->output_reference =3D cpu_to_le32(smmu_offset);
>>     } else {
>>         /* output IORT node is the ITS group node (the first node) */
>> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
>> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>>     }
>>=20
>> +    /*
>> +     * Update the pointer address in case table_data->data moves during a=
bove
>> +     * acpi_data_push operations.
>> +     */
>> +    iort =3D (AcpiIortTable *)(table_data->data + iort_start);
>>     iort->length =3D cpu_to_le32(iort_length);
>>=20
>>     build_header(linker, table_data, (void *)(table_data->data + iort_sta=
rt),
>=20
> This could just use 'iort' now, right?
Right, but for consistent as other places I think it=E2=80=99s fine to remai=
n unchanged.=20
>=20
>> --
>=20
> thanks
> -- PMM



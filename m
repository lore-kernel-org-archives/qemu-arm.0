Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3597354wre;
        Tue, 29 May 2018 06:54:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKILqCiyPe5/AQ4x3+77JyJrpS7L+ZgYmGoN/21krE062ZOI+zlxhxEmnCUc/lRW98NCTMvV
X-Received: by 2002:ac8:185c:: with SMTP id n28-v6mr9139003qtk.136.1527602066874;
        Tue, 29 May 2018 06:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527602066; cv=none;
        d=google.com; s=arc-20160816;
        b=x/FtjPhKNlKv36Wj49odb0rlm4u7ImwkNiS4DZ5CxAvx5mwRt6VIYRwN26YHN8gg3s
         sdrirQvo04FFqMv5R8PukF+EgPWgd6HHIpo1rWdvZTO1iZnFF+1JBz9agjX1NxT5ZPFj
         4vh9aBMP2Kf+G+/NTVk3sFXFL3GfjZPf3JsZls8d3Sts0x9lAWkmXdihSwE6usypWlit
         j9w9AsFDR4lGk//OAxAIgeywvKRxJR6BFzHz1G7HjWh5V3RzCtQEbD5kkAWnL90ZWpVF
         rmqbxt9VjxbhfqOF1YRrcTxZ4MF1uhJDThAF/eb9rjQNkYBIUNE5+HQCFNifjZPAtDWk
         w8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=+EKHlUkny7rXL6B+u4fvoa4L9ZSkl+2Sk3fQaTXKnDA=;
        b=gYCmFg5WQNuXdEP24+wxhZ7I8jY6wrUMAdQiqrTGeVqS0gaHZSun66Pgc48rKZ0liW
         P/eV/AUyJWMZlG5nNbDvLQafZosbpsEtMuKVtOXkKiHUiERD2iD1bN0hiYM356m1SzUm
         Bj+M5/t5eCipEq7HL0tGfW/qeVQ4NO+V2RI/WRQd8t7VHO4NoRj1qR9RwcpQnSte6duh
         VvxhRGrP/Rx3HfBRL60DGbr6MJLm7KZUV4AJxH0yqCj4HS5RkkasVlEQeOsH6qbr6ql0
         S17V8pA2crPlAsVAzwtBYgvYZc+OCE9JLWTlhJgGYbv/peOoQF/iETlS+ag/EsYGgyjU
         x2dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gdWIzUjj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14-v6si1706118qtm.149.2018.05.29.06.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gdWIzUjj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNf50-0000zz-EY
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:54:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNf4g-0000yU-Is
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:54:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNf4f-000832-Fy
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:54:06 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:37745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNf4f-00081y-1t
	for qemu-devel@nongnu.org; Tue, 29 May 2018 09:54:05 -0400
Received: by mail-ot0-x242.google.com with SMTP id 77-v6so17014592otd.4
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+EKHlUkny7rXL6B+u4fvoa4L9ZSkl+2Sk3fQaTXKnDA=;
	b=gdWIzUjjp6EXEZy78YjXm9gemDHQGjQTxso/DRA5spxPSsCz3csVY3ckxpnDKAn6Ta
	k9ePQb9G9G/53Xkhso1Y6gMeuQHcKnzOll8kQbNxoIyENKYsJBYl+IVaQb0eJZTXbp1J
	iLr8O0Ky/oaMwNxnjCw5vOi7+3vcFODHRlDf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+EKHlUkny7rXL6B+u4fvoa4L9ZSkl+2Sk3fQaTXKnDA=;
	b=HaB++0oHMRGLBLfdubDUCQOuHUzw84AbpG0UIrzgIeBccnNBfhifQvx9j+fATjMKcS
	P/zzdzV7qDpMQUC9u4tAaJ2Z/bTA2hCquILDk5Igbd9yAWJXyKeSFwCZnz03TqrMP96r
	CbExUK7FQv7YF3eu16lBs9IVoZFuA5npqaXAWivkE+hmYxfo67zDBQvfs573Ohf8/kym
	rdvkyvwyQKMAtvsxd7pIgEeI801pZqTJEtbkuTSngyb2+gFBDviVAGpLIMjguRIZjG/N
	WU1ZevO2479QK1VKr1YR0jLRXY6/DpyO2KWepXyajE92Wab2B/zVwyCBStGggZnSSHUD
	fAUg==
X-Gm-Message-State: ALKqPwf9B/TcXXEQsO8j0qnQSDizQGMyR2UJDnuIn+TCFqjCUiLgTr9l
	BvDB7v06i/nqzOZu9FHZox1csCyyzpvdAmkWMypxHw==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr12043001otd.316.1527602044135; 
	Tue, 29 May 2018 06:54:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 06:53:43
	-0700 (PDT)
In-Reply-To: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 14:53:43 +0100
Message-ID: <CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GPThZ9AfbGc1

On 29 May 2018 at 04:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> acpi_data_push uses g_array_set_size to resize the memory size. If there
> is no enough contiguous memory, the address will be changed. So previous
> pointer could not be used any more. It must update the pointer and use
> the new one.
>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> ---
> V2: add comments for iort_node_offset and reviewed tags
> ---
>  hw/arm/virt-acpi-build.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 92ceee9..6209138 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>      AcpiIortItsGroup *its;
>      AcpiIortTable *iort;
>      AcpiIortSmmu3 *smmu;
> -    size_t node_size, iort_length, smmu_offset =3D 0;
> +    size_t node_size, iort_node_offset, iort_length, smmu_offset =3D 0;
>      AcpiIortRC *rc;
>
>      iort =3D acpi_data_push(table_data, sizeof(*iort));
> @@ -415,6 +415,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
>      iort->node_count =3D cpu_to_le32(nb_nodes);
>      iort->node_offset =3D cpu_to_le32(sizeof(*iort));
>
> +    /*
> +     * Use a copy in case table_data->data moves duringa acpi_data_push
> +     * operations.
> +     */
> +    iort_node_offset =3D sizeof(*iort);
> +
>      /* ITS group node */
>      node_size =3D  sizeof(*its) + sizeof(uint32_t);
>      iort_length +=3D node_size;
> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>          int irq =3D  vms->irqmap[VIRT_SMMU];
>
>          /* SMMUv3 node */
> -        smmu_offset =3D iort->node_offset + node_size;
> +        smmu_offset =3D iort_node_offset + node_size;

In the old code, we used iort->node_offset directly as a CPU
endianness order bitmap, which is initialized above using
    iort->node_offset =3D cpu_to_le32(sizeof(*iort));
In this version, we use iort_node_offset, which is
initialized using
    iort_node_offset =3D sizeof(*iort);

So we've lost an endianness conversion on big-endian systems.
Which is correct, the old code or the new?

>          node_size =3D sizeof(*smmu) + sizeof(*idmap);
>          iort_length +=3D node_size;
>          smmu =3D acpi_data_push(table_data, node_size);
> @@ -450,7 +456,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>          idmap->id_count =3D cpu_to_le32(0xFFFF);
>          idmap->output_base =3D 0;
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);

Here we're doing an endianness conversion on iort_node_offset.

Overall something is weird here, even in the previous version:
if we wrote iort->node_offset with cpu_to_le32(), that implies
that it's little-endian; so why are we reading it with cpu_to_le32()
here rather than le32_to_cpu() ?
Both cpu_to_le32() and le32_to_cpu() are the same operation,
mathematically, but we should use the version which indicates
our intent, ie which of source and destination is the always-LE
data, and which is the host-order data.

>      }
>
>      /* Root Complex Node */
> @@ -479,9 +485,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
>          idmap->output_reference =3D cpu_to_le32(smmu_offset);
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference =3D cpu_to_le32(iort->node_offset);
> +        idmap->output_reference =3D cpu_to_le32(iort_node_offset);
>      }
>
> +    /*
> +     * Update the pointer address in case table_data->data moves during =
above
> +     * acpi_data_push operations.
> +     */
> +    iort =3D (AcpiIortTable *)(table_data->data + iort_start);
>      iort->length =3D cpu_to_le32(iort_length);
>
>      build_header(linker, table_data, (void *)(table_data->data + iort_st=
art),

This could just use 'iort' now, right?

> --

thanks
-- PMM

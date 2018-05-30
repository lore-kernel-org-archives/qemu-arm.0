Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4506057wre;
        Wed, 30 May 2018 02:03:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLOKaFVg6VumKelOp/y1aM35WC2mjrZ1PL6Vrzom0qRwhKZaTvboLjvpEWcBvoAWKmijmcJ
X-Received: by 2002:ac8:4312:: with SMTP id z18-v6mr1648810qtm.417.1527671037531;
        Wed, 30 May 2018 02:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527671037; cv=none;
        d=google.com; s=arc-20160816;
        b=GF6UikAHLeWtI4T+hRDUT9qBXUdgygy2JTeObjHST5mwBrNfELenm1lR3VwdWMVpNQ
         0hUAZNcvSSAytVnrh1lBNXnK1V9YxAsG+2i10yq9JRo1YsDk36vJwwxJ0vKaNN5nN2yo
         MpgcHbsYSw8vAxA4s+axysg0lA+tM9iHXclNBaeo3bmJt1pvg2YUwnPW25+2qLlMeQKW
         Tf4UBM2bv25W+nAmBf1Pb7YgxNcC2+2RjDxjLG6yx9Nvy16UZb0y+cSQwUW5tgM8QWoI
         jbsCIUcjggZa0kU/BDrua+VLB2oZ6/GpVR8fh61uKLKpbJpQOiR20SY5cIk/OV77DP/R
         c85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=on+909E7DumSJFHRJvwCaep8hANiaVgTtdooLi97Nd0=;
        b=Fyes12sCvpva8KpjMoeKkcqI/YuVqMVNmwVM0aD9b6U0ZKoy5KI2Ea/N9eWPWif+7u
         STqosGhu2+0xPVzexoXMR5T7c60H2ORn6beGIPntrTay34mvvQzCdGI/6uz2DC+Tbdmv
         LcstUdyJ4yGQ/q+a5iXMMR28gvRNSZtbedhPauYr8NqhuDiE0cxPUOUnqYUqPWQ5co0V
         ebNgPtZUDlgFew8J6NEtAFqTwhAK075wxYXRS2hh6tHBhYAhRy5dorsCQRqJFsHSLOFH
         iJalO7hfQiFZyba/ueX06X0tRaXw9NpjUnSEJz14ae6zOAubR25D0Y+6tdwRX5G+NHYm
         9bXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42-v6si941630qvk.274.2018.05.30.02.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 02:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNx1R-000674-48
	for alex.bennee@linaro.org; Wed, 30 May 2018 05:03:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNx1B-00063q-RL
	for qemu-arm@nongnu.org; Wed, 30 May 2018 05:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNx15-0001iw-PG
	for qemu-arm@nongnu.org; Wed, 30 May 2018 05:03:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59514 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNx15-0001iL-Kl; Wed, 30 May 2018 05:03:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1999BB415;
	Wed, 30 May 2018 09:03:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3656B59A;
	Wed, 30 May 2018 09:03:32 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527663951-14552-1-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e6827289-812c-eb87-ad52-43094917bb7f@redhat.com>
Date: Wed, 30 May 2018 11:03:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1527663951-14552-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 09:03:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 09:03:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] ARM: ACPI: Fix
 use-after-free due to memory realloc
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
	f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3t8iXBWzSui9

Hi Shannon,

On 05/30/2018 09:05 AM, Shannon Zhao wrote:
> acpi_data_push uses g_array_set_size to resize the memory size. If there
> is no enough contiguous memory, the address will be changed. So previous
> pointer could not be used any more. It must update the pointer and use
> the new one.
> 
> Also, previous codes wrongly use le32 conversion of iort->node_offset
> for subsequent computations that will result incorrect value if host is
> not litlle endian. So use the non-converted one instead.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> V3: Fix typo and add some words in commit message to explain another bug
> ---
>  hw/arm/virt-acpi-build.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 92ceee9..74f5744 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiIortItsGroup *its;
>      AcpiIortTable *iort;
>      AcpiIortSmmu3 *smmu;
> -    size_t node_size, iort_length, smmu_offset = 0;
> +    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
>      AcpiIortRC *rc;
>  
>      iort = acpi_data_push(table_data, sizeof(*iort));
> @@ -413,7 +413,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      iort_length = sizeof(*iort);
>      iort->node_count = cpu_to_le32(nb_nodes);
> -    iort->node_offset = cpu_to_le32(sizeof(*iort));
> +    /*
> +     * Use a copy in case table_data->data moves during acpi_data_push
> +     * operations.
> +     */
> +    iort_node_offset = sizeof(*iort);
> +    iort->node_offset = cpu_to_le32(iort_node_offset);
>  
>      /* ITS group node */
>      node_size =  sizeof(*its) + sizeof(uint32_t);
> @@ -429,7 +434,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          int irq =  vms->irqmap[VIRT_SMMU];
>  
>          /* SMMUv3 node */
> -        smmu_offset = iort->node_offset + node_size;
> +        smmu_offset = iort_node_offset + node_size;
>          node_size = sizeof(*smmu) + sizeof(*idmap);
>          iort_length += node_size;
>          smmu = acpi_data_push(table_data, node_size);
> @@ -450,7 +455,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->id_count = cpu_to_le32(0xFFFF);
>          idmap->output_base = 0;
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +        idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
>      /* Root Complex Node */
> @@ -479,9 +484,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->output_reference = cpu_to_le32(smmu_offset);
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +        idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
> +    /*
> +     * Update the pointer address in case table_data->data moves during above
> +     * acpi_data_push operations.
> +     */
> +    iort = (AcpiIortTable *)(table_data->data + iort_start);
>      iort->length = cpu_to_le32(iort_length);
>  
>      build_header(linker, table_data, (void *)(table_data->data + iort_start),
> 

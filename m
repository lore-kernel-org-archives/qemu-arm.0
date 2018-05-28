Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2252648wre;
        Mon, 28 May 2018 02:08:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJmzCxYmBDxhRImaY2WqoL2d105HMRjaPX7v508yi2hG0jRq0noibfRanIOatpGIoGWcx3Y
X-Received: by 2002:a37:af05:: with SMTP id y5-v6mr10637461qke.55.1527498482595;
        Mon, 28 May 2018 02:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527498482; cv=none;
        d=google.com; s=arc-20160816;
        b=drmOOqq/70uMAAy0sYkm5QlfLUBruPWnTtFWT67OrIon3psqB+3ZosfZGgN96+oiiD
         7cPJX41ogxGRQqN4Plp2fKfdnYPOgEl1yN6Joo8ZsBLqZ+LN5iWCU49o2TnB3E6cmTVf
         2Ca5EvRY5l6oXjDXWRIRAes78KNQbWFbdqV+1H2Kq5wAkgdpT1QFHUmuk9NlYjFMXTVW
         meEz0vtYbfuyV0aLKIpwWJz7NvSSBKzYpPWIRjp4TFXtcamMTpIVQ6XIFiUwMuPJ2Pu9
         c1ucEVfAKBD8WD2M7CGMvF323sp6wBW4AVirVHFsUHMSxVYNof0klcQUbNQJhDPLnH1t
         kPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=46qQsEvUuu/UiOVrwowmwEt8lF4nzgg3P5BHDfuYXBI=;
        b=qg/cj4TvXY4cRwjyPfIcGUjk3ZA3v4mdh99epOt94Hp8sf/xu6zcX0O6wlRqgBGpVV
         YGlLdElDo3uEY5KYNRxnNZTbCZC+p8Hwu8ZLW+U3etsMs7lt1FHt7t04Cs2aE5WCaoVS
         x52zbejdAJUFGhsAOgshTs0v2Tdj70JKHkMSDwmiXyr8F9/vG3a+JhIMkvYVwDh54lUS
         VjT9ni1EnKZOJASRPZRT/IV5DJM7o/Q21VslJ2SG5NQXW8J/Fnk2yucpdfjhNEtfrlI8
         U09TOAClWAv9TuDQaxE/Z70q7819Zr7ugn47r8yIEA9OT+RQVJjvghPCUTWd2WZKcD2J
         07gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q36-v6si1748205qtf.211.2018.05.28.02.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 02:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNE8I-0005Hx-4V
	for alex.bennee@linaro.org; Mon, 28 May 2018 05:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNE83-0005Hk-6w
	for qemu-arm@nongnu.org; Mon, 28 May 2018 05:07:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNE82-0006za-1v
	for qemu-arm@nongnu.org; Mon, 28 May 2018 05:07:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41780 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNE81-0006yZ-SF; Mon, 28 May 2018 05:07:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4926402243B;
	Mon, 28 May 2018 09:07:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A1611C730;
	Mon, 28 May 2018 09:07:43 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org
References: <1527496946-12036-1-git-send-email-zhaoshenglong@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b26a7a34-7090-b108-0b96-e4dd6ab09017@redhat.com>
Date: Mon, 28 May 2018 11:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1527496946-12036-1-git-send-email-zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 28 May 2018 09:07:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 28 May 2018 09:07:44 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH] ARM: ACPI: Fix use-after-free due to memory
 realloc
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l0Oud9P452TV

Hi Shannon,

On 05/28/2018 10:42 AM, Shannon Zhao wrote:
> acpi_data_push uses g_array_set_size to resize the memory size. If there
> is no enough contiguous memory, the address will be changed. So previous
> pointer could not be used any more. It must update the pointer and use
> the new one.
> 
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 92ceee9..30584ee 100644
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
> @@ -414,6 +414,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      iort_length = sizeof(*iort);
>      iort->node_count = cpu_to_le32(nb_nodes);
>      iort->node_offset = cpu_to_le32(sizeof(*iort));
> +    iort_node_offset = iort->node_offset;
>  
>      /* ITS group node */
>      node_size =  sizeof(*its) + sizeof(uint32_t);
> @@ -429,7 +430,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          int irq =  vms->irqmap[VIRT_SMMU];
>  
>          /* SMMUv3 node */
> -        smmu_offset = iort->node_offset + node_size;
> +        smmu_offset = iort_node_offset + node_size;
>          node_size = sizeof(*smmu) + sizeof(*idmap);
>          iort_length += node_size;
>          smmu = acpi_data_push(table_data, node_size);
> @@ -450,7 +451,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->id_count = cpu_to_le32(0xFFFF);
>          idmap->output_base = 0;
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +        idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
>      /* Root Complex Node */
> @@ -479,9 +480,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          idmap->output_reference = cpu_to_le32(smmu_offset);
>      } else {
>          /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort->node_offset);
> +        idmap->output_reference = cpu_to_le32(iort_node_offset);
>      }
>  
> +    /*
> +     * Update the pointer address in case table_data->data moved during above
> +     * acpi_data_push operations.
> +     */
> +    iort = (AcpiIortTable *)(table_data->data + iort_start);
>      iort->length = cpu_to_le32(iort_length);
>  
>      build_header(linker, table_data, (void *)(table_data->data + iort_start),
> 

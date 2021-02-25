Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp270251lfg;
        Thu, 25 Feb 2021 03:39:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6APHCMtYNRoz4Y4GPhwLXbejLxqkzI9UgNJwfzA9zkODvB6dSdPafynF50VWGr2JKUn8s
X-Received: by 2002:a05:6e02:1c83:: with SMTP id w3mr2215847ill.216.1614253140293;
        Thu, 25 Feb 2021 03:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614253140; cv=none;
        d=google.com; s=arc-20160816;
        b=hWiPl5DwiNYwpDWQfclUl7wtvXNSFiYUlxtKnMxhXwWKbK5x6dES9BmHNoWCBlaTp1
         AdxppDIvHrRn5pPHw8qfr4aUu76OgbKWAyWtAwffcOKx5DvwwUAdt314u2dkFbrUxCvY
         Z3ObooQzyHJWC5CgcTTq7X4eE5f4K+u07SjfK6tjt5DzFfcqV7MSPA0YgsXxa3hmz7iT
         Tsq8kh5OA/KjFDVAQvi4/i9as94jirAuOBbhfjCXN36vdKqxMHj0NekefurnXzUKA07G
         45pu8Qk0xkCMUcI4EqH8NldCxpseJs4lvG6IG3qjLN3aIeOsIB3+acUhJlRgxh/9mSiW
         onIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1ajb5YcAmvG9/g+LdUjj8IazMkzWsCmYcih1JrREzrI=;
        b=ZcpjLsQYk2ok+XJyZwHvAoIhCgioKCsGhaX4Zkmabc+h1WLzUOVxfFNbAWCZYANX3D
         d3zVmnPR1NjPpzLcgKQ4e+2Wjj2SdQ1JzrqoMrR7DLcAxas1rzTBkGrxqbYhVkxCr2X4
         poasbLsDJMDy8+MnzfMyv/Jkfwd9qW2klfdQAiJ+e8MnzGqtF+RD4qurhT1isUhJ61mO
         82x/7QhYw9rjj7BnQE8H6QlfHAT9arblwMFQKuFhPTJRi+6T+q9XkTuDx5pdEw8GY/5L
         h175AGlsQ4NE9e+NgMMVXhKp2GokBXE29K5/pNJX/Yv8Md5szAV6+lVd3E8ztj53arjA
         RnIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YPc4zN6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si4898555ilh.81.2021.02.25.03.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:39:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YPc4zN6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEyx-000422-Jo
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFEyd-00040y-NL
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 06:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lFEya-0000Jk-2z
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 06:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614253114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1ajb5YcAmvG9/g+LdUjj8IazMkzWsCmYcih1JrREzrI=;
 b=YPc4zN6VDCyzDaFrLxTZ3OAMqUsIP8s/d9FEgMT8KY6oPAr1GbXuYKvXFYjRxOEs2C5o+U
 1vDv1eC7XNliNbn4gWVCxQw5UnJ+JbzBrUf9QfBc7CdoK5WkjLlAqaV0bwCtMoTiakZFil
 P8uPxxOWpfqM689GdyWwfN9AJnRUAwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-kssg-68uOY2fEZ6_id56Tg-1; Thu, 25 Feb 2021 06:38:31 -0500
X-MC-Unique: kssg-68uOY2fEZ6_id56Tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D32EB80198D;
 Thu, 25 Feb 2021 11:38:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E95F55D9DD;
 Thu, 25 Feb 2021 11:38:20 +0000 (UTC)
Date: Thu, 25 Feb 2021 12:38:17 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH 5/5] hw/arm/virt-acpi-build: add PPTT table
Message-ID: <20210225113817.xdctmgp3icrhjhrf@kamzik.brq.redhat.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
 <20210225085627.2263-6-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210225085627.2263-6-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, salil.mehta@huawei.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IJ8n4MhcfDuk


This is just [*] with some minor code changes

[*] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11

so it's disappointing that my name is nowhere to be found on it.

Also, the explanation of the DT and ACPI differences has been
dropped from the commit message of [*]. I'm not sure why.

Thanks,
drew

On Thu, Feb 25, 2021 at 04:56:27PM +0800, Ying Fang wrote:
> Add the Processor Properties Topology Table (PPTT) to present
> CPU topology information to the guest. A three-level cpu
> topology is built in accord with the linux kernel currently does.
> 
> Tested-by: Jiajie Li <lijiajie11@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 50 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bb91152fe2..38d50ce66c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -436,6 +436,50 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>  
> +static void
> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0, cpus = 0, socket = 0;
> +    MachineState *ms = MACHINE(vms);
> +    unsigned int smp_cores = ms->smp.cores;
> +    unsigned int smp_threads = ms->smp.threads;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_socket_hierarchy(table_data, 0, socket);
> +
> +        for (core = 0; core < smp_cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (smp_threads <= 1) {
> +                build_processor_hierarchy(table_data,
> +                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
> +                                          ACPI_PPTT_ACPI_LEAF_NODE,
> +                                          socket_offset, uid++);
> +             } else {
> +                build_processor_hierarchy(table_data,
> +                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID,
> +                                          socket_offset, core);
> +                for (thread = 0; thread < smp_threads; thread++) {
> +                    build_thread_hierarchy(table_data, core_offset, uid++);
> +                }
> +             }
> +        }
> +        cpus += smp_cores * smp_threads;
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + pptt_start), "PPTT",
> +                 table_data->len - pptt_start, 2,
> +                 vms->oem_id, vms->oem_table_id);
> +}
> +
>  /* GTDT */
>  static void
>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -688,6 +732,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      unsigned dsdt, xsdt;
>      GArray *tables_blob = tables->table_data;
>      MachineState *ms = MACHINE(vms);
> +    bool cpu_topology_enabled = !vmc->no_cpu_topology;
>  
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
> @@ -707,6 +752,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (ms->smp.cpus > 1 && cpu_topology_enabled) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, vms);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> -- 
> 2.23.0
> 
> 


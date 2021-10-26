Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp1251291lfn;
        Tue, 26 Oct 2021 02:50:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj25kezQPGVkOaDicW43XIlqa0xEJrIkA2xhrR29hPNDi+V/3ZLUZR7zme0E+vvmP4wU91
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr15705211oia.95.1635241805288;
        Tue, 26 Oct 2021 02:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635241805; cv=none;
        d=google.com; s=arc-20160816;
        b=EsCUnd5yXk6VC0JbELXqiAgzVJw9jMCmcRA3c+QaRjSmsD7nu4SPzUwCrGm2EK0gMy
         Kut2b2WTD0kriu1yBmTC/cv/xvxd18MCNmU74B6fBpGYdl0zrrjT145kTBi8zTrXMIXr
         hfBHhdSRHAtU+99WerQjT6nSJTAY8exepqHuPU40HGSeXqNm4ergTwPUDilkkS1EIyFq
         kgMQlLXENWWcXdzsU4M/Foyp5djgyTkuIhd3FkwgxapMkd4LRAookd8AoiSeKwaTNWpa
         /5dTAi83k+T1zsohAMkMc1FX2UIsPJQ93/VP1cZawChitrITe9xVTfxuP7qChNj3Lp1K
         ZSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=gyMDuOEc7FDOanj+B/3W81R+WGSSdcmOgXxWyAqVHl4=;
        b=G/O05eJ02SvktcUPjnp+cMl1a+lWH6WS0IjoJMWdwSZWbkrfrlqgsgTuu9mx5nmQen
         WO9P9Dk8koCabdSypCSehwK2Vsha+oeMoeQCf5Nnho8vxlj2KIZUgoTQVxZkOoOtxti1
         6U9gyApelpo8INOcQuw7coFoFRsfMeNjqpQwuQThj+TFk7mNlmINWH+UnMX01CuZff0L
         dcOFfTzwlwfzsVmaoV14v/IKLzLeUPE68Xk2EOkbVtqGcP35OMx7WyF9u7fceAZ5s4ZV
         ztHY5m+Tzt6aUIq4L7/OGzW+LbuCgAO4HN5XiOuZM2eBesB6E0Ww1qu78jE77mAGh35s
         JbhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QwJgBeci;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si25056772otk.204.2021.10.26.02.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 02:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QwJgBeci;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfJ5o-00063f-FI
	for alex.bennee@linaro.org; Tue, 26 Oct 2021 05:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfJ3m-0004aG-8X
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:47:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfJ3k-0007YZ-Kk
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635241675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyMDuOEc7FDOanj+B/3W81R+WGSSdcmOgXxWyAqVHl4=;
 b=QwJgBeciRqA2kTY5GNADF4Mt6HgQ+pwLxTM38uuBRL3/DI0TIC0hd+DFSgsOTarRcVRkfO
 9Eds5JDK6YpNSneBmez7+gYHTnvsF1Z51B6xi/Z2fQcJA7D2Ho0FXwvfh92u5plQeRqgy4
 xmfw++73S2YISkibNaD0TOeo3JkJRJQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-C5yZDn_sMKKKwL3dbigWRQ-1; Tue, 26 Oct 2021 05:47:54 -0400
X-MC-Unique: C5yZDn_sMKKKwL3dbigWRQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y3-20020a056402358300b003dd490c775cso3280444edc.22
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 02:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gyMDuOEc7FDOanj+B/3W81R+WGSSdcmOgXxWyAqVHl4=;
 b=x4OCG4NYT9ojTC+LVAa4T5/iKSdF9e0umAgbwWcXSh3m9oXZjQoQC2w16SNUbdbkKw
 Dhb34YlI2wdFeSQhc2LadDPljlPTgWISYMF79nQZUGNPhU9hecvzYVCesXJHY8bSt782
 oGt2BJo11gsH9TDBjpUoAh0mmvIJtRDd7buGD6iVvbCxW5JyBW02toGkLEtjdrMXo/An
 y9+AGB8uEUZz5JWs+JFi5DPQgt8QCA9WkJJAGLMuGz/EwmhcZH9PevuNsv28ZxPGY96J
 V5VdRZ+3p7f5YJjGIwYTLLfaM4VxC8FHS7Uf7oIPR8vxh/FpdrVAXXOukCiQMyOUO6Jq
 D+rw==
X-Gm-Message-State: AOAM533rrBWM9CJpJUUjQjAhHAOjKUkZkHiZFbUpmBCu8d4Z1QqUfRaI
 t/unkVXN2HRtVrszu5ONYSwD0DG8ltR9nG1mzzL4zEzZIiU1hqDFvE6RDoeZWDdyqxoa7d9JaPq
 85CNxiKiSLN9x83Q=
X-Received: by 2002:a17:907:3f17:: with SMTP id
 hq23mr28907213ejc.312.1635241673282; 
 Tue, 26 Oct 2021 02:47:53 -0700 (PDT)
X-Received: by 2002:a17:907:3f17:: with SMTP id
 hq23mr28907193ejc.312.1635241673045; 
 Tue, 26 Oct 2021 02:47:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id yd8sm4120930ejb.33.2021.10.26.02.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:52 -0700 (PDT)
Date: Tue, 26 Oct 2021 11:47:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211026114751.427205bc@redhat.com>
In-Reply-To: <20211025234101.224705-1-gshan@redhat.com>
References: <20211025234101.224705-1-gshan@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DbYomllasqij

On Tue, 26 Oct 2021 07:41:01 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The empty NUMA nodes, where no memory resides, aren't exposed
> through ACPI SRAT table. It's not user preferred behaviour because
> the corresponding memory node devices are missed from the guest
> kernel as the following example shows, and memory can't be hot
> added to these empty NUMA nodes at later point.

a error message one gets would be useful here.

btw:
memory hotplug seems to work for x86 without adding empty nodes.
So it beg a question, if absence of empty nodes is the issue here.

> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=512M            \
>   -object memory-backend-ram,id=mem1,size=512M            \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>   -numa node,nodeid=2                                     \
>   -numa node,nodeid=3                                     \
>      :
>   guest# ls /sys/devices/system/node | grep node
>   node0
>   node1
>   node2
> 
> This exposes these empty NUMA nodes through ACPI SRAT table. With
> this applied, the corresponding memory node devices can be found
> from the guest. Note that the hotpluggable capability is explicitly
> given to these empty NUMA nodes for sake of completeness.
> 
>   guest# ls /sys/devices/system/node | grep node
>   node0
>   node1
>   node2
>   node3
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..a4c95b2f64 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
>      AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> +    MemoryAffinityFlags flags;
>  
>      acpi_table_begin(&table, table_data);
>      build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> @@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      mem_base = vms->memmap[VIRT_MEM].base;
>      for (i = 0; i < ms->numa_state->num_nodes; ++i) {
> -        if (ms->numa_state->nodes[i].node_mem > 0) {
> -            build_srat_memory(table_data, mem_base,
> -                              ms->numa_state->nodes[i].node_mem, i,
> -                              MEM_AFFINITY_ENABLED);
> -            mem_base += ms->numa_state->nodes[i].node_mem;
> +        if (ms->numa_state->nodes[i].node_mem) {
> +            flags = MEM_AFFINITY_ENABLED;
> +        } else {
> +            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
>          }
> +
> +        build_srat_memory(table_data, mem_base,
> +                          ms->numa_state->nodes[i].node_mem, i, flags);
> +        mem_base += ms->numa_state->nodes[i].node_mem;
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {


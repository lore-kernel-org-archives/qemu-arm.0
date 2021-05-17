Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1041301lfm;
        Mon, 17 May 2021 01:02:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOpY/1UFFUCiL0migRsZV2nib98MLf5BceglxwofqqRwzRukbQqyUPBZYc7ot9SQ5mK2nb
X-Received: by 2002:a05:6402:1256:: with SMTP id l22mr35251196edw.207.1621238564422;
        Mon, 17 May 2021 01:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621238564; cv=none;
        d=google.com; s=arc-20160816;
        b=ltuS41uDV0H5PLopV2sp6fwwG0BQb9P3eYxATjfUe2Olm3Wz3pkPEgtBhVAlLcrebT
         mGe5RQu8VO8Tbx3PUC1QHSaCNZkK7RteieUL69VyINEYWudxGGZm32otajTsZ3ucnZH+
         IW5EZpvLkZQq0gJp+ioHEAPJhpNhqWh+a1Cs+MrujE9IpX2342obSzagQi5NwAlwcETV
         qT1yAK3tVvqcwyXJowShEj6sQGKoXyOJpxZ1WFyrQKq+ZOKqE1iVcypXiQsFrfjd8hfl
         UvVETNDNE1HAW6Jv6hiCQOX2b4ZFYyuOvLrd3klYkdoYKwg7i38jSPnxxq61KPyeNT3E
         wNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Z+9DCrLqnF9ak/TnQmUFnii6vJYu6pfro/y+nVbjKzs=;
        b=ZmrkmjLl5ZjWWXOgzzZPnyM+VZwfpLf8h+uPEpn2yewcU1/BldnQuNbt4lrrmZAgnM
         MI0gm7V4Cd3/AJVzQCphw+UAmOSvyREc3GAjEXc10TCEdjashT9SkhgsXuPrjmrG+Vdx
         TVClGBKve56LutTAfVvTPjRTDkSRXmz57SuVSphm3+H6DuqQcbQDETUDTyQxtNVMkQMu
         t6OPMyF9o5b8zJXXKcvQAgLvISRzqLn9djpHIbAJP6Nj31yr7QJgDLxTTS3IXeTWp7qm
         rwfn7s4yU0eKxeAuJR2Jelfb8yzp9KCBV1sFLqahxCd8ydJQyyAsxzmsTgLHUQID7m/5
         mu+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OMqmuAxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si14235625edk.117.2021.05.17.01.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 01:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OMqmuAxQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liYD5-00038o-Gi
	for alex.bennee@linaro.org; Mon, 17 May 2021 04:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liYCu-00038d-V6
 for qemu-arm@nongnu.org; Mon, 17 May 2021 04:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liYCs-0008Ml-Gh
 for qemu-arm@nongnu.org; Mon, 17 May 2021 04:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621238549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+9DCrLqnF9ak/TnQmUFnii6vJYu6pfro/y+nVbjKzs=;
 b=OMqmuAxQn2nCY51UdlSY+Y1abGDqCx2g1DiOqQRqRf1gok126V5qC2Naxl0ABWQlYuOcb/
 wvHJ10WcrNcRZuoZ+Amcho4F3C2HY2N0WYapO9+KPbik7vfTaaImC9Ayq/Iu5oXbdKDyGo
 po7lkFD7IEUqo6uUvIZ5KKv6KYIL3l0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-Ewn9OdnWPmq0axxYNE2Ilw-1; Mon, 17 May 2021 04:02:28 -0400
X-MC-Unique: Ewn9OdnWPmq0axxYNE2Ilw-1
Received: by mail-ed1-f69.google.com with SMTP id
 p8-20020aa7c8880000b029038ce714c8d6so3438387eds.10
 for <qemu-arm@nongnu.org>; Mon, 17 May 2021 01:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z+9DCrLqnF9ak/TnQmUFnii6vJYu6pfro/y+nVbjKzs=;
 b=qcjYJ7RjBbsGH3P7/ajdiYn/GCODDfgkI5zIH9IM5tqbN02LZl1zmEuNW0dG/pJxTw
 MNFSygPjEGJd9ZN0c8kv1XPpC79KxUg6RMTh27AvUezOF+Zc0NXoPfJnI5BN5snVw7Jy
 ovj5HD5ORuWZtbH7pkzU0IMTdM65F0ieWgVEfE/8J39AvtugrdDWQDP5Idf6jmo6Qts/
 x08AQRNZLXFUW8Ewr/J68rnJq7bgW8W2+bGfq/2q1wETPypV62AaUTOLrLjzFYThqI41
 a2Lh9s12+/A0Xgl/ThvWgpVVTz5NKGbhBpgRw8ujRbvydyLa/fLDezb/ZB/u7m04ukgy
 9pCA==
X-Gm-Message-State: AOAM530Fe6W1WYlwRzL0/JC6MaTKUmz4FbuKpQirt9/yRO24/164N2sw
 oxKVOrDvHDWC0Xnj7VENvYdG4+xnAf/mNxZf0AiFC1zQNA7V+BBujj1HgDzZ/CAdtajXfkqnPrS
 vpIgz3ZR7cyfw
X-Received: by 2002:aa7:d843:: with SMTP id f3mr70465942eds.270.1621238546794; 
 Mon, 17 May 2021 01:02:26 -0700 (PDT)
X-Received: by 2002:aa7:d843:: with SMTP id f3mr70465896eds.270.1621238546473; 
 Mon, 17 May 2021 01:02:26 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id h9sm10277489edt.18.2021.05.17.01.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:02:26 -0700 (PDT)
Date: Mon, 17 May 2021 10:02:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 8/9] hw/arm/virt-acpi-build: Generate PPTT table
Message-ID: <20210517080223.sajp445x5qsy57fq@gator.home>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-9-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516102900.28036-9-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ghxvRrjhwfyR

On Sun, May 16, 2021 at 06:28:59PM +0800, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Add the Processor Properties Topology Table (PPTT) to expose
> CPU topology information defined by users to ACPI guests.
> 
> Note, a DT-boot Linux guest with a non-flat CPU topology will
> see socket and core IDs being sequential integers starting
> from zero, which is different from ACPI-boot Linux guest,
> e.g. with -smp 4,sockets=2,cores=2,threads=1
> 
> a DT boot produces:
> 
>  cpu:  0 package_id:  0 core_id:  0
>  cpu:  1 package_id:  0 core_id:  1
>  cpu:  2 package_id:  1 core_id:  0
>  cpu:  3 package_id:  1 core_id:  1
> 
> an ACPI boot produces:
> 
>  cpu:  0 package_id: 36 core_id:  0
>  cpu:  1 package_id: 36 core_id:  1
>  cpu:  2 package_id: 96 core_id:  2
>  cpu:  3 package_id: 96 core_id:  3
> 
> This is due to several reasons:
> 
>  1) DT cpu nodes do not have an equivalent field to what the PPTT
>     ACPI Processor ID must be, i.e. something equal to the MADT CPU
>     UID or equal to the UID of an ACPI processor container. In both
>     ACPI cases those are platform dependant IDs assigned by the
>     vendor.
> 
>  2) While QEMU is the vendor for a guest, if the topology specifies
>     SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>     core-id the same value as a package-id, thus it is not possible
>     to have package-id=0 and core-id=0. This is because package and
>     core containers must be in the same ACPI namespace and therefore
>     must have unique UIDs.
> 
>  3) ACPI processor containers are not mandatorily required for PPTT
>     tables to be used and, due to the limitations of which IDs are
>     selected described above in (2), they are not helpful for QEMU,
>     so we don't build them with this patch. In the absence of them,
>     Linux assigns its own unique IDs. The maintainers have chosen not
>     to use counters from zero, but rather ACPI table offsets, which
>     explains why the numbers are so much larger than with DT.
> 
>  4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>     match the logical CPU IDs, because these IDs must be equal to the
>     MADT CPU UID (as no processor containers are present), and QEMU
>     uses the logical CPU ID for these MADT IDs.
> 
> So in summary, with QEMU as vender for guest, we use sequential integers
> starting from zero for non-leaf nodes without valid ID flag, so that the
> guest will ignore them and use table offsets as the unique IDs. And we
> also use logical CPU IDs for leaf nodes to be consistent with MADT.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 58 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)

Why aren't we adding build_pptt to aml-build.c, like my original patch
does? I don't see anything Arm specific below, at least not if you passed
MachineState instead of VirtMachineState, like my original patch did.

> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4d64aeb865..b03d57745a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -435,6 +435,57 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>  
> +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
> +static void build_pptt(GArray *table_data, BIOSLinker *linker,
> +                       VirtMachineState *vms)
> +{
> +    MachineState *ms = MACHINE(vms);
> +    int pptt_start = table_data->len;
> +    int uid = 0, socket;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_processor_hierarchy_node(
> +            table_data,
> +            (1 << 0), /* ACPI 6.2 - Physical package */
> +            0, socket, NULL, 0);
> +
> +        for (core = 0; core < ms->smp.cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (ms->smp.threads <= 1) {

We can't have threads < 1, so this condition should be == 1.

> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                    socket_offset, uid++, NULL, 0);
> +            } else {
> +                build_processor_hierarchy_node(table_data, 0, socket_offset,
> +                                               core, NULL, 0);
> +
> +                for (thread = 0; thread < ms->smp.threads; thread++) {
> +                    build_processor_hierarchy_node(
> +                        table_data,
> +                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                        core_offset, uid++, NULL, 0);
> +                }
> +            }
> +        }
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
> @@ -719,13 +770,18 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      dsdt = tables_blob->len;
>      build_dsdt(tables_blob, tables->linker, vms);
>  
> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> +    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (!vmc->no_cpu_topology) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, vms);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> -- 
> 2.19.1
>

Thanks,
drew 


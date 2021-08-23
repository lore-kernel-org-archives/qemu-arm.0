Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2319164lfg;
        Mon, 23 Aug 2021 16:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypdwlbmF5A6s94wNiB/Ud0SHsqnjJCNyxMlqjldVFWMlhSUIQ02W65C8skxbxSRO183YUX
X-Received: by 2002:a05:6638:3b0:: with SMTP id z16mr31239248jap.139.1629762796464;
        Mon, 23 Aug 2021 16:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629762796; cv=none;
        d=google.com; s=arc-20160816;
        b=aiIeZNrLUyCTOOG1T1lmdQVpMpp1WzywRhC9O8c2vgdsn/3Qz1YZ2MWc811c+gTf8P
         JyGyc/3cNKpendrbYBeoCgmgSotEpPmcsLR+hW2oChdIXMP8v7bENdoQaNuCiCiaKbVS
         6mjXooHSptiU/8SNaIJXELwtD5z6qZhaNdYy7tHZQIHSkCmKX/+Om5MBkqKqTlpj2LSZ
         Ewyg8MvIdcYtjbDZ4ffS7HUUVQHQzQBXUtFFrBV67PygW18o+9Y+Q1MHJbrBZZMiGucZ
         7YUuKB4YbxziRJEgFS6nrGfJ5UsFAfhE+aU7Q3ieeKnApQuydFo19UD9BO6qG7MJJy9g
         Vc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=mSzsrUAgzzweme1fvECttoFybv5inhhDg6A3JRNW0pc=;
        b=FqVxQULc0F25rKZqmVdbASnk6QVC1hXofT9xkC/yl4YsGiVWx3ePkuJsQP/WO8cjoy
         +VHeVypzqryGtGomvzLFLY7SIRVey+G45CF50mWJ60brHSEEXm4E1Dtb+f+woulbdcSq
         zPvvO7E+qCSZNZG4q13CbhkKIQqAmBzdZ4ZkqfMs2eugbUqVJ1dI6VZ1sdA6Tt7391EW
         GGYL6uKBwbU8t4tI/LuWTcPwbwiZJiXMxDMmdIX/gs2lEUo1MBLjAldxz87N/0NHIX0u
         vUqkpMas7HecbCEpeQ69qpp5IsZuNxhIYI07IvLFDD7EafNv3pPEUnWk5gMepWNXbtcT
         3S9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hsk73qJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si12924560jat.9.2021.08.23.16.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 16:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hsk73qJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIJkg-0000OA-Qc
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 19:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJkC-0000Nc-Ud
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 19:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJk9-00022j-Ol
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 19:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629762760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mSzsrUAgzzweme1fvECttoFybv5inhhDg6A3JRNW0pc=;
 b=Hsk73qJAhILDJva1HDuLcQ7nr6G5oMH8tmQNE9czBS14f0OVKlC9qDiuaDrV3NIBSihSWX
 RukkfzaYz7KS0y1TedBDlIng/kO90RLxHC9XeQJStyfyJ6HPIlAl9ELmfE6ToQ2D/5ZUVU
 5qcdyGccQhwxp9925U3/ogCQWU6JC54=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-WNkSDNUDMQKPlUe_xffubQ-1; Mon, 23 Aug 2021 19:52:38 -0400
X-MC-Unique: WNkSDNUDMQKPlUe_xffubQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 b16-20020a0564022790b02903be6352006cso9562714ede.15
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 16:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mSzsrUAgzzweme1fvECttoFybv5inhhDg6A3JRNW0pc=;
 b=M4D+XyZY866kGkNTYbebDv2r4in8Ij5jhnvPm8Zp5/BTP1d6ee1mI+6bb4TnwWAr5u
 aIoySE47uDyb5BRDetMLRhHTD2wMWSFrPtbhJwpufMq2OhnKz6hJy3jsuaEg/AaXWMuK
 KSnN+r36kMgMrS1FxMrQLrrOrtUe2otO08uZyTsnm6BHy2hZd05SLG5RFTR/ExglxD2D
 UGJpEcuOmNGVX304MlCNaoMKU5/2ftP54nVC5eg8iTOB2uuHTe858ISs5cD2rl1NfCrk
 jeLlLjB0oJaUjtQX/D/pp98IeF1iXBJNXv73NApHhPSx8pWtNB7nvMQcZO2j6gJZlL4f
 sYRQ==
X-Gm-Message-State: AOAM5316Lc1g0hmxDcuAKKi+7wpqlWZSLH/O5xXarzfCIV1Ma9Sk/3Ot
 YPshyJ9IlHSyA7CJhLACh3NcrMU3bodpbX4TWeMA0nmJvt2BHxAQnWC5Jos/Dm4zJOYFZEphyKT
 j7Ikw+PLtZSxB
X-Received: by 2002:a05:6402:d4f:: with SMTP id
 ec15mr40849430edb.353.1629762757820; 
 Mon, 23 Aug 2021 16:52:37 -0700 (PDT)
X-Received: by 2002:a05:6402:d4f:: with SMTP id
 ec15mr40849409edb.353.1629762757610; 
 Mon, 23 Aug 2021 16:52:37 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
 by smtp.gmail.com with ESMTPSA id v8sm8313735ejy.79.2021.08.23.16.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:52:36 -0700 (PDT)
Date: Mon, 23 Aug 2021 19:52:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.2 v5 5/5] hw/acpi/aml-build: Generate PPTT table
Message-ID: <20210823194718-mutt-send-email-mst@kernel.org>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
 <20210805123921.62540-6-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210805123921.62540-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k/EBoXRfiR0M

On Thu, Aug 05, 2021 at 08:39:21PM +0800, Yanan Wang wrote:
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
> So in summary, with QEMU as vender for the guest, we use sequential

vendor?

> integers starting from zero for non-leaf nodes without valid ID flag,
> so that guest will ignore them and use table offsets as unique IDs.
> And we use logical CPU IDs for leaf nodes to be consistent with MADT.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    |  8 +++++-
>  include/hw/acpi/aml-build.h |  3 +++
>  3 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 9fa5024414..aa61c9651e 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1946,6 +1946,56 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>      }
>  }
>  
> +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> +                const char *oem_id, const char *oem_table_id)
> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0;
> +    int socket;
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

A bit better to be detailed:

/* Physical package - represents the boundary of a physical package */


> +            0, socket, NULL, 0);
> +
> +        for (core = 0; core < ms->smp.cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (ms->smp.threads > 1) {
> +                build_processor_hierarchy_node(table_data, 0, socket_offset,

and here:
/* Physical package - does not represent the boundary of a physical package */


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
> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                    socket_offset, uid++, NULL, 0);
> +            }
> +        }
> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + pptt_start), "PPTT",
> +                 table_data->len - pptt_start, 2, oem_id, oem_table_id);
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82..db23306a06 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -790,13 +790,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
> +        build_pptt(tables_blob, tables->linker, ms,
> +                   vms->oem_id, vms->oem_table_id);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index ea74b8f6ed..6c29f853cd 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -466,6 +466,9 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>                                      uint32_t parent, uint32_t id,
>                                      uint32_t *priv_rsrc, uint32_t priv_num);
>  
> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> +                const char *oem_id, const char *oem_table_id);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> -- 
> 2.19.1


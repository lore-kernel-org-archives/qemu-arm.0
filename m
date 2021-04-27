Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4777301lfb;
        Tue, 27 Apr 2021 06:19:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRDP5UADhW/9z7mnjI629fjp4eRMz/8iLcQfya+TSOyLT1minzQwuknmhg/s004Ol3QcdQ
X-Received: by 2002:a05:6602:114:: with SMTP id s20mr11132539iot.102.1619529562900;
        Tue, 27 Apr 2021 06:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619529562; cv=none;
        d=google.com; s=arc-20160816;
        b=JA/oPBic+2QIMrXRHNuuzcMEdAhb2kyE99WxtFaAf2OfbfWEcQuAgVbfm7jZjsRaYd
         ELrJEOsLUjK+ICcD7D2F3sOqlumYLasTkGc/ifxTWz2dpPSoTttZ2cZsYdhixJpBV56z
         p5lqJ+oyoyIPN8kDFgi11mdryOsFnmnqE3H/H1ik0ly/pW+sretOy0hE9jkm1b0Duj01
         x8QdymUQt0z0DkIMc/j3DdoqXrXKnMbTHAMabZoiXaQ5p782YVyhl2lPTitsIExKv3ey
         HdDJn11Ca0NH+BZW1bV0VnTl06KpiVnWlbZdwmC66Oh9sOcp3H7gC6Nnn2cPbAupJJOv
         Ssag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=AUdybMf/Q4jwFBcCNzFosqvpACGUsdOzm5FuTmisMng=;
        b=Wjpa3ADkDilPYilsFRjE1muOvokyZn4baaCTkY+Jfpd1UM4op8meSLq14Y7MyJN8SZ
         jWMumFdamSkriFeH88127oZi4NvLDSsOhxiGLL+J1iJrTBNOyr8ifm17y+Q4vUJ5MRpv
         JTxhDIOxaPUzRvaOwQ2Ek2LqEHEjk6jbKG6sssUlr6Oa27tMqeZ1A7eLpetbQHXLoDot
         3/Skzx2Qri/r5ULZ8FAtgchsF4FQ1aPOra0hU2eC/xaaztAyQct0QtFZTKfhYT63La9x
         WOfp4KqkJEJHRckBkjnCRnz8Hc6l4KKuCb7XeihWrdaYECjaVDdkdTme8Q8gwx6tBbxs
         omig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K911HpHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si3768684ilf.45.2021.04.27.06.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 06:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K911HpHy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbNcY-0007B2-6j
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 09:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbNbm-0006kq-MO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbNbi-0004BX-K5
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619529508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUdybMf/Q4jwFBcCNzFosqvpACGUsdOzm5FuTmisMng=;
 b=K911HpHylAWSl7DK1e08leVYKN1nxBi6rrmknGIGtSzzvZF5O5ikD3AcCgL0QnQci1RhZC
 tpe305XfEluoVDVydYCmU+Bjc8mzTnPrbnQ79osVTbdXTcdIQiFAemkf06gfrhT612tTji
 ruuSO/+x4zoYmCOCMAmgrRbVSl9bf84=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-DNJ-2JxxMzyy-srk0UQ6Uw-1; Tue, 27 Apr 2021 09:18:25 -0400
X-MC-Unique: DNJ-2JxxMzyy-srk0UQ6Uw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so9105330wrm.13
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 06:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AUdybMf/Q4jwFBcCNzFosqvpACGUsdOzm5FuTmisMng=;
 b=fBXEQ9RwnkVH2d0I6rqWyBlkIvE5Pfal3ESteP6By9Ktc5Iq6v5g1vyzvupspoqiZ6
 49sJgZTOLE1TcjT6escWoXJICYMITqIVITNwqyprxf2mt5JUB6B9bpWdvQEd+No+l/1g
 dvpuPpztI3imCLB/gsALjGanwL6IZgPKXzERDBbP1GeNqJrHom7QVRH4cwIkWGUgpXr2
 XjAw1jO8d78n041ENvuYBCGhLCcfvl99cDBrsppfNYAExAOaWFmU2h2/Q/7jYVMO+jQc
 y4aLmd/TjyGDmGuzBC6Aob2cVz0wUOIShVBqudZo1U7seCl+dHmUnMLM9Aorxkk2Pxys
 EAYg==
X-Gm-Message-State: AOAM530zM20LEnUJnccATC3B2QiqqVMukSXYcgumpB1bk/bElt0UCsSh
 a/ppSlYC6+DwmeVoi6QFH164QSiq+JnbTX/Ay+lpnTlov4nVxIN7L84Hgk12KYz00fMXJkW/w+d
 OHADkzUuXVaa9A2w=
X-Received: by 2002:a1c:9d94:: with SMTP id
 g142mr25590162wme.154.1619529504826; 
 Tue, 27 Apr 2021 06:18:24 -0700 (PDT)
X-Received: by 2002:a1c:9d94:: with SMTP id
 g142mr25590133wme.154.1619529504640; 
 Tue, 27 Apr 2021 06:18:24 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id q19sm2564754wmc.44.2021.04.27.06.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 06:18:24 -0700 (PDT)
Date: Tue, 27 Apr 2021 15:18:22 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 3/6] hw/arm/virt-acpi-build: Distinguish possible
 and present cpus
Message-ID: <20210427131822.l6l26tegd44njp2t@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5qilE5ZreUw4

On Tue, Apr 13, 2021 at 04:07:42PM +0800, Yanan Wang wrote:
> From: Ying Fang <fangying1@huawei.com>
> 
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. We then ensure only the present CPUs are enabled in MADT.
> Furthermore, it is also needed if we are going to support CPU
> hotplug in the future.
> 
> This patch is a rework based on Andrew Jones's contribution at
> https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++++----
>  hw/arm/virt.c            |  3 +++
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5a2b2d4cb..2ad5dad1bf 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -61,13 +61,16 @@
>  
>  static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>  {
> -    MachineState *ms = MACHINE(vms);
> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>      uint16_t i;
>  
> -    for (i = 0; i < ms->smp.cpus; i++) {
> +    for (i = 0; i < possible_cpus->len; i++) {
>          Aml *dev = aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        if (possible_cpus->cpus[i].cpu == NULL) {
> +            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
> +        }
>          aml_append(scope, dev);
>      }
>  }
> @@ -479,6 +482,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const int *irqmap = vms->irqmap;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
> +    CPUArchIdList *possible_cpus = MACHINE(vms)->possible_cpus;
>      int i;
>  
>      acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
> @@ -489,7 +493,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version = vms->gic_version;
>  
> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> +    for (i = 0; i < possible_cpus->len; i++) {
>          AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                             sizeof(*gicc));
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> @@ -504,7 +508,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          gicc->cpu_interface_number = cpu_to_le32(i);
>          gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>          gicc->uid = cpu_to_le32(i);
> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        if (possible_cpus->cpus[i].cpu != NULL) {
> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        }
>  
>          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f4ae60ded9..3e5d9b6f26 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2063,6 +2063,9 @@ static void machvirt_init(MachineState *machine)
>          }
>  
>          qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +
> +        /* Initialize cpu member here since cpu hotplug is not supported yet */
> +        machine->possible_cpus->cpus[n].cpu = cpuobj;

Can drop the 'machine->' as possible_cpus is already set to the pointer.

>          object_unref(cpuobj);
>      }
>      fdt_add_timer_nodes(vms);
> -- 
> 2.19.1
> 

Thanks,
drew


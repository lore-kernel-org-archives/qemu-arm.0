Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp4107251lfb;
        Fri, 25 Mar 2022 07:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRG8/3nc08F3TE4A1UjYFwC7sK1cOJqFjcXjlT9lY55edhfx6uDlgpsd4NvPOlKWgxr8iI
X-Received: by 2002:ac8:7f06:0:b0:2e2:dc3f:a8e8 with SMTP id f6-20020ac87f06000000b002e2dc3fa8e8mr6356548qtk.17.1648216895887;
        Fri, 25 Mar 2022 07:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648216895; cv=none;
        d=google.com; s=arc-20160816;
        b=E4ssG2PVmwvgnvC4yHPfFSGXpN3olSm0zHef9HG2WeeEh94C9qCy1fdGRBplQZUzmF
         CijZj/kFW4r3tZf6nl2ia4LTqC5ALEjAIovkZTWNTuFsLLxyQpXLGTFuPYuQ66LMGMgv
         S+KQJ2Gl80t6wrHKCmmNETcz8S7MPetgViPtIsbaCi4/MQhWL0NmyXe/SVm0axmXsZDz
         2u7xRMoJ3JDI/e6sd54VxwS5iqrU+UXai2IDzxq5AhXT481A3HuLPAqQuRPG90x5mmve
         c5uwgruFodkrvWSHG4g3ZttHBlDbYA+4kZhByw+tLjH099GpCSGaR/Ftyykf/BofzozL
         iHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=YjpOERq9jWwPpi8CUhyH6dcTWza9ywp9nT3Q+jWOknE=;
        b=VPLOuuoyb2mK1jY6imcJfePxXCGLt5avx5Vr4qsOEJjQNtpy55lZbPzXsXuzhnd8US
         D3SYgKpKtivPO5YYvzlm7BkoixsRu5k+56MAZ1TzV4KTnHSPBFf3yKbDhS5pa8T8NGo/
         XCo+wLNzEZz9UYHYJ/+5GbLaWw7Jl25HjY2LPnEu8DmdxPdU6Th6XA1CNCAfaeBFZywd
         TGbxhwa59UXM0JFqKmcjZnFm7GsFlyG1D81CZszzxequsG/uJ6w88PZGcX2kr24c+rKo
         rL1S3rr7r7czdiJc1HQQinzlEh6FMy9MDy1TYRXL7NCkoDUyv0yXSLlbZvLLIVsoxvkx
         mEDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KDPuDkl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a0cf0cf000000b00440e46a7d64si1196661qvl.514.2022.03.25.07.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Mar 2022 07:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KDPuDkl2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXkVT-0007XG-7p
	for alex.bennee@linaro.org; Fri, 25 Mar 2022 10:01:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXkUP-0007WE-RU
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 10:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nXkUM-0002dc-7O
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 10:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648216825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjpOERq9jWwPpi8CUhyH6dcTWza9ywp9nT3Q+jWOknE=;
 b=KDPuDkl2weQlO0ggIRPlHlJOphZaS87+jv13vLfJm4rFvcyC12qYk2muDvVBLJMprvI8xE
 u60UDETN0WjZZb9BPzHiC5/tunv4sWW+PHTo6Xcz7r3aoZ92dGIBtiCgbXWKvkM+anv3eQ
 RIk+9mfm5q45Rgso6Xp0FhGpmHm8o70=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-cn0mFnV9P4KvlYEk6Q27jQ-1; Fri, 25 Mar 2022 10:00:24 -0400
X-MC-Unique: cn0mFnV9P4KvlYEk6Q27jQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so4122403ejw.9
 for <qemu-arm@nongnu.org>; Fri, 25 Mar 2022 07:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YjpOERq9jWwPpi8CUhyH6dcTWza9ywp9nT3Q+jWOknE=;
 b=jU20beQwwWDvUViyNrlKErmfMmuTf+CTRknAvlQdCpQBkm0J/c/iRO8XUlYlVJrrGl
 PT8jWosynS2I1DbzEWLiftEzS/dz8YKySA9qv72CNNVnjy5Ge3xHabOQy6/Ks1PVa7Jj
 MmpBW3ApUqIwpclSpjlltJ9xB66euiTKP3ebr2G0w9V7I5OJqoiAk84ryy1AF973Qx0A
 yokSHK/hAH7xzCsEWBQ4P9eDWG0r6GRgp6Zno5xK+GkWSccgquBZGc7TydKvLBQA59QN
 Zy8F1Hq0D57CDp09DxQRDkGh1rF8NjSw0oorQ51tqW4EhMkQroVOjTHpICH9TtIB5hMj
 sroQ==
X-Gm-Message-State: AOAM531P8DBlMHDlNfu1gsiroJKuImluJKLF6c+jP5ndE5qZjz90+NSn
 L2YTHYEq/nS7uPvjQxO+Ytz9zPYN88sSw7yhTAn42F395XJe6QL5qMSEWzew7YccxsIt1k3BQsD
 cEShzgnyse01l
X-Received: by 2002:a17:906:704f:b0:6e0:2ce5:131e with SMTP id
 r15-20020a170906704f00b006e02ce5131emr11193418ejj.246.1648216822857; 
 Fri, 25 Mar 2022 07:00:22 -0700 (PDT)
X-Received: by 2002:a17:906:704f:b0:6e0:2ce5:131e with SMTP id
 r15-20020a170906704f00b006e02ce5131emr11193380ejj.246.1648216822508; 
 Fri, 25 Mar 2022 07:00:22 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a1709067a4200b006db720b1231sm2432250ejo.2.2022.03.25.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 07:00:21 -0700 (PDT)
Date: Fri, 25 Mar 2022 15:00:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 4/4] hw/arm/virt: Unify ACPI processor ID in MADT and
 SRAT table
Message-ID: <20220325150020.0063c782@redhat.com>
In-Reply-To: <20220323072438.71815-5-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: omB+wpmophL6

On Wed, 23 Mar 2022 15:24:38 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The value of the following field has been used in ACPI PPTT table
> to identify the corresponding processor. This takes the same field
> as the ACPI processor ID in MADT and SRAT tables.
> 
>   ms->possible_cpus->cpus[i].props.thread_id

thread-id could be something different than ACPI processor ID
(to be discussed in the first patch).

I'd prefer to keep both decoupled, i.e. use [0 - possible_cpus->len)
for ACPI processor ID as it's done with x86 madt/srat and ACPI CPU
hotplug code. So we could reuse at least the later when implementing
CPU hotplug for arm/virt and it's good from consistency point of view.

> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 449fab0080..7fedb56eea 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -534,13 +534,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      for (i = 0; i < cpu_list->len; ++i) {
>          uint32_t nodeid = cpu_list->cpus[i].props.node_id;
> +        uint32_t thread_id = cpu_list->cpus[i].props.thread_id;
> +
>          /*
>           * 5.2.16.4 GICC Affinity Structure
>           */
>          build_append_int_noprefix(table_data, 3, 1);      /* Type */
>          build_append_int_noprefix(table_data, 18, 1);     /* Length */
>          build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
> -        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
> +        build_append_int_noprefix(table_data,
> +                                  thread_id, 4); /* ACPI Processor UID */
>          /* Flags, Table 5-76 */
>          build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
>          build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
> @@ -704,6 +707,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      int i;
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
>      AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> @@ -725,8 +729,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, vms->gic_version, 1);
>      build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
>  
> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> +    for (i = 0; i < ms->smp.cpus; i++) {
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> +        uint32_t thread_id = ms->possible_cpus->cpus[i].props.thread_id;
>          uint64_t physical_base_address = 0, gich = 0, gicv = 0;
>          uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
>          uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
> @@ -743,7 +748,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, 76, 1);   /* Length */
>          build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>          build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> +        build_append_int_noprefix(table_data,
> +                                  thread_id, 4);        /* ACPI Processor UID */
>          /* Flags */
>          build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
>          /* Parking Protocol Version */


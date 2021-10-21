Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp327072lfc;
        Thu, 21 Oct 2021 06:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYIjtZee4eA2jRPxk6LDDNorB8wP1/rcKwMd+cbUvHrsJtLGwDTNb0uXudC7meWZIDgLEf
X-Received: by 2002:a4a:d8da:: with SMTP id c26mr4545133oov.38.1634823016277;
        Thu, 21 Oct 2021 06:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634823016; cv=none;
        d=google.com; s=arc-20160816;
        b=P34vlhyYJpijUFs3z+WSJdSSAL++2VB7ap/RG6bHW/+uRA8NQJvoMqM+c3C88HQWsy
         zbjIwinPB3y1rGdCSQlmCPoFCfduOb8WRNgqZnTDIGmDaYmndaDD4JsFuzEJNBU7asB+
         clKa8VarcVjUPDqurEeCxhKLG/WH6n27si5pADhHsW8w+vZwqzOHcB7NnKyNfkrT7TnL
         oGgbYJkMOCZqhQ4CLj5n5vNatjiE8L0FU7xWCahvaYHI7qu60HQIyP7VABpwoDGXi9BM
         nwOv6BepewBDxSvFNOt4t6MTr1WCiNLU03NEx/XE8QtWuUUHMI81jhNJhtYHfCh+Qs4p
         9uKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=pw+fqHWiLgylJMx+AQvyoaUGWS9TdC/5B7lKsHL/UC4=;
        b=TMwqIWNjPo/StdBtXyLALP0vqcrmNhaTsQw41TZgN3c4npb1DyuEAT1dTTpG8cg9OP
         +tqDqsAxXIQwmYvMyOBB2kJQyECwfo/rgFqVTBzWhhBxJ9qQnsjfLF3Q/1VvxZI1DZc9
         /9DhG5r5jwyjNBg2ysbwcL9FKkMr3UifK011oXtDsQYZKFmNa3gweMXDskMWISOUJHF7
         F+yeVu1eBPz59Yl0ulXSZt8BZfPhJQ2d64dNgRsGKyKt/tmgg9QpwFZvhwVtOaR8PqKm
         J+72bLhM6HExUCFTGi4N0Mu5SGUfdr3mAPOzUWtphETkHUWOi5olS9E0orbRT3ckgxz9
         Vw5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bOsKyVHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l132si5139005oia.1.2021.10.21.06.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 06:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bOsKyVHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdY99-0004i7-FG
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 09:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdY8x-0004hn-0Z
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdY8t-0002UC-Lp
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 09:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634822997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pw+fqHWiLgylJMx+AQvyoaUGWS9TdC/5B7lKsHL/UC4=;
 b=bOsKyVHRiiLiMClbsDX80dbAcsatU2vyOkBVqIldkwdEyyz5cp4Kl07/bO2SEjYTy3rB0/
 jzHX7Y550ZF9MqVjKkHy39gb61SRddtQQ2fARjrb4tYKb3fcpxpbS6mzh0EjaAObXw5m4N
 2quMYMav1lZpSjNhOgu+ZSLy0j210WE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-wUyq2-x0NcSsvZgptsk0bg-1; Thu, 21 Oct 2021 09:29:54 -0400
X-MC-Unique: wUyq2-x0NcSsvZgptsk0bg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso326433edt.11
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 06:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pw+fqHWiLgylJMx+AQvyoaUGWS9TdC/5B7lKsHL/UC4=;
 b=QNrWR7VuH+7v9+DUMRktICuCPckKgBc8N6uRaN4qSIeEDwE1MFZZCraNtKC3maK9T4
 llDkf/iMmZ+V5HY0o3GElSjiRjJD7ytaQ2sRE5zj5O7Peedc0QAui64SVQSegohDfEM/
 cPqrBxVjOZYt0yWq2xxDV2RdeJkO5SS6TjECHm42UN4xxUl7wFUMw855B+mqncr+ASpc
 lfA7BtHG6xipyH4yFtR0s3h1/XbsqDh5l9xJVn4jzqHEdWio9R/gFAoCkmKtsXGcXJXR
 TZAbnyNuevcd0Lp/4zhfjSPuHw1VRat2KjqXdLon6Xjk3qCmE6JEU+w6+qPtVY2Zlb9w
 FTUQ==
X-Gm-Message-State: AOAM5310WXs2DwR4sldX71ess3Gpn1hXKPs9nZ/yFrYSeNR/pXkHe6zB
 3H9QbC4jqdJOJujoEy9oQgH7dKz0dHr9g9U4WhjjJkgWIA57aoXPxBrRlQVuZc/JS21BodszSZ+
 LOg8g3piorvV0
X-Received: by 2002:a05:6402:34f:: with SMTP id
 r15mr7749939edw.111.1634822992990; 
 Thu, 21 Oct 2021 06:29:52 -0700 (PDT)
X-Received: by 2002:a05:6402:34f:: with SMTP id
 r15mr7749898edw.111.1634822992730; 
 Thu, 21 Oct 2021 06:29:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id hp3sm2148346ejc.61.2021.10.21.06.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:29:52 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:29:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 02/12] hw/i386/pc: Remove x86_iommu_get_type()
Message-ID: <20211021152951.6582b98f@redhat.com>
In-Reply-To: <20211020172745.620101-3-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-3-jean-philippe@linaro.org>
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4gObX4VySpLn

On Wed, 20 Oct 2021 18:27:36 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> To generate the IOMMU ACPI table, acpi-build.c can use base QEMU types
> instead of a special IommuType value.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/x86-iommu.h | 12 ------------
>  hw/i386/acpi-build.c        | 20 +++++++++-----------
>  hw/i386/amd_iommu.c         |  2 --
>  hw/i386/intel_iommu.c       |  3 ---
>  hw/i386/x86-iommu-stub.c    |  5 -----
>  hw/i386/x86-iommu.c         |  5 -----
>  6 files changed, 9 insertions(+), 38 deletions(-)
> 
> diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
> index 9de92d33a1..5ba0c056d6 100644
> --- a/include/hw/i386/x86-iommu.h
> +++ b/include/hw/i386/x86-iommu.h
> @@ -33,12 +33,6 @@ OBJECT_DECLARE_TYPE(X86IOMMUState, X86IOMMUClass, X86_IOMMU_DEVICE)
>  typedef struct X86IOMMUIrq X86IOMMUIrq;
>  typedef struct X86IOMMU_MSIMessage X86IOMMU_MSIMessage;
>  
> -typedef enum IommuType {
> -    TYPE_INTEL,
> -    TYPE_AMD,
> -    TYPE_NONE
> -} IommuType;
> -
>  struct X86IOMMUClass {
>      SysBusDeviceClass parent;
>      /* Intel/AMD specific realize() hook */
> @@ -71,7 +65,6 @@ struct X86IOMMUState {
>      OnOffAuto intr_supported;   /* Whether vIOMMU supports IR */
>      bool dt_supported;          /* Whether vIOMMU supports DT */
>      bool pt_supported;          /* Whether vIOMMU supports pass-through */
> -    IommuType type;             /* IOMMU type - AMD/Intel     */
>      QLIST_HEAD(, IEC_Notifier) iec_notifiers; /* IEC notify list */
>  };
>  
> @@ -140,11 +133,6 @@ struct X86IOMMU_MSIMessage {
>   */
>  X86IOMMUState *x86_iommu_get_default(void);
>  
> -/*
> - * x86_iommu_get_type - get IOMMU type
> - */
> -IommuType x86_iommu_get_type(void);
> -
>  /**
>   * x86_iommu_iec_register_notifier - register IEC (Interrupt Entry
>   *                                   Cache) notifiers
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 81418b7911..ab49e799ff 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2488,6 +2488,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      PCMachineState *pcms = PC_MACHINE(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(machine);
> +    X86IOMMUState *iommu = x86_iommu_get_default();
>      GArray *table_offsets;
>      unsigned facs, dsdt, rsdt, fadt;
>      AcpiPmInfo pm;
> @@ -2604,17 +2605,14 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
>                     x86ms->oem_table_id);
>      }
> -    if (x86_iommu_get_default()) {
> -        IommuType IOMMUType = x86_iommu_get_type();
> -        if (IOMMUType == TYPE_AMD) {
> -            acpi_add_table(table_offsets, tables_blob);
> -            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
> -                            x86ms->oem_table_id);
> -        } else if (IOMMUType == TYPE_INTEL) {
> -            acpi_add_table(table_offsets, tables_blob);
> -            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
> -                           x86ms->oem_table_id);
> -        }
> +    if (object_dynamic_cast(OBJECT(iommu), TYPE_AMD_IOMMU_DEVICE)) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
> +                        x86ms->oem_table_id);
> +    } else if (object_dynamic_cast(OBJECT(iommu), TYPE_INTEL_IOMMU_DEVICE)) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
> +                       x86ms->oem_table_id);
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 9242a0d3ed..91fe34ae58 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1538,7 +1538,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>  {
>      int ret = 0;
>      AMDVIState *s = AMD_IOMMU_DEVICE(dev);
> -    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
>      MachineState *ms = MACHINE(qdev_get_machine());
>      PCMachineState *pcms = PC_MACHINE(ms);
>      X86MachineState *x86ms = X86_MACHINE(ms);
> @@ -1548,7 +1547,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>                                       amdvi_uint64_equal, g_free, g_free);
>  
>      /* This device should take care of IOMMU PCI properties */
> -    x86_iommu->type = TYPE_AMD;
>      if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
>          return;
>      }
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 75f075547f..c27b20090e 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3806,9 +3806,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
>      X86MachineState *x86ms = X86_MACHINE(ms);
>      PCIBus *bus = pcms->bus;
>      IntelIOMMUState *s = INTEL_IOMMU_DEVICE(dev);
> -    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
> -
> -    x86_iommu->type = TYPE_INTEL;
>  
>      if (!vtd_decide_config(s, errp)) {
>          return;
> diff --git a/hw/i386/x86-iommu-stub.c b/hw/i386/x86-iommu-stub.c
> index c5ba077f9d..781b5ff922 100644
> --- a/hw/i386/x86-iommu-stub.c
> +++ b/hw/i386/x86-iommu-stub.c
> @@ -36,8 +36,3 @@ bool x86_iommu_ir_supported(X86IOMMUState *s)
>  {
>      return false;
>  }
> -
> -IommuType x86_iommu_get_type(void)
> -{
> -    abort();
> -}
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 86ad03972e..dc968c7a53 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -98,11 +98,6 @@ X86IOMMUState *x86_iommu_get_default(void)
>      return x86_iommu_default;
>  }
>  
> -IommuType x86_iommu_get_type(void)
> -{
> -    return x86_iommu_default->type;
> -}
> -
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
>  {
>      X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);


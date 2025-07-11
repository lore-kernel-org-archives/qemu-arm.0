Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6813BC8303C
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 12:04:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaCU4-0002h8-Ef; Fri, 11 Jul 2025 08:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uaCTn-0002LG-9z
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 08:03:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uaCTh-00086f-D4
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 08:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752235421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXA23HO/2Tzbznn5FOz78Bw76jvZ5gTQzFqnsZN+oO0=;
 b=QFqTtkCWshyS68UhbFG3S6QQctwnwYq9M4K/KVQ/j62CmboMVWNs8bqiuotHip4l67Z8Gr
 +fnB6SCwOBznEZ+rKs0ymHPhtJg6O9v+/ggHixSftlMUmZ+oXeGcKplj67Ce3IaVrsRyDA
 Gw0ru7QA96k4BbCf7CPe0jqU5eGlS7A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-OxrxPLW4O2i-EcGiCNhPjA-1; Fri, 11 Jul 2025 08:03:40 -0400
X-MC-Unique: OxrxPLW4O2i-EcGiCNhPjA-1
X-Mimecast-MFC-AGG-ID: OxrxPLW4O2i-EcGiCNhPjA_1752235420
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-455b63c2005so3288385e9.3
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 05:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752235419; x=1752840219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXA23HO/2Tzbznn5FOz78Bw76jvZ5gTQzFqnsZN+oO0=;
 b=WUSdHGSf0MJOYSFsZ6hvxzmbKebzuAmRhHpg/RVyODzkDwecN5bgLNap0ewqvBadMT
 LbXp0640+V4LzlXxxXAQHoZcZLucgmt+KuAfO9jErVvbfxfrSnp/Z9f/sKkdyUxjfb6u
 hSH19khytjwbSyj0JYTIT6Egg47WFTZGpOougPtkmTBv8bQo49mnsMKI3y9RadUQEwKy
 CAx8R9TJfgaLHxOu0k85lzHhunCdww+ariNZLBayR6F8SVfEJ+AbTonVA2kfuCsW0tMs
 Ws82B56mz5+dylUMpJ3j4eRw0neaqnxa4/AKjwYOmpLCkrsEBNZ+4NygHCraX3gAoRpa
 4Elw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC9m6XiJVd53XPwFtXVeq/JY3/pm7yW14RoxmORsRT8dZkDPXXMmcG9HeaonP7bPncXVUv6pnE+w==@nongnu.org
X-Gm-Message-State: AOJu0Yzv5jKM4CZnJsmN9F8sON/YTTy4rGKZPCD38wuYRLg+dw61WZ8i
 HEoZLYmR19KwIE2S3gtIH3K8MOjGIdQV7rFXMM4I6Qnq6WElSxleVJvMQWiEEt+CkQRgjfN0BNr
 Xs2ZfpuGXydkxtPRzd477XVaSUdDrok1ILSJnRv+m7B04zVJfJmr4FA==
X-Gm-Gg: ASbGncsPXdPvTZJoDSlYx3N1kkVXLWzpHgdKCnkSjErbQiH708w0gAUbX//7JgixSVJ
 JfyaMEtgrR39m5FKQD6I8D7XncHXk4oAKqFuiYPx8aN7bJi+XrBlZfiPHBGLAuNdCNcpfJkNQvX
 Q4cezvEwYXb4f56NG+uMsu1drh4Oprw4eKOkF0zbPFj2L7H8gdAYknIHt7ze50WYOMN128IPaLy
 88rM5KJtPs0nBfPxxrsQUJgYmEYi2vmZLK0+4rp2vcRzF1qbKPXmS+wrt3JzC1E8ShTMqL1uJNd
 aooaIljNxTfCbk/agAg8OQ23JOSPww==
X-Received: by 2002:a05:600c:c4a4:b0:445:1984:247d with SMTP id
 5b1f17b1804b1-454ec13b6b3mr24424915e9.7.1752235419342; 
 Fri, 11 Jul 2025 05:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCn+VOzDMzKSTX1ArxhlHZjwfb2plkTBgcMQosYIv8cqDm3ZzGdB0WAee3NHncWE+ig861sw==
X-Received: by 2002:a05:600c:c4a4:b0:445:1984:247d with SMTP id
 5b1f17b1804b1-454ec13b6b3mr24423965e9.7.1752235418567; 
 Fri, 11 Jul 2025 05:03:38 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd541abfsm44497865e9.33.2025.07.11.05.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 05:03:38 -0700 (PDT)
Date: Fri, 11 Jul 2025 14:03:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, Jonathan.Cameron@huawei.com,
 gustavo.romero@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v6 21/36] hw/arm/virt-acpi-build: Let non hotplug ports
 support static acpi-index
Message-ID: <20250711140335.7ba3c87c@fedora>
In-Reply-To: <20250708142437.1344644-22-eric.auger@redhat.com>
References: <20250708142437.1344644-1-eric.auger@redhat.com>
 <20250708142437.1344644-22-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NqbyjcajiiIBu6xklY9jeoZf6WNPHuyLXMvuvnc-Dd0_1752235420
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue,  8 Jul 2025 16:23:03 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index
> 
> Add the requested ACPI bits requested to support static acpi-index
> for non hotplug ports.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 12 ++++++++++++
>  hw/arm/Kconfig           |  2 ++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index a2f31be9ec..1f936516b3 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -34,6 +34,7 @@
>  #include "hw/core/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pcihp.h"
>  #include "hw/nvram/fw_cfg_acpi.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
> @@ -883,6 +884,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const int *irqmap = vms->irqmap;
>      AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> +    Aml *pci0_scope;
>  
>      acpi_table_begin(&table, table_data);
>      dsdt = init_aml_allocator();
> @@ -936,6 +938,16 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      aml_append(dsdt, scope);
>  
> +    pci0_scope = aml_scope("\\_SB.PCI0");
> +
> +    aml_append(pci0_scope, build_pci_bridge_edsm());
> +    build_append_pci_bus_devices(pci0_scope, vms->bus);

> +    if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
> +        build_append_pcihp_slots(pci0_scope, vms->bus);
> +    }
this part seems to be hotplug specific, is it really necessary in this patch?

> +
> +    aml_append(dsdt, pci0_scope);
> +
>      /* copy AML table into ACPI tables blob */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>  
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6ea86534d5..50153331ed 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -34,6 +34,8 @@ config ARM_VIRT
>      select ACPI_HW_REDUCED
>      select ACPI_APEI
>      select ACPI_VIOT
> +    select ACPI_PCIHP
> +    select ACPI_PCI_BRIDGE
>      select VIRTIO_MEM_SUPPORTED
>      select ACPI_CXL
>      select ACPI_HMAT



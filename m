Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2497604lfk;
        Tue, 25 Jan 2022 02:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2tkmWatvSelMi6Fttl4vw8+upTpE1E0F1jnpNfFA1mmfFu5C19Ql8M0af5KCK3Oebnq5m
X-Received: by 2002:ad4:594f:: with SMTP id eo15mr18975598qvb.33.1643106450454;
        Tue, 25 Jan 2022 02:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643106450; cv=none;
        d=google.com; s=arc-20160816;
        b=quxJPPSHlyiZWwz3o+ZOVg+HvxG9/AepnqnuZXJd5Ft3Ja2xOXOCNIFIysNxCHhAaG
         S+LW5HaleoxYchJ/sCxHzDC20PpBvVvOJHR/InFhtZELKqjA3NdM0XfSonqP6psQYFdM
         +O5dUPmxMdTXIK7zkAVQJ2b/7sch4uo0x8iJ+giY6MOLvp0a0JvQeA3YDZL45I8D/REH
         p5x0bxqUkgPF4yEiHGlDS6xAN4cZlEDuQJS8cMOjR7Sedx4sYIn4R9Jxiofz5BVeBFAW
         L6aP8fpOB4Tiy9qjMgXmzpiZoUZp0m3+Mfi+0R7k6yKmNSmPXSHfcnBj8WyeeOD9ke1X
         8WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=QcZjo/a+B5zu1NVmxX4irODAmEHNtjNwudA/raoQZm8=;
        b=ZdvKC4Y892AwmUXZPFkHrCcoBhv3xGj/8jyaAwRgY/SWlRxkyLjon4jxaUEyzrsEtp
         3JOh93AwzM3dBTfXNPkLqt37YlGkxLWe/uPu+xhOtg9/imOi+ANgH1tJE3md1SwAns5D
         Fc1ePX//rCsOPR2BpeREcPSNH+SVPdefHSMF6W+MvCYNDM2I7xH4Q6Vsqp54mMugoDo9
         wS9PTjMBIoTiqrh21Nd661qAe5QWqS7PtiVQueusaoHObBBOEmJPHhzvcUxWeFnMFcv8
         BQ891VcPnzgv1ri3LouIyASr9X1MH3/bts31TzPOtu0Mo7xVCIX0otnNR+QYeKVWNVnZ
         cwMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HKc5o+Jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si6193928qti.411.2022.01.25.02.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 02:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HKc5o+Jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCJ2v-000715-Vg
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 05:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCJ2J-0006lw-BS
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 05:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nCJ2G-00057j-OX
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 05:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QcZjo/a+B5zu1NVmxX4irODAmEHNtjNwudA/raoQZm8=;
 b=HKc5o+JbeKK+I4gF+QjLDfa58Nx6wxg9DBeK9UsUVeAw0RCj0avBVV1EGKDD9yF0htmt2T
 ga/S46+moIq/9aZkp+7/0MdWaiButEsgEFCPIpLERN4cOGOQapBPKuz9uP0ihCSg6QwmBS
 0ysRgVzGIwCczWtYikT1Ni+b010OhK8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-qirHM75QOreoHPGWeW_7dA-1; Tue, 25 Jan 2022 05:26:07 -0500
X-MC-Unique: qirHM75QOreoHPGWeW_7dA-1
Received: by mail-ej1-f71.google.com with SMTP id
 m21-20020a1709061ed500b006b3003ec50dso3333011ejj.17
 for <qemu-arm@nongnu.org>; Tue, 25 Jan 2022 02:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QcZjo/a+B5zu1NVmxX4irODAmEHNtjNwudA/raoQZm8=;
 b=jYagvcw2DLDr/NsyMD1+trnG0YBIn1j3/hduqSlC8B26AoIFW6B167+8RfBXiu5RVG
 FZ0IBFc5ZhFQsIFdGWk9FUdkUi48FZ0VsVq4ZiEQ1nqYiB99i05B/TXhSdywL9MWCZ3N
 b6mpavPQ72LzRx5Qies6KfhutbkkCZ0uSdBMkRXxUg+6OjkMrCQPP0E0QhvHGe37OUnp
 WRNBlUzqgdtoDX0CfGLhxU3xtAgME5OQ026L3GXBN/Yy20o3AaganuzDIE6LgkYpe63k
 GOxnNchGu0YDyEap9oRIrIdQSTRHIk4hZrn1vSeHbivNEqKb68fUxMrKZHtqkfWWWMmC
 R7FA==
X-Gm-Message-State: AOAM532FD7+Rgb6TwLhgJYZm47yy/ggvtt6Snm5L9Eg1wQ6XbrhHDCL1
 O/LT3a89Mn7ue7erhrZRjrnyWZMwlxHHmzKliXK5OcudPx+1vzUJlhHRT/zNZJVERJPEAHERMyR
 A2YDUZcpJi1Dq
X-Received: by 2002:a17:906:e282:: with SMTP id
 gg2mr16200831ejb.607.1643106366662; 
 Tue, 25 Jan 2022 02:26:06 -0800 (PST)
X-Received: by 2002:a17:906:e282:: with SMTP id
 gg2mr16200818ejb.607.1643106366410; 
 Tue, 25 Jan 2022 02:26:06 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id qp13sm5994017ejb.52.2022.01.25.02.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 02:26:05 -0800 (PST)
Date: Tue, 25 Jan 2022 11:26:03 +0100
From: Andrew Jones <drjones@redhat.com>
To: chenxiang via <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20220125102603.3ssiffsqcyt7tlwr@gator>
References: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Xiang Chen <chenxiang66@hisilicon.com>,
 linuxarm@huawei.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZ1VIz4SZoq0

On Tue, Jan 25, 2022 at 05:15:34PM +0800, chenxiang via wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
> HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Hi Xiang,

What QEMU commands lines have you tested with which Linux guest kernels?

Thanks,
drew

> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  hw/arm/Kconfig           | 1 +
>  hw/arm/virt-acpi-build.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2e0049196d..a3c6099829 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -29,6 +29,7 @@ config ARM_VIRT
>      select ACPI_APEI
>      select ACPI_VIOT
>      select VIRTIO_MEM_SUPPORTED
> +    select ACPI_HMAT
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 449fab0080..f19b55e486 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -42,6 +42,7 @@
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
> +#include "hw/acpi/hmat.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -990,6 +991,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>              build_slit(tables_blob, tables->linker, ms, vms->oem_id,
>                         vms->oem_table_id);
>          }
> +
> +        if (ms->numa_state->hmat_enabled) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_hmat(tables_blob, tables->linker, ms->numa_state,
> +                       vms->oem_id, vms->oem_table_id);
> +        }
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {
> -- 
> 2.33.0
> 
> 


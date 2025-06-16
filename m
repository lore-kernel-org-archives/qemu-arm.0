Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1760650njc;
        Mon, 16 Jun 2025 03:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvKplFmpEh7tmXRaEr7oeyOeknK4GtaEAhkSrOL02NEsTGYph7jjAeRAnK9fsYj/dUnuUOIKj+ZTJUOw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVIWu3Hjd7HJ5lskQK8+xLBqqMzWBBnHzbj+HNPpTm/YNyi1Y5reKAN/329Bf3dqnZ/ZTF
X-Received: by 2002:a05:622a:43:b0:4a3:5ba8:4975 with SMTP id d75a77b69052e-4a73c591506mr118724291cf.15.1750070022515;
        Mon, 16 Jun 2025 03:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750070022; cv=none;
        d=google.com; s=arc-20240605;
        b=PVZTAWV8oyVPhJF3nA/cIAHSxM20mjeknXww7ztDJ60JFNzhfOy/YS5VntiW0727Nd
         5E0GG220z2WCn42JzN/wogQGhupDYnr4XHWHAAeDuerzKuFnKLlG40urqCgf2OIDnRwa
         7HSo2NyGXC2KTThHxCUNdZphUbGmAH2BnUiMT5ACDkjqSD4KfXOXU3bar3fnDF39kQE0
         wX+wgIn0oZUXx+sOMYsyxIxYklxQUkLxNoIQLdNeJ0CD8xSOEa76swHu+6ESlKddKi9o
         OGde+YQIne6DFQSr7YtSe9EKFyexk6CLv9yiUELRE+lO03Abard1YPKy44gw6uhkovlm
         EsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=d6xMuARMA8rdqpyIpWHsF/9EFnU4IB6TmIYKzb2VRWI=;
        fh=aA8gsM5QP8IJIk1ptJlCXNxyLIMaAhKHt/Cf0Wq9DRk=;
        b=gcnwPOR3Dgv0D2kE+Gm1ETANGhMnup9Y5Ofx8OIvncF2pYdNPteeA8PgMX8Nx9lDLJ
         ZxoauO8IjsYG90i36A8wYXV8Zy4HJPTlkp9ZE7P1hjRm5LV7Euj+bSCp0FbCRtMP2j7J
         J3tNXCPJ8PPQYSkbpGHXeHURCgB9SVD/ueUnO92RHD8chgcSTaDBbTCqPT77HRmkh4VG
         aRP9boJWn6Bi2bq4Bry2IvekHhjCPQQnvCJO8Wkx3kEsos0bbQhwrGrs193uYonK8Vq7
         wtABnGTB/KVJFnWnccmN7HgxOeUHRjP9T8R8y9lPwTRbS5Ivn5mu3HZKJ8gIQtU5vDiq
         IGzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2e766asi101351531cf.165.2025.06.16.03.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 03:33:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR79H-00008w-I2; Mon, 16 Jun 2025 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR79F-00008L-Ji; Mon, 16 Jun 2025 06:33:05 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR79C-0007Rf-6H; Mon, 16 Jun 2025 06:33:05 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLR6X3FXCz6L5XG;
 Mon, 16 Jun 2025 18:28:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id E09B114050C;
 Mon, 16 Jun 2025 18:32:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 12:32:53 +0200
Date: Mon, 16 Jun 2025 11:32:50 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 2/7] hw/arm/virt-acpi-build: Re-arrange SMMUv3 IORT
 build
Message-ID: <20250616113236.00007fa4@huawei.com>
In-Reply-To: <20250613144449.60156-3-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C1xmNOth/dWn

On Fri, 13 Jun 2025 15:44:44 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Introduces a new struct AcpiIortSMMUv3Dev to hold all the information
> required for SMMUv3 IORT node and use that for populating the node.
> 
> The current machine wide SMMUv3 is named as legacy SMMUv3 as we will
> soon add support for user-creatable SMMUv3 devices. These changes will
> be useful to have common code paths when we add that support.
> 
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Some trivial stuff inline. Otherwise only comment in passing is that
some of the loop nests are deep enough that it might be worth
considering factoring some of those out as helper functions.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 111 +++++++++++++++++++++++++++------------
>  hw/arm/virt.c            |   1 +
>  include/hw/arm/virt.h    |   1 +
>  3 files changed, 79 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7e8e0f0298..d39506179a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -266,6 +266,36 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>      return idmap_a->input_base - idmap_b->input_base;
>  }
>  
> +struct AcpiIortSMMUv3Dev {
> +    int irq;
> +    hwaddr base;
> +    GArray *idmaps;
> +    /* Offset of the SMMUv3 IORT Node relative to the start of the IORT. */
> +    size_t offset;
> +};
> +typedef struct AcpiIortSMMUv3Dev AcpiIortSMMUv3Dev;

Hmm. This file is a bit inconsistent on style but there are instances of the more
compact

typedef struct AcpiIortSMMUv3Dev {
    int irq;
    hwaddr base;
    GArray *idmaps;
    /* Offset of the SMMUv3 IORT Node relative to the start of the IORT. */
    size_t offset;
} AcpiIortSMMUv3Dev;

> +
> +static void
> +populate_smmuv3_legacy_dev(GArray *sdev_blob)
What Nicolin said here.


> +{
> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
> +    AcpiIortSMMUv3Dev sdev;
> +
> +    sdev.idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    object_child_foreach_recursive(object_get_root(),
> +                                   iort_host_bridges, sdev.idmaps);

Not sure why this wrap. I'd move iort_host_bridges up a line probably.

> +
> +    /*
> +     * There will be only one legacy SMMUv3 as it is a machine wide one.
> +     * And since it covers all the PCIe RCs in the machine, may have
> +     * multiple SMMUv3 idmaps. Sort it by input_base.
> +     */
> +    g_array_sort(sdev.idmaps, iort_idmap_compare);

I'd add a blank line here to make it more clear the comment only (I think)
applies to the one line of code and not this whole block.

> +    sdev.base = vms->memmap[VIRT_SMMU].base;
> +    sdev.irq = vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> +    g_array_append_val(sdev_blob, sdev);
> +}



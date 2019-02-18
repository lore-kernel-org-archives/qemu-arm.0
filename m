Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2063884wrx;
        Mon, 18 Feb 2019 01:01:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IatYARhga5ND34prTj8DxZCz19I4n8ATxlYC6f2PgbMKRibkqQBjbv/CwNZYnrc9p0RaTWS
X-Received: by 2002:a25:e601:: with SMTP id d1mr11567599ybh.181.1550480492322;
        Mon, 18 Feb 2019 01:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550480492; cv=none;
        d=google.com; s=arc-20160816;
        b=h9NPtlFDGhJXy/YdjFDMeHjC68dFRSNVmsFRxTZjBOUhUGEc+iTOHQrjqqyvXS4Xlh
         /Odsnd+7iPMy5bvJRgGiW7ORL2Ki9jgU/wN+vaRy+MxLQFEBBciFPIPLRuR0ETQHM+Mu
         4+SiUW1oDD0EesRYGTjH6PxGQI6BIhzSZBBeSvRR8vYivjFcQdSDNg6qlD4tXc2/7T5F
         d/yPteTxZW2QfezG4atd7jpdwVEV8JeVb2sr1tqr/qMK29E3oAu/2WAo3HrQMMayAz8G
         9DVZM/0JyZD60KptzNrhpUwT+RiGmCfcMDKJY++EnfCG5VRjt6/FdpRTwH2nvWh8KImM
         kdkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=3K8H68cb2vdvF1s+UE+phB9qkv/5ZYXAPbHzIuTVWRc=;
        b=MJyYcPrvDrZ+rdOatJ3xdkhwZC7RdWjbG5Ul8E1QDRpYLHL0v55JDrLkgczLbMeJPC
         el3Sci0DyqzdRHxKjrtXe4POahtfFxFHWExD9s1HpLcnyoOGZyCiSnI7kd4nu2CRfu1E
         lnHZOWHs9Mqc2HpQWu4xoq5g8O9zZPkMlllr/FaaF8pRK7FUwBjZOeMaJpLWL6e+UGCV
         tqgrOlwrK6I8g0YJUyI2MWGiDhFoOSsXFMKbDgYMGiTG5x/ec8nWwy0NnU+fMbFFW5J7
         /KwAw45qz7h814baht63BpLImZ6pT2UpJBm7hOaNla3CfiSMMIklR2GDSWFiQ36/0uvA
         6sAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h189si4968060ybc.109.2019.02.18.01.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 01:01:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvenr-0002kG-P4
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 04:01:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvend-0002fM-BK
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 04:01:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvelO-0004vW-EU
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 03:58:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gvelO-0004uG-4E; Mon, 18 Feb 2019 03:58:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E18F22DE418;
	Mon, 18 Feb 2019 08:58:54 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-41.ams2.redhat.com
	[10.36.112.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21026608C3;
	Mon, 18 Feb 2019 08:58:42 +0000 (UTC)
Date: Mon, 18 Feb 2019 09:58:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190218095838.048819c5@Igors-MacBook-Pro.local>
In-Reply-To: <20190205173306.20483-13-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<20190205173306.20483-13-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 18 Feb 2019 08:58:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/18] hw/arm/boot: Expose
 the PC-DIMM nodes in the DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aOYKNS+bFZTO

On Tue,  5 Feb 2019 18:33:00 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> This patch add memory nodes corresponding to PC-DIMM regions.
s/add/adds/ or s/This patch add/Add/

> 
> NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
> don't need to care about NV-DIMM at this stage.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v3 -> v4:
> - git rid of @base and @len in fdt_add_hotpluggable_memory_nodes
> 
> v1 -> v2:
> - added qapi_free_MemoryDeviceInfoList and simplify the loop
> ---
>  hw/arm/boot.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 2ef367e15b..2a70e8aa82 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -19,6 +19,7 @@
>  #include "sysemu/numa.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> +#include "hw/mem/memory-device.h"
>  #include "elf.h"
>  #include "sysemu/device_tree.h"
>  #include "qemu/config-file.h"
> @@ -526,6 +527,34 @@ static void fdt_add_psci_node(void *fdt)
>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>  }
>  
> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
> +                                             uint32_t acells, uint32_t scells) {
> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
> +    MemoryDeviceInfo *mi;
> +    PCDIMMDeviceInfo *di;
> +    bool is_nvdimm;
> +    int ret = 0;
> +
> +    for (info = info_list; info != NULL; info = info->next) {
> +        mi = info->value;
> +        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
> +        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
> +
> +        if (is_nvdimm) {
> +            ret = -ENOENT; /* NV-DIMM not yet supported */
> +        } else {
> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
> +                                      scells, di->size, di->node);
> +        }
> +        if (ret < 0) {
> +            goto out;
> +        }
> +    }
> +out:
> +    qapi_free_MemoryDeviceInfoList(info_list);
> +    return ret;
> +}
> +
>  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>                   hwaddr addr_limit, AddressSpace *as)
>  {
> @@ -621,6 +650,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          }
>      }
>  
> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
> +    if (rc < 0) {
> +            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
error message is rather vague, user using nvdimms + pc-dimms on CLI won't have
a clue that the former is not supported.
Suggest pass in error_fatal as argument and report more specific error from
fdt_add_hotpluggable_memory_nodes()

does this run on reboot?

> +            goto fail;
> +    }
> +
>      rc = fdt_path_offset(fdt, "/chosen");
>      if (rc < 0) {
>          qemu_fdt_add_subnode(fdt, "/chosen");


Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp750776wrt;
        Mon, 11 Mar 2019 08:07:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKWsJA8GpZrYpUHl82SR3zCSFlgZ7C4I92xYPvUyxIRsdStbY5UPqI3Mk+mawLGW4SRRt3
X-Received: by 2002:a0d:ea85:: with SMTP id t127mr25847451ywe.218.1552316870324;
        Mon, 11 Mar 2019 08:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552316870; cv=none;
        d=google.com; s=arc-20160816;
        b=dCxhLJkKxP5SaeEJcMdW/yxuUZ/O5QA4jRChYD8u8iv0eYychkz6zHPzx4YgwomhiG
         j5nahyLLyOXmf0IZoABlnAQdlVh2chykT9dvG9UmzW/Tw5rg/gMynU2IEfpPmfSEGqbZ
         A97DI5V95DLJpvTnUEAXmqKT9M4QYnIpJhbiLTYLbXNoisnkibBBEhCUqNz1zKXA8cxb
         wBTp23NWLo2IZse4gOZi/loF5B9hmR1e6CojRzPdiBy/z2Lhm6RMT7x27jPXRVGdD7N2
         sOfsanNqirMoOrnmkPMMKO7hs3kn4jZ3lSa27waYTcdB65l0r0Mc1NABLJpqWREGf2ch
         dD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=qtZcijAyls0j7OuOTqn4qwxwIXIfPLG69GGRfSjAa+o=;
        b=G4rhNyqTLIKJC3f/1azTSOV4IaCV2grI2bGNdIKUSpPRcLzYSXmUlRyA9rmtk4PF8n
         RqI1glIMernWcmTzwNdaMG3LF4QykjTHuWj9Y4Mq0j99DEljAaSK/GyN9FawaZvzsZcN
         vtprYh43xlBDCcTfK6Uj2Z5vYjNW5WN8dQZC/9BuULcZm/8CkzJMWBUhGybkSexxEr+y
         3qjEq72qc8SvdyMUscUJyOZOtXuwVQorEyQhWA4ZdY+e+1psZSRWyYYe6uDr67lnxH+i
         +9xklSq3nmIpJfGZrmnFPc9xagFMYi+F88/Ye5pMPNiyZE6vVxvcuT0i8+jWmoEUVzBo
         waLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z131si3171434yba.144.2019.03.11.08.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 08:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3MWr-0004cJ-M7
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 11:07:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3MOR-0006OD-He
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 10:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3MOQ-0003Vj-K6
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 10:59:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28208)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3MOO-0003TB-UX; Mon, 11 Mar 2019 10:59:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C81418110D;
	Mon, 11 Mar 2019 14:59:03 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 249195DD8B;
	Mon, 11 Mar 2019 14:58:58 +0000 (UTC)
Date: Mon, 11 Mar 2019 15:58:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190311155857.78c6703d@redhat.com>
In-Reply-To: <20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 11 Mar 2019 14:59:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM
 nodes in the DT
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, linuxarm@huawei.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, sebastien.boeuf@intel.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tf9dX1h4ctqX

On Fri, 8 Mar 2019 11:42:15 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This patch adds memory nodes corresponding to PC-DIMM regions.
> 
> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
> don't need to care about NVDIMM at this stage.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index a830655..4caaf91 100644
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
> @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>  }
>  
> +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
> +                                             uint32_t acells, uint32_t scells) {
> +    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
> +    MemoryDeviceInfo *mi;
> +    int ret = 0;
> +
> +    for (info = info_list; info != NULL; info = info->next) {
> +        mi = info->value;
> +        switch (mi->type) {
> +        case MEMORY_DEVICE_INFO_KIND_DIMM:
> +        {
> +            PCDIMMDeviceInfo *di = mi->u.dimm.data;
> +
> +            ret = fdt_add_memory_node(fdt, acells, di->addr,
> +                                      scells, di->size, di->node);
> +            if (ret) {
> +                fprintf(stderr,
> +                        "couldn't add PCDIMM /memory@%"PRIx64" node\n",
> +                        di->addr);
> +                goto out;
> +            }
> +            break;
> +        }
> +        default:
> +            fprintf(stderr, "%s memory nodes are not yet supported\n",
> +                    MemoryDeviceInfoKind_str(mi->type));
> +            ret = -ENOENT;
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
> @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          }
>      }
>  
> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
According to Eric's test, guest kernel picks this up. So it probably
should be an opt-in feature to avoid conflict with ACPI definition in DSDT.

> +    if (rc < 0) {
> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> +        goto fail;
> +    }
> +
>      rc = fdt_path_offset(fdt, "/chosen");
>      if (rc < 0) {
>          qemu_fdt_add_subnode(fdt, "/chosen");


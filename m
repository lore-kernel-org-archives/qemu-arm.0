Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6973214wrx;
        Fri, 22 Feb 2019 05:47:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY8hRNZ74w7Cut93vhMU4S4aW5zWkzNUA4HHkLPbarNUB0M2KvaZ6Egcxk0dmfgW6M5w2Kb
X-Received: by 2002:a25:cb54:: with SMTP id b81mr3275339ybg.520.1550843241250;
        Fri, 22 Feb 2019 05:47:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550843241; cv=none;
        d=google.com; s=arc-20160816;
        b=G4KNkBqv9quP5h0LEEdFf6Pvriw1dtYXl3g3FlxOiSeGXJv503i6i1Z/p+RmZ/FNtt
         xjuJ+/i2INX/B1UjK8EivhYpZ/791NBmY3Rm/SehPM1oy8tECjeGzAMxB6Aim6AmBFgr
         zAViF2tuZL25eEbIOYABm8AQMhygkSUqYS5u8Dr7zXfaCA70uYd5djUrpzQ8tWpuj4ob
         sEHAZorc3YqCcyTFILRNt6i3rIJJVip9nw6p9l9Y1KrRd4Pa0zaixa7tPqS5UKwKCcB6
         aLTJAW3EPamm0OhV1qqfRqICCflQ8OzwrLEHRtuzPCtWbiCg8TaBpYS3ZcM/fDJipc7e
         1JIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Dk+7/Wd1dv2JIQHaPz9317wRNRdOngfi9M+on9CMEP4=;
        b=PRjb+L5RfFR+ctAlGR+T2u5Z5Ga6WhpOcBmBhxc7l2w8nQ6nQStE9b8VmILyeAM2GY
         u50imHe7Qi/9QvflSzu6jxKRWs4HDXINHXh1uuL1Mw+PJTqv8Y4Z+W3bYsnp5QioGrMg
         zn+RfbD4MW2Jjc+R0/gayVObNIpJcJQ3ZqVtNnCh8Tn4pOMHGrFlVvdzCWjuIxkkC5rd
         ZZKg3d0EcdpocsL6VgRHDznlYKniXi/Std6pwegfBdY7ToIUS/DSTdTVDzpWxUPQ60va
         7s9C+X8qf4755qNO9KjoyAByFJ6qGosPCwwPmBB8BCkB/I0Gb+uWgz4t6F6DE21+TR0j
         dvWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si773737ybg.149.2019.02.22.05.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 05:47:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxBAe-0006ak-Ll
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 08:47:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxBAG-0005nY-O5
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 08:46:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxAv2-00039Y-Pj
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 08:31:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxAuy-0002E3-Rh; Fri, 22 Feb 2019 08:31:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80F5AC0587DD;
	Fri, 22 Feb 2019 13:30:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0E9A5DA98;
	Fri, 22 Feb 2019 13:30:04 +0000 (UTC)
Date: Fri, 22 Feb 2019 14:30:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222143002.23705904@redhat.com>
In-Reply-To: <20190220224003.4420-12-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-12-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 22 Feb 2019 13:30:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 11/17] hw/arm/boot: Expose the PC-DIMM
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tnjPAPwV6gYJ

On Wed, 20 Feb 2019 23:39:57 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> This patch adds memory nodes corresponding to PC-DIMM regions.
> 
> NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
  ^^^
git grep says it doesn't exists

> don't need to care about NV-DIMM at this stage.
we use NVDIMM term everywhere in QEMU so fix it up just for consistency

> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
with all comments addressed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v6 -> v7:
> - rework the error messages, use a switch/case
> v3 -> v4:
> - git rid of @base and @len in fdt_add_hotpluggable_memory_nodes
> 
> v1 -> v2:
> - added qapi_free_MemoryDeviceInfoList and simplify the loop
> ---
>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index a830655e1a..255aaca0cf 100644
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
> +    if (rc < 0) {
> +            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> +            goto fail;
wrong indent

> +    }
> +
>      rc = fdt_path_offset(fdt, "/chosen");
>      if (rc < 0) {
>          qemu_fdt_add_subnode(fdt, "/chosen");


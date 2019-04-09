Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4851077wrx;
        Tue, 9 Apr 2019 08:09:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIWhYK9AcO5mmO8m1JXtnDbjns3iJEwoIQvSxt/8qv4MEh40H1SiK6v1HPhVB1ksKjDjSh
X-Received: by 2002:a1c:d106:: with SMTP id i6mr20951311wmg.134.1554822580175;
        Tue, 09 Apr 2019 08:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554822580; cv=none;
        d=google.com; s=arc-20160816;
        b=MbueJFyu2eliOP84lMtwmUbEqd93+jA7cZtdjC4TJNF4oVsf8n9lFvS8vfOiBLU1Ib
         FPw7rps3QHW4wcjqZ65FpnM3UjU6W4L4FAALWU67T7Kn9QYmxIQzLaCbJqzd2Sskx0LP
         SU5EJc1GU7l3hJza3Yd3aaumWF3V9EQ6kBN8BT4ibzxKl63VaR+AX02bxLKAKunSOdJl
         7Mor0fmf0aHlpDQ/tlfrzx9WVW4FHFHV+ewZTWJEDR4lYEUTkA/mxHS6Z7FHFcZ76Avw
         4rLL2XwuVMM1XprnfdRv2pqX+swU5TJ0+t6p+unCE621jlbQEmMoFAK2O3H1Ymu4w7ZV
         PFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=gj7Fl3hs27df36fTLuVzSO4mKU1jyHWEhR8h3M2z3zo=;
        b=zFqGqOukavk/WqqleTeB25My9U9YplGltJWfDmSXB0m4vUfraP2yqJcNeYbJAyf3ZR
         bSGGsAaodj9sNqQZqnYc76OqMEZPOJuZplzBRwmXdEvCVY/SuMF3ldfwMM8S2Y/VkZhT
         9ui8TZknGmdTCZ8EIPLDMQg1g8mfBg+Db/To+TH2UZI1xxRunGg0Fp2Etzbjs72wCsbt
         se/kqjbC58zUQ24O5TJmhkqNNlzp++l1aLo9s3AlTbCkEJcLX3/BwV1E78BljiJj57s0
         k+7sydcA181r3eFh6Jsag0oRVoBkyTvTADcmmhy/JYgNH99vNBf5cpEtIxIR3hGDxxBG
         YM0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si21642174wrs.455.2019.04.09.08.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 08:09:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDsNX-0000JQ-64
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 11:09:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hDsNH-0000JG-T2
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 11:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hDsNG-0004OZ-Fg
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 11:09:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hDsNG-0004JX-2R; Tue, 09 Apr 2019 11:09:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07798316769F;
	Tue,  9 Apr 2019 15:09:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-114.rdu2.redhat.com
	[10.10.120.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F39CE642AC;
	Tue,  9 Apr 2019 15:08:58 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger@redhat.com,
	imammedo@redhat.com
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
	<20190409102935.28292-9-shameerali.kolothum.thodi@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4f3df83f-8d45-09d0-ec9e-0ddf843fd3a4@redhat.com>
Date: Tue, 9 Apr 2019 17:08:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190409102935.28292-9-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 09 Apr 2019 15:09:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 8/8] hw/arm/boot: Expose the PC-DIMM nodes
 in the DT
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +c0184/ESynZ

On 04/09/19 12:29, Shameer Kolothum wrote:
> This patch adds memory nodes corresponding to PC-DIMM regions.
> This will enable support for cold plugged device memory for Guests
> with DT boot.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 8c840ba..150e1ed 100644
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
> @@ -538,6 +539,41 @@ static void fdt_add_psci_node(void *fdt)
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
> +            ret = fdt_add_memory_node(fdt, acells, di->addr, scells,
> +                                      di->size, di->node, true);
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
> @@ -637,6 +673,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          }
>      }
>  
> +    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
> +    if (rc < 0) {
> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> +        goto fail;
> +    }
> +
>      rc = fdt_path_offset(fdt, "/chosen");
>      if (rc < 0) {
>          qemu_fdt_add_subnode(fdt, "/chosen");
> 


Given patches #7 and #8, as I understand them, the firmware cannot distinguish hotpluggable & present, from hotpluggable & absent. The firmware can only skip both hotpluggable cases. That's fine in that the firmware will hog neither type -- but is that OK for the OS as well, for both ACPI boot and DT boot?

Consider in particular the "hotpluggable & present, ACPI boot" case. Assuming we modify the firmware to skip "hotpluggable" altogether, the UEFI memmap will not include the range despite it being present at boot. Presumably, ACPI will refer to the range somehow, however. Will that not confuse the OS?

When Igor raised this earlier, I suggested that hotpluggable-and-present should be added by the firmware, but also allocated immediately, as EfiBootServicesData type memory. This will prevent other drivers in the firmware from allocating AcpiNVS or Reserved chunks from the same memory range, the UEFI memmap will contain the range as EfiBootServicesData, and then the OS can release that allocation in one go early during boot.

But this really has to be clarified from the Linux kernel's expectations. Please formalize all of the following cases:

OS boot (DT/ACPI)  hotpluggable & ...  GetMemoryMap() should report as  DT/ACPI should report as
-----------------  ------------------  -------------------------------  ------------------------
DT                 present             ?                                ?
DT                 absent              ?                                ?
ACPI               present             ?                                ?
ACPI               absent              ?                                ?

Again, this table is dictated by Linux.

Thanks
Laszlo

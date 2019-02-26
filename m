Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11293491wrx;
        Tue, 26 Feb 2019 09:09:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib7nOF1o1j7umNcsqlGS8WKGjzEPDIgo3Kqdek8boSagI+g8cmVwFWwuQRRYp7D5x/WOfco
X-Received: by 2002:a25:e6d3:: with SMTP id d202mr13223344ybh.385.1551200968034;
        Tue, 26 Feb 2019 09:09:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551200968; cv=none;
        d=google.com; s=arc-20160816;
        b=VyGETmSxRlRT6pQzee1RXoVm6LiIkc8arkS0aHFJQKXfFNeRf4YJnR20C9fnFEniTD
         u/4fgYCXH6MIosrxiBqjlQZlOcNol2MQKUIR+o7AwfJCTWfSmJZ34Qo+XoWjgml1wlQq
         ndcUghjcXhzhs9z3HKE93ccEzfRgFW608BFF5AhHFFf+xfviGPF+SmHY/schFm9lIAe4
         XlouA/5L/uKNN8RCQyIG5Ex2cACz+a30OmmSKzFnkZdIYMbpgt0Xb9JTPHMBsKDQz1w9
         Ljl0/mu/YDWZ9PhHAjhPc7/9408oL8dGPwZHZxPESXeqhyMRQfgafYla3v1hvfW5GCkT
         06UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=5S7sTr5oaEa6whSTBrHnaygTCmLuOOjaa4gPwbAVS3U=;
        b=bP+QnTN+6LIxoBLsts0m92yTzM1BklsunO+AijRnSUn0kDM0FjMZ5PgQXKZJOSzSnZ
         RPWIHgd9HIKbY7cJoJsadC8TXQFKL0uuXrOypLdi+Lr8DcnZYr9Ru2X6A1P1ilJKJXSn
         Ru3HP+2LmXKo3dKj5+L2JSfEoXwzo3YyntBwY634VQBeUV1J1wSLnSUYhgRMmRdWNfg2
         ui0kZxxXKY7iNzBz3LYbT/5RHG0qoyN4HT8Q3d/+W2Jr1Ej4XkeqQwBTDAWb25JXSRD7
         vjqwnYJztoyFnDfTlpB3c91o/nTzBYsPIyB4arjfU80FT0imOvx3lmy/nK3illpVE2XN
         pQzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g188si6860487ybg.496.2019.02.26.09.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 09:09:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gygER-0004MF-GJ
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 12:09:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gygDx-00048j-FK
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:08:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gygDw-0002fd-8M
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:08:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62447)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gygDt-0002Sv-R6; Tue, 26 Feb 2019 12:08:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5135B3082E4C;
	Tue, 26 Feb 2019 17:08:52 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-26.ams2.redhat.com
	[10.36.112.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B19B228D21;
	Tue, 26 Feb 2019 17:08:44 +0000 (UTC)
Date: Tue, 26 Feb 2019 18:08:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190226180841.0c30af3c@Igors-MacBook-Pro.local>
In-Reply-To: <20190226135014.31854-13-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
	<20190226135014.31854-13-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 26 Feb 2019 17:08:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v8 12/18] hw/arm/boot: Expose the PC-DIMM
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
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GW/n0ZiDOtIi

On Tue, 26 Feb 2019 14:50:08 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> This patch adds memory nodes corresponding to PC-DIMM regions.
> 
> NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
> don't need to care about NVDIMM at this stage.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
I'm having second thoughts on this one,
maybe we should drop this patch or at least not to do this by default.
In the later case it would mean some kind of property that user could use
to turn this on which in its own turn adds more clutter to user tunables
(which is not desirable). So I'm leaning more towards dropping this patch for now.

> 
> ---
> v7 -> v8:
> - s/NV_DIMM/NVDIMM
> - fix indent
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
> index a830655e1a..4caaf91583 100644
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
> +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> +        goto fail;
> +    }
> +
>      rc = fdt_path_offset(fdt, "/chosen");
>      if (rc < 0) {
>          qemu_fdt_add_subnode(fdt, "/chosen");


Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5858726wrx;
        Thu, 21 Feb 2019 07:01:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibb9KLl83NMScal3Kh0mXyDpsyP31QVxr8DU7Xs2OE/MnynK/Pk/u27049RQOTXY/v8wU9q
X-Received: by 2002:a81:1fd4:: with SMTP id f203mr32223563ywf.422.1550761294746;
        Thu, 21 Feb 2019 07:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550761294; cv=none;
        d=google.com; s=arc-20160816;
        b=ly9N+DX4AYc3GQURWqUUTH7Nrlp3RRrqWOY2jEWRFjor2+KwPIvJHAdUa1ODVU8II5
         ROOHTumGbHRXBBNciHOjhHH2XuIdxuaHVlUNxgG5rNtcMeuG1FWrJO/H7NRmAqWlRFNy
         3V5l6Hpa66L3g3bDn5XQCrf4D5u/Ts+2Ybx+CO5Bu3x1iGFHD2Q8zS4f5F+Cywz2kSn6
         QF+ldjXJl9YmyNNf5sKNBCf5N9FeY3s0ZNSCf0Lrr4IyJ4wjyCaLWAsL5+IBbzcQhY3D
         +qgqw2njNlz78LjgFtNFtHvAVeTNVe5339szAOLMQmvOE3WchWIP54exJV8ZKFmT2FgD
         g36Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=rB2OYZflsdQdl7jkgPreX772LQU0JORjfTkz5JwZehc=;
        b=AAuWnNhTybsL/3giNu3CZtWBgTlndoTtYshx2bPXAV17bmzbn6QHt574GhOAXCx3qo
         iH3JHZGSNGRTby3q9xl7YnuiagEcEPNLJf9ky2Yj1O+7hmLe/hNoG2ZTQZTVzki6Q71b
         bjDyzOwopEWP/iNNRY5QS8/o/tVectEnhhwoJnNchbaIe0/5LNPFwdtIAVXmykJgiFWQ
         4MZQ07GzC56odgQ4dSBVyPixXPd7oSv0pqd3W/Z82BqbVkJWGJK5zdk7/l8qxKrnfXFM
         yBQJ5WKcv2DubQXx9LYxbmJ/OjRTg5rsz7y8Vxc1cA4lsF//ilIDBazBqvTkKHUc/IXY
         U4NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si562455ybn.55.2019.02.21.07.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 07:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwpqw-0006xX-6V
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 10:01:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwpog-0005Ld-Hq
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 09:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gwpoe-0001DK-Iz
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 09:59:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gwpoa-00012J-Nr; Thu, 21 Feb 2019 09:59:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 233CB821E5;
	Thu, 21 Feb 2019 14:59:00 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3E7A5C290;
	Thu, 21 Feb 2019 14:58:50 +0000 (UTC)
Date: Thu, 21 Feb 2019 15:58:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190221155849.7a79d979@redhat.com>
In-Reply-To: <20190220224003.4420-2-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190220224003.4420-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 21 Feb 2019 14:59:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 01/17] hw/arm/boot: introduce
 fdt_add_memory_node helper
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
X-TUID: 09HN0UmQigNY

On Wed, 20 Feb 2019 23:39:47 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> We introduce an helper to create a memory node.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> 
> v6 -> v7:
> - msg error in the caller
> - add comment about NUMA ID
> ---
>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d90af2f17d..a830655e1a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -423,6 +423,32 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
>      }
>  }
>  
> +static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> +                               uint32_t scells, hwaddr mem_len,
> +                               int numa_node_id)
> +{
> +    char *nodename;
> +    int ret;
> +
> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +    ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> +                                       scells, mem_len);
> +    if (ret < 0) {
> +        goto out;
> +    }
> +
> +    /* only set the NUMA ID if it is specified */
> +    if (numa_node_id >= 0) {
> +        ret = qemu_fdt_setprop_cell(fdt, nodename,
> +                                    "numa-node-id", numa_node_id);
> +    }
> +out:
> +    g_free(nodename);
> +    return ret;
> +}
> +
>  static void fdt_add_psci_node(void *fdt)
>  {
>      uint32_t cpu_suspend_fn;
> @@ -502,7 +528,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      void *fdt = NULL;
>      int size, rc, n = 0;
>      uint32_t acells, scells;
> -    char *nodename;
>      unsigned int i;
>      hwaddr mem_base, mem_len;
>      char **node_path;
> @@ -576,35 +601,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          mem_base = binfo->loader_start;
>          for (i = 0; i < nb_numa_nodes; i++) {
>              mem_len = numa_info[i].node_mem;
> -            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> -            qemu_fdt_add_subnode(fdt, nodename);
> -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> -            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> -                                              acells, mem_base,
> -                                              scells, mem_len);
> +            rc = fdt_add_memory_node(fdt, acells, mem_base,
> +                                     scells, mem_len, i);
>              if (rc < 0) {
> -                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
> -                        i);
> +                fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
> +                        mem_base);
>                  goto fail;
>              }
>  
> -            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
>              mem_base += mem_len;
> -            g_free(nodename);
>          }
>      } else {
> -        nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
> -        qemu_fdt_add_subnode(fdt, nodename);
> -        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> -
> -        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> -                                          acells, binfo->loader_start,
> -                                          scells, binfo->ram_size);
> +        rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
> +                                 scells, binfo->ram_size, -1);
>          if (rc < 0) {
> -            fprintf(stderr, "couldn't set %s reg\n", nodename);
> +            fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
> +                    binfo->loader_start);
>              goto fail;
>          }
> -        g_free(nodename);
>      }
>  
>      rc = fdt_path_offset(fdt, "/chosen");


Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3042993wrt;
        Mon, 22 Oct 2018 06:39:31 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60pln1PECuiQCJIu4s+mqpasZXeiIlWG19THlFk8Of6GrNXApJFiEwpJwi8S1WgVIvTk5gx
X-Received: by 2002:ac8:39c1:: with SMTP id v59-v6mr5272223qte.273.1540215571097;
        Mon, 22 Oct 2018 06:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540215571; cv=none;
        d=google.com; s=arc-20160816;
        b=p+uo+tXMItRY7rcT6JTY35ufPCB9UBr1L9uN9XFMI7PHiITeDLiEfQxNtvGbQY16CE
         rcCkZhRQzizawT73Ba1ny4pCWuqYiWm8JpLiVVVUdqZKV/POGZLGdo9ZXeow4ziymS4y
         3kyQv7uModhSh+TshYRSSNul9Y1WRAttmLgbnqwBvhebqa0Sw1cD1cESrscVDmE3mU4p
         Xs0NboPA9adPb7JywQfbGc9Dm3GD2q2AJ4fnI8aKoCZNEM7sGPDKZ+CENQQo/h6VOdi+
         KNAs01ekIw5wl6usE0nXq0j6O9M/uNmrgmi6SSGIcqCUEMOZmHL7LQKgphfB3BHNqftt
         PLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Fzv/xr1V3tj1fhDInVxmvtGxdNJUfG8il//9R4F+fQo=;
        b=RlcH5OWBy3P35B54R54DiCCp6PxYDZOtxp66ixbilEsXfRRV1RDrngFTbGsLw6iwDQ
         tDQn7+SKKE7lz6JG18M/5EAT6NbwI/UxTNiLUbCzjlIM5+QVMuXwbkonc2L0iVzylqRD
         X76qHT6woYckVpMqAxbHBotI6Fx/T+lFy9WUmbsbLJ2cdwNrF1dj2sWbcvBrCjmzo6n0
         B3uQMaHtEhybbfWuTQqvXsx2G1WL4iQmBtuARS79383rWaNh6k0MVoFDNHjuRWprqnf9
         BxLp7G4w9tI0capUKV8z1Gl+0y1nznE5QQUKE3RBVL8/0ddkbgC6eg3DXJVC6z8QJKEC
         nZcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n88-v6si3347652qte.3.2018.10.22.06.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 06:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEaQc-0006O9-Ih
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 09:39:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gEaOH-0004Wr-HC
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 09:37:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gEaOG-0007Bq-E4
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 09:37:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gEaOA-00070C-MW; Mon, 22 Oct 2018 09:36:58 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86D3F83F51;
	Mon, 22 Oct 2018 13:36:57 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-71.ams2.redhat.com
	[10.36.112.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6084F27C3E;
	Mon, 22 Oct 2018 13:36:53 +0000 (UTC)
Date: Mon, 22 Oct 2018 14:36:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20181022143650.3354f0f5@igors-macbook-pro.local>
In-Reply-To: <20181018142743.29489-1-eric.auger@redhat.com>
References: <20181018142743.29489-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 22 Oct 2018 13:36:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/boot: introduce fdt_add_memory_node
 helper
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IrO6iBFe0hNw

On Thu, 18 Oct 2018 16:27:43 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> We introduce an helper to create a memory node.
maybe add here something about reducing code duplication etc ...

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 20c71d7d96..ba2004da5c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -413,6 +413,36 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
>      }
>  }
>  
> +static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> +                               uint32_t scells, hwaddr mem_len,
> +                               int numa_node_id)

Maybe following order would be better:
void *fdt, int numa_node_id, uint32_t acells, uint32_t scells, hwaddr mem_base, hwaddr mem_len 

> +{
> +    char *nodename = NULL;
> +    int ret;
> +
> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +    ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> +                                       scells, mem_len);
> +    if (ret < 0) {
> +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
about errors in this function, are they a really reachable?
if not maybe we should use error_abort here.

> +        goto out;
> +    }
> +    if (numa_node_id < 0) {
> +        goto out;
> +    }
> +
> +    ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_node_id);
I'd leave out this part and keep it where it's now, since it's not common code
and then you won't have to hide it behind magical -1 for non numa case.

> +    if (ret < 0) {
> +        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
> +    }
> +
> +out:
> +    g_free(nodename);
> +    return ret;
> +}
> +
>  static void fdt_add_psci_node(void *fdt)
>  {
>      uint32_t cpu_suspend_fn;
> @@ -492,7 +522,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      void *fdt = NULL;
>      int size, rc, n = 0;
>      uint32_t acells, scells;
> -    char *nodename;
>      unsigned int i;
>      hwaddr mem_base, mem_len;
>      char **node_path;
> @@ -566,35 +595,20 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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
>              goto fail;
>          }
> -        g_free(nodename);
>      }
>  
>      rc = fdt_path_offset(fdt, "/chosen");


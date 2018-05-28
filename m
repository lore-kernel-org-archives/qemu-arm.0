Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2529862wre;
        Mon, 28 May 2018 07:22:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ5MBUGlSDJs6q1ZLxqY3M+RSnBSt9pVOYwpjAo6d9ItmjU+ppprMqwg+YOXJnNUa68SBEw
X-Received: by 2002:a0c:8cc5:: with SMTP id q5-v6mr12436801qvb.60.1527517332543;
        Mon, 28 May 2018 07:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517332; cv=none;
        d=google.com; s=arc-20160816;
        b=08B7FCvSQ2x6UDkgiGfadUnliqvH70fWTlkY3tAoKWsTWdGxF1/kzVi9yWryBvb4kG
         mY2QUNAqQlBdLpJi7wFkq0vmarapJD78P2x1CadVWKC9X7Sfi+eI3i19S8CkIpnWbl9Z
         JDw3/ctYmBJR+yDzM5naqhn7zNDxElUjJ0bSRjryjdimliZHS4bdjBpeyAP2w8l3fxxI
         XCHTRzTpWEMqHUfQVug9uWtorSJ7kFr8h14C+LC4XiO0RecT6pzWG5ButugBKvELODDg
         BPFmJDIFLp3thrnUAVJjia18rdOsQ3q7DogHet/egquRlwYZPMgxHmTIBOXTdCS9zULo
         uqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=UGJOftHOwOKL3YYxEDbX4oYX5Iy5ZWP+UQ5QeLvr8oE=;
        b=ZnBErYE/YDUMa3UwYqeCRxh/eFmAdI0OwXdOx32Niy9pH0WEOUSvHLeDEeYgGEr6sm
         hpuh6dStr46TAZo7JtEnulpt6MigWmOmZ85IbI6To4/8HPoqvz7Gfaz2a2xsf+shScoP
         XmQuT1bvxXMiIceISvNTpWDSPGL1RBAjXryF3rEOvP6peL3/dkwS/TaxbMk4R97QQJVG
         joPKfuwEsfIsT71VqVCUaZqu+cVYCuvEmlfo83dyX5r0NUTW1Ev95YDVg1IW9VEUaQWz
         rLgJmNuYVQl3JJGupBEjthO4+23slTktpV7sJIM6W8w9lPx0WOQov3vcOmFwqe9+5+NM
         fboA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7-v6si4675179qvh.44.2018.05.28.07.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ2K-00083v-0q
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:22:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ1z-0007xv-Qu
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:21:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ1y-0006PK-Bb
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:21:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59178 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNJ1y-0006P5-5n; Mon, 28 May 2018 10:21:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7BFC401EF05;
	Mon, 28 May 2018 14:21:49 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DCB82166BB2;
	Mon, 28 May 2018 14:21:47 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-5-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fb37761c-6e74-5aca-b258-8d8c060ca4dc@redhat.com>
Date: Mon, 28 May 2018 16:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180516152026.2920-5-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 28 May 2018 14:21:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 28 May 2018 14:21:49 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 4/6] hw/arm: Changes required
 to accommodate non-contiguous DT mem nodes
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D905HiomkMFC

Hi Shameer,

On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> This makes changes to the DT mem node creation such that its easier
> to add non-contiguous mem modeled as non-pluggable and a pc-dimm
> mem later.
See comments below. I think you should augment the description here with
what the patch exactly adds:
- a new helper function
- a new dimm node?

and if possible split functional changes into separate patches?
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/boot.c        | 91 ++++++++++++++++++++++++++++++++++++----------------
>  include/hw/arm/arm.h | 12 +++++++
>  2 files changed, 75 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 26184bc..73db0aa 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -486,6 +486,27 @@ static void fdt_add_psci_node(void *fdt)
>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>  }
>  
> +static char *create_memory_fdt(void *fdt, uint32_t acells, hwaddr mem_base,
> +                                          uint32_t scells, hwaddr mem_len)
Other dt node creation functions are named fdt_add_*_node
> +{
> +    char *nodename = NULL;
> +    int rc;
> +
> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> +    rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> +                                      scells, mem_len);
> +    if (rc < 0) {
> +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
> +        g_free(nodename);
> +        return NULL;
> +    }
> +
> +    return nodename;
> +}
> +
> +
>  /**
>   * load_dtb() - load a device tree binary image into memory
>   * @addr:       the address to load the image at
> @@ -567,50 +588,64 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          goto fail;
>      }
>  
> +    /*
> +     * Turn the /memory node created before into a NOP node, then create
> +     * /memory@addr nodes for all numa nodes respectively.
> +     */
> +    qemu_fdt_nop_node(fdt, "/memory");
I don't really understand why this gets moved outside of the if
(nb_numa_nodes > 0) { check. Also the comment above mention numa nodes
whereas it are not necessarily in the numa case anymore.
> +
>      if (nb_numa_nodes > 0) {
> -        /*
> -         * Turn the /memory node created before into a NOP node, then create
> -         * /memory@addr nodes for all numa nodes respectively.
> -         */
> -        qemu_fdt_nop_node(fdt, "/memory");
> +        hwaddr mem_sz;
> +
>          mem_base = binfo->loader_start;
> +        mem_sz = binfo->ram_size;
>          for (i = 0; i < nb_numa_nodes; i++) {
> -            mem_len = numa_info[i].node_mem;
> -            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> -            qemu_fdt_add_subnode(fdt, nodename);
> -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> -            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> -                                              acells, mem_base,
> +            mem_len = MIN(numa_info[i].node_mem, mem_sz);
I fail to understand how this change relates to the topic of this patch.
If this adds a consistency check, this may be put in another patch?
> +
> +            nodename = create_memory_fdt(fdt, acells, mem_base,
>                                                scells, mem_len);
You could simplify the review by just introducing the new dt node
creation function in a 1st patch and then introduce the changes to
support non contiguous DT mem nodes.
> -            if (rc < 0) {
> -                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
> -                        i);
> +            if (!nodename) {
>                  goto fail;
>              }
>  
>              qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
> -            mem_base += mem_len;
>              g_free(nodename);
> +            mem_base += mem_len;
> +            mem_sz -= mem_len;
> +            if (!mem_sz) {
> +                break;
So what does it mean practically if we break here. Not all the num nodes
will function? Outputting a mesg for the end user may be useful.
> +           }
>          }
> -    } else {
> -        Error *err = NULL;
>  
> -        rc = fdt_path_offset(fdt, "/memory");
> -        if (rc < 0) {
> -            qemu_fdt_add_subnode(fdt, "/memory");
> -        }
> +        /* Create the node for initial pc-dimm ram, if any */
> +        if (binfo->dimm_mem) {
>  
> -        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
> -            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
> +            nodename = create_memory_fdt(fdt, acells, binfo->dimm_mem->base,
> +                                              scells, binfo->dimm_mem->size);
> +            if (!nodename) {
> +                goto fail;
> +            }
> +            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id",
> +                                                 binfo->dimm_mem->node);
> +            g_free(nodename);
>          }
>  
> -        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> -                                          acells, binfo->loader_start,
> -                                          scells, binfo->ram_size);
> -        if (rc < 0) {
> -            fprintf(stderr, "couldn't set /memory/reg\n");
> +    } else {
> +
> +        nodename = create_memory_fdt(fdt, acells, binfo->loader_start,
> +                                         scells, binfo->ram_size);
> +        if (!nodename) {
>              goto fail;
>          }
> +
> +        if (binfo->dimm_mem) {
> +            nodename = create_memory_fdt(fdt, acells, binfo->dimm_mem->base,
> +                                              scells, binfo->dimm_mem->size);
> +            if (!nodename) {
> +                goto fail;
> +            }
> +            g_free(nodename);
> +        }
as this code gets duplicated, a helper function may be relevant?

Thanks

Eric
>      }
>  
>      rc = fdt_path_offset(fdt, "/chosen");
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index ce769bd..0ee3b4e 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -48,6 +48,12 @@ typedef struct {
>      ARMCPU *cpu; /* handle to the first cpu object */
>  } ArmLoadKernelNotifier;
>  
> +struct dimm_mem_info {
> +    int node;
> +    hwaddr base;
> +    hwaddr size;
> +};
> +
>  /* arm_boot.c */
>  struct arm_boot_info {
>      uint64_t ram_size;
> @@ -124,6 +130,12 @@ struct arm_boot_info {
>      bool secure_board_setup;
>  
>      arm_endianness endianness;
> +
> +    /* This is used to model a pc-dimm based mem if the valid iova region
> +     * is non-contiguous.
> +     */
> +    struct dimm_mem_info *dimm_mem;
> +
>  };
>  
>  /**
> 

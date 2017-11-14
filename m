Received: by 10.223.150.237 with SMTP id u100csp3687441wrb;
        Tue, 14 Nov 2017 06:51:29 -0800 (PST)
X-Google-Smtp-Source: AGs4zMagyr/0nEmACcP5lDKyCMOwKwmfZza+gpapyYiMTT4sscI7YNWTS4sgZ+6qGx7QtbvY9TWF
X-Received: by 10.129.163.67 with SMTP id a64mr7855714ywh.441.1510671089107;
        Tue, 14 Nov 2017 06:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510671089; cv=none;
        d=google.com; s=arc-20160816;
        b=dPmqz7t0bPXAJ+HHMVxF0ArwsH4TBifIrjNyPJyx+2Nwf2q40FYaOq6uOcdGTmw3V6
         f69bA/FDDpiivJeHOKPHcd3jjcowYRM8FTa+jv+5p1TXsSLVhYSr6rJ9t+GyWihFOmZ3
         QYFHiiaPfHNU0GlJ8ahzobAzySRR+M9N/yrwAT/D9dwkjQurKAy6xLkrydDGZRMjhNDK
         AigCkeZUq/bguxmoDYfr8I74H8Afk+oEc/dLk5k93BqLwQb1jsHpDGlmBVR0m+1B/EJM
         wy+Ey4laDJf8VxKGJjS4Rm3DHj3QRRRQr+wz6mLo9nnwKy25ncXJtpX31siM8q9yOMcN
         QYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=23mDWTI+KRqIBxeFJTvROfbOcnpG3btaU+E0W6Bnm3E=;
        b=RTDnGpwUIR/U8u7KEkIB5DrrxXyk5wklJhoESS/41jeGb7+XAbKV2UFhkJWsmdofBp
         BFn/b6HYki751Oi/jeRoCtBYKSGkTHSXSsiEWFhW4ESWWPTqVaEt13/FA9lwed7N2Au+
         KcQfXdrplfGF4iaYaMFFNhiezkvz1xoTgn3u75l6eRjGOP6PvGZa6Fo0PwaP3hKGVVCE
         xgcsAv8awbevZlLQsD6s0jjcPO/MrxI+ha7ktyhdEG5PIz7vHjjDt16bGiDoMbBTn0M4
         z62ITCIgcSinW+ZywJgQMqQ7okfqYB6fN2kbD9Z4WlHY3pRDJsi00SGzAmn6x2BKgk2q
         8ybA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c206si416186yba.548.2017.11.14.06.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 06:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEcYi-0004G3-FN
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 09:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcYV-0004EA-Fw
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 09:51:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcYQ-0008Ft-O3
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 09:51:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57228)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eEcYQ-0008FC-Dh; Tue, 14 Nov 2017 09:51:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FCA5C047B62;
	Tue, 14 Nov 2017 14:51:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5334189D30;
	Tue, 14 Nov 2017 14:51:04 +0000 (UTC)
Date: Tue, 14 Nov 2017 15:51:01 +0100
From: Andrew Jones <drjones@redhat.com>
To: zhuyijun@huawei.com
Message-ID: <20171114145101.sjol4obuna4kcmkp@kamzik.brq.redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-5-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510622154-17224-5-git-send-email-zhuyijun@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 14 Nov 2017 14:51:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 4/5] hw/arm/boot: set fdt size
 cell of memory node from mem_list
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1xMQhu90uC4E

On Tue, Nov 14, 2017 at 09:15:53AM +0800, zhuyijun@huawei.com wrote:
> From: Zhu Yijun <zhuyijun@huawei.com>
> 
> In case of accessing memory holes, we create memory fdt node by
> traversing mem_list and adjust memory address if the addr is not
> belong to RAM memory region.
> 
> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> ---
>  hw/arm/boot.c | 151 ++++++++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 109 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 30438f4..f4ca599 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -384,6 +384,25 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
>      }
>  }
>  
> +static char *create_memory_fdt(void *fdt, uint32_t acells, hwaddr mem_base,
> +                                          uint32_t scells, hwaddr mem_len)
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
> +    }
> +
> +    return nodename;
> +}
> +
>  /**
>   * load_dtb() - load a device tree binary image into memory
>   * @addr:       the address to load the image at
> @@ -412,7 +431,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      uint32_t acells, scells;
>      char *nodename;
>      unsigned int i;
> -    hwaddr mem_base, mem_len;
> +    RAMRegion *reg;
>  
>      if (binfo->dtb_filename) {
>          char *filename;
> @@ -464,49 +483,65 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          goto fail;
>      }
>  
> +    /*
> +     * Turn the /memory node created before into a NOP node, then create
> +     * /memory@addr nodes for all numa nodes respectively.
> +     */
> +    qemu_fdt_nop_node(fdt, "/memory");
> +
>      if (nb_numa_nodes > 0) {
> -        /*
> -         * Turn the /memory node created before into a NOP node, then create
> -         * /memory@addr nodes for all numa nodes respectively.
> -         */
> -        qemu_fdt_nop_node(fdt, "/memory");
> -        mem_base = binfo->loader_start;
> +        hwaddr reg_offset = 0; /* region base addr offset */
> +        hwaddr reg_alloc_size = 0; /* region consumed size */
> +        hwaddr node_mem_size = 0;
> +        RAMRegion *tmp_reg = QLIST_FIRST(&binfo->mem_list);
> +
>          for (i = 0; i < nb_numa_nodes; i++) {
> -            mem_len = numa_info[i].node_mem;
> -            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> -            qemu_fdt_add_subnode(fdt, nodename);
> -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> -            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> -                                              acells, mem_base,
> -                                              scells, mem_len);
> -            if (rc < 0) {
> -                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
> -                        i);
> -                goto fail;
> -            }
> +            node_mem_size = numa_info[i].node_mem;
> +            QLIST_FOREACH(reg, &binfo->mem_list, next) {
> +                if (reg->base != tmp_reg->base) {
> +                    continue;
> +                }
>  
> -            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
> -            mem_base += mem_len;
> -            g_free(nodename);
> -        }
> -    } else {
> -        Error *err = NULL;
> +                if (node_mem_size >= (reg->size - reg_offset)) {
> +                    reg_alloc_size = reg->size - reg_offset;
> +                } else {
> +                    reg_alloc_size = node_mem_size;
> +                }
>  
> -        rc = fdt_path_offset(fdt, "/memory");
> -        if (rc < 0) {
> -            qemu_fdt_add_subnode(fdt, "/memory");
> -        }
> +                nodename = create_memory_fdt(fdt, acells,
> +                                             reg->base + reg_offset,
> +                                             scells, reg_alloc_size);
> +                if (!nodename) {
> +                    goto fail;
> +                }
> +
> +                qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
> +                g_free(nodename);
>  
> -        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
> -            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
> +                node_mem_size -= reg_alloc_size;
> +                reg_offset += reg_alloc_size;
> +                tmp_reg = reg;
> +
> +                /* The region is depleted */
> +                if (reg->size == reg_offset) {
> +                    reg_offset = 0;
> +                    tmp_reg = QLIST_NEXT(reg, next);
> +                }
> +
> +                if (node_mem_size == 0) {
> +                    break;
> +                }
> +            }
>          }
> +    } else {
> +        QLIST_FOREACH(reg, &binfo->mem_list, next) {
> +            nodename = create_memory_fdt(fdt, acells, reg->base,
> +                                         scells, reg->size);
> +            if (!nodename) {
> +                goto fail;
> +            }
>  
> -        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> -                                          acells, binfo->loader_start,
> -                                          scells, binfo->ram_size);
> -        if (rc < 0) {
> -            fprintf(stderr, "couldn't set /memory/reg\n");
> -            goto fail;
> +            g_free(nodename);
>          }
>      }

I think we should move the numa allocation into board specific code,
mach-virt, and we should also map dimms to numa nodes, rather than
just dividing memory up.

>  
> @@ -814,6 +849,35 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>      return size;
>  }
>  
> +/* Find the max size memory region after info->initrd_start.
> + * TODO: we may have a corner case where the memory node size may not correctly
> + * fit into kernel/initrd/dtb Image sizes.
> + * */
> +static RAMRegion *find_initrd_memregion(const struct arm_boot_info *info,
> +                                        hwaddr *initrd_start)
> +{
> +    RAMRegion *reg, *initrd_reg = NULL;
> +    hwaddr max_size = 0;
> +    hwaddr addr = *initrd_start;
> +
> +    QLIST_FOREACH(reg, &info->mem_list, next) {
> +        if (addr < reg->base) {
> +            if (max_size < reg->size) {
> +                max_size = reg->size;
> +                *initrd_start = reg->base;
> +                initrd_reg = reg;
> +            }
> +        } else if (addr >= reg->base && addr < (reg->base + reg->size)) {
> +            if (max_size < reg->base + reg->size - addr) {
> +                max_size = reg->base + reg->size - addr;
> +                initrd_reg = reg;
> +            }
> +        }
> +    }
> +
> +    return initrd_reg;
> +}
> +
>  static void arm_load_kernel_notify(Notifier *notifier, void *data)
>  {
>      CPUState *cs;
> @@ -837,11 +901,11 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>      assert(!(info->secure_board_setup && kvm_enabled()));
>  
>      /* If machine is not virt, the mem_list will empty. */
> -    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
> +    if (QLIST_EMPTY(&info->mem_list)) {
>          RAMRegion *new = g_new(RAMRegion, 1);
>          new->base = info->loader_start;
>          new->size = info->ram_size;
> -        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
> +        QLIST_INSERT_HEAD(&info->mem_list, new, next);
>      }
>  
>      info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> @@ -973,14 +1037,16 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>          uint32_t fixupcontext[FIXUP_MAX];
>  
>          if (info->initrd_filename) {
> +            RAMRegion *reg = find_initrd_memregion(info, &info->initrd_start);
> +
>              initrd_size = load_ramdisk(info->initrd_filename,
>                                         info->initrd_start,
> -                                       info->ram_size -
> +                                       reg->base + reg->size -
>                                         info->initrd_start);
>              if (initrd_size < 0) {
>                  initrd_size = load_image_targphys(info->initrd_filename,
>                                                    info->initrd_start,
> -                                                  info->ram_size -
> +                                                  reg->base + reg->size -
>                                                    info->initrd_start);
>              }
>              if (initrd_size < 0) {
> @@ -1027,7 +1093,8 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>              }
>              fixupcontext[FIXUP_ARGPTR] = dtb_start;
>          } else {
> -            fixupcontext[FIXUP_ARGPTR] = info->loader_start + KERNEL_ARGS_ADDR;
> +            hwaddr kernel_args_addr = info->loader_start + KERNEL_ARGS_ADDR;
> +            fixupcontext[FIXUP_ARGPTR] = kernel_args_addr;

What's this unrelated change for?

>              if (info->ram_size >= (1ULL << 32)) {
>                  fprintf(stderr, "qemu: RAM size must be less than 4GB to boot"
>                          " Linux kernel using ATAGS (try passing a device tree"
> -- 
> 1.8.3.1
> 
> 
>

Thanks,
drew 

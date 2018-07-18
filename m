Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp500031wru;
        Wed, 18 Jul 2018 07:04:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeRF3cLi9QQucirsDGvYlo1ye5YGiyGzPcBab6tXNZ52DKtOMyYQ11HmJ2jX/6RjnVrzW8H
X-Received: by 2002:a37:96c1:: with SMTP id y184-v6mr5361562qkd.236.1531922675232;
        Wed, 18 Jul 2018 07:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531922675; cv=none;
        d=google.com; s=arc-20160816;
        b=CZtZ9i8coBXwj/dIsRa2dmTlcGQFpG7XvIOJB3VlTyKBRE4YFgY4EZ2mNIYKyVj8qd
         s4bgf9qk7MTdnRB9i/mqqhz/ixaYZPb14fuJo9LHraj7WLgPSckqOB/WK39FVgLE0GgL
         iVYp+gKSxVMYwvrZgo6DNsWt7W7TW3zm9p3tm3/8iP3zaycsZ2VgSkogZ4I/X594wpS7
         HGI8UiLzSag2Zjbg1JI8kB4qO33aKsbFTOrQxXcZ733WmKEgBUHzh/z7/qRgQxPlDpef
         /EUEV5CDukat1Y7eHzcPXM7VXY9h15i/KlyzEhhYFXhKBFbet0nok5yK8W8dzABEmQ4V
         Cqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=LUv/LwbPwu3MmcwD7CIVC6W+NOA4BvYy0y7ry3J4tVs=;
        b=As4gZ5jfLcJnjcewUECHSsxLaRouOcvqpzyLK/u1ZTfpNz7JYFqYO9ueHMlFkQ+NgU
         46ujLNK1OgtIHeSVj8HVZNCgnaUC+o5LUfBjmrnVkpv57OyjM6zwzbULrzqRKJQUbgtU
         jwKziOfVvL/kMCUuPoiV/7k0ksG0HJbVE5JeGw/lrcRonOtjdpby279iwvknVOn/ZPaP
         1hbZ0X4rTD1NIDXpnQQJEADRR7av5EssbEEa0qMx6UTK3CW25uK9/61wU58DKb2AoCTf
         TVw34GAOo0rg8iw5qR5jdz4UQ+fLsyDO4PpnDSFtrLwKxcq1CmDnHjq4NMYzzp8HBjQz
         2/0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si1140046qvo.110.2018.07.18.07.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 07:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffn4E-0001hX-PZ
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 10:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ffn42-0001h6-Fv
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 10:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1ffn3z-0006n0-9h
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 10:04:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43240 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1ffn3y-0006mW-US; Wed, 18 Jul 2018 10:04:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9BD8402332F;
	Wed, 18 Jul 2018 14:04:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1C852156893;
	Wed, 18 Jul 2018 14:04:14 +0000 (UTC)
Date: Wed, 18 Jul 2018 16:04:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180718160413.5c4dc514@redhat.com>
In-Reply-To: <1530602398-16127-9-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-9-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 18 Jul 2018 14:04:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 18 Jul 2018 14:04:17 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v3 08/15] hw/arm/boot: introduce
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
	dgilbert@redhat.com, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ebtGWw6gY6m8

On Tue,  3 Jul 2018 09:19:51 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> We introduce an helper to create a memory node.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> ---
> 
> v1 -> v2:
> - nop of existing /memory nodes was already handled
> ---
>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e09201c..5243a25 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -413,6 +413,36 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
>      }
>  }
>  
> +static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> +                               uint32_t scells, hwaddr mem_len,
> +                               int numa_node_id)
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
> +        goto out;
> +    }
> +    if (numa_node_id < 0) {
> +        goto out;
> +    }
> +
> +    ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_node_id);
> +    if (ret < 0) {
> +        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
> +    }
> +
> +out:
> +    g_free(nodename);
> +    return ret;
> +}
> +

not related question from hotplug POV,
is entry size fixed?
can we estimate exact size for #slots number of dimms and reserve it in advance
in FDT 'rom'?

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
nice cleanup, but I won't stop here just yet if hotplug to be considered.

I see arm_load_dtb() as a hack called from every board
where we dump everything that might be related to DTB regardless
if it's generic for every board or only a board specific stuff.

Could we split it in several logical parts that do a single thing
and preferably user only when they are actually need?
Something along following lines:
(cleanups/refactoring should be a separate from pcdimm series as it's self sufficient
and it would be easier to review/merge and could simplify following up pcdimm series):

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e09201c..9c41efd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@ -486,9 +486,6 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
-int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                 hwaddr addr_limit, AddressSpace *as)
-{
...

@@ -1158,9 +1158,14 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     }
 
     if (!info->skip_dtb_autoload && have_dtb(info)) {
-        if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
-            exit(1);
-        }
+        load_dtb_from_file() /* reuse generic machine_get_dtb() ??? */
+        create_dtb_memory_nodes() /* non numa variant */
+        /* move out mac-virt specific binfo->get_dtb into the board */
+        /* move out modify_dtb() which vexpress hack into vexpress */
+        /* move out fdt_add_psci_node() into mac-ivrt */
+        create_dtb_initrd_kernel_nodes()
+        dump_fdt()
+        rom_add_blob_fixed_as()
     }
 }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcd..7686abf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1285,9 +1285,12 @@ void virt_machine_done(Notifier *notifier, void *data)
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
     }
-    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
-        exit(1);
-    }
+    load_dtb_from_file()/get_dtb() stuff
+    virt_create_dtb_memory_nodes() /* incl. numa variant nad later pcdimm nodes */                         
+    fdt_add_psci_node()                         
+    create_dtb_initrd_kernel_nodes()                                         
+    dump_fdt()                                                               
+    rom_add_blob_fixed_as()
 
     virt_acpi_setup(vms);
     virt_build_smbios(vms);


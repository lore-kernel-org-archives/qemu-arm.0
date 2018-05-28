Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2529295wre;
        Mon, 28 May 2018 07:21:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJvK5jf3vvxa1MiTQqErGP5ng3gWrlXW9EDyHB4Pq4Tk227JQWllWblx2pWlNvHXiUBiQFr
X-Received: by 2002:a0c:d60e:: with SMTP id c14-v6mr12432559qvj.82.1527517297306;
        Mon, 28 May 2018 07:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517297; cv=none;
        d=google.com; s=arc-20160816;
        b=u8pk00G37nG0I7ecd/eeWIzoFLVTQXscBFoCykOgMsZehvuRS0lB6xgGZNo6zIvyBr
         iDfJPXPGThhJKtPDPh5KiK/jB50/AWmTPj/d9Gzf0sHKocK/SLPvWi71+VjNrGUMdlCb
         MNkRESn6NWsJ6lPTU5YkUnRm2UdPBJznkQgCEivP/wi/7vHT4/u92A5cGnzWdO538zNq
         YMPTn0TTzHPSMbIW0Qz4/uKIq2NFDsXcKEs2lnLvx4BZzytJzga3w9QzwR3SHByg3wEw
         g/jRA/ELtpxIYejQn1AqjOw5TnwVQ4T10rajT/QUJgQV4QFc1HlDfLAC6iYgNryDmZSm
         Gs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=MBFitCPmvDubNx58tKPr1/2NIF0EVQz5jMczqjRUsMg=;
        b=lfMLGv5pOmfpCcQeogETNmglJ4DsXLTtzmRRk2OsXvFbkAXKnVUfkXXgHb6/CVLNQv
         OkRgin9+N6SBa7w+CMWvK8B7bnc9km3+6LbN7q0PXSJ5Wdw0UvZlv+JfQ22fZcERcICo
         OnZR8cgedOManM9bOQnMCLaZubY9zoC0d1whiHr6xjTtpXgUJza55pP9H0Rp+S7kbEuM
         C84m67a0xSHNLqPtWlaagAbZrSXHz9+tKxO3K6OmIGbouCxe3khe4Ga/Qff7/N+YOomB
         +qADXtFIn9Yntne/j0+6wO3bpnDzs7RCQKQziYjBmEeJJiKrKO8+AKgAUd5R4Tc93z0f
         rY3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p47-v6si526931qtb.55.2018.05.28.07.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ1k-0007lF-Qx
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ1b-0007l8-WF
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:21:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ1Y-0006ED-Mz
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:21:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56546 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNJ1Y-0006Dn-Hd; Mon, 28 May 2018 10:21:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD60D7CBBA;
	Mon, 28 May 2018 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B25761121298;
	Mon, 28 May 2018 14:21:19 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-2-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <216b4fba-c14a-fd9e-86ae-dda5a3d1cbcf@redhat.com>
Date: Mon, 28 May 2018 16:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180516152026.2920-2-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 14:21:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 14:21:23 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 1/6] hw/vfio: Retrieve valid
 iova ranges from kernel
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
X-TUID: rUKwebMTeRXY

Hi Shameer,
On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> This makes use of the newly introduced iova cap chains added
> to the  type1 VFIO_IOMMU_GET_INFO ioctl.
> 
> The retrieved iova info is stored in a list for later use.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/vfio/common.c              | 108 +++++++++++++++++++++++++++++++++++++++---
>  include/hw/vfio/vfio-common.h |   7 +++
>  linux-headers/linux/vfio.h    |  23 +++++++++
>  3 files changed, 132 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 07ffa0b..94d7b24 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -40,6 +40,8 @@ struct vfio_group_head vfio_group_list =
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
>  struct vfio_as_head vfio_address_spaces =
>      QLIST_HEAD_INITIALIZER(vfio_address_spaces);
> +struct vfio_iova_head vfio_iova_regions =
> +    QLIST_HEAD_INITIALIZER(vfio_iova_regions);
>  
>  #ifdef CONFIG_KVM
>  /*
> @@ -1030,6 +1032,85 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
>      }
>  }
>  
> +static void vfio_iommu_get_iova_ranges(struct vfio_iommu_type1_info *info)
> +{
> +    struct vfio_info_cap_header *hdr;
> +    struct vfio_iommu_type1_info_cap_iova_range *cap_iova;
> +    VFIOIovaRange *iova, *tmp, *prev = NULL;
nit: s/iova/iova_range?
> +    void *ptr = info;
> +    bool found = false;
> +    int i;
> +
> +    if (!(info->flags & VFIO_IOMMU_INFO_CAPS)) {
> +        return;
> +    }
> +
> +    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
> +        if (hdr->id == VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE) {
> +            found = true;
> +            break;
> +        }
> +    }
> +
> +    if (!found) {
> +        return;
> +    }
> +
> +    /* purge the current iova list, if any */
> +    QLIST_FOREACH_SAFE(iova, &vfio_iova_regions, next, tmp) {
> +        QLIST_REMOVE(iova, next);
> +        g_free(iova);
> +    }
> +
> +    cap_iova = container_of(hdr, struct vfio_iommu_type1_info_cap_iova_range,
> +                            header);
> +
> +    /* populate the list */
> +    for (i = 0; i < cap_iova->nr_iovas; i++) {
> +        iova = g_malloc0(sizeof(*iova));
nit: g_new0 is preferred
> +        iova->start = cap_iova->iova_ranges[i].start;
> +        iova->end = cap_iova->iova_ranges[i].end;
> +
> +        if (prev) {
> +            QLIST_INSERT_AFTER(prev, iova, next);
> +        } else {
> +            QLIST_INSERT_HEAD(&vfio_iova_regions, iova, next);
> +        }
> +        prev = iova;
> +    }
> +
> +    return;
> +}
> +
> +static int vfio_get_iommu_info(VFIOContainer *container,
> +                         struct vfio_iommu_type1_info **info)
> +{
> +
> +    size_t argsz = sizeof(struct vfio_iommu_type1_info);
> +
> +
> +    *info = g_malloc0(argsz);
> +
> +retry:
> +    (*info)->argsz = argsz;
> +
> +    if (ioctl(container->fd, VFIO_IOMMU_GET_INFO, *info)) {
> +        g_free(*info);
> +        *info = NULL;
> +        return -errno;
> +    }
> +
> +    if (((*info)->argsz > argsz)) {
> +        argsz = (*info)->argsz;
> +        *info = g_realloc(*info, argsz);
> +        goto retry;
> +    }
> +
> +    vfio_iommu_get_iova_ranges(*info);
> +
> +    return 0;
> +}
> +
>  static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>                                    Error **errp)
>  {
> @@ -1044,6 +1125,15 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>              group->container = container;
>              QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>              vfio_kvm_device_add_group(group);
> +
> +            /* New group might change the valid iovas. Get the updated list */
> +            if ((container->iommu_type == VFIO_TYPE1_IOMMU) ||
> +                (container->iommu_type == VFIO_TYPE1v2_IOMMU)) {
> +                struct vfio_iommu_type1_info *info;
> +
> +                vfio_get_iommu_info(container, &info);
> +                g_free(info);
> +            }
>              return 0;
>          }
>      }
> @@ -1071,7 +1161,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
>          ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
>          bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
> -        struct vfio_iommu_type1_info info;
> +        struct vfio_iommu_type1_info *info;
>  
>          ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
>          if (ret) {
> @@ -1095,14 +1185,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>           * existing Type1 IOMMUs generally support any IOVA we're
>           * going to actually try in practice.
>           */
> -        info.argsz = sizeof(info);
> -        ret = ioctl(fd, VFIO_IOMMU_GET_INFO, &info);
> +        ret = vfio_get_iommu_info(container, &info);
>          /* Ignore errors */
> -        if (ret || !(info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
> +        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
>              /* Assume 4k IOVA page size */
> -            info.iova_pgsizes = 4096;
> +            info->iova_pgsizes = 4096;
>          }
> -        vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
> +        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
> +        g_free(info);
>      } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
>                 ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
>          struct vfio_iommu_spapr_tce_info info;
> @@ -1256,6 +1346,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>      if (QLIST_EMPTY(&container->group_list)) {
>          VFIOAddressSpace *space = container->space;
>          VFIOGuestIOMMU *giommu, *tmp;
> +        VFIOIovaRange *iova, *next_iova;
not: I would prefer range naming

>  
>          QLIST_REMOVE(container, next);
>  
> @@ -1266,6 +1357,11 @@ static void vfio_disconnect_container(VFIOGroup *group)
>              g_free(giommu);
>          }
>  
> +        QLIST_FOREACH_SAFE(iova, &vfio_iova_regions, next, next_iova) {
> +            QLIST_REMOVE(iova, next);
> +            g_free(iova);
> +        }
> +
>          trace_vfio_disconnect_container(container->fd);
>          close(container->fd);
>          g_free(container);
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index d936014..874fe2c 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -164,6 +164,12 @@ typedef struct VFIODisplay {
>      } dmabuf;
>  } VFIODisplay;
>  
> +typedef struct VFIOIovaRange {
> +    uint64_t start;
> +    uint64_t end;
> +    QLIST_ENTRY(VFIOIovaRange) next;
> +} VFIOIovaRange;
> +
>  void vfio_put_base_device(VFIODevice *vbasedev);
>  void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
>  void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
> @@ -187,6 +193,7 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>  extern const MemoryRegionOps vfio_region_ops;
>  extern QLIST_HEAD(vfio_group_head, VFIOGroup) vfio_group_list;
>  extern QLIST_HEAD(vfio_as_head, VFIOAddressSpace) vfio_address_spaces;
> +extern QLIST_HEAD(vfio_iova_head, VFIOIovaRange) vfio_iova_regions;
>  
>  #ifdef CONFIG_LINUX
>  int vfio_get_region_info(VFIODevice *vbasedev, int index,
> diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
> index 3a0a305..117341d 100644
> --- a/linux-headers/linux/vfio.h
> +++ b/linux-headers/linux/vfio.h
> @@ -589,7 +589,30 @@ struct vfio_iommu_type1_info {
>  	__u32	argsz;
>  	__u32	flags;
>  #define VFIO_IOMMU_INFO_PGSIZES (1 << 0)	/* supported page sizes info */
> +#define VFIO_IOMMU_INFO_CAPS	(1 << 1)	/* Info supports caps */
>  	__u64	iova_pgsizes;		/* Bitmap of supported page sizes */
> +	__u32   cap_offset;	/* Offset within info struct of first cap */
> +};
> +
> +/*
> + * The IOVA capability allows to report the valid IOVA range(s)
> + * excluding any reserved regions associated with dev group. Any dma
> + * map attempt outside the valid iova range will return error.
> + *
> + * The structures below define version 1 of this capability.
> + */
> +#define VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE  1
> +
> +struct vfio_iova_range {
> +	__u64	start;
> +	__u64	end;
> +};
> +
> +struct vfio_iommu_type1_info_cap_iova_range {
> +	struct vfio_info_cap_header header;
> +	__u32	nr_iovas;
> +	__u32	reserved;
> +	struct vfio_iova_range iova_ranges[];
>  };
>  
>  #define VFIO_IOMMU_GET_INFO _IO(VFIO_TYPE, VFIO_BASE + 12)
> 
You need to update the header in a separate patch using
scripts/update-linux-headers.sh

Until the kernel series is not fully upstream you can just pickup the
VFIO related changes you are interested in (partial update) but when
this series becomes a patch, a full header update is generally used.

Thanks

Eric

Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3228863wrp;
        Mon, 23 Sep 2019 16:18:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFWA/abQk+zwNIJeq17b2t3v2vLXHqe2I2bk6EKyjuDOaILYOCgJSuXtxCDfeoe4cFzM2Z
X-Received: by 2002:a17:906:4554:: with SMTP id s20mr1951529ejq.257.1569280696056;
        Mon, 23 Sep 2019 16:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569280696; cv=none;
        d=google.com; s=arc-20160816;
        b=HTfQ2lMmJJSuBKT0S7I88j89PKza0g+RthCrBFE9FxJpJNlyOMLb13Y5j4rPHy861e
         1y9bWHetpDLgcTaFp5ewqe3vKBZqp/+/MiSlz4IJOqN/WZDmnlwB5ZGeSjHhfkTlFkLz
         PA1NR+/vvG2YySvXY/EPTjpknrZ+IQfKv8nZBuxbt/mHms+mHpmWSP2mt7w//vTRQFIp
         ZfSFPHnMnRj+O7WEKu2KhkNUtACKugp6wUHUz6IADPcgT1QXo7Et67skN4shIITpVu3n
         7u6g1T6ON6Rz0bNzBnrWiNx67IgE7mQ7sG9tI0JZ9+spURmO/OowdwCMl8zJ53PpIm2h
         INoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date;
        bh=5/0EMVnCVRBcB/+JftJpUCIVqSVakzVBueHL6UuJ8Tw=;
        b=Egn0cE/0sYeIvZDTdLm2B0Fync1sdC6RLcPs5ZedQEfnDJsBDZbyQaSj/LjZAY9wtR
         W1vV8C/s9jRfWlgviBinGp61ifsRgGJKUIWORT9+nTB0AwSI8gOg4PZeTmv3Pnuntd2f
         xRYyMN9wk/dG/F5tXoyt9NqbJ3pSs02iXb3HfE2W3i5q2TO+3+HEvB52tV/RtOr4rfa2
         2DfKGtG98RaXu5PsMxYm6PGaWkZLGOW8ej/tZzrDUArKel/tH2lVhYX6mPa1dG8lMShx
         7QhSLC/94tjvxv98skIf8ooVv0KS2x2xJZQvgkV+89O/yS5vquUOdzW1KAM/0QI3pq3S
         imxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si6418edj.0.2019.09.23.16.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 16:18:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCXaw-0004ob-VC
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 19:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1iCXPC-0001d5-KJ
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 19:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1iCXP9-0004IP-BX
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 19:06:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1iCXP9-0004Hf-1z; Mon, 23 Sep 2019 19:06:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C64CF83F3D;
 Mon, 23 Sep 2019 23:06:00 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6AF55D9D5;
 Mon, 23 Sep 2019 23:05:51 +0000 (UTC)
Date: Mon, 23 Sep 2019 17:05:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: Turn the container error into an Error handle
Message-ID: <20190923170550.252020d0@x1.home>
In-Reply-To: <20190923065552.10602-2-eric.auger@redhat.com>
References: <20190923065552.10602-1-eric.auger@redhat.com>
 <20190923065552.10602-2-eric.auger@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 23 Sep 2019 23:06:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, aik@ozlabs.ru,
 qemu-devel@nongnu.org, peterx@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vpLxSnyVi7Rq

On Mon, 23 Sep 2019 08:55:51 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> The container error integer field is currently used to store
> the first error potentially encountered during any
> vfio_listener_region_add() call. However this fails to propagate
> detailed error messages up to the vfio_connect_container caller.
> Instead of using an integer, let's use an Error handle.
> 
> Messages are slightly reworded to accomodate the propagation.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/vfio/common.c              | 61 +++++++++++++++++++++--------------
>  hw/vfio/spapr.c               |  4 ++-
>  include/hw/vfio/vfio-common.h |  2 +-
>  3 files changed, 40 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3e03c495d8..a0670cc63a 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -503,12 +503,14 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    MemoryRegion *mr = section->mr;

This looks like an entirely secondary change that obscures the primary
purpose of this patch and isn't mentioned in the changelog.  It's also a
bit inconsistent in places where we're references section->size and
section->offset_within_address_space, but now mr instead of section->mr.


>      hwaddr iova, end;
>      Int128 llend, llsize;
>      void *vaddr;
>      int ret;
>      VFIOHostDMAWindow *hostwin;
>      bool hostwin_found;
> +    Error *err = NULL;
>  
>      if (vfio_listener_skipped_section(section)) {
>          trace_vfio_listener_region_add_skip(
> @@ -543,6 +545,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                                 hostwin->max_iova - hostwin->min_iova + 1,
>                                 section->offset_within_address_space,
>                                 int128_get64(section->size))) {
> +                error_setg(&err, "Overlap with existing IOMMU range "
> +                                 "[0x%"PRIx64",0x%"PRIx64"]", hostwin->min_iova,
> +                                 hostwin->max_iova - hostwin->min_iova + 1);
>                  ret = -1;

Agree with Peter here, we should no longer be gratuitously setting ret
when it's not consumed.

Alexey or David might want to comment on the error message here since
we didn't have one previously, but we're only providing half the story
above, the existing window that interferes but not the range we
attempted to add that it interferes with.

>                  goto fail;
>              }
> @@ -550,6 +555,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>  
>          ret = vfio_spapr_create_window(container, section, &pgsize);
>          if (ret) {
> +            error_setg_errno(&err, -ret, "Failed to create SPAPR window");
>              goto fail;
>          }
>  
> @@ -559,7 +565,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>  #ifdef CONFIG_KVM
>          if (kvm_enabled()) {
>              VFIOGroup *group;
> -            IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +            IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(mr);
>              struct kvm_vfio_spapr_tce param;
>              struct kvm_device_attr attr = {
>                  .group = KVM_DEV_VFIO_GROUP,
> @@ -594,18 +600,17 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      }
>  
>      if (!hostwin_found) {
> -        error_report("vfio: IOMMU container %p can't map guest IOVA region"
> -                     " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx,
> -                     container, iova, end);
> +        error_setg(&err, "Container %p can't map guest IOVA region"
> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);

Note that here we print the start and end addresses, so I'm not sure
why we chose to print [start,size] in the new message commented on
above.

>          ret = -EFAULT;
>          goto fail;
>      }
>  
> -    memory_region_ref(section->mr);
> +    memory_region_ref(mr);
>  
> -    if (memory_region_is_iommu(section->mr)) {
> +    if (memory_region_is_iommu(mr)) {
>          VFIOGuestIOMMU *giommu;
> -        IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +        IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(mr);
>          int iommu_idx;
>  
>          trace_vfio_listener_region_add_iommu(iova, end);
> @@ -632,15 +637,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                              iommu_idx);
>          QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
>  
> -        memory_region_register_iommu_notifier(section->mr, &giommu->n);
> +        memory_region_register_iommu_notifier(mr, &giommu->n);
>          memory_region_iommu_replay(giommu->iommu, &giommu->n);
>  
>          return;
>      }
>  
> -    /* Here we assume that memory_region_is_ram(section->mr)==true */
> +    /* Here we assume that memory_region_is_ram(mr)==true */
>  
> -    vaddr = memory_region_get_ram_ptr(section->mr) +
> +    vaddr = memory_region_get_ram_ptr(mr) +
>              section->offset_within_region +
>              (iova - section->offset_within_address_space);
>  
> @@ -648,12 +653,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
>  
>      llsize = int128_sub(llend, int128_make64(iova));
>  
> -    if (memory_region_is_ram_device(section->mr)) {
> +    if (memory_region_is_ram_device(mr)) {
>          hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
>  
>          if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
>              trace_vfio_listener_region_add_no_dma_map(
> -                memory_region_name(section->mr),
> +                memory_region_name(mr),
>                  section->offset_within_address_space,
>                  int128_getlo(section->size),
>                  pgmask + 1);
> @@ -664,11 +669,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      ret = vfio_dma_map(container, iova, int128_get64(llsize),
>                         vaddr, section->readonly);
>      if (ret) {
> -        error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> -                     "0x%"HWADDR_PRIx", %p) = %d (%m)",
> -                     container, iova, int128_get64(llsize), vaddr, ret);
> -        if (memory_region_is_ram_device(section->mr)) {
> +        error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
> +                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
> +                   container, iova, int128_get64(llsize), vaddr, ret);
> +        if (memory_region_is_ram_device(mr)) {
>              /* Allow unexpected mappings not to be fatal for RAM devices */
> +            error_report_err(err);
>              return;
>          }
>          goto fail;
> @@ -677,7 +683,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      return;
>  
>  fail:
> -    if (memory_region_is_ram_device(section->mr)) {
> +    if (memory_region_is_ram_device(mr)) {
>          error_report("failed to vfio_dma_map. pci p2p may not work");
>          return;
>      }
> @@ -688,10 +694,14 @@ fail:
>       */
>      if (!container->initialized) {
>          if (!container->error) {
> -            container->error = ret;
> +            error_propagate_prepend(&container->error, err,
> +                                    "Region %s: ", memory_region_name(mr));
> +        } else {
> +            error_free(err);
>          }
>      } else {
> -        hw_error("vfio: DMA mapping failed, unable to continue");

As Peter notes, this removal is troubling.  Thanks,

Alex

> +        error_reportf_err(err,
> +                          "vfio: DMA mapping failed, unable to continue: ");
>      }
>  }
>  
> @@ -1251,6 +1261,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container = g_malloc0(sizeof(*container));
>      container->space = space;
>      container->fd = fd;
> +    container->error = NULL;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>  
> @@ -1308,9 +1319,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>                                       &address_space_memory);
>              if (container->error) {
>                  memory_listener_unregister(&container->prereg_listener);
> -                ret = container->error;
> -                error_setg(errp,
> -                    "RAM memory listener initialization failed for container");
> +                ret = -1;
> +                error_propagate_prepend(errp, container->error,
> +                    "RAM memory listener initialization failed: ");
>                  goto free_container_exit;
>              }
>          }
> @@ -1365,9 +1376,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      memory_listener_register(&container->listener, container->space->as);
>  
>      if (container->error) {
> -        ret = container->error;
> -        error_setg_errno(errp, -ret,
> -                         "memory listener initialization failed for container");
> +        ret = -1;
> +        error_propagate_prepend(errp, container->error,
> +            "memory listener initialization failed: ");
>          goto listener_release_exit;
>      }
>  
> diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
> index 96c0ad9d9b..e853eebe11 100644
> --- a/hw/vfio/spapr.c
> +++ b/hw/vfio/spapr.c
> @@ -17,6 +17,7 @@
>  #include "hw/hw.h"
>  #include "exec/ram_addr.h"
>  #include "qemu/error-report.h"
> +#include "qapi/error.h"
>  #include "trace.h"
>  
>  static bool vfio_prereg_listener_skipped_section(MemoryRegionSection *section)
> @@ -85,7 +86,8 @@ static void vfio_prereg_listener_region_add(MemoryListener *listener,
>           */
>          if (!container->initialized) {
>              if (!container->error) {
> -                container->error = ret;
> +                error_setg_errno(&container->error, -ret,
> +                                 "Memory registering failed");
>              }
>          } else {
>              hw_error("vfio: Memory registering failed, unable to continue");
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 9107bd41c0..fd564209ac 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -71,7 +71,7 @@ typedef struct VFIOContainer {
>      MemoryListener listener;
>      MemoryListener prereg_listener;
>      unsigned iommu_type;
> -    int error;
> +    Error *error;
>      bool initialized;
>      unsigned long pgsizes;
>      QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;


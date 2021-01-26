Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1755019lfd;
        Tue, 26 Jan 2021 14:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwU1xGFe9p2763wR2+uMqWSk4tI1P+1j9QGO7XrUk9AOhXcP3gcbU4eyPe87bPuFcgjT6t7
X-Received: by 2002:a25:3bd5:: with SMTP id i204mr11419051yba.19.1611700321226;
        Tue, 26 Jan 2021 14:32:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611700321; cv=none;
        d=google.com; s=arc-20160816;
        b=rSgPo86BgOkYWZ2r4MgJt9kKnwSNMk091GCmXKLCyCFycuylWtEcS7HFP6lwtDoPyI
         Pededv0gHbxTs5VGTDE+/WguAWT4594HyC8Usg6aLoppCpktZ9XpixE/uTHgDWnNYe0s
         FHos86PBKApTYp5+j6JBg+C0CpiPNK8AdLU+KUUfTMNmA7gijmpVRxxwsoybuZcYQMek
         bixum0pRn0R1JNlCH6SYYIxZvzS07lZIpJB277oDtm6lhmzlhvH7Zg8l/9W0vjdpeQDl
         Epf8mVF/7MSHldghV3eC7IEXWseTB2tTHDc3Eicd3CtOTHe3YyGaMvJqgR1EvUYRBxjm
         NZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=1OHnnppItEHa7Ul9xTQcaH0lLol0YTC2DtfRl89I/0k=;
        b=gxp562ICyyoQTNGjOC1jNymzvcwvEY9EUEllYZCf0rYMVYFGtPUXkfD2WmK3XdMU63
         NpNSPiQVrDW6UA6CCHgd88FkZGBkZLAnuUJ39QV1ggBGffYQkCrMCDfoIEvIFNVokTn7
         9vjWHw69hXXduWreQtl49AxXErIIsfgslkHRGks0QHnL8VkZP0Lv6qd243G4ZIzyrF06
         Ubg69dL9bMu5wj4Dp4VNy13r1WJnrvQ4mD4q0YYba708h4vdll8PfsELuzi/dx3GEX59
         dm8YwKvZ4HSMtSzK/vptsekxicdqz8GILezaESlfIp9ghIx+KVIGJR9r0AvR/JP98uw/
         uWUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bE6U5wGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36si24382632ybi.328.2021.01.26.14.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 14:32:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bE6U5wGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4WsS-0003ZS-IS
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 17:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4WqT-0002w2-Su
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 17:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4WqP-0005Pg-LW
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 17:29:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611700192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1OHnnppItEHa7Ul9xTQcaH0lLol0YTC2DtfRl89I/0k=;
 b=bE6U5wGvPrJXYkCrrTTyf/S7pxez10axdAn5hS2I32L+rPoK+AJ/A2wrc/lHhDQvqZmLep
 l/IeAoWeHwa8Nsh+iFehjkloGA7kmqxPfrvJa2ELd3pE4s6CI0Iszj6tkoZqZN/1sHUmPX
 AARQCeyqYMetNc19tGdPSbzvUIIUtQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-mfIRZBBQMfCRlW_i-HMvOg-1; Tue, 26 Jan 2021 17:29:49 -0500
X-MC-Unique: mfIRZBBQMfCRlW_i-HMvOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7F591220;
 Tue, 26 Jan 2021 22:29:47 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12EC46F927;
 Tue, 26 Jan 2021 22:29:40 +0000 (UTC)
Date: Tue, 26 Jan 2021 15:29:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Message-ID: <20210126152940.17a4cf7e@omen.home.shazbot.org>
In-Reply-To: <20210111073439.20236-1-zhukeqian1@huawei.com>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WNHZAvI3gw+Z


Kirti?  Migration experts?  Thanks,

Alex

On Mon, 11 Jan 2021 15:34:39 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> For now the switch of vfio dirty page tracking is integrated into
> the vfio_save_handler, it causes some problems [1].
> 
> The object of dirty tracking is guest memory, but the object of
> the vfio_save_handler is device state. This mixed logic produces
> unnecessary coupling and conflicts:
> 
> 1. Coupling: Their saving granule is different (perVM vs perDevice).
>    vfio will enable dirty_page_tracking for each devices, actually
>    once is enough.
> 2. Conflicts: The ram_save_setup() traverses all memory_listeners
>    to execute their log_start() and log_sync() hooks to get the
>    first round dirty bitmap, which is used by the bulk stage of
>    ram saving. However, it can't get dirty bitmap from vfio, as
>    @savevm_ram_handlers is registered before @vfio_save_handler.
> 
> Move the switch of vfio dirty_page_tracking into vfio_memory_listener
> can solve above problems. Besides, Do not require devices in SAVING
> state for vfio_sync_dirty_bitmap().
> 
> [1] https://www.spinics.net/lists/kvm/msg229967.html
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/vfio/common.c    | 53 +++++++++++++++++++++++++++++++++++++--------
>  hw/vfio/migration.c | 35 ------------------------------
>  2 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..9128cd7ee1 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -311,7 +311,7 @@ bool vfio_mig_active(void)
>      return true;
>  }
>  
> -static bool vfio_devices_all_saving(VFIOContainer *container)
> +static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>  {
>      VFIOGroup *group;
>      VFIODevice *vbasedev;
> @@ -329,13 +329,8 @@ static bool vfio_devices_all_saving(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
> -                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> -                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
> -                        return false;
> -                }
> -                continue;
> -            } else {
> +            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> +                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
>                  return false;
>              }
>          }
> @@ -987,6 +982,44 @@ static void vfio_listener_region_del(MemoryListener *listener,
>      }
>  }
>  
> +static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
> +{
> +    int ret;
> +    struct vfio_iommu_type1_dirty_bitmap dirty = {
> +        .argsz = sizeof(dirty),
> +    };
> +
> +    if (start) {
> +        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
> +    } else {
> +        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
> +    }
> +
> +    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
> +    if (ret) {
> +        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
> +                     dirty.flags, errno);
> +    }
> +}
> +
> +static void vfio_listener_log_start(MemoryListener *listener,
> +                                    MemoryRegionSection *section,
> +                                    int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, true);
> +}
> +
> +static void vfio_listener_log_stop(MemoryListener *listener,
> +                                   MemoryRegionSection *section,
> +                                   int old, int new)
> +{
> +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +
> +    vfio_set_dirty_page_tracking(container, false);
> +}
> +
>  static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
>                                   uint64_t size, ram_addr_t ram_addr)
>  {
> @@ -1128,7 +1161,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>          return;
>      }
>  
> -    if (vfio_devices_all_saving(container)) {
> +    if (vfio_devices_all_dirty_tracking(container)) {
>          vfio_sync_dirty_bitmap(container, section);
>      }
>  }
> @@ -1136,6 +1169,8 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>  static const MemoryListener vfio_memory_listener = {
>      .region_add = vfio_listener_region_add,
>      .region_del = vfio_listener_region_del,
> +    .log_start = vfio_listener_log_start,
> +    .log_stop = vfio_listener_log_stop,
>      .log_sync = vfio_listerner_log_sync,
>  };
>  
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 00daa50ed8..c0f646823a 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -395,40 +395,10 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>  
> -static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool start)
> -{
> -    int ret;
> -    VFIOMigration *migration = vbasedev->migration;
> -    VFIOContainer *container = vbasedev->group->container;
> -    struct vfio_iommu_type1_dirty_bitmap dirty = {
> -        .argsz = sizeof(dirty),
> -    };
> -
> -    if (start) {
> -        if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
> -            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
> -        } else {
> -            return -EINVAL;
> -        }
> -    } else {
> -            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
> -    }
> -
> -    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
> -    if (ret) {
> -        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
> -                     dirty.flags, errno);
> -        return -errno;
> -    }
> -    return ret;
> -}
> -
>  static void vfio_migration_cleanup(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
>  
> -    vfio_set_dirty_page_tracking(vbasedev, false);
> -
>      if (migration->region.mmaps) {
>          vfio_region_unmap(&migration->region);
>      }
> @@ -469,11 +439,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> -    ret = vfio_set_dirty_page_tracking(vbasedev, true);
> -    if (ret) {
> -        return ret;
> -    }
> -
>      qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>  
>      ret = qemu_file_get_error(f);


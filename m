Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7400680ejc;
        Wed, 1 Mar 2023 12:55:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9kpNHP32EGHtxQoq/wKgMCTVPWrT6qtlvWo1QsVFkWtwcCP7AV44bM92/SIFwwQZC+uMJj
X-Received: by 2002:ad4:5dea:0:b0:56e:c3bf:d9d2 with SMTP id jn10-20020ad45dea000000b0056ec3bfd9d2mr29211691qvb.13.1677704118076;
        Wed, 01 Mar 2023 12:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677704118; cv=none;
        d=google.com; s=arc-20160816;
        b=LoGPwq3WVqw+CY14fjwBmwvSOf99Bc4jZpxEKnb9YZYkP98J4kvXt9cPFbtY2LYBUs
         DcG+/iN4MXzkgPB5FLLBpGNFVGBJEnkYDHDJPZIP7cfZq/9D0x5708kT0i3qjtI+GbH9
         qPpiXOgUb1NFpbZXl5iCkoeuwUyNbMUPpCfqUE09IPytg8gw6rhiXqKpFUJNq2luaxel
         JTJMwupmrL8Zc6ewcEQNlq5dWL/P3Y5Bp8mxY/joAhgfbJ+RLNSv5TmodThU5AFQvB/R
         Z1VaBB7mRR7auB/mO59zkPWzL5VnM8Nht3YlkLyaPxyNSVsS+y+lMzWq5jzw9Hl0UBjg
         E/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7G9B166shX+vhykaowA6gwVuWaS3dBy/5A4WhK+fTJc=;
        b=XY2h/INoU3QzKUVM7+SASwxVdU24DAVS81fI5BqG5ovi6HV4tNdCoDN9jCzrbBFRM9
         GKKxLOahKqEXl0b692Seshh/IbQHOyMKZaPbwM+wPWHLUveB6bX+BJpQYiNd15PxmNgf
         O1fxaGWnUw5mPxKld5saJ9N0U7qLC9EthJXBcvTCRXJeEDIczrGsQ9PuCSTlDXEVcOUE
         6DlJruEF6b9JUqHRqPlaTFTtX9/z+4QfrN0QgPZvAdQSKftRZ4CXiONBFzEtvEQSYUsg
         gAN3vbEPWgX7V6TiXrrtEz8J86r/CX25sz+tVkkvbsL2HW+OrUNDBSVMtdwm8LIx2lN5
         Vq9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRpMYjVJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05620a451300b0071db2c0ba6dsi12053764qkp.611.2023.03.01.12.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 12:55:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRpMYjVJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTTc-0001OT-UH; Wed, 01 Mar 2023 15:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTTb-0001OB-SE
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTTZ-00036D-7E
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7G9B166shX+vhykaowA6gwVuWaS3dBy/5A4WhK+fTJc=;
 b=hRpMYjVJGkncO3XmjL3MeoEVg5+Jrod8jW6p440SiqE8l+mGPImXsCXTYJV58OoMsW2JjL
 mLtwND0rS5K2wPeqEDB8DI4LQRZbx0uO1JJPJNCKz1h4Oxw7hj4hDm6cDPXsbOb/H0tzjl
 xegSmKTMsRYTQpH2JdK+XxdUNBRLUh0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-d-A6DsutPPKAHSRLwqOWXg-1; Wed, 01 Mar 2023 15:54:58 -0500
X-MC-Unique: d-A6DsutPPKAHSRLwqOWXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so4980142wmb.8
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 12:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677704097;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7G9B166shX+vhykaowA6gwVuWaS3dBy/5A4WhK+fTJc=;
 b=JuH7QZchjuPD87jvny3LbthocuLSi/jdW2b2+57W42GeNukUUnafbfp6CScGI8H4Ke
 4x+BHpAMY1Z/s+xw+JoBMPIPqkJuRiYrNsZCKi1Gnc3+4X4a50TeVMGDx6FTTYN2+RiA
 06dSpmCFOqgsJw0T6hPAD4CQ65fFB91RE3dubb4fMT1cCYjuxj81VN6xKARFqJHriHPV
 HV/ekKhupSk+s3nFMj0DyPqEJN9rnNpA0lerxld3N4DYeRgGdWOTcGZtUl+cC+oM+2hi
 BLnS4lBUakuhZs8voMuMC7Q5jxuMv+5CyJUtb/KKEQLjaoxC1i/MC2iFCCKx1/vrYL5U
 mGfA==
X-Gm-Message-State: AO0yUKUSD1UcBm+KXM6KT9btCvKOTttho9PyLPyGS4NobacwIIMrLI54
 yE5LKTm5lyLMda+8Sjnv+1Wi4yqFRn8GXmXHfOc4Jgc5MulXvo757Ggs9IweiWgyK1KGvec8xq5
 o9na7OQ/UNKbJbDo=
X-Received: by 2002:a05:600c:19d2:b0:3ea:e554:7815 with SMTP id
 u18-20020a05600c19d200b003eae5547815mr6700887wmq.9.1677704097494; 
 Wed, 01 Mar 2023 12:54:57 -0800 (PST)
X-Received: by 2002:a05:600c:19d2:b0:3ea:e554:7815 with SMTP id
 u18-20020a05600c19d200b003eae5547815mr6700830wmq.9.1677704097017; 
 Wed, 01 Mar 2023 12:54:57 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 he13-20020a05600c540d00b003e20cf0408esm653765wmb.40.2023.03.01.12.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 12:54:56 -0800 (PST)
Date: Wed, 1 Mar 2023 15:54:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Amit Shah <amit@kernel.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v6 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
Message-ID: <20230301155442-mutt-send-email-mst@kernel.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-5-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205040737.3567731-5-alxndr@bu.edu>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4385FWVztZwA

On Sat, Feb 04, 2023 at 11:07:37PM -0500, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/9pfs/xen-9p-backend.c        | 4 +++-
>  hw/block/dataplane/virtio-blk.c | 3 ++-
>  hw/block/dataplane/xen-block.c  | 5 +++--
>  hw/char/virtio-serial-bus.c     | 3 ++-
>  hw/display/qxl.c                | 9 ++++++---
>  hw/display/virtio-gpu.c         | 6 ++++--
>  hw/ide/ahci.c                   | 3 ++-
>  hw/ide/core.c                   | 3 ++-
>  hw/misc/imx_rngc.c              | 6 ++++--
>  hw/misc/macio/mac_dbdma.c       | 2 +-
>  hw/net/virtio-net.c             | 3 ++-
>  hw/nvme/ctrl.c                  | 6 ++++--
>  hw/scsi/mptsas.c                | 3 ++-
>  hw/scsi/scsi-bus.c              | 3 ++-
>  hw/scsi/vmw_pvscsi.c            | 3 ++-
>  hw/usb/dev-uas.c                | 3 ++-
>  hw/usb/hcd-dwc2.c               | 3 ++-
>  hw/usb/hcd-ehci.c               | 3 ++-
>  hw/usb/hcd-uhci.c               | 2 +-
>  hw/usb/host-libusb.c            | 6 ++++--
>  hw/usb/redirect.c               | 6 ++++--
>  hw/usb/xen-usb.c                | 3 ++-
>  hw/virtio/virtio-balloon.c      | 5 +++--
>  hw/virtio/virtio-crypto.c       | 3 ++-
>  24 files changed, 63 insertions(+), 33 deletions(-)
> 
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index 65c4979c3c..f077c1b255 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -441,7 +441,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
>          xen_9pdev->rings[i].ring.out = xen_9pdev->rings[i].data +
>                                         XEN_FLEX_RING_SIZE(ring_order);
>  
> -        xen_9pdev->rings[i].bh = qemu_bh_new(xen_9pfs_bh, &xen_9pdev->rings[i]);
> +        xen_9pdev->rings[i].bh = qemu_bh_new_guarded(xen_9pfs_bh,
> +                                                     &xen_9pdev->rings[i],
> +                                                     &DEVICE(xen_9pdev)->mem_reentrancy_guard);
>          xen_9pdev->rings[i].out_cons = 0;
>          xen_9pdev->rings[i].out_size = 0;
>          xen_9pdev->rings[i].inprogress = false;
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index b28d81737e..a6202997ee 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -127,7 +127,8 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev, VirtIOBlkConf *conf,
>      } else {
>          s->ctx = qemu_get_aio_context();
>      }
> -    s->bh = aio_bh_new(s->ctx, notify_guest_bh, s);
> +    s->bh = aio_bh_new_guarded(s->ctx, notify_guest_bh, s,
> +                               &DEVICE(vdev)->mem_reentrancy_guard);
>      s->batch_notify_vqs = bitmap_new(conf->num_queues);
>  
>      *dataplane = s;
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 2785b9e849..e31806b317 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -632,8 +632,9 @@ XenBlockDataPlane *xen_block_dataplane_create(XenDevice *xendev,
>      } else {
>          dataplane->ctx = qemu_get_aio_context();
>      }
> -    dataplane->bh = aio_bh_new(dataplane->ctx, xen_block_dataplane_bh,
> -                               dataplane);
> +    dataplane->bh = aio_bh_new_guarded(dataplane->ctx, xen_block_dataplane_bh,
> +                                       dataplane,
> +                                       &DEVICE(xendev)->mem_reentrancy_guard);
>  
>      return dataplane;
>  }
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index 7d4601cb5d..dd619f0731 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -985,7 +985,8 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    port->bh = qemu_bh_new(flush_queued_data_bh, port);
> +    port->bh = qemu_bh_new_guarded(flush_queued_data_bh, port,
> +                                   &dev->mem_reentrancy_guard);
>      port->elem = NULL;
>  }
>  
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index ec712d3ca2..c0460c4ef1 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -2201,11 +2201,14 @@ static void qxl_realize_common(PCIQXLDevice *qxl, Error **errp)
>  
>      qemu_add_vm_change_state_handler(qxl_vm_change_state_handler, qxl);
>  
> -    qxl->update_irq = qemu_bh_new(qxl_update_irq_bh, qxl);
> +    qxl->update_irq = qemu_bh_new_guarded(qxl_update_irq_bh, qxl,
> +                                          &DEVICE(qxl)->mem_reentrancy_guard);
>      qxl_reset_state(qxl);
>  
> -    qxl->update_area_bh = qemu_bh_new(qxl_render_update_area_bh, qxl);
> -    qxl->ssd.cursor_bh = qemu_bh_new(qemu_spice_cursor_refresh_bh, &qxl->ssd);
> +    qxl->update_area_bh = qemu_bh_new_guarded(qxl_render_update_area_bh, qxl,
> +                                              &DEVICE(qxl)->mem_reentrancy_guard);
> +    qxl->ssd.cursor_bh = qemu_bh_new_guarded(qemu_spice_cursor_refresh_bh, &qxl->ssd,
> +                                             &DEVICE(qxl)->mem_reentrancy_guard);
>  }
>  
>  static void qxl_realize_primary(PCIDevice *dev, Error **errp)
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 5e15c79b94..66ac9b6cc5 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1339,8 +1339,10 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
>  
>      g->ctrl_vq = virtio_get_queue(vdev, 0);
>      g->cursor_vq = virtio_get_queue(vdev, 1);
> -    g->ctrl_bh = qemu_bh_new(virtio_gpu_ctrl_bh, g);
> -    g->cursor_bh = qemu_bh_new(virtio_gpu_cursor_bh, g);
> +    g->ctrl_bh = qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
> +                                     &qdev->mem_reentrancy_guard);
> +    g->cursor_bh = qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
> +                                       &qdev->mem_reentrancy_guard);
>      QTAILQ_INIT(&g->reslist);
>      QTAILQ_INIT(&g->cmdq);
>      QTAILQ_INIT(&g->fenceq);
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 7ce001cacd..37091150cb 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1508,7 +1508,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
>      ahci_write_fis_d2h(ad);
>  
>      if (ad->port_regs.cmd_issue && !ad->check_bh) {
> -        ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
> +        ad->check_bh = qemu_bh_new_guarded(ahci_check_cmd_bh, ad,
> +                                           &DEVICE(ad)->mem_reentrancy_guard);
>          qemu_bh_schedule(ad->check_bh);
>      }
>  }
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 5d1039378f..8c8d1a8ec2 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -519,7 +519,8 @@ BlockAIOCB *ide_issue_trim(
>  
>      iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
>      iocb->s = s;
> -    iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
> +    iocb->bh = qemu_bh_new_guarded(ide_trim_bh_cb, iocb,
> +                                   &DEVICE(s)->mem_reentrancy_guard);
>      iocb->ret = 0;
>      iocb->qiov = qiov;
>      iocb->i = -1;
> diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
> index 632c03779c..082c6980ad 100644
> --- a/hw/misc/imx_rngc.c
> +++ b/hw/misc/imx_rngc.c
> @@ -228,8 +228,10 @@ static void imx_rngc_realize(DeviceState *dev, Error **errp)
>      sysbus_init_mmio(sbd, &s->iomem);
>  
>      sysbus_init_irq(sbd, &s->irq);
> -    s->self_test_bh = qemu_bh_new(imx_rngc_self_test, s);
> -    s->seed_bh = qemu_bh_new(imx_rngc_seed, s);
> +    s->self_test_bh = qemu_bh_new_guarded(imx_rngc_self_test, s,
> +                                          &dev->mem_reentrancy_guard);
> +    s->seed_bh = qemu_bh_new_guarded(imx_rngc_seed, s,
> +                                     &dev->mem_reentrancy_guard);
>  }
>  
>  static void imx_rngc_reset(DeviceState *dev)
> diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
> index 43bb1f56ba..80a789f32b 100644
> --- a/hw/misc/macio/mac_dbdma.c
> +++ b/hw/misc/macio/mac_dbdma.c
> @@ -914,7 +914,7 @@ static void mac_dbdma_realize(DeviceState *dev, Error **errp)
>  {
>      DBDMAState *s = MAC_DBDMA(dev);
>  
> -    s->bh = qemu_bh_new(DBDMA_run_bh, s);
> +    s->bh = qemu_bh_new_guarded(DBDMA_run_bh, s, &dev->mem_reentrancy_guard);
>  }
>  
>  static void mac_dbdma_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 3ae909041a..a170c724de 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2885,7 +2885,8 @@ static void virtio_net_add_queue(VirtIONet *n, int index)
>          n->vqs[index].tx_vq =
>              virtio_add_queue(vdev, n->net_conf.tx_queue_size,
>                               virtio_net_handle_tx_bh);
> -        n->vqs[index].tx_bh = qemu_bh_new(virtio_net_tx_bh, &n->vqs[index]);
> +        n->vqs[index].tx_bh = qemu_bh_new_guarded(virtio_net_tx_bh, &n->vqs[index],
> +                                                  &DEVICE(vdev)->mem_reentrancy_guard);
>      }
>  
>      n->vqs[index].tx_waiting = 0;
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index f25cc2c235..dcb250e772 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4318,7 +4318,8 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
>          QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
>      }
>  
> -    sq->bh = qemu_bh_new(nvme_process_sq, sq);
> +    sq->bh = qemu_bh_new_guarded(nvme_process_sq, sq,
> +                                 &DEVICE(sq->ctrl)->mem_reentrancy_guard);
>  
>      if (n->dbbuf_enabled) {
>          sq->db_addr = n->dbbuf_dbs + (sqid << 3);
> @@ -4708,7 +4709,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
>          }
>      }
>      n->cq[cqid] = cq;
> -    cq->bh = qemu_bh_new(nvme_post_cqes, cq);
> +    cq->bh = qemu_bh_new_guarded(nvme_post_cqes, cq,
> +                                 &DEVICE(cq->ctrl)->mem_reentrancy_guard);
>  }
>  
>  static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> index c485da792c..3de288b454 100644
> --- a/hw/scsi/mptsas.c
> +++ b/hw/scsi/mptsas.c
> @@ -1322,7 +1322,8 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
>      }
>      s->max_devices = MPTSAS_NUM_PORTS;
>  
> -    s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
> +    s->request_bh = qemu_bh_new_guarded(mptsas_fetch_requests, s,
> +                                        &DEVICE(dev)->mem_reentrancy_guard);
>  
>      scsi_bus_init(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info);
>  }
> diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
> index ceceafb2cd..e5c9f7a53d 100644
> --- a/hw/scsi/scsi-bus.c
> +++ b/hw/scsi/scsi-bus.c
> @@ -193,7 +193,8 @@ static void scsi_dma_restart_cb(void *opaque, bool running, RunState state)
>          AioContext *ctx = blk_get_aio_context(s->conf.blk);
>          /* The reference is dropped in scsi_dma_restart_bh.*/
>          object_ref(OBJECT(s));
> -        s->bh = aio_bh_new(ctx, scsi_dma_restart_bh, s);
> +        s->bh = aio_bh_new_guarded(ctx, scsi_dma_restart_bh, s,
> +                                   &DEVICE(s)->mem_reentrancy_guard);
>          qemu_bh_schedule(s->bh);
>      }
>  }
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index fa76696855..4de34536e9 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -1184,7 +1184,8 @@ pvscsi_realizefn(PCIDevice *pci_dev, Error **errp)
>          pcie_endpoint_cap_init(pci_dev, PVSCSI_EXP_EP_OFFSET);
>      }
>  
> -    s->completion_worker = qemu_bh_new(pvscsi_process_completion_queue, s);
> +    s->completion_worker = qemu_bh_new_guarded(pvscsi_process_completion_queue, s,
> +                                               &DEVICE(pci_dev)->mem_reentrancy_guard);
>  
>      scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev), &pvscsi_scsi_info);
>      /* override default SCSI bus hotplug-handler, with pvscsi's one */
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index 88f99c05d5..f013ded91e 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -937,7 +937,8 @@ static void usb_uas_realize(USBDevice *dev, Error **errp)
>  
>      QTAILQ_INIT(&uas->results);
>      QTAILQ_INIT(&uas->requests);
> -    uas->status_bh = qemu_bh_new(usb_uas_send_status_bh, uas);
> +    uas->status_bh = qemu_bh_new_guarded(usb_uas_send_status_bh, uas,
> +                                         &d->mem_reentrancy_guard);
>  
>      dev->flags |= (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
>      scsi_bus_init(&uas->bus, sizeof(uas->bus), DEVICE(dev), &usb_uas_scsi_info);
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index 8755e9cbb0..a0c4e782b2 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -1364,7 +1364,8 @@ static void dwc2_realize(DeviceState *dev, Error **errp)
>      s->fi = USB_FRMINTVL - 1;
>      s->eof_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_frame_boundary, s);
>      s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_work_timer, s);
> -    s->async_bh = qemu_bh_new(dwc2_work_bh, s);
> +    s->async_bh = qemu_bh_new_guarded(dwc2_work_bh, s,
> +                                      &dev->mem_reentrancy_guard);
>  
>      sysbus_init_irq(sbd, &s->irq);
>  }
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index d4da8dcb8d..c930c60921 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -2533,7 +2533,8 @@ void usb_ehci_realize(EHCIState *s, DeviceState *dev, Error **errp)
>      }
>  
>      s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ehci_work_timer, s);
> -    s->async_bh = qemu_bh_new(ehci_work_bh, s);
> +    s->async_bh = qemu_bh_new_guarded(ehci_work_bh, s,
> +                                      &dev->mem_reentrancy_guard);
>      s->device = dev;
>  
>      s->vmstate = qemu_add_vm_change_state_handler(usb_ehci_vm_state_change, s);
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index 30ae0104bb..bdc891f57a 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -1193,7 +1193,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
>                                USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL);
>          }
>      }
> -    s->bh = qemu_bh_new(uhci_bh, s);
> +    s->bh = qemu_bh_new_guarded(uhci_bh, s, &DEVICE(dev)->mem_reentrancy_guard);
>      s->frame_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, uhci_frame_timer, s);
>      s->num_ports_vmstate = NB_PORTS;
>      QTAILQ_INIT(&s->queues);
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index 176868d345..f500db85ab 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1141,7 +1141,8 @@ static void usb_host_nodev_bh(void *opaque)
>  static void usb_host_nodev(USBHostDevice *s)
>  {
>      if (!s->bh_nodev) {
> -        s->bh_nodev = qemu_bh_new(usb_host_nodev_bh, s);
> +        s->bh_nodev = qemu_bh_new_guarded(usb_host_nodev_bh, s,
> +                                          &DEVICE(s)->mem_reentrancy_guard);
>      }
>      qemu_bh_schedule(s->bh_nodev);
>  }
> @@ -1739,7 +1740,8 @@ static int usb_host_post_load(void *opaque, int version_id)
>      USBHostDevice *dev = opaque;
>  
>      if (!dev->bh_postld) {
> -        dev->bh_postld = qemu_bh_new(usb_host_post_load_bh, dev);
> +        dev->bh_postld = qemu_bh_new_guarded(usb_host_post_load_bh, dev,
> +                                             &DEVICE(dev)->mem_reentrancy_guard);
>      }
>      qemu_bh_schedule(dev->bh_postld);
>      dev->bh_postld_pending = true;
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index fd7df599bc..39fbaaab16 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -1441,8 +1441,10 @@ static void usbredir_realize(USBDevice *udev, Error **errp)
>          }
>      }
>  
> -    dev->chardev_close_bh = qemu_bh_new(usbredir_chardev_close_bh, dev);
> -    dev->device_reject_bh = qemu_bh_new(usbredir_device_reject_bh, dev);
> +    dev->chardev_close_bh = qemu_bh_new_guarded(usbredir_chardev_close_bh, dev,
> +                                                &DEVICE(dev)->mem_reentrancy_guard);
> +    dev->device_reject_bh = qemu_bh_new_guarded(usbredir_device_reject_bh, dev,
> +                                                &DEVICE(dev)->mem_reentrancy_guard);
>      dev->attach_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL, usbredir_do_attach, dev);
>  
>      packet_id_queue_init(&dev->cancelled, dev, "cancelled");
> diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
> index 0f7369e7ed..dec91294ad 100644
> --- a/hw/usb/xen-usb.c
> +++ b/hw/usb/xen-usb.c
> @@ -1021,7 +1021,8 @@ static void usbback_alloc(struct XenLegacyDevice *xendev)
>  
>      QTAILQ_INIT(&usbif->req_free_q);
>      QSIMPLEQ_INIT(&usbif->hotplug_q);
> -    usbif->bh = qemu_bh_new(usbback_bh, usbif);
> +    usbif->bh = qemu_bh_new_guarded(usbback_bh, usbif,
> +                                    &DEVICE(xendev)->mem_reentrancy_guard);
>  }
>  
>  static int usbback_free(struct XenLegacyDevice *xendev)
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..309cebacc6 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -908,8 +908,9 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>          precopy_add_notifier(&s->free_page_hint_notify);
>  
>          object_ref(OBJECT(s->iothread));
> -        s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
> -                                     virtio_ballloon_get_free_page_hints, s);
> +        s->free_page_bh = aio_bh_new_guarded(iothread_get_aio_context(s->iothread),
> +                                             virtio_ballloon_get_free_page_hints, s,
> +                                             &DEVICE(s)->mem_reentrancy_guard);
>      }
>  
>      if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_REPORTING)) {
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 516425e26a..4c95f1096e 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -1050,7 +1050,8 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
>          vcrypto->vqs[i].dataq =
>                   virtio_add_queue(vdev, 1024, virtio_crypto_handle_dataq_bh);
>          vcrypto->vqs[i].dataq_bh =
> -                 qemu_bh_new(virtio_crypto_dataq_bh, &vcrypto->vqs[i]);
> +                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->vqs[i],
> +                                     &dev->mem_reentrancy_guard);
>          vcrypto->vqs[i].vcrypto = vcrypto;
>      }
>  
> -- 
> 2.39.0


Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp1438555ejt;
        Fri, 16 Jun 2023 07:45:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75iBxjlcpEBpAxZE15XHL72cHujBeOHLOsD1IbCwATIHyzJ9kGxAEYVc4fh4jDjkhk5bdz
X-Received: by 2002:ac8:7e86:0:b0:3f6:c0f7:a5c4 with SMTP id w6-20020ac87e86000000b003f6c0f7a5c4mr2843830qtj.25.1686926734940;
        Fri, 16 Jun 2023 07:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686926734; cv=none;
        d=google.com; s=arc-20160816;
        b=uiCX9klyQHk13Bc+CjN3cakM/kvO0eAqwiyuymCkcBGBicWSKXxluEDfCZQRlQgrr0
         Wo+82rRfo6ChhfgFlGxZkKZr3FKYKKDb5X6pRoETvT8s891g2te2KXpTo8r0Tm1OA4Xh
         aelwb2vi6n4zY9M4O5rmlTWXK2R5YZawB3oPFSYpg/AK2Wy4bxI+9TxlHGP9R/jVBzKY
         KAboEkmazcIUTzWpsHFLnmJ/Htr6Xb4QUc3dpnT+u4VKC9HMjs9pbHq1PjqnW3kWk11c
         F93368mxHg75oNuWyNJruFpuNKImZcEkEZrYN//sxCXTLYIcswFBCy6+zvvLL8hxiuVx
         7Q+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4PEESTFEwGOyD5A7B35RXNYYYjRW1i8IabcsUrOKSeI=;
        b=JsOG2Ba0btM85MaxD4vz3P8NqYW15NztK7MB83/ZzO43ZzKCwf0ZOiADSyGGIK24W4
         /XrBVtSom20q3+HqXsSfwex6Ca9HsDfDhWlgPmEt5tgYqlLrg1avo16xfvWMok4rj7Pz
         d+ZhWQHeM2ogeDJ0emSmTDeKRW2A/Qj1UHjgaSvSFaItzifAO9dAsa/GnbMzrNPKwSYC
         DOGzeWWlwcsrVHx65xMyJKPnEa57eU8PnxtjH2HSH6+EODC/Eno2NN2vH1bfdRoN6gUO
         kn2OGGpMF0w97H+JEPy9NLJuaxNWNnT4DKZt71U7hoeTVuJbpMGBfBOLljHizS8abt46
         t0wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=My23+SJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020ac85888000000b003f6bb129f91si10365126qta.807.2023.06.16.07.45.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jun 2023 07:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=My23+SJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qAAhW-0004x0-OZ; Fri, 16 Jun 2023 10:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qAAhV-0004wK-6F
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 10:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qAAhR-0002QD-Ju
 for qemu-arm@nongnu.org; Fri, 16 Jun 2023 10:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686926708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4PEESTFEwGOyD5A7B35RXNYYYjRW1i8IabcsUrOKSeI=;
 b=My23+SJrncDrada6rsHurY4FPAZOf2xjSoYJ0xDZ054cPzS0F4BYxeXHaBlrLgyIQU3Cim
 VUZ9Cdtd65YRk3bWN6WG5Xi/gez3U1Ilt9MfMkPFerkYVEUv06dPPtr9hXP4YqAXzA1YvY
 1LtCn/FgTPAWM5SpaHJfeLXnC4tOFW4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-MMbo4hd7NgWQeDz0x0UOKw-1; Fri, 16 Jun 2023 10:45:07 -0400
X-MC-Unique: MMbo4hd7NgWQeDz0x0UOKw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4f658076c93so638063e87.0
 for <qemu-arm@nongnu.org>; Fri, 16 Jun 2023 07:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686926706; x=1689518706;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PEESTFEwGOyD5A7B35RXNYYYjRW1i8IabcsUrOKSeI=;
 b=GRajEmrfzF5wkKDynPo8+CBo8gcjCFkeu9zhqL0gCVlq3Z54gQX1yFL3LJNfZlwKmq
 4Ky1zSWVLM03Gk/5iKU5CnSZXCf5SjBOv2y17Azmc/AYlN0w0c+GITc+WzChHbhfBVSE
 PBF3sOq5FsGZ0aJDvy8qGKedx9sNM7OKCstN4IXR3rGkeT0WIqVYfbIQJn3+6hpERseA
 eV/pJUJhA6LEHt2yfL5y2MoFdEZGaBa4Iq8nvyyIFZvLNF9RwMRkKSODVxcLBuZ6O4GY
 fABrWKORTOxjra5Jc6Vene2LulpU6oYVBwSG8y/QShQdkm0Pbldi8QPooziEhJGh3sSe
 a6qg==
X-Gm-Message-State: AC+VfDyTkTGu/1LngsUjEpwjUASyjryHr0dGjWt6pk/ZQmj2yNyriKLG
 1jX51iklYB+ndzwGo4rf+0UavrhWc6rdiLqfmNXdA5XRl5SXti/DdNndDivEddVzE+i4FggiX4H
 uZ0d5weBeu7KE
X-Received: by 2002:a05:6512:2f4:b0:4f8:582e:f4f2 with SMTP id
 m20-20020a05651202f400b004f8582ef4f2mr1328157lfq.47.1686926705670; 
 Fri, 16 Jun 2023 07:45:05 -0700 (PDT)
X-Received: by 2002:a05:6512:2f4:b0:4f8:582e:f4f2 with SMTP id
 m20-20020a05651202f400b004f8582ef4f2mr1328134lfq.47.1686926705259; 
 Fri, 16 Jun 2023 07:45:05 -0700 (PDT)
Received: from redhat.com (46-223-98.internethome.cytanet.com.cy.
 [46.199.223.98]) by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003f427687ba7sm2380545wmc.41.2023.06.16.07.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 07:45:04 -0700 (PDT)
Date: Fri, 16 Jun 2023 10:45:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 05/12] hw/virtio: Add support for apple virtio-blk
Message-ID: <20230616104401-mutt-send-email-mst@kernel.org>
References: <20230614224038.86148-1-graf>
 <20230614225626.97734-1-graf@amazon.com>
 <ZIxMIyi1KY7Ku9Xm@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZIxMIyi1KY7Ku9Xm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wmwt1FFWeehG

On Fri, Jun 16, 2023 at 01:48:51PM +0200, Kevin Wolf wrote:
> Am 15.06.2023 um 00:56 hat Alexander Graf geschrieben:
> > Apple has its own virtio-blk PCI device ID where it deviates from the
> > official virtio-pci spec slightly: It puts a new "apple type"
> > field at a static offset in config space and introduces a new discard
> > command.
> 
> In other words, it's a different device. We shouldn't try to
> differentiate only with a property, but actually model it as a separate
> device.
> 
> > This patch adds a new qdev property called "apple-type" to virtio-blk-pci.
> > When that property is set, we assume the virtio-blk device is an Apple one
> > of the specific type and act accordingly.
> 
> Do we have any information on what the number in "apple-type" actually
> means or do we have to treat it as a black box?
> 
> > Signed-off-by: Alexander Graf <graf@amazon.com>
> > ---
> >  hw/block/virtio-blk.c                       | 23 +++++++++++++++++++++
> >  hw/virtio/virtio-blk-pci.c                  |  7 +++++++
> >  include/hw/pci/pci_ids.h                    |  1 +
> >  include/hw/virtio/virtio-blk.h              |  1 +
> >  include/standard-headers/linux/virtio_blk.h |  3 +++
> >  5 files changed, 35 insertions(+)
> > 
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index 39e7f23fab..76b85bb3cb 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -1120,6 +1120,20 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
> >  
> >          break;
> >      }
> > +    case VIRTIO_BLK_T_APPLE1:
> 
> Can we have a more descriptive name?
> 
> > +    {
> > +        if (s->conf.x_apple_type) {
> > +            /* Only valid on Apple Virtio */
> > +            char buf[iov_size(in_iov, in_num)];
> > +            memset(buf, 0, sizeof(buf));
> > +            iov_from_buf(in_iov, in_num, 0, buf, sizeof(buf));
> > +            virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
> 
> So this is a command that simply fills the guest buffer with zeros
> without accessing the disk content? Weird, but ok, if that's what they
> are doing...
> 
> The commit message talks about a discard command. I would have expected
> a command that discards/unmaps data from the disk. I think it would be
> good to call it something else in the commit message if it has nothing
> to do with this.
> 
> > +        } else {
> > +            virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
> > +        }
> > +        virtio_blk_free_request(req);
> > +        break;
> > +    }
> >      default:
> >          virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
> >          virtio_blk_free_request(req);
> > @@ -1351,6 +1365,10 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
> >      } else {
> >          blkcfg.zoned.model = VIRTIO_BLK_Z_NONE;
> >      }
> > +    if (s->conf.x_apple_type) {
> > +        /* Apple abuses the same location for its type id */
> > +        blkcfg.max_secure_erase_sectors = s->conf.x_apple_type;
> 
> Ideally, blkcfg would contain a union there. Since this is a type
> imported from the kernel, we can't change it inside of QEMU only. Works
> for me with this comment.
> 
> > +    }
> >      memcpy(config, &blkcfg, s->config_size);
> >  }
> >  
> > @@ -1625,6 +1643,10 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
> >  
> >      s->config_size = virtio_get_config_size(&virtio_blk_cfg_size_params,
> >                                              s->host_features);
> > +    if (s->conf.x_apple_type) {
> > +        /* Apple Virtio puts the blk type at 0x3c, make sure we have space. */
> > +        s->config_size = MAX(s->config_size, 0x3d);
> > +    }
> >      virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
> >  
> >      s->blk = conf->conf.blk;
> > @@ -1734,6 +1756,7 @@ static Property virtio_blk_properties[] = {
> >                         conf.max_write_zeroes_sectors, BDRV_REQUEST_MAX_SECTORS),
> >      DEFINE_PROP_BOOL("x-enable-wce-if-config-wce", VirtIOBlock,
> >                       conf.x_enable_wce_if_config_wce, true),
> > +    DEFINE_PROP_UINT32("x-apple-type", VirtIOBlock, conf.x_apple_type, 0),
> 
> In a separate device, this would probably be called "apple-type"
> (without "x-") like promised in the commit message?
> 
> If not, what is the reason for having an "x-" prefix?
> 
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >  
> > diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
> > index 9743bee965..5fbf98f750 100644
> > --- a/hw/virtio/virtio-blk-pci.c
> > +++ b/hw/virtio/virtio-blk-pci.c
> > @@ -62,6 +62,13 @@ static void virtio_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >      }
> >  
> >      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > +
> > +    if (conf->x_apple_type) {
> > +        /* Apple virtio-blk uses a different vendor/device id */
> > +        pci_config_set_vendor_id(vpci_dev->pci_dev.config, PCI_VENDOR_ID_APPLE);
> > +        pci_config_set_device_id(vpci_dev->pci_dev.config,
> > +                                 PCI_DEVICE_ID_APPLE_VIRTIO_BLK);
> > +    }
> >  }
> >  
> >  static void virtio_blk_pci_class_init(ObjectClass *klass, void *data)
> > diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> > index e4386ebb20..74e589a298 100644
> > --- a/include/hw/pci/pci_ids.h
> > +++ b/include/hw/pci/pci_ids.h
> > @@ -188,6 +188,7 @@
> >  #define PCI_DEVICE_ID_APPLE_UNI_N_AGP    0x0020
> >  #define PCI_DEVICE_ID_APPLE_U3_AGP       0x004b
> >  #define PCI_DEVICE_ID_APPLE_UNI_N_GMAC   0x0021
> > +#define PCI_DEVICE_ID_APPLE_VIRTIO_BLK   0x1a00
> >  
> >  #define PCI_VENDOR_ID_SUN                0x108e
> >  #define PCI_DEVICE_ID_SUN_EBUS           0x1000
> > diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
> > index dafec432ce..7117ce754c 100644
> > --- a/include/hw/virtio/virtio-blk.h
> > +++ b/include/hw/virtio/virtio-blk.h
> > @@ -46,6 +46,7 @@ struct VirtIOBlkConf
> >      uint32_t max_discard_sectors;
> >      uint32_t max_write_zeroes_sectors;
> >      bool x_enable_wce_if_config_wce;
> > +    uint32_t x_apple_type;
> >  };
> >  
> >  struct VirtIOBlockDataPlane;
> > diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
> > index 7155b1a470..bbea5d50b9 100644
> > --- a/include/standard-headers/linux/virtio_blk.h
> > +++ b/include/standard-headers/linux/virtio_blk.h
> > @@ -204,6 +204,9 @@ struct virtio_blk_config {
> >  /* Reset All zones command */
> >  #define VIRTIO_BLK_T_ZONE_RESET_ALL 26
> >  
> > +/* Write zeroes command */
> > +#define VIRTIO_BLK_T_APPLE1	0x10000
> 
> Hm... The commit message says discard, this says write zeroes, and the
> implementation seems to be read zeroes? I'm confused.

You can't add it here, this is from Linux.

> > +
> >  #ifndef VIRTIO_BLK_NO_LEGACY
> >  /* Barrier before this op. */
> >  #define VIRTIO_BLK_T_BARRIER	0x80000000
> 
> Kevin


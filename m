Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2807234lfk;
        Fri, 4 Feb 2022 11:36:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXr4gUKNOEJONFX+sYxzALfXqoOKkoD4/zckEo/T+q0Gl+Y253Knx0VAm+LXVLc2WXSmEN
X-Received: by 2002:a25:24f:: with SMTP id 76mr731635ybc.205.1644003384029;
        Fri, 04 Feb 2022 11:36:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644003384; cv=none;
        d=google.com; s=arc-20160816;
        b=iLVJA1cL0e6RgdOx04Usvb4m63a6/a9w3ErgBeLpiCtmkqH28nezA8yxHu5ljhE8uO
         ji0KAEs5YAOUNnvB7hf/lIgQLJOcIfpPlDbkwGVvN/0cH53qgqpYseELlfEggMx5++n0
         +FwCyWG2UOdhmT53pWC5aGYgG8krpy1B5aragqNhhStQF+OrY4gRZDX36Xtn2MIssjRW
         UVPCBpilgTVDbu+pW66gmH3PUoDM9vMgRdC8g2v4gs60zi1RvZtRCF/G/ItFLAFFHCnt
         34YiFKTjxQ2VcCyvDy2UOhrrYFbNrA5dj4MNW+TNtI15orRiogLhMfGUVEIVeJHD3UfZ
         ZCIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=u+tCEtA6w3SRY5er+xrGrscKNfSldiA1o94TVdtexkI=;
        b=ro/Tdn8/ANmstmqOofu1YHURr3kbCTLXkjtyr6SFdiGQgJJjxKGWRghbkzE3kopgP2
         oW0fs/JVRsIs/FjQ5okRaQvNPAs49I1CcShB1r/A0DX3c1GHp7/wId0lhMUiPTfpYJwG
         aGBgoBsB50E1jNgZ0T95t7iCo5ZalWxhIzvv8XPZ288QHLc6iqNGq4yqyiOFsDLFK3Qu
         Nx0hXDgWzIG+yqfgvKm8Ti6834dYOZOTKZtww0F7yDawGg0mLjC6ezR52sGrY0hcVzn7
         HsUwGatAUKXuGuXLKkUosdEomsbfcvBcZAgXzQ4yTOB8X7mrP7Z6Oj5zef1ywDh6Zsyt
         VDGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vf3HkhQw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si2792169ybu.64.2022.02.04.11.36.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Feb 2022 11:36:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vf3HkhQw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nG4Na-0005c8-Uh
	for alex.bennee@linaro.org; Fri, 04 Feb 2022 14:36:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nG4M6-0005Yd-Oj
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 14:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nG4M3-0003ew-NX
 for qemu-arm@nongnu.org; Fri, 04 Feb 2022 14:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644003277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+tCEtA6w3SRY5er+xrGrscKNfSldiA1o94TVdtexkI=;
 b=Vf3HkhQwRWODX4vU3hKHaCrm0JpE/RCCSmO5Q2xx/OyAFKUlYbtgOTDWxdKE2oNLpCqIJb
 xgpxcg4Vn3v7LY36RvwX+7Z0bfpGRVQsei7LPcqFDA4tbfc236lYyI72OOFB8w1vIZH+1j
 itC2CMcWd78eevFWo9SK22TA2XgzOXE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-KYAQvoe4NvCYv5xUbrcyXw-1; Fri, 04 Feb 2022 14:34:35 -0500
X-MC-Unique: KYAQvoe4NvCYv5xUbrcyXw-1
Received: by mail-wr1-f71.google.com with SMTP id
 l22-20020adfa396000000b001d8e6467fe8so2430602wrb.6
 for <qemu-arm@nongnu.org>; Fri, 04 Feb 2022 11:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u+tCEtA6w3SRY5er+xrGrscKNfSldiA1o94TVdtexkI=;
 b=uMyeB42cAynWupc+gmULixQ07ILl9G7N5xaql03RxcJjXJPlsdbsqlA7vgf1LRDp+U
 oM2CPfx607zCB5QItPnHb73A8eqBN56VBWSEim1dHNm/m/+FqfTu0DlSetnrvZaQYf+s
 Hso24UVn2G/FFJJzEcGRZ1+vfW7czMvfq9EPNYxz30x4ue3hQfOPA1WfXY+7rAN+7Z7I
 CPG2EfN0Wbj6ftyh7fGNZY851F2YduULCniAgB8b7FyAVQYmwzZDiHrgdH5c07l5I0pH
 5EMQjEdjefK1d6Iss0/+MRbYbf90WQm2apcGMwtOqwm4GEQLqvhB7ZP/b0RE3V2hvKCI
 yK3A==
X-Gm-Message-State: AOAM530bD319Uid+pOMu5/PxKnW60GediCGdQVJtbm97XSWQuCNBHY6+
 zAulpENsAyBV4QZoXmwxCq5U3f3ajbBjaw99beFZNnDuAGsdGrhK9FeazUv2tkz+UXbzlgNIr01
 QSkzYhcYQQPH+
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr3536989wmh.93.1644003273985; 
 Fri, 04 Feb 2022 11:34:33 -0800 (PST)
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr3536966wmh.93.1644003273724; 
 Fri, 04 Feb 2022 11:34:33 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id i19sm12623883wmq.45.2022.02.04.11.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 11:34:32 -0800 (PST)
Date: Fri, 4 Feb 2022 14:34:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 4/6] tests/qtest/vhost-user-blk-test: Setup MSIx to
 avoid error on aarch64
Message-ID: <20220204143345-mutt-send-email-mst@kernel.org>
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-5-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220118203833.316741-5-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 jean-philippe@linaro.org, eesposit@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MbgBhrQRELfb

On Tue, Jan 18, 2022 at 09:38:31PM +0100, Eric Auger wrote:
> When run on ARM, basic and indirect tests currently fail with the
> following error:
> 
> ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
> assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
> 
> Setting up and enabling MSIX fixes the issue.
> 
> Also remove the useless libqos/libqos-pc.h header inclusion.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>

Seems to cause a make check failure:

▶  71/713 ERROR:../tests/qtest/libqos/pci.c:232:qpci_device_enable: assertion failed (cmd & PCI_COMMAND_IO == PCI_COMMAND_IO): (0x00000000
+== 0x00000001) ERROR
^CWARNING: Received SIGTERM, exiting



> ---
>  tests/qtest/vhost-user-blk-test.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index 1316aae0fa..2606428df3 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -19,7 +19,6 @@
>  #include "standard-headers/linux/virtio_pci.h"
>  #include "libqos/qgraph.h"
>  #include "libqos/vhost-user-blk.h"
> -#include "libqos/libqos-pc.h"
>  
>  #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
>  #define QVIRTIO_BLK_TIMEOUT_US  (30 * 1000 * 1000)
> @@ -224,6 +223,10 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
>      char *data;
>      QTestState *qts = global_qtest;
>      QVirtQueue *vq;
> +    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
> +
> +    qpci_msix_enable(vpcidev->pdev);
> +    qvirtio_pci_set_msix_configuration_vector(vpcidev, alloc, 0);
>  
>      features = qvirtio_get_features(dev);
>      features = features & ~(QVIRTIO_F_BAD_FEATURE |
> @@ -236,9 +239,12 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
>      g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>  
>      vq = qvirtqueue_setup(dev, alloc, 0);
> +    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, alloc, 1);
>  
>      qvirtio_set_driver_ok(dev);
>  
> +    qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
> +
>      /* Write and read with 3 descriptor layout */
>      /* Write request */
>      req.type = VIRTIO_BLK_T_OUT;
> @@ -468,6 +474,10 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
>      uint8_t status;
>      char *data;
>      QTestState *qts = global_qtest;
> +    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
> +
> +    qpci_msix_enable(vpcidev->pdev);
> +    qvirtio_pci_set_msix_configuration_vector(vpcidev, t_alloc, 0);
>  
>      features = qvirtio_get_features(dev);
>      g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
> @@ -480,8 +490,12 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
>      g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
>  
>      vq = qvirtqueue_setup(dev, t_alloc, 0);
> +    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, t_alloc, 1);
> +
>      qvirtio_set_driver_ok(dev);
>  
> +    qvirtio_wait_queue_isr(qts, dev, vq, QVIRTIO_BLK_TIMEOUT_US);
> +
>      /* Write request */
>      req.type = VIRTIO_BLK_T_OUT;
>      req.ioprio = 1;
> -- 
> 2.26.3


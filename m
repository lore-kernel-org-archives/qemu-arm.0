Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1765190ejc;
        Fri, 10 Mar 2023 02:39:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/YzlRKvS5v8wR8TUsqmM9IWh5ZZH4j8mHHHaX6VRxOaD2CuPxPiGAZx/e0vezvYvvWhZNh
X-Received: by 2002:ac8:7d12:0:b0:3bf:da83:f8d6 with SMTP id g18-20020ac87d12000000b003bfda83f8d6mr43609658qtb.28.1678444772236;
        Fri, 10 Mar 2023 02:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678444772; cv=none;
        d=google.com; s=arc-20160816;
        b=svPCr+q8EDYU32nNgJm2kLYF/PhIQ/vcmLZWTQDbS21m07CZdFsbx60c/SoonQmswM
         Pvwzk2F1lSYVyOCOixf2QbCk4CvD6/9/rHQtHrXL9XfveuEBHd//H7gQ/w7XKRpjcFG/
         p6RVqhO5v22GzTQgU4ipN4aZ5HKC1Yk7hgH6zbjIJ/DgNbXMEIN8AoKPAgHrrWRmXV6F
         eY5+lvTn0fDNWcCat9FEvWayuOT6Bglp1RinkNjJpn1d2MqZUeOl/TlsipLIN+WvrixW
         dijm7rajrRqrXKyLGgLG9b0gIE+QMWbPr54+hRPrFZnGpPi+r3LdC05fS1IO6LpJpybn
         w49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uLsSJ9HfwXSuLvEmI+ykLii9J7TAAUU/sN9QFRCPKLM=;
        b=ofDersz1qju7p5Jq2DETiBFQbIgfDY3oJzwh7eaxLbA6ZoAoExF6JSIS9b9doAl0ld
         jxyf7a79SwF32QILzefBdxE11KxGZ68D4biK3wF1EPhicvgWVWXN8wRm7FraLOeLaRXR
         +iX+ZmufZtdkEJ0Fa6m4MohH2C35TISVroIIVAojHpwkY7Cnbbix9bukl/2aDpjEUUCD
         VyCSB9y3tUpiiCDX6Xv/ZHLEMQxVvlblUvJ0agykCmsY7BDKtPLs7SaYlSgDM8Hmvnbl
         JUuGfCbB1fk+/y8krZ+k6LDgjGq8/BYVsbvCTvgdpOMl7nhA15g27MbYR7HrUIZUifmV
         05EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ajQFHL77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac84e81000000b003b86bbedceasi1304067qtp.400.2023.03.10.02.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Mar 2023 02:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ajQFHL77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1paa9R-00084g-ID; Fri, 10 Mar 2023 05:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paa9P-00083v-JR
 for qemu-arm@nongnu.org; Fri, 10 Mar 2023 05:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paa9N-0006B0-Gv
 for qemu-arm@nongnu.org; Fri, 10 Mar 2023 05:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678444740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uLsSJ9HfwXSuLvEmI+ykLii9J7TAAUU/sN9QFRCPKLM=;
 b=ajQFHL771pv3gCBM4j1xn5RKCtupm4YUnBL2lE8be2glQbeFQVDlNpk5i1aUPQtxTixEi0
 nOGBZ/fBGkQC+A9o4tOsaGrLQJmjvF+fndooNA5i9BliNwpV2ns/8W+C+sP2RXpctC9dsY
 LJ0FIukRFMm1quGpbZGmautZT16Jw1A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-ZIgTT2kbOIuTL9V-X31HRQ-1; Fri, 10 Mar 2023 05:38:57 -0500
X-MC-Unique: ZIgTT2kbOIuTL9V-X31HRQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so1643027wmb.8
 for <qemu-arm@nongnu.org>; Fri, 10 Mar 2023 02:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444736;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLsSJ9HfwXSuLvEmI+ykLii9J7TAAUU/sN9QFRCPKLM=;
 b=p7/8U+bTRDPcY+U5Y+s96ZbjLrtm+hAe+vcvPcWoMtBMTva6QqslmPrXD/lYXCxNU/
 xzHu0Z9z3NLwK+Y0Qdjbxm0P7uG06Gi3yh4jFWj6ws5vFrF5ALqwAPfOWua9bdh6S7bU
 8mmg1bkObLTIIpyyK6tEQyc4A2Ilt98tjW2sjWSId4FixTNN59ivpzEZth0IqzyHFqHG
 Aoqj+vZUJFOn5lKOygexUQUatkH+0N7ujYoRVqVkjlqaC3jCaGOQX2t3lXp7Z/P5Lx8r
 uzWX+kehHZYCavd/qGLR09GEQK8U9BxLY0Oc4z+bxCqBHQfLZADH9QS85udstWuYKJqv
 yesA==
X-Gm-Message-State: AO0yUKXBOM4tlJiwyFRdfaXy2Xd4cW69BsATd1GW/owbS3hWwYBQLIuN
 ycCvsIMHrsP9hcClFeyvjg7ZdOQ0J15QjU+zk30r4g6PcEyKfouCQHJfOWAsK/E1elHMlDMeJS4
 mczGUWj2ds0t8
X-Received: by 2002:a05:600c:4f44:b0:3eb:383c:1870 with SMTP id
 m4-20020a05600c4f4400b003eb383c1870mr2188761wmq.11.1678444736251; 
 Fri, 10 Mar 2023 02:38:56 -0800 (PST)
X-Received: by 2002:a05:600c:4f44:b0:3eb:383c:1870 with SMTP id
 m4-20020a05600c4f4400b003eb383c1870mr2188722wmq.11.1678444735868; 
 Fri, 10 Mar 2023 02:38:55 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-140.web.vodafone.de.
 [109.43.178.140]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003e2058a7109sm2840339wmq.14.2023.03.10.02.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 02:38:55 -0800 (PST)
Message-ID: <289e9e47-be6d-1f7f-b0b6-f5b9ed5bc1e8@redhat.com>
Date: Fri, 10 Mar 2023 11:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Amit Shah <amit@kernel.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>,
 "open list:Old World (g3beige)" <qemu-ppc@nongnu.org>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-5-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v6 4/4] hw: replace most qemu_bh_new calls with
 qemu_bh_new_guarded
In-Reply-To: <20230205040737.3567731-5-alxndr@bu.edu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KYNYEF047Lja

On 05/02/2023 05.07, Alexander Bulekov wrote:
> This protects devices from bh->mmio reentrancy issues.
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
...
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index 65c4979c3c..f077c1b255 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -441,7 +441,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
>           xen_9pdev->rings[i].ring.out = xen_9pdev->rings[i].data +
>                                          XEN_FLEX_RING_SIZE(ring_order);
>   
> -        xen_9pdev->rings[i].bh = qemu_bh_new(xen_9pfs_bh, &xen_9pdev->rings[i]);
> +        xen_9pdev->rings[i].bh = qemu_bh_new_guarded(xen_9pfs_bh,
> +                                                     &xen_9pdev->rings[i],
> +                                                     &DEVICE(xen_9pdev)->mem_reentrancy_guard);

xen_9pdev is not derived from DeviceState, so you must not cast it with 
DEVICE().

> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 7ce001cacd..37091150cb 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -1508,7 +1508,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
>       ahci_write_fis_d2h(ad);
>   
>       if (ad->port_regs.cmd_issue && !ad->check_bh) {
> -        ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
> +        ad->check_bh = qemu_bh_new_guarded(ahci_check_cmd_bh, ad,
> +                                           &DEVICE(ad)->mem_reentrancy_guard);
>           qemu_bh_schedule(ad->check_bh);
>       }
>   }

Dito - ad is not derived from DeviceState, so you cannot use DEVICE() here.

(This was causing the crash in the macOS CI job)

> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index 5d1039378f..8c8d1a8ec2 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -519,7 +519,8 @@ BlockAIOCB *ide_issue_trim(
>   
>       iocb = blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
>       iocb->s = s;
> -    iocb->bh = qemu_bh_new(ide_trim_bh_cb, iocb);
> +    iocb->bh = qemu_bh_new_guarded(ide_trim_bh_cb, iocb,
> +                                   &DEVICE(s)->mem_reentrancy_guard);

IDEState s is also not directly derived from DeviceState. Not sure, but 
maybe you can get to the device here in a similar way that is done in 
ide_identify() :

      IDEDevice *dev = s->unit ? s->bus->slave : s->bus->master;

?

> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 746f07c4d2..309cebacc6 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -908,8 +908,9 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>           precopy_add_notifier(&s->free_page_hint_notify);
>   
>           object_ref(OBJECT(s->iothread));
> -        s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
> -                                     virtio_ballloon_get_free_page_hints, s);
> +        s->free_page_bh = aio_bh_new_guarded(iothread_get_aio_context(s->iothread),
> +                                             virtio_ballloon_get_free_page_hints, s,
> +                                             &DEVICE(s)->mem_reentrancy_guard);

You could use "dev" instead of "s" here to get rid of the DEVICE() cast.

The remaining changes look fine to me.

  Thomas


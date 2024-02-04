Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp501393ejb;
        Sun, 4 Feb 2024 00:27:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmL+GijeS+OMRQ0vhDfgkDNb+ZDBfPreXaYxoXltZlaNatTopwDtPcMaRDV9yB+415rqM7
X-Received: by 2002:ad4:5ccf:0:b0:68c:8b7d:1b4f with SMTP id iu15-20020ad45ccf000000b0068c8b7d1b4fmr5033627qvb.34.1707035223091;
        Sun, 04 Feb 2024 00:27:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707035223; cv=none;
        d=google.com; s=arc-20160816;
        b=KjAazfRe5nEsamHERRjJJhOs0HaPcFIIqZtNSs9ca1chx1PqQtIpz/t2weuhscFdoQ
         FmjZyBtIGghNP8JKSfSnzPH/XPMuCLCBQltBLSCR2HmMsYgdbuL1Yx0Zfy99KIf/e9Zv
         eFNPo0c/S4apridilOjrKnZD4vt3IrhFvD2CR9i7xelgMFPzlDEdvhSnLtEPUMLFj9lt
         EOx9TuTRQXoBQ59mSOjjRSrtkjq1FESD70IdCCWIXKDaIcgITv+fGDMfWL4+Ig1AdsXh
         595529HSktyfyS40H4Ex/mq4z3hGzUJ49EZDy+1KyT8QkLBYMtkpTcMyy1Fu2++HKwnU
         FosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AiCW7noQ4mWsxLf3VXie+aglCYUebh7ZqwivJ/jyoUw=;
        fh=B60B+qNzjdSP8q55v26o4k9+Q2UCGpLBVw0Y7ENgAdg=;
        b=oI3UYhUY/oqvPQ9/GzSMh+VzgmdoqYdYmPTF76t3awmrRf0YV08d30mhBYQC5AUWwV
         eu4JeRxictVXX8fAvfy/KUsx5QrCe3oXTMivJQwmxkG08jG+UvhnwtwbFXsiSbidmA2p
         GrsoIJuOnHT8aM554nrg2ElZ9IbUOwS3HuvwrICXGr/+YGMBCCNDyVsZY8XDA2/Ip7v1
         eTdCSOd5f4smh4aHUVYgsDtKiu+c+rP+o5azo410IdUlhdy66wSAzmAAQrda53d1HAJ3
         zqdHgStknaYqI6MVfNfsGnc/8Jvp6UdV7jO/3VFdTr9xl6tdWkP1Ki1cDiY88reG0jtE
         59cQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1bLHkHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCXgiQ3lyrpzsGS7xqMKgIidAa/bsGd42VIVx5v7veVWSFnkNtfJm/v9/u7ISqMTXOhtbi8Vcl2Sjy7EUBnfTKjSQgyG7y+6
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020a0ce7c2000000b0068c3cd4b483si5899899qvo.174.2024.02.04.00.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Feb 2024 00:27:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T1bLHkHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWXpr-0005WV-S7; Sun, 04 Feb 2024 03:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yanghliu@redhat.com>)
 id 1rWXpq-0005W3-57
 for qemu-arm@nongnu.org; Sun, 04 Feb 2024 03:26:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yanghliu@redhat.com>)
 id 1rWXpg-0001Kn-JV
 for qemu-arm@nongnu.org; Sun, 04 Feb 2024 03:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707035191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AiCW7noQ4mWsxLf3VXie+aglCYUebh7ZqwivJ/jyoUw=;
 b=T1bLHkHo8/AGAAZcxPwi3zD1cuhf13cIU+MAgGHDCw5jWxSJ7rLS3s4exj8nQ4y3BLbx1e
 VN10Rs3sOnu7FUxi2VkFNvYaTMFNJlwep2x6QD6fV9ypbsAI5yWc48S1xIIhrkKZob0gsQ
 s56YcMvRQ6tYlCUtzuurBUqYlK2yT7o=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-OAQc4MqsNkSjXBkDAJraSA-1; Sun, 04 Feb 2024 03:26:27 -0500
X-MC-Unique: OAQc4MqsNkSjXBkDAJraSA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6040aaa4e79so56953157b3.3
 for <qemu-arm@nongnu.org>; Sun, 04 Feb 2024 00:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707035187; x=1707639987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AiCW7noQ4mWsxLf3VXie+aglCYUebh7ZqwivJ/jyoUw=;
 b=B/tWdBj75mrOLOSkTmztiGziewWdYFe7M0egodiW2Wg1ztCcUjCdq7YmtvK8p2sBDg
 UlrTfL5HnXx54gfO60Ly5NOqxMyKV/SFP4JK39mpw+ELHqrC+ZL9BNoo7xw/fDyf1kL7
 qJhPZ38vGONtMFCm7rpySJ62jWQV1VVysD77r/pbZjl9v85LteoJYKmpJ9dYqoqWJQc0
 MxqaaFu/9gA8l1YLAA7IG1zx3G2cRDXRbrGapfQb4LQgtWC/kJg2gCBfLYvONyRnF3Zg
 140hEssKJK6dLjDZTpYY6h+dEvuvs7OLgUwsKvGD856DJzfHIJt7z1/weR0VZHCvjlWB
 n6aA==
X-Gm-Message-State: AOJu0YxXUCea6Btx0PWbMTJ3AOq92KQ4Pt5ZNqvcdhm8ev3o4P21e90J
 VbAAt6nLlTZwSSL6hTorxqbMLE3Gi6cSQ5caf92V3IOJggXNB7ixAbSOtWfc3GG/chXndboPMEy
 9GZI34JyvDrrVHb/hc5z0RZcIvdjn5pvY2gV0HeiSJ1swsKXfluxrqtdc84g9bdYCMm7hRJP6T6
 Ll54sIrVM16ZNAEsIvCkIOQs00
X-Received: by 2002:a81:4f45:0:b0:5ff:488c:9a6a with SMTP id
 d66-20020a814f45000000b005ff488c9a6amr7505905ywb.17.1707035186911; 
 Sun, 04 Feb 2024 00:26:26 -0800 (PST)
X-Received: by 2002:a81:4f45:0:b0:5ff:488c:9a6a with SMTP id
 d66-20020a814f45000000b005ff488c9a6amr7505894ywb.17.1707035186609; Sun, 04
 Feb 2024 00:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20240201163324.564525-1-eric.auger@redhat.com>
In-Reply-To: <20240201163324.564525-1-eric.auger@redhat.com>
From: YangHang Liu <yanghliu@redhat.com>
Date: Sun, 4 Feb 2024 16:26:15 +0800
Message-ID: <CAGYh1E8gHXcN3OxT84-xKXvweSAEnJf+OrMLnOUOgHvJJCm-rg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 jean-philippe@linaro.org, alex.williamson@redhat.com, 
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, mst@redhat.com, 
 clg@redhat.com, jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=yanghliu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.137,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lEX2qbKgnNmB

There is no VFIO_MAP_DMA error when hotplug 2 E810 PFs into a VM which
has a virtio-iommu device.

In addition, 21 regression tests of Tier1 level were run and all got PASS.

Tested-by: Yanghang Liu<yanghliu@redhat.com>


On Fri, Feb 2, 2024 at 12:33=E2=80=AFAM Eric Auger <eric.auger@redhat.com> =
wrote:
>
> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
> protected with a virtio-iommu is assigned to an x86 guest. On x86
> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
> whereas the virtio-iommu exposes a 64b input address space by default.
> Hence the guest may try to use the full 64b space and DMA MAP
> failures may be encountered. To work around this issue we endeavoured
> to pass usable host IOVA regions (excluding the out of range space) from
> VFIO to the virtio-iommu device so that the virtio-iommu driver can
> query those latter during the probe request and let the guest iommu
> kernel subsystem carve them out.
>
> However if there are several devices in the same iommu group,
> only the reserved regions of the first one are taken into
> account by the iommu subsystem of the guest. This generally
> works on baremetal because devices are not going to
> expose different reserved regions. However in our case, this
> may prevent from taking into account the host iommu geometry.
>
> So the simplest solution to this problem looks to introduce an
> input address width option, aw-bits, which matches what is
> done on the intel-iommu. By default, from now on it is set
> to 39 bits with pc_q35 and 48 with arm virt. This replaces the
> previous default value of 64b. So we need to introduce a compat
> for machines older than 9.0 to behave similarly. We use
> hw_compat_8_2 to acheive that goal.
>
> Outstanding series [2] remains useful to let resv regions beeing
> communicated on time before the probe request.
>
> [1] [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
>     https://lore.kernel.org/all/20231019134651.842175-1-eric.auger@redhat=
.com/
>     - This is merged -
>
> [2] [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for hot=
plugged devices
>     https://lore.kernel.org/all/20240117080414.316890-1-eric.auger@redhat=
.com/
>     - This is pending for review on the ML -
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v2
>
> Applied on top of [3]
> [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default page_siz=
e_mask
> https://lore.kernel.org/all/20240117132039.332273-1-eric.auger@redhat.com=
/
>
> History:
> v1 -> v2
> - Limit aw to 48b on ARM
> - Check aw is within [32,64]
> - Use hw_compat_8_2
>
> Eric Auger (3):
>   virtio-iommu: Add an option to define the input range width
>   virtio-iommu: Trace domain range limits as unsigned int
>   hw: Set virtio-iommu aw-bits default value on pc_q35_9.0 and arm virt
>
>  include/hw/virtio/virtio-iommu.h | 1 +
>  hw/arm/virt.c                    | 6 ++++++
>  hw/core/machine.c                | 5 ++++-
>  hw/i386/pc.c                     | 6 ++++++
>  hw/virtio/virtio-iommu.c         | 7 ++++++-
>  hw/virtio/trace-events           | 2 +-
>  6 files changed, 24 insertions(+), 3 deletions(-)
>
> --
> 2.41.0
>


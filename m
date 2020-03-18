Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp686854lfe;
        Wed, 18 Mar 2020 04:28:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vurKcNif9a9+oA/RT8mcqSeZqiceJm7a0emDiPtJIIcveKld4FgAOKUZxbZMTTMYKWQIPxh
X-Received: by 2002:a05:620a:2f8:: with SMTP id a24mr3529935qko.205.1584530930137;
        Wed, 18 Mar 2020 04:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584530930; cv=none;
        d=google.com; s=arc-20160816;
        b=lxmg0bXNmMq27M6Nq0WG3wRuZBbCI3jkjiidkq4ZL9Uo5JGRsnGCSlxPCgwyrgtVue
         WDBpY1paXHWyHvoZUUUAmLzZXLqn0amQ1iBiu/D36T2Bu8bXM2WahZmXXuBbpHsayeb5
         NHZ9mf+mIEnbhSyqLlgylciywUS3dQR7EJQ87bINIi6psAvFKeV/ht5EHt/TtSI7+gu5
         uuv4j5LUh6JfcUIiO4YNI9W4zKoC1Zaa1FKNK1Om9Md1WGcaBrQPVFdWBdwpGlbzNVvp
         wkC5rNXG7zn0O8enBfs2lKTqMyfzGR7mtt/JKoS6CliHzRCKc3uvmGhwVi7z+S73dKJa
         w+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YYiaxdq3GEr+yhR53QOC0XmBA5A6a1ROVCQOdPstx74=;
        b=wy8ItvejMM/RGmTWnoP2veuW0LQ5RCpAr9OhiED9QblX9WwaFBEE/rUoOQFYwb+eLO
         g+s3V9Jgzlc6ryS+kqivftJjGMCl3Uiiv/uIT96bt8tK3odt7JQuFbEc/D1sjK1TzNVD
         UzsOd7kHJw//+AFYcNbiE7w/afbyGoCS/KXTrVConBrSArtfsaz2g6eVcbcuKp/o6Pub
         YwrqRDQSISx4JkGWmJCeEVgB+i8NzYhTs0bbakcDzfZk/ZC2iX110I68Ld1S+Vdlj3Uu
         9yC3WEoSZDBs5rvNYFMYma4pGjeEOfqgojCm9O8XJeubk0P73MJDBr9nUwPFQxbKJDHo
         kH+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CguFjonL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si3810655qtq.269.2020.03.18.04.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 04:28:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CguFjonL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEWsT-0004ey-IL
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 07:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jEWsM-0004er-20
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 07:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jEWsL-0004rv-0g
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 07:28:41 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:51226)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jEWsK-0004rS-SY
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 07:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584530920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYiaxdq3GEr+yhR53QOC0XmBA5A6a1ROVCQOdPstx74=;
 b=CguFjonLq472WdUc+n8On7EEw8Fcovbe+fq3A0SMCsZA6xm62fxu4/j0y/o0fio9FStv2U
 UCvXUkFHmwyvNwC+nR9PNtFxV40bBFeKv06SfBTKn8GGgIbn3Qyisqa2x8IE9UNNeyilYt
 o3GudXve9P/IXt4b1pQyAB1GsKLXyK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-TA-jQDoOMR2v3KxjV4ThSg-1; Wed, 18 Mar 2020 07:28:37 -0400
X-MC-Unique: TA-jQDoOMR2v3KxjV4ThSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B3341005512;
 Wed, 18 Mar 2020 11:28:35 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16A725D9C5;
 Wed, 18 Mar 2020 11:28:23 +0000 (UTC)
Subject: Re: [PATCH v8 4/8] virtio-iommu: set supported page size mask
To: Bharat Bhushan <bbhushan2@marvell.com>, peter.maydell@linaro.org,
 peterx@redhat.com, eric.auger.pro@gmail.com, alex.williamson@redhat.com,
 kevin.tian@intel.com, mst@redhat.com, tnowicki@marvell.com,
 drjones@redhat.com, linuc.decode@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, bharatb.linux@gmail.com, jean-philippe@linaro.org,
 yang.zhong@intel.com
References: <20200318101159.8767-1-bbhushan2@marvell.com>
 <20200318101159.8767-5-bbhushan2@marvell.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3da60c1b-6897-7ab1-3a67-bec44fa00a54@redhat.com>
Date: Wed, 18 Mar 2020 12:28:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200318101159.8767-5-bbhushan2@marvell.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ftuVizc2A9ay

Hi Bharat,

On 3/18/20 11:11 AM, Bharat Bhushan wrote:
> Add optional interface to set page size mask.
> Currently this is set global configuration and not
> per endpoint.
> 
> Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> ---
> v7->v8:
>  - new patch
> 
>  hw/virtio/virtio-iommu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 4cee8083bc..c00a55348d 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -650,6 +650,15 @@ static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>      return (ua > ub) - (ua < ub);
>  }
>  
> +static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
> +                                            uint64_t page_size_mask)
> +{
> +    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> +    VirtIOIOMMU *s = sdev->viommu;
> +
> +    s->config.page_size_mask = page_size_mask;
The problem is page_size_mask is global to the VIRTIO-IOMMU.

- Can't different VFIO containers impose different/inconsistent settings?
- VFIO devices can be hotplugged. So we may start with some default
page_size_mask which is latter overriden by a host imposed one. Assume
you first launch the VM with a virtio NIC. This uses 64K. Then you
hotplug a VFIO device behind a physical IOMMU which only supports 4K
pages. Isn't it a valid scenario?

Thanks

Eric

> +}
> +
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> @@ -865,6 +874,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
>      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
>  
>      imrc->translate = virtio_iommu_translate;
> +    imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
>  }
>  
>  static const TypeInfo virtio_iommu_info = {
> 


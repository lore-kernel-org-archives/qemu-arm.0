Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp544990ejq;
        Wed, 24 Jan 2024 12:56:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZmSpp7XYtAco/wjAM6IFoHONAv4nfWfH6k7wltyz11IPjqS00EkuEMZg9FHnpM43XhbIL
X-Received: by 2002:a05:620a:438b:b0:783:a958:5cb3 with SMTP id a11-20020a05620a438b00b00783a9585cb3mr4041886qkp.21.1706129797830;
        Wed, 24 Jan 2024 12:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706129797; cv=none;
        d=google.com; s=arc-20160816;
        b=BSxA6piWPIm7Whpn0XyYDqd70eYOe7O/HBClyr/z2QPGdPtZ5gMRG3a6TEOTftL24p
         cDFFwtopUV1h8EfzMleBcNhLvapkeroq7serjR05SaTOf7r86W+Ht+DW1V3MdIEVCgW7
         swuZQqhtLcHvaB6K/wLbaWq7dFXCyYwIvdhqCS7NSjQ2IDGFSd1chHXHpIxHZGxG3MeC
         VrmqYOZMokWQPUDZSt9r3mdlHg1KHqEKZTKDAG5LCg93H1zAuyLUx5JFa0iAxwud2dZR
         tv36xJB4ANm/bWFy9DgVkFuKtk33XO63bNrEFLIjA2NEqVfshDq6Q3r4WbTo9n4ycWwJ
         b8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=buVzk3HyvBIdh21Cqn6CQiOqg/pULknLT8sljilCgLY=;
        fh=3ZRMErIroDuSap2RszxyIRR0o2ptPsIX5p5j+kfsr4A=;
        b=S8lNzZ8XIqQ0yOFqQiNUMHsM/FjgcM69p3DIM68NK+0BzhNECyQf2owHH17g1JIpNB
         8AQ56Kev6f9/oBweiqYcMNCn5hnmoHQt247YfNHYOpeFPP9XJ/KHhEurnVoL1OBGYerv
         eK/o3vDAQQ3JxDgqZkrmoc7BIbcurIyvSA+PgBskvAWzO+lZiHoM6NkvVsEetXiaIwl+
         nUqhCSeEEI30MMH2CRb4HWwK24INjpwRH2PbeZIfB6wERFAaQ3zCVEV/+7gUj4Q4H8jN
         LOjWT7hlo8bbhtVEB2qB69ySUExESrpBvLtQnwZO7wd4KBhz0FhLGrQ5jYBQLzN4dFxW
         2LNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a+dVDADc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05620a038700b00783a99fced4si4749752qkm.162.2024.01.24.12.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 12:56:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a+dVDADc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSkIA-0000FO-OT; Wed, 24 Jan 2024 15:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSkHw-0000EC-TL
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 15:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rSkHt-0006hm-UW
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 15:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706129756;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buVzk3HyvBIdh21Cqn6CQiOqg/pULknLT8sljilCgLY=;
 b=a+dVDADcaswfqlwaHX4PzkbxJbyIiVKf6f/YrtYKeUMw8Iug/R7WWQYK6PCA7DAs7CJYaK
 JaialWrJmL8VR6siraH4UbCAwu/UFbQhcTMMfAOVVcwLcozWiPkTMXhB9Z5T03MPHv3qms
 m2ymjcpShunVPT/U2E1Zd9vfWvyqgsc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-v2WlcGZfOKq7FbB5V9JpXw-1; Wed, 24 Jan 2024 15:55:55 -0500
X-MC-Unique: v2WlcGZfOKq7FbB5V9JpXw-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-dc26605c273so9496117276.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 12:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706129755; x=1706734555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buVzk3HyvBIdh21Cqn6CQiOqg/pULknLT8sljilCgLY=;
 b=YJtz7JI3ypniUFmgYMiN3Zzhvp+z/4u5VFMdWngmB+DnyHm5KgGe1wbGGLirbnio5q
 H4Q5WNLJiQWa7Ri2X8Wh7yT9MCTiI38gqsKl/An/bkFYvdNUcg0S6gIhsPLeAS9+yVf3
 Du2Ed6JBcCxt/4tkFGyQ23t/jvtzLq+1VqbKSsfAZ5oagBCPf+hGIVMcCa/nBKG3Hve7
 6sJwMMyEFk/K4PSHX6jCYMPL+nxig7mohNQxyORRY57CI8ZQ09r3GTpH2HzA1USmUYn0
 ZGXqSgAV1DVBdPeCEe7FdCs4/v009Q1wKlG6CUyThrtDzLkivJAItEPXJC2RPO3qSlI4
 EDyQ==
X-Gm-Message-State: AOJu0YznbgEKTAV5S4vuEgBuOlC8a7+DTk37ia5C9hV48l8PxtySBF7M
 V9vTLGWJcJ/HNkXD2p8k9y25geUaO81vLTKffgtoMNZV3tdJSC0QFMZ0WzIlrHyubl+wME/7Vv/
 uPdYSzA7R8d1KZ4csZmDG2U2hqgK8D5k29HWSzm7XX/13EN1qUw==
X-Received: by 2002:a25:7106:0:b0:dc2:5674:b408 with SMTP id
 m6-20020a257106000000b00dc25674b408mr1044555ybc.57.1706129753608; 
 Wed, 24 Jan 2024 12:55:53 -0800 (PST)
X-Received: by 2002:a25:7106:0:b0:dc2:5674:b408 with SMTP id
 m6-20020a257106000000b00dc25674b408mr1044527ybc.57.1706129751774; 
 Wed, 24 Jan 2024 12:55:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a0ce889000000b0068189a17598sm4832214qvo.72.2024.01.24.12.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 12:55:51 -0800 (PST)
Message-ID: <afbb95d3-f18e-47d1-bb4f-ebcc89514c21@redhat.com>
Date: Wed, 24 Jan 2024 21:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] virtio-iommu: Support PCI device aliases
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: jean-philippe@linaro.org, alex.williamson@redhat.com, clg@redhat.com,
 peterx@redhat.com, jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com
References: <20240122064015.94630-1-zhenzhong.duan@intel.com>
 <20240122064015.94630-4-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240122064015.94630-4-zhenzhong.duan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XlIm3zRPILNS

Hi Zhenzhong,

On 1/22/24 07:40, Zhenzhong Duan wrote:
> Currently virtio-iommu doesn't work well if there are multiple devices
> in same iommu group. In below example config, guest virtio-iommu driver
> can successfully probe first device but fail on others. Only one device
> under the bridge can work normally.
>
> -device virtio-iommu \
> -device pcie-pci-bridge,id=root0 \
> -device vfio-pci,host=81:11.0,bus=root0 \
> -device vfio-pci,host=6f:01.0,bus=root0 \
>
> The reason is virtio-iommu stores AS(address space) in hash table with
> aliased BDF and corelates endpoint which is indexed by device's real
> BDF, i.e., virtio_iommu_mr() is passed a real BDF to lookup AS hash
> table, we either get wrong AS or NULL.
>
> Fix it by storing AS indexed by real BDF. This way also make iova_ranges
> from vfio device stored in IOMMUDevice of real BDF successfully.
>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  hw/virtio/virtio-iommu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index d99c1f0d64..6880d92a44 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -399,27 +399,27 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>                                                int real_devfn)
>  {
>      VirtIOIOMMU *s = opaque;
> -    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
> +    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, real_bus);
>      static uint32_t mr_index;
>      IOMMUDevice *sdev;
>  
>      if (!sbus) {
>          sbus = g_malloc0(sizeof(IOMMUPciBus) +
>                           sizeof(IOMMUDevice *) * PCI_DEVFN_MAX);
> -        sbus->bus = bus;
> -        g_hash_table_insert(s->as_by_busptr, bus, sbus);
> +        sbus->bus = real_bus;
> +        g_hash_table_insert(s->as_by_busptr, real_bus, sbus);
>      }
>  
> -    sdev = sbus->pbdev[devfn];
> +    sdev = sbus->pbdev[real_devfn];
>      if (!sdev) {
>          char *name = g_strdup_printf("%s-%d-%d",
>                                       TYPE_VIRTIO_IOMMU_MEMORY_REGION,
> -                                     mr_index++, devfn);
> -        sdev = sbus->pbdev[devfn] = g_new0(IOMMUDevice, 1);
> +                                     mr_index++, real_devfn);
> +        sdev = sbus->pbdev[real_devfn] = g_new0(IOMMUDevice, 1);
>  
>          sdev->viommu = s;
> -        sdev->bus = bus;
> -        sdev->devfn = devfn;
> +        sdev->bus = real_bus;
> +        sdev->devfn = real_devfn;
but then this means the 2 devices would be abstracted by two different
IOMMU MRs whereas in practice they cannot be distinguished from an IOMMU
pov. Shouldn't the virtio-iommu driver use the same ep_id for both
devices within the same group?

Note there are some known issues about virtio-iommu and pcie-to-pci
bridges which were reported early last year and confirmed by Robin
Murphy. See:

[RFC] virtio-iommu: Take into account possible aliasing in virtio_iommu_mr() <https://lore.kernel.org/all/20230116124709.793084-1-eric.auger@redhat.com/#r>

https://lore.kernel.org/all/20230116124709.793084-1-eric.auger@redhat.com/

Thanks

Eric




>  
>          trace_virtio_iommu_init_iommu_mr(name);
>  


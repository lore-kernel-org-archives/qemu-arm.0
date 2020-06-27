Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1148247lfm;
        Sat, 27 Jun 2020 00:04:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Ze8bnHzbpFIr0NgosI0b078vG8diUNygIbttYHbNffWcUvXdPAV52cUQ/Zxi+T6o7tva
X-Received: by 2002:a25:2515:: with SMTP id l21mr11790570ybl.177.1593241489718;
        Sat, 27 Jun 2020 00:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593241489; cv=none;
        d=google.com; s=arc-20160816;
        b=fLr/KdK19qLfX9FFSJwN+yfBfgX39PFDqgZVjDCdwitTyA949n8WiJzwkPt/ErXrR2
         9Z2Ei29w3Q6rO2838hTwq2x2N5nY+ikus1CouYpOWAZnvD8zFPUJvV4yR5p4EqY0mxPM
         y+ksRC2IQF8cogtkQ5iLvXlU2egwETiH7Dz+rScJqyRhmNl5/unZleAVP0eVl8E9/M7s
         1vAJ4OA9Y0mmH7uOHzyTN6M2IrannW4ohtk1AlOzWD6Z6MsIkfFOKml8M2vDXCtKLad/
         fRYE1r1YcZMO7mUlzoVRO03fioMwC0DQto7IS6PeoJE0gAh1WZbtBPc65UfEp14j9isO
         OeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=ootrqBJRKH2qUVzoBA6p2tLS+AjNZERDmQeZVCtW4Ts=;
        b=yFUTwjqpTifOgnJzXSy+16GpA2ezaBKGjcH1peF9WVE69lOy/4bK2f8fUlgOrXJ8jM
         W4s0bntIDVNJUa5QR/ZM5ewdQR5CSftjkBxNrsx1U1eFw+UtJWoWrMJ+Vo7Kzpc5LZ2U
         wEAxSrwNv9GQEH1vhplyc5mQIzdaJCxL50EApK3JgkYAS6B0FbAT3tEYxTesUhkZsoNV
         WQAgibd6cLuW79CiZwr52E45QKj7Xsmr/kQ15CmbPSNrKDZyIJPCQ1Y/TaPqRxwb/Cdk
         aVHwbwFbUsoU2ok/CWS2E1TZK0pRsL6PMmBGhIeVwRoDuewPE531zactB93LubHc4378
         3r/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GyvYEOZ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t128si28835574ybf.135.2020.06.27.00.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jun 2020 00:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GyvYEOZ8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jp4tN-0004QQ-10
	for alex.bennee@linaro.org; Sat, 27 Jun 2020 03:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jp4s9-0003bt-Ij
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 03:03:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52508
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jp4s5-0004GK-Vc
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 03:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593241408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ootrqBJRKH2qUVzoBA6p2tLS+AjNZERDmQeZVCtW4Ts=;
 b=GyvYEOZ8z8D+qTRKouoWAeKHfqLmWyMyRLOIXoxDBivxPaQaBY2Q2V0+QZc6uEr8P/GWAx
 beRPG0S/OHu1DGii24ORzgNIv6BylbbUZMVJK4QAzT9JXpTze+V+rK5+vKMlo/OVOLLmT4
 DMai2xl74zZBa0NJ7WFte8Y6cSeaDvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-VZH_Z0ZuPiO2hTrkhHvV2w-1; Sat, 27 Jun 2020 03:03:27 -0400
X-MC-Unique: VZH_Z0ZuPiO2hTrkhHvV2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B548015F4;
 Sat, 27 Jun 2020 07:03:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B2360BF4;
 Sat, 27 Jun 2020 07:03:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C32BE11384A6; Sat, 27 Jun 2020 09:03:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 4/5] virtio-iommu-pci: Add array of Interval properties
References: <20200626103057.11263-1-eric.auger@redhat.com>
 <20200626103057.11263-5-eric.auger@redhat.com>
Date: Sat, 27 Jun 2020 09:03:15 +0200
In-Reply-To: <20200626103057.11263-5-eric.auger@redhat.com> (Eric Auger's
 message of "Fri, 26 Jun 2020 12:30:56 +0200")
Message-ID: <87sgehrnws.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 02:53:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHiKZU94SWlC

Eric Auger <eric.auger@redhat.com> writes:

> The machine may need to pass reserved regions to the
> virtio-iommu-pci device (such as the MSI window on x86
> or the MSI doorbells on ARM).
>
> So let's add an array of Interval properties.
>
> Note: if some reserved regions are already set by the
> machine code - which should be the case in general -,
> the length of the property array is already set and
> prevents the end-user from modifying them. For example,
> attempting to use:
>
> -device virtio-iommu-pci,\
>  len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1
>
> would result in the following error message:
>
> qemu-system-aarch64: -device virtio-iommu-pci,addr=0xa,
> len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1:
> array size property len-reserved-regions may not be set more than once
>
> Otherwise, for example, adding two reserved regions is achieved
> using the following options:
>
> -device virtio-iommu-pci,addr=0xa,len-reserved-regions=2,\
>  reserved-regions[0]=0xfee00000:0xfeefffff:1,\
>  reserved-regions[1]=0x1000000:100ffff:1
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v5 -> v6:
> - check the type value
> - removed Jean's R-b
>
> v3 -> v4:
> - added examples in the commit message as suggested by Markus
> - added Jean's R-b
> ---
>  hw/virtio/virtio-iommu-pci.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 632533abaf..9c9bda9490 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -33,6 +33,9 @@ struct VirtIOIOMMUPCI {
>  
>  static Property virtio_iommu_pci_properties[] = {
>      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> +    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
> +                      vdev.nb_reserved_regions, vdev.reserved_regions,
> +                      qdev_prop_reserved_region, ReservedRegion),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -40,6 +43,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>  {
>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>      DeviceState *vdev = DEVICE(&dev->vdev);
> +    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
>      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
>          MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> @@ -54,6 +58,15 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>                            "-no-acpi\n");
>          return;
>      }
> +    for (int i = 0; i < s->nb_reserved_regions; i++) {
> +        if (s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_RESERVED &&
> +            s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
> +            error_setg(errp, "reserved region %d has an invalid type", i);
> +            error_append_hint(errp, "Valid values are "
> +                              "VIRTIO_IOMMU_RESV_MEM_T_RESERVED and "
> +                              "VIRTIO_IOMMU_RESV_MEM_T_SMI\n");

Actually, valid values are 0 and 1.  Something like

    -device virtio-iommu-pci,len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:VIRTIO_IOMMU_RESV_MEM_T_SMI

will be rejected as invalid.

> +        }
> +    }
>      object_property_set_link(OBJECT(dev),
>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
>                               "primary-bus", errp);

Sorry for having to torture you this way!  Have a
Reviewed-by: Markus Armbruster <armbru@redhat.com>
with the error message touched up.


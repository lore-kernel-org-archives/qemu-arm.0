Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD4CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 16:48:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFxir-0000g2-93; Mon, 03 Nov 2025 11:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxip-0000bh-Gq
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:47:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxid-0003GH-Dw
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762188462;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O4n0Hm8ZskZKgQ5JkXtPVdE9CicG8evPBOYIRjg9g4=;
 b=DE/Gg9KJYZClttJ0OzSpKbMOGSXop6WnMrhoZ14fROQp1SiwTbJPnpCZGRsYA9KtRgnuys
 BdBQhqXrm/NHGAqhpA2ky5BrTE0fwFPJgM4Jo3wP6l9R6vTemYEoQGLJZyz1WhxX9enyqs
 8Gi33RSKa515Sr8pIckovNhRbEBeOqw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-CvsdsqvqPmetFzoH1H5STA-1; Mon, 03 Nov 2025 11:47:41 -0500
X-MC-Unique: CvsdsqvqPmetFzoH1H5STA-1
X-Mimecast-MFC-AGG-ID: CvsdsqvqPmetFzoH1H5STA_1762188460
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-470fd92ad57so51171705e9.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 08:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762188460; x=1762793260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9O4n0Hm8ZskZKgQ5JkXtPVdE9CicG8evPBOYIRjg9g4=;
 b=SC/uc4EdnyN+DvABPXAaAGpXNY/gsZSk+4VB0WHJNI00DY77ahVCnKsnEjDQnn7tJB
 udrctntM1SFB/vxI6YkKPVIGfg+SCkaVUDuSllyW75j9xmNq52owy/q/a+uMgQP2f25Q
 5SVnPORLfC0UFPBB/McSaI58R8+AQIWGOs+KRcfpZ6yGaE4kJl2goArM9IkuWzuAk0M7
 aEvAej1j+n0v8GRg1pnlLrfaYVw5IqgQGZcuqakxI2u/hQbTAFE/ZjVEerXQrfO0OCoj
 DD/XVw8TPDjFZjpL0PeMEW8U2eJf0JCf177e0u3XO2ShR1aA90iwac7sHypsJzZOcHah
 2cAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX77w4Z0b/O8xe8OVAQ9MC8Ol1Iu30OVY99s/SRO2NBFm0nvQZjM1DpPDU4bZC+zIhFJs/JkuDrFw==@nongnu.org
X-Gm-Message-State: AOJu0YzaITmTmJGngrUhTtwP2tdsKtvOG1J72xGuI5BEiS3RmAokRZoG
 BN1S7fqoV3v/FIuu/9wLgRCl5BzJt7GYcMNzSbFAgT86JAeyOhmcxQaQIU6ZncvSrcuFZC/MCUs
 6uyxOx1KqNLBkNk2KTz1AfRee1Rd1cnazkEspHj487qMAboS8oiDiqQ==
X-Gm-Gg: ASbGncvLah6d1biQvC197GmeDTfRxl8JZGMLaFzLdPCJmK2wJjq6rSTO/h9xwPRop/J
 Vb2d5fLwZnLjbL66/yXfCq891ek/2mF4JTWLUcSmOCv8AdIsp5uDscw9FNAXM1ZYUgP2oJ5UQTL
 II2NP/4zUXMP3z5Iw7IDJKkVn9nE9enPFKhHMSkXko4d1loevUrNdxQP5SuOcCpYLY9xnV9OU8x
 y5eXJOnnwtn+atWkFPX9vvZCe+d31Zw/sl1Tai3XkpBMdmzSTGz2Eqt922Wy5awkLOjQAKXutGc
 v0XG4PdLBJcgq5UY44DJFpMyGKq1g6xGLfofZoEHpMW20uT/QnTHomvMz7NM21EpcYKASlfzSxk
 gmRIMiE1+7WplScdyCrTQw3oOyo2f3o8ocWiiKTQgDtZxEw==
X-Received: by 2002:a05:600c:3511:b0:477:a9e:859b with SMTP id
 5b1f17b1804b1-4773089c496mr115167105e9.24.1762188459966; 
 Mon, 03 Nov 2025 08:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/PQZUNF3OfMNlzOoRYYLS3cw7PJUVrbCmb5CN2GZgJxaQEQd1VQUcjs6ayi9LPJWkNNBM2g==
X-Received: by 2002:a05:600c:3511:b0:477:a9e:859b with SMTP id
 5b1f17b1804b1-4773089c496mr115166785e9.24.1762188459562; 
 Mon, 03 Nov 2025 08:47:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fd280fbsm93350085e9.5.2025.11.03.08.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:47:39 -0800 (PST)
Message-ID: <61cdd31d-3053-4ecd-87a9-0520ed9161d4@redhat.com>
Date: Mon, 3 Nov 2025 17:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/32] hw/pci/pci: Add optional
 supports_address_space() callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-9-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-9-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3cxVgQFck_9fDaAd7rdcwZ1WJjAg2lt1XwNWe1pSBrQ_1762188460
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> Introduce an optional supports_address_space() callback in PCIIOMMUOps to
> allow a vIOMMU implementation to reject devices that should not be attached
> to it.
>
> Currently, get_address_space() is the first and mandatory callback into the
> vIOMMU layer, which always returns an address space. For certain setups, such
> as hardware accelerated vIOMMUs (e.g. ARM SMMUv3 with accel=on), attaching
> emulated endpoint devices is undesirable as it may impact the behavior or
> performance of VFIO passthrough devices, for example, by triggering
> unnecessary invalidations on the host IOMMU.
>
> The new callback allows a vIOMMU to check and reject unsupported devices
> early during PCI device registration.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>

Looks a reasonable solution to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/pci/pci.c         | 20 ++++++++++++++++++++
>  include/hw/pci/pci.h | 17 +++++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 9693d7f10c..fa9cf5dab2 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -135,6 +135,21 @@ static void pci_set_master(PCIDevice *d, bool enable)
>      d->is_master = enable; /* cache the status */
>  }
>  
> +static bool
> +pci_device_supports_iommu_address_space(PCIDevice *dev, Error **errp)
> +{
> +    PCIBus *bus;
> +    PCIBus *iommu_bus;
> +    int devfn;
> +
> +    pci_device_get_iommu_bus_devfn(dev, &iommu_bus, &bus, &devfn);
> +    if (iommu_bus && iommu_bus->iommu_ops->supports_address_space) {
> +        return iommu_bus->iommu_ops->supports_address_space(bus,
> +                                iommu_bus->iommu_opaque, devfn, errp);
> +    }
> +    return true;
> +}
> +
>  static void pci_init_bus_master(PCIDevice *pci_dev)
>  {
>      AddressSpace *dma_as = pci_device_iommu_address_space(pci_dev);
> @@ -1413,6 +1428,11 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>      pci_dev->config_write = config_write;
>      bus->devices[devfn] = pci_dev;
>      pci_dev->version_id = 2; /* Current pci device vmstate version */
> +    if (!pci_device_supports_iommu_address_space(pci_dev, errp)) {
> +        do_pci_unregister_device(pci_dev);
> +        bus->devices[devfn] = NULL;
> +        return NULL;
> +    }
>      if (phase_check(PHASE_MACHINE_READY)) {
>          pci_init_bus_master(pci_dev);
>      }
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index cf99b5bb68..dfeba8c9bd 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -417,6 +417,23 @@ typedef struct IOMMUPRINotifier {
>   * framework for a set of devices on a PCI bus.
>   */
>  typedef struct PCIIOMMUOps {
> +    /**
> +     * @supports_address_space: Optional pre-check to determine if a PCI
> +     * device can have an IOMMU address space.
> +     *
> +     * @bus: the #PCIBus being accessed.
> +     *
> +     * @opaque: the data passed to pci_setup_iommu().
> +     *
> +     * @devfn: device and function number.
> +     *
> +     * @errp: pass an Error out only when return false
> +     *
> +     * Returns: true if the device can be associated with an IOMMU address
> +     * space, false otherwise with errp set.
> +     */
> +    bool (*supports_address_space)(PCIBus *bus, void *opaque, int devfn,
> +                                   Error **errp);
>      /**
>       * @get_address_space: get the address space for a set of devices
>       * on a PCI bus.



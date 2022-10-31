Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp992645ejc;
        Mon, 31 Oct 2022 06:51:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5a0nzRMVrJg9J2UZikLvQPDC0Mt0JAsl6+wVnsq7U1wryfJAvZlJYLbvFBv7REOZoQc2+g
X-Received: by 2002:ac8:4756:0:b0:3a5:2705:ede0 with SMTP id k22-20020ac84756000000b003a52705ede0mr3245989qtp.319.1667224309956;
        Mon, 31 Oct 2022 06:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667224309; cv=none;
        d=google.com; s=arc-20160816;
        b=IWjQ8VZzhKgDdMPHJH9Nk9nlTl90QDvCOmNSA9o6IXXXZVWf/aC/YK3K6y9ixLeR/I
         1yArOI1wtyKy9M6Ae7apnUDCKylkOXxGN6dl6mc1lmJ8R0LdO1t8452qdjdPiFjnS9wc
         ZmddVVa1KWJxxZ9zscWY33MWujDi4mI3l+6YvCYRYpAVj9dccM+u21UcXkAciaw9K4Rw
         zBhf64nbkbxV4dMw5J/RmiK0WWqtzUBwhsN7fzeDkC40/jl6GtmfuiSDwqyoGo3eBe/K
         5+a00c62W/CCEUxcCsWISG4UFrbkBFCKEdPxDX+4gDXmiZOEH4cB4e6ZlVZIkcpZdAV8
         M5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=o8dwldbXQk9w7iIcu+eF/I6gT9GbbBrcSf6WPkra20A=;
        b=KFLYsppbBMYefpC0d58iL8buHYlTqs0kUkh7BEQ5KDZ072JLo220y+bn3wHe6X/pU/
         h3O3yu/+7/dxolCkHw4iZLWKO8eVat8Ug8UGVWqaQdjfIJDZ6ASSVO7AzqHfH4FcflaK
         wMX73mHHM71/Yq8yoKOe4oJyDpD8N82R4PKoc5U+dN2tuV/Ajkbmt74GkbkcQG8Xl+HN
         tOCjS4X5ZHHLUgAQEgzJ+BgFZxFD1nBWQbpfnlwOpDox0vSoPxC68mOMx+fRpSW1BGMB
         o/d6DkOWSDCeSor+8mXKzVw64fTyg2RSxY1uOVZvlc7qVz/PzklmNptTurQNat5qc0O1
         ZmZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwuEj6b1;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20-20020ac84a14000000b003a50d20ed73si3921146qtq.532.2022.10.31.06.51.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 06:51:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwuEj6b1;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opVCM-0003G1-8P; Mon, 31 Oct 2022 09:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opVCK-0003De-Ds
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 09:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1opVCI-0000Jb-F8
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 09:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667224285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8dwldbXQk9w7iIcu+eF/I6gT9GbbBrcSf6WPkra20A=;
 b=QwuEj6b1/2f/QWJvvoSa5fsxfYM9Z4bjlv+nN/hCJC8P8rl+Q9ClAbjJAukXUWSKglOq0A
 gx9+JZNce7/snX9TFmZAoPKZhQgBDqd3RCIIFso/drrZDIKtedCgihumHM3mJMWOdHRLos
 RJwt69W/NVFmnEBYv5xqJnBtnBteaIo=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-IopGOQj1OXee-YjMx4p5VA-1; Mon, 31 Oct 2022 09:51:24 -0400
X-MC-Unique: IopGOQj1OXee-YjMx4p5VA-1
Received: by mail-il1-f198.google.com with SMTP id
 c4-20020a056e020bc400b0030098df879dso3462924ilu.6
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 06:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o8dwldbXQk9w7iIcu+eF/I6gT9GbbBrcSf6WPkra20A=;
 b=606m5WFyYDEPrxvEh0ZGWEK/7doorCJhWAWOtreMELFc0rutnuxQ/cGoOo70A5Zhg+
 OwEURGsrX4ht0n9Gzm0eDcirtWbqIybuMySAwH+rEPe8M4sNkkq05T3NALmKc4v3Swla
 hP3iiwBPjRgrDs+XA/HhAHnWuKlAo+4eISH0kGHs+1jqNtD8yVmTDFhKYyrudyTB9pnb
 VMrvv0/E0codqysUxBwyRHB4apHDziNrI0ViiFOcqyt753pVDkY/1W4Nx3a+OAiNCQFD
 JfDXbVNYBki4Zeag1N8WstAFn2caVgo1hYXOFQn3NMOjdve7OHKVRIn43Kw3lOFtIRbw
 r8kw==
X-Gm-Message-State: ACrzQf32YY+tJ6hSb9D6RAdPj9ExzpF4psld+8Zwk1A4B6kFqVdHRXdi
 ehMtEtSCAhdD7o8+8W/oZ+sdza4VhxwHwylnGhPS0qYX+1vyAlA/JE+7Z4wMfSCvczR3PS/PV3G
 PQLIHWQPC9Bhi
X-Received: by 2002:a05:6638:468e:b0:375:1ae9:ba13 with SMTP id
 bq14-20020a056638468e00b003751ae9ba13mr7112521jab.253.1667224283537; 
 Mon, 31 Oct 2022 06:51:23 -0700 (PDT)
X-Received: by 2002:a05:6638:468e:b0:375:1ae9:ba13 with SMTP id
 bq14-20020a056638468e00b003751ae9ba13mr7112488jab.253.1667224283226; 
 Mon, 31 Oct 2022 06:51:23 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m4-20020a026a44000000b00363e6b793d7sm2829926jaf.28.2022.10.31.06.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:51:22 -0700 (PDT)
Date: Mon, 31 Oct 2022 07:51:20 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, John
 Snow <jsnow@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason
 Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Peter Maydell
 <peter.maydell@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Paul
 Burton <paulburton@kernel.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Yan Vugenfirer <yan@daynix.com>, Yuri
 Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v6 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Message-ID: <20221031075120.72d9d7ca.alex.williamson@redhat.com>
In-Reply-To: <20221031123319.21532-2-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
 <20221031123319.21532-2-akihiko.odaki@daynix.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: 6FUm1SLUuCFe

On Mon, 31 Oct 2022 21:33:03 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> pci_add_capability() checks whether capabilities overlap, and notifies
> its caller so that it can properly handle the case. However, in the
> most cases, the capabilities actually never overlap, and the interface
> incurred extra error handling code, which is often incorrect or
> suboptimal. For such cases, pci_add_capability() can simply abort the
> execution if the capabilities actually overlap since it should be a
> programming error.
> 
> This change handles the other cases: hw/vfio/pci depends on the check to
> decide MSI and MSI-X capabilities overlap with another. As they are
> quite an exceptional and hw/vfio/pci knows much about PCI capabilities,
> adding code specific to the cases to hw/vfio/pci still results in less
> code than having error handling code everywhere in total.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/vfio/pci.c | 61 ++++++++++++++++++++++++++++++++++++++++++---------
>  hw/vfio/pci.h |  3 +++
>  2 files changed, 54 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a..c7e3ef95a7 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
>      }
>  }
>  
> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> +static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
>  {
>      uint16_t ctrl;
> -    bool msi_64bit, msi_maskbit;
> -    int ret, entries;
> -    Error *err = NULL;
> +    uint8_t pos;
> +
> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
> +    if (!pos) {
> +        return;
> +    }
>  
>      if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
>                vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
>          error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
> -        return -errno;
> +        return;
>      }
> -    ctrl = le16_to_cpu(ctrl);
> +    vdev->msi_pos = pos;
> +    vdev->msi_ctrl = le16_to_cpu(ctrl);
>  
> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
> +    vdev->msi_cap_size = 0xa;
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
> +        vdev->msi_cap_size += 0xa;
> +    }
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
> +        vdev->msi_cap_size += 0x4;
> +    }
> +}
> +
> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> +{
> +    bool msi_64bit, msi_maskbit;
> +    int ret, entries;
> +    Error *err = NULL;
> +
> +    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
> +    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
> +    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
>  
>      trace_vfio_msi_setup(vdev->vbasedev.name, pos);
>  
> @@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
>          error_propagate_prepend(errp, err, "msi_init failed: ");
>          return ret;
>      }
> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
>  
>      return 0;
>  }
> @@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
>      pba = le32_to_cpu(pba);
>  
>      msix = g_malloc0(sizeof(*msix));
> +    msix->pos = pos;
>      msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
>      msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
>      msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
> @@ -2025,6 +2044,22 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>          }
>      }
>  
> +    if (cap_id != PCI_CAP_ID_MSI &&
> +        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
> +        error_setg(errp,
> +            "A capability overlaps with MSI (%" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> +            pos, vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
> +        return -EINVAL;
> +    }
> +
> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
> +        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
> +        error_setg(errp,
> +            "A capability overlaps with MSI-X (%" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> +            pos, vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
> +        return -EINVAL;
> +    }

I provided an example of how the existing vfio_msi[x]_setup() can be
trivially extended to perform the necessary size checking in place of
pci_add_capability() without special cases and additional error paths
as done here.  Please adopt the approach I suggested.  Thanks,

Alex

> +
>      /* Scale down size, esp in case virt caps were added above */
>      size = MIN(size, vfio_std_cap_max_size(pdev, pos));
>  
> @@ -3037,6 +3072,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>  
>      vfio_bars_prepare(vdev);
>  
> +    vfio_msi_early_setup(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
> +
>      vfio_msix_early_setup(vdev, &err);
>      if (err) {
>          error_propagate(errp, err);
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index 7c236a52f4..9ae0278058 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -107,6 +107,7 @@ enum {
>  
>  /* Cache of MSI-X setup */
>  typedef struct VFIOMSIXInfo {
> +    uint8_t pos;
>      uint8_t table_bar;
>      uint8_t pba_bar;
>      uint16_t entries;
> @@ -128,6 +129,8 @@ struct VFIOPCIDevice {
>      unsigned int rom_size;
>      off_t rom_offset; /* Offset of ROM region within device fd */
>      void *rom;
> +    uint8_t msi_pos;
> +    uint16_t msi_ctrl;
>      int msi_cap_size;
>      VFIOMSIVector *msi_vectors;
>      VFIOMSIXInfo *msix;


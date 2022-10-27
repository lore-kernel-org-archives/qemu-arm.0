Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp662622ejn;
        Thu, 27 Oct 2022 12:58:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bAwxacqXVUp02dnU8J/Lh9PHK9aVLlR/aDK5pvth4yDd/7bvALZf5iw3rM9l0ykCzEKas
X-Received: by 2002:ac8:5a16:0:b0:39c:efc6:b370 with SMTP id n22-20020ac85a16000000b0039cefc6b370mr42150144qta.374.1666900680373;
        Thu, 27 Oct 2022 12:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666900680; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzejKpX5raMt1kiBxX9MCRZf2y8Npj39Rk5gEOsbcIteFeO00mmtOJBydFetI65avg
         ykwod4NvmEfXAP9qBrhJemwYvJLcJ+QChMcPIOX1UL9QmMjWGfGp0H/lIux3EoBVazwQ
         Vgp/0WgewPDEdtNyF+SB44zU4+kRfd+T8Pa29z42h2S+8aN4oDaiEkn1PpI7YC2Z+0MM
         XLa0yQslxzO66xHaRP9enUReQ3S0yymfVDeV6IkDLaXctlie13KjjRT0/jH3rAGOCNNK
         XgbQF3Zm7RSCVYlVFkz64w+AK6yQC4jCt+92LbAOKOA01vuS5KG6ijNWVkNY6NFeAav3
         mpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=FTFs5Rjjxiui9rrU8WyvaiO6592b7yoGl8NSC0MMcGs=;
        b=DEilb+UGlgWTqsYnPJEb80poXU1AsJOSZB7aeWorcgvD7qNFj6mYMeptq4fo+Zxy7U
         O0OEWeXrDVVbfhKFr3YkGxXjQZXiKp81vowTk6zVgOjNOa2iOnkcM8Jq61Y+s3+xqKbu
         reMhoMf6GkR0QmnAXwZVVJrj37pw3q4KnrQH6uZyk+tkJN/EQofoe3xBQTUhHbcBEOzn
         FeSLjQSGxF+8on6VI7Bs3c01u5+0der1Ogi5yn8D1r4r0AG09cCrwnlojQruiLfBadzG
         W4knchBpB2QpkD+mk+LALePtsrbmrNTNLkrW5Muc/JWTPp4v3re4B8Xu6CBoECw5BSXT
         /1Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YEiSrPwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm7-20020a05622a250700b003a4fcbaa8cesi1227006qtb.589.2022.10.27.12.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 12:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YEiSrPwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oo8xb-00015U-5l; Thu, 27 Oct 2022 15:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oo8xI-0000qU-8v
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 15:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oo8bF-0003xe-Av
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 15:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666899088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FTFs5Rjjxiui9rrU8WyvaiO6592b7yoGl8NSC0MMcGs=;
 b=YEiSrPwE5bI3cDc8HofuP9FDc7eMzK4/7HrwcNc6YJtLUHdiMkQZm3JI4ln7qRiiFcqPjz
 eIBFKH+VqkWTbjTozBv4uW/Qg/nSM/m4XSc8afKYR5m6tCm/1m6XE2yVN/Rpe9/JlEM87N
 PFnU++hiE3yoMiYmdlvIldWvdggJIfM=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-yxTOAq1kNQyNj_hNowpH3Q-1; Thu, 27 Oct 2022 15:31:26 -0400
X-MC-Unique: yxTOAq1kNQyNj_hNowpH3Q-1
Received: by mail-il1-f197.google.com with SMTP id
 j7-20020a056e02154700b003007885e7beso1632250ilu.20
 for <qemu-arm@nongnu.org>; Thu, 27 Oct 2022 12:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTFs5Rjjxiui9rrU8WyvaiO6592b7yoGl8NSC0MMcGs=;
 b=y/Ph1txPDEqfd0IS72wwXsz5gLxoe6yf4hbbva3bfiDqL0RnotWwthHHC24LlAFN0F
 51ot6peuz32xftOhMwwlNz9cRaaknfDysPDkKS+TTAtalIXdQZ915NEuNAx/Sb4eYJ4N
 Lmcdxd8bhpn3DoUgix/kc8jguwlX/QcFe1MERVIKX+B3MVYg44rkvCYPK0djydQlTPle
 GInwJ5gIIbziYtkrgajblVx8H0oLbotZhMtYV2UCjnhKdL63v1p84EdeJi3GeGVK6FBo
 TNqqaFAj7ZYch7zmYR25/CFa6E1mLay9xvhUV7La6ab9nub+ZPL9Ep3WrVh9xCwz4tHU
 HKUg==
X-Gm-Message-State: ACrzQf20ba+Fk3ULfcazXuP11URKquGDFfW27r4BTriI3jqFSf5jXFc9
 DHQZOz9553lfHKrpcvBcS2k6jaqhD6sDGq5LOT+6rwSphBMbSzeUQ/b2ZXAB26emW1LUCzYgIuY
 TQUnVQX+kcKIX
X-Received: by 2002:a05:6e02:20ea:b0:2fa:bf8:300a with SMTP id
 q10-20020a056e0220ea00b002fa0bf8300amr31044535ilv.309.1666899085261; 
 Thu, 27 Oct 2022 12:31:25 -0700 (PDT)
X-Received: by 2002:a05:6e02:20ea:b0:2fa:bf8:300a with SMTP id
 q10-20020a056e0220ea00b002fa0bf8300amr31044511ilv.309.1666899084922; 
 Thu, 27 Oct 2022 12:31:24 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 p12-20020a056638216c00b0036fdc9ef995sm889348jak.92.2022.10.27.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 12:31:24 -0700 (PDT)
Date: Thu, 27 Oct 2022 13:31:22 -0600
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
Subject: Re: [PATCH v4 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Message-ID: <20221027133122.0278d5e0.alex.williamson@redhat.com>
In-Reply-To: <20221027063705.4093-2-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
 <20221027063705.4093-2-akihiko.odaki@daynix.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GvhuXnVPQbOq

On Thu, 27 Oct 2022 15:36:49 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> vfio_add_std_cap() is designed to ensure that capabilities do not
> overlap, but it failed to do so for MSI and MSI-X capabilities.
> 
> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
> other overlapping capabilities.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/vfio/pci.c | 55 +++++++++++++++++++++++++++++++++++++++++----------
>  hw/vfio/pci.h |  3 +++
>  2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 939dcc3d4a..8a4995cd68 100644
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
> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);


PCI_CAP_ID_MSIX???  Is this tested with MSI?


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
> +
> +    vdev->msi_cap_size = 0xa;
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
> +        vdev->msi_cap_size += 0xa;
> +    }
> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
> +        vdev->msi_cap_size += 0x4;
> +    }
> +}
>  
> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
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
> @@ -2025,6 +2044,16 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>          }
>      }
>  
> +    if (cap_id != PCI_CAP_ID_MSI &&
> +        pos >= vdev->msi_pos && pos < vdev->msi_pos + vdev->msi_cap_size) {
> +        return 0;
> +    }
> +
> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
> +        pos >= vdev->msix->pos && pos < vdev->msix->pos + MSIX_CAP_LENGTH) {
> +        return 0;
> +    }
> +

These only test a specific kind of overlap, why not use
ranges_overlap()?

We also need to sanity test vdev->msi_pos, or are you just letting
msi_pos = 0, msi_cap_size = 0 fall through since we cannot overlap?

Shouldn't this also jump to reporting the error rather than silently
dropping a capability?  Thanks,

Alex

>      /* Scale down size, esp in case virt caps were added above */
>      size = MIN(size, vfio_std_cap_max_size(pdev, pos));
>  
> @@ -3037,6 +3066,12 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
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


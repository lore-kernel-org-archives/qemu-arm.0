Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1503904ejn;
        Fri, 28 Oct 2022 12:24:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4GG9uSooVwmdUXG13JIB9Y+Fkj2lqHHi6tHFN4P0smuzr0/DUai+CaflFIx1QtfhzL1TzJ
X-Received: by 2002:a05:620a:2905:b0:6ee:e598:a973 with SMTP id m5-20020a05620a290500b006eee598a973mr700336qkp.338.1666985057018;
        Fri, 28 Oct 2022 12:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666985057; cv=none;
        d=google.com; s=arc-20160816;
        b=dye2DxW/w22daVWNd1gyZuwmZcwgvczG2/pRLgdfql3yI2FyC8pjgxPoPw1z/n/YTB
         VX++M1fyZcN3fIwtlcA/qR75HQnFDiC6LHl1kl+jjs+64Gwe+OyurINJBOrIFboyIPWP
         tvgx10sBEOn/g6G3EsAZfLmTggV+2kr6Ou6K9Aki5w5hNCePAjujr4HOq53wdvs5743D
         aplgG0EEVrHI+xs63yRicR2SfDjcyQ1l4tKfGJdZBYh2j8DvjoutjQgj2jtF92cUnnlk
         sKgRXaCcJQr5ER5128UcIPiSj5Y8K80De/wEytD5d5A9Q74hk8awj9t+wVc82rtzpObQ
         D0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=9ZIbi2VdJ0qQ/Ohx8YZIrSpibBfLPjlzR/eKY2bpOWc=;
        b=wj8MklvrMSpccFyJ15rNitMzAxt8Pzf1nxWgnvaI/EXexxlf+PUL7BMP1vQArEVcsW
         ZdjsKz4jE2ej4B2arX9p5wcyvvukdX1JpYIfiBFmEncyuZFVwMWMOVMC1j+O/glbjgGM
         JhA2eeqVFj0+jzxoK3ICCLzSkmopY/fpw4WOOcEKUeVLzTUnMv2GW0Wy4HFfJX5agtKQ
         iL9d2ArzISXf4u3ggYlj4nOwqIn+wLTaH3O4s+CAM+w8n9S4nCsDtarGMvRdL6if1oQu
         Qr3MrXOJsYAIHXvQ1RItLoqVhW99u9++JM/l4OahnoXtQ/L0JjBmDmJJmA1/NRpXNZCW
         uiAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g2HQ5h3z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv5-20020ad44ee5000000b004b3cb5d9147si3533214qvb.94.2022.10.28.12.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g2HQ5h3z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUxL-0008L4-3X; Fri, 28 Oct 2022 15:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ooUxJ-0008KW-Id
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ooUxH-00044F-9s
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666985025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZIbi2VdJ0qQ/Ohx8YZIrSpibBfLPjlzR/eKY2bpOWc=;
 b=g2HQ5h3zLitTmg9E8YsDP7L3O+xcK56D203ysH6S0PHNfSVXf3qM5m7wxOklCUCg68hfmL
 o8KXZ4ys59cqvtWu6NdelcF4+x0A6jqihe9Xo95nNF1uAUjlFVqIZQ/IXPEQppe9ZF5rvK
 PPVcKImS1UEcwRerD0EbSWStPvCoRXU=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-p36hf05JNZORHbdfdOA2Zw-1; Fri, 28 Oct 2022 15:23:44 -0400
X-MC-Unique: p36hf05JNZORHbdfdOA2Zw-1
Received: by mail-il1-f197.google.com with SMTP id
 n12-20020a056e02140c00b003005d5015a3so5771657ilo.21
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ZIbi2VdJ0qQ/Ohx8YZIrSpibBfLPjlzR/eKY2bpOWc=;
 b=d+IC0iPt84adNk8noiHvjiTow97vR8+XGhR9fGy70aQQ68XeTRSepdA99A2o+dtlvB
 pJb7UVCNlTCbYryvS0OpfJmOcuxcEw8bJC+zJ4TgW4XyKu0xQIo69whPVr/cIlAVa5FR
 csvyzfKlXVnOROl3+Y+5wlSkebwfjh5kbG3Zzj+JAAl1tUhoojiLDLp2c3me6YqMYItJ
 nJ/+7Ad/2/nQEtnPsblXesZBzJt1gPyPCN0XAqzszg/akUsFhnKLn9nVGKvbZZrQ8Fcx
 xG5k8ENZBCXbLgCkyG9/qsPikdJiQrHHNlJYxsiVkSi3xEPPYC+UWAEXfefkholkeUgT
 AavQ==
X-Gm-Message-State: ACrzQf0BLrG9UCL1Ya+xjiRhhtAvVE7ef8yL0WBYrBkp8MkpxLl2Trt7
 Cekhjc116rjoIoC2lozjKDFAbkj1rh3GfcsQX8/IX8l/nagSh/I6SyepWrDyAEIyavxMm9XvCei
 5v7GkdRkZp/Jc7HU=
X-Received: by 2002:a05:6638:3182:b0:363:3919:fc0f with SMTP id
 z2-20020a056638318200b003633919fc0fmr540781jak.15.1666985023693; 
 Fri, 28 Oct 2022 12:23:43 -0700 (PDT)
X-Received: by 2002:a05:6638:3182:b0:363:3919:fc0f with SMTP id
 z2-20020a056638318200b003633919fc0fmr540753jak.15.1666985023360; 
 Fri, 28 Oct 2022 12:23:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k26-20020a02ccda000000b00363dfbb145asm1973291jaq.30.2022.10.28.12.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:23:42 -0700 (PDT)
Date: Fri, 28 Oct 2022 13:23:39 -0600
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
Subject: Re: [PATCH v5 01/17] hw/vfio/pci: Ensure MSI and MSI-X do not overlap
Message-ID: <20221028132339.014ffee0.alex.williamson@redhat.com>
In-Reply-To: <8bcd5f5a-7b9a-6359-a63d-3f72e44f7d43@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
 <20221028122629.3269-2-akihiko.odaki@daynix.com>
 <20221028081627.50c9bf61.alex.williamson@redhat.com>
 <8bcd5f5a-7b9a-6359-a63d-3f72e44f7d43@daynix.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gabS/4BGkg9N

On Sat, 29 Oct 2022 01:12:11 +0900
Akihiko Odaki <akihiko.odaki@daynix.com> wrote:

> On 2022/10/28 23:16, Alex Williamson wrote:
> > On Fri, 28 Oct 2022 21:26:13 +0900
> > Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >   
> >> vfio_add_std_cap() is designed to ensure that capabilities do not
> >> overlap, but it failed to do so for MSI and MSI-X capabilities.
> >>
> >> Ensure MSI and MSI-X capabilities do not overlap with others by omitting
> >> other overlapping capabilities.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> ---
> >>   hw/vfio/pci.c | 63 +++++++++++++++++++++++++++++++++++++++++++--------
> >>   hw/vfio/pci.h |  3 +++
> >>   2 files changed, 56 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index 939dcc3d4a..36c8f3dc85 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c
> >> @@ -1278,23 +1278,42 @@ static void vfio_disable_interrupts(VFIOPCIDevice *vdev)
> >>       }
> >>   }
> >>   
> >> -static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> >> +static void vfio_msi_early_setup(VFIOPCIDevice *vdev, Error **errp)
> >>   {
> >>       uint16_t ctrl;
> >> -    bool msi_64bit, msi_maskbit;
> >> -    int ret, entries;
> >> -    Error *err = NULL;
> >> +    uint8_t pos;
> >> +
> >> +    pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSI);
> >> +    if (!pos) {
> >> +        return;
> >> +    }
> >>   
> >>       if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
> >>                 vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
> >>           error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
> >> -        return -errno;
> >> +        return;
> >>       }
> >> -    ctrl = le16_to_cpu(ctrl);
> >> +    vdev->msi_pos = pos;
> >> +    vdev->msi_ctrl = le16_to_cpu(ctrl);
> >>   
> >> -    msi_64bit = !!(ctrl & PCI_MSI_FLAGS_64BIT);
> >> -    msi_maskbit = !!(ctrl & PCI_MSI_FLAGS_MASKBIT);
> >> -    entries = 1 << ((ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
> >> +    vdev->msi_cap_size = 0xa;
> >> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT)) {
> >> +        vdev->msi_cap_size += 0xa;
> >> +    }
> >> +    if ((vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT)) {
> >> +        vdev->msi_cap_size += 0x4;
> >> +    }
> >> +}
> >> +
> >> +static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> >> +{
> >> +    bool msi_64bit, msi_maskbit;
> >> +    int ret, entries;
> >> +    Error *err = NULL;
> >> +
> >> +    msi_64bit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_64BIT);
> >> +    msi_maskbit = !!(vdev->msi_ctrl & PCI_MSI_FLAGS_MASKBIT);
> >> +    entries = 1 << ((vdev->msi_ctrl & PCI_MSI_FLAGS_QMASK) >> 1);
> >>   
> >>       trace_vfio_msi_setup(vdev->vbasedev.name, pos);
> >>   
> >> @@ -1306,7 +1325,6 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
> >>           error_propagate_prepend(errp, err, "msi_init failed: ");
> >>           return ret;
> >>       }
> >> -    vdev->msi_cap_size = 0xa + (msi_maskbit ? 0xa : 0) + (msi_64bit ? 0x4 : 0);
> >>   
> >>       return 0;
> >>   }
> >> @@ -1524,6 +1542,7 @@ static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
> >>       pba = le32_to_cpu(pba);
> >>   
> >>       msix = g_malloc0(sizeof(*msix));
> >> +    msix->pos = pos;
> >>       msix->table_bar = table & PCI_MSIX_FLAGS_BIRMASK;
> >>       msix->table_offset = table & ~PCI_MSIX_FLAGS_BIRMASK;
> >>       msix->pba_bar = pba & PCI_MSIX_FLAGS_BIRMASK;
> >> @@ -2025,6 +2044,24 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
> >>           }
> >>       }
> >>   
> >> +    if (cap_id != PCI_CAP_ID_MSI &&
> >> +        range_covers_byte(vdev->msi_pos, vdev->msi_cap_size, pos)) {
> >> +        warn_report(VFIO_MSG_PREFIX
> >> +                    "A capability overlaps with MSI, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> >> +                    vdev->vbasedev.name, cap_id, pos,
> >> +                    vdev->msi_pos, vdev->msi_pos + vdev->msi_cap_size);
> >> +        return 0;
> >> +    }
> >> +
> >> +    if (cap_id != PCI_CAP_ID_MSIX && vdev->msix &&
> >> +        range_covers_byte(vdev->msix->pos, MSIX_CAP_LENGTH, pos)) {
> >> +        warn_report(VFIO_MSG_PREFIX
> >> +                    "A capability overlaps with MSI-X, ignoring (%" PRIu8 " @ %" PRIu8 " in [%" PRIu8 ", %" PRIu8 "))",
> >> +                    vdev->vbasedev.name, cap_id, pos,
> >> +                    vdev->msix->pos, vdev->msix->pos + MSIX_CAP_LENGTH);
> >> +        return 0;
> >> +    }  
> > 
> > Capabilities are not a single byte, the fact that it doesn't start
> > within the MSI or MSI-X capability is not a sufficient test.  We're
> > also choosing to prioritize MSI and MSI-X capabilities by protecting
> > that range rather than the existing behavior where we'd drop those
> > capabilities if they overlap with another capability that has already
> > been placed.  There are merits to both approaches, but I don't see any
> > justification here to change the current behavior.
> > 
> > Isn't the most similar behavior to existing to pass the available size
> > to vfio_msi[x]_setup() and return an errno if the size would be
> > exceeded?  Something like below (untested, and requires exporting
> > msi_cap_sizeof()).  Thanks,  
> 
> It only tests the beginning of the capability currently being added 
> because its end is determined by vfio_std_cap_max_size() so that the 
> overlap does not happen.
> 
> A comment in vfio_add_std_cap() says:
>  >     /*
>  >      * If it becomes important to configure capabilities to their actual
>  >      * size, use this as the default when it's something we don't   
> recognize.
>  >      * Since QEMU doesn't actually handle many of the config accesses,
>  >      * exact size doesn't seem worthwhile.
>  >      */  
> 
> My understanding of the problem is that while clipping is performed when 
> overlapping two capabilities other than MSI and MSI-X according to the 
> comment, the clipping does not happen when one of the overlapping 
> capability is MSI or MSI-X.
> 
> According to that, the correct way to fix is to perform clipping also in 
> such a case. As QEMU actually handles the config acccesses for MSI and 
> MSI-X, MSI and MSI-X are always priotized over the other capabilities.

Here's a scenario, a vendor ships a device with an MSI capability where
the MSI control register reports per vector masking, but the packing of
the capabilities is such that the next capability doesn't allow for the
mask and pending bits registers.  Currently, depending on the order we
add them, pci_add_capability() will fail for either the MSI capability
or the encroaching capability.  This failure will propagate back to
vfio_realize and we'll fail to instantiate the device.  To make this
scenario even a bit more pathological, let's assume the encroaching
capability is MSI-X.

As proposed here, we'd drop the MSI-X capability because it's starting
position lies within our expectation of the extent of the MSI
capability, and we'd allow the device to initialize with only MSI.
Was that intentional?  Was that a good choice?  What if the driver
only supports MSI-X?  We've subtly, perhaps unintentionally, changed
the policy based on some notion of prioritizing certain capabilities
over others.

The intent of vfio_std_cap_max_size() is not to intentionally
clip ranges, it's only meant to simplify defining the extent of a
capability to be bounded by the nearest capability after it in config
space.

Currently we rely on a combination of our own range management and the
overlap detection in pci_add_capability() to generate a device
instantiation failure.  If it's deemed worthwhile to remove the latter,
and that is the extent of the focus of this series, let's not go
dabbling into defining new priority schemes for capabilities and
defining certain overlap scenarios as arbitrarily continue'able.
Thanks,

Alex


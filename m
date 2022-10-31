Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp932988ejc;
        Mon, 31 Oct 2022 05:38:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5s0tuun+FQBiiDo/RkfZDdcUZtc6Q6shU05kIKqhjedxxU1Vi50+24s0B1vAgyR334nsov
X-Received: by 2002:ac8:5a88:0:b0:39c:f2d0:cc6f with SMTP id c8-20020ac85a88000000b0039cf2d0cc6fmr10147464qtc.19.1667219923864;
        Mon, 31 Oct 2022 05:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219923; cv=none;
        d=google.com; s=arc-20160816;
        b=wDSaLW+MYC3ek68XDzSSgTs4JhM8NS/IcS1GQuGG2QZQby1vAUtpwgIH7zAExTyVeQ
         0FM0ci5q8N2Nx4mNYLzepSg8W1yI7YSjbSKKpILiI1VjLcCvj7g4XrMw/Vp7UN+Sk5uY
         GAE7DoVpPPKEE8B/8t+UvHup8Y0efJGKV7MefCM2cc6W5/1k9crsiwBQrhjncBa3wcC7
         TyPAfMMdPTNRAxXtXlfemNg97iVLmjGYfDS2Gwn24O356nj+iNOpLUdUQA57eJ0NBGR9
         PoiPUcItx09RlZDMLqZHELcHJ4ztpdkEU7xeoMAe1jydEIUNalCcfVT6jQfX5BZxaOOt
         h60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=8mMoVKBlIKrN9qHF+pOLpPjWB0DjhdEXnx9Hm6/rIic=;
        b=Dg4aJjUm4RgsSiSIHKD18zHZU8bxxzg5D3lLr30TS4DaoS/J0YOIm/hq1axaqPHiqg
         n65uFUmCkiudF4HVUtyUedsQkEs1DQop16eIYaS3pZ7Ckta55xiJEWhb26dajT6bmkFK
         S2E9h1CjEwobyFWSUmTpyu/5XUgr/CyYjLpVR2LaHQ5+Le+PC9gsIDu2k4ipc1+qBg+L
         92X7hWjrQ/pKyvSZprFf7+D4IKLXXal/0zzDxbitTZVySuLNT59luFjPCKUz2gVNta5c
         7mha4tJl5j1loeQgksSQh/l/Cx1FKywQyKUY8a7SrzYmWODnsRi7njTcjGOBgxTdth4I
         17zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cQ7/9Wl4";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a37f906000000b006ebcaee80a0si3651248qkj.385.2022.10.31.05.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cQ7/9Wl4";
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU3m-0002v7-C7; Mon, 31 Oct 2022 08:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opU31-0001Iv-GI
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:37:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opU2x-0005jS-Ba
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8mMoVKBlIKrN9qHF+pOLpPjWB0DjhdEXnx9Hm6/rIic=;
 b=cQ7/9Wl4vOICiadZ1TcaG+yUO1sn596vRHgscdfiZu4NHjGl5Z8QK4l2OmHiMCdH+TY6DU
 SEpQdbeHdRMvamCrBUT7I19Rhm+K9H73QY4sALRHmfAtt2lyYlgoHCfJ23DfE1cPf3Yxed
 VxLm8Xoxvznda5g/eJoj8l6hL+LF8YU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-ZpPEdK0yPZKLicDLrpg7vQ-1; Mon, 31 Oct 2022 08:37:40 -0400
X-MC-Unique: ZpPEdK0yPZKLicDLrpg7vQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i128-20020a1c3b86000000b003cf4ff1b917so5255769wma.2
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mMoVKBlIKrN9qHF+pOLpPjWB0DjhdEXnx9Hm6/rIic=;
 b=YTcF/y/Fqm5RBS/25aM0enDGHcSrBLkdwvxHViarfLCEWs9HNDHv0ReFf/338ASQBv
 JfsZep05vh38n/Am32Uvyn1U0Z0O4xe1JiSZPJnS4elVYWh5Xlh/FC4oBkAuciwxpE6c
 LDx9Dqts/CDRSrym5MHXNQxP4YxTRnzeMoRXkvq1IbuwbjNlVoG5O2Sy22HTGHTj+Scz
 qTlBdR2Hy9ceVubKtQAF2tQbetcYyyA+UaIVmm1LsDJthNppmQ0GyVEf5rHPB7FXiS6M
 QT8TQD0TITu7iX9kZSY1DHr0u23leYPZCH2jWxBsi4jQCLGW/OofbVJ+8+QRELlDP8TT
 IdZQ==
X-Gm-Message-State: ACrzQf0rG9a8C99tlIo2GbKxQPIedbPp+/nW4jmBl8Sj8TxsrkH2zzWq
 VMM/CRSioJHI9I1kzG3vtzfVgV6J0i2LAHyygSHHNApxM36O+N7Q5TawgbowpmKUvJa4AQoYdCA
 bhxX1viiyVHIw
X-Received: by 2002:adf:da43:0:b0:236:dcca:1950 with SMTP id
 r3-20020adfda43000000b00236dcca1950mr551443wrl.385.1667219859818; 
 Mon, 31 Oct 2022 05:37:39 -0700 (PDT)
X-Received: by 2002:adf:da43:0:b0:236:dcca:1950 with SMTP id
 r3-20020adfda43000000b00236dcca1950mr551425wrl.385.1667219859528; 
 Mon, 31 Oct 2022 05:37:39 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003cf55844453sm7900143wmp.22.2022.10.31.05.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:37:39 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:37:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v6 00/17] pci: Abort if pci_add_capability fails
Message-ID: <20221031083635-mutt-send-email-mst@kernel.org>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
X-TUID: 57+R8x54vfJz

On Mon, Oct 31, 2022 at 09:33:02PM +0900, Akihiko Odaki wrote:
> pci_add_capability appears most PCI devices. Its error handling required
> lots of code, and led to inconsistent behaviors such as:
> - passing error_abort
> - passing error_fatal
> - asserting the returned value
> - propagating the error to the caller
> - skipping the rest of the function
> - just ignoring

Thanks for the patchset! I don't think I'll be merging it for
this merge window, the benefit seems small and chance of regressions
high.
I will tag this but pls remind me after the freeze to help make sure I
do not lose it.


> The code generating errors in pci_add_capability had a comment which
> says:
> > Verify that capabilities don't overlap.  Note: device assignment
> > depends on this check to verify that the device is not broken.
> > Should never trigger for emulated devices, but it's helpful for
> > debugging these.
> 
> Indeed vfio has some code that passes capability offsets and sizes from
> a physical device, but it explicitly pays attention so that the
> capabilities never overlap and the only exception are MSI and MSI-X
> capabilities. Therefore, we can add code specific to the case, and
> always assert that capabilities never overlap in the other cases,
> resolving these inconsistencies.
> 
> v6:
> - Error in case of MSI/MSI-X capability overlap (Alex Williamson)
> 
> v5:
> - Fix capability ID specification in vfio_msi_early_setup (Alex Williamson)
> - Use range_covers_byte() (Alex Williamson)
> - warn_report() in case of MSI/MSI-X capability overlap (Alex Williamson)
> 
> v4:
> - Fix typos in messages (Markus Armbruster)
> - hw/vfio/pci: Ensure MSI and MSI-X do not overlap (Alex Williamson)
> 
> v3:
> - Correct patch split between virtio-pci and pci (Markus Armbruster)
> - Add messages for individual patches (Markus Armbruster)
> - Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Akihiko Odaki (17):
>   hw/vfio/pci: Ensure MSI and MSI-X do not overlap
>   pci: Allow to omit errp for pci_add_capability
>   hw/i386/amd_iommu: Omit errp for pci_add_capability
>   ahci: Omit errp for pci_add_capability
>   e1000e: Omit errp for pci_add_capability
>   eepro100: Omit errp for pci_add_capability
>   hw/nvme: Omit errp for pci_add_capability
>   msi: Omit errp for pci_add_capability
>   hw/pci/pci_bridge: Omit errp for pci_add_capability
>   pcie: Omit errp for pci_add_capability
>   pci/shpc: Omit errp for pci_add_capability
>   msix: Omit errp for pci_add_capability
>   pci/slotid: Omit errp for pci_add_capability
>   hw/pci-bridge/pcie_pci_bridge: Omit errp for pci_add_capability
>   hw/vfio/pci: Omit errp for pci_add_capability
>   virtio-pci: Omit errp for pci_add_capability
>   pci: Remove legacy errp from pci_add_capability
> 
>  docs/pcie_sriov.txt                |  4 +-
>  hw/display/bochs-display.c         |  4 +-
>  hw/i386/amd_iommu.c                | 21 ++-------
>  hw/ide/ich.c                       |  8 +---
>  hw/net/e1000e.c                    | 22 ++-------
>  hw/net/eepro100.c                  |  7 +--
>  hw/nvme/ctrl.c                     | 14 +-----
>  hw/pci-bridge/cxl_downstream.c     |  9 +---
>  hw/pci-bridge/cxl_upstream.c       |  8 +---
>  hw/pci-bridge/i82801b11.c          | 14 +-----
>  hw/pci-bridge/pci_bridge_dev.c     |  2 +-
>  hw/pci-bridge/pcie_pci_bridge.c    | 19 ++------
>  hw/pci-bridge/pcie_root_port.c     | 16 +------
>  hw/pci-bridge/xio3130_downstream.c | 15 ++----
>  hw/pci-bridge/xio3130_upstream.c   | 15 ++----
>  hw/pci-host/designware.c           |  3 +-
>  hw/pci-host/xilinx-pcie.c          |  4 +-
>  hw/pci/msi.c                       |  9 +---
>  hw/pci/msix.c                      |  8 +---
>  hw/pci/pci.c                       | 29 +++---------
>  hw/pci/pci_bridge.c                | 21 +++------
>  hw/pci/pcie.c                      | 52 ++++++---------------
>  hw/pci/shpc.c                      | 23 +++------
>  hw/pci/slotid_cap.c                |  8 +---
>  hw/usb/hcd-xhci-pci.c              |  3 +-
>  hw/vfio/pci-quirks.c               | 15 ++----
>  hw/vfio/pci.c                      | 75 ++++++++++++++++++++++--------
>  hw/vfio/pci.h                      |  3 ++
>  hw/virtio/virtio-pci.c             | 12 ++---
>  include/hw/pci/pci.h               |  5 +-
>  include/hw/pci/pci_bridge.h        |  5 +-
>  include/hw/pci/pcie.h              | 11 ++---
>  include/hw/pci/shpc.h              |  3 +-
>  include/hw/virtio/virtio-pci.h     |  2 +-
>  34 files changed, 153 insertions(+), 316 deletions(-)
> 
> -- 
> 2.38.1


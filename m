Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp597122lfg;
        Tue, 17 Aug 2021 07:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFXN6sFK9N+RM4bvcsAyw/asfPstO2P5XPjycOgMHAMb2YTPZSKp689v3YH9Xy0FAH2iYH
X-Received: by 2002:a67:ee02:: with SMTP id f2mr3226122vsp.42.1629212301942;
        Tue, 17 Aug 2021 07:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629212301; cv=none;
        d=google.com; s=arc-20160816;
        b=fizzTruTErbiL/RQgMK0pilyXTDccuUItktxFf1D4qIDOpjusjFru64oftzESpN5fT
         4dBcGS0cP9fHTHwMftfZ46w4PvKm0wu2ax+HYsm74/0QU0Isw0Vhrlx+pnTpAbRp6SRr
         XnRlHmxGiHXCkOAhCLCZoTZawqlI+H5lzHKpAa8ndw+bFbi6qudz8U/ZatgElQrnbAe+
         MabA89791JmbKIvoe7aUruIMddm/SV79amN8KouKwrI1G52SuZmgRIKZ4DXFBOm3VP2R
         zD6J/delr5k7YbGh2BbOh5Ng4x5Hs1a/aYowz3mIf/Jlp2osHJkMhv9jh2TXfJgf8/Cq
         9hpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=pKkHcQ4EUMX+gd1ITZJdHZ/qVB3rgkLPPcJtxUG5YOc=;
        b=ckYtOg11sdj6PvMNgrMnoACsYlIh7WA62hI+phJ9dJ/7uav/6zuGigdCHYzsSYcHf7
         2t0epU+td5ABIx6En4V14zst5Ppd7dSsB6I0waUqrX4phIbbtBnnSlmGH1f9uCC8rrux
         IcaI2HsiPf2l12JWeAypICpW4xDT0jTmh/CVx/LihESxhZIx+SzY4I5HrUaoJxkoNyEx
         gXsC1P6AR4AUy4bCDxN34AGS/X6TQfPqfHoWnmxoYdHky/IpuDGCMx0cQDIeZWImN/SR
         i5QuLaHm+XtFd+jnGKwcTug0LiVX2Gg9AG5HrjaWdfLn5e9oMLyreohyn4LpASM23pEz
         Cerg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g1PNlQ4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si150513vsa.118.2021.08.17.07.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 07:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g1PNlQ4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG0Xl-0007dL-72
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 10:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mG0Xa-0007cD-O4
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 10:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mG0XY-0004yU-Pl
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 10:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629212288;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKkHcQ4EUMX+gd1ITZJdHZ/qVB3rgkLPPcJtxUG5YOc=;
 b=g1PNlQ4syx+6ik5hz90FC1hFe7RTN04f/wHP+vdnpJ2r4Ekn/m5Ca/y8yIzaGo54CEp+T7
 p7aKPJsJnidfPsjHbRFTMdIzYPCkPypgNJahj529Z9nIfqvtXz+fkTtauv8NrYwj2nGwIy
 ZsVXJ4udbNIwe7bPJsrrDTlEQJ1ypX0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-7T19elUjNuur5hQ-5rfzgA-1; Tue, 17 Aug 2021 10:58:06 -0400
X-MC-Unique: 7T19elUjNuur5hQ-5rfzgA-1
Received: by mail-ej1-f72.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so6115856ejt.14
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 07:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=pKkHcQ4EUMX+gd1ITZJdHZ/qVB3rgkLPPcJtxUG5YOc=;
 b=Q8oh7+K8PO5fN3PDgN6G46yVHMRo4g2Gu7lmZ16BgC1OhrIJ9RNyuovih37EmBcfD0
 heCorp39+EZbcyIR9pKP1f7hpNP0DX3tzB7m+kdR3dhzB1bTUMXhGZ01UpV58ot4Epli
 xOEFug7e59nDGMwD8dIKUc/USLoRClflByMa+CGsIYoToJ9VSZEgqe31Dpq1RI4+p4dp
 s39d9ZxI07CiAxJPbP8Li4E4b7Mf9prpFTWVnm1qqV+gfxYY5DGHnzLvIlVqaAZClcFi
 Nj+9age+jjxJtokJCjCgWgU1ANf5EXMM4JKJu6P8dnOyr1OsMzoWpRqH/nIyjna+COlf
 HDZw==
X-Gm-Message-State: AOAM530a2XrW8XGaybmU9xdElWuvDSDSYvdxoLm0DAWVeOAn3/fskxyr
 ufzeiGSUHmyYkQyxWWnmdDpDglofzUmNK08KcrWMMBFQfyE3cHKHXud8NjQm+bPiZEzOKmP+tAg
 OS61hCbGD033XUKTBR49wum+K/xiyo2BQgtKNi4IVi5ElWZnRUk0/oQAXxQpe9/HvW7Y=
X-Received: by 2002:a17:906:26c1:: with SMTP id
 u1mr4397187ejc.491.1629212284337; 
 Tue, 17 Aug 2021 07:58:04 -0700 (PDT)
X-Received: by 2002:a17:906:26c1:: with SMTP id
 u1mr4397148ejc.491.1629212284038; 
 Tue, 17 Aug 2021 07:58:04 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.36.144])
 by smtp.gmail.com with ESMTPSA id bf15sm1171855edb.83.2021.08.17.07.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 07:58:03 -0700 (PDT)
Subject: Re: [PATCH 0/6] virtio-iommu: Add ACPI support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com>
Date: Tue, 17 Aug 2021 16:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4J8e/9uzBxbg

Hi Jean,

On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> Allow instantiating a virtio-iommu device on ACPI systems by adding a
> Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.

Don't you need your other patch
"virtio-iommu: Default to bypass during boot"?

Without this latter, for me the guest fails to boot.

Thanks

Eric
>
> With a simple configuration the table contains a virtio-iommu-pci node
> and a pci-range node:
>
> 	qemu-system-aarch64 -M virt -bios QEMU_EFI.fd
> 	  -device virtio-iommu ...
>
> 	$ iasl -d ...
> 	[000h 0000   4]                    Signature : "VIOT"
>
> 	[024h 0036   2]                   Node count : 0002
> 	[026h 0038   2]                  Node offset : 0030
>
> 	[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> 	[032h 0050   2]                       Length : 0010
> 	[034h 0052   2]                  PCI Segment : 0000
> 	[036h 0054   2]               PCI BDF number : 0030
>
> 	[040h 0064   1]                         Type : 01 [PCI Range]
> 	[042h 0066   2]                       Length : 0018
> 	[044h 0068   4]               Endpoint start : 00000000
> 	[048h 0072   2]            PCI Segment start : 0000
> 	[04Ah 0074   2]              PCI Segment end : 0000
> 	[04Ch 0076   2]                PCI BDF start : 0000
> 	[04Eh 0078   2]                  PCI BDF end : 00FF
> 	[050h 0080   2]                  Output node : 0030
>
> With a more complex topology multiple PCI Range nodes describe the system:
>
> 	qemu-system-aarch64 -bios QEMU_EFI.fd -device virtio-iommu
> 	  -M virt,default_bus_bypass_iommu=true
> 	  -device pxb-pcie,bus_nr=0x10,id=pcie.1000,bus=pcie.0
> 	  -device pxb-pcie,bus_nr=0x20,id=pcie.2000,bus=pcie.0,bypass_iommu=true
> 	  -device pxb-pcie,bus_nr=0x30,id=pcie.3000,bus=pcie.0
>
> 	[024h 0036   2]                   Node count : 0003
> 	[026h 0038   2]                  Node offset : 0030
>
> 	[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
> 	[032h 0050   2]                       Length : 0010
> 	[034h 0052   2]                  PCI Segment : 0000
> 	[036h 0054   2]               PCI BDF number : 0020
>
> 	[040h 0064   1]                         Type : 01 [PCI Range]
> 	[042h 0066   2]                       Length : 0018
> 	[044h 0068   4]               Endpoint start : 00003000
> 	[048h 0072   2]            PCI Segment start : 0000
> 	[04Ah 0074   2]              PCI Segment end : 0000
> 	[04Ch 0076   2]                PCI BDF start : 3000
> 	[04Eh 0078   2]                  PCI BDF end : 32FF
> 	[050h 0080   2]                  Output node : 0030
>
> 	[058h 0088   1]                         Type : 01 [PCI Range]
> 	[05Ah 0090   2]                       Length : 0018
> 	[05Ch 0092   4]               Endpoint start : 00001000
> 	[060h 0096   2]            PCI Segment start : 0000
> 	[062h 0098   2]              PCI Segment end : 0000
> 	[064h 0100   2]                PCI BDF start : 1000
> 	[066h 0102   2]                  PCI BDF end : 11FF
> 	[068h 0104   2]                  Output node : 0030
>
>
> The VIOT table description will be in the next release of ACPI.
> In the meantime you can find a description at
> https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
> Linux support for VIOT was added in version 5.14
>
> Eric Auger (1):
>   pc: Allow instantiating a virtio-iommu device
>
> Jean-Philippe Brucker (5):
>   acpi: Add VIOT structure definitions
>   hw/acpi: Add VIOT table
>   hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
>   hw/arm/virt: Remove device tree restriction for virtio-iommu
>   pc: Add VIOT table for virtio-iommu
>
>  hw/acpi/viot.h               | 13 ++++++
>  include/hw/acpi/acpi-defs.h  | 60 ++++++++++++++++++++++++++
>  include/hw/i386/pc.h         |  2 +
>  hw/acpi/viot.c               | 82 ++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c     |  7 +++
>  hw/arm/virt.c                | 10 +----
>  hw/i386/acpi-build.c         |  5 +++
>  hw/i386/pc.c                 | 18 +++++++-
>  hw/virtio/virtio-iommu-pci.c |  7 ---
>  hw/acpi/Kconfig              |  4 ++
>  hw/acpi/meson.build          |  1 +
>  hw/arm/Kconfig               |  1 +
>  hw/i386/Kconfig              |  1 +
>  13 files changed, 195 insertions(+), 16 deletions(-)
>  create mode 100644 hw/acpi/viot.h
>  create mode 100644 hw/acpi/viot.c
>


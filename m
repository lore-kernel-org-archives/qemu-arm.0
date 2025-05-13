Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp426564njb;
        Tue, 13 May 2025 03:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXoWLU4DNx9iGpLtMWCms+XJ5St1+w1uFuBWZ1ctiSlZzwKhEGoIfnkG3VgbmN992KT57WZVl/tUfRs9A==@linaro.org
X-Google-Smtp-Source: AGHT+IG1QwG+MEtPrejk51/cUTWR/SU2r/W66v+xuio9LtVpEj0UGXnsaAc6DnhkeRxK/8iU9zrX
X-Received: by 2002:a17:907:6a17:b0:ad2:3723:6bf5 with SMTP id a640c23a62f3a-ad23723ca9cmr941390666b.22.1747133339526;
        Tue, 13 May 2025 03:48:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747133339; cv=pass;
        d=google.com; s=arc-20240605;
        b=ML+AiB9Jeo3mKKMhw7lapS36iAejMaLK7VaYVG47XoTW8+kprfF5BwCTGzGzFCwKA3
         epD22ux+MpHJ1BbxSiMnuX/4VLN5POLsq19SumrnYrt2h5EiiSO5dutLiWRB0JCX5p7w
         QeBTps1t4TlhEyB+HlNYLDoALQfKlh03Wnssd7/UdUtoqcExHMVXarKfLLaY/mPTPe03
         rw90Y15Dw8PrTWZ+xV6qQmLBkXjUXsIkEoVxbo2RcftJKkJ/zqbPxcJ4rX7CNzcVdZA0
         0jptmV2jJvP15UP2ouuA95aggDiRV8Sj78FqAKEFOCp13COWmqNbAMM++JIj1mBm0mJO
         WmvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Gz6YcumP7UgPrL/99BZYderRp5B/M2Kk31LyOBDbBAY=;
        fh=pDC2Fa9/v3JzkUWyplyBQ7eGi4Zdf5efm4LyzdiAxiA=;
        b=R3qJGNcGzJPd695nhJpgbJEbmH0rXfLRUBbuBS+iLfEswvHUEVCUljTDFu97PPfley
         l/Rn+Rlqugo41XKugbj/OJw09JVnm3aykSfv1mQ0DJGMHYffBwXca7O+nGiBAXarPDYV
         D1/VqJ7AbfGOL6MV/XcZVNQ0I7mhApEwO4j/hCw9anGJblzbee5neC7r32ANZmEBwX1u
         2XJaGhUPfyPs7vpV/2brP2Bzhb/YhoS/sCXLsjwj3fJma3VEhPYOAC/55fMAi0s9yvne
         AT9+HQ/xQd/sjZvgGdl6Sql1+m/zTE064aKm3X4r+SotBjDAnQjyFvVc2qKoFEwSk4xe
         DxmA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W8XRhRGH;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46342-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46342-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-46342-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ad2198a1a8csi725177066b.484.2025.05.13.03.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46342-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W8XRhRGH;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46342-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-46342-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28BDE189DCAA
	for <alex.bennee@linaro.org>; Tue, 13 May 2025 10:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED26A20E6F3;
	Tue, 13 May 2025 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8XRhRGH"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A427E7F0
	for <kvm@vger.kernel.org>; Tue, 13 May 2025 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133333; cv=none; b=pyX/PFv0Z8gcmWdkr7LUgfLE1FAVK0R/FBOaeo5jGBdou4UfZluRZ3ZsE38YKmfHWMItRV+WZCiLj04hqQEsOQ33+yRl0c+KZbrL7BebqCF0X+pdoq2ZpCPp8dQZcM4dyjjFmN080vrjxuxPwKNNXDnbRY/DbcxBLLMJUJhYFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133333; c=relaxed/simple;
	bh=zf6eEW/DHGIdMkVR/S4UINUxXgPfx0IeFcgLZV4snaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WaX5ae4d4drp/BKwKgw2HkE3WjZN5nILFxYDRg2GQt8MNi10HYMGZJFINCGh7ZFLSBgrJShcAdhLPArez+xJxIWEFqAi0iePiuLTqViW5UpqKTHzdGnrFEIzLQKe5fUtgGtXHVVbDZ2UdzqcW5IB5DwYv63VHxtdyZkZHFif+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8XRhRGH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747133331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz6YcumP7UgPrL/99BZYderRp5B/M2Kk31LyOBDbBAY=;
	b=W8XRhRGHpRdHYNf1xpi7xuLGH/Feur9tF5aZwXAacNVxYa6R5KpQjTz8S0eSJCNLJ/97IW
	ykNxGFBBboRtXgTvArKLEU0x1DP+ovuUuy2ceJ2v3R9Axj3E6yN/v5Ym/gayHnvOs43lcX
	whxgFAlW5MRnTYarO6CguMjj9xrAoJE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-TwUHW52fNS68VFft3YhXXg-1; Tue, 13 May 2025 06:48:49 -0400
X-MC-Unique: TwUHW52fNS68VFft3YhXXg-1
X-Mimecast-MFC-AGG-ID: TwUHW52fNS68VFft3YhXXg_1747133329
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eed325461so28532975e9.3
        for <kvm@vger.kernel.org>; Tue, 13 May 2025 03:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133328; x=1747738128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gz6YcumP7UgPrL/99BZYderRp5B/M2Kk31LyOBDbBAY=;
        b=AXmVw+NZf5rMlTTchEVclSRbPX8YJOH9IQoTvj5N1J/LdbmODi49HLfPdPCXHt83GD
         sg3+B0NfPf+s4kFq+jLeu8/daiY3LA0gwud3pXufOiGrK8w3DdSRCfOLHC22NxGtaYWE
         FRRv5ThwFn7N2EQkr5/OD/txWxwo4eXYdbIPtLWvSVuTrNlgDrquR15ZZMqnsvTmUrXf
         XzDW8/jmMqLQHoF13hKhp+lzDEXPx4EFObwDzCn9M4qhS57RsEPIvAo41xI3rSGy4ciK
         JQNCrXP60g2Rzh/tPMfYDxPALwHSLe3B06a1gfulBMl0V2VatDcC8RykcihBaRmE4YTG
         Lcvg==
X-Forwarded-Encrypted: i=1; AJvYcCWmZoAu+qki/B+qmlXJ/+BFdE5gc7UgrNM2sUO9LnnjRmepUIz1bSFxwl1924OoYa+uel0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6N+3HX4aAVbEoRGv3hTCDMPj6RsxueLGZ28rxOhf4ID1pwLEV
	tukQyVy1oimzYD7MQtmgOqh1C1Mu1SkrKBDv9NeeQGewN2jX638c1wNN0Y4Xfg1Ii5PKfe1rlUa
	goKXXOlslYvELkg/+ZMnYaKilfevc0CV5CYZZ+JFqvUdRsRuLoWH9JEahrLu0
X-Gm-Gg: ASbGncsAOXq/IxVbLwLiBwSXs/F6L5oWMbVNMKyAoJjq3zkJdfyvqszdY2ShkvGsuNy
	VpwrPtpum6q4DaU2Qi9qX5eHnyQ4fZOgO2pWfpWCMEpRvZfYFq4q1fF3YExWWRG7RZ7RA6yzUPp
	77CniQ51haZOoal++E9EAwdulE8cZodS0oynBR9zwFml5VtkOmYBC7fGyB5Zq09tcCcdeDEPpir
	uD9ePQaE1sFiC0FThidLc3eOJdJXWSgiI4tX7Y0pV4kOpeYatmmTwUWkQpNlp5yj5mMu+cxmqP5
	+vZWs/JBuQw5lFKaEpdd/iMMi8ZDzy15
X-Received: by 2002:a05:600c:528a:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-442d6d6b6ecmr146027865e9.18.1747133328275;
        Tue, 13 May 2025 03:48:48 -0700 (PDT)
X-Received: by 2002:a05:600c:528a:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-442d6d6b6ecmr146027595e9.18.1747133327880;
        Tue, 13 May 2025 03:48:47 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm162625765e9.13.2025.05.13.03.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:48:47 -0700 (PDT)
Date: Tue, 13 May 2025 12:48:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 27/27] hw/virtio/virtio-pci: Remove
 VIRTIO_PCI_FLAG_PAGE_PER_VQ definition
Message-ID: <20250513124845.0399f5f1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-28-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
	<20250508133550.81391-28-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Y4/JmwJRknF1

On Thu,  8 May 2025 15:35:50 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> VIRTIO_PCI_FLAG_PAGE_PER_VQ was only used by the hw_compat_2_7[]
> array, via the 'page-per-vq=3Don' property. We removed all
> machines using that array, lets remove all the code around
> VIRTIO_PCI_FLAG_PAGE_PER_VQ (see commit 9a4c0e220d8 for similar
> VIRTIO_PCI_FLAG_* enum removal).
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/virtio/virtio-pci.h |  1 -
>  hw/display/virtio-vga.c        | 10 ----------
>  hw/virtio/virtio-pci.c         |  7 +------
>  3 files changed, 1 insertion(+), 17 deletions(-)
>=20
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pc=
i.h
> index 9838e8650a6..8abc5f8f20d 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -33,7 +33,6 @@ enum {
>      VIRTIO_PCI_FLAG_BUS_MASTER_BUG_MIGRATION_BIT,
>      VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT,
>      VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY_BIT,
> -    VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT,

there is also=20

/* page per vq flag to be used by split drivers within guests */           =
     =20
#define VIRTIO_PCI_FLAG_PAGE_PER_VQ \                                      =
     =20
    (1 << VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT)=20

left behind


nevertheless, I'm not sure if we should remove this at all,
it seems that there are external users
https://bugzilla.redhat.com/show_bug.cgi?id=3D1925363

>      VIRTIO_PCI_FLAG_ATS_BIT,
>      VIRTIO_PCI_FLAG_INIT_DEVERR_BIT,
>      VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 40e60f70fcd..83d01f089b5 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -141,16 +141,6 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *=
vpci_dev, Error **errp)
>                                 VIRTIO_GPU_SHM_ID_HOST_VISIBLE);
>      }
> =20
> -    if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
> -        /*
> -         * with page-per-vq=3Doff there is no padding space we can use
> -         * for the stdvga registers.  Make the common and isr regions
> -         * smaller then.
> -         */
> -        vpci_dev->common.size /=3D 2;
> -        vpci_dev->isr.size /=3D 2;
> -    }
> -
>      offset =3D memory_region_size(&vpci_dev->modern_bar);
>      offset -=3D vpci_dev->notify.size;
>      vpci_dev->notify.offset =3D offset;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 7c965771907..4e0d4bda6ed 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -314,12 +314,9 @@ static bool virtio_pci_ioeventfd_enabled(DeviceState=
 *d)
>      return (proxy->flags & VIRTIO_PCI_FLAG_USE_IOEVENTFD) !=3D 0;
>  }
> =20
> -#define QEMU_VIRTIO_PCI_QUEUE_MEM_MULT 0x1000
> -
>  static inline int virtio_pci_queue_mem_mult(struct VirtIOPCIProxy *proxy)
>  {
> -    return (proxy->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ) ?
> -        QEMU_VIRTIO_PCI_QUEUE_MEM_MULT : 4;
> +    return 4;
>  }
> =20
>  static int virtio_pci_ioeventfd_assign(DeviceState *d, EventNotifier *no=
tifier,
> @@ -2348,8 +2345,6 @@ static const Property virtio_pci_properties[] =3D {
>                      VIRTIO_PCI_FLAG_BUS_MASTER_BUG_MIGRATION_BIT, false),
>      DEFINE_PROP_BIT("modern-pio-notify", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY_BIT, false),
> -    DEFINE_PROP_BIT("page-per-vq", VirtIOPCIProxy, flags,
> -                    VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT, false),
>      DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_ATS_BIT, false),
>      DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BC6C44525
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 12:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viXYu-00047W-OU; Wed, 21 Jan 2026 07:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1viXS1-0000Ww-8l
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 07:36:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1viXRx-0004YU-Un
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 07:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768999000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FliO+0+N6yK98z0Fg6EgwNxlGjUJONnnw/NVFutu8WU=;
 b=dyldfiQYLIWo7PNJZVceia8f30wXsNmOIgls81B72zYIChB1B5ozaHoByMoKZX+0lGobir
 GEKLM8IL3TEZAyV/7TI3uuXwQSUyNdtw8FP3X4KaxMx4GdZUtCrg/h7UUkRbgo67if9KCT
 y2K+DeINzTqEr1qvaEltLvzZs19rVL0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-eu4vOj4GNFew4X-IWl06aw-1; Wed, 21 Jan 2026 07:36:38 -0500
X-MC-Unique: eu4vOj4GNFew4X-IWl06aw-1
X-Mimecast-MFC-AGG-ID: eu4vOj4GNFew4X-IWl06aw_1768998997
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47edc79ff28so42143595e9.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 04:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768998997; x=1769603797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FliO+0+N6yK98z0Fg6EgwNxlGjUJONnnw/NVFutu8WU=;
 b=UfZviYZVmXz/PuapEU9N2Q+uLjeGH2RH/7i/kNuKA4FlpGBOpJQCTbNNTXBR3Yqf/o
 Uu3mmiQlNG8WCI9ImM5XtQLilkrNVKHsaKT0tqdw+7Byj3Wie1X7TtHqg0I9NGNBfuhV
 YfIf54AbT2j8oEGC+0GDwO36WUhgfP8iqLH7K5OMuE4CzpU+p0AFg650PIfQnFFN8zM+
 DBok6ZEbkjKNNVyqbA/ewjw6BxA5Ubu8u7dSBCLXt9N855sBaQs9U1pPAGO9LRp04lC4
 M+OkkUu+zzHRNuTobKUH9N2+7/oKbxUIgfteZoYbtDEcHloWyJCUH8nwl1HiCYzMsZD5
 RhnQ==
X-Gm-Message-State: AOJu0Yx3ZdNJF6l0BKka4ufnEPndsY5fC+M/ji/7Q5MZ03Rc9j4vc4IN
 S7ZiQwijSrco/fptU1tStgc7NKbvQvmVb7zCp89am+zh8/e7s6bZn+bwfyK6lYzJbX/l0u1u+Au
 KjgifxQaFbkxsbc48KyhGP7RWBLioMh6ZRNfqaIgJ68yMb1re7rAX4Q==
X-Gm-Gg: AZuq6aL01BEPAvsD7P2baTJZ1ggSi9Fg6uKbuMZrZKxHD9vIAloloac+gBoU7Zs6xqy
 cCqSpTx6INgasby4YrUixYCAZhfy1txTSnH3uEyL2KocLVd7nDJ8FRIKsRinM0WH82K771MS1rI
 8rMc/qre5JNYJ+QWSORQ9Z9NV8U5NAqkM2FiI6dDtRBR7ej8TaV4aIordfn55TaVBTG7L/Oxlbu
 dt+2qVfi/FNEhPOxjuBPulYq6+5KurB8PnYRz8bMbCY9aQ0bo/uw+7OVrFwxOdXXOCt1DLxjazP
 mcshWxEbNH5VHEhVvhAFLhkxX5ajiPrwEbHRiYIItNr/mfxwOuu0j/ffPdx8SNfBkryTd8Oskri
 4JGvoxz42JZkg0enj5w2HHpaOd1qo+RE=
X-Received: by 2002:a05:600c:5493:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-4803a71968bmr123530465e9.26.1768998997382; 
 Wed, 21 Jan 2026 04:36:37 -0800 (PST)
X-Received: by 2002:a05:600c:5493:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-4803a71968bmr123530015e9.26.1768998996913; 
 Wed, 21 Jan 2026 04:36:36 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480424c4b8bsm21616655e9.6.2026.01.21.04.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 04:36:36 -0800 (PST)
Date: Wed, 21 Jan 2026 07:36:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 alex@shazbot.org, clg@redhat.com, cohuck@redhat.com,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhenzhong.duan@intel.com, vivek.kasireddy@intel.com, kjaju@nvidia.com
Subject: Re: [PATCH v4 0/3] vfio: Add DMABUF support for PCI BAR regions
Message-ID: <20260121073625-mutt-send-email-mst@kernel.org>
References: <20260121114111.34045-1-skolothumtho@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260121114111.34045-1-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Zk-9SRS35HTeiLZ-kZv900GqRsutw7x2xoYbds4HWA_1768998997
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.069,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Jan 21, 2026 at 11:41:08AM +0000, Shameer Kolothum wrote:
> Hi,
> 
> Linux now provides a VFIO dmabuf exporter to expose PCI BAR memory for P2P
> use cases. This adds support for vfio devices to create a dmabuf for
> each mapped BAR region.
> 
> Changes from v3:
>  https://lore.kernel.org/qemu-devel/20260116092950.15796-1-skolothumtho@nvidia.com/
>  
>  - Folded in patch #2 to linux-headers update to avoid bisect failure
>    due to build error.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> The dmabuf support was sanity tested on an NVIDIA grace paltform.
> 
> Please take a look and let me know.
> 
> Thanks,
> Shameer
> 
> Nicolin Chen (1):
>   hw/vfio/region: Create dmabuf for PCI BAR per region
> 
> Shameer Kolothum (2):
>   linux-headers: Update to Linux v6.19-rc1
>   hw/vfio: Add helper to retrieve device feature
> 
>  hw/net/virtio-net.c                           |  11 +-
>  hw/vfio/container.c                           |   2 +-
>  hw/vfio/device.c                              |   9 ++
>  hw/vfio/listener.c                            |   4 +-
>  hw/vfio/region.c                              |  65 +++++++++-
>  hw/vfio/trace-events                          |   1 +
>  include/hw/vfio/vfio-device.h                 |   3 +
>  include/standard-headers/drm/drm_fourcc.h     |  25 ++--
>  include/standard-headers/linux/ethtool.h      |   5 +
>  .../linux/input-event-codes.h                 |  14 ++-
>  include/standard-headers/linux/pci_regs.h     |  89 ++++++++++++++
>  include/standard-headers/linux/virtio_net.h   |   3 +-
>  include/standard-headers/linux/virtio_pci.h   |   2 +-
>  linux-headers/asm-arm64/kvm.h                 |   2 +-
>  linux-headers/asm-arm64/unistd_64.h           |   1 +
>  linux-headers/asm-generic/unistd.h            |   4 +-
>  linux-headers/asm-loongarch/kvm.h             |   1 +
>  linux-headers/asm-loongarch/unistd.h          |   6 +
>  linux-headers/asm-loongarch/unistd_64.h       |   1 +
>  linux-headers/asm-mips/unistd_n32.h           |   1 +
>  linux-headers/asm-mips/unistd_n64.h           |   1 +
>  linux-headers/asm-mips/unistd_o32.h           |   1 +
>  linux-headers/asm-powerpc/unistd_32.h         |   1 +
>  linux-headers/asm-powerpc/unistd_64.h         |   1 +
>  linux-headers/asm-riscv/kvm.h                 |   3 +
>  linux-headers/asm-riscv/unistd_32.h           |   1 +
>  linux-headers/asm-riscv/unistd_64.h           |   1 +
>  linux-headers/asm-s390/bitsperlong.h          |   4 -
>  linux-headers/asm-s390/unistd.h               |   4 -
>  linux-headers/asm-s390/unistd_64.h            |   9 +-
>  linux-headers/asm-x86/kvm.h                   |   1 +
>  linux-headers/asm-x86/unistd_32.h             |   1 +
>  linux-headers/asm-x86/unistd_64.h             |   1 +
>  linux-headers/asm-x86/unistd_x32.h            |   1 +
>  linux-headers/linux/iommufd.h                 |  10 ++
>  linux-headers/linux/kvm.h                     |  11 ++
>  linux-headers/linux/mshv.h                    | 116 +++++++++++++++++-
>  linux-headers/linux/psp-sev.h                 |  66 ++++++----
>  linux-headers/linux/vfio.h                    |  28 +++++
>  39 files changed, 450 insertions(+), 60 deletions(-)
> 
> -- 
> 2.43.0



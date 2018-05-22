Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k30-v6sm31474181wrf.17.2018.05.22.04.00.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 04:00:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8BE8F3E01DB;
	Tue, 22 May 2018 12:00:11 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-12-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 11/27] Make address_space_get_iotlb_entry() take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-12-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 12:00:11 +0100
Message-ID: <87a7ssuf9g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: AOQ49HxrGqeI


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_get_iotlb_entry().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/memory.h | 2 +-
>  exec.c                | 2 +-
>  hw/virtio/vhost.c     | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 3980ab47ed..309fdfb89b 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1896,7 +1896,7 @@ void address_space_cache_destroy(MemoryRegionCache =
*cache);
>   * entry. Should be called from an RCU critical section.
>   */
>  IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr add=
r,
> -                                            bool is_write);
> +                                            bool is_write, MemTxAttrs at=
trs);
>
>  /* address_space_translate: translate an address range into an address s=
pace
>   * into a MemoryRegion and an address range into that section.  Should be
> diff --git a/exec.c b/exec.c
> index b818ba87f4..84f2c21ecb 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -582,7 +582,7 @@ static MemoryRegionSection flatview_do_translate(Flat=
View *fv,
>
>  /* Called from RCU critical section */
>  IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr add=
r,
> -                                            bool is_write)
> +                                            bool is_write, MemTxAttrs at=
trs)
>  {
>      MemoryRegionSection section;
>      hwaddr xlat, page_mask;
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 9d5850a7d7..48f4fd7cc9 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -895,7 +895,8 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev, ui=
nt64_t iova, int write)
>      rcu_read_lock();
>
>      iotlb =3D address_space_get_iotlb_entry(dev->vdev->dma_as,
> -                                          iova, write);
> +                                          iova, write,
> +                                          MEMTXATTRS_UNSPECIFIED);
>      if (iotlb.target_as !=3D NULL) {
>          ret =3D vhost_memory_region_lookup(dev, iotlb.translated_addr,
>                                           &uaddr, &len);


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l69-v6sm24681452wmb.6.2018.05.22.03.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 03:58:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C4C493E01DB;
	Tue, 22 May 2018 11:58:02 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-9-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 08/27] Make MemoryRegion valid.accepts callback take a MemTxAttrs argument
In-reply-to: <20180521140402.23318-9-peter.maydell@linaro.org>
Date: Tue, 22 May 2018 11:58:02 +0100
Message-ID: <87efi4ufd1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aUrPgFqnTrKf


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to the MemoryRegion valid.accepts
> callback. We'll need this for subpage_accepts().
>
> We could take the approach we used with the read and write
> callbacks and add new a new _with_attrs version, but since there
> are so few implementations of the accepts hook we just change
> them all.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/memory.h |  3 ++-
>  exec.c                |  9 ++++++---
>  hw/hppa/dino.c        |  3 ++-
>  hw/nvram/fw_cfg.c     | 12 ++++++++----
>  hw/scsi/esp.c         |  3 ++-
>  hw/xen/xen_pt_msi.c   |  3 ++-
>  memory.c              |  5 +++--
>  7 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 54263bd23b..444fceac55 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -166,7 +166,8 @@ struct MemoryRegionOps {
>           * as a machine check exception).
>           */
>          bool (*accepts)(void *opaque, hwaddr addr,
> -                        unsigned size, bool is_write);
> +                        unsigned size, bool is_write,
> +                        MemTxAttrs attrs);
>      } valid;
>      /* Internal implementation constraints: */
>      struct {
> diff --git a/exec.c b/exec.c
> index 6cf97b5d28..b58eb0fedd 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2539,7 +2539,8 @@ static void notdirty_mem_write(void *opaque, hwaddr=
 ram_addr,
>  }
>
>  static bool notdirty_mem_accepts(void *opaque, hwaddr addr,
> -                                 unsigned size, bool is_write)
> +                                 unsigned size, bool is_write,
> +                                 MemTxAttrs attrs)
>  {
>      return is_write;
>  }
> @@ -2762,7 +2763,8 @@ static MemTxResult subpage_write(void *opaque, hwad=
dr addr,
>  }
>
>  static bool subpage_accepts(void *opaque, hwaddr addr,
> -                            unsigned len, bool is_write)
> +                            unsigned len, bool is_write,
> +                            MemTxAttrs attrs)
>  {
>      subpage_t *subpage =3D opaque;
>  #if defined(DEBUG_SUBPAGE)
> @@ -2845,7 +2847,8 @@ static void readonly_mem_write(void *opaque, hwaddr=
 addr,
>  }
>
>  static bool readonly_mem_accepts(void *opaque, hwaddr addr,
> -                                 unsigned size, bool is_write)
> +                                 unsigned size, bool is_write,
> +                                 MemTxAttrs attrs)
>  {
>      return is_write;
>  }
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 15aefde09c..77463672a3 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -137,7 +137,8 @@ static void gsc_to_pci_forwarding(DinoState *s)
>  }
>
>  static bool dino_chip_mem_valid(void *opaque, hwaddr addr,
> -                                unsigned size, bool is_write)
> +                                unsigned size, bool is_write,
> +                                MemTxAttrs attrs)
>  {
>      switch (addr) {
>      case DINO_IAR0:
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 2a0739d0e9..b23e7f64a8 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -420,14 +420,16 @@ static void fw_cfg_dma_mem_write(void *opaque, hwad=
dr addr,
>  }
>
>  static bool fw_cfg_dma_mem_valid(void *opaque, hwaddr addr,
> -                                  unsigned size, bool is_write)
> +                                 unsigned size, bool is_write,
> +                                 MemTxAttrs attrs)
>  {
>      return !is_write || ((size =3D=3D 4 && (addr =3D=3D 0 || addr =3D=3D=
 4)) ||
>                           (size =3D=3D 8 && addr =3D=3D 0));
>  }
>
>  static bool fw_cfg_data_mem_valid(void *opaque, hwaddr addr,
> -                                  unsigned size, bool is_write)
> +                                  unsigned size, bool is_write,
> +                                  MemTxAttrs attrs)
>  {
>      return addr =3D=3D 0;
>  }
> @@ -439,7 +441,8 @@ static void fw_cfg_ctl_mem_write(void *opaque, hwaddr=
 addr,
>  }
>
>  static bool fw_cfg_ctl_mem_valid(void *opaque, hwaddr addr,
> -                                 unsigned size, bool is_write)
> +                                 unsigned size, bool is_write,
> +                                 MemTxAttrs attrs)
>  {
>      return is_write && size =3D=3D 2;
>  }
> @@ -458,7 +461,8 @@ static void fw_cfg_comb_write(void *opaque, hwaddr ad=
dr,
>  }
>
>  static bool fw_cfg_comb_valid(void *opaque, hwaddr addr,
> -                                  unsigned size, bool is_write)
> +                              unsigned size, bool is_write,
> +                              MemTxAttrs attrs)
>  {
>      return (size =3D=3D 1) || (is_write && size =3D=3D 2);
>  }
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 64ec285826..9ed9727744 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -564,7 +564,8 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint6=
4_t val)
>  }
>
>  static bool esp_mem_accepts(void *opaque, hwaddr addr,
> -                            unsigned size, bool is_write)
> +                            unsigned size, bool is_write,
> +                            MemTxAttrs attrs)
>  {
>      return (size =3D=3D 1) || (is_write && size =3D=3D 4);
>  }
> diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
> index 6d1e3bdeb4..cc514f9157 100644
> --- a/hw/xen/xen_pt_msi.c
> +++ b/hw/xen/xen_pt_msi.c
> @@ -498,7 +498,8 @@ static uint64_t pci_msix_read(void *opaque, hwaddr ad=
dr,
>  }
>
>  static bool pci_msix_accepts(void *opaque, hwaddr addr,
> -                             unsigned size, bool is_write)
> +                             unsigned size, bool is_write,
> +                             MemTxAttrs attrs)
>  {
>      return !(addr & (size - 1));
>  }
> diff --git a/memory.c b/memory.c
> index 279f7c9b4a..10fa2ddd31 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1269,7 +1269,8 @@ static void unassigned_mem_write(void *opaque, hwad=
dr addr,
>  }
>
>  static bool unassigned_mem_accepts(void *opaque, hwaddr addr,
> -                                   unsigned size, bool is_write)
> +                                   unsigned size, bool is_write,
> +                                   MemTxAttrs attrs)
>  {
>      return false;
>  }
> @@ -1374,7 +1375,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>      access_size =3D MAX(MIN(size, access_size_max), access_size_min);
>      for (i =3D 0; i < size; i +=3D access_size) {
>          if (!mr->ops->valid.accepts(mr->opaque, addr + i, access_size,
> -                                    is_write)) {
> +                                    is_write, attrs)) {
>              return false;
>          }
>      }


--
Alex Benn=C3=A9e

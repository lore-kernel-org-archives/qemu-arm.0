Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 11-v6sm1543684wmd.35.2018.06.14.11.23.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jun 2018 11:23:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 267AE3E0112;
	Thu, 14 Jun 2018 19:23:01 +0100 (BST)
References: <20180604152941.20374-1-peter.maydell@linaro.org> <20180604152941.20374-5-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 04/13] exec.c: Handle IOMMUs in address_space_translate_for_iotlb()
In-reply-to: <20180604152941.20374-5-peter.maydell@linaro.org>
Date: Thu, 14 Jun 2018 19:23:01 +0100
Message-ID: <87tvq5z0qi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7UokQAUNk/e/


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently we don't support board configurations that put an IOMMU
> in the path of the CPU's memory transactions, and instead just
> assert() if the memory region fonud in address_space_translate_for_iotlb()
> is an IOMMUMemoryRegion.
>
> Remove this limitation by having the function handle IOMMUs.
> This is mostly straightforward, but we must make sure we have
> a notifier registered for every IOMMU that a transaction has
> passed through, so that we can flush the TLB appropriately
> when any of the IOMMUs change their mappings.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/exec/exec-all.h |   3 +-
>  include/qom/cpu.h       |   3 +
>  accel/tcg/cputlb.c      |   3 +-
>  exec.c                  | 135 +++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 140 insertions(+), 4 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 4d09eaba72d..e0ff19b7112 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -469,7 +469,8 @@ void tb_flush_jmp_cache(CPUState *cpu, target_ulong a=
ddr);
>
>  MemoryRegionSection *
>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> -                                  hwaddr *xlat, hwaddr *plen);
> +                                  hwaddr *xlat, hwaddr *plen,
> +                                  MemTxAttrs attrs, int *prot);
>  hwaddr memory_region_section_get_iotlb(CPUState *cpu,
>                                         MemoryRegionSection *section,
>                                         target_ulong vaddr,
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 9d3afc6c759..cce2fd6acc2 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -429,6 +429,9 @@ struct CPUState {
>      uint16_t pending_tlb_flush;
>
>      int hvf_fd;
> +
> +    /* track IOMMUs whose translations we've cached in the TCG TLB */
> +    GArray *iommu_notifiers;
>  };
>
>  QTAILQ_HEAD(CPUTailQ, CPUState);
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 05439039e91..c8acaf21e9f 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -632,7 +632,8 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ul=
ong vaddr,
>      }
>
>      sz =3D size;
> -    section =3D address_space_translate_for_iotlb(cpu, asidx, paddr, &xl=
at, &sz);
> +    section =3D address_space_translate_for_iotlb(cpu, asidx, paddr, &xl=
at, &sz,
> +                                                attrs, &prot);
>      assert(sz >=3D TARGET_PAGE_SIZE);
>
>      tlb_debug("vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGET_FMT_plx
> diff --git a/exec.c b/exec.c
> index 033e74c36e4..28181115cc2 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -650,18 +650,144 @@ MemoryRegion *flatview_translate(FlatView *fv, hwa=
ddr addr, hwaddr *xlat,
>      return mr;
>  }
>
> +typedef struct TCGIOMMUNotifier {
> +    IOMMUNotifier n;
> +    MemoryRegion *mr;
> +    CPUState *cpu;
> +    int iommu_idx;
> +    bool active;
> +} TCGIOMMUNotifier;
> +
> +static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotl=
b)
> +{
> +    TCGIOMMUNotifier *notifier =3D container_of(n, TCGIOMMUNotifier, n);
> +
> +    if (!notifier->active) {
> +        return;
> +    }
> +    tlb_flush(notifier->cpu);
> +    notifier->active =3D false;
> +    /* We leave the notifier struct on the list to avoid reallocating it=
 later.
> +     * Generally the number of IOMMUs a CPU deals with will be small.
> +     * In any case we can't unregister the iommu notifier from a notify
> +     * callback.
> +     */
> +}
> +
> +static void tcg_register_iommu_notifier(CPUState *cpu,
> +                                        IOMMUMemoryRegion *iommu_mr,
> +                                        int iommu_idx)
> +{
> +    /* Make sure this CPU has an IOMMU notifier registered for this
> +     * IOMMU/IOMMU index combination, so that we can flush its TLB
> +     * when the IOMMU tells us the mappings we've cached have changed.
> +     */
> +    MemoryRegion *mr =3D MEMORY_REGION(iommu_mr);
> +    TCGIOMMUNotifier *notifier;
> +    int i;
> +
> +    for (i =3D 0; i < cpu->iommu_notifiers->len; i++) {
> +        notifier =3D &g_array_index(cpu->iommu_notifiers, TCGIOMMUNotifi=
er, i);
> +        if (notifier->mr =3D=3D mr && notifier->iommu_idx =3D=3D iommu_i=
dx) {
> +            break;
> +        }
> +    }
> +    if (i =3D=3D cpu->iommu_notifiers->len) {
> +        /* Not found, add a new entry at the end of the array */
> +        cpu->iommu_notifiers =3D g_array_set_size(cpu->iommu_notifiers, =
i + 1);
> +        notifier =3D &g_array_index(cpu->iommu_notifiers, TCGIOMMUNotifi=
er, i);
> +
> +        notifier->mr =3D mr;
> +        notifier->iommu_idx =3D iommu_idx;
> +        notifier->cpu =3D cpu;
> +        /* Rather than trying to register interest in the specific part
> +         * of the iommu's address space that we've accessed and then
> +         * expand it later as subsequent accesses touch more of it, we
> +         * just register interest in the whole thing, on the assumption
> +         * that iommu reconfiguration will be rare.
> +         */
> +        iommu_notifier_init(&notifier->n,
> +                            tcg_iommu_unmap_notify,
> +                            IOMMU_NOTIFIER_UNMAP,
> +                            0,
> +                            HWADDR_MAX,
> +                            iommu_idx);
> +        memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
);
> +    }
> +
> +    if (!notifier->active) {
> +        notifier->active =3D true;
> +    }
> +}
> +
> +static void tcg_iommu_free_notifier_list(CPUState *cpu)
> +{
> +    /* Destroy the CPU's notifier list */
> +    int i;
> +    TCGIOMMUNotifier *notifier;
> +
> +    for (i =3D 0; i < cpu->iommu_notifiers->len; i++) {
> +        notifier =3D &g_array_index(cpu->iommu_notifiers, TCGIOMMUNotifi=
er, i);
> +        memory_region_unregister_iommu_notifier(notifier->mr, &notifier-=
>n);
> +    }
> +    g_array_free(cpu->iommu_notifiers, true);
> +}
> +
>  /* Called from RCU critical section */
>  MemoryRegionSection *
>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
> -                                  hwaddr *xlat, hwaddr *plen)
> +                                  hwaddr *xlat, hwaddr *plen,
> +                                  MemTxAttrs attrs, int *prot)
>  {
>      MemoryRegionSection *section;
> +    IOMMUMemoryRegion *iommu_mr;
> +    IOMMUMemoryRegionClass *imrc;
> +    IOMMUTLBEntry iotlb;
> +    int iommu_idx;
>      AddressSpaceDispatch *d =3D atomic_rcu_read(&cpu->cpu_ases[asidx].me=
mory_dispatch);
>
> -    section =3D address_space_translate_internal(d, addr, xlat, plen, fa=
lse);
> +    for (;;) {
> +        section =3D address_space_translate_internal(d, addr, &addr, ple=
n, false);
> +
> +        iommu_mr =3D memory_region_get_iommu(section->mr);
> +        if (!iommu_mr) {
> +            break;
> +        }
> +
> +        imrc =3D memory_region_get_iommu_class_nocheck(iommu_mr);
> +
> +        iommu_idx =3D imrc->attrs_to_index(iommu_mr, attrs);
> +        tcg_register_iommu_notifier(cpu, iommu_mr, iommu_idx);
> +        /* We need all the permissions, so pass IOMMU_NONE so the IOMMU
> +         * doesn't short-cut its translation table walk.
> +         */
> +        iotlb =3D imrc->translate(iommu_mr, addr, IOMMU_NONE, iommu_idx);
> +        addr =3D ((iotlb.translated_addr & ~iotlb.addr_mask)
> +                | (addr & iotlb.addr_mask));
> +        /* Update the caller's prot bits to remove permissions the IOMMU
> +         * is giving us a failure response for. If we get down to no
> +         * permissions left at all we can give up now.
> +         */
> +        if (!(iotlb.perm & IOMMU_RO)) {
> +            *prot &=3D ~(PAGE_READ | PAGE_EXEC);
> +        }
> +        if (!(iotlb.perm & IOMMU_WO)) {
> +            *prot &=3D ~PAGE_WRITE;
> +        }
> +
> +        if (!*prot) {
> +            goto translate_fail;
> +        }
> +
> +        d =3D flatview_to_dispatch(address_space_to_flatview(iotlb.targe=
t_as));
> +    }
>
>      assert(!memory_region_is_iommu(section->mr));
> +    *xlat =3D addr;
>      return section;
> +
> +translate_fail:
> +    return &d->map.sections[PHYS_SECTION_UNASSIGNED];
>  }
>  #endif
>
> @@ -820,6 +946,9 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>      if (qdev_get_vmsd(DEVICE(cpu)) =3D=3D NULL) {
>          vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
>      }
> +#ifndef CONFIG_USER_ONLY
> +    tcg_iommu_free_notifier_list(cpu);
> +#endif
>  }
>
>  Property cpu_common_props[] =3D {
> @@ -867,6 +996,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>      if (cc->vmsd !=3D NULL) {
>          vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
>      }
> +
> +    cpu->iommu_notifiers =3D g_array_new(false, true, sizeof(TCGIOMMUNot=
ifier));
>  #endif
>  }


--
Alex Benn=C3=A9e

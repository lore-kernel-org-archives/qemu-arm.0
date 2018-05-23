Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 44-v6sm42512310wrv.47.2018.05.23.02.08.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 May 2018 02:08:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1192D3E006A;
	Wed, 23 May 2018 10:08:48 +0100 (BST)
References: <20180521140402.23318-1-peter.maydell@linaro.org> <20180521140402.23318-16-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 15/27] iommu: Add IOMMU index argument to notifier APIs
In-reply-to: <20180521140402.23318-16-peter.maydell@linaro.org>
Date: Wed, 23 May 2018 10:08:48 +0100
Message-ID: <87603evivz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rC3Pm40EZEA6


Peter Maydell <peter.maydell@linaro.org> writes:

> Add support for multiple IOMMU indexes to the IOMMU notifier APIs.
> When initializing a notifier with iommu_notifier_init(), the caller
> must pass the IOMMU index that it is interested in. When a change
> happens, the IOMMU implementation must pass
> memory_region_notify_iommu() the IOMMU index that has changed and
> that notifiers must be called for.
>
> IOMMUs which support only a single index don't need to change.
> Callers which only really support working with IOMMUs with a single
> index can use the result of passing MEMTXATTRS_UNSPECIFIED to
> memory_region_iommu_attrs_to_index().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h    | 11 ++++++++++-
>  hw/i386/intel_iommu.c    |  4 ++--
>  hw/ppc/spapr_iommu.c     |  2 +-
>  hw/s390x/s390-pci-inst.c |  4 ++--
>  hw/vfio/common.c         |  6 +++++-
>  hw/virtio/vhost.c        |  7 ++++++-
>  memory.c                 |  8 +++++++-
>  7 files changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index f6226fb263..4e6b125add 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -71,6 +71,7 @@ struct IOMMUTLBEntry {
>      hwaddr           iova;
>      hwaddr           translated_addr;
>      hwaddr           addr_mask;  /* 0xfff =3D 4k translation */
> +    int              iommu_idx;
>      IOMMUAccessFlags perm;
>  };
>
> @@ -98,18 +99,21 @@ struct IOMMUNotifier {
>      /* Notify for address space range start <=3D addr <=3D end */
>      hwaddr start;
>      hwaddr end;
> +    int iommu_idx;

Its a minor thing but are we ever expecting iommu_idx to ever be
negative?

> --- a/memory.c
> +++ b/memory.c
> @@ -1802,6 +1802,9 @@ void memory_region_register_iommu_notifier(MemoryRe=
gion *mr,
>      iommu_mr =3D IOMMU_MEMORY_REGION(mr);
>      assert(n->notifier_flags !=3D IOMMU_NOTIFIER_NONE);
>      assert(n->start <=3D n->end);
> +    assert(n->iommu_idx >=3D 0 &&
> +           n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
> +

And then this would only have to assert we haven't exceeded the upper bound.

--
Alex Benn=C3=A9e

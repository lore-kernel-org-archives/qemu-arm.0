Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2841453njb;
        Mon, 8 Jul 2024 11:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWT/m/dOyzYydu5/NcFvYpo9mw8JjunLwnj19wL3iVpuI6kcAcmy5CMx6J4CJwxHHhVSXBx1qew5nfvJ3lFEmnmqOXjfy24
X-Received: by 2002:a05:6512:31d2:b0:52c:d819:517e with SMTP id 2adb3069b0e04-52eb99a0e9fmr132079e87.30.1720462399753;
        Mon, 08 Jul 2024 11:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720462399; cv=none;
        d=google.com; s=arc-20160816;
        b=aisvrWmRVLQMKtN8nuKRwEYpLUkCkNfImiiPs0ntasK2nQk1Jt2RdiVHKIbrtrThkH
         WykrOxcuv97slUbIINMpcr9GYZEXqln9en/M5tOiHJ9AnGCA7Mz2SvRrAV2INwdNBhIf
         ViqjUSZUzO27Bj/P00J3DpJ0ukbjM/1HwwM6eP5NcE6edLsz397dKCsAhFE+A276g4nB
         kJ2gFyRRSD7y2yw6w9SYdsF541W9QsapH84CLbVFX4vl33tM253sjmEZybiMVCzY7FRM
         4OZqGjcUGXBsxPxXc5/DBqLsBR9QnMDidH5wDXWnvv07Jp+dUP18dhPIAgCpAtuzRbkH
         Tneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ZkT/YGVvnFu0aqhTceriFu8xeAqJkoZY3A4qHdb144Y=;
        fh=tyXvbFYwSRH+Mjp+5TYpB7SbuaZSwIEBPyGl2txn+sc=;
        b=f25ID9OSP64SJ+Fd/YfLKQ7tvRaXTZb7L4UO85rVBJHxHQNE19E5Xyn7OaaPuf8Rvy
         Ng8XAyVLjVtEOx8qCmVUKf+Fq5ds8dhu9aBUKo+0cvZNT3Mf/r0RTQ3QRy5Nebbzq26o
         OtMMwInhEnomm1TBAD/8AOsO2Jlx0bXUfrJDbIfJkdv1SVAPBS6FIEQ+YJSmRIMP39mZ
         5PAn83X6OA4Qtya5wrL7P+IZ45tnDkZfUq21xqVRkTdGYbWkrKdArfo9dURFHcP77VM7
         SScX2h/HJmaGIk8557VwTX3BQba7CaNzotKqrLJpi0xDKL4oA74relFm2kqcszSPl7wa
         ntrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=m2WFYfrz;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-58f9fe4b15asor212189a12.2.2024.07.08.11.13.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Jul 2024 11:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=m2WFYfrz;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720462399; x=1721067199; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkT/YGVvnFu0aqhTceriFu8xeAqJkoZY3A4qHdb144Y=;
        b=m2WFYfrzvU4ZXbDiYKrgef96qtouR2N5/UmHpmqfdM/6f4/tryYgS76LJ7q6HaPawW
         +nDG7G0q8BOM9K4gVfZYp79huvyrZ2jtYYXVlF0NeUYNF8KRU5J3fhd7x3QR+vaVahgT
         VuRGi8OpD9KBhzYRsIp9Csrt52/2Wk2yHrKpQRPIW26NZYrOWX+KyE0hFuk2Nw4SrIT0
         PIRRLg1J0g0r9lwH/Qi9izLpEde5j9Aou1kp2lFFZ5f7XmRpyBNOtj/vykpBOPsrpMbZ
         WIWkgM/6pCBPXc49u1fYhXvtBBnwt3wCpNIX25TnthZFB9/ROwnInCQEe4q8pXUeEKtf
         fHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720462399; x=1721067199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkT/YGVvnFu0aqhTceriFu8xeAqJkoZY3A4qHdb144Y=;
        b=c+Urk0ffVbyyrJrjQc43km5pWQTAN6SyERkTOBLyI65H1gHlgznlZMngDs0JJ4AR9A
         vq995L4/VuqTym3VroOAfTqrB6tBjitARz1ox6uu/Xmq1n4FdSuG0V1IpdIBeYGCDFlV
         oNDLDGkoBW48o/tlELRykrETex1ICAdxfpRw90t08Hv/8myqSYY5rq+5/c9wH/6SPoqg
         6zxBkYIZ9K5/PUGak8y/M2WA0uGUETz1WbWmL97+8kmZW6/jl4IH8EKqGIFVqNo3oKVt
         GQkLXYtopdesMoS6dG2QCCBPtJFMI/3o6bME/HVL+HgNSCPfNIQIfCvlPr0ZvbsM2Rmc
         Ukmw==
X-Forwarded-Encrypted: i=1; AJvYcCVzwydbK/J98TYoIT4Ljn0LubZTnmQI9/5QReb5QUcV0wcs7QdTpI9F9uvPtdxH8uW0islpfUvpqWBAG9kFplb9f9vGXwBp
X-Gm-Message-State: AOJu0YytvkJodHOnYmJXNtvRQUsZlakYJ6cHW6kHby8a+LyvoKuZs/WQ
	R5/e4tqdVAPApDZtuzl9aeoQXbpHLGiFX/k2L2/tlI+PXKt8ZDUevVQObcvHRg==
X-Google-Smtp-Source: AGHT+IGqdfLYu/Bt5PLHZENZXhu1yrmWU0+pqUcPtwHrJ6CLS5jGcJ++sZF6tk3jLCMvum18oKeggA==
X-Received: by 2002:a50:8741:0:b0:57c:bb0d:5e48 with SMTP id 4fb4d7f45d1cf-594d1fe78c6mr14471a12.2.1720462398706;
        Mon, 08 Jul 2024 11:13:18 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde89198sm407121f8f.60.2024.07.08.11.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 11:13:18 -0700 (PDT)
Date: Mon, 8 Jul 2024 18:13:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 00/19] SMMUv3 nested translation support
Message-ID: <ZowsOZdaCZ5HREeB@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <85f20c7e-72f8-4784-9d81-8e6f2d394112@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85f20c7e-72f8-4784-9d81-8e6f2d394112@redhat.com>
X-TUID: Qx0oP3mToQm3

Hi Eric,

On Mon, Jul 08, 2024 at 07:30:34PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 7/1/24 13:02, Mostafa Saleh wrote:
> > Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> > but not nested instances.
> > This patch series adds support for nested translation in SMMUv3,
> > this is controlled by property “arm-smmuv3.stage=nested”, and
> > advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
> >
> > Main changes(architecture):
> > ============================
> > 1) CDs are considered IPA and translated with stage-2.
> > 2) TTBx and tables for stage-1 are considered IPA and translated
> >    with stage-2.
> > 3) Translate the IPA address with stage-2.
> 
> If you respin quickly you may have a chance to get this in 9.1 (as a
> reminder the soft freeze is on 2024-07-23). Is it your target?

Thanks for the heads up, I will prioritize this and I will try to post
v5 by this week.

Thanks,
Mostafa

> 
> Thanks
> 
> Eric
> >
> > TLBs:
> > ======
> > TLBs are the most tricky part.
> >
> > 1) General design
> >    Unified(Combined) design is used, where entries with ASID=-1 are
> >    IPAs(cached from stage-2 config)
> >
> >    TLBs are also modified to cache 2 permissions, a new permission added
> >    "parent_perm."
> >
> >    For non-nested configuration, perm == parent_perm and nothing
> >    changes. This is used to know which stage to use in case there is
> >    a permission fault from a TLB entry.
> >
> > 2) Caching in TLB
> >    Stage-1 and stage-2 are inserted in the TLB as is.
> >    For nested translation, both entries are combined into one TLB
> >    entry. The size (level and granule) are chosen from the smallest entries.
> >    That means that a stage-1 translation can be cached with sage-2
> >    granule in key, this is taken into account for lookup.
> >
> > 3) TLB Lookup
> >    TLB lookup already uses ASID in key, so it can distinguish between
> >    stage-1 and stage-2.
> >    And as mentioned above, the granule for stage-1 can be different,
> >    If stage-1 lookup failed, we try again with the stage-2 granule.
> >
> > 4) TLB invalidation
> >    - Address invalidation is split, for IOVA(CMD_TLBI_NH_VA
> >      /CMD_TLBI_NH_VAA) and IPA(CMD_TLBI_S2_IPA) based on ASID value
> >    - CMD_TLBI_NH_ASID/CMD_TLBI_NH_ALL: Consider VMID if stage-2 is
> >      supported, and invalidate stage-1 only by VMIDs
> >
> > As far as I understand, this is compliant with the ARM architecture:
> > - ARM ARM DDI 0487J.a: RLGSCG, RTVTYQ, RGNJPZ
> > - ARM IHI 0070F.b: 16.2 Caching
> >
> > An alternative approach would be to instantiate 2 TLBs, one per each
> > stage. I haven’t investigated that.
> >
> > Others
> > =======
> > - Advertise SMMUv3.2-S2FWB, it is NOP for QEMU as it doesn’t support
> >   attributes.
> >
> > - OAS: A typical setup with nesting is to share CPU stage-2 with the
> >   SMMU, and according to the user manual, SMMU OAS must match the
> >   system physical address.
> >
> >   This was discussed before in
> >   https://lore.kernel.org/all/20230226220650.1480786-11-smostafa@google.com/
> >   This series doesn’t implement that, but reworks OAS to make it easier
> >   to configure in the future.
> >
> > - For nested configuration, IOVA notifier only notifies for stage-1
> >   invalidations (as far as I understand this is the intended
> >   behaviour as it notifies for IOVA).
> >
> > - Stop ignoring VMID for stage-1 if stage-2 is also supported.
> >
> >
> > Future improvements:
> > =====================
> > 1) One small improvement, that I don’t think it’s worth the extra
> >    complexity, is in case of Stage-1 TLB miss for nested translation,
> >    we can do stage-1 walk and lookup for stage-2 TLBs, instead of
> >    doing the full walk.
> >
> > Testing
> > ========
> > 1) IOMMUFD + VFIO
> >    Kernel: https://lore.kernel.org/all/cover.1683688960.git.nicolinc@nvidia.com/
> >    VMM: https://qemu-devel.nongnu.narkive.com/o815DqpI/rfc-v5-0-8-arm-smmuv3-emulation-support
> >
> >    By assigning “virtio-net-pci,netdev=net0,disable-legacy=on,iommu_platform=on,ats=on”,
> >    to a guest VM (on top of QEMU guest) with VIFO and IOMMUFD.
> >
> > 2) Work in progress prototype I am hacking on for nesting on KVM
> >    (this is nowhere near complete, and misses many stuff but it
> >    doesn't require VMs/VFIO) also with virtio-net-pci and git
> >    cloning a bunch of stuff and also observing traces.
> >    https://android-kvm.googlesource.com/linux/+log/refs/heads/smostafa/android15-6.6-smmu-nesting-wip
> >
> > Overall I tested the following configurations
> > (S1 = 4k, S2 =4k):
> > - S1 level = 1 and S2 level = 1
> > - S1 level = 1 and S2 level = 2
> > - S1 level = 1 and S2 level = 3
> > - S1 level = 2 and S2 level = 1
> > - S1 level = 2 and S2 level = 2
> > - S1 level = 2 and S2 level = 3
> > - S1 level = 3 and S2 level = 2
> > - S1 level = 3 and S2 level = 3
> > Also did some testing with
> > (S1 = 16k, S2= 4k)
> > (S1 = 4K, S2= 16k)
> >
> >
> > hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved
> >
> > The first 3 patches are fixes.
> >
> > Changes in v4:
> > v3: https://lore.kernel.org/qemu-devel/20240429032403.74910-1-smostafa@google.com/
> > - Collected Eric and Alex Rbs
> > - Rebased on master
> > - Dropped RFC tag
> > - Dropped last 2 patches about oas changes to avoid blocking this series
> >   and I will post them after as RFC
> > - Split patch 7, and introduce CACHED_ENTRY_TO_ADDR in a separate patch
> > - Reorder patch 8 and 9 (combine tlb and tlb lookup)
> > - Split patch 12, and introduce smmu_iotlb_inv_asid_vmid in a separate patch
> > - Split patch 14, to have fault changes in a separate patch
> > - Update commit messages and include Fixes sha
> > - Minor updates, renames and a lot of comments based on review
> >
> > Changes in v3
> > v2: https://lore.kernel.org/qemu-devel/20240408140818.3799590-1-smostafa@google.com/
> > - Collected Eric Rbs.
> > - Rebased on master.
> > - Fix an existing bug in class encoding.
> > - Fix an existing bug in S2 events missing IPA.
> > - Fix nesting event population (missing class and wrong events)
> > - Remove CALL_FUNC_CFG_S2.
> > - Rework TLB combination logic to cache the largest possible entries.
> > - Refactor nested translation code to be more clear.
> > - Split patch 05 to 4 patches.
> > - Convert asid/vmid in trace events to int also.
> > - Remove some extra traces as it was not needed.
> > - Improve commit messages.
> >
> > Changes in v2:
> > v1: https://lore.kernel.org/qemu-devel/20240325101442.1306300-1-smostafa@google.com/
> > - Collected Eric Rbs
> > - Rework TLB to rely on VMID/ASID instead of an extra key.
> > - Fixed TLB issue with large stage-1 reported by Julian.
> > - Cap the OAS to 48 bits as PTW doesn’t support 52 bits.
> > - Fix ASID/VMID representation in some contexts as 16 bits while
> >   they can be -1
> > - Increase visibility in trace points
> >
> >
> > Mostafa Saleh (19):
> >   hw/arm/smmu-common: Add missing size check for stage-1
> >   hw/arm/smmu: Fix IPA for stage-2 events
> >   hw/arm/smmuv3: Fix encoding of CLASS in events
> >   hw/arm/smmu: Use enum for SMMU stage
> >   hw/arm/smmu: Split smmuv3_translate()
> >   hw/arm/smmu: Consolidate ASID and VMID types
> >   hw/arm/smmu: Introduce CACHED_ENTRY_TO_ADDR
> >   hw/arm/smmuv3: Translate CD and TT using stage-2 table
> >   hw/arm/smmu-common: Rework TLB lookup for nesting
> >   hw/arm/smmu-common: Add support for nested TLB
> >   hw/arm/smmu-common: Support nested translation
> >   hw/arm/smmu: Support nesting in smmuv3_range_inval()
> >   hw/arm/smmu: Introduce smmu_iotlb_inv_asid_vmid
> >   hw/arm/smmu: Support nesting in the rest of commands
> >   hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
> >   hw/arm/smmuv3: Handle translation faults according to SMMUPTWEventInfo
> >   hw/arm/smmuv3: Support and advertise nesting
> >   hw/arm/smmuv3: Advertise S2FWB
> >   hw/arm/smmu: Refactor SMMU OAS
> >
> >  hw/arm/smmu-common.c         | 320 +++++++++++++++++++++++---
> >  hw/arm/smmuv3-internal.h     |  19 +-
> >  hw/arm/smmuv3.c              | 432 ++++++++++++++++++++++-------------
> >  hw/arm/trace-events          |  26 ++-
> >  include/hw/arm/smmu-common.h |  43 +++-
> >  5 files changed, 617 insertions(+), 223 deletions(-)
> >
> 

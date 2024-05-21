Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1968565ejb;
        Tue, 21 May 2024 02:47:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8AY+ztm815NUjT7w5PzqLW/yhifRM/wyPskt1eataosKrcx4zE4pVO54rZk4wL6Ik1+5RDRyXsml1LobGweXo/XRGaSmg
X-Google-Smtp-Source: AGHT+IGL1xgJlMDUIQKqM/F6Vbr+0JseG75wuWrgW3rAu9Z5PZfH+1dRS24DAd3sckm3MN9pzd2q
X-Received: by 2002:a05:622a:148:b0:43e:3f8f:a909 with SMTP id d75a77b69052e-43e3f8facf0mr173725641cf.30.1716284846590;
        Tue, 21 May 2024 02:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716284846; cv=none;
        d=google.com; s=arc-20160816;
        b=c8TTSrTwvzliRnvk9rhC6FDreRiR0+UM0WtsJNyqOOC3Bm3xfeEG9kzz+CnsjA9D1C
         qnE7XWfp+7p6ZzUPQAxoFiWMJKo+wbEu1u+cnhj/DqgLnLrMG3fh1a6JLllLZuTKzB3+
         hJ8M7v1SdVTHH5RjTD+CW4WdFdAWaSEHtB60kcm8DVBIvisAF64dZQh4LiNXZ8r8ecQP
         gmqY5+C+bV1zjoYRZS8R1l+vYWeKE56hlkAuI4uV5JQOBMKdeTdIJiHh94SZDowrlXVY
         zg91r4NRdbsvjg2azscM28zSzc6nPkSGBwKmQzWscNlcNqjQpCW4C3G/Bi1u9Q95vhmK
         9OSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HQiYc5TNr7Xv5NJxsOqNGLmBnAfTvbdg+Jiy9BpALIQ=;
        fh=LHfPcm0wRtz0EDiHX067QzTWp4xy23iqeESnT0dYkOM=;
        b=TF0nt0NXiOrfVaDwS6u+epfslUBtEhgV+M6lg6A2wEDM/vE0adfPcQ8mAbvrJYfeyB
         1Kz0t3FWikPknOCzBH5rqS3UsJS862CR+FOWrpRzl1BRDyvK73X101CCXi5z8Jkch0at
         hMWD8sxwz8sqz02KnvsvKopmSxfrSixP/G6NylSI7DvDuT8oregy9asYrSGc9/8U3d+Z
         rEQTJXafv8y/enf1eR03LkQ35FfZlsMfBcOkId2v+0I/i/bR4jVMU4ce4X5KwbZ4wgbF
         evGI38b40Ft1Mrdo5LdKK0OwtKctEPyPdImGSVwFDKQRzcxwIJbAWDPh950U4Lz/9gEl
         OJXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiFtbRvt;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-43e350e60bbsi38687061cf.618.2024.05.21.02.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QiFtbRvt;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716284846;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HQiYc5TNr7Xv5NJxsOqNGLmBnAfTvbdg+Jiy9BpALIQ=;
	b=QiFtbRvtWwoChi3n/wID52Pe/7fy7n2D9OqkyYej5QZo63fQP0g9cE5BCr3pfqnEGyJCpl
	M5qjeYa8V8QNHNTwAETHZGmC02DPJkuUVpKhNNjgIcYH+7rzIRZQZiISpLYf7PTV5aPQOi
	7MFkjPmudajLwoGZ2RuWJ0qAKv7gFTs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-6VOYezbgOwydhi7EuiYQWg-1; Tue, 21 May 2024 05:47:25 -0400
X-MC-Unique: 6VOYezbgOwydhi7EuiYQWg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-574f933ad35so4722081a12.0
        for <alex.bennee@linaro.org>; Tue, 21 May 2024 02:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284844; x=1716889644;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQiYc5TNr7Xv5NJxsOqNGLmBnAfTvbdg+Jiy9BpALIQ=;
        b=bYDwBhXKveTYJvIMVNerdOUr2MkUOGDF9PKrVGGQdwyDxDQiYJ7EPGlQsZ7PQ/FhOP
         AF7x59a0y1Tn9iGmFUexzPQk54O54JlG03u3JQqzgWLGLSAJQTbnq9E8iaYEXHDIKhVR
         JoDzRxGzz/PSwGIdgs6thMHot1Fw19LKnw/PYspLqtNmgj1XK708UmcxJEfueHrW4r/8
         iNVQoAOgXb1xtroOmJjIZ41ccj4XuGRel7u4jwhdHnw8C6NuqEY145EIG0M57vbNte+O
         25aDW9nbLN/iArNEofXpf+wJ9CgMJqBlNx48z+Zt8WPCf6nih/+Dtj/QHBcsmT12D3b+
         uRkg==
X-Forwarded-Encrypted: i=1; AJvYcCUqUjfJEueZ+Djt0nMoWxlvxAEz6J2fCTkTCVRPAoVWN4koLFptPqg2TOlZ+zovSWGAZiinmD296c8h0Eo+5x4dGZimW01K
X-Gm-Message-State: AOJu0YxEr/WO7OOYtHqDBAxDjv1MgzS4+2icJPJNYtbcUNxAem1Eoh6p
	f4Bv39JmuiQjKXQWgKctKkIooNzKyOPAT8Qr7jlIgIPo1m7MFjP7I63fVVwYnbwvMpgmUbaFGBW
	7r3aM0iSkepZRHi8TB350AnKiGgRoj3vZUUEaCHuGJq1dTBuUAsK/GQ==
X-Received: by 2002:a05:6402:1746:b0:573:50a6:d3b0 with SMTP id 4fb4d7f45d1cf-57350a6d402mr20540117a12.3.1716284843758;
        Tue, 21 May 2024 02:47:23 -0700 (PDT)
X-Received: by 2002:a05:6402:1746:b0:573:50a6:d3b0 with SMTP id 4fb4d7f45d1cf-57350a6d402mr20540106a12.3.1716284843231;
        Tue, 21 May 2024 02:47:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733beb89e7sm16808087a12.21.2024.05.21.02.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 02:47:22 -0700 (PDT)
Message-ID: <7a30b326-df0e-4907-8ca0-6289665c4708@redhat.com>
Date: Tue, 21 May 2024 11:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 00/18] SMMUv3 nested translation support
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gOd0MTmzOAZS

Hi Mostafa,

On 4/29/24 05:23, Mostafa Saleh wrote:
> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> but not nested instances.
> This patch series adds support for nested translation in SMMUv3,
> this is controlled by property “arm-smmuv3.stage=nested”, and
> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
>
> Main changes(architecture):
> ============================
> 1) CDs are considered IPA and translated with stage-2.
> 2) TTBx and tables for stage-1 are considered IPA and translated
>    with stage-2.
> 3) Translate the IPA address with stage-2.
>
> TLBs:
> ======
> TLBs are the most tricky part.
>
> 1) General design
>    Unified(Combined) design is used, where entries with ASID=-1 are
>    IPAs(cached from stage-2 config)
>
>    TLBs are also modified to cache 2 permissions, a new permission added
>    "parent_perm."
>
>    For non-nested configuration, perm == parent_perm and nothing
>    changes. This is used to know which stage to use in case there is
>    a permission fault from a TLB entry.
>
> 2) Caching in TLB
>    Stage-1 and stage-2 are inserted in the TLB as is.
>    For nested translation, both entries are combined into one TLB
>    entry. The size (level and granule) are chosen from the smallest entries.
>    That means that a stage-1 translation can be cached with sage-2
>    granule in key, this is take into account lookup.
>
> 3) TLB Lookup
>    TLB lookup already uses ASID in key, so it can distinguish between
>    stage-1 and stage-2.
>    And as mentioned above, the granule for stage-1 can be different,
>    If stage-1 lookup failed, we try again with the stage-2 granule.
>
> 4) TLB invalidation
>    - Address invalidation is split, for IOVA(CMD_TLBI_NH_VA
>      /CMD_TLBI_NH_VAA) and IPA(CMD_TLBI_S2_IPA) based on ASID value
>    - CMD_TLBI_NH_ASID/CMD_TLBI_NH_ALL: Consider VMID if stage-2 is
>      supported, and invalidate stage-1 only by VMIDs
>
> As far as I understand, this is compliant with the ARM architecture:
> - ARM ARM DDI 0487J.a: RLGSCG, RTVTYQ, RGNJPZ
> - ARM IHI 0070F.b: 16.2 Caching
>
> An alternative approach would be to instantiate 2 TLBs, one per each
> stage. I haven’t investigated that.
>
> Others
> =======
> - Advertise SMMUv3.2-S2FWB, it is NOP for QEMU as it doesn’t support
>   attributes.
>
> - OAS: A typical setup with nesting is to share CPU stage-2 with the
>   SMMU, and according to the user manual, SMMU OAS must match the
>   system physical address.
>
>   This was discussed before in
>   https://lore.kernel.org/all/20230226220650.1480786-11-smostafa@google.com/
>   The implementation here, follows the discussion, where migration is
>   added and oas is set up from the board (virt). However, the OAS is
>   chosen based on the CPU PARANGE as there is no fixed one.
>
> - For nested configuration, IOVA notifier only notifies for stage-1
>   invalidations (as far as I understand this is the intended
>   behaviour as it notifies for IOVA)
>
> - Stop ignoring VMID for stage-1 if stage-2 is also supported.

I completed the review pass on my end. I strongly encourage you to move
the series into a non RFC series to attract more reviewers. Migration
needs to be fixed and compat handling as well I think but overall the
nested support looks mostly OK for me. Some stuff are a bit hacky (like
config local patching to force S2 only) as I mentionned in my comments
but let see if other reviewers find some more elegant ways to handle things

Eric
>
>
> Future improvements:
> =====================
> 1) One small improvement, that I don’t think it’s worth the extra
>    complexity, is in case of Stage-1 TLB miss for nested translation,
>    we can do stage-1 walk and lookup for stage-2 TLBs, instead of
>    doing the full walk.
>
> Testing
> ========
> 1) IOMMUFD + VFIO
>    Kernel: https://lore.kernel.org/all/cover.1683688960.git.nicolinc@nvidia.com/
>    VMM: https://qemu-devel.nongnu.narkive.com/o815DqpI/rfc-v5-0-8-arm-smmuv3-emulation-support
>
>    By assigning “virtio-net-pci,netdev=net0,disable-legacy=on,iommu_platform=on,ats=on”,
>    to a guest VM (on top of QEMU guest) with VIFO and IOMMUFD.
>
> 2) Work in progress prototype I am hacking on for nesting on KVM
>    (this is nowhere near complete, and misses many stuff but it
>    doesn't require VMs/VFIO) also with virtio-net-pci and git
>    cloning a bunch of stuff and also observing traces.
>    https://android-kvm.googlesource.com/linux/+log/refs/heads/smostafa/android15-6.6-smmu-nesting-wip
>
> I also modified the Linux driver to test with mixed granules/levels.
>
> hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved
>
> The first 3 patches are fixes.
>
> Changes in v3
> v2: https://lore.kernel.org/qemu-devel/20240408140818.3799590-1-smostafa@google.com/
> - Collected Eric Rbs.
> - Rebased on master.
> - Fix an existing bug in class encoding.
> - Fix an existing bug in S2 events missing IPA.
> - Fix nesting event population (missing class and wrong events)
> - Remove CALL_FUNC_CFG_S2.
> - Rework TLB combination logic to cache the largest possible entries.
> - Refactor nested translation code to be more clear.
> - Split patch 05 to 4 patches.
> - Convert asid/vmid in trace events to int also.
> - Remove some extra traces as it was not needed.
> - Improve commit messages.
>
> Changes in v2:
> v1: https://lore.kernel.org/qemu-devel/20240325101442.1306300-1-smostafa@google.com/
> - Collected Eric Rbs
> - Rework TLB to rely on VMID/ASID instead of an extra key.
> - Fixed TLB issue with large stage-1 reported by Julian.
> - Cap the OAS to 48 bits as PTW doesn’t support 52 bits.
> - Fix ASID/VMID representation in some contexts as 16 bits while
>   they can be -1
> - Increase visibility in trace points
>
> Mostafa Saleh (18):
>   hw/arm/smmu-common: Add missing size check for stage-1
>   hw/arm/smmu: Fix IPA for stage-2 events
>   hw/arm/smmuv3: Fix encoding of CLASS in events
>   hw/arm/smmu: Use enum for SMMU stage
>   hw/arm/smmu: Split smmuv3_translate()
>   hw/arm/smmu: Consolidate ASID and VMID types
>   hw/arm/smmuv3: Translate CD and TT using stage-2 table
>   hw/arm/smmu-common: Add support for nested TLB
>   hw/arm/smmu-common: Rework TLB lookup for nesting
>   hw/arm/smmu-common: Support nested translation
>   hw/arm/smmu: Support nesting in smmuv3_range_inval()
>   hw/arm/smmu: Support nesting in the rest of commands
>   hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
>   hw/arm/smmuv3: Support and advertise nesting
>   hw/arm/smmuv3: Advertise S2FWB
>   hw/arm/smmu: Refactor SMMU OAS
>   hw/arm/smmuv3: Add property for OAS
>   hw/arm/virt: Set SMMU OAS based on CPU PARANGE
>
>  hw/arm/smmu-common.c         | 298 ++++++++++++++++++++---
>  hw/arm/smmuv3-internal.h     |  22 +-
>  hw/arm/smmuv3.c              | 441 +++++++++++++++++++++++------------
>  hw/arm/trace-events          |  26 ++-
>  hw/arm/virt.c                |  14 +-
>  include/hw/arm/smmu-common.h |  43 +++-
>  include/hw/arm/smmuv3.h      |   1 +
>  target/arm/cpu.h             |   2 +
>  target/arm/cpu64.c           |   5 +
>  9 files changed, 625 insertions(+), 227 deletions(-)
>

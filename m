Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2262213ejd;
        Fri, 19 Apr 2024 02:22:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/ttXMU2p/wv4DSK5/1RMKpWY0icY45lQbNScPU4bx/eXt9b+1cOgmGsaXvpfXKO8LZ04C/6uYdSTFienuWdZySBOhdEhY
X-Received: by 2002:a05:600c:3baa:b0:416:88f9:f5ea with SMTP id n42-20020a05600c3baa00b0041688f9f5eamr1157314wms.34.1713518577859;
        Fri, 19 Apr 2024 02:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713518577; cv=none;
        d=google.com; s=arc-20160816;
        b=Hrb7GqnfYjWo7c8taBo26O0atROlFXMCcfhrvRdIt7qco/6J0Aa3ZFW65ctwnBeJyD
         oesrwOrjPvBNHGMsCvRjMTUgts90Dofb8Kgm7ulR+fskhlhsR4BBZVBOS7+fZP+PH5Fl
         S+O1r0c/idW3uwDdOZrOEWpIQAyLXuDsLSulqVHVLQ4sENltn7xYA+6BqEguRIQdP7jC
         lR8ze62dr/sS1Yb3qjPK9dTtWTaH/d26tgyEDhhBbxpihfMOnCdBqmPpwCBXDmxOgtmP
         MxYz7IMES01vsph8huiurLK8W32626t4sj94kAXB9d8MoAHuXpQHKfgnzcvVMKo81uem
         Nvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jAY8+zdO/dWbnJpuH+j0doViskul91vieAwvwkWCJ0Q=;
        fh=dNvhclZelJiIVlYP9nUoMe9soAOL2tWOJhyLrZacMfo=;
        b=ANo048hqM3UIrHYUI0t1jT93cnVZBKsb46Mehd0IWP+ko3BVvG020q7mw8Qbi5f//K
         jfy4+7dCxf+a/tRZdJqMFz3F+9KPIvo5Kd+sh4NCforEowueWIaE6Gt+I2Bmk8qp835z
         czIZLzV2LBtp2RWd1siihDXZDwsevjeZnWVqiBfESeLcKfawfAN3rnb0IdV72ClwoHRD
         gUPPzzsFeyMnSft2GUzciXKk8ZCs8QRG2BmR75ugwTFpia9QCkLGUY1aLJQ39fVLEzMk
         9bZTiUaWRqsUNjNDcl46Z2PztcY8V9R5ndzhIAeDuG7862etLB5VRwKk3O/fh1BW2VPL
         7W/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zRQoHBWh;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k2-20020a05600c1c8200b004187c484a37sor360606wms.6.2024.04.19.02.22.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 02:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zRQoHBWh;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713518577; x=1714123377; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jAY8+zdO/dWbnJpuH+j0doViskul91vieAwvwkWCJ0Q=;
        b=zRQoHBWhYuHesuXJGuDOCuJ6pRZqlauHBBHBg4wsNmVhRYKK61QCNnS017kBZCj/9H
         VQdaCUAR7Z61tL3IpndaLBTKqwdTvmv0+gUdBFmHQYy1jL0JY4dmDFRATcNpCzxaDQkw
         qAjKOCvZlz5MJTvLG2u5zv1IkPoyfw/F6Vvzj9X9PF14gRKHSYfXAdqO4K9auYkdMd2N
         HLf940xC+rnGyxOor6iJ7PDdYMPg1wrZF4/YGB8kX3RlvfLy4i84rgwDjo0Cplv6kIbe
         XBXcLevHvYRQsQcXRiQ4xaoEwg6wbpBM0ZTgVs5Xcx6IEboQmq0UJ10hyiWQaTUTlfOb
         JHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518577; x=1714123377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAY8+zdO/dWbnJpuH+j0doViskul91vieAwvwkWCJ0Q=;
        b=tLeIEMlEUqgsoqo5A2rmlUH01c3f+z2dM5z+ZcLMj0joeTwSgA7zhtHVHdRlD74yFq
         tH00a0T0GrkApEvyXBP+c7lA7qvud3NPYscOzt/J0gWv+myCF+XyoVmTQk3NpsZl4N+f
         E251Mz4OtHcY2Enz4Br/y2/9KwlB4akzmiWnGbh14Mnq2TTnnvYlMQtZkBgggVuaRLqV
         WcruHYzRCF/qdyEzginfCl/hJBsgMDxKkzJd2RnUpeOLsZwLduiRzgpO92rw98943SJL
         IFIIoo46dzpNFAOdYdBvtzn+5UyaMPWD44jrJPnuRNE/eF/pQ2Prtb0wW+Q05sq1dS8k
         FEAw==
X-Forwarded-Encrypted: i=1; AJvYcCUapJR4jNlWlCrvW5PWyphPF8IQr5+9PG21hEe74IA/wqGygXzYlMqUn+krHrUIifnpfXI8Fxsp5Hq/+6MODpSmkV3VzTq3
X-Gm-Message-State: AOJu0YyqP2Qq6jKDdLWGFJl3bITc8NQSgwcebUs5ghy+2a3JOUnMCkud
	lESyafeL0qccGe8mGgK20f/IcCOr5FeipACOhAKZEX8C/mnUsWNQb2pxuj2xnwbmqU8OJd9OL+n
	DiA==
X-Google-Smtp-Source: AGHT+IGTnGHhEqRdxM52tb0h3a4Z3c6lN4WB+G/EfnpkDpAcRuZkSA5ftoDpDuLa0DxRanL1WZOTfQ==
X-Received: by 2002:a05:600c:1d89:b0:418:fd58:631c with SMTP id p9-20020a05600c1d8900b00418fd58631cmr152140wms.2.1713518577260;
        Fri, 19 Apr 2024 02:22:57 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c501100b00418f1d77098sm4101913wmr.25.2024.04.19.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:22:56 -0700 (PDT)
Date: Fri, 19 Apr 2024 09:22:52 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [RFC PATCH v2 00/13] SMMUv3 nested translation support
Message-ID: <ZiI37PoK3D8aeWxu@google.com>
References: <20240408140818.3799590-1-smostafa@google.com>
 <14a6fbf1-4f05-42a7-a59b-7195e95aed6f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14a6fbf1-4f05-42a7-a59b-7195e95aed6f@redhat.com>
X-TUID: rFMzkZ5UnuqR

Hi Eric,

On Thu, Apr 18, 2024 at 08:11:06PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 4/8/24 16:08, Mostafa Saleh wrote:
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
> >    granule in key, this is take into account lookup.
> is that a correct understanding that with the current implementation, in
> nested mode, you end up with combined S1 + S2 entries (IOVA -> PA) and
> S2 entries (IPA -> PA)?
Yes, that’s correct.

> Out of cusiosity, how did you end up with that choice? Have you made
> some perf assessment compared to separate S1 and S2 entries? I guess it
> is a complex topic and choice.
> 

I didn’t do any perf, but from my simplistic understanding, combined
TLBs should be faster as they use only one look up for full translation,
also I guess having a single TLB would be better for HW area.
(However my knowledge in this “area” is almost null)
Although in SW, we don’t have tough memory constraints and having more
(or separate) TLBs isn’t a problem.

While implementing this, at some point I thought it’s getting too
complicated and a separate one might have been better, but the
grass is always greener on the other side, and I believe it would
also have its challenges.

One other thing I like about combined TLBs (which I am not sure is
important for qemu) is that it is more relaxed which means it would
catch more SW bugs. For example if the SW only changes an IPA and
only invalidates by IPA, it would have issues with combined TLBs.

I am open to try other designs if you have something else in mind.

Thanks,
Mostafa


> Thanks
> 
> Eric
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
> >   The implementation here, follows the discussion, where migration is
> >   added and oas is set up from the board (virt). However, the OAS is
> >   chosen based on the CPU PARANGE as there is no fixed one.
> >
> > - For nested configuration, IOVA notifier only notifies for stage-1
> >   invalidations (as far as I understand this is the intended
> >   behaviour as it notifies for IOVA)
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
> > 2) Patch 0006 (hw/arm/smmuv3: Translate CD and TT using stage-2 table)
> >    introduces a macro to use functions that rely on cfg for stage-2,
> >    I don’t like it. However, I didn’t find a simple way around it,
> >    either we change many functions to have a separate stage argument,
> >    or add another arg in config, which is probably more code.
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
> > I also modified the Linux driver to test with mixed granules/levels.
> >
> > hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved
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
> > Mostafa Saleh (13):
> >   hw/arm/smmu: Use enum for SMMU stage
> >   hw/arm/smmu: Split smmuv3_translate()
> >   hw/arm/smmu: Consolidate ASID and VMID types
> >   hw/arm/smmuv3: Translate CD and TT using stage-2 table
> >   hw/arm/smmu-common: Support nested translation
> >   hw/arm/smmu: Support nesting in smmuv3_range_inval()
> >   hw/arm/smmu: Support nesting in the rest of commands
> >   hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
> >   hw/arm/smmuv3: Support and advertise nesting
> >   hw/arm/smmuv3: Advertise S2FWB
> >   hw/arm/smmu: Refactor SMMU OAS
> >   hw/arm/smmuv3: Add property for OAS
> >   hw/arm/virt: Set SMMU OAS based on CPU PARANGE
> >
> >  hw/arm/smmu-common.c         | 306 +++++++++++++++++++++----
> >  hw/arm/smmuv3-internal.h     |  16 +-
> >  hw/arm/smmuv3.c              | 418 ++++++++++++++++++++++-------------
> >  hw/arm/trace-events          |  18 +-
> >  hw/arm/virt.c                |  14 +-
> >  include/hw/arm/smmu-common.h |  57 ++++-
> >  include/hw/arm/smmuv3.h      |   1 +
> >  target/arm/cpu.h             |   2 +
> >  target/arm/cpu64.c           |   5 +
> >  9 files changed, 608 insertions(+), 229 deletions(-)
> >
> 

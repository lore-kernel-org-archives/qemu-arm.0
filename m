Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4493113ejv;
        Wed, 3 Apr 2024 03:39:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsSUqIwI7SvB8kQXrTaui+C9w4vjTB2o8ESapYOVqS+R1uZ8CTYThG+GAv6ZivCfgYIiXKBBvlQx3RFbXTGcMh4yEBQQUM
X-Received: by 2002:a05:600c:35c5:b0:413:f4d0:c233 with SMTP id r5-20020a05600c35c500b00413f4d0c233mr9654813wmq.35.1712140750290;
        Wed, 03 Apr 2024 03:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712140750; cv=none;
        d=google.com; s=arc-20160816;
        b=vV/KkHNlim2Qn4mQgE24yXzPwaWJ7X5Qxye325y9XIliNua4FAuHvJhi9kMMAuTOBC
         Jd8KNhEpsZZBL8OuVC0vrql4vYa2lAiTBDnStoT0IsC25Lru+ZgYPFjUJoeW/c84QBV1
         A13PyAJhomH53jT/W1w0j1YsL+RfEO15PA+8afuqa1dGRUUhexGZWt8L4Y3hK/apulY0
         W5YRbozUgaFX25Wp1uuATtkir9+b1Ydqx+UV3SUEv0vUTBhOoNq5C+nNePjIjzkXMLYU
         /OCM9LYRg8twANhq8oa2kLBKF2zCYL7JqEj9TpxQozMYEZbQeAidp72FaTdaR5s/1KGY
         iCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=L5uRbfpn8rAyhg4/JlDV2ZnHGFfvZpSBfsFBPdWj1Is=;
        fh=/v08RNh5+BmWLa7dEE5WcQ8oNPmDnIrA2jmUPWFhsCk=;
        b=OPdKQGucrUHV8mW5qr6/3pUCePy1Ak1cLKFToEe6SWdSt4hghCxuQ6pN8GR6AYVW2y
         OuHCjXRDSB0yz6Y/u+buNqQM075F8ydRxYD9BN8A0h45WFmhve66ptNC9p8sHxSoY31U
         SQRg0VctiFxqAb/CIqYPilRUo6F5Ae2XrcROfhTELZ19Ag9GI8FzjKCIM6N+8+81vl8o
         4nONAlmuvC9//DbJt8sUzTwWxWsSZYkU6EBaFPH4fs2qvbTIGEn0TmGjWvlKWJn/GQTd
         hKPXxFCyABHVuIGzFiKINrwvrclTRQai1SmWEZbFZhS12YiL2YEFSdQnEr5QUoQR3tA1
         JB1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=XT4pk45s;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o3-20020a05600c4fc300b0041547ffa750sor72286wmq.4.2024.04.03.03.39.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Apr 2024 03:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=XT4pk45s;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712140750; x=1712745550; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L5uRbfpn8rAyhg4/JlDV2ZnHGFfvZpSBfsFBPdWj1Is=;
        b=XT4pk45sd+wfE16oVWjla8UbmLRol8qx5Sw4pw/FL4gD5E31dkBcyIBZPnrOJ7tQzA
         E9s1I8up0fhkKj7H5aOe/7xTwVb01X6kEgtMbNpkdl2OPlMwQwuCMHkWcsvAohC4v0ML
         AB+PWmBuTCzQV1zQEIAxAy2y+aqK3p+0jkxCneViLgJk4AQNDum3elbE3bTLCKAqUA06
         nkZpEXFoOQjERWYeKxeTrA0uP+RLqD9uyyvI1d97qaJA71u41X+xLq4VAsbcVBvGHVRN
         GuCMSmeTkMdyqFd6PVipj4bBl8Bz1BfDD74DR03cm287cvjXyHPOyuMTivqom20Drux4
         WarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712140750; x=1712745550;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5uRbfpn8rAyhg4/JlDV2ZnHGFfvZpSBfsFBPdWj1Is=;
        b=RseZHv0t0bKVC5xS+lyF5u0VNGk1m1pxLhMf48UCrd96AGrP0gMQeMFKPwXZ1+WRZf
         BLvvPmnmTXusqi0IRoSMiUFBLFrMSnJ5ipw4RNNEszWpIDoqnGcLCITteGLd9JSNvNZF
         IrfgA9Z7K4GVeLSqBkAhlV47Vmtb67u4AQYtPRJZlpTroJqhFmUD8wbDRUNGMG3nZ1Xq
         FE/IxoY06QjvyD0a5cLweUk5zJMGYbZwjctepJBp179BcPnECCPy0afYgFt5RAgTaDJk
         cdeCYdrfapOPSP82/2W3kcw2SlLGVc3A9ZK1ovoCwVX9fYwXQV4mO2OUFo/RgATi29z2
         Iadg==
X-Forwarded-Encrypted: i=1; AJvYcCV+mULAJPn03nBBR2gng3DT/MDbU3BeN59xQ9la8vG506u7/AQm/n7EIKsJlgU9tMyMq8h1NlZlKBTA3tcaxHstC8Q+sKTr
X-Gm-Message-State: AOJu0Yyn1AX506N4WYXMBcOHRduEHkJuK/LrE2jwoBVfsjO+a+MD2eZD
	X5H04AN+HFV7RL4D07zAR980xW0ZoZNEB0QU9zq3pErwpjeKGegBiRkD+rqiDA==
X-Google-Smtp-Source: AGHT+IFWa18vylUEOkR9TfcCo5jVlnZR6BcGKxxSu6MazmSehuaRmUlF15MEdcJtsSOT3wVShkwiSA==
X-Received: by 2002:a05:600c:1c12:b0:415:615c:b98b with SMTP id j18-20020a05600c1c1200b00415615cb98bmr118907wms.5.1712140749689;
        Wed, 03 Apr 2024 03:39:09 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id v13-20020a5d4b0d000000b0034356c434d0sm1913522wrq.117.2024.04.03.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 03:39:09 -0700 (PDT)
Date: Wed, 3 Apr 2024 10:39:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, jean-philippe@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, julien@xen.org
Subject: Re: [RFC PATCH 00/12] SMMUv3 nested translation support
Message-ID: <Zg0xyXBXGa8_Kx6k@google.com>
References: <20240325101442.1306300-1-smostafa@google.com>
 <ZgyGfMz7IktmwtP/@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgyGfMz7IktmwtP/@Asurada-Nvidia>
X-TUID: ++HFhXl3+9jp

Hi Nicolin,

On Tue, Apr 02, 2024 at 03:28:12PM -0700, Nicolin Chen wrote:
> Hi Mostafa,
> 
> On Mon, Mar 25, 2024 at 10:13:56AM +0000, Mostafa Saleh wrote:
> > 
> > Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
> > but not nested instances.
> > This patch series adds support for nested translation in SMMUv3,
> > this is controlled by property “arm-smmuv3.stage=nested”, and
> > advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
> 
> IIUIC, with this series, vSMMU will support a virtualized 2-stage
> translation in a guest VM, right? I wonder how it would interact

I always get confused with terminologies when dealing with QEMU;
as the host can mean the actual host (which is x86_64 in my case)
and the guest would aarch64 Linux fully emulated by QEMU, and the
emulated guest can be considered a host and launch it’s guests wit
KVM for example. This also will be more fun with guests supporting
nested virtualization :)

For simplicity, I will consider:
- HOST: the fully emulated QEMU guest (aarch64) running on my machine.
- GUEST: Any guest launched by the HOST (through KVM for example)
- QEMU: Is the instance of QEMU emulating the HOST (built for x86)
- QEMU-VMM: Is the instance of QEMU running on the HOST (built for
  aarch64) which launches VMs(GUESTs).

With that, AFAIU, vSMMU is the SMMUv3 emulation used for GUESTs with
QEMU-VMM, where it has hooks in CMDQ and then the QEMU-VMM will issue
IOCTLs to the HOST to do the actual SMMU work (through iommufd or IIRC
there was previous patches from Eric that does that also), also the
vSMMU is out of tree AFAICT.

In that case, this work is orthogonal to that, the nested SMMUv3
emulation in this series mainly targets QEMU which is advertised
to the HOST, which then allows it to use iommufd with GUESts.

In theory, that work can be extended to QEMU-VMM with vSMMU, but
I guess that would be a lot of work as the VMM needs to collapse
both stages as the kernel provides only one address space for the VMM.

Mainly, I use this patches to test nesting patches I am hacking for
KVM, also they can be used with your patches to test iommufd with
needing hardware. (See testing section in the cover letter)

> with the ongoing 2-stage nesting support with host and guest. Or
> is it supposed to be just a total orthogonal feature without any
> interaction with the host system?

Are you referring to the iommufd work on Linux to support nesting?


Thanks,
Mostafa
> Thanks
> Nicolin
> 
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
> >    Unified(Combined) design is used, where a new tag is added "stage"
> >    which has 2 valid values:
> >    - STAGE_1: Meaning this entry translates VA to PADDR, it can be
> >      cached from fully nested configuration or from stage-1 only.
> >      It doesn't support separate cached entries (VA to IPA).
> > 
> >    - STAGE_2: Meaning this translates IPA to PADDR, cached from
> >      stage-2  only configuration.
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
> >    entry. Everything is used from stage-1, except:
> >    - transatled_addr from stage-2.
> >    - parent_perm is from stage-2.
> >    - addr_mask: is the minimum of both.
> > 
> > 3) TLB Lookup
> >    For stage-1 and nested translations, it look for STAGE_1 entries.
> >    For stage-2 it look for STAGE_2 TLB entries.
> > 
> > 4) TLB invalidation
> >    - Stage-1 commands (CMD_TLBI_NH_VAA, SMMU_CMD_TLBI_NH_VA,
> >      SMMU_CMD_TLBI_NH_ALL): Invalidate TLBs tagged with SMMU_STAGE_1.
> >    - Stage-2 commands (CMD_TLBI_S2_IPA): Invalidate TLBs tagged with
> >      SMMU_STAGE_2.
> >    - All (SMMU_CMD_TLBI_S12_VMALL): Will invalidate both, this is
> >      communicated to the TLB as SMMU_NESTED which is (SMMU_STAGE_1 |
> >      SMMU_STAGE_2) which uses it as a mask.
> > 
> >    As far as I understand, this is compliant with the ARM
> >    architecture, based on:
> >    - ARM ARM DDI 0487J.a: RLGSCG, RTVTYQ, RGNJPZ
> >    - ARM IHI 0070F.b: 16.2 Caching
> > 
> >    An alternative approach would be to instantiate 2 TLBs, one per
> >    each stage. I haven’t investigated that.
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
> > hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved
> > 
> > 
> > Mostafa Saleh (12):
> >   hw/arm/smmu: Use enum for SMMU stage
> >   hw/arm/smmu: Split smmuv3_translate()
> >   hw/arm/smmu: Add stage to TLB
> >   hw/arm/smmu: Support nesting in commands
> >   hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
> >   hw/arm/smmuv3: Translate CD and TT using stage-2 table
> >   hw/arm/smmu-common: Support nested translation
> >   hw/arm/smmuv3: Support and advertise nesting
> >   hw/arm/smmuv3: Advertise S2FWB
> >   hw/arm/smmu: Refactor SMMU OAS
> >   hw/arm/smmuv3: Add property for OAS
> >   hw/arm/virt: Set SMMU OAS based on CPU PARANGE
> > 
> >  hw/arm/smmu-common.c         | 256 ++++++++++++++++++----
> >  hw/arm/smmu-internal.h       |   2 +
> >  hw/arm/smmuv3-internal.h     |  17 +-
> >  hw/arm/smmuv3.c              | 405 ++++++++++++++++++++++-------------
> >  hw/arm/trace-events          |  14 +-
> >  hw/arm/virt.c                |  14 +-
> >  include/hw/arm/smmu-common.h |  46 +++-
> >  include/hw/arm/smmuv3.h      |   1 +
> >  target/arm/cpu.h             |   2 +
> >  target/arm/cpu64.c           |   5 +
> >  10 files changed, 533 insertions(+), 229 deletions(-)
> > 
> > --
> > 2.44.0.396.g6e790dbe36-goog
> > 

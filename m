Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931602ejb;
        Sun, 28 Apr 2024 20:24:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSH4ibdiR/MU/17MfLyrSN2UpZakusImxoypXlDhydPbj4KKbLVGZF6ys5/eUIJR/lojp5gcMoosEMOYFONrLpmaPq8pYf
X-Received: by 2002:adf:e4c3:0:b0:34c:c376:921f with SMTP id v3-20020adfe4c3000000b0034cc376921fmr2438804wrm.50.1714361072212;
        Sun, 28 Apr 2024 20:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361072; cv=none;
        d=google.com; s=arc-20160816;
        b=APim7zT5KBJInA0/WdubVRdh4Q5/zAQ4OoZeEHNRT4Tf1sSEOL9hIC7MaozVLB5u8z
         aFVnvaXziR2sQAbhdjoVqZoMbidPIKtMJqtOcQgPfgV6N1kY82EqmSkw9hJ7lU1DcG6M
         3wK8XG/MWZP8juPFpFM60CdrEWWK+CPvTMLZVKG4hzGIxEb+qRKoiKnrrsoevE1KHHTi
         kYVYo6kXi+htF81O4FwOI9cfyfl7aRy9v2y1vgMV1Bi+TQMxkU2iSnKFDmtQKOuzqr7N
         8bx9bYPvfVn0BSz88MoZsL5R5C+gBej1YTXTh/SMiuEC2T0iWSr6U7fEjOzB6lI+5zjX
         YMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=kg8JpJQnN0c+odVldJkdd5igagDXLYeYuPdlRPmdra4=;
        fh=ki/tYCkWExPahv0uB9x/Q2Mu+AqZ8+IggNarJ6vM0v8=;
        b=PWd1VnlFSDrAo6qDv3KJo6dDPIrRlvW4GctY1R5keYp6Q+1xN+lnABuG76NMG60tqi
         hS/n5ZrjMqW/f9WBPo589XjL42hoH8E8xOHEfyimcEjzuQmNLuvslEqf7cvyPheQMl2A
         ORYA+AUKbozYeTUHmkdOF2De/f2gROK1x20kuTIc4y9DqcCoV+jm7+5GcIOSZGJXYco1
         iZxpht1mRGooP7py8tdJx5KQWjqs1+ZNkZ6fYBOkwoaFUJRiPNOb1iPVptqrOznrpr0I
         uvsRRNGRHBnUQ7LlzWNCmztKiz4BHVQFTEFMNgrLh7qBKMjeP/EXoAdv28EEosXQUYF8
         Ln9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4iTH+Sus;
       spf=pass (google.com: domain of 37xivzggkcwo2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=37xIvZggKCwo2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <37xIvZggKCwo2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id e6-20020adfc846000000b00346982ff462sor5146406wrh.3.2024.04.28.20.24.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of 37xivzggkcwo2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4iTH+Sus;
       spf=pass (google.com: domain of 37xivzggkcwo2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=37xIvZggKCwo2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361072; x=1714965872; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kg8JpJQnN0c+odVldJkdd5igagDXLYeYuPdlRPmdra4=;
        b=4iTH+SusFVcoMWHnTPUJK3LgIsXdTv5M809mXRNOJtayH2+kXInnxNdnnYw759Epm5
         +sF2t1rHiUrHTG0tSVHiA0/qIhm0ZWtogDqUYqOP8xPsrapc57BGT7B8dWlYFeoi0uN6
         0UjBL5N9GSW5Au+bFPWM1gvro0kl3lmzLdsC2ciR8GRnuzgMN3tGy9wbVujP5fRyznZJ
         A5lPJWQsx8f3FkOreFyTlhqyLwDLzMBfM6I2NRd3bchogd+iueZSI/m7r7xJhFrKBVtO
         YxiBVm/wUFxH9R6LjZiPNLlZYF9BrNcajEfPKM0JpD+v3xW088jBfiiY9V2GajG0w4CN
         vj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361072; x=1714965872;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg8JpJQnN0c+odVldJkdd5igagDXLYeYuPdlRPmdra4=;
        b=gNMCqEyxNj+8do3xZj4Nzvo/gN+zesLOkPvhwFerosfV8tiJCgcRf8E9wiH7EYxEhi
         BxHjFz8aosJRhhoAlZQWkFF+LWGd/CMD1FQ+MkkULan6/wdMttxakW031F5PcSMKdd5A
         BGJsNFvTaZND2dDYjXMM7Ic8IhLGo6O0djIeGNjQO9Yl134/ZpnFu1ht4ZzlPOtoHVM0
         6/uwSNaw1yG0NHlgq7QCvST97kYDbF5ckOJl3K3oKDH8GwuZVyKEQkgiH/i92iZCYsUD
         Kdhyy5P/cwRHuUINhKVAz93syuy/SERyFpZvNFt6DtVE5i08monxO3hanwd1e0VIEMH9
         3Flg==
X-Forwarded-Encrypted: i=1; AJvYcCUTgJAa9zPgfgWXrBXBcjD4ti1sOc9eAHz744zosBrZNueJ2OnKu3KYilCpufezViFfBZG2NHCpEI3wYi2uWVwx52Y/GSxk
X-Gm-Message-State: AOJu0Yyy/dpZv5ZmrIHgCo6Ko3fQ0aWZTqoEo+0tNAE8rmZXbkKWmh7f
	x5F4OSFVH0WiwmpGzp/0eSkBcCFOBF6ZhsolSZ7LfqV8l6PvWRCSPQIIvh6/iIzOmmL85C7DNFi
	F5RNdvOMJdA==
X-Google-Smtp-Source: AGHT+IFFMoZxCmdcZ9viCuoZ7HR9UBuoRJGpvhXYisk1H9DuJOc38FkpxhxVQu8A+JzHVNHkrg49NHdFcemrpw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6000:100e:b0:34a:122d:a749 with SMTP
 id a14-20020a056000100e00b0034a122da749mr15663wrx.6.1714361071772; Sun, 28
 Apr 2024 20:24:31 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:23:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-1-smostafa@google.com>
Subject: [RFC PATCH v3 00/18] SMMUv3 nested translation support
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IXW1OOZPvTAZ

Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
but not nested instances.
This patch series adds support for nested translation in SMMUv3,
this is controlled by property =E2=80=9Carm-smmuv3.stage=3Dnested=E2=80=9D,=
 and
advertised to guests as (IDR0.S1P =3D=3D 1 && IDR0.S2P =3D=3D 2)

Main changes(architecture):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
1) CDs are considered IPA and translated with stage-2.
2) TTBx and tables for stage-1 are considered IPA and translated
   with stage-2.
3) Translate the IPA address with stage-2.

TLBs:
=3D=3D=3D=3D=3D=3D
TLBs are the most tricky part.

1) General design
   Unified(Combined) design is used, where entries with ASID=3D-1 are
   IPAs(cached from stage-2 config)

   TLBs are also modified to cache 2 permissions, a new permission added
   "parent_perm."

   For non-nested configuration, perm =3D=3D parent_perm and nothing
   changes. This is used to know which stage to use in case there is
   a permission fault from a TLB entry.

2) Caching in TLB
   Stage-1 and stage-2 are inserted in the TLB as is.
   For nested translation, both entries are combined into one TLB
   entry. The size (level and granule) are chosen from the smallest entries=
.
   That means that a stage-1 translation can be cached with sage-2
   granule in key, this is take into account lookup.

3) TLB Lookup
   TLB lookup already uses ASID in key, so it can distinguish between
   stage-1 and stage-2.
   And as mentioned above, the granule for stage-1 can be different,
   If stage-1 lookup failed, we try again with the stage-2 granule.

4) TLB invalidation
   - Address invalidation is split, for IOVA(CMD_TLBI_NH_VA
     /CMD_TLBI_NH_VAA) and IPA(CMD_TLBI_S2_IPA) based on ASID value
   - CMD_TLBI_NH_ASID/CMD_TLBI_NH_ALL: Consider VMID if stage-2 is
     supported, and invalidate stage-1 only by VMIDs

As far as I understand, this is compliant with the ARM architecture:
- ARM ARM DDI 0487J.a: RLGSCG, RTVTYQ, RGNJPZ
- ARM IHI 0070F.b: 16.2 Caching

An alternative approach would be to instantiate 2 TLBs, one per each
stage. I haven=E2=80=99t investigated that.

Others
=3D=3D=3D=3D=3D=3D=3D
- Advertise SMMUv3.2-S2FWB, it is NOP for QEMU as it doesn=E2=80=99t suppor=
t
  attributes.

- OAS: A typical setup with nesting is to share CPU stage-2 with the
  SMMU, and according to the user manual, SMMU OAS must match the
  system physical address.

  This was discussed before in
  https://lore.kernel.org/all/20230226220650.1480786-11-smostafa@google.com=
/
  The implementation here, follows the discussion, where migration is
  added and oas is set up from the board (virt). However, the OAS is
  chosen based on the CPU PARANGE as there is no fixed one.

- For nested configuration, IOVA notifier only notifies for stage-1
  invalidations (as far as I understand this is the intended
  behaviour as it notifies for IOVA)

- Stop ignoring VMID for stage-1 if stage-2 is also supported.


Future improvements:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1) One small improvement, that I don=E2=80=99t think it=E2=80=99s worth the=
 extra
   complexity, is in case of Stage-1 TLB miss for nested translation,
   we can do stage-1 walk and lookup for stage-2 TLBs, instead of
   doing the full walk.

Testing
=3D=3D=3D=3D=3D=3D=3D=3D
1) IOMMUFD + VFIO
   Kernel: https://lore.kernel.org/all/cover.1683688960.git.nicolinc@nvidia=
.com/
   VMM: https://qemu-devel.nongnu.narkive.com/o815DqpI/rfc-v5-0-8-arm-smmuv=
3-emulation-support

   By assigning =E2=80=9Cvirtio-net-pci,netdev=3Dnet0,disable-legacy=3Don,i=
ommu_platform=3Don,ats=3Don=E2=80=9D,
   to a guest VM (on top of QEMU guest) with VIFO and IOMMUFD.

2) Work in progress prototype I am hacking on for nesting on KVM
   (this is nowhere near complete, and misses many stuff but it
   doesn't require VMs/VFIO) also with virtio-net-pci and git
   cloning a bunch of stuff and also observing traces.
   https://android-kvm.googlesource.com/linux/+log/refs/heads/smostafa/andr=
oid15-6.6-smmu-nesting-wip

I also modified the Linux driver to test with mixed granules/levels.

hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved

The first 3 patches are fixes.

Changes in v3
v2: https://lore.kernel.org/qemu-devel/20240408140818.3799590-1-smostafa@go=
ogle.com/
- Collected Eric Rbs.
- Rebased on master.
- Fix an existing bug in class encoding.
- Fix an existing bug in S2 events missing IPA.
- Fix nesting event population (missing class and wrong events)
- Remove CALL_FUNC_CFG_S2.
- Rework TLB combination logic to cache the largest possible entries.
- Refactor nested translation code to be more clear.
- Split patch 05 to 4 patches.
- Convert asid/vmid in trace events to int also.
- Remove some extra traces as it was not needed.
- Improve commit messages.

Changes in v2:
v1: https://lore.kernel.org/qemu-devel/20240325101442.1306300-1-smostafa@go=
ogle.com/
- Collected Eric Rbs
- Rework TLB to rely on VMID/ASID instead of an extra key.
- Fixed TLB issue with large stage-1 reported by Julian.
- Cap the OAS to 48 bits as PTW doesn=E2=80=99t support 52 bits.
- Fix ASID/VMID representation in some contexts as 16 bits while
  they can be -1
- Increase visibility in trace points

Mostafa Saleh (18):
  hw/arm/smmu-common: Add missing size check for stage-1
  hw/arm/smmu: Fix IPA for stage-2 events
  hw/arm/smmuv3: Fix encoding of CLASS in events
  hw/arm/smmu: Use enum for SMMU stage
  hw/arm/smmu: Split smmuv3_translate()
  hw/arm/smmu: Consolidate ASID and VMID types
  hw/arm/smmuv3: Translate CD and TT using stage-2 table
  hw/arm/smmu-common: Add support for nested TLB
  hw/arm/smmu-common: Rework TLB lookup for nesting
  hw/arm/smmu-common: Support nested translation
  hw/arm/smmu: Support nesting in smmuv3_range_inval()
  hw/arm/smmu: Support nesting in the rest of commands
  hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
  hw/arm/smmuv3: Support and advertise nesting
  hw/arm/smmuv3: Advertise S2FWB
  hw/arm/smmu: Refactor SMMU OAS
  hw/arm/smmuv3: Add property for OAS
  hw/arm/virt: Set SMMU OAS based on CPU PARANGE

 hw/arm/smmu-common.c         | 298 ++++++++++++++++++++---
 hw/arm/smmuv3-internal.h     |  22 +-
 hw/arm/smmuv3.c              | 441 +++++++++++++++++++++++------------
 hw/arm/trace-events          |  26 ++-
 hw/arm/virt.c                |  14 +-
 include/hw/arm/smmu-common.h |  43 +++-
 include/hw/arm/smmuv3.h      |   1 +
 target/arm/cpu.h             |   2 +
 target/arm/cpu64.c           |   5 +
 9 files changed, 625 insertions(+), 227 deletions(-)

--=20
2.44.0.769.g3c40516874-goog

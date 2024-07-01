Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1286160njm;
        Mon, 1 Jul 2024 04:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/wP64YcH7C2wHoCg0PIFbzuEmtHHrWK3kG++TAJLg1f49M/izpPDX31kCLVq7HZS70927HyKVvEhXP/tstM48L/ltIEYC
X-Received: by 2002:a2e:b534:0:b0:2ec:5ff1:226e with SMTP id 38308e7fff4ca-2ee5e393c80mr36670641fa.13.1719831786494;
        Mon, 01 Jul 2024 04:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719831786; cv=none;
        d=google.com; s=arc-20160816;
        b=Oiytjq6VfOWAdF7OIea4IswHz1/k0SWXloeGhUaJRYfAXc4ffWN3rq8ksqjmyqGNzx
         9Rcb+lX7m/22AEu5jrB8qpSJK+yez7DgrLV8CGxNIbjJbufRB3fnAc3THGxTuJcFbf3n
         8r94UB+n6FvVCP2bpxsK9inSYQ5RppZ8EgFXkSAw7EvceGMVpUYH36gDk9dUglXlUCqL
         Zp3fsGFYcKarRmpeEc9N6mn8edqmCZnf/5n/LXZ3PsyPfxQMSw5d4yYzuj4YC+XMVaDi
         Mn3LCF6C5B4tR49+8KAnJ8XD510Rm3kkP9aOkxYmJHdZEbPohHL94+vPlVyuRPs8Eh0q
         tG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=lTVNVXBV9KLJ4PUuDHt2IQwPs5xTGzgLeTty17Q2smI=;
        fh=v3XluH4EllxpfOhWPEZnNMiU/ssbyDmG42iNlMIWLdQ=;
        b=nX3+l60jk0GSQWrVl18q8G15aoYKtLcVHVRk0pUn23G+ANkKrGk4ffLdhmUgQpM3xm
         GdvffHmL13SBdOKl6ZNVNB05UBWPaPBpxxCHDte+bNwvpqhLt2LmYc00lbpjO2U0mSGc
         bRRDrVYtqhxGLV9ikFFk3/gy19cwrVgBHQihCAbntoS2Px5vDMLbq34Jh5bUFnaKraQn
         h8jFTXQjmmo/4tbYjszxV1xaI/4x9YZNnYXZAL7RqxZnZphiGIRB/HD7d2U2hQf53al8
         7kge1ajQplyvwZtfzY8nWAxuAO+YEperJr2wgbrFboTsGuYOu/KaeEojwhXjJ6y+Cv0h
         5WEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mYfXFUI6;
       spf=pass (google.com: domain of 36yyczggkc0g2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=36YyCZggKC0g2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <36YyCZggKC0g2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4256b91cf16sor18404065e9.3.2024.07.01.04.03.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Jul 2024 04:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of 36yyczggkc0g2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=mYfXFUI6;
       spf=pass (google.com: domain of 36yyczggkc0g2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=36YyCZggKC0g2wy23kpkqyyqvo.mywkvo7.loxxoovsxk1y.y1q@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719831786; x=1720436586; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTVNVXBV9KLJ4PUuDHt2IQwPs5xTGzgLeTty17Q2smI=;
        b=mYfXFUI6hzNbrhY0MMW42HHMjXtkGTJ7snyhIw0DiFZk0J3SrTMh7X6PNr/uiNG959
         eMXJS6NAsYJ4NfLG5/hPLKp6PbupYajumQSYgD9NhRROiadUUHjM0SAZnOokqKct+IHy
         vlPSIygE+G4CBWrsOD0/WGpv6hkvVJMRGFVLhzOXzZumt9zy5jMUkO7iMja22dNBCHBL
         o6Ez8LncwR71FJmS/RmgFqrriIgcTodBjLGYc3/DG8MIcmiJ24y/XHq3LppuuHEKAoxz
         9AFbvzeCZpa9GACrVhiM2jSLIKP0i5dN7xxO4e7SGa94WGYvNVo2XTANA/UXMk5AGVyt
         /fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831786; x=1720436586;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTVNVXBV9KLJ4PUuDHt2IQwPs5xTGzgLeTty17Q2smI=;
        b=NUpOgnxxfyZhWwRmfJJ/ePMQmxGovuAExL9gb9lVTakFt4LRkclb+LJGzSTTJHLqUf
         DZOgpUVn8RMwq3nuVVEQC0vvgDd6S5diYLXDnqUSqM1PrlIZJ0ZRqmcPZqPond4gE6w8
         HZNLFO6iPDsj4oMvbCCdvjGWYT71fg+jA8eQxB5Lpyey7EBR8rgrVHb02oh2E4HtrSzZ
         rsDfNi0I/+RXUvlgQNLgm0fZClc0h3O09wqXhEM+zCUUc1dkeulrftMB/OjEe/j8FPJq
         E94ArRbw67Sj7ieJQTfKNV5FWBYqDlQ7kKSZ4rQiKLDnIVnDT8aIegZBNZbSfgf3N4Vu
         pi3g==
X-Forwarded-Encrypted: i=1; AJvYcCX9IhUQhH0fXZ08E+L2HMacXZhbnFiAlghvZ+1l9aHdhcmA+6Afmz9qKipb+is1xjjGlYDsiyj3U7wrworCYzggLPF1nRzL
X-Gm-Message-State: AOJu0Ywb0lsKlLKfcsvX1CEvX9/FK0/pX9NNtwkGRsCOjUG92eOs3aM9
	xKgWmiwdj7MzhE9J98lPp4u7+D3kdjzDgTCD4n3vNHtjOvOPl8S9WIpnqTgEvQpFtBlQ3BejV2n
	2dgii2b1u5g==
X-Google-Smtp-Source: AGHT+IGbhVPOnXef+VfdxmDzV4KWdRky9O8mrxVF2tfwG7H3hzkjddQiE7Jvl5QegsVuI5gmd6dUqsxhrNq3lA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:1c17:b0:425:6d66:e44f with SMTP
 id 5b1f17b1804b1-4257a08f48dmr218835e9.8.1719831785522; Mon, 01 Jul 2024
 04:03:05 -0700 (PDT)
Date: Mon,  1 Jul 2024 11:02:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240701110241.2005222-1-smostafa@google.com>
Subject: [PATCH v4 00/19] SMMUv3 nested translation support
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2oPS8sT/k5kP

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
   granule in key, this is taken into account for lookup.

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
  This series doesn=E2=80=99t implement that, but reworks OAS to make it ea=
sier
  to configure in the future.

- For nested configuration, IOVA notifier only notifies for stage-1
  invalidations (as far as I understand this is the intended
  behaviour as it notifies for IOVA).

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

Overall I tested the following configurations
(S1 =3D 4k, S2 =3D4k):
- S1 level =3D 1 and S2 level =3D 1
- S1 level =3D 1 and S2 level =3D 2
- S1 level =3D 1 and S2 level =3D 3
- S1 level =3D 2 and S2 level =3D 1
- S1 level =3D 2 and S2 level =3D 2
- S1 level =3D 2 and S2 level =3D 3
- S1 level =3D 3 and S2 level =3D 2
- S1 level =3D 3 and S2 level =3D 3
Also did some testing with
(S1 =3D 16k, S2=3D 4k)
(S1 =3D 4K, S2=3D 16k)


hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved

The first 3 patches are fixes.

Changes in v4:
v3: https://lore.kernel.org/qemu-devel/20240429032403.74910-1-smostafa@goog=
le.com/
- Collected Eric and Alex Rbs
- Rebased on master
- Dropped RFC tag
- Dropped last 2 patches about oas changes to avoid blocking this series
  and I will post them after as RFC
- Split patch 7, and introduce CACHED_ENTRY_TO_ADDR in a separate patch
- Reorder patch 8 and 9 (combine tlb and tlb lookup)
- Split patch 12, and introduce smmu_iotlb_inv_asid_vmid in a separate patc=
h
- Split patch 14, to have fault changes in a separate patch
- Update commit messages and include Fixes sha
- Minor updates, renames and a lot of comments based on review

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


Mostafa Saleh (19):
  hw/arm/smmu-common: Add missing size check for stage-1
  hw/arm/smmu: Fix IPA for stage-2 events
  hw/arm/smmuv3: Fix encoding of CLASS in events
  hw/arm/smmu: Use enum for SMMU stage
  hw/arm/smmu: Split smmuv3_translate()
  hw/arm/smmu: Consolidate ASID and VMID types
  hw/arm/smmu: Introduce CACHED_ENTRY_TO_ADDR
  hw/arm/smmuv3: Translate CD and TT using stage-2 table
  hw/arm/smmu-common: Rework TLB lookup for nesting
  hw/arm/smmu-common: Add support for nested TLB
  hw/arm/smmu-common: Support nested translation
  hw/arm/smmu: Support nesting in smmuv3_range_inval()
  hw/arm/smmu: Introduce smmu_iotlb_inv_asid_vmid
  hw/arm/smmu: Support nesting in the rest of commands
  hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
  hw/arm/smmuv3: Handle translation faults according to SMMUPTWEventInfo
  hw/arm/smmuv3: Support and advertise nesting
  hw/arm/smmuv3: Advertise S2FWB
  hw/arm/smmu: Refactor SMMU OAS

 hw/arm/smmu-common.c         | 320 +++++++++++++++++++++++---
 hw/arm/smmuv3-internal.h     |  19 +-
 hw/arm/smmuv3.c              | 432 ++++++++++++++++++++++-------------
 hw/arm/trace-events          |  26 ++-
 include/hw/arm/smmu-common.h |  43 +++-
 5 files changed, 617 insertions(+), 223 deletions(-)

--=20
2.45.2.803.g4e1b14247a-goog

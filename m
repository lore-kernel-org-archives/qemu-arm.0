Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2117960nji;
        Mon, 15 Jul 2024 01:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV50Be4wEEuNVijt3keMFBuku+K5zCmyfNrlPOAr7oOekg//vYMGKgSXC95liNEsRuCrJ4S6+vh+7Am8S1W8NP+rwDm8zeh
X-Received: by 2002:a05:6902:201:b0:dee:6070:693f with SMTP id 3f1490d57ef6-e041b0ff476mr20378231276.37.1721033128018;
        Mon, 15 Jul 2024 01:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033127; cv=none;
        d=google.com; s=arc-20160816;
        b=em6S/WJI+5ISXw1Mj5gmBWH1Cnnh+8ouPQ6WJepL/RKjZXVsLynQRzihSATLi9dm9j
         25xHKGNPwV9I0HGkbW9UkkwaQB7T/DHnbc2z6aNE4Qc8qL+YwYxV/YsRWf+Gd40SQiJs
         lYC9rZdrIO81foCk9sbToMCsLOroi0pwxX65+JSMF3eLUQrzmBVpweRluGO9Nwyvf/px
         vbSLsR8LtdRV7VqrdNMRomangvibE0ornSKRiwqo6HOn8rUVCvHgArfLQHaOheIPqQ6T
         mOLeboMwPSu/dFF2MHrDJHguDrWU+n9BdzzLtgajvFXmL5uQw1Sr0QNX5s/N+MLqFwAx
         awew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=wofBN8c0yDPU+i2ZSuLFkbWE4s+WaDIZsoyqfUvchFk=;
        fh=1mbYEq5pEpAmd0L7CzWV3inphr99CZeClAkDAczR1AI=;
        b=hngF+mvnlQAcuPQzrOFjNr+Sb4OoC5Y9YaRTTokdN7m+H1SswTP2YYV+jkoTmFwszr
         sl+9Jy/JQ05ibOXley3XuSxjO9qCy/VgDxO0EX9Rv4rNu3yYsi/a0gJg3DNlzvR3NBV8
         bMPkpfRFcXqYHmPE0HoLGR/rTu5UWYRCueNU5RFbUltyo1z3P7++hsfdEZbNqwde5OcC
         O+jL9eeI1vkFQOwsU+iorbyqB9S8Ta1rpQ0WqNch1yQs3BQjNUivMknxyP/K27Vpe4Gd
         8noAsqbPdDkU+cKBLfvvLpHgnSV1F0Q0pXZ+POJYpgMT9nSd0XOW3D4IKkKdLdZ1/jpk
         S0PA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="df/mPl+G";
       spf=pass (google.com: domain of 3p-guzggkc_gxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3p-GUZggKC_gxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3p-GUZggKC_gxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e05a38035bcsor1471092276.8.2024.07.15.01.45.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3p-guzggkc_gxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="df/mPl+G";
       spf=pass (google.com: domain of 3p-guzggkc_gxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3p-GUZggKC_gxrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033127; x=1721637927; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wofBN8c0yDPU+i2ZSuLFkbWE4s+WaDIZsoyqfUvchFk=;
        b=df/mPl+GsbBfeWg7POIsnnk6bVSeIpawhRdE1MuwgFxRgdNpggkWjB1CudYzjV1dFv
         XpYk5PI7QbY5gGBEemmtrmEfrHkMMJhi60UtZy0HzHQ4etf4HAFZYaWhnqKAwny8JRef
         oj1y6lLcy0wROxFRPPGy4c3UdDEIQMwPl9C1++RjlhIL+JvBq3fmXY5cYUE+Zlkqc0iy
         /UyiLaB6sE6YluYhtvp+rsNmvyBE4FdO7yKRuzp5I/whI+lrwBO/El4hJkBsdnnq+0V/
         ptfu7qSDCDfkT5/We73tvhS+swb+VKFXoGTC9wbps9mD6byXKhoqsROF6akm5uBz9BpR
         PS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033127; x=1721637927;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wofBN8c0yDPU+i2ZSuLFkbWE4s+WaDIZsoyqfUvchFk=;
        b=Pg5XLFeZDwlQQTi6AE0IkHmgq1a7PWQBQLgLCqWTv2fomr9l6fTkMTKiePKod8FqqA
         /SqBaf/XBDSMmKFNzIJ48jom/x3omOmzZHhrKjr7o/HglPNJ7SQSxogKBqvSHA5mLmLw
         FkoHJndV61p1nnn9lHrwKtjRQBDfYNMFdWAC9DeB++K50tzkBbQWTqbBDoTxhWOZWHK8
         B2e93qUvYf1ghbOn0LS5x+20x9Pnu9d5/92NoWdrR9QLDiWjnfVov1Cqc6frusX8oX72
         mko5z2UlLQ47W8VxrcpnFgciMNnSFcMuX5QlWvu0gAy0FoakFzphmfjFI0bOEPlWxYtn
         RLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd4jfw3ItcTHQI5Pa7ju7nbsXCoGyBKH8GjLQpAL/9L1uwbOILQH/HcdFKZ9zwPM+Z1MbEFR0xV5EMWj+A8rYT9rcdVSVP
X-Gm-Message-State: AOJu0YwvD+F+ezgUXjXaEdcX+ycruZRAI+S73zkZS1qxWbCDyzIrl6WF
	HOyhrPGoCAe19jSIE1B/HPqyX4kHmRgqEzC9+C6eNfR60gZC8Rid8XeARfyP6mKjTpHYl6IWPp3
	0n7OoN6fzlg==
X-Google-Smtp-Source: AGHT+IHRloCQC+SXOpkvFVR3q7bQg0tteH9lD2ZQljBLHkkbxrvjS87dFdqMK/7ZNQZpNiJc0wVBfMtrtQiGBA==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:6902:2506:b0:e03:aded:7d25 with SMTP
 id 3f1490d57ef6-e058a950622mr502109276.6.1721033127224; Mon, 15 Jul 2024
 01:45:27 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:00 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-1-smostafa@google.com>
Subject: [PATCH v5 00/18] SMMUv3 nested translation support
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Proft9LhV7/E

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

- Rework class in events.

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
(S1 =3D 4k, S2 =3D 4k):
- S1 level =3D 1 and S2 level =3D 1
- S1 level =3D 1 and S2 level =3D 2
- S1 level =3D 1 and S2 level =3D 3
- S1 level =3D 2 and S2 level =3D 1
- S1 level =3D 2 and S2 level =3D 2
- S1 level =3D 2 and S2 level =3D 3
- S1 level =3D 3 and S2 level =3D 2
- S1 level =3D 3 and S2 level =3D 3
(S1 =3D 16k, S2 =3D 4k)
- S1 level =3D 2 and S2 level =3D 1
- S1 level =3D 2 and S2 level =3D 2
- S1 level =3D 2 and S2 level =3D 3
- S1 level =3D 3 and S2 level =3D 1
- S1 level =3D 3 and S2 level =3D 2
- S1 level =3D 3 and S2 level =3D 3
(S1 =3D 64K, S2 =3D 4K)
- S1 level =3D 2 and S2 level =3D 1
- S1 level =3D 2 and S2 level =3D 2
- S1 level =3D 2 and S2 level =3D 3
- S1 level =3D 3 and S2 level =3D 1
- S1 level =3D 3 and S2 level =3D 2
- S1 level =3D 3 and S2 level =3D 3
(S1 =3D 4K, S2 =3D 16k)
- S1 level =3D 1 and S2 level =3D 2
- S1 level =3D 1 and S2 level =3D 3
- S1 level =3D 2 and S2 level =3D 2
- S1 level =3D 2 and S2 level =3D 3
- S1 level =3D 3 and S2 level =3D 2
- S1 level =3D 3 and S2 level =3D 3
(S1 =3D 4K, S2 =3D 64K)
- S1 level =3D 1 and S2 level =3D 2
- S1 level =3D 1 and S2 level =3D 3
- S1 level =3D 2 and S2 level =3D 2
- S1 level =3D 2 and S2 level =3D 3
- S1 level =3D 3 and S2 level =3D 2
- S1 level =3D 3 and S2 level =3D 3


hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved

The first 3 patches are fixes.

Changes in v5:
v4: https://lore.kernel.org/qemu-devel/20240701110241.2005222-1-smostafa@go=
ogle.com/
- Collect Eric and Jean Rbs
- Fix a bug with nested lookup granule and iova mask
- Fix InputAddr for events for cd and ttbx translation faults
- Fix class in translation fault events
- Fix smmuv3_notify_iova
- Fix CACHED_ENTRY_TO_ADDR macro
- Drop FWB patch
- Fix bisectability by moving smmu_iotlb_inv_asid_vmid

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

Mostafa Saleh (18):
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
  hw/arm/smmu: Refactor SMMU OAS

 hw/arm/smmu-common.c         | 312 ++++++++++++++++++++---
 hw/arm/smmuv3-internal.h     |  19 +-
 hw/arm/smmuv3.c              | 467 +++++++++++++++++++++++------------
 hw/arm/trace-events          |  26 +-
 include/hw/arm/smmu-common.h |  46 +++-
 5 files changed, 640 insertions(+), 230 deletions(-)

--=20
2.45.2.993.g49e7a77208-goog

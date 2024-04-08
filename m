Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293564ejh;
        Mon, 8 Apr 2024 07:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/cIuS/Libqg2JZ3tsV4l9Fb8jWtlpHPmy3CA9+SjbMvbLuwsyzXIiQLHVAlz0CQuXblknanotTBIVgNHjeD8K9OWRnp59
X-Received: by 2002:a0d:e6cd:0:b0:615:102e:5af1 with SMTP id p196-20020a0de6cd000000b00615102e5af1mr7048508ywe.24.1712585340231;
        Mon, 08 Apr 2024 07:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585340; cv=none;
        d=google.com; s=arc-20160816;
        b=utwAokOQqMpefwM6fQaMd150iw0A67/dXxvcK044FghUVpKFIVdiZya516UI1XbAyE
         xmakC7OWAM17I9muXioQcMEIZSZ+PxBO8vhKk1xdMhna17IBxvNCXujqAam8yUF2r4Hv
         5A+FuxGD4ghxWED78LtpmPIRYoqcjQcQhowVkOcF5oayNtGpvB0wSKj5Ajp+YLZcOsW1
         Pkj2aPd36/ufC1JSnYlj0JwZj79kQh4laiyxwg8yJjOctWY4si7Po5H8hr3SsVqVV2Vq
         XqkrlQTIURYZ+SmDAyXf6s0Gl+4o9r2QHa+Up/rANjDrhfbW6pxMjBldGdaK1pf+8Kx/
         HXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=NLZ1DYSCUHy7vwgXmykXXQThwxqVk3hHzLk0I+Ol/to=;
        fh=OVV2f+VFZ+FqHZLYXU3EkCp+ESfTyuC2ayqM2h29FV0=;
        b=xujUn4iN1sOtBPb9clYDwm48e4fNVFek1B84dXapTYhuYnMDVw2RaDAHXTa9KLzQ+9
         7MMeBizhID3Riu93QPFhjzfdpBGIKuGlsreJg1E65QX4bhfCpUc0xKxTEK+Z3K/g9FFt
         heiykJ7WuCV1TdSAkgoT1WuQmNolrKqOOc9kLqabrW8HKBQ6F8fRfBN1dm7KlQhzBkTl
         rSLQ8od04JqIN7KG2vFrrQfdQJ23PXja5SD480M+bU22j+1FUQ6C0ChBltIx+ZWdlPz1
         mioOxfIGd0/zxyxaVG7LAS+JHNtbEgS12FQQYsI0nJliO+/qZlsUQTqjMMdnOr0x+XWb
         WzUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=puhj+g5Q;
       spf=pass (google.com: domain of 3e_otzggkc_yqkmqrydyemmejc.amkyjcv.zcllccjglypm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3e_oTZggKC_YqkmqrYdYemmejc.amkYjcv.ZcllccjglYpm.mpe@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3e_oTZggKC_YqkmqrYdYemmejc.amkYjcv.ZcllccjglYpm.mpe@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id y9-20020a0dd609000000b006153858d945sor3613954ywd.15.2024.04.08.07.09.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3e_otzggkc_yqkmqrydyemmejc.amkyjcv.zcllccjglypm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=puhj+g5Q;
       spf=pass (google.com: domain of 3e_otzggkc_yqkmqrydyemmejc.amkyjcv.zcllccjglypm.mpe@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3e_oTZggKC_YqkmqrYdYemmejc.amkYjcv.ZcllccjglYpm.mpe@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585340; x=1713190140; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLZ1DYSCUHy7vwgXmykXXQThwxqVk3hHzLk0I+Ol/to=;
        b=puhj+g5Qh/J+B3Q6gHIjCKXAoQI7/U7NoMOkidGeZyM+oHHCdpZhlqlhpGi2v253Ql
         ZDVCkDSHfBLCaGS+LoFS6/+1gdXfIxj5r6zi1L8YQOXCoJMLh+Q1LcEeylDpRy9wl8ED
         2k0aQLpHPZo3yBkRDo45UMquSJnvJvwAQvPZqDTO1xi619p7m/B60iU2qbneJom6Xlrp
         uE0IrQ6iHCOm80keh7ScS7f9hTGEIkRca7jdi2kR38JD684z68qB8oqbd8czLophYspD
         vT6gfEyvlsS4FUS9obOnkozGO8RhU/jPpWnQwgsMw1nAy+/4E8LPjtqj8y++3ucbhg8h
         1uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585340; x=1713190140;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLZ1DYSCUHy7vwgXmykXXQThwxqVk3hHzLk0I+Ol/to=;
        b=StuvHlN49qoPJtQYhMSPRTz7f+boIvEcL8YNPJMcmNnpz6fVFU8IIzgSUGudnRaCgp
         MZw51eoSVjhRW0V2BSPcRj7QXn7o26+3CYz8RoZ6ijxgmsffqjKvEQXe1i5G3pWAw4PW
         gwk4z00WwNTdgqL+wyb9T8E6DQERHyy3kEMwCmPaDZBhg9vbXEu2tctJYjOXUE0WSP8B
         +3fICHpPPQqq5Ey/9V4HhHZSpprMpbF2xTzjbH+iSF2sgbZUNs4+AnkMlrRIAbBlVJ5G
         c5/oqIuW4dvYqzPgxDEQZVEgcdcBI9FlML2Mq4GLUQks1MYgo2HyW2/70RzLwf1qEMzQ
         Zjkw==
X-Forwarded-Encrypted: i=1; AJvYcCVxO0NsZlhG/7y+5owIKTFKBF5IljX6w8waaBPVIKNkbnQSlY9g9qGBK3MlC9zdOTQw3RPTR5a6MCUmrgX65tEo+D0izy/o
X-Gm-Message-State: AOJu0YzWk3f7EZ+mtYZaHVTWRFDY+MJL86FsSz8eV1kHIQiDj9GzG05r
	egQF1iu2qJjD6hXwSpu1ThXXI+fAayqBkguvhgxzNE+sX0JpOniuS5ui3VYgN1Xd5ndsta7iv2Y
	S4S7UEbYJpg==
X-Google-Smtp-Source: AGHT+IE1Q1LdzTAE3ST+4+e5xy8cHcG2rBiP4XMSy4WwOu3sF80cKufjTrScDzf7KH+OiJ76fQL1tA2a0D1t0g==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:d74c:0:b0:615:2597:7246 with SMTP id
 z73-20020a0dd74c000000b0061525977246mr2354981ywd.6.1712585339740; Mon, 08 Apr
 2024 07:08:59 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:05 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-1-smostafa@google.com>
Subject: [RFC PATCH v2 00/13] SMMUv3 nested translation support
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YEEZ6ylXALFY

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

2) Patch 0006 (hw/arm/smmuv3: Translate CD and TT using stage-2 table)
   introduces a macro to use functions that rely on cfg for stage-2,
   I don=E2=80=99t like it. However, I didn=E2=80=99t find a simple way aro=
und it,
   either we change many functions to have a separate stage argument,
   or add another arg in config, which is probably more code.

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


Mostafa Saleh (13):
  hw/arm/smmu: Use enum for SMMU stage
  hw/arm/smmu: Split smmuv3_translate()
  hw/arm/smmu: Consolidate ASID and VMID types
  hw/arm/smmuv3: Translate CD and TT using stage-2 table
  hw/arm/smmu-common: Support nested translation
  hw/arm/smmu: Support nesting in smmuv3_range_inval()
  hw/arm/smmu: Support nesting in the rest of commands
  hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
  hw/arm/smmuv3: Support and advertise nesting
  hw/arm/smmuv3: Advertise S2FWB
  hw/arm/smmu: Refactor SMMU OAS
  hw/arm/smmuv3: Add property for OAS
  hw/arm/virt: Set SMMU OAS based on CPU PARANGE

 hw/arm/smmu-common.c         | 306 +++++++++++++++++++++----
 hw/arm/smmuv3-internal.h     |  16 +-
 hw/arm/smmuv3.c              | 418 ++++++++++++++++++++++-------------
 hw/arm/trace-events          |  18 +-
 hw/arm/virt.c                |  14 +-
 include/hw/arm/smmu-common.h |  57 ++++-
 include/hw/arm/smmuv3.h      |   1 +
 target/arm/cpu.h             |   2 +
 target/arm/cpu64.c           |   5 +
 9 files changed, 608 insertions(+), 229 deletions(-)

--=20
2.44.0.478.gd926399ef9-goog

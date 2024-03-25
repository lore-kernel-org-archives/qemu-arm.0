Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp597442ejj;
        Mon, 25 Mar 2024 03:15:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsNaVHVsuWQ86dicgIa4fvnI2zmV5gUsRE6vbPfwe5fmRFt6zW7M8eJcONCrO/f2gn7+5Oqi5mAITwTCAf3kyxzKTmNkVX
X-Received: by 2002:a05:651c:199f:b0:2d6:cd05:1895 with SMTP id bx31-20020a05651c199f00b002d6cd051895mr3038655ljb.29.1711361704732;
        Mon, 25 Mar 2024 03:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711361704; cv=none;
        d=google.com; s=arc-20160816;
        b=u2RptFH9reOZbSv2F1283BgpaYKY8lf7R/s3541QCCc1xBejdMgEtevLfPhSkV5Oa3
         N4kCFoAe1xs9D3I6iVDunPsajGbZr03KN8+gcMit2HLZvfVzhrBoOjs2EGMEOGndMV6J
         OmjGAufCR9q9pZHKwA5OzvQtxXwazT8AfpxpF8XHBo5Utp/Miw5N23x0TpJk7pnbHEkH
         IAl6quR96LvxE+fCtJd3rnyU6mTURUVyeow/DW5m2HfzCCHnu8WvbCTsNYTclWXjG2Gq
         LriVzORBggEpOrEvLW+oNtnTLrtgsdouHr7+7Vx+l1/Cnxm81Ho+5JdBP5z13L3r9wnu
         ld7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=yIAujX6vE8NrFA61OIsCbO+ax3TuT+vIQCEUptoSr1g=;
        fh=TlGsz67GFv+rrzY4xR0S8slypyXYhIf8wm1Yse9xfdw=;
        b=0cpsKk6JRZS9gPMepFjsJ7usTGI3v45FCEdFmOPOxYUwJstiXntK69b2IZagTcUW93
         MkDCPzAC4act4kKCEBP1e7zFzInSif1aBnK7g7iaakZGWnpSQUI4NrcGUFZwKxn9yf1y
         ZELeWEux+QTItlDixDXLqXHHOQJzjyK2QaMPnY/qu2MA12/8h3cg8J9ckXI9KfwbM/7c
         4I9A/rRJerH0Yn5fP/sN63w0ljAfOfo0uagy+rlld1TmVgv/fF84hOHutS/4Oxuz40RJ
         UsUlAXMW6DF0nQ43fKaZ6FrfsTpqMN6AEdugZeXsPcGlsZFKkI/j5Oxz7Iz91X6ItYPJ
         HzxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Q/v+JBzZ";
       spf=pass (google.com: domain of 3qe4bzggkc4exrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3qE4BZggKC4Exrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3qE4BZggKC4Exrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id i3-20020a05600c2d8300b004131671e25dsor1040173wmg.3.2024.03.25.03.15.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 03:15:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3qe4bzggkc4exrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Q/v+JBzZ";
       spf=pass (google.com: domain of 3qe4bzggkc4exrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3qE4BZggKC4Exrtxyfkflttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711361704; x=1711966504; darn=linaro.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIAujX6vE8NrFA61OIsCbO+ax3TuT+vIQCEUptoSr1g=;
        b=Q/v+JBzZ2qoM4UhZsOZQ+NtmXK1mcAIbD1QAJiRWY87mjkCg2qgRHJYYgin0vc1xQt
         kH14vZTP7SV5L8yrAjYXQEEJCwJ/JrYzAI/9bq4ImyA2XQnZ4KHC1G+E5Wxa8cLvXNyJ
         tR95jAiqUNrjh/AEh/caCiWBZKz78yat1CynzTvhiEGIrjYWfHt/kE/Xch3QGbeeHwPa
         CFNrkWB+WuWYpqiiK8PEoWwMWcb3nzs1UwH3dG2oNDVHzsuNfXk1+VYSQWmx90VEISnz
         o2HXjk0S5J8xIfTm00o7ilPZ+jpjFHkKV4McO9tEJCn3xHrzwY4dkP9nPVYkucpgHriA
         5mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361704; x=1711966504;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIAujX6vE8NrFA61OIsCbO+ax3TuT+vIQCEUptoSr1g=;
        b=wjf0pV1Cm7G1DtLKGR4ATKijHRKi7MZbLrQfK8mTxIo41uf4pmSVgqn56LpGT48Iz+
         XYI3ICH+qBgBGJ5LNSDCfT4OJ38UFj2dMIL9LhNmM780Nw30YSQC1nz4TRlpmIyVZwql
         twDA6JXqRfle9QRuQBTWmHtIlq6i5gBQg1bxGWZ5CsQUjtzX4p4PFxPh1mcTfiW94y6O
         jf+LdX11jVuJ63VKxZWZ1+163IbkBEZpVK+QLA0U1Y8M3HWPvWdeMKf6D6uzo4e5a83w
         9XrF+P0ny1+gSEmc0AmUQslyce5RtrMXFyLAvYIOqwFuB/9+AKtcivpP1zMWHh9ZEtjD
         2bCw==
X-Forwarded-Encrypted: i=1; AJvYcCXdWI75wPMetx7LhcQ3RNMwfPWS1mBHYdjDNihSh9i64jiljpwqv5nDAtD2pme+LvwreyEyuzaVmVqlVFfNjsylIr8R138d
X-Gm-Message-State: AOJu0Yzl9yEelrIUhbMMreyb2lBX0K7dTXx6TVNxL/MoO3NwGRyuboug
	WYGq75URf930kaNyBd6BTMB1jKaGxIZbbzc0yADCHnKdz2sKq0kyCiA4ICX0pmk4zWAHdeFbVrL
	+fUnGUTQI3A==
X-Google-Smtp-Source: AGHT+IGmhancH3CG9GhCHZk00lSfF57Yr53DtdrD97Wv+G3iDuAm2S+VbVI0SMO7uBJmYPI7idA+cFlBd4UyIQ==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:470a:b0:414:7dfb:8500 with SMTP
 id v10-20020a05600c470a00b004147dfb8500mr47747wmo.6.1711361704364; Mon, 25
 Mar 2024 03:15:04 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:13:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240325101442.1306300-1-smostafa@google.com>
Subject: [RFC PATCH 00/12] SMMUv3 nested translation support
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nNjdJdAwZR3r

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
   Unified(Combined) design is used, where a new tag is added "stage"
   which has 2 valid values:
   - STAGE_1: Meaning this entry translates VA to PADDR, it can be
     cached from fully nested configuration or from stage-1 only.
     It doesn't support separate cached entries (VA to IPA).

   - STAGE_2: Meaning this translates IPA to PADDR, cached from
     stage-2  only configuration.

   TLBs are also modified to cache 2 permissions, a new permission added
   "parent_perm."

   For non-nested configuration, perm =3D=3D parent_perm and nothing
   changes. This is used to know which stage to use in case there is
   a permission fault from a TLB entry.

2) Caching in TLB
   Stage-1 and stage-2 are inserted in the TLB as is.
   For nested translation, both entries are combined into one TLB
   entry. Everything is used from stage-1, except:
   - transatled_addr from stage-2.
   - parent_perm is from stage-2.
   - addr_mask: is the minimum of both.

3) TLB Lookup
   For stage-1 and nested translations, it look for STAGE_1 entries.
   For stage-2 it look for STAGE_2 TLB entries.

4) TLB invalidation
   - Stage-1 commands (CMD_TLBI_NH_VAA, SMMU_CMD_TLBI_NH_VA,
     SMMU_CMD_TLBI_NH_ALL): Invalidate TLBs tagged with SMMU_STAGE_1.
   - Stage-2 commands (CMD_TLBI_S2_IPA): Invalidate TLBs tagged with
     SMMU_STAGE_2.
   - All (SMMU_CMD_TLBI_S12_VMALL): Will invalidate both, this is
     communicated to the TLB as SMMU_NESTED which is (SMMU_STAGE_1 |
     SMMU_STAGE_2) which uses it as a mask.

   As far as I understand, this is compliant with the ARM
   architecture, based on:
   - ARM ARM DDI 0487J.a: RLGSCG, RTVTYQ, RGNJPZ
   - ARM IHI 0070F.b: 16.2 Caching

   An alternative approach would be to instantiate 2 TLBs, one per
   each stage. I haven=E2=80=99t investigated that.

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

hw/arm/smmuv3: Split smmuv3_translate() better viewed with --color-moved


Mostafa Saleh (12):
  hw/arm/smmu: Use enum for SMMU stage
  hw/arm/smmu: Split smmuv3_translate()
  hw/arm/smmu: Add stage to TLB
  hw/arm/smmu: Support nesting in commands
  hw/arm/smmuv3: Support nested SMMUs in smmuv3_notify_iova()
  hw/arm/smmuv3: Translate CD and TT using stage-2 table
  hw/arm/smmu-common: Support nested translation
  hw/arm/smmuv3: Support and advertise nesting
  hw/arm/smmuv3: Advertise S2FWB
  hw/arm/smmu: Refactor SMMU OAS
  hw/arm/smmuv3: Add property for OAS
  hw/arm/virt: Set SMMU OAS based on CPU PARANGE

 hw/arm/smmu-common.c         | 256 ++++++++++++++++++----
 hw/arm/smmu-internal.h       |   2 +
 hw/arm/smmuv3-internal.h     |  17 +-
 hw/arm/smmuv3.c              | 405 ++++++++++++++++++++++-------------
 hw/arm/trace-events          |  14 +-
 hw/arm/virt.c                |  14 +-
 include/hw/arm/smmu-common.h |  46 +++-
 include/hw/arm/smmuv3.h      |   1 +
 target/arm/cpu.h             |   2 +
 target/arm/cpu64.c           |   5 +
 10 files changed, 533 insertions(+), 229 deletions(-)

--=20
2.44.0.396.g6e790dbe36-goog

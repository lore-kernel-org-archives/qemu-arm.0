Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213627ejb;
        Sat, 1 Apr 2023 03:51:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQ4d8IGz8i5gQMM4cmvWTQQJF9QMDs2Jl9bM81luqrvWPAI54ElaTeQoLEJNvFA0kn8GJM
X-Received: by 2002:ac8:5716:0:b0:3e6:3ba9:3c8d with SMTP id 22-20020ac85716000000b003e63ba93c8dmr11926346qtw.13.1680346294238;
        Sat, 01 Apr 2023 03:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346294; cv=none;
        d=google.com; s=arc-20160816;
        b=XeiaNLIeNDG4Nmi5Vo9APPET1vkVk97Ns287xneN71uiw0kMlAiIe0XjnTTE17v3ff
         4rI95aVYug1qWGI64i2zI8RAQhqciJN2MxDqSQsjsLdyTH8otYgNodWOIuBhmQZ5Rmty
         zT4KvAgLTFAjR1nf4rKrdTOVw0rEwUOWk+JRtiv17Xcgdy/s2MI0+2U/p8JC6ijShctx
         DOwQwmqlDVrvWljefpfb6wopdiFq7WaJmOR764m5eN3shIE+nDQH3Pj655EmcAuoOFOh
         KR9/n1HeLh35vqTxfk8W9C9tJPpi8hAvb9pXN1z8mR7n3pmjh+sKDoPRRpBmdI+VmKWo
         pe7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:mime-version:date:dkim-signature;
        bh=kRrF6MNR2XbaLDmQzcheKTq7EdFqZPkuW0K+vNgaOSA=;
        b=X/t+lqQhJvG/RwUrIR92YJWo4CzQmC8F+njyjg4fCaMGPszsdGXy5RXxwnxcv0Zfqg
         iXq2kHFrigR5VP88i5x/AmRlbdOQU5vy8ur8KzHEcM9k5JnYBSj8midxFEIhQ+JM65YM
         qZ68FKypYMZ0Cw3NqtXIJbtSodRjO4K8CVsDl/IEdP7iqVFBAQlsApfURvwBsJ1liG5A
         uI2huZ+nPoYq/jV7jmM2hGshrYWuj/UFuccbDABVgzh3xLkopsNuMBFIE63LZDR86PZU
         KCJ48IhDX0IubXyU+YixgvPSRbNmM3x8jP4k9tBFEt4Zyk5LwvigRJSC/29OGzKTd4C7
         EZgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=P9R6nvGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj10-20020a05620a190a00b00749fc0a2654si2909111qkb.3.2023.04.01.03.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=P9R6nvGr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYo8-0000k7-Kz; Sat, 01 Apr 2023 06:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VQwoZAgKCDYkegklSXSYggYdW.UgeiWem-SjefgfYfm.gjY@flex--smostafa.bounces.google.com>)
 id 1piYo6-0000jD-P8
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:02 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VQwoZAgKCDYkegklSXSYggYdW.UgeiWem-SjefgfYfm.gjY@flex--smostafa.bounces.google.com>)
 id 1piYo4-0002v1-Q1
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:02 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 bh19-20020a05600c3d1300b003ee93fac4a9so12979870wmb.2
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346198;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kRrF6MNR2XbaLDmQzcheKTq7EdFqZPkuW0K+vNgaOSA=;
 b=P9R6nvGrMrYX/gL1kOS6gu6rlMYO6B8dELFJQ4VDYjUporOYCD9Gw9k/4uyJsKifRK
 hjMMcn5gKYJsk8FLDoxpGDWhu1OztrWhc8MmrJ3KKq+eqKuYhUt9TWTmGgGC9ai66INF
 uq6qrn3NjHrCvPKAkqB7pyfPdUWb0OYkIXjtDlcSEo0TjTh+PnnOuk37qXPrfoepB1Nr
 qTwnlMqSpyD4a7OjEdLVUkNUeMP3hGND/2x9CiQfSmt0tVZQL/pfUAL09VhuHzl6ihnk
 5g1pt89Isd2a36SUsUHgQuAMrMZS9AoCWV0ZIBoZ8Bw/AJpTjdRKbtVjMvbx7hPQeFKN
 vRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346198;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRrF6MNR2XbaLDmQzcheKTq7EdFqZPkuW0K+vNgaOSA=;
 b=Fw7nU3JzkGu3LiRjUBOAjlDJGzqew77R2mLnFStiQLAl+FN7C/ml5O5SOJZKjQD3Sd
 lOnFxiyYFC4nJIgZ3xah3iK9cDdy6iKetAyR/zOZJGFU5FC1N5fsCROrTiiABqTq6r1s
 L4yguwS9TDNjcEbngE3Y7mrzOm1r/KxfBQOnUP+QfIiL290TMTxrIqUoYMPdLsQNeDQ1
 Bn560H5H2s23l54HzMKR7SoqozptVbLOHHI6UC+dh1L5KdObzBhVXFKfxo1DElJh4SlY
 64or1Ve+Lh36apzmY6Bdot4VFgQrwL2o7BIKlzdqtRgnn8XBRa+/ZiRsICxLorRhaiE8
 pACw==
X-Gm-Message-State: AO0yUKVl3BC6jeDK6ZtyB+61b1lPTenev4VNY5OtYE/Cgwa6CKvgS+UA
 PZG8EVBNoXWnua2fVoMWTrxI/WB2QxlVQg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a7b:c8c3:0:b0:3ee:7e7e:bae8 with SMTP id
 f3-20020a7bc8c3000000b003ee7e7ebae8mr6962964wml.6.1680346197944; Sat, 01 Apr
 2023 03:49:57 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:43 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-1-smostafa@google.com>
Subject: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3VQwoZAgKCDYkegklSXSYggYdW.UgeiWem-SjefgfYfm.gjY@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZksIuRZu/3lU

This patch series adds stage-2 translation support for SMMUv3. It is
controlled by a new system property =E2=80=9Carm-smmuv3.stage=E2=80=9D.
- When set to =E2=80=9C1=E2=80=9D: Stage-1 only would be advertised and sup=
ported (default
behaviour)
- When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and sup=
ported.
- Value =E2=80=9Call=E2=80=9D is reserved for nesting support. However it i=
s not
implemented in this patch series (more about this in the end)

Features implemented in stage-2 are mostly synonymous with stage-1
- VMID16.
- Only AArch64 translation tables are supported.
- Only little endian translation table supported.
- Stall is not supported.
- HTTU is not supported, SW is expected to maintain the Access flag.

To make it easy to support nesting, a new structure(SMMUS2Cfg) is
embedded within SMMUTransCfg, to hold stage-2 configuration.

TLBs were updated to support VMID, where when stage-2 is used ASID is
set to -1 and ignored and when stage-1 is used VMID is set to -1 and
ignored.
As only one stage is supported at a time at the moment, TLB will
represent IPA=3D>PA translation with proper attributes(granularity and
t0sz) parsed from STEs for stage-2, and will represent VA=3D>PA
translation with proper attributes parsed from the CDs for stage-1.

New commands where added that are used with stage-2
- CMD_TLBI_S12_VMALL: Invalidate all translations for a VMID.
- CMD_TLBI_S2_IPA: Invalidate stage-2 by VMID and IPA
Some commands are illegal to be used from stage-2 were modified to
return CERROR_ILL.

This patch series can be used to run Linux pKVM SMMUv3 patches (currently o=
n the list)
which controls stage-2 (from EL2) while providing a paravirtualized
interface the host(EL1)
https://lore.kernel.org/kvmarm/20230201125328.2186498-1-jean-philippe@linar=
o.org/

Looking forward, nesting is the next feature to go for, here are some
thoughts about this:

- TLB would require big changes for this, we can go either for a combined
implementation or per stage one. This would affect returns from PTW and
invalidation commands.

- Stage-1 data structures should be translated by stage-2 if enabled (as
context descriptors and ttb0/ttb1)

- Translated addresses from stage-1 should be translated by stage-2 if
enabled.

- Some existing commands(as CMD_TLBI_S2_IPA, CMD_TLBI_NH_ASID =E2=80=A6) wo=
uld be
modified and some of those would be based on the design of the TLBs.

- Currently, VMID is ignored when stage-1 is used as it can=E2=80=99t be us=
ed with
stage-2. However when nesting is advertised VMID shouldn=E2=80=99t be ignor=
ed
even if stage-2 is bypassed.

Changes in v3:
- Collected Reviewed-by tags
- Separate stage-2 record faults from stage-1
- Fix input address check in stage-2 walk
- Fix shift in STE_S2HD, STE_S2HA, STE_S2S, STE_S2R
- Add more logs for illegal configs and commands.
- Rename SMMU translation macros to VMSA as they are not part of SMMU spec
- Rename stage-2 variables and functions (iova=3D>ipa, ap=3D>s2ap, ...)
- Rename oas in SMMUS2Cfg to eff_ps
- Improve comments (mention user manuals versions, field names)

Changes in v2:
-Collected Reviewed-by tags
-Add oas to SMMUS2Cfg, and use it in PTW
-Add stage member to to SMMUPTWEventInfo to differentiate stage-1 and
 stage-2 PTW faults
-Move stage-2 knob to the last patch
-Add all STE parsing in one patch
-Pares and use S2PS and S2ENDI
-Split S2AFF patch over PTW and STE patches.
-Fix TLB aliasing issue
-Renaming and refactoring and rewording commits.
-Populate OAS based on PARANGE
-Add checks for stage-1 only commands
-Update trace events to hold translation stage, vmid when possible
-Remove feature flags for supported stages as they were redundant with IDR0


Mostafa Saleh (10):
  hw/arm/smmuv3: Add missing fields for IDR0
  hw/arm/smmuv3: Update translation config to hold stage-2
  hw/arm/smmuv3: Refactor stage-1 PTW
  hw/arm/smmuv3: Add page table walk for stage-2
  hw/arm/smmuv3: Parse STE config for stage-2
  hw/arm/smmuv3: Make TLB lookup work for stage-2
  hw/arm/smmuv3: Add VMID to TLB tagging
  hw/arm/smmuv3: Add CMDs related to stage-2
  hw/arm/smmuv3: Add stage-2 support in iova notifier
  hw/arm/smmuv3: Add knob to choose translation stage and enable stage-2

 hw/arm/smmu-common.c         | 209 +++++++++++++++++---
 hw/arm/smmu-internal.h       |  37 ++++
 hw/arm/smmuv3-internal.h     |  12 +-
 hw/arm/smmuv3.c              | 364 ++++++++++++++++++++++++++++++-----
 hw/arm/trace-events          |  14 +-
 include/hw/arm/smmu-common.h |  45 ++++-
 include/hw/arm/smmuv3.h      |   4 +
 7 files changed, 595 insertions(+), 90 deletions(-)

--=20
2.40.0.348.gf938b09366-goog


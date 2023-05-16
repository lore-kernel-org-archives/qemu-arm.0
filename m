Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp660601ejq;
        Tue, 16 May 2023 13:34:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6kE1x0XmDxcjX3Knewc3uWWj9OFeZ9FlCQo4EByshgmps87WAVPUUpLjf4slYvZP/vOy0O
X-Received: by 2002:a05:6214:1cc4:b0:61b:6e43:b20 with SMTP id g4-20020a0562141cc400b0061b6e430b20mr57907956qvd.42.1684269260343;
        Tue, 16 May 2023 13:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684269260; cv=none;
        d=google.com; s=arc-20160816;
        b=c1Vx4ww1AzNvObf5XC+OBJKfBYxK0+OQLdBQMbzK+IWux/yDQJyDGXGvFDKyve8RWp
         +8/nUoJlqgPZxOmb1zv+CvCtKBkuuZxG/BVKMizzZ7ikZu1zCHdNxd8nvMVKq/YCWcCj
         hKTI/MxGtU33OEBgKEean46hv7OEceXsq5VoAWzq0UD0S+QKpPTv38304qpU7yawT9sJ
         759MnhY/yYH/SQ551gW977TNfuGWMRtqozCF7YYcmZVPnjHnKrrAqeCmnBb1LlbNP8CF
         LA/cl5RYJ5Xu8gfXpZvSITdsTqtLhLUiGY0d7/AExlTU8CDOo+MWp3CV6dSVLoBMhpPY
         Pvbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:mime-version:date:dkim-signature;
        bh=4k3eEfhDlmRsC1zKw8qQZ455WxDFJhIXQXwlpAGk26c=;
        b=sWU/CeUolFvnen2T8Lws8YsxLMlNJZVeYTT9z0DOS7P6sDKkbR84Iznibd+9xtTRdi
         zimtIWMpTKGyopHeRWIgEoUKIH7Pp6zZ8adOPpYET5r2W676oP/oVR58xZYMnBKcPQFK
         xAWibT/rfj5Mug6UWk7LUdrZAUnHy83Vdoofyw7J5DzZeG+BSPtQwH1Lw5NlDJP1k0Fs
         ydSsAKhjIrb6QxvPsjSbfrCt66AVvCWo8y3j3zzAvV45AVb6j0X6G6dkYVkquNmamNOE
         dq4E9TImnMm5k0I2DnKdx6Y9TXmodX7hPiKg05vCcUj/Vvy4XvvLKHZD0GyRd1KwTS/5
         HPdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b="PcoP/M7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc7-20020a05620a520700b007596312f2acsi235265qkb.754.2023.05.16.13.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 13:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b="PcoP/M7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pz1Mr-00065S-E4; Tue, 16 May 2023 16:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sOhjZAgKCDspjlpqXcXdlldib.Zljnbjr-Xojklkdkr.lod@flex--smostafa.bounces.google.com>)
 id 1pz1Mp-00064s-Ud
 for qemu-arm@nongnu.org; Tue, 16 May 2023 16:33:55 -0400
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sOhjZAgKCDspjlpqXcXdlldib.Zljnbjr-Xojklkdkr.lod@flex--smostafa.bounces.google.com>)
 id 1pz1Mo-0006fY-2J
 for qemu-arm@nongnu.org; Tue, 16 May 2023 16:33:55 -0400
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-30634323dfeso5862327f8f.3
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684269232; x=1686861232;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4k3eEfhDlmRsC1zKw8qQZ455WxDFJhIXQXwlpAGk26c=;
 b=PcoP/M7/zv87Rzk43UJxmLFxUB47fo6cRQR6s918H1ZZsXTgvEBdP/59zVdSBs6AMg
 CFLgWs3jq1IBwu8mcj4rB/6eb47xgOf6z5BKu0Uroen708FLeWdSxKSmDEM1EPFQiQke
 9/xP9Wzh2XMTFIY/Yn8YIWmIaCECyTryhEeXIx5a5a58tXlgeObK10ED7AwEsnCvX29F
 8GJGYBhX9Nohu8W5HIWafQEfHHuFS7zolUnu9t2Xp6BKrD/ig4CA26lec0oMV+JFgeGX
 xtdL+aB/GRE5V2eVCScsKKA1+e9AnkGPqZC4dbIOhTS/2SyV8IatP+cm0cvqRxTFV3uc
 vTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684269232; x=1686861232;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4k3eEfhDlmRsC1zKw8qQZ455WxDFJhIXQXwlpAGk26c=;
 b=VESKzQpzzmX6rfSPPxv5tfMQd7yxoW3eR8By5UYzMfuXB65oaODCskFX8S6JHcToT+
 oslkjLoCn/3NzPSI/U/0Hjt23vRmrOwGyjhj2L6QdGnhXQyaeOHk6dSg9VXYzd3zo9La
 XH33y5pVKHnjyWJsf7vxG15dGukUXHt1V+gVRdpR8G+NRkGeyb2KKt3rSPQZXsQImZtl
 qHZN4J1DTcbuCOCcFRJDBTMDNHmuXh4EF+wNaZ1OASVo6Tt42d4gOxklRAKWY8VcoiwL
 UmPcfaBZP6RYpH5kkG5/80oXxmm6NANDpps/W2HcAtiOYUmd042ErLhEh0LuWuPI5bS4
 ShUQ==
X-Gm-Message-State: AC+VfDyKUJU5dh/Gs5kr6576bf5K1osDWL9lizWR7IY65V7BsCPUC+8f
 0Q5lefJsXYG4aqxCk0mawLSNoVyR8bfsMg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:614d:0:b0:306:41c9:1e11 with SMTP id
 y13-20020a5d614d000000b0030641c91e11mr6626359wrt.3.1684269232085; Tue, 16 May
 2023 13:33:52 -0700 (PDT)
Date: Tue, 16 May 2023 20:33:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230516203327.2051088-1-smostafa@google.com>
Subject: [PATCH v4 00/10] Add stage-2 translation for SMMUv3
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::44a;
 envelope-from=3sOhjZAgKCDspjlpqXcXdlldib.Zljnbjr-Xojklkdkr.lod@flex--smostafa.bounces.google.com;
 helo=mail-wr1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: uYZ9JVU8SuQN

This patch series adds stage-2 translation support for SMMUv3. It is
controlled by a new system property =E2=80=9Carm-smmuv3.stage=E2=80=9D.
- When set to =E2=80=9C1=E2=80=9D: Stage-1 only would be advertised and sup=
ported (default
behaviour)
- When set to =E2=80=9C2=E2=80=9D: Stage-2 only would be advertised and sup=
ported.

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

Changes in v4:
- Collected Reviewed-by tags
- Add SMMU_CMD_TLBI_S12_VMALL in a block to fix compilation issue
- Simplify record fault macro
- Remove references to "all" stage

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
 hw/arm/smmuv3.c              | 357 ++++++++++++++++++++++++++++++-----
 hw/arm/trace-events          |  14 +-
 include/hw/arm/smmu-common.h |  45 ++++-
 include/hw/arm/smmuv3.h      |   4 +
 7 files changed, 587 insertions(+), 91 deletions(-)

--=20
2.40.1.606.ga4b1b128d6-goog


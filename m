Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2692160lfk;
        Tue, 6 Jul 2021 19:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKrJ0JJwt6tedHL+1BQoi1oTnOlcKfkFzwXbQPAz5agA/Fj6U5v2VVKfTDGLHn3u5dwPpH
X-Received: by 2002:a05:620a:1a9d:: with SMTP id bl29mr21761502qkb.352.1625624336927;
        Tue, 06 Jul 2021 19:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625624336; cv=none;
        d=google.com; s=arc-20160816;
        b=QaaNSovrG6SgHYK9tA7k5z0X6Z30FIQXnWkT4sL5NJNPB9Ox4zKQ2WOXsEbt5Jt2rq
         56r5ToD86A7dLTD+SKp3UJhDPoT2oSh4G99q8WQq/vqqxriS2kl9D5B0eLUWjXSGG3Fq
         xdR4WDAm+mtk4FyRnkRHx2AUsb0f/EqU+wGRUsVmrc12FH+4sRw00fvmQwsQt61xKeYq
         EIz0elSazp2E18dLIgoGfCEKiAJe17ge56UGw/kMZEZsS08+9q8j9UkW/Zfg2adT1Tmo
         87IM63VwK+yCEW1N/eEfMKO47dXpUI5AdOQJTK0MrYEmv/SRcH+Rdd2KXoJhQMjj1/A8
         FAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LlfYE6GosY6ASC/rsUukB4KR+vpFhOf0HuSrLzk2U+g=;
        b=FUbI2+wuI0h4wRNsoVzJmVLurvd6hjpy15Zeywus3uKqxowLRMHvQA8zoFnPpEdDjI
         2yqIFSPA3HEfwle4uc8fbF+0rBAEuoW/GaUYwM1vkM2dsK04ZcES68tDhKCuNd6Owf9n
         XrvIN5dWmhrEU1Agmcn3WfvjnquMnIv3WT20GMtUwrQrgWdwrtqQsg6AT4d7XE8oh9XT
         zHMfLH/3QTKnPVBjzpeKz85vIctBf4J6sxUYaTnbHKTKEQr12AEafCzZozWDuA/qNduP
         YhduW89CDXmfbytayRgGHFj90hs6g1YddOegUpp6AHbDkjmKfSyWZWtmpV2XTu8R3gK0
         lpiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XeBnAqjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si13347qkp.129.2021.07.06.19.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XeBnAqjD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0x9L-0000BU-7w
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x97-000091-Cx
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:41 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:39928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0x8k-0001NT-0J
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:18:41 -0400
Received: by mail-qk1-x736.google.com with SMTP id j184so481080qkd.6
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlfYE6GosY6ASC/rsUukB4KR+vpFhOf0HuSrLzk2U+g=;
 b=XeBnAqjD/CnU+Gt0WuQYZsOAhGSxzVCOsOiqLbjUDarcmy/I8Xb6FxLl1Vr9Va45CU
 2H6pdWOrujbIg2hdD1KLwM5g/YT/u1kpnyEOhNQxJDonkbRAf+js79u40nzQTI3fBme1
 2uwvcHm+z8GD4wfR0Rb03uUzSNiYFsIf+NLCg/+OSKJq43qmfQzqVwdGNzuLQ6sH9L/q
 obzTbt56hunJbuMfMaNTsKuMs0RdhMN2ebrdqi+QnyV+MNcMVMLlzl8fufxgnekdXQI8
 bT6Lvv07z/UddhkQlSRpXVb/nuEet3XjMa9EL2CWpQ0piwYjznBYCsMBjdJN4mKBtdO+
 da5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlfYE6GosY6ASC/rsUukB4KR+vpFhOf0HuSrLzk2U+g=;
 b=sEmLcXEqEOahEZfdwszWa2WrQmyLFD/YBaVQbbsMaZ7TD/bL0mQWX2EaAAE8oc3SdN
 l3f6DHjjvm4K+fHUJ2ybF8qmJBPQS3agnShbXZsVXiGfQDqrYUC4qVOXxLFDbKazUgXy
 zmYv7awt6B7wCqWuVchj24vGMjawBPHoPzrkHTKJ02CHZwfml0W/mc3H1XZWo8/Gr2qz
 yqRg8MxQro5B4jWdDk7or/pbIQhHMfmAPzGPZv2h6D4gHmBDIDxTDluw6TdulcohlANt
 3O02BdhAphzdFcjv8TVzyAnQIHLoJ67d4WWxK8VegM4maUOZPc9YMblvk0iagTVaQgMK
 iAfw==
X-Gm-Message-State: AOAM533WgqK6ucW4McTTes0ZR4cms7+xlJJosimS9q6KYMOkN5ofYQuF
 4/ZVZzTyu2n2InR4Mk6caa9vYg==
X-Received: by 2002:a37:ac14:: with SMTP id e20mr23303315qkm.362.1625624296998; 
 Tue, 06 Jul 2021 19:18:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id z6sm7768613qke.24.2021.07.06.19.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:18:16 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 00/10] GICv3 LPI and ITS feature implementation
Date: Tue,  6 Jul 2021 22:18:05 -0400
Message-Id: <20210707021815.45938-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F2alla1nYFQK

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to sbsa-ref platform as well as
virt platform,wherein the emulated functionality co-exists with kvm
kernel functionality.

Changes in v6:
 - made changes to masking scheme being used in all relevant sections
 - updated process_mapti to validate idbits based on GICD_TYPER.IDbits
   instead of GICR_PROPBASER.IDbits
 - updated its_realize() to check every CPU for physical LPI support in
   each associated redistibutor and return error if not
 - removed GICR_TYPER_PLPIS check in its_reset()
 - addressed pending v4 comments in gicv3_internal.h #defines
 - refactored gicv3_redist_lpi_pending() as per v5 comments
 - added iasl disassembly for new IORT.pxb file
 - addressed all v5 comments around code formatting and
   gicv3_internal.h #defines 
 - All kvm_unit_tests PASS

Shashi Mallela (10):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  tests/data/acpi/virt: Add IORT files for ITS
  hw/arm/virt: add ITS support in virt GIC
  tests/data/acpi/virt: Update IORT files for ITS

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   28 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1301 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  154 ++-
 hw/intc/gicv3_internal.h               |  189 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 target/arm/kvm_arm.h                   |    4 +-
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 20 files changed, 1771 insertions(+), 27 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

-- 
2.27.0


Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1235525lfb;
        Fri, 10 Sep 2021 07:40:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvSoYSyZFU4F3YiKgEBYLXQ2DvR0BoWLDN+OH6W3uCVJgTywchZIWabIb6zPDgbrc3k2FW
X-Received: by 2002:a05:6102:1175:: with SMTP id k21mr5759452vsg.42.1631284811397;
        Fri, 10 Sep 2021 07:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631284811; cv=none;
        d=google.com; s=arc-20160816;
        b=CRPz1Itfsv8DZndIurNy+1xIsD10n98GeCW1j2p6ZQ/w1vWw19sL7GhHOBJNuOrRIQ
         22MEgjYsecbnKrWa5QhBM0bWsMyJsBwT+IEwPWonZyH4dab2+T1Blt4KzS+y7zabkIAM
         fLxyJRVzqK78nGc2/4J6VKHyd4x0zUyurcSZzG38BJ5YXjb5MYqK4OyI4JD1aBzn5odb
         /T1r0vO77G1NN3EYvo6z0Frbg4hadhBGuPrInUm43V9804S8H711HpXwRcY0RVl5ja1N
         RA4tQA/QC3Xi5wQNkmWPf8/U/iVUzAOFTU+8vrvrDo69RcsvT1wsf8adPH48aXAOQAh2
         kSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=0tTLsJKlT08rbaA/jwVJCYtTXkiAqHHZeUBxFg8nz6I=;
        b=Nhw0VENtamjZroEN4OTDI4DF7PSGfGr2LRjViC0dD/MbWNHa9oMkFrwYHExDnRqS3e
         Kkc1nlQ4kNtoTzv2vXekSFB7MAjjbvCnVX/eD7Q+2Z8laR3JeIAOaR0QpE0JbNwmAcm/
         HwISJK/381ABBuK+m9peuh3BnxR7Xc+vgUQODNI7aDTalev6hxQrU0zodKq75qC/H0v4
         JS6Fpie8yNuJGSdIMgv5KeJKBSFl+GdV1AI89eZRQAEvsGnKoJgC/AE04cPmlJwxnmJ6
         /ms51mQ4UigbHua94+bUBDH8s98oCLzFEMP2BQYx4bcYYJWESDi0BZ0icYzki5ZDzR2D
         btKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MWwTCIEr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si1819435vse.121.2021.09.10.07.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 07:40:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MWwTCIEr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOhhK-00022A-MD
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 10:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh5-00021r-Nl
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:39:55 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhh4-0002qR-3M
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:39:55 -0400
Received: by mail-qk1-x72d.google.com with SMTP id c10so2137824qko.11
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tTLsJKlT08rbaA/jwVJCYtTXkiAqHHZeUBxFg8nz6I=;
 b=MWwTCIErsul4RY2HEFD8fKSLQ+fakFQLc/OkyWAe7uWioUu7P9wRCcjjNxExGuCWgu
 fp+9yiBSQY2JCV2yWgfTbxzhbJWp+u/0U6iR9ynCCgYaZPdsO4pBriOMEnBTCUGSgciS
 qVyUxIYO3OPfFRCKkf0PEWIE7Jy00H7gXi54+iM+CUHIZY/aAIpq92urZWZpmaau7fz8
 EfNSUpOW7LyS+l3urinpOW5N02ACYPM2ypzFIdMyjBnyHBYs5eNMtjNfZ+0geelweVmO
 3OsiFguk4PD8JVxCIo0BctPETgAnoTyeRijOUyLLWnerUMN5+2GizDKwuV/mEllRPxes
 nbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0tTLsJKlT08rbaA/jwVJCYtTXkiAqHHZeUBxFg8nz6I=;
 b=llrGryWxym0q09cO4VbrzftOY24yaOdmJOLiQ+nOSlu/Y1dsmhIaiXZxkXscH2NAYM
 UEYzbe/sH/dBf9aG31rIsbzP/91fFf3ry0N4zubkVMLelMfoHOuJdBTGwVEyJ5OosrQV
 9qsRMSc5RMDp0eYVWGvlwb8XU+EMR9xezsIVOO/+WgGRw8xWZUKqR7fhF3G9e8m/UNtR
 4YDzOsYA+s3qRaFA4JX6tUtQAs5lfqj/avk2PffTXP5QQ2mRFrEDO8e0iHRJAH6TxhRN
 7Vm4fvleClmERQsPXDDew9VX25X5AwsoqsYFXt8Z+PHRJ3lHt1ioEZAco5uMt/WuTkQI
 Xvlg==
X-Gm-Message-State: AOAM5300M3BxQdyQSNh5rklMG98qkOdgK1Hx4mUMafKUFhxnngqGHyCj
 YcczzvbKVYd624a3tjOEgPEK4Q==
X-Received: by 2002:a37:634d:: with SMTP id x74mr8013387qkb.453.1631284793032; 
 Fri, 10 Sep 2021 07:39:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:39:52 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 0/9] GICv3 LPI and ITS feature implementation
Date: Fri, 10 Sep 2021 10:39:42 -0400
Message-Id: <20210910143951.92242-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qt9+RGyq86Sz

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to virt platform,wherein the
emulated functionality co-exists with kvm kernel functionality.

Changes in v9:
 - removed sbsa-ref patch due to inconclusive ongoing discussion
   regarding ITS placement and version in sbsa-ref platform.This will be
   taken up as a separate functionality later
 - updated its enable code as per latest virt 6.2
 - updated its code to replace usage of MEMTX_ with bool
 - All kvm_unit_tests PASS
 - Verified Linux Boot functionality

Shashi Mallela (9):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  tests/data/acpi/virt: Add IORT files for ITS
  hw/arm/virt: add ITS support in virt GIC
  tests/data/acpi/virt: Update IORT files for ITS

 hw/arm/virt.c                          |   29 +-
 hw/intc/arm_gicv3.c                    |   14 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    5 +-
 hw/intc/arm_gicv3_its.c                | 1322 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    7 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  153 ++-
 hw/intc/gicv3_internal.h               |  188 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   13 +
 include/hw/intc/arm_gicv3_its_common.h |   32 +-
 target/arm/kvm_arm.h                   |    4 +-
 tests/data/acpi/virt/IORT              |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp        |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem      |  Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb          |  Bin 0 -> 124 bytes
 19 files changed, 1768 insertions(+), 24 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c
 create mode 100644 tests/data/acpi/virt/IORT
 create mode 100644 tests/data/acpi/virt/IORT.memhp
 create mode 100644 tests/data/acpi/virt/IORT.numamem
 create mode 100644 tests/data/acpi/virt/IORT.pxb

--
2.27.0

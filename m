Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3844863ejb;
        Tue, 19 Sep 2023 13:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFNFJEB+Rq51YAuAioWl0By93PX5op/G/lUGb7QaZHJmWUfPBryiuLI8wPtQrzIsZBGflz
X-Received: by 2002:a0c:fd83:0:b0:656:400d:9eb0 with SMTP id p3-20020a0cfd83000000b00656400d9eb0mr480036qvr.43.1695153914725;
        Tue, 19 Sep 2023 13:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153914; cv=none;
        d=google.com; s=arc-20160816;
        b=M5CkXF7iJnqBkGkQLrQy8gdvncVJ1iBZHrKe5HWUAJ2kEVrwB3fL9l2SYX5n975YRI
         tfvtybLJWXRGXqPNJR2Isuome/lKyoo7yR0cmHHAdDHOt8ZNm4hX3WlI0WDpei4hkHdS
         mvjjvV2p+pEnBgQsU22ft6Tj4TNoRJ7ZHOqnUZ3ACHhT6rjDZcRTOcGajSZ0vzgyyAir
         C/79/tKk/0KyUBIXuPxENbGQ6HfLf0VaHO3TNuSufTPZvP/GMJ35izhOb0bVZN1d8DC1
         NXnK47PMe54/ArnHuIt7tOnmhE+WUJbZ0AXl3amKbgZYe+htCOC/vRf8PcKDuEwm9Z1P
         GBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=qC3MQTBowPtZjmB7tHI6GO0FUxL12NNYhHDeMduCgnY=;
        fh=rqW8fspY+jkdnllEY/nhhmwU/Ez30a3FOJ93N6rRdoo=;
        b=X8ADFr0x+mM1IMZnsj5tditp2fdL2h7EfsXZ6/4JeZDYqmg9sBt6gqaiDKugi4rzsN
         H/X55GyYsfxxYRNhycETwKehxIMSmxNaDvgD9CYk+CffpD+fBfx319qu20J9+cw2oRyM
         mjESwADqg/Qsyf7edShfllt3+m9FdZwfYntGuZb+qMQZJlQu68FOUHvbbVL1IROixrmW
         WgSDCnhacNXKlBXDiMFzU4ygeaO1hRs1Wahm9vfcVVlduMgrnMiZMEu2F21RoAL36vCg
         PbiGHF3TBu7qW19bZ7ymjan9ktIUGV9up/ZtRf1c7/KiEBRyimZ2nHluD6x3b/sXz2Ck
         dhLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4tw9Pl5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn1-20020a056214130100b0063cd763767asi8429987qvb.232.2023.09.19.13.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=4tw9Pl5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qigxD-0005aa-HD; Tue, 19 Sep 2023 16:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C-EJZQwKCCQNABIHESTEFANGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--nabihestefan.bounces.google.com>)
 id 1qieyq-00055P-Fu
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:57:48 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C-EJZQwKCCQNABIHESTEFANGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--nabihestefan.bounces.google.com>)
 id 1qieyf-0000zw-LH
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:57:46 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d8185415dfbso6421125276.3
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146252; x=1695751052; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qC3MQTBowPtZjmB7tHI6GO0FUxL12NNYhHDeMduCgnY=;
 b=4tw9Pl5MI4jqthrMwkXYp5ScnpYaBqBpraJJ8+a0Qu89srOewPr/xpYKKpPIANSIyg
 ycsFUUIJJK3CmgckvLuRWMRWRfibZRE3yhYLjV5b8XTZ7oVAACVMgq2nG3qZxqp67hTF
 woZR+WY8uuTWvkwguUWfQuJP9u3SlSRrjg479zGS9k7KICmv4umVEJh7iDrEpPM2B89F
 fBji396XxgZRp3ttdEMSuRiZ4ZLMtmqWGekHl2uS8Ct5utcxOE2H4DS1bN/thp9lfgcu
 lo0zb1dNTBi+lR8hNBmVQCXeQ5HO0GHY7VidDTsH+KgeeeODTU4oUwiQ/1Hu4XxZGyE1
 UqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146252; x=1695751052;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qC3MQTBowPtZjmB7tHI6GO0FUxL12NNYhHDeMduCgnY=;
 b=XTc63peLztyBX4lMTyNaUe+Z71lPURixSV50w+TI/WKYtusk+olSC6HOLUGheA9iVv
 JSpPs9QH6X7I4rgBbqqGMd977Vw/ZtN6SlpjitoPe4HTvin4RC2p4Z70r9NCzmJfO1yx
 j6kkDKaBjauyBZXrhj8Oz+xrXp/dg/85BKl4bLY5RJC6uMi6jNTaCmaDzyIRY1xSmF/8
 egYShWe2goEeLhe+d+ZOu5shWbddDho8ruExzxA2mPMTV9Qx43Jin5RQB6QaeJNzGgPe
 zv4UeLoxMw+GJkXTke75vdAjSORsmpdrD3KcZI46j3aWWpRJmSgW03MSBSIlyiGkZz8G
 ChLw==
X-Gm-Message-State: AOJu0Yw5Q+k6EC2iB0375O8+EhM6qDznvI6K1LzQQBBCsT3ZNwqkd6NM
 cOqWAnmjCv2jXojQyRE5aI8Ke9nZxu6IC30t+T0=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:8ca:0:b0:d13:856b:c10a with SMTP
 id 193-20020a2508ca000000b00d13856bc10amr6341ybi.3.1695146251886; Tue, 19 Sep
 2023 10:57:31 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-1-nabihestefan@google.com>
Subject: [PATCH 00/14] Implementation of NPI Mailbox and GMAC Networking Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3C-EJZQwKCCQNABIHESTEFANGOOGLE.COMQEMU-ARMNONGNU.ORG@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:13 -0400
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
X-TUID: d5G+LkDvscXd

From: Nabih Estefan Diaz <nabihestefan@google.com>

Creates NPI Mailbox Module with data verification for read and write (internal and external),
wiring to the Nuvoton SoC, and QTests.

Also creates the GMAC Networking Module. Implements read and write functionalities with cooresponding descriptors
and registers. Also includes QTests for the different functionalities.

Hao Wu (8):
  hw/misc: Add Nuvoton's PCI Mailbox Module
  hw/arm: Add PCI mailbox module to Nuvoton SoC
  hw/misc: Add qtest for NPCM7xx PCI Mailbox
  hw/net: Add NPCM8XX PCS Module
  hw/net: Add NPCMXXX GMAC device
  hw/arm: Add GMAC devices to NPCM8XX SoC
  hw/arm: Add GMAC devices to NPCM7XX SoC
  hw/arm: Connect to chardev backend for NPCM8XX

Nabih Estefan Diaz (6):
  \tests/qtest: Creating qtest for GMAC Module
  include/hw/net: Implemented Classes and Masks for GMAC Descriptors
  hw/net: General GMAC Implementation
  hw/net: GMAC Rx Implementation
  hw/net: GMAC Tx Implementation
  tests/qtest: Adding PCS Module test to GMAC Qtest

 hw/arm/npcm7xx.c                    |  54 +-
 hw/arm/npcm8xx.c                    | 904 +++++++++++++++++++++++++++
 hw/misc/meson.build                 |   1 +
 hw/misc/npcm7xx_pci_mbox.c          | 323 ++++++++++
 hw/misc/trace-events                |   5 +
 hw/net/meson.build                  |   3 +-
 hw/net/npcm_gmac.c                  | 937 ++++++++++++++++++++++++++++
 hw/net/npcm_pcs.c                   | 409 ++++++++++++
 hw/net/trace-events                 |  20 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/arm/npcm8xx.h            | 118 ++++
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 342 ++++++++++
 include/hw/net/npcm_pcs.h           |  42 ++
 tests/qtest/meson.build             |  12 +-
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
 tests/qtest/npcm_gmac-test.c        | 342 ++++++++++
 17 files changed, 3826 insertions(+), 9 deletions(-)
 create mode 100644 hw/arm/npcm8xx.c
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 hw/net/npcm_pcs.c
 create mode 100644 include/hw/arm/npcm8xx.h
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 include/hw/net/npcm_pcs.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.42.0.459.ge4e396fd5e-goog


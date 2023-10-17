Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4255337ejc;
        Tue, 17 Oct 2023 16:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdnJHZRry6Bz+avCCp03SWpuLmvzgxYEfaE/7jxjYOGt/dIhgx91R2eLIKYmxOGPcYpPdb
X-Received: by 2002:ac8:5887:0:b0:415:15bd:94d2 with SMTP id t7-20020ac85887000000b0041515bd94d2mr4426666qta.43.1697583882196;
        Tue, 17 Oct 2023 16:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697583882; cv=none;
        d=google.com; s=arc-20160816;
        b=Yp2nD/r/qPkyeljPI5TXLcgaurjE0ZFOIL0O3Jq5oyAZ8uiKuiZ/hKTf6HzT3tAmnf
         Zw4/uSDnuN9Ft8MQ3osUIeHhYoo/sapopt+Z4M1kT+7BOf0jxaW1JpSOkCFm//ucL+1P
         +dFoKLGGEXn1KnKzp87REnZtNyH6JP/qogt6BwuXpWjxQc1EEMcn3N82sbrreRevfFX6
         897VFwTS0cLLL17pZuv5szzxjkakONnp4/gGNx822YrTXE6BlqcLNpkFleYInWbUrFAC
         ItDmO4xX+WX9+4GQnxcloi/+RhVFYg7hssKfp4zwwd8X7rTw1hc+YGu6tI1e851MJRxv
         OSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=ZtnZX3qq6VUqd48mODDcHeavJ1fpcDwaSYbnpD75Hjw=;
        fh=5A9rIZi8Z8466MpVipzMSDtnAN6Xw5wyWrNfaUwsYuo=;
        b=sz/ts/9ryL+2ucJOjDYVdp2h8XdHwibv0GhO7fSSJbspV5ejtJsuK9cHjtbnHsDeHA
         7dbppbKLFe+UGVygosqbZhHpOkA6JKOLInyGROKmFHB0j0Avy1eRRazbB9BhkFJm0fu6
         ateXtbfWr16DBykxhgdAxFyhBOdb/S/5opEnUZtYBG7ZejC1tclR15E5H5WjNK3BAipv
         Cc8UJYm2gm4njLjmZPOOUmO0LuytfggtPdT4wRxn3v+O1ZjltKSUcnY+utDuk08ifXCz
         g2EsvhaIQ6MBnEa/QyLmUiSnx5l/fi8WufMFR96K2PEIabh/aE7Sywloyqr39vHpYeCK
         NxTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=vfadcReX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020ac85c05000000b00403332e2e31si1772399qti.559.2023.10.17.16.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 16:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=vfadcReX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qst6U-0005uE-KT; Tue, 17 Oct 2023 19:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32BIvZQwKCOkYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1qst6T-0005tZ-57
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 19:03:57 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32BIvZQwKCOkYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1qst6Q-0002I1-KB
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 19:03:56 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d9a39444700so6143030276.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697583832; x=1698188632; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZtnZX3qq6VUqd48mODDcHeavJ1fpcDwaSYbnpD75Hjw=;
 b=vfadcReX9k5MH8ecjANc/H/A8zXpvEAchLiGqMSzCrwacCsTDoRXL9avk6u2HeSqAX
 yqKcAlV0/KsLT63DQ578TMnpVRcSqLXoAm4WhInxwrHZWt07ED9NFbl9rFz+O7e/LEBM
 nExtg3DbJZkulAWGhe2GTryA3MCi6iHZamBlejTO3p/Gkz+zw5/yp9iHvC9b1lv18l0l
 M1xErRpUvsqmLSwAciad+FJijG4bW2zs74JwYUr9NnfvDlFIyZmrDYfondKHaxQESBNu
 fd84vwnYHW8Lq6HNrZdA3KmeMrcW+Eyu9P9H6Z1cWtXmNMKs14Ys6BglzjGeMahuqpzz
 5B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697583832; x=1698188632;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZtnZX3qq6VUqd48mODDcHeavJ1fpcDwaSYbnpD75Hjw=;
 b=tvow3QdwNhIsQrwpNxYdb0S11gPGDewST9mpTYApUmnD30BDYjjk4fjszBqzUH2xQg
 WapyoXWzkWuEIVRavHxqr4YpLMR+RwOcii5fbv2ZtnYXbvaE0uNr/fNGYHIxeild0/IX
 MGD8TXC336w/IYTMx8qbena5Q72hMhfriOhe33pzCzpzyoVQ/mDz6LSESkn8kHLpA2r2
 nBli9T7t+v2/aoLY9ekqOi/CFHi2NI7fEIp+CQRPjw122zd2tXEzteHYC6lTuY9kMU/Z
 p2oiMWY+ikK6FnRXjktCL1bmFX3vHIftd0VNWrZ86EoFcK2Xk1zZOQf9aCWhMS3j96eR
 JpsA==
X-Gm-Message-State: AOJu0Yw0Ou9sQlT+rVeZNJ6Uh2JchmnbYSoR6zYua2piIXoLPkk7SUId
 M5nPO7Is7joAUyk4MEfbDd+TBQGhLFRMn2MaFiA=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:b16:b0:d9a:fd4d:d536 with
 SMTP id ch22-20020a0569020b1600b00d9afd4dd536mr83747ybb.3.1697583832692; Tue,
 17 Oct 2023 16:03:52 -0700 (PDT)
Date: Tue, 17 Oct 2023 23:03:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231017230342.311227-1-nabihestefan@google.com>
Subject: [PATCH v3 00/11] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=32BIvZQwKCOkYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: JJh6V5BtVJBz

From: Nabih Estefan Diaz <nabihestefan@google.com>

[Changes since v2]
Fixed bugs related to the RC functionality of the GMAC. Added and
squashed patches related to that.
[Changes since v1]
Fixed some errors in formatting.
Fixed a merge error that I didn't see in v1.
Removed Nuvoton 8xx references since that is a separate patch set.

[Original Cover]
Creates NPI Mailbox Module with data verification for read and write (internal and external),
wiring to the Nuvoton SoC, and QTests.

Also creates the GMAC Networking Module. Implements read and write functionalities with cooresponding descriptors
and registers. Also includes QTests for the different functionalities.

Hao Wu (5):
  hw/misc: Add Nuvoton's PCI Mailbox Module
  hw/arm: Add PCI mailbox module to Nuvoton SoC
  hw/misc: Add qtest for NPCM7xx PCI Mailbox
  hw/net: Add NPCMXXX GMAC device
  hw/arm: Add GMAC devices to NPCM7XX SoC

Nabih Estefan Diaz (6):
  \tests/qtest: Creating qtest for GMAC Module
  include/hw/net: Implemented Classes and Masks for GMAC Descriptors
  hw/net: General GMAC Implementation
  hw/net: GMAC Rx Implementation
  hw/net: GMAC Tx Implementation
  tests/qtest: Adding PCS Module test to GMAC Qtest

 docs/system/arm/nuvoton.rst         |   2 +
 hw/arm/npcm7xx.c                    |  53 +-
 hw/misc/meson.build                 |   1 +
 hw/misc/npcm7xx_pci_mbox.c          | 324 ++++++++++
 hw/misc/trace-events                |   5 +
 hw/net/meson.build                  |   2 +-
 hw/net/npcm_gmac.c                  | 942 ++++++++++++++++++++++++++++
 hw/net/trace-events                 |  20 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 340 ++++++++++
 tests/qtest/meson.build             |  12 +-
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
 tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
 14 files changed, 2356 insertions(+), 9 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.42.0.655.g421f12c284-goog


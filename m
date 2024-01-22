Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2639045ejg;
        Mon, 22 Jan 2024 09:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC+WH/X/piKG3dztb3jW5M+5xrHUqaF+iYDhN31TiIFt2SFaznF0yC4ISNWh8HWXpia6wh
X-Received: by 2002:a05:6871:e407:b0:206:b32f:2432 with SMTP id py7-20020a056871e40700b00206b32f2432mr277675oac.90.1705945051783;
        Mon, 22 Jan 2024 09:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705945051; cv=none;
        d=google.com; s=arc-20160816;
        b=SJ22lykAf0wGInjopZID36CFULpp3t3WY035e3cRWGGgpK8M2KXaG0jDbqcEDblzPy
         HeaUO30eypaduW5zkVuaPey1+kA7ChFQTKMRbmuHhOGYFye1vCwv0h61dcCq5+fLCJUf
         0iVtOH6wLjFKX+zNHw8/+eX5JUqbdIUqssgIcn1O/OiesO5m7uP4phvZTNLxyKGOUM5s
         lam5nYPC5tIgaLxGuQSn1g2qSxFczYYyAP4S2cWATPEW3e3n6HnO2iowtu7SW7JMwY6/
         DcOzEBzD7BvpFIZiyM11+iSEio/q/E5z3/ZdEZtD1bsBI4JMWizniKu40bzI4lAD0Rd4
         WDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=ZzqL8rbFgUPnpBxBgJ03nVh6SDRFRBdTMzc/DkWk28Q=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=d9OjRL4s0ts0wS2AbooBh9+xLbZk4cTJB8ExcCgSjruWfZiJrRfA7iQXHonkHgSgkJ
         uYFA4j2zDc2w6UhXk6TGRPXGEuUx1g50F90fExZL43BsNRZnCRqBrhHtnjV7VKZcLsJS
         GQ6gNi1tbmXkBPTfo906Q1/+732ummaVmUJt45EopZpOsHP8b75edh5A8tt1KppfpKof
         R41YlZmbrTd9+ll+JkmklHyT2QvkfyBZwHHGSEYJklItxmUjrLXd+TG+5CsZMOmFshm4
         3XlLtHvvWRAEcU+/WW5a8jO6jORfsg+PeT9GCgZKPvZ1cOWI7SneasERji99sWNyDvlm
         r0cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OSBkO4gI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05622a020500b0042a3274a0ebsi5353547qtx.758.2024.01.22.09.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 09:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OSBkO4gI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRyEY-00005q-4L; Mon, 22 Jan 2024 12:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x6euZQwKCAYtghonkyzklgtmuumrk.iuswks0-gxstutmt0.uxm@flex--nabihestefan.bounces.google.com>)
 id 1rRyEW-0008VY-BV
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:16 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x6euZQwKCAYtghonkyzklgtmuumrk.iuswks0-gxstutmt0.uxm@flex--nabihestefan.bounces.google.com>)
 id 1rRyET-0003wm-1X
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 12:37:14 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5ffac5f7afeso28576677b3.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705945031; x=1706549831; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZzqL8rbFgUPnpBxBgJ03nVh6SDRFRBdTMzc/DkWk28Q=;
 b=OSBkO4gICD882NnKkKlWNaGlf9XaSkGRA12iIipGptIDi+C9EWdA42AH+N8THaQZuy
 WApCzFRoOP1chkagPktCyPunPEf5Q0t2yiZxTjXfKY/n982HW+Uf6POccMLHHSb4PFMH
 b7nzl1XI8VYrzMU1EATUyIh7klmmUhv4a94KAGg7mEhDUeFqlwSLyVtzW97mO0omheJL
 sQMVTHNj3LZiJoDxqrpmELprFowU0LccLvx/aSFhRgS56tKWIPa1YuYhgVEQVPYW3Ge7
 6c0Tit+chJZquemlmT55SOyqTv1KoqhCMCFDruX4z6Nh99I6WP+g1CriFpkpykrjLBop
 JQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705945031; x=1706549831;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzqL8rbFgUPnpBxBgJ03nVh6SDRFRBdTMzc/DkWk28Q=;
 b=NBjh5iorHeVEdI7LJ8TK/LmgBzb7QhOWhmnHJOKdWhBnxOodCaC5eFwQN7mKPm/FgT
 JVaifwhrjuVr+klpiV6NnJMuTBh3EDkvlPGPfABAz0zck+xpvjfI/zd5qPYqpjrL1//z
 MY/ZHFVJ5bRCIxx7qpsf29qCg6P7wN+ZDbtOZjbihO+FbSVqyGWMuXebZ/iBTMgxiDZS
 3HzUQStivd6e2rS3U5fOXLRTvcDtyxTpXB+K95NHe6arPNMMO0gxZd9RF+ZubSMPWRca
 6x17EGYwd/3OlIPHvSSgBKhJOetawx+pOeyQFW+c7rDEhGC6nKS63LDQ6woN6HLBMRMw
 unGw==
X-Gm-Message-State: AOJu0YxXZJ1vMqAb5YJ/kIxmm897LvF5za04vpcJt2q7ytFUhuiP1ZSo
 GJ1CR8qZGAaMJE/OvcOPCzO9vSCgTiS/U9DG9ozBeFcPH2Mh6J+jz7aFkP/j62PmtbdTbqpwrWe
 R/eYnaYLWKqM0bOBOM4t4SqzDTw==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:9ad5:0:b0:5fb:7e5b:b87f with SMTP
 id r204-20020a819ad5000000b005fb7e5bb87fmr2259354ywg.1.1705945031142; Mon, 22
 Jan 2024 09:37:11 -0800 (PST)
Date: Mon, 22 Jan 2024 17:36:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240122173706.4019545-1-nabihestefan@google.com>
Subject: [PATCH v14 0/9] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3x6euZQwKCAYtghonkyzklgtmuumrk.iuswks0-gxstutmt0.uxm@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
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
X-TUID: dyRG8FW5uNPk

From: Nabih Estefan Diaz <nabihestefan@google.com>

[Changes since v13]
Added a couple clarifying comments and documentation about chardev
device expected protocol for ease of review.

[Changes since v12]
Fix errors found when testing in big-endian host.

[Changes since v11]
Branch couldn't be merged with master because of issues in patchset 6.
Fixed.

[Changes since v10]
Fixed macOS build issue. Changed imports to not be linux-specific.

[Changes since v9]
More cleanup and fixes based on suggestions from Peter Maydell
(peter.maydell@linaro.org) suggestions.

[Changes since v8]
Suggestions and Fixes from Peter Maydell (peter.maydell@linaro.org),
also cleaned up changes so nothing is deleted in a later patch that was
added in an earlier patch. Patch count decresed by 1 because this cleanup
led to one of the patches being irrelevant.

[Changes since v7]
Fixed patch 4 declaration of new NIC based on comments by Peter Maydell
(peter.maydell@linaro.org)

[Changes since v6]
Remove the Change-Ids from the commit messages.

[Changes since v5]
Undid remove of some qtests that seem to have been caused by a merge
conflict.

[Changes since v4]
Added Signed-off-by tag and fixed patch 4 commit message as suggested by
Peter Maydell (peter.maydell@linaro.org)

[Changes since v3]
Fixed comments from Hao Wu (wuhaotsh@google.com)

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

Nabih Estefan Diaz (4):
  tests/qtest: Creating qtest for GMAC Module
  hw/net: GMAC Rx Implementation
  hw/net: GMAC Tx Implementation
  tests/qtest: Adding PCS Module test to GMAC Qtest

 docs/system/arm/nuvoton.rst         |   2 +
 hw/arm/npcm7xx.c                    |  53 +-
 hw/misc/meson.build                 |   1 +
 hw/misc/npcm7xx_pci_mbox.c          | 333 ++++++++++
 hw/misc/trace-events                |   5 +
 hw/net/meson.build                  |   2 +-
 hw/net/npcm_gmac.c                  | 939 ++++++++++++++++++++++++++++
 hw/net/trace-events                 |  19 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 340 ++++++++++
 tests/qtest/meson.build             |   2 +
 tests/qtest/npcm7xx_pci_mbox-test.c | 242 +++++++
 tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
 14 files changed, 2360 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.43.0.429.g432eaa2c6b-goog


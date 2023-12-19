Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1779209eji;
        Tue, 19 Dec 2023 13:33:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw3LgqKUoqDeJMLxGAHbQ9gY7PbVGYtbz6ZTWoTklgUEEGOGZ5FcatHKllsmTVAvKy4eg0
X-Received: by 2002:a25:f825:0:b0:dbd:986e:2e9f with SMTP id u37-20020a25f825000000b00dbd986e2e9fmr408000ybd.91.1703021617950;
        Tue, 19 Dec 2023 13:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703021617; cv=none;
        d=google.com; s=arc-20160816;
        b=NHlhn0tL/1VI3W4YmPddRoq1ATbFwKuzjfY6guwJSCcD6i6LGoD1vlbDVkWYRETPpU
         qshCyZHFGG8lgYPZwhyDQyRelMk6oY5Z+LOEFSGgdfMXhaUKwhEV3yP3ZWUm03LvPa0O
         zcfQtYs/hPKYhOWEx4t2SjF1+BjUx8GvWbwaCqec7SlPg9L0IIJOZO47/jywXOFxVNQH
         GfTcn+7AbSOvNJY6v4YTvmlcNDoGPb9WEDK9LqbIYZiNahseZt6xauDEPqjwFNj2Z/T5
         sifq2+RbKiUI0KnuTEJwpKW/kRReDi9lc2jWDbfFUPiclTPs1rnsZDgVNssTkRK88+nA
         /5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=zoEjLflwDhHYM/fLDGw3tJfFeJRPZlzGNo4WDPgRHZc=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=GCv9E47aTEztmpOdzGFxmgLJLmvR9SVhEHMm68e7Gy1HE7/sCZP1azDOUeTSpgIT5M
         1sSaQHZrghB8+BEjfi44/AR6rhA5YTpOXN//6K23cq7UDT7V2GytnI8Kh0Rq10ZMtuCm
         F27qanQoBxjhIdFUcshiAzicA0KGeYfk51XCrowxwrSL2jGw7KAoHh7eXFu5ZnR7BJ38
         5TCdVl8vRRK0n7ZJIEK1SVsJr2F/6sWYqXyU7Ife6rKqn3fI/BJ9rpFe7t1MxOAXEKpz
         LQAKAPnyIoH3N1/CrO+I+2HSAtOzQWTRxjw5quVQ6tIeTj8FzEkb/F0JzTowSAsElam3
         TdfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xrTPFosK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020ac87c43000000b004260e7cbe50si11646827qtv.504.2023.12.19.13.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 13:33:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xrTPFosK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFhiJ-0007QN-Ul; Tue, 19 Dec 2023 16:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3FwyCZQwKCGoVIJQPMabMNIVOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--nabihestefan.bounces.google.com>)
 id 1rFhiE-0007PI-Pi
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:15 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3FwyCZQwKCGoVIJQPMabMNIVOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--nabihestefan.bounces.google.com>)
 id 1rFhiC-0003sE-SY
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 16:33:14 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5cb6271b225so65267857b3.1
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 13:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1703021591; x=1703626391; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zoEjLflwDhHYM/fLDGw3tJfFeJRPZlzGNo4WDPgRHZc=;
 b=xrTPFosK6hIijvhpA0egZj04fuf5wqrTo3kCaVONZkfw9FDOHY1bJzE/G0ZNEaYUXo
 biSFY7qxYEW6sLD6+sIs3i1hGsWMJ7Os3SAh0AsqhmHrzP5IsOrxIyUNzkyf8xo29ZYk
 ruYZ7J393h8+FH0I70O0F2r0m0T1bIo3yJwzFy2dwi7BlKNyBSzXjAcG4evl9Sx6FGYv
 BTSmNnnCsBiGX7nXCPcHfXfzAHrGffUvm3U/ci7o3NNc6sfB+oiAFZNKzHyEpol+qyLK
 Semyw+OFrR6na7rUHaqWmaabTGIsMYl3hkfikwnTeZCr0l3wisrDBstaDvaHzvjAaifn
 j64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703021591; x=1703626391;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zoEjLflwDhHYM/fLDGw3tJfFeJRPZlzGNo4WDPgRHZc=;
 b=N+g+HVNXTPfNf/k7+VpL1/QHnGc2NeF0JN2PvnI7JH91BaE43joF5Q3EZFs8XbOKXg
 UdTsyr0D/5Te4RMsjsCvwWl0VuHRn+HuNfv0NN7wW1F5CcAtxA0Xkuu+F8wUfM/0lnkS
 6Jb343ehmmsHbWPPolEi9rGKRBDwaR0N9LwiD1vHQbthULkBZIEoNHOjoRfJbTL0TY7f
 w1k53zPcrSZdHyvVRgMh1Mw+0J2wx/OZTYlUgdHIuo9a7w0P0sH7tVbTvVwZzFIXAe8b
 LfHZN6xHjAg7PMKxjgFFchQvl8sUwsohlPxFfwh5nbNgEnbXEG2WViLYs+T/GLPdx0vO
 qVhA==
X-Gm-Message-State: AOJu0YyXErki8hvr3bPPaA0YD3NZgC6a7VahVfQvIX0G04tyH1/W24jS
 XtAnWTcQo5tB1qMxOLlPbC/rdsd1izkWi0OK9a8=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:98a:b0:5e4:35c2:fd37 with
 SMTP id ce10-20020a05690c098a00b005e435c2fd37mr3297655ywb.6.1703021591239;
 Tue, 19 Dec 2023 13:33:11 -0800 (PST)
Date: Tue, 19 Dec 2023 21:32:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231219213255.604535-1-nabihestefan@google.com>
Subject: [PATCH v9 00/10] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3FwyCZQwKCGoVIJQPMabMNIVOWWOTM.KWUYMUc-IZUVWVOVc.WZO@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: bqwhqME/8fFD

From: Nabih Estefan Diaz <nabihestefan@google.com>

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

Nabih Estefan Diaz (5):
  tests/qtest: Creating qtest for GMAC Module
  include/hw/net: General GMAC Implementation
  hw/net: GMAC Rx Implementation
  hw/net: GMAC Tx Implementation
  tests/qtest: Adding PCS Module test to GMAC Qtest

 docs/system/arm/nuvoton.rst         |   2 +
 hw/arm/npcm7xx.c                    |  53 +-
 hw/misc/meson.build                 |   1 +
 hw/misc/npcm7xx_pci_mbox.c          | 324 ++++++++++
 hw/misc/trace-events                |   5 +
 hw/net/meson.build                  |   2 +-
 hw/net/npcm_gmac.c                  | 943 ++++++++++++++++++++++++++++
 hw/net/trace-events                 |  19 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 340 ++++++++++
 tests/qtest/meson.build             |   2 +
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
 tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
 14 files changed, 2351 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.43.0.472.g3155946c3a-goog


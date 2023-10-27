Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp378226ejc;
        Fri, 27 Oct 2023 10:56:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7YWUPwluI3KGx0HEhDXTN9VRq9NIIDexSaHC1rDsQihspetHG7CWfnpUaHO6sSkWooMM
X-Received: by 2002:a05:6214:401a:b0:658:c75c:1946 with SMTP id kd26-20020a056214401a00b00658c75c1946mr4564032qvb.52.1698429363321;
        Fri, 27 Oct 2023 10:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698429363; cv=none;
        d=google.com; s=arc-20160816;
        b=fLBcVDmRC3JM4Q4VQ4VNGdhlDy1x/Z7SeSwaA87ucEnjpZ1JdjYVipghZsmMCUqVOV
         yMK/+RHC3wtDMaXI98pX5TfWY/0/mxsttEMm5aH459hF2wmct5BlkfKEA3LBrmUbmWFt
         yedBExNV/zDfOxfcFuHWwaD+xK0D6bQ1DstcuwAXtokiEScPOfExzlQDAREg+PLceinr
         FiWHPxNoo+Pqri7iW5xc34EN4BHB34hcDxFCgcT5AtfdIcUb5iVUfQFh6usqqedQa998
         yNupEpEYRq5PPXH6Z5lPpRdRL3h5IAAOD/uPN8FnQkeow4pJS83pDjxViRAgSSKwyVXg
         vSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=f/zHwvZvQKGDpS3Vwsu8URM4wG++XiSdS9L3QRhTu+I=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=u8WXJJ7SljTMrTO3k62cFyRQqrfttx8pPYJ/jHBRWsGBu54QapRxGW6aHtUHx0NxGf
         EJqsCGemovVIyz+PuQlnHeX8FOENBu0M6gX02GpuQMsKH7XbcvCQ3UETwil0shxFa/3u
         BP8AHsxzyARz4oiFPeJJAlu7x+N63DsvV69ABPsmXGaVAcugccbGY0XE/DzEVrgs9L79
         S+nUTqRGWq6emOqnXuEHQbRLNIwm2dw8os1EBs/3sOQVMxdtInZbgINF91OPPeFMTXo8
         dIQ69S51a9OPYUH3kmW853n5Hv2BOGnGzti4muvycCvuwFLlhnTYCO2ndekL/T9/wKgy
         U92g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=kPl3C3pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a0cdf8a000000b00656262151b7si983565qvl.256.2023.10.27.10.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 10:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=kPl3C3pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwR3f-0006Mm-5x; Fri, 27 Oct 2023 13:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mPk7ZQwKCKsYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1qwR3d-0006Lv-Iw
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 13:55:41 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mPk7ZQwKCKsYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com>)
 id 1qwR3b-0007hs-F0
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 13:55:41 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5afbcffe454so11531357b3.3
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 10:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698429336; x=1699034136; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f/zHwvZvQKGDpS3Vwsu8URM4wG++XiSdS9L3QRhTu+I=;
 b=kPl3C3pelTb7IJhp4nkgOFNJxI+IkzI+81UzT0/q5EBGfEfCmZdPHLlM16PIgNO8Gb
 90bFxB/L5jIP3H1Tspauy5pYby0MKPe8wWsF1OkAcRkGenE+YoGuzy2xPIfGRaMNbkcD
 ITtVxApVYaykElNT5Yn7lACJkmycrBZeuRHWMSk9RZbZH5EyLgeyQoDTaNApQXdN3TTt
 xAjrLk7AOzs3VYTb5iKFk/e5g4NiOGr7TvnAOpikwZ3/T3T4q9kVtk8Jkq3+XVtJXm7k
 gQ95HI0k9g21DYtvNyXMpvQfeE+C5qBuJpm8OSQxAzVxDwRY8YgH6bDOtP5kuRmEW1Hp
 mNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698429336; x=1699034136;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f/zHwvZvQKGDpS3Vwsu8URM4wG++XiSdS9L3QRhTu+I=;
 b=XcUpBtlfRlk5sKG1NhQJbdbWtoDja5tuP7bJs+n2XuxPrRdCAFgnv4sayW2HSuKnHQ
 PrSxU8J6xGHp/VbtvgDtphHFEJxG2ObgNNwCIpo+dUHWE4uiP5EexKeJN2ZzKEzKIU9n
 KrhjxsToNte6kXn8wKcRbvD/LSEUOgNywSzonvyFHGYgNtymXR76gE/ev6XgOYQMnXrd
 dU6bIpub+Y6S+IzG0+W2ztxQ0FXUzGR+LU6+8jY0rH4AivGg+TWC7bE6IeonTTg3476J
 AfyxoUQjD+j+LOpZhSSI0kFuebbAfw3FhchzNt2BMXrnhczOPOWHyMzYadCqUjqxWZfN
 R0VA==
X-Gm-Message-State: AOJu0YyX38jcqNzeytuT+MEkdSeWOnuEGvmcpuHH4A4pm+L1tyJHeh0l
 ETfpDkd4IwlNIMluYP6VYf7TWWZCOZRklfrBgOc=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:a151:0:b0:5a7:b9b0:d23f with SMTP
 id y78-20020a81a151000000b005a7b9b0d23fmr71868ywg.6.1698429336502; Fri, 27
 Oct 2023 10:55:36 -0700 (PDT)
Date: Fri, 27 Oct 2023 17:55:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027175532.3601297-1-nabihestefan@google.com>
Subject: [PATCH v5 00/11] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3mPk7ZQwKCKsYLMTSPdePQLYRZZRWP.NZXbPXf-LcXYZYRYf.ZcR@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: AVVNJEoJ2+6E

From: Nabih Estefan Diaz <nabihestefan@google.com>

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

Nabih Estefan Diaz (6):
  tests/qtest: Creating qtest for GMAC Module
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
 hw/net/trace-events                 |  19 +
 include/hw/arm/npcm7xx.h            |   4 +
 include/hw/misc/npcm7xx_pci_mbox.h  |  81 +++
 include/hw/net/npcm_gmac.h          | 340 ++++++++++
 tests/qtest/meson.build             |   8 +-
 tests/qtest/npcm7xx_pci_mbox-test.c | 238 +++++++
 tests/qtest/npcm_gmac-test.c        | 341 ++++++++++
 14 files changed, 2351 insertions(+), 9 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.42.0.820.g83a721a137-goog


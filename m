Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4109836ejc;
        Tue, 17 Oct 2023 11:12:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbh20CosQj0JE4yA85JTyx/HDWc0QflfItlpqxQ/Id1X+mS7IiYTXUUi+tZvRY5Aey+qLN
X-Received: by 2002:ad4:5aee:0:b0:66d:1d4d:5a2 with SMTP id c14-20020ad45aee000000b0066d1d4d05a2mr4033177qvh.38.1697566328952;
        Tue, 17 Oct 2023 11:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697566328; cv=none;
        d=google.com; s=arc-20160816;
        b=fF+ilhaegIuDpsY7Q550MkekkVkzPjA8s33AIyGAWUaG1cJgHXxkOiKGY8KKel1yKu
         w2p5/ks2d5bA8dm6QXJBwMs62PnUoFHCp01M+QJgMzvJgLIT9ymVWq3TxYaCJXD8RPha
         xzzMcxWifa6/sMkB/ldML71fK3VYqwC85Z7Rx7C5yuZoK9FDJAo2U/3HdykJn047hbxR
         LdaSENhR1mN+gr4Et2JvLZaJ4WxegB55QSaGh2SibVlKPlXJCkLcEdNSJAfo44kGZEC+
         qfoKsEGrun0qqvbCU2NTAUyQG9WjUVWIdVkEIxRykYDNYuyOWJms3k1R8sS8ZQdJp5JU
         Q7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=ZtnZX3qq6VUqd48mODDcHeavJ1fpcDwaSYbnpD75Hjw=;
        fh=5A9rIZi8Z8466MpVipzMSDtnAN6Xw5wyWrNfaUwsYuo=;
        b=tdA1jHaXGwvsXk04CPmy52Tmoqzb32KcptPGsQI+cYld5j2vcCj6ecL0K9jD3F9IQT
         KlgVO8sTbYx9ksvCGqe450W2jDHA4CKROWZKV9U6emw8e0AyxqFkMondZzKwCXUJJp6Y
         1Xy9wTJXtD8O5uOaa7H0Apkn0oC+a1Lyov2a+LPKbiJpBTQJM9wIJhoB3WdJvTSjeDq6
         H1qpLlV0rR4yqx8YMeR//ICTZCJGNfHUTUhdc4eNTGYXIwGJ18MBr9007AyPomEaq+PH
         QDftApoRpm8CS1EKN64vLcoJsi8qMt1QcFK9PsF7R9iK6EfSh4n32cTDK7wBfrPuqk5b
         CGew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="SIIQd9/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a0ce20a000000b0066d20b83677si1398945qvl.119.2023.10.17.11.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 11:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="SIIQd9/J";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsoXy-0004pT-VF; Tue, 17 Oct 2023 14:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3bc4uZQwKCPQjWXedaopabWjckkcha.Ykimaiq-Wnijkjcjq.knc@flex--nabihestefan.bounces.google.com>)
 id 1qsoXx-0004pK-Bc
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 14:12:01 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3bc4uZQwKCPQjWXedaopabWjckkcha.Ykimaiq-Wnijkjcjq.knc@flex--nabihestefan.bounces.google.com>)
 id 1qsoXv-0006v3-KA
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 14:12:00 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d9c6ab06242so654655276.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697566318; x=1698171118; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZtnZX3qq6VUqd48mODDcHeavJ1fpcDwaSYbnpD75Hjw=;
 b=SIIQd9/JertoOoUk/qNbajWt57u9rekSWhOunIPEKT16bXYyzuragI6qw852kVEW80
 See7aVVn0Q8Mzf4Vb5ZkjAWebtJ7Qu/hbmovulCKrN85yuhbPkgkObu2egO0U+UJGIfy
 4BaWT13g9gF6j7mbPHsDoZVXI3S9oHIGMEHkG7snmdj6SLofdUpgF6WJxxXo1SU6rmce
 ZADD4+0v4IK7Cszp6amdHY8hAO5uWYpW0Np4URbJmI4+GFKWbUb19N6ikdvkekk93yAh
 4ZQyG1EZF6q06mvDanKHX0/Pkhw4mqFjNBwMYA4nXxDnXeIwnXo/QC9HbFA/b/JyWE21
 E7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697566318; x=1698171118;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZtnZX3qq6VUqd48mODDcHeavJ1fpcDwaSYbnpD75Hjw=;
 b=vW+mzVVCvwGhjhefhWxjChXcCFvs/VpbtwtGnCY/RuunQUeEgR3ZKh/5DxS0JkEd1X
 pPUT2TKOUDaoyQA39xuj1d7S57AcJQGznI/oNfTYDV+Uax4nCMbvzuV0UrqdVs6X+jRe
 y/5MYkfoGYI+YTBY6S7g/EULrUZQLo9JktVI95/eN45B14lnHrwc9TQNmnqBxjQOpCRs
 F6RQ+mxuXmKMfkghUY2IYvr4eIn6BkAhlmGKQtd5QgbfDKvX2ePdOjZXOp31gCtH9BhF
 2wx9sbLZ9xze4mthUgjnnc/gRoM8htNJy8xFAv6iFpzJlSOCvIE1+AVZEVDpcL7LiaeY
 5iaA==
X-Gm-Message-State: AOJu0YxrH0IJ5J+7F3UIsjHEYY1QQJvljOvTuPhd1pKpXHPWSkp47LWa
 R0fblHX6NG2X69/u6NpDTpmU7vd+g9ma3HJsEjQ=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:102d:b0:d9c:2a58:b905 with
 SMTP id x13-20020a056902102d00b00d9c2a58b905mr82918ybt.9.1697566317889; Tue,
 17 Oct 2023 11:11:57 -0700 (PDT)
Date: Tue, 17 Oct 2023 18:11:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231017181152.201887-1-nabihestefan@google.com>
Subject: [PATCH 00/11] Implementation of NPI Mailbox and GMAC Networking Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 Nabih Estefan Diaz <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3bc4uZQwKCPQjWXedaopabWjckkcha.Ykimaiq-Wnijkjcjq.knc@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: WhHXaaH+m3Pn

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


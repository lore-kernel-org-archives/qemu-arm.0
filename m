Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1961768lfp;
        Thu, 7 Oct 2021 17:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw117Y8TP3ikxKQcS2WwYirdTTUC27rodyA3mFr07C0zCtYxAz5OOqGmczlCsqthpquQREA
X-Received: by 2002:a37:45c4:: with SMTP id s187mr364411qka.125.1633652833442;
        Thu, 07 Oct 2021 17:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633652833; cv=none;
        d=google.com; s=arc-20160816;
        b=AkDA7S1K+PjXGPjq429Tim3klnF5iNgNVJ5CcHU7Wmy62kfebgMDXcgIxeoG1mSKLq
         K472cyM0Zj6u9W/EYVaPf1bGYKtBrJ40APuhyuMQ+y25m0YvurAcVMleQNxoqaMjD8OY
         KtkfmREyk/OgLTGfWvUg3AX2WoFdVx/xANyvrDKhfT4dr7Q5hhGvqDXoqjzkJlxiD/Kz
         WfDG+JBOkkts8esKKP3Rbu4TaESOSezsrefthMIr7JVVncmIez0PbqPU9ww7bg5+0RbK
         cwqMNLLXrigJGvYBcDtrGOTlIE727YiSguyeyyDRn//6qJQH6pVqDzeaKXAl5M0q7v11
         RUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=TuPEeIEeVSnqNB+3esNi6ppd+lL7fEfaQ5/f6mFeSPk=;
        b=r5tNsIQs7KQSOlfRWsAATEQM8Mndv+VQT8RpYteh+4fMZVAr4LOdsZXXDcpf1Yjl51
         Fa0rKEBv9CGW/qLzJKauIAKu62TddUaTRsftG9afeQV8k3j354YQkQmdszRkgVIrUqG+
         Q9wOtqCcIlEId7M+RMko8LFEN1xLS34ueFEC72QG+Q7RQnfBqR243FqD0utmqeVspBR5
         jSqnMUUVAIFjLq6PvQJRB3pDdrZ0+r5nCLR27DIVAw/BcMzuUg3yOBvqIdF5h0/VDuOK
         rM+oROSK4uQFYEy9D70bU8jCe1N3hqrBxs3tRalHq61LaInUR80qC/6aCmv4sbwpC2qw
         eCYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fk9Emyub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si732703qko.386.2021.10.07.17.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 17:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=fk9Emyub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYdjE-0000xu-PQ
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 20:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RpBfYQgKCPUtreXlqpedlldib.Zljnbjr-Xojklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1mYdir-0000xX-RL
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:49 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RpBfYQgKCPUtreXlqpedlldib.Zljnbjr-Xojklkdkr.lod@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiq-000404-9C
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:49 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 q193-20020a252aca000000b005ba63482993so1679242ybq.0
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 17:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=TuPEeIEeVSnqNB+3esNi6ppd+lL7fEfaQ5/f6mFeSPk=;
 b=fk9EmyublAWUP7fzsdXs0gsqMGzq/fW86Lgg+/LthY9V+vP9achKLy+1uQDgB9rn/3
 FagMuuARtHymFa7HLM9/i5ZgDmklH3ze7RLSg9P7uVcWEQBJyB+KnNtntOgOEnYM8r+A
 H+lRNth7EzV2mscCyksiwlaLs4X0kRgMKVJU7NHLCUSeKD/Z6Gq2xg6bHlc7ZDVKQT5i
 6D5bXjdkr1pJ78ov0DduVUytRbL0r65soW/jNu/jhtD6bwoacqTWHgf3en7n7G5Jz8vm
 JBFFVahbhbrRPoK0iHYnJxChI8pXOcha22SKY2G/yR5Eyq1DEgiHZj3BT6WTQs1HhJNE
 09iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=TuPEeIEeVSnqNB+3esNi6ppd+lL7fEfaQ5/f6mFeSPk=;
 b=0r4DvwzJ67vkMHN/UWynykfKrkR8T/iRThPLYeP7jPoIuWmYXiWHHOm5H8mpqzWDCZ
 5X3j2kyiIEGJ8ROsdwwhSIL45WYX9F3UQYFZgiF2LlYWV5NfYMywHcU4m4aQ+4HTKavH
 F5yxtcBePSRH5pp9WRNzcIoilUHj5hlCZIaQAGfffWl0+V6wMeswh+Fp1RXqMsoZ3inq
 fWumwJ8IBeP71VpmSUDNgSvrOjW1MhDjqBVTqswvcBzKJN+M5WEEq2qjEsS014kSgNzs
 dI8FdIEoQ6LNWtVXnEPW6ofDHoV4Y9pKKOT80/QS/aYHjxZjjPbOFUkRalMZefu2K9BA
 rKTw==
X-Gm-Message-State: AOAM532slzb6Yx+XQKqjaQWGcgg+PU5Xa6izbKYztcaUtySj1VXxOXcz
 KJBpLYiWSR8xeTqFFKsOG8jORimoOY60sA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:2681:: with SMTP id
 m123mr130977ybm.7.1633652806630; Thu, 07 Oct 2021 17:26:46 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:23 -0700
Message-Id: <20211008002628.1958285-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 0/5] hw/arm: Add MMC device for NPCM7XX boards
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3RpBfYQgKCPUtreXlqpedlldib.Zljnbjr-Xojklkdkr.lod@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /BPRvVpzW+Jf

This patch set implements the Nuvoton MMC device
for NPCM7XX boards.

The MMC device is compatible with the SDHCI interface
in QEMU. It allows the user to attach an SD card image
to it.

Changes since v1:
1. Rearrange the "add SDHCI commands" to just before when it's
   actually used.
2. Add standrad SDHCI MMIO as subregion, similar to cadence_sdhci.
e. Add a vmstate for NPCM7XX SDHCI.
4. Address various minor fixes suggested by Peter Maydell.

Shengtan Mao (5):
  hw/sd: add nuvoton MMC
  hw/arm: Add Nuvoton SD module to board
  hw/arm: Attach MMC to quanta-gbs-bmc
  tests/qtest/libqos: add SDHCI commands
  tests/qtest: add qtests for npcm7xx sdhci

 hw/arm/npcm7xx.c                 |  12 +-
 hw/arm/npcm7xx_boards.c          |  20 +++
 hw/sd/meson.build                |   1 +
 hw/sd/npcm7xx_sdhci.c            | 182 +++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h         |   2 +
 include/hw/sd/npcm7xx_sdhci.h    |  65 ++++++++++
 tests/qtest/libqos/meson.build   |   1 +
 tests/qtest/libqos/sdhci-cmd.c   | 116 +++++++++++++++++
 tests/qtest/libqos/sdhci-cmd.h   |  70 +++++++++++
 tests/qtest/meson.build          |   1 +
 tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
 11 files changed, 678 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h
 create mode 100644 tests/qtest/libqos/sdhci-cmd.c
 create mode 100644 tests/qtest/libqos/sdhci-cmd.h
 create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

-- 
2.33.0.882.g93a45727a2-goog


Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1186364ejg;
        Fri, 19 Jan 2024 12:33:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM18uGJMo6rbMdV9zIwlOeGhYus2+PuUhCupdFaeENhncYpiyVvTOIUj21BSXHNsepEo89
X-Received: by 2002:a05:6808:1812:b0:3bd:a2cd:2c67 with SMTP id bh18-20020a056808181200b003bda2cd2c67mr418889oib.0.1705696428712;
        Fri, 19 Jan 2024 12:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705696428; cv=none;
        d=google.com; s=arc-20160816;
        b=eGLOcV0Ftx9kiofuooIfQ3UhoPT3lRoKM/791Q0hAflnzijy+gDLI77Mhp/4jY5Mu2
         5tH0sBXL7HUYpWD0lOjWnYNWWP1QXzsG5G5cghpdaLupgRQuDr0MC2qH0QP10uJpbw/u
         Q1rLSGEAFyR+RqNxJksNmV0WTgXeEGYCbJoiI7uUAfmVXfAIEMHmLTabgcCH0/fn0guo
         KSXWDoEdidvb1EWxKJoHpMtSZZ7y6IkwS8r6m08bph7vGH5NYRBCk+Au6/t0lH35a+/9
         hicFBS7kS8zXbxG2/9C58Hmm1GFN/oUwkkFDU7jVhFRhnuAIIVQPxyeMcpkrqi9p0W9Y
         IGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=XT0ON0Vc5XZiw7+efUTcqN8o3WszI5rq+6Gmma4AQ2g=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=CrvStKqhjXupaC/hLEnxmC/15uvAqzZoYA3yEFJ7xCkqMitH0K6qoKAcsN7VCpA5NS
         UXCeTn82q3qne+4KuZz7rmgXj7yNZIx263MGmgNucY/fgfh2pZWCpqhGKM5fwd0Jz+ks
         2VYqzunTMHmZLhRwN+bSzSFtfzvwPi2k9xrEKAeUCEGdAiMGYxf1q1GIKm8bNIrFkyUo
         g/t5CADQ4n2Bnth+aquyiD1a3pV0MBHvQ1lQiSOa0Ve1KEBRyJ1vGSKy18YSvm2k5o9v
         ohzlP+bkP/eeScWjNqEP3koOpk/M1FUQaK8Sf/2qnpThZCNnpWf3ZYxns6dyThseBeiH
         Vmlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bJwudI6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020ac85987000000b0042a0ba36abfsi25102qte.145.2024.01.19.12.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 12:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bJwudI6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQvY9-0001DQ-GM; Fri, 19 Jan 2024 15:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hNyqZQwKCB0G34BA7LM783G9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--nabihestefan.bounces.google.com>)
 id 1rQvY8-0001Cp-59
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 15:33:12 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hNyqZQwKCB0G34BA7LM783G9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--nabihestefan.bounces.google.com>)
 id 1rQvY6-0003lP-BU
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 15:33:11 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-dbf228b9961so1968306276.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 12:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705696388; x=1706301188; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XT0ON0Vc5XZiw7+efUTcqN8o3WszI5rq+6Gmma4AQ2g=;
 b=bJwudI6z+X9RX6L+VZWdghBZZoolICgawPrBvd0tq9DjZwlLPKKCgbrseT5qyy5vMc
 EeGHJO9ZG7RONzzTZur0/Lo70mxzLu+L/Xi+QuIs2Sc+j3s1WnrvpbknWrRFm18ulDJA
 4I4/OgDqIaSrIP04vmRm/CjvQCqrkD3Z/U6nbzOAwIdKCCaJb6JEr+SJAmf2CBgn9ZP7
 qoYYOnrBz4PGlhohAP0d9avJF1IoOqKrw1Pcsa8gF3qNpgoRoAsQby9Hym3UVIdrRkd9
 v6y1a8KnLGtbZmK/E8rXsSiDBEf/mB1oojGKpSifn4rY21QDA19JBxt4QJ83j8RgU0q2
 OAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705696388; x=1706301188;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XT0ON0Vc5XZiw7+efUTcqN8o3WszI5rq+6Gmma4AQ2g=;
 b=XcAWAcgahPagdgYs3St558NtovQ4bnCJLQd4I/XAlUS/lm3a85FHooLNPncShEfXiU
 zfpC8s3r171h1pg2rZFyx8Pw2dkUDUacCjVg7WrB9OKfdhDLoC8SqmNSuz/ckuVT2Guf
 xptkN05P+6FiznD7Ygu3iSaakfv27LO9WsonXSS6b1d+AkKvuhTdr1+sEUXwpKfAz6RN
 2hnvleSMGRDBXU+1hUAnw1+JivnoVoDj75iKds0Fqhnez+UVWcfDtYpcEUMGEvI6DBXa
 p8TORATXAorSRbibctRIAZh/kh4BEtKNG5TQ2VvfmRxsGWojVGW46tOJRBvpqU+CfzS2
 PmFw==
X-Gm-Message-State: AOJu0Yw78mxHhamtXmTP2OloB0MfgfFq8zbuohmUR2PDBLuG79wD9JQ1
 gPPXFT5w++UclD7vNziYQhUlE7hdYoC+IqfVnsTfI1MtHvFc27S/L7jrRo/SABBWqFuTtBArotr
 0Teq79AQxvFq2TOIr/lJlOVvpNQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:ac24:0:b0:dc2:466a:23c4 with SMTP
 id w36-20020a25ac24000000b00dc2466a23c4mr218900ybi.4.1705696388379; Fri, 19
 Jan 2024 12:33:08 -0800 (PST)
Date: Fri, 19 Jan 2024 20:32:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240119203303.2230984-1-nabihestefan@google.com>
Subject: [PATCH v13 0/9] Implementation of NPI Mailbox and GMAC Networking
 Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3hNyqZQwKCB0G34BA7LM783G9HH9E7.5HFJ7FN-3KFGHG9GN.HK9@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
X-TUID: lpAmf6OGNu6v

From: Nabih Estefan Diaz <nabihestefan@google.com>

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
 hw/misc/npcm7xx_pci_mbox.c          | 330 ++++++++++
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
 14 files changed, 2357 insertions(+), 4 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm7xx_pci_mbox-test.c
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.43.0.429.g432eaa2c6b-goog


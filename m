Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1165536ejk;
        Tue, 30 Jan 2024 16:28:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNjeWzItpTZEmuDOsIbh1VEHlSt4K+4FHpEHbVirHOY3Ozcfe7TcbPVKKMFbwpv8AODy//
X-Received: by 2002:a05:622a:302:b0:42a:7372:b847 with SMTP id q2-20020a05622a030200b0042a7372b847mr304787qtw.22.1706660896955;
        Tue, 30 Jan 2024 16:28:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706660896; cv=none;
        d=google.com; s=arc-20160816;
        b=IWbDfvCBLfDkaq1MgErEqsoa1ai0PlEHV5jBv6YQa3KaiwDYe/DGcXxgru41ryh4mr
         0EQXON17cP8f27+iUTs9llS4eGrlSCXM1Qq0EsEFDX+Oq1Ng6hWHujjI8xXl5eQTVUN2
         Iu04qvGVfhWfqfvr2Nh7+JvOvpG0gaURRxQ6TMkv8a2/p3xFN3KDrIWN7/8mmmJ8oa10
         kmuT4JxcUhsfpdiR4M2F15R/X3XvV9uYceD/jVKmCv1q8/TWHCH/sD091oEtrGIiMIu0
         0HdrFloZR+yiWAQ/UugYs9aleuz5qO6JtAHYH8/mY8biFH10cAIm7xRw26OP/eKJCVRd
         NfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=f40XfUUTa/tJMFfses+Lto4m+MDT9EIZ8dnUNgZSxqQ=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=cRfEUD82bRkfDptJGBnMzfiDAR3bqhgFtbDuyf24LigdG0n5xqSxJHuSqMa3Z90Cfp
         7Rr7JD3jsDIN2M/uYVnb+r52v6+M3eSjlfUWsVc9BlpKHIdtuPy70UwXwTpLJh/cg1DR
         k5Pt0O1DpkJMD548wemYHbeDtbDOzI7HY8FZjIvoXL8rmeajmiXTmrBl9diHGiXj0xQ0
         ODtu4RL5Ix2BLDk0a8U7oPQxvOi4UIN2Kc29aepNm1bGGDQoYTGrX3IApKhTA2Ek7wbu
         Ea0V+B1iRGKY1lW6BsTUFOBZHYxw+JdoZXZAwUbQo0Fek7bvXRfxML7ccEIwSsmGuJkl
         gz3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=E5aeAYuJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05622a018e00b0042be5c0add1si453337qtw.701.2024.01.30.16.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 16:28:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=E5aeAYuJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUySU-00072g-Qm; Tue, 30 Jan 2024 19:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EpS5ZQwKCFUAxy541FG12xA3BB381.zB9D19H-xE9ABA3AH.BE3@flex--nabihestefan.bounces.google.com>)
 id 1rUyST-00072B-Or
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:28:05 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EpS5ZQwKCFUAxy541FG12xA3BB381.zB9D19H-xE9ABA3AH.BE3@flex--nabihestefan.bounces.google.com>)
 id 1rUySS-0004IH-5D
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 19:28:05 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-60404b12af2so7898367b3.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1706660882; x=1707265682; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f40XfUUTa/tJMFfses+Lto4m+MDT9EIZ8dnUNgZSxqQ=;
 b=E5aeAYuJnRq639wuvUc/PEWsM+NIcgc5FIGenyQ98irtGpR82UlvonlNPV6yEOkCZ/
 jOuLRmgjSJLEvMcEIi8XmppvP4WDIbi8slt0p/rcM1SfHxS6HOxdJRvnY2AsnM/BzQs2
 LEqM0hqvtnaEK1nMGS/poUoF9bhFcdn5mpLKxv8AnV2oA6VLz7rbwx5rJj/2gJgM8BEh
 c2kZxQQgyD0GR48sjwiabgDtvTn0jrtrWayzgjWnmZIt9NSe+p7s/XExZZqLYVWlaaA7
 Li3ygGLrWmAuiqvzSMjdPZqFmdaBpXkJunKwMJLuKVuq6aIhlkJnkKmYWBCOjxsEL0ke
 qZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706660882; x=1707265682;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f40XfUUTa/tJMFfses+Lto4m+MDT9EIZ8dnUNgZSxqQ=;
 b=b4L1SPQCfXhUJDEQDZA8zmvglKH19xYs+zOxB0BPtoTgkiSZjD2m6gwblprpAA9CWk
 Pg6iUBucJHdUziaRASQJo6QTTfqQKsAzx7XfPxNKdI4ceJmX6QEZcUk6WAkX9Cm1IH7x
 AHy4jseUHgwzgzUqmj/L5HyiEWdZHirYHqkcws24w6Qlov2V0ZyIJAZak0d2vpowGA3S
 ZHxqzKo24x4wy+pYmM/Jg0wDtppI9iNxCZn5Xi3XZI2yQu/qO442vo5GSIVAf4ZKeBOB
 4cE5g1vF+munEz1r69Zc11PStYRNdfwx0NcYzBABAcNRzelLCxJ7s4Z6wGP2HoUA1Joc
 Tazg==
X-Gm-Message-State: AOJu0YxBYGVs0FMAd39f4CQb9gkqIvELN6b8rk5CrTioqH1rystSBZzX
 9Wyf8VTWlatohL5LormvI/ZGGdoFVJDWM+gfDJ7wXvYPw9/HMme+1BVTd4srTPWhifC3Nmtfyyo
 Xk80lcyYyLNjQKXAU9W27cXv0sg==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:397:b0:5f9:abfe:243c with
 SMTP id bh23-20020a05690c039700b005f9abfe243cmr195847ywb.3.1706660882676;
 Tue, 30 Jan 2024 16:28:02 -0800 (PST)
Date: Wed, 31 Jan 2024 00:27:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240131002800.989285-1-nabihestefan@google.com>
Subject: [PATCH v16 0/6] Implementation of GMAC Networking Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3EpS5ZQwKCFUAxy541FG12xA3BB381.zB9D19H-xE9ABA3AH.BE3@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: 6hI73OcKcwNA

From: Nabih Estefan Diaz <nabihestefan@google.com>

[Changes since v15]

Dropped PCI MBox patches. They were presenting a lot of problems with endianness and are not directly related to the GMAC. Breaking them apart to debug separately and let the GMAC itself be upstreamed faster.

[Changes since v14]
Expanded comment on chardev device and fixed comment formatting

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

Hao Wu (2):
  hw/net: Add NPCMXXX GMAC device
  hw/arm: Add GMAC devices to NPCM7XX SoC

Nabih Estefan Diaz (4):
  tests/qtest: Creating qtest for GMAC Module
  hw/net: GMAC Rx Implementation
  hw/net: GMAC Tx Implementation
  tests/qtest: Adding PCS Module test to GMAC Qtest

 hw/arm/npcm7xx.c             |  37 +-
 hw/net/meson.build           |   2 +-
 hw/net/npcm_gmac.c           | 942 +++++++++++++++++++++++++++++++++++
 hw/net/trace-events          |  19 +
 include/hw/arm/npcm7xx.h     |   2 +
 include/hw/net/npcm_gmac.h   | 343 +++++++++++++
 tests/qtest/meson.build      |   1 +
 tests/qtest/npcm_gmac-test.c | 344 +++++++++++++
 8 files changed, 1687 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/npcm_gmac.c
 create mode 100644 include/hw/net/npcm_gmac.h
 create mode 100644 tests/qtest/npcm_gmac-test.c

-- 
2.43.0.429.g432eaa2c6b-goog


Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp22517ejc;
        Tue, 17 Jan 2023 15:25:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvN9g96hoCtr909bJLJgy95ZqvJrgumZ0Boh9NNFUMd7APGqMEBDL2X513bZ2y0L79aRvWn
X-Received: by 2002:a05:622a:1e07:b0:3a8:a6f:fb7 with SMTP id br7-20020a05622a1e0700b003a80a6f0fb7mr6610688qtb.11.1673997957590;
        Tue, 17 Jan 2023 15:25:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673997957; cv=none;
        d=google.com; s=arc-20160816;
        b=tv+cHb6/5fDfDA+NVzPNXORlCT0m1CSIlnz8R+R0ypweBFhAoykbV1eBohMzE4mB9z
         YbOrYQYr4a2fOrKhv8vAECdwtJEvMa0tuxH9lf/DINmVgqzlzI6kmcQu2cOttgLKGajn
         Zm6V+SZsBESMJyM0Av+of3c9VMWGlkeKwNY06eajTOQ1DyLN4YPzRiWgqpj7vp6tG2ww
         vzyXf5ReLWVImuf797QYxAC+Ly2wkbqzjoEZERCYE6j+mTRHSkuXiVrimr3ybR1AFBB6
         +kRqhEbegwHqTYRSeuw8jWBLhMavA/UUG2e8ISxAKqO+BzPAzBZsXjoBG3qHd+KTErC6
         uJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=sS5r2zfveoCyFCgf1BLCU9xtCWw68S4IC0eqkL+z8uU=;
        b=pPQsysmL/2+6hgZ0/iJJe/5WuQygdF0yJxQObyESi2YrgBXFU6GuVoSoHwZR3ep5s7
         RBB+N5N9cttjlBETi7YMnIGeHMItuC1VvLyPunxaAe/OQSfPN0rrradRpDAela+gGM7V
         tmFIiJDxHqSwToYbJCwUN+HIldKrb2DxhKOawoiYi8++VKljACGTqCTBu7CjAmOyM8Xj
         6P0/GHXl2HSAAZpSpwMbHrZgRHiP3uqQPeZYIHQVUpMFxHk2xrWJZ2tonM86TUmGd7Uc
         210chfL6G5dPZoumd95lWHlJQ3kORrwBp2YEIhbnmHv88uhzqN951WnhKz722MqEKZlE
         N9MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=E8p5JtsP;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=dNA8FlS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc26-20020a05622a489a00b003a803b11fbbsi20577671qtb.604.2023.01.17.15.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 15:25:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=E8p5JtsP;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=dNA8FlS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHvJz-00020I-1e; Tue, 17 Jan 2023 18:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJv-0001yw-8b; Tue, 17 Jan 2023 18:24:47 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHvJr-0003JZ-PX; Tue, 17 Jan 2023 18:24:46 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C5DA5C015C;
 Tue, 17 Jan 2023 18:24:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 18:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1673997873; x=1674084273; bh=sS5r2zfveo
 CyFCgf1BLCU9xtCWw68S4IC0eqkL+z8uU=; b=E8p5JtsPnc+A4JHrcW+nWng84j
 mE0SUG1EvnD4GCV6nvLAKDgUxnK5osSf3CRR777lNO7hIAwFg+5UzIXkICXzQyrR
 Ju5cMm/mPtxkpI2u2TwXwZ6et7tjPtoVWW3XS4UDvLayj0wx9nraJk0gmAJA6jfV
 60icNaFjOpDZhMu+1DvwL5pfx3OmWbNQiN+LKlgD7PJBpeq1UtbrSN/cchOq+tie
 +00P4qJ1sIPoQwyxjEkIp/WWZvZXoqrytqT0zZVQH5n8wPFw0Vf2sccI9prnKPvF
 0dhmKkihCg2VGt4FoXHakLeVTGjq+6RCIjh37euPVtBksHq/Lf5GOA75wAjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673997873; x=1674084273; bh=sS5r2zfveoCyF
 Cgf1BLCU9xtCWw68S4IC0eqkL+z8uU=; b=dNA8FlS6ZVs4m3hdFDYZ9hpXq56xZ
 pQStUTs4NXPSu3wlUphOTYEJc7h1MDAaeNRMqoLmRlg0ck/vxVBXw1f94BB37InX
 77+iNtleFeTDMfHAbqYW0rIdjlbuMCmjOgbQ7cnpjlD1n2sHvba7KdSfHUPlMgM3
 vHYg8OC7sKOMBC8DqzpzdRrYRKhDpoLNUZEsj17ofuwDLlKCyha1eCbd0l2rmQMh
 t1rM2hQ4Tw42WkHT9gjyyr1jMZA0jmbWoMQVkstDTSV3ilYvKmYI/GJjYu/ZT3eM
 f5/PtU+RMZlBVEpIQQVjqby9eW6t0Tz26fO5FiUfzw9WyahY5WeLaDKJA==
X-ME-Sender: <xms:MC7HY5pa1tWqaiW9pqcr1XX73OhEz6FCJj5jcH8K3pNu7ypVWRv5Uw>
 <xme:MC7HY7oLmfukn0vwxntrN5vOkTn61vqkiU8Q3JDvjTLTrSmUDkX1xmklAXizmSNcM
 op2RoPcm2ncOqnR-GM>
X-ME-Received: <xmr:MC7HY2Nyi7Mm-JDeX5a76KfE8nVxMEgYnxasmSqH36yGVXZuhHys7vbleHVXhGwpzS2XOPkIVpufVTGncL0LNVtHUdXIRyXzu3fVQatkHNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofggtgfgsehtkeer
 tdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrse
 hpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeetffejteejgefgffdvuefhgeeludfg
 feduueeltdefgfduhfetudetueeujeeukeenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgv
 thgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:MC7HY04STE1DPyVFaJjA5VWSW-QMeKr1ed6HF6m6L66iK1zU346ZVw>
 <xmx:MC7HY46jAQJiXX1w9IY9vDelBZNP0LSfU8Z11MbPMy9othHDc4l1Cw>
 <xmx:MC7HY8jTcr-9yYHB_XJoYuynZTbuVuHdBeblB4jKM8kKBXe7ZpPRmg>
 <xmx:MS7HY6u519m8zXGtJbBybHOavKIPG-8lV79By1PC1GHckhwrjKPbXg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 18:24:31 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v3 0/5] hw/nvram/eeprom_at24c: Cleanup + FRUID EEPROM init
 example
Date: Tue, 17 Jan 2023 15:24:22 -0800
Message-Id: <20230117232427.74496-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AnaNp3ddlezv

v1: https://lore.kernel.org/qemu-devel/20230114170151.87833-1-peter@pjd.dev/
v2:
    - Squashed 3 commits from original series into extract helper commit
    - Dropped last 2 commits from original series
    - Changed at24c_eeprom_init to return the I2CSlave object
    - Added commit to introduce at24c-eeprom "init_rom" attribute
    - Added aspeed_eeprom.c and fby35-bmc BMC FRUID EEPROM initialization
    - Added commit to change reset behavior for at24c-eeprom (optional)
v3:
    - Added doc comments to function headers
	- Added fby35 NIC and baseboard EEPROM's (to illustrate 2+ EEPROM's)
    - Replaced "extern uint32 fby35_bmc_fruid_size" by adding explicit array
      sizes, e.g. "extern uint8_t fby35_bmc_fruid[200]".
    - Fixed Meta Platforms licenses by adding SPDX-License-Identifier for GPL2.
    - Moved ee->init_rom initialization code before ee->blk, so that -drive
      property overrides init_rom initialization. This gives more flexibility
      (people can override contents of an AT24C EEPROM using a file for
      debugging/prototyping) while still allowing the init_rom data to be
      specified for a board for default behavior.

Thanks,
Peter

Peter Delevoryas (5):
  hw/arm: Extract at24c_eeprom_init helper from Aspeed and Nuvoton
    boards
  hw/arm/aspeed: Replace aspeed_eeprom_init with at24c_eeprom_init
  hw/nvram/eeprom_at24c: Add init_rom field and at24c_eeprom_init_rom
    helper
  hw/arm/aspeed: Add aspeed_eeprom.c
  hw/nvram/eeprom_at24c: Make reset behavior more like hardware

 hw/arm/aspeed.c                 | 109 ++++++++++++++------------------
 hw/arm/aspeed_eeprom.c          |  78 +++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h          |  16 +++++
 hw/arm/meson.build              |   1 +
 hw/arm/npcm7xx_boards.c         |  20 ++----
 hw/nvram/eeprom_at24c.c         |  59 +++++++++++++----
 include/hw/nvram/eeprom_at24c.h |  39 ++++++++++++
 7 files changed, 235 insertions(+), 87 deletions(-)
 create mode 100644 hw/arm/aspeed_eeprom.c
 create mode 100644 hw/arm/aspeed_eeprom.h
 create mode 100644 include/hw/nvram/eeprom_at24c.h

-- 
2.39.0


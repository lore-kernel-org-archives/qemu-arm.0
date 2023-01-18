Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp135050ejc;
        Tue, 17 Jan 2023 18:42:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzbJk0PiZbXY+NOJ0L/bAsX2U0ytT1cUH1DOmID9tJpI5C5yiBvZsXB3Hu7chaw1wuOcG5
X-Received: by 2002:a05:622a:290:b0:3b4:5d7f:2805 with SMTP id z16-20020a05622a029000b003b45d7f2805mr9395731qtw.6.1674009777075;
        Tue, 17 Jan 2023 18:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674009777; cv=none;
        d=google.com; s=arc-20160816;
        b=l/L3I2fvtbvOGQODKybHxsZs5xHIK35srh7tjfJenLE8ZmB/bcaJtwY9x+SBGF6SoG
         TegbABTvll5ruVf2YB9FXuV5gPBuEpzE9gjH/8w5vhTUBrcgf7XEycHHOc2coEL5GMO3
         YH0+3vKdE9fXyUERdateZ8X7/tMYcmWRUsHRREsOj3TZ8PQwUOkS3LzwYoVluh9FhTKi
         v47KVIycjoSLXku95j2PKNn3qXdFccX6H1Kl3ZwMJLvzyJNPLMBOKbtTv/s0+9n86Y+d
         dAeybrsMxe5mDDGU6SyMMqnear5HBy/1TKnURKRxp2YWc9Xt/NbDeXKaC4+HDPd2NMl9
         KgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=QfoHj9tcz/1Uzbm2cTdi8Grjw+z/K2RNHW0+3w2BYdQ=;
        b=ZTmX8fSQqbfwGD0qDFLitu/6o3LxlI9u8jPsDC22NLtD/4GIdr8vIaz5NpH9CW3NOA
         5pPCvVpz2WJa9HIEJW/ZJ5K/9nJ5grGN8aSrWM4dXMzpNi5BFGNlMiHJFE3p/5cFaRys
         BJr6NAXzD3pwiE5fh3bsOKZ9VSEjkl6MLwmMX3IZj0GiIVbjvKWeXNvsjofU81B26tVV
         evFuNJe2vwN4Uejgwy8GIseSzQVdMpnJny1ZIqr4GUu4IRJxnFVVLynChdgKOGanTNsG
         3jdLzpFLZMqyge3GGWqIZaFytPXSbaEbuwhPlZX5mcP7Br8FCd6rpDRbTlXeDkahQhkK
         6Bjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=PGiCUgto;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=gMlvvZGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a05620a29c700b006eec09eed41si20316169qkp.517.2023.01.17.18.42.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 18:42:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=PGiCUgto;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=gMlvvZGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHyPB-0005Sl-4G; Tue, 17 Jan 2023 21:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyP9-0005Ms-62; Tue, 17 Jan 2023 21:42:23 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyP6-0006pd-Ds; Tue, 17 Jan 2023 21:42:22 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B0D15C00F1;
 Tue, 17 Jan 2023 21:42:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 17 Jan 2023 21:42:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674009739; x=1674096139; bh=QfoHj9tcz/
 1Uzbm2cTdi8Grjw+z/K2RNHW0+3w2BYdQ=; b=PGiCUgto8Y76dhirtc82A17NNC
 m3kHiWOp0b7DMpWUaOcSlupe4Rwypov8nM6KJYQiRn9r+30PoGgg7fzMlOnNWDkB
 tPXx/vb3sHfBP7nI710OeJ2KAJCohqf/XKAjYMQkHI0MNN6DtTn0YM9nvMYs7yGH
 TjxSY90qte10QIfNBwNkOtmNzpQ4usP011SPlXZ0yI796M0r2QpXU26az2POJdFM
 ikvr3mmAuXdCCl2L/XHLaPM6SKCQCl9ZyDmuSC8KPnmEYIrntCXvCKhijL3M+bay
 5B/WHO8F+SBpVEtrenecRh6qwUk0yfJXf1pvfP7ZzC6l5NgxQ2E/K1cv4WYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674009739; x=1674096139; bh=QfoHj9tcz/1Uz
 bm2cTdi8Grjw+z/K2RNHW0+3w2BYdQ=; b=gMlvvZGa9T3ipccgS84iW4J4cRnqy
 lvXnU3356pj5Jk4Lw169pRHr/RvxsCAYbSQ94zSo08Co8XcN+waQ+JHS0YGU++/r
 BEArPhQUPSz8nK/BB2PZXTwh1YcDAR8MiPD7Hnrm9E+crltQBYCQ6oQZEe060uxl
 w+iWglL6Z5rmXb51hB0Fq3g+XyGmwQ21wFIJByVsDMXYtFmFjUXErg+KzkIP0QY/
 sqmynDa0tBC1+0f2APuMpkIqykGjJzIY0m0/lyIdGdm5nJWnroqxyeQ2CFTn4djw
 tQljGf39+FS3GNrQAjwXpwCrcomzLv97Nxx7xsdRcKA2a39SrVic+r3kw==
X-ME-Sender: <xms:ilzHY3BMUXZAWSu4IovYCIcEc2xZ7rwN8Va3-9MPrVJQ7mCMh33pdw>
 <xme:ilzHY9hHgEp7O1W63mleduxcw0TxCR8vzCxeQH3jzL2G6nxOA2j-TY7xLd_awhwX9
 bLBvihgiMErasuAG3Q>
X-ME-Received: <xmr:ilzHYyn_qntbBhWcXxkqNHN-3Q3j-p_Pb3ZMeR6qfSskwxA7DPjZSeek9kMKket29UdcbmHRUKknECfG9IW73r-8JEWsvleyc4mLKFwRFEk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofggtgfgsehtkeer
 tdertdejnecuhfhrohhmpefrvghtvghrucffvghlvghvohhrhigrshcuoehpvghtvghrse
 hpjhgurdguvghvqeenucggtffrrghtthgvrhhnpeetffejteejgefgffdvuefhgeeludfg
 feduueeltdefgfduhfetudetueeujeeukeenucffohhmrghinhepkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgv
 thgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:ilzHY5zmvFX3ku-NN5Z1OiB89mioAbcfmCCcVMvjebL3Oux1ks9Z8A>
 <xmx:ilzHY8QcslTrklX8G37XpieloMv6ipjRn85NaNC4XP1ojMHZfVTmeA>
 <xmx:ilzHY8bzRBNZ7inLT04ThuReBTiWvsXfMFQYuWn9NuAKe_7PkbTE1w>
 <xmx:i1zHY_EDrPLKlBu73_7AI7bFpcQnOANVRpzNvXymGN52DubvLdakrw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 21:42:17 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v4 0/5] hw/nvram/eeprom_at24c: Cleanup + FRUID EEPROM init
 example
Date: Tue, 17 Jan 2023 18:42:09 -0800
Message-Id: <20230118024214.14413-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xRxXy7EfXTCC

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
v4:
	- Moved at24c_eeprom_init_rom doc comment to the patch introducing the
      function (moved from patch 4/5 to patch 3/5).
	- Added review tags from Joel

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


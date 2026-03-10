Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07326EB1060
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 15:34:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzz5r-0002sR-Kq; Tue, 10 Mar 2026 11:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzz5g-0002ql-46
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:33:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzz5W-0007rC-TY
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 11:33:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso6822023f8f.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2026 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773156816; x=1773761616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2uiTfksFHNHzJzvkw5nta263FHLPMUM8xCQCgBMubD4=;
 b=RSbk627qTBhsfek32LmVK5+KkLOaSbIU3SE3iDTrE0DSb41wtK7o2x+HwiHtsRJ1y1
 KMYgAleRxa6K4TukG7/18IrhD1k5qaZ0MdP2FfokXPfWiBX++NDht8Zay5oFtIgYNtar
 15yftFmUMUZAhOGB5Ka0xi0I5/cXbsBLa6b65XPaJ/pB36sllpqCpuvdTiHXRsa4Q7/w
 U4Kl2G3X2QTfzK7ZmmLM49+5J/hsF/0AJFqVopjPPmnzUocRkdpzoB/sDW9h+jINU9sl
 JBQ8r7xOsaxFmSug/ZWkEZkB1f+qQfDCSBBZM5TjZb0ApcR62vZqp3Vx7jiFMSG1TvVB
 oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773156816; x=1773761616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2uiTfksFHNHzJzvkw5nta263FHLPMUM8xCQCgBMubD4=;
 b=epn9klf38Yk+jzOJVzFHO3ZHLs/EScAlSmT2yskioyZr+fO+VZ1Olw7ITcKQAm0Gu2
 p+iuoVDvhPEWOFvvYnjcbhTIJItkzDGmn+ePx9Lm/6Yf6AbeZPibqbfM3snwfYgeT9ct
 KyAZdry6N+39KTn1sEE6vaZRxV3G28QUVu766fi7aMRKjCEv+0Kem7JoYTIeLfaUuJvd
 /lWLNSPlbrrKkhk3ob1mWGos9uznjeHJ7mFjW/gmcpjuWssOZuy4+vutwnMTIE+aPUKJ
 V+etxG1w1EPQBlqqCNmTXgVlXNrqKxQMYXxiAh8tlcCIr6IH1Tqo/W59etRL/P8fVf2Y
 ltJA==
X-Gm-Message-State: AOJu0YyiQ116k4yOuR/luEdSQprvV+WhNz9E2FGYfip1SsTDbKx8oEpy
 UCAz420AInxqjtRPXq62s762v9VeUXrxPkS9rJdzhiuLr+pPAN+cOZ/bIXQbHIUy0q3o7Q4Sfpp
 EgoTE
X-Gm-Gg: ATEYQzzqw1ied8ZJPtBSJe+TFc8PFH6jhJ6qeGu4SscIBV2+qi7CkRiZt5bAuUxc8OP
 r82QK+OGUJ410dp3oPuXDEdkebTEOSTKmLuzm175eD2a6iNfG/XDx/gG8P9lg+r31fsj06VD/Ov
 yRzFVoFX83X60+L+IWMb9FXip7kjBzBJARtkWPa4C4UO9qnG0s+Ho+FsyumJo/IsbknBBIwOdjo
 SiKn5Eo5wlGUywCHzFTJW/uzKJEA9QmtN4vgBKTvOEY0Q7mxSqTwqTZP3B1tk1OBQN0AWjTLCix
 rZ8jf/iPrfz2IB2q82HRdDbrSLcEzSjn8TxDPLANluXSLMRwulFUYibQ2XLhw3KnLSJ0Qx9zJIN
 +cb+4IEP+dfL+jfV0ROkwlPbcpUPb+hOJ09gBkI1jitI4cXhp2lQGTtKG5w0EE769WXY0selhJA
 h3HNlUAWlabt3I94KHWodigAoTRlX/C44+yfPj7KLnXIwf2FMXnp+xUM6NFWD5z2VED2A14jvPB
 cv/hIRKIjtHk4Z+/5AT7H7ZkK2F860=
X-Received: by 2002:a5d:658b:0:b0:439:f55c:b556 with SMTP id
 ffacd0b85a97d-439f55cb7d6mr2407252f8f.8.1773156816418; 
 Tue, 10 Mar 2026 08:33:36 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm41709388f8f.32.2026.03.10.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 08:33:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] tests/qtest: Avoid char arrays in more Arm tests
Date: Tue, 10 Mar 2026 15:33:32 +0000
Message-ID: <20260310153334.3063224-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patchset fixes a couple more -Wformat-overflow=2 warnings with
gcc 7.5.0. Same issue as this other series I just posted, but two
different files:

https://lore.kernel.org/qemu-devel/20260310151507.2973843-1-peter.maydell@linaro.org/

Since there's no dependency between the two sets of patches I sent
this out as a separate series rather than a v2 with those others
folded in.

thanks
-- PMM

Peter Maydell (2):
  tests/qtest/ast2700-gpio-test: Use g_strdup_printf() instead of char
    arrays
  tests/qtest/aspeed_gpio-test: Use g_strdup_printf() instead of char
    arrays

 tests/qtest/aspeed_gpio-test.c  | 4 ++--
 tests/qtest/ast2700-gpio-test.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.43.0



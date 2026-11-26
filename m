Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C947606A338
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AmyWHSzs
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWaXX-0003SH-Pl; Thu, 26 Nov 2026 09:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.mehnert@gmail.com>)
 id 1xWaXP-0003Ck-0e
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:33:31 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.mehnert@gmail.com>)
 id 1xWaXI-0001AL-QZ
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 09:33:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so91447635e9.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 06:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795703583; x=1796308383; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ZGDOqzl05R9gVFs1yGPWuA5HyYBfjyTwYZvYQyYVT6g=;
 b=AmyWHSzsPepTwuwFVkRJblmx+EqdHVj1e9NQLX1rzKST/ZapO+jxp8P6jMyAHaMudC
 Wlg8rwLZlP+LM7nH/lRHTEWB1gMLKgn4sjgEYz6fT5ZJy5dPwHo0MqxfOWeAcwNLY3go
 bV9iP/NWRNr5HSXyIhVPMYWHFd9n33m+a1t4psWumGWtuPT4w2AaOef4SMcs/gOoDC1L
 AEPxfkr0qpusQCNYeFF/DGbbsOeWdvdl1a6n9g5nsaggth6rL39cFGlMViHPGQkZHTvD
 DWoJyyHefUVACDj0PpIVUfgEV2nNoJLRR4/8yiGPzw3OCBFhZ3OvoAHG2oVkbf+9FliS
 W1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795703583; x=1796308383;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZGDOqzl05R9gVFs1yGPWuA5HyYBfjyTwYZvYQyYVT6g=;
 b=q6QsrOyGsObezMU0Fvxl/EVcNhk0KaALfNh0VXW7XOxgmI6+4dUpr9cz4UPCNw7We1
 Hc6wCLRNunkq8fKG3M49/YmS/pcNndcwngcQIm4HSO8aLd0XW+hp63/35fv+kaujsvUr
 bRK/vz7Xg1ymDThexS15SP3VESDJG89Bz6G1bf8NeOT1gw+hu3SgNle9AUUSaB3uwyp8
 lhODZHByvXsrKNIqUINjw7wYCN5pHGVOt1TN8qruCj43PmIi8RLjj/lRvNpYw/hRV4us
 vuIg7XKzEQpF+rF+jTWHZp5iQj7laYhxNlkmVELEgEalcflyLUoMJRGOohPZVe1JYtmd
 jvJQ==
X-Gm-Message-State: APuU4Z/MzKGFkpV1Tm/JADnHc0ynJYNir9u9Wr5+/DSqUUwFrbF9uthK
 JuJzftd1hUmgUCxeerLPSJmz+XqoEsfyD7JiK7rhgwYEXyay1tGPRlk8
X-Gm-Gg: AZFdTZeE4A5xM9FpCE1CUAJZd2IAs/77l2Ajpy/lY5b2BdB8SVghc5hMo4yVCVC+bYq
 x/9GTlwMnJrxCUmtHT9ySbGXtdb2F592GqL9nw44Q1iQjO7vjei/tzKFjIUiSCEGZEza0/yyJjM
 2jVLxGcAtlzR9rdPkfO3wj+yeJNpa7D95K/y+pje4Els98SQ2JLVZKbI9qdWk7TWiwnfc2v50Ut
 8v1CtsH1cx2Uqs2NAaY3nGfOFvd+F6EIwmOVGwT6nvXyKJ60SiiY/tYuzd4OmSa0CNJJprZz2tW
 Jxh1RgC36MD91OxuC4+OK23d19nPcm7FQ1lZ5UamZSEP2GEA8GJAZDuijMqfj3sM7S1Hc48x+X2
 14Bgfecvm776hhoW6giI9Y5gtqPNlNlh0fW8Awat6bmOPkHwSeStE2yOlKQle+nM31LW/WXVCpb
 4GM90ddlUQ+jbrutb1WdmpQoKaYBDVZYtp1Al6XRlpGN7moilx4P1kgNvRaLfUuNIWhPV7IpceO
 AP94k0myL9fWvtnpvr8cPc87Sb/7QvesZGqSUI6viM4O191BBI4Yh9AUynBFEczVqD0bxItM3m4
 Rs1zNlW2L7HEWYgHCZ30DRz4+gXbbq9vYFObOnT99DRjzKCKBN8x3tGnCotZ/qwMW2+QZMNFX3S
 y/N12jCsSm7WemNdXZO6psVx4UBRpARLGSyjdYLVD
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id
 5b1f17b1804b1-4bb88807d7cmr402995035e9.9.1795703582957; 
 Thu, 26 Nov 2026 06:33:02 -0800 (PST)
Received: from noys4.dd1.int.kernkonzept.com
 (ip-178-026-066-148.vkd85.pools.vodafone-ip.de. [178.26.66.148])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm849925415e9.13.2026.11.26.06.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 06:33:02 -0800 (PST)
From: Frank Mehnert <frank.mehnert@gmail.com>
X-Google-Original-From: Frank Mehnert <frank.mehnert@kernkonzept.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 Frank Mehnert <frank.mehnert@kernkonzept.com>
Subject: [PATCH for-11.2 v2 0/2] target/arm: WFE wakeup after a failed
 store-exclusive
Date: Thu, 26 Nov 2026 15:32:56 +0100
Message-ID: <20261126143258.1056688-1-frank.mehnert@kernkonzept.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=frank.mehnert@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A failing store-exclusive means that the global monitor of the PE was
cleared, which generates a WFE wakeup event. QEMU does not set the
event register in this case, so a vCPU spinning in the lock pattern
"WFE, load-exclusive, store-exclusive, on failure back to WFE" can sleep
in WFE forever although the lock is free.

Patch 1 sets the event register on a failed store-exclusive. Patch 2
adds a test case for this lock pattern to the WFxT test.

Changes since v1:
- Add the test case (patch 2).
- Add the Reviewed-by of Alex Bennée to patch 1.

Frank Mehnert (2):
  target/arm: set the event register on a failed store-exclusive
  tests/tcg/aarch64: test WFE after a failed store-exclusive

 target/arm/tcg/translate-a64.c       |   7 +-
 target/arm/tcg/translate.c           |   7 +-
 tests/tcg/aarch64/system/meson.build |   2 +-
 tests/tcg/aarch64/system/wfxt.c      | 103 ++++++++++++++++++++++++++-
 4 files changed, 115 insertions(+), 4 deletions(-)

-- 
2.55.0



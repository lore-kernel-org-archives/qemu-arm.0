Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2409988lfm;
        Sun, 28 Jun 2020 13:38:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUAmwLRjG1yyzMr1iS0Hqk1XpS41FEPv/P/jgzVk6UdTEkJpX/TJTaqTCUOB0KT3Q0BbrZ
X-Received: by 2002:a25:d2c4:: with SMTP id j187mr23734973ybg.33.1593376687083;
        Sun, 28 Jun 2020 13:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593376687; cv=none;
        d=google.com; s=arc-20160816;
        b=rP6emX4sEKLdR6Rq8tgz7hR1wZ/JSSC1qNtZ2nSfp+gcAvEcrc3LhNkqagOTOL17rL
         jTEkx8nD8QMojdi5W0IALyqHz/vbJcYCPPQ8+T5macZYE76//1voIqfMp4BHUHmiy+As
         hrhxwllpaMUB3YjVGutsbjULWHvWKGCa4E+VXUPMDBcmMfQW4U66XPP8brGIgdEpgn+5
         bdbrqTYsEuuhxTMmRnryveeoA0z1wBpisDEfziMerNBMSZKXTGk5vp6oCFhyydQqOfXW
         zTNezjFqt5vpLOXOWeRyBkhNWr6x0m3xuEXnQ+H3M/MefVF8BIBh4WBrRBO28FAUnIWq
         Zbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dnio0De21POelvllvqksyjy+SMPI9o8bFPvLcCpu5ds=;
        b=X/llQc0BUMI0XBd/ncPVu+JiY7OyjZOOnIqNlJIToEy/OtMY+JVgKbqPyWFVXFzMHK
         OPZM/yn+9x9lmigqC8wmAoS+Un3h1Y7VQhWE6l/1YGc4lOFponYCf+nRDzKuVqgTHWQi
         WZ1xXTK3CtRd+M5MQOJ/9G6YuaU7OEdztwwoPiOW5sY9SW4FLC4pGl6UjIpuTMjs+lkB
         GF7JWzTUcJYVp9WbGzNGN1FCyTK0Pgn10P+9VXzT/4isvixsABN9RCNoC5mYcT0FlKXN
         t93+omLDBsj677fHu3lr3K/GNuAyMQvCpSwEZwoJinZKPw/PLdjZY15uxwEv5YC/x0xc
         DMVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LoYUReKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si29841594ybt.84.2020.06.28.13.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 13:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LoYUReKu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpe3y-0004Uo-Fq
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 16:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpe3m-0004ST-Qn
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 16:37:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpe3l-0006T4-68
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 16:37:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h5so14573321wrc.7
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 13:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dnio0De21POelvllvqksyjy+SMPI9o8bFPvLcCpu5ds=;
 b=LoYUReKuPBBhh50+a5IguzVq+r/I83IUCW3vmf9iHNpl7awgxs7d1eCsTvEsraF0yH
 SKjC8/DKy29FdUqQocYTiBOyYFsz2vDst/dWQ5EmibRE0N6h4nClf0ZBGlfDpw20KzUO
 TBk5SOzrli/LAJ1Yn/ObMVNwqR9ojsmNkAaPBaP5fK+D+OYJx4Z6N8CPuYjnANJPNzTC
 yCIhxGNtfd9SIWTbr/TMYnsNqWbZtLLF5sofT7+XDEoZPRQ/zGbCsGzvIqMCg8dOyFu4
 N9ZC82uzQPwgTyGLiMiu/0gqtkIv7t3cFZ33qcR5yDbFP3xFfk7heu3khKafmxIj38/y
 BDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dnio0De21POelvllvqksyjy+SMPI9o8bFPvLcCpu5ds=;
 b=tMstuU5AG2DyP1rJZwNNmng8sR6iwF+h9H6o2jtBYASNi3TRjbWrzaMpXYN5m4eQ/5
 o/ybtFOX2P7/G9vJZ2FxB5h7K87vmpe58i3ThlFGx65YLCbmSCa2HLYUYPHOULiNWoqI
 YDEnIhuIPsm6JMhEXQZO43RrfAS5/WWgNTCBFgJB5+BN3u5AtgKwZ/1f59YifjVqyfhE
 cfWYu+Es/2RPY6vogKzHfsVexQ5+ipzogE7mJEmqwCnw8rjKfSEuULvvr3Pss2jf+zCW
 dlTvN/CV9sQixe3+r+OrQ3SzTBdbnElRiPgCxdCA1ahWhYP44tJ5xNlIyEwjouYA35Pa
 bSNg==
X-Gm-Message-State: AOAM5325bgX1dyg8BEzOFDg19nKs8SCQk3yScg7OK5FI/MhUSIj+d9nj
 JW4Y7GtqKIl8vUKuiwCSESm5nBoPZ0+4iA==
X-Received: by 2002:adf:f104:: with SMTP id r4mr14587232wro.90.1593376671386; 
 Sun, 28 Jun 2020 13:37:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r11sm8402884wmh.1.2020.06.28.13.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 13:37:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] tosa: fix Coverity CID 1421929
Date: Sun, 28 Jun 2020 21:37:46 +0100
Message-Id: <20200628203748.14250-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gL6L9lJDVwig

This series fixes Coverity issue CID 1421929, which pointed out that
the 'outsignals' in tosa_gpio_setup() were leaked, in the same way
that the equivalent bug for spitz was fixed in the series I posted
earlier: instead of using qemu_allocate_irqs() we create a device
to encapsulate the handling of the misc GPIO lines on this board.
This is simpler than the spitz case because for tosa we don't need
to work with any of the other devices on the board, so the misc-gpio
device can be simple and self-contained.

As with spitz, I started out by tidying up some stray hard-tabs.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/tosa.c: Detabify
  hw/arm/tosa: Encapsulate misc GPIO handling in a device

 hw/arm/tosa.c | 132 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 86 insertions(+), 46 deletions(-)

-- 
2.20.1


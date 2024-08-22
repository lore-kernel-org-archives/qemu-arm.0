Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp702566njb;
        Thu, 22 Aug 2024 09:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUC0bLuuoqtnGeJtj056sQL70/1adfvKMA/a5uY1rcz6gXogH23C0z20Oon9Sdfv/TDw8e2YOOr9aYbug==@linaro.org
X-Google-Smtp-Source: AGHT+IHtbT9C/GaLbkXHbMWID3bFKCHoGA0uKJYiWZ/MYYk6g/FwKaqOoFKv2HdvreLpsvIV0YdI
X-Received: by 2002:a05:6122:1790:b0:4fc:da8f:c8a8 with SMTP id 71dfb90a1353d-4fcf18fc84cmr7814749e0c.1.1724343755127;
        Thu, 22 Aug 2024 09:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724343755; cv=none;
        d=google.com; s=arc-20160816;
        b=mGt13X1rjYHzz42NWFRbhXIAhzoUM19Cmxghl57qVvWyBZBpXHEhLVH4NBcbmKDsvY
         8vFCVbewY2QoH1EWdGzdFvm9rzeG3SL7sInMLoWbZnE3jqH+MzNyNk5KlWj8fQjFrvYD
         m24Qpj4GXM1ZMYYvVGYgTDZbEqjQiSwB18bvW3aLP2y+Ux5Cn54TCUgye0YqWTYWWHaJ
         xm10qQuCfrV/w1YzvdSfP9/H3IvLMW2qh8rQmo8mqY6J5sUNbUMHrJDyEmZ5zjoZneiC
         AHFHeRXbUyunRzM3nqge6dIz9NtD0bzJwtb4bCiMOYfaY65NFwW80WxveidaLgqBk4Jb
         33lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7Pwg1o239tHw5GeNWwmrUQKUbQB8ts+OmOxcr++H9xA=;
        fh=eKvyMq82ozF2pexIVE339+mXcynob0ROL80gQzK9b2g=;
        b=Myqu7H6ScSXK7fLMjtDLhoSl3NV/YNS7NLqV0Vrv7XtzA5FX2eCzkHHzx2aezsknU0
         UigNGSExHFbQ15h6gZlJXb3aX2KhpFHQVmE7dhGgzHuNbzuhY+VylzGeW91Zlb2VuAQI
         SC8ZQjTO4NNvubKbkwNT6ZglxWI5Nv+pmJpLq42a4DHU0b8uuApSKub4rSN7oDlwExPz
         j0x071gxp1xX9icfpKApLjgeaDAiv9uMnBSzGw1DZKxbkIuaUYtzkITBi+vZeYzAhpqK
         1jNMQh+W7E7VFCI/nKd2VvlYZfNMukzTf8pAWHUw47Ip4cZsAfPu/lQ1Kq5uesuHSeu1
         REtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EmlNIVRI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4fd0824c4f8si420004e0c.69.2024.08.22.09.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 09:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EmlNIVRI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shAZC-00052Q-B9; Thu, 22 Aug 2024 12:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ5-0004tl-VD
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ2-0007JZ-5Q
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-428119da952so7826755e9.0
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724343689; x=1724948489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Pwg1o239tHw5GeNWwmrUQKUbQB8ts+OmOxcr++H9xA=;
 b=EmlNIVRIITaRXxUCIJQate2Qp7Sa53D1fbFsl1wtvWfVuKlgZCpvXSCuHArYz5XXmQ
 czyhncuiP1ETNCLNe4qTw6c14YzglyUYpbBW3pY1l60MpdOmPk81+mkK3/sL9mGmk/PK
 i8n0fSEvLqAIiWjo4L7npTh0q+KrLt6uXrUM514X1vYxiAuJMKZ3m0IxPMfDdfQhTpXB
 HUialNPN4iTmhl9fbnWj+UPpqBYOa3rPYDCCqEZhJ1kUUJCK/hxyj/nAdkVqD5CqxvsX
 kG0pXCfkR6qb/6N5zIvr5yp3frg8YcLwHnXuR0umDej+b8Us2PfcKVEGStUr+PrxMbJt
 4znA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724343689; x=1724948489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Pwg1o239tHw5GeNWwmrUQKUbQB8ts+OmOxcr++H9xA=;
 b=hTRmpWX8CrJUKW3l3aCslXjl4loDkKBL0rxPQZV6se5s8wCotC8BKGwmL8swUrJYiV
 r8vSoUMNVh2SzZ/QI7VPPgwOGQTziYcAXtKvDek7jLjMyCZ7F509NfrT1wl/MVmtl/oI
 HS4gaBklHUtGJgT6M5uk4Li8UGkfYd7sollCclmsZ/dl3csXnyYhF3O1oF6txEiB8Esj
 uGdByAumVe8bSNUKz9BDZU90+5g5wa5irbKZuUQPwny90YSezawZw8bGTJ+ODSDg5xqy
 ei/3jx2az+67OwwynhDg/CawML4iekPRV13cqwrlp7CH+h7TWo90x+xjOhC3fSkPxOCL
 bueA==
X-Gm-Message-State: AOJu0YzxLeROIpmIxXSn+9MYfp0b1hxqvcidrtE7TmuFSRGJwfzPYpHL
 8D7cY0cjShaZj4rH0AWvdIf/NH5IzKwT1FAK2jlNX24eQrJvVAE1CTDoSowzNxWZnxlSQ1QwX3C
 s
X-Received: by 2002:a05:600c:3b08:b0:426:60e4:c691 with SMTP id
 5b1f17b1804b1-42abf05796dmr39379265e9.11.1724343689279; 
 Thu, 22 Aug 2024 09:21:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162347sm28928485e9.23.2024.08.22.09.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:21:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH for-9.2 0/6] arm: xlnx: fix minor memory leaks
Date: Thu, 22 Aug 2024 17:21:21 +0100
Message-Id: <20240822162127.705879-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AvPKs7pygmWD

This patchset fixes a collection of minor memory leaks in
various xlnx devices, all detected by clang LeakSanitizer
when running 'make check'. Since these are longstanding
and not very important leaks, this is 9.2 material.

thanks
-- PMM

Peter Maydell (6):
  hw/misc/xlnx-versal-cfu: destroy fifo in finalize
  hw/misc/xlnx-versal-trng: Free s->prng in finalize, not unrealize
  hw/nvram/xlnx-bbram: Call register_finalize_block
  hw/nvram/xlnx-zynqmp-efuse: Call register_finalize_block
  hw/misc/xlnx-versal-trng: Call register_finalize_block
  hm/nvram/xlnx-versal-efuse-ctrl: Call register_finalize_block

 include/hw/misc/xlnx-versal-trng.h   |  1 +
 include/hw/nvram/xlnx-bbram.h        |  1 +
 include/hw/nvram/xlnx-versal-efuse.h |  1 +
 include/hw/nvram/xlnx-zynqmp-efuse.h |  1 +
 hw/misc/xlnx-versal-cfu.c            |  8 ++++++++
 hw/misc/xlnx-versal-trng.c           | 12 ++++++------
 hw/nvram/xlnx-bbram.c                | 13 ++++++++++---
 hw/nvram/xlnx-versal-efuse-ctrl.c    |  6 +++---
 hw/nvram/xlnx-zynqmp-efuse.c         | 13 ++++++++++---
 9 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.34.1


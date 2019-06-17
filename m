Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2783973wrg;
        Mon, 17 Jun 2019 10:53:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy57Yd2g/NXRh086Wgp+Do+73UESwBMCgKU/hNvuzXCMseX/NDLQAm5GfPDQYvkx+LbEb3U
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr13285111lfn.12.1560794037225;
        Mon, 17 Jun 2019 10:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560794037; cv=none;
        d=google.com; s=arc-20160816;
        b=BdgBalYjiIfniCCYITdHUrUP96pL1bX79/y+NKCe6v/16j2NGRkCXXk46PvzJPmstf
         OP1x2a4oO0YsD3WH/QMFwjrXNs++ydKHNa3Yiei7v58yoW+B5jm2kWwe2QLsEi978U29
         Vqrlett2kYaBH+ugPGETSj7xXosXqRYRzy0cXgCXoIDHmeVkQFfYK3EPjQ9NUkJGCWLt
         /Jar/5hj+aHccRQnPIN3pNYAS4LqewdPkxcluo5vUOPjWVI97vWZ/tEG+lpz+5RGqp09
         zko2TlW7xMpIjd41Y1P7d5duHIAtt2TefbC2pakIzlacp0YirRURg1UTQ0ehdJaraRE3
         zDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=bwrup4kLeXvOMHO6drVlshIwfFzLp0o5ivBB3kuYX/A=;
        b=VzdjrZDP0QXxIUiFpZGlfZkmXh41TZqJdVM0dHm2cVI66213gd3aVTi72Hs+6W5tGk
         lwy7xlO7V/lpPkBdoEEMW2btL3BvcY/DuffJ5Ra5R/ggmbRaf2d4U/aHFEy42zKpeXn5
         G+y0MMM9DoFQ0t5+zTxYnnHHLoTpb5pIk3RoixtaYMqq329xE5/W0D7Q9tqQzvRg3duC
         QLLCbFrGJ7VId/xc8FMSS+wZ6rb/X7h1QQ3gNTdYo/JoHv3RPGdT6RPDfjO2B7HxxjlY
         6DVeUt7QBiz7SAsGNZAwQ9nODQJc5wPuBwL+u01HPOToIctvsMOJL5HD43Dud42OpwpP
         HYoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzjyTQ1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si1065390ejb.349.2019.06.17.10.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 10:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZzjyTQ1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcvpL-0007fY-7X
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 13:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvoq-0007en-E5
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcvoo-0000Zb-8S
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcvoo-0000Z1-0h
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 13:53:22 -0400
Received: by mail-wm1-x334.google.com with SMTP id x15so328748wmj.3
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 10:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwrup4kLeXvOMHO6drVlshIwfFzLp0o5ivBB3kuYX/A=;
 b=ZzjyTQ1KPHAzjKtq9yamCZ+4dHe0nJ4bFUfWsaU/zXGTHo0WIOlNGN9kw4X1Zx5FtP
 Y9Et/NKhj8SroR5b8+NKAzndOf7MEkPqQji40qYJK6znBCbvCyjm3DE8dKgVCcBzaAii
 2Vt2/PAhuqeg80XrgPJ9uSeGJxjb0dKJSz7BRx+8tIEFTBPPUzTZlNxeTN8Yv5ogig0t
 57q8X5dIGDluXPQdj6jPk3zQ6UKR+z30fmmqcACzVICOCeOXnzhH2wgY5DYzC4bFErGU
 GcSG+GmFavqgO0YKZAvzokSmfg5UIckXuigkaPLXBkdjO0tMkvU/pr+TMCaBks286B5j
 8Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwrup4kLeXvOMHO6drVlshIwfFzLp0o5ivBB3kuYX/A=;
 b=sAcAHghJOMH7dHZ+kn1+oEVLBJ3zyfw2YPHcQbm2Z5X+M/wjpJc/eSFBTSDVjqt7vj
 vqWEIeLXb0PEo2B93Knc+BRaODzQfDDDT1Wg+Z/JJj8H2MNzt3BUR8GGE7u8JRFg1zBj
 7rgIGSZcMmNcZ1qUvV2PkYStYtcfBq7RoCCLnVvCdugWQ59wDWJW85Q5tZfyeaK+A9YS
 BybxOeo5T6/+sjhohY29XcCpiKAXhA0SQN+CVr7NUOeO8YVJfQVFhNB65gUunNGRnmaC
 niqRk6Up7vmF2XIHB4SsDgru+A0LrqGXVYoVzlWq1XdwGv2TIA12ci3K8604TN4m53Jc
 ysTQ==
X-Gm-Message-State: APjAAAXGWWpYSMYfUboC8VrwOzEnsIQrV2T8PU87L+g1JrzNhyxEVGyb
 bXUSWha9wXJ+gxdmoNNqGeetfxrhi9QHyw==
X-Received: by 2002:a1c:7a15:: with SMTP id v21mr19802236wmc.82.1560793999592; 
 Mon, 17 Jun 2019 10:53:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t14sm8713619wrr.33.2019.06.17.10.53.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 10:53:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:53:11 +0100
Message-Id: <20190617175317.27557-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
Subject: [Qemu-arm] [PATCH 0/6] Six minor M-profile bugfixes
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
X-TUID: rHFBQR47Rv27

This series fixes half a dozen miscellaneous minor bugs
in our M-profile emulation. (The condbits fix also affects
A-profile cores.)

thanks
-- PMM

Peter Maydell (6):
  target/arm: NS BusFault on vector table fetch escalates to NS
    HardFault
  arm v8M: Forcibly clear negative-priority exceptions on deactivate
  target/arm: v8M: Check state of exception being returned from
  target/arm: Use _ra versions of cpu_stl_data() in v7M helpers
  hw/timer/armv7m_systick: Forbid non-privileged accesses
  target/arm: Execute Thumb instructions when their condbits are 0xf

 hw/intc/armv7m_nvic.c     | 54 ++++++++++++++++++++++++++++++++++-----
 hw/timer/armv7m_systick.c | 26 ++++++++++++++-----
 target/arm/helper.c       | 45 ++++++++++++++++++++++----------
 target/arm/translate.c    | 15 +++++++++--
 4 files changed, 112 insertions(+), 28 deletions(-)

-- 
2.20.1


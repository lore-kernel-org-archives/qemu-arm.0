Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp594980lfc;
        Tue, 13 Jul 2021 06:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9g03iewCbEFK3D986HmPgY4wkHeI+m/ppVr9NEpKaYldL7agJ6lVJj2tj52e9l7Raa9i/
X-Received: by 2002:a17:906:bc8b:: with SMTP id lv11mr5708586ejb.331.1626183487936;
        Tue, 13 Jul 2021 06:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183487; cv=none;
        d=google.com; s=arc-20160816;
        b=xq4/dusFYncOmfNMcWkNG3smzkiHfB6dSeCpdae24iOh0SvUtcP+LxFoqxs1tJL7zN
         FHqJ5V8IC9oC318I/qgo60PBEgL6BC3ljbZMDx3cXNnSaBg/3y2bNXVDJ6mOJNEiint1
         Ma52D80EXbAxFyXhIlTk1giRfFoVlD/Rhvtxq/62oMyWqYGM51OY3nMCZwm4IqBbpGfm
         TH5UCTy8Nd4HAImlc1GXAUUCcbTsbGiEBLQd4AdWKdSmHpikQ3nHnxWcWyDAuh1IXTsi
         R5uuoASAm03S8ucM7W8htyhu9yAJiaEHTSt1WifRjh6EoPvRu3JMbGn+bqaUpJOP3HYH
         ySjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=AyiWksB98Xn9P+lq/nb9KeFGaTnrfwhjfvza6KjKJFQ=;
        b=IKWNzC1iL8af1oXmyk79khA8WKW8EzineuYuWt0mOa5kDnMBoIT7JYt+BRBJY/VTVn
         cqxwKGC6UQdWY1nAqXZOCNWUwhnty413AkSYq4N/FNH+xAQNlSmOSpD0m+wum/g14kQN
         /4TPk2YjwL2e8L+y/EgG2F+X3Q9dE2hQQ0FlML+Sq5aYLJ+K0cMKAeRzXL5H0XiIwsO/
         yEufPO10t5JG6w5P1Rxviyoo7BFptA3ZDVcx6gAjJ+ppgZ6I9jNbMQVD6rAlSmVGAIVR
         51astnaMtOnkRQDb3bqB8brUe9QARm02cBF7NWFvpwVk+LWHqXD5CtijBqXXfsPHkP8m
         C8bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WKDUGBIV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si15192099eds.289.2021.07.13.06.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WKDUGBIV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Ibu-0008En-RG
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbM-0008EW-65
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbK-0003Zk-Le
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g16so20621511wrw.5
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyiWksB98Xn9P+lq/nb9KeFGaTnrfwhjfvza6KjKJFQ=;
 b=WKDUGBIV/+bHVnCyeBzJXGUHS7DmfJItsSX3VXIKxX1xF3uiiQmJbDkZbM1CbST/45
 OaZ8RRw3iAsaSMCFSwS/m5WuYaEqN5oQDbF4TEtMbJp3IVLNWA5kUQYmUpEwnW3lIFvH
 apu4rFhHfd904+4oC5z0U3mK9E5XuHUdayYRxQ17IdEqwtbZsqYj8mqyox9KAi6Vy+KR
 bEUG13gUr+y/SKc/Z5s8FWTooFgnc2kMpXeie1nVNpUd/42VvRfsnv6XZFqt3Brxa2gv
 tYCgakTk8/fufv/iqI49yEJdE4EHDSsL69u2MQwq9gy54a8cwSa5eqXJKW4i1Eqanwsm
 1hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyiWksB98Xn9P+lq/nb9KeFGaTnrfwhjfvza6KjKJFQ=;
 b=tgBf28ZnHvLYWkyAHFeBEkZT80MibNx3Gnqm8zWEZpOcaRzkkRStLOIXOZhelKWG5p
 LjEoyTBadwON5WwS85JUsLy1C1QHsgPkWKZRMTnrKz/v9iDJoQduiZWjC6bnXMDkTTFH
 oxhbJRN8p0Z2/KUBrW1cZSW/hmfymMZwt8HqWZYz/VeJDZN62a4GmfxjjUQ0l4/ICst5
 jDeGhyohmKiqrnWzLIELCwMCx/HuYjCk2lPIF/rrTVtq3DejrKn4OfC6HULB9+UFPcdy
 Z+1N/IPV+0Zr7MqZ7Nq8jbUKJU9ghZ3s5HhMEs7Zq0MWDjmIP1ixOekGG4iVFeseHU1k
 kqOA==
X-Gm-Message-State: AOAM532ygWjEZsInOiwWRZNoBzl6pMhfXwVkIH7D21gm9rTCoSdIW0wU
 DOndeowvusls1Jek5QY8PlfXsR7nrD9hJG+/
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr5955738wrx.98.1626183449102; 
 Tue, 13 Jul 2021 06:37:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/34] target/arm: Third slice of MVE implementation
Date: Tue, 13 Jul 2021 14:36:52 +0100
Message-Id: <20210713133726.26842-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4sp81odnVio5

This patchseries provides the third slice of the MVE implementation.
In this series:
 * fixes for minor bugs in a couple of the insns already upstream
 * all the remaining integer instructions
 * the remaining loads and stores (scatter-gather and interleaving)

This is obviously for-6.2 material, so no urgency in reviewing it.
But "all the integer stuff done" seemed like an obvious natural
break point to send out what I've done so far.

I apologize in advance for the final patch, which was tricky for
me to write and is probably going to be painful to review too.
This is mostly because I find the interleaving loads/stores
rather confusing...

thanks
-- PMM

Peter Maydell (34):
  target/arm: Note that we handle VMOVL as a special case of VSHLL
  target/arm: Print MVE VPR in CPU dumps
  target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
  target/arm: Fix signed VADDV
  target/arm: Fix mask handling for MVE narrowing operations
  target/arm: Fix 48-bit saturating shifts
  target/arm: Fix calculation of LTP mask when LR is 0
  target/arm: Fix VPT advance when ECI is non-zero
  target/arm: Factor out mve_eci_mask()
  target/arm: Fix VLDRB/H/W for predicated elements
  target/arm: Implement MVE VMULL (polynomial)
  target/arm: Implement MVE incrementing/decrementing dup insns
  target/arm: Factor out gen_vpst()
  target/arm: Implement MVE integer vector comparisons
  target/arm: Implement MVE integer vector-vs-scalar comparisons
  target/arm: Implement MVE VPSEL
  target/arm: Implement MVE VMLAS
  target/arm: Implement MVE shift-by-scalar
  target/arm: Move 'x' and 'a' bit definitions into vmlaldav formats
  target/arm: Implement MVE integer min/max across vector
  target/arm: Implement MVE VABAV
  target/arm: Implement MVE narrowing moves
  target/arm: Rename MVEGenDualAccOpFn to MVEGenLongDualAccOpFn
  target/arm: Implement MVE VMLADAV and VMLSLDAV
  target/arm: Implement MVE VMLA
  target/arm: Implement MVE saturating doubling multiply accumulates
  target/arm: Implement MVE VQABS, VQNEG
  target/arm: Implement MVE VMAXA, VMINA
  target/arm: Implement MVE VMOV to/from 2 general-purpose registers
  target/arm: Implement MVE VPNOT
  target/arm: Implement MVE VCTP
  target/arm: Implement MVE scatter-gather insns
  target/arm: Implement MVE scatter-gather immediate forms
  target/arm: Implement MVE interleaving loads/stores

 target/arm/helper-mve.h    |  295 +++++++++
 target/arm/translate-a32.h |    2 +
 target/arm/vec_internal.h  |   11 +
 target/arm/mve.decode      |  228 ++++++-
 target/arm/t32.decode      |    1 +
 target/arm/cpu.c           |    3 +
 target/arm/mve_helper.c    | 1259 ++++++++++++++++++++++++++++++++++--
 target/arm/translate-mve.c |  865 ++++++++++++++++++++++++-
 target/arm/translate-vfp.c |    2 +-
 target/arm/translate.c     |   33 +
 target/arm/vec_helper.c    |   14 +-
 11 files changed, 2628 insertions(+), 85 deletions(-)

-- 
2.20.1


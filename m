Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp356921lfb;
        Thu, 2 Sep 2021 08:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZLkuCmHHx+ctaaTwasqNs7vWftEbVQ2x4P0NlRz8MUzQyL3Jjez99yMLWEWmJL3gNGK5S
X-Received: by 2002:a17:907:20d1:: with SMTP id qq17mr4367797ejb.439.1630595370147;
        Thu, 02 Sep 2021 08:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630595370; cv=none;
        d=google.com; s=arc-20160816;
        b=OMgO/hWlqLGpez+1HPgwm0VYtBen39kWzMEK56Iv6Edt8Oc8zFMwqGWgHaauFaZyMe
         m8U5rrptTe60i6F90MwzLAymzzYKgnhy66ncluEMnAGu5SaX41CTK0Ct8yvT+It7tiIm
         PQ2O+07JF54gBln+6nHOCMtd3ySEg28lusAN2+Ugast49GbtFZ7OVG0uKWy/vEpTUhHi
         eNH7xycEFU6l6TKbbgiCdblbLgxpos7BkxORw2Yn9VsmID+IxQ6+7O4upLOliPkOJCIX
         ui1oWinMx83vkWlcJOHMp8UHsqnPUXIucNfbAF8YgfXgAMpczvQ9T3H7lsyrnD12I23K
         CEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+ZrYWryMji2cS8E64N0cPJbqxFDojNEZjXg9qTOb2Ak=;
        b=oJxrOZsdBatwsZFDzztuQTr3nGZF4Urxo6GxAhF2RfuA1lb6LpBRLObFbVulxBmTN7
         qmjDfyUY9LUajoyHQ1Zsp1Yg2dgwlB18UAUAnZ7cWDQuzUjQtVfT6cTvZ4NbTOiU3c9n
         X63zzqCZH+rghA469qrfPQWqmqrzz5c7LQRDJXP7KBOLUHCLmePZBo7AppSiD4KKCApO
         tBpATO40xWWf6Z6oDBfv5idgXRVRd8xohTRgUfPGpQ8KeWeeJweyzygJs2XDvYcGaTeJ
         MZXvxvJVutVKIZLqFvHLuyXl0fZTsAnSJq6l41c0TseVbLEPS+ru16dfH3TNOnYNMGsU
         8D9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXFqTXM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si2370154eda.42.2021.09.02.08.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXFqTXM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLoLJ-0000SS-4z
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL6-0000QA-O9
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLoL4-0003Nu-53
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:09:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso1603974wmr.1
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZrYWryMji2cS8E64N0cPJbqxFDojNEZjXg9qTOb2Ak=;
 b=nXFqTXM9ihSZBu0zD65VODxbub3LqUOwkYTd2cNBnWfZ8Y/pm+ervd/YsAcuV14oK6
 bnumdarpLBRJQFzvVjYIz3AdQbqt1T8lRSev4qS0dS+Db5mu05zXWKDWpuM2F9Wqy2/M
 W5oX1v6KBpHXyPWWYpU+MLLF7e3UMxj9rfhwmNzAUO1cnt9eQlIGZTKrqzRwqBbYGx+/
 LCfSjPCScMQ74euT8NfvH8v53/FAtkh+UzR2/xHYN4r+InSNr31QN6IQAaxrerV5JEC8
 9JG5PM5iMftNWmnuvkK68Y15at4q1oIL4h8FzTSXBba5njvNDqbqVmF5eIcKqEzxBKu6
 FZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ZrYWryMji2cS8E64N0cPJbqxFDojNEZjXg9qTOb2Ak=;
 b=SYT/jmLgEvdYNrMCugVEehU/xIQ7Q4CsMZbzk5wLqjWwhHTjpc9P9ETP/X85qKp2iB
 BFzZYAYb+B0nF5dhR7I+V7/3J2WGV1cVgVBODH9DL2Urn5+15q5pvBCWgb76N1O0oylR
 YBe1xv28I5S5+Fg+d9d37ZBJuCtMtZVANWUJOCPMuTw22nhF5eGsGAH1dEoncshcQObs
 3MkBWSPz89jmuHjURzL3llemYJTcij6dWthtzQvN+xP6Eky0v66lSPkqJQruVa0af8hS
 gj5XevAsSfSbDdiqTwBwbmJb6VXZMVfdAq5po9dwkb2RNTH6ZeH+jv1KTVO3Xz0H/zTw
 87Lw==
X-Gm-Message-State: AOAM530jQyeODqUTcc7Do2Chj6N4sQ3jygjReEF5hzWf1PW6s1d3ECNz
 dTPCP61P8JjDuzuKg1RJW8nMGe1gjv4aAQ==
X-Received: by 2002:a7b:c408:: with SMTP id k8mr3704357wmi.184.1630595352061; 
 Thu, 02 Sep 2021 08:09:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c24sm2107842wrb.57.2021.09.02.08.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:09:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
Date: Thu,  2 Sep 2021 16:09:06 +0100
Message-Id: <20210902150910.15748-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1tLQOwVvK9mZ

This patchset uses the TCG vector ops for some MVE
instructions. We can only do this when we know that none
of the MVE lanes are predicated, ie when neither tail
predication nor VPT predication nor ECI partial insn
execution are happening.

Patch 1 adds a TB flag so we can track whether we can
safely assume that the insn operates on the entire vector,
and patches 2, 3, 4 use that to vectorize some simple
cases (bitwise logic ops, integer add, sub, mul, min, max,
abs and neg).

This small initial patchset is intended as a check that
the general structure for handling this makes sense;
there are almost certainly other places we could improve
the codegen for the non-predicated case.

Richard: if you have time to scan through the MVE insns
and suggest which ones would benefit from a vectorized
version that would be very helpful...

thanks
-- PMM

Peter Maydell (4):
  target/arm: Add TB flag for "MVE insns not predicated"
  target/arm: Optimize MVE logic ops
  target/arm: Optimize MVE arithmetic ops
  target/arm: Optimize MVE VNEG, VABS

 target/arm/cpu.h              |   4 +-
 target/arm/translate.h        |   2 +
 target/arm/helper.c           |  23 ++++++++
 target/arm/translate-m-nocp.c |   8 +++
 target/arm/translate-mve.c    | 102 ++++++++++++++++++++++------------
 target/arm/translate-vfp.c    |   3 +
 target/arm/translate.c        |   4 ++
 7 files changed, 110 insertions(+), 36 deletions(-)

-- 
2.20.1


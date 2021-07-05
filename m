Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1172294lfk;
        Mon, 5 Jul 2021 05:21:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5aiD+Lbfklg4Sqk+/JNcQH032W/QGYkzzYDi7aGNP+x1rykS37loFdOacML7zvuEpanhA
X-Received: by 2002:a17:907:1c01:: with SMTP id nc1mr12742773ejc.504.1625487668103;
        Mon, 05 Jul 2021 05:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625487668; cv=none;
        d=google.com; s=arc-20160816;
        b=DAazqRZCAoqj5ehINryOoNfYNaE41iD74FP+BZAVHuCLcQP1xvH04PRjcqyOs9fAXO
         JOa5iao4AVDCrsXzlUbmnHsxTK39wpBLP1ZZefOT5pxa8rhjtjgaX6wU0q6zP98/mlwI
         KP350VHlXabd4VZc9848VPhR8Y/waNXOnE6YyL3SQF4imDQytiXw7eDbpPb4VF+Jei22
         ejZEUV9DmAVnCfAmuYkZabPY7hn2slE4uoKLf1bqsyExiI1YfAQnxeyuLo79GMwagpOV
         STsRCY93BcyOzZ+t63uAX3/nDFRZNQOqfUASCyiq26owb5VSzPhTLbDxjbTy0ywuibXm
         KO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6gPMmqfd0GxTBLGXdGq3kwjL5iZPO7fHBJ4CRJajYow=;
        b=L0xFL9FfJi43ygvLura71+V0ubEQ8h8kr5w6HvGl25gW6TyitFlciyLN3hguhwb+K5
         EpnrLfpnhTn/d2STtavk+rO5AwQlZIZN9KV7BXim46pI3IPugl2/XzzNTP+43BwlTb5N
         dYHkDyWuCu847uf9eenejFcubOi6tk2YZNfk3hckhyW84+tJRHT5FH/BQzcfreQNESvK
         MVZ+akqDA1Oy0THUm5mKhnuYud5jQoh2Ew4buKbzMCMuVYF7F0/iTPbxLPM9EHQNiEdC
         sZnLSYubvjNCbRsKJyZ6YuGfIjaNmLu6qrlwA4ISoyN3969knR7yi0bML4s0qnsSK6Uk
         noLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hxxMbcEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si1022123edw.9.2021.07.05.05.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 05:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hxxMbcEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0Nb1-0004ZT-5h
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 08:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaV-0003hb-3G
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 08:20:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaJ-0001yz-Qf
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 08:20:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 i2-20020a05600c3542b02902058529ea07so3474229wmq.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6gPMmqfd0GxTBLGXdGq3kwjL5iZPO7fHBJ4CRJajYow=;
 b=hxxMbcEocx4Rr2mLT21LKQY+ocdf4CIDdG1rWXDtixvYvvbE8ec79t1bmVOHV+vThI
 gMkqeIrHdRHLImlwVsPagr4XVSkmkvjhMTXt/OBa2bkjSLp6+4djidG0vmG+J95j6g4/
 yTSkT1oKTgXu9BwMjwrkXOc7Z1NKs/isOR1SryNj+bHxeMd8sxtKn8Z1Yj26waxCTT6a
 QU/NtHyULQkT8uHKa46ClRM+i8oNBb8bSekmfWcul2G9Hm/6/20w/mM8y4M2OFCrBSXZ
 lKeh1YTfRu3zMWAsKik+BnzpztpJnKm/8XOFzpdN8+Q/rdSUVsEhWcVVd5efYYyoxqkg
 PABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6gPMmqfd0GxTBLGXdGq3kwjL5iZPO7fHBJ4CRJajYow=;
 b=c0ab9hIu3yD7JPwmP2hmDEsgQ65edRJ/db+DN4Vk9ekLrtAvCo6vKa4wp3UTwhFshL
 fonQYOYl6IMl6vZFBMhHiGsJkJoZZOgUallCEYSAPZAnriiFpSIpD0L3f6R9adNnkREE
 rhKcQrx8B9RIcuEWTD+S9rmt7bbSrBqAL56fkd0ZVDNVp/DJJS5i4n3AGvAgedW4ZWPF
 yS3HJ6Zn0H+WjBVVBXxb884OzMdRWtiyij2V97GLaG1JEtf7ZIHxLZ30Z9NpMtn7Kd8Y
 bZPK42eppzkMlCNPePCid/9cHDlfAFZP0YI6FfZJdQqVshel8nq8g8Y6vdHL4XvicVJy
 BPIg==
X-Gm-Message-State: AOAM531oSSkAW3bV+/tmrPVtM8FZlN3I80tHNk2adPW5X42jreDxU/MX
 8FTmq0G3NDvTrDRrqRGZoqQ8ZRigE/95dAxH
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr14672248wmj.167.1625487620077; 
 Mon, 05 Jul 2021 05:20:20 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] docs: Add skeletal documentation of highbank and midway
Date: Mon,  5 Jul 2021 13:20:11 +0100
Message-Id: <20210705122011.753-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705122011.753-1-peter.maydell@linaro.org>
References: <20210705122011.753-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vVuWi69x0A2O

Add skeletal documentation for the highbank and midway machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/highbank.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst   |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/highbank.rst

diff --git a/docs/system/arm/highbank.rst b/docs/system/arm/highbank.rst
new file mode 100644
index 00000000000..bb4965b367f
--- /dev/null
+++ b/docs/system/arm/highbank.rst
@@ -0,0 +1,19 @@
+Calxeda Highbank and Midway (``highbank``, ``midway``)
+======================================================
+
+``highbank`` is a model of the Calxeda Highbank (ECX-1000) system,
+which has four Cortex-A9 cores.
+
+``midway`` is a model of the Calxeda Midway (ECX-2000) system,
+which has four Cortex-A15 cores.
+
+Emulated devices:
+
+- L2x0 cache controller
+- SP804 dual timer
+- PL011 UART
+- PL061 GPIOs
+- PL031 RTC
+- PL022 synchronous serial port controller
+- AHCI
+- XGMAC ethernet controllers
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index d316e684106..569983997cf 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/cubieboard
    arm/emcraft-sf2
+   arm/highbank
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index dbbd71958ac..91546c0e943 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,6 +642,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/highbank.c
 F: hw/net/xgmac.c
+F: docs/system/arm/highbank.rst
 
 Canon DIGIC
 M: Antony Pavlov <antonynpavlov@gmail.com>
-- 
2.20.1


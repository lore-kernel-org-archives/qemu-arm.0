Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1886510ocs;
        Fri, 30 Sep 2022 10:53:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Kk1Bj9+nhNuz8ppTJbilh8ngD3fML7Mah3Mi+8Wxd8f8PcfFGxJxDwWQUNcTPDMd9Kzsp
X-Received: by 2002:ad4:5be1:0:b0:498:79dc:d3ff with SMTP id k1-20020ad45be1000000b0049879dcd3ffmr7661781qvc.87.1664560423998;
        Fri, 30 Sep 2022 10:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664560423; cv=none;
        d=google.com; s=arc-20160816;
        b=eyzNL9OxX/11imgyoCLXSdDL3x2dhcS5mkoZv/viSHv2jI0Zt0HsasA4f2FzSyhbXh
         pQP5Ng73huNK0pvdIWDcDAaXDxToRC6nore8hZJYcDk4F16UPVAR8ih21QEgKs5W1Yr/
         4qBgwn5oVMbC4kGtBhYScZbNhe124Pzc/+bp730SXLlRs0xLD96vEokS5yrtVC+ENVQl
         eRNVHzR0D4ZRX6wrtKD6KCd0b7npDCj7fttNAPyfr3/H3j8A54Ug9fdlO6ccv2vY17JU
         9OatoCB04SZL5mmC4531YeFzC4m7026g8FBM7d3YQY6Ebw6Hw9nufqjTMK6G6JYfiZTH
         jitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vpzGp1lGWR+eI558Yg4wTFQVUNx1KY1mfCK5wMthB7o=;
        b=c1wDA5UHgOG763cal2rQkNM/9xggE6Ik3TT8CFN23YcRGo+Bk9cZ5vXiPC5O46PcNB
         li3UbUDFw8cQQp8ly9QkJ8vqWpAj1m/nr0zD1j1MHuL1Wj+Qnt6AUUykcd2yHsvQkr5b
         WOsiuhJXMFrLb18ybkrlW26gVl6ZDifuIWkz8ZbiqqXMCvm88gpeU4xHqkLrzauG/IAc
         3fjnvj7SOfXT1M5WdQBUNSCJdDsabymusQ5vSA6P0CdI7fx1+FIfRC/W6JZ5j+Zc+VdL
         m8zLAO0aKKej+9mcokIAJx+jF+yncJKT46GRlvJEXLZ7Hqsls00pmx1IaR6a0O0s4DGj
         RqIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boAQeHS1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a0562140c2900b004afb4408301si1505892qvd.520.2022.09.30.10.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 10:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boAQeHS1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeKCl-0005AC-Hs
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 13:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8H-00029d-0R
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:49:05 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8F-0006nT-4b
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:49:04 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso5474020wmq.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 10:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=vpzGp1lGWR+eI558Yg4wTFQVUNx1KY1mfCK5wMthB7o=;
 b=boAQeHS1Q+fR3MEt/qXE1nOjjSeXXcxPY86hweEzXKoIZz21rp2HPdNHbhoPZC77H+
 4AgR53ook26pURagZdj0AMHLi3QbWTnp5k0SMdLsezCJDUnknrmwSe5/cBWyo5C58R1G
 LXTLaLge8HFko8lqL8Kl7n74vVK4uJPWAVSBmfECLgKpd3e5XAHdKpF/GYjrHZJXC2U+
 z4Q+oPZ1k24lBfvfwCmKuI5jOqkowyiOjoTWdx9KcmkckysizvH0czFAXHyvul/RUut7
 IvK1lLRhtJugMLEd6uxrqNyF1+YUsRyeyU5UW192m9dActEqHDfbLYxe71+o/0Zt3llp
 ab9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=vpzGp1lGWR+eI558Yg4wTFQVUNx1KY1mfCK5wMthB7o=;
 b=CuKQHGIwcBU1w7ZWy3JJkNWVyaQDwGCUr72CvxqLkyCp5wS0aRpeYp0btX+Aq0eEBX
 3+EMffCGH2h3eZmRRyNkUlSvEzHE1Drc2bupJ0l47DeOPFaNda2Z6vrBBj4ot27Up4Dr
 NPPFrFla4gGUjD4gKzEEM5e7uRcbUXfRImQKSmQ2jV8TKiBj0gAkPAXhXVFWAG8brKDk
 aOA7+TgXKwaDcnliK84tOpm3daxzk/qyiQL7JZzWoX5C9VbLffeWUzKWKBr/rWY6vhG0
 PN0NyQDebiTrMOoRX3a/l+15a9s8JYhogR6UbAHLdOQcJwv3ZgVAAvojybJiO4juqrIA
 GxSA==
X-Gm-Message-State: ACrzQf3Gp/k4RjXYr1Hfl5iEFim6imRTSzxu3lz4oEAWL1Uw/QC0FAbM
 1GDSusp7PH4j+G3XnbjY4cYiVbuMUBIDlA==
X-Received: by 2002:a05:600c:218d:b0:3b4:7749:c920 with SMTP id
 e13-20020a05600c218d00b003b47749c920mr15568512wme.190.1664560139882; 
 Fri, 30 Sep 2022 10:48:59 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm7703541wmh.23.2022.09.30.10.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 10:48:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Enforce implemented granule size limits
Date: Fri, 30 Sep 2022 18:48:51 +0100
Message-Id: <20220930174853.2233633-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZlfuBJLwuBBo

Arm CPUs support some subset of the granule (page) sizes 4K, 16K and
64K.  The guest selects the one it wants using bits in the TCR_ELx
registers.  If it tries to program these registers with a value that
is either reserved or which requests a size that the CPU does not
implement, the architecture requires that the CPU behaves as if the
field was programmed to some size that has been implemented.
Currently we don't implement this, and instead let the guest use any
granule size, even if the CPU ID register fields say it isn't
present.

Patch 1 in this series makes us enforce this architectural
requirement (the main effect will be that we stop incorrectly
implementing 16K granules on most of the non-cpu-max CPUs).

Patch 2 adds FEAT_GTG to the list of supported features, because
all this feature really is is the definition of the separate
fields for stage1 and stage2 granule support in ID_AA64MMFR0_EL1,
and we already updated -cpu max to report its granule support
that way when we were adding the LPA2 support.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Don't allow guest to use unimplemented granule sizes
  docs/system/arm/emulation.rst: Report FEAT_GTG support

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  33 ++++++++++
 target/arm/helper.c           | 110 +++++++++++++++++++++++++++++++---
 3 files changed, 136 insertions(+), 8 deletions(-)

-- 
2.25.1


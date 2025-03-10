Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1049233njc;
        Mon, 10 Mar 2025 03:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8qW+5umL/2jzgpgW07gRJRYq/+0Ou/qcSdP6gAQj3bvT0YOyomlnuE2a/uV2DLZvXCbKX86AXIvYN4A==@linaro.org
X-Google-Smtp-Source: AGHT+IESeEJIecPISj2LMtbcjsaDuAK4L9lewN14OliDyuxV0P8eU9MR1KamiU/mTa9hTeU4uh/G
X-Received: by 2002:a05:6214:29ef:b0:6e8:9d00:3d71 with SMTP id 6a1803df08f44-6e90063cdc2mr163768086d6.21.1741602526867;
        Mon, 10 Mar 2025 03:28:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741602526; cv=none;
        d=google.com; s=arc-20240605;
        b=guZ82E3R05/diGknEkntrELmZRx9O9LTuiVBQgwbSw2xu2nrb2XCNzEvHAubIget8F
         HAdc46ursP4Qv5XI4Tj0rdKjnoviSv9PgK2RtVJRHU1WxpSm0d7V7Vdeb3ErKedhxZW1
         M1KH0smcV/hdAmv3IO5ZQ6SCSM9ZKl4cngsuGNnHttQKLr3v1Bxcb16DJRx2ABcF9O9Z
         d/dOkjWMK8NeeGlu8zkmxZBwSaw0YpylS+2XucAbOmWtRlknv/a8eF8dknunysZx3opm
         rxiNoCyw7pa09v9RSKwyzajfldyUk3GksCQhllIfQlwgtyoU9zbLmXmvCq/QBvW4NDN8
         cJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ha06NxopoyqRvQI/XZs/BZ1HMCeMvHjmNb/s5Nuvw1o=;
        fh=6ygh8lbf+XvspWpGPd8xbHB0rPIUJcrgvR9vA5/qhQM=;
        b=Wfjjlxzs/6FOjI0b6XXlrxIz5O+cEnSXtmTtfDJL7kRe7/YtNCegyRsxHcXTx5d667
         cXuYqXAFRn1VtzcNCInTTa4E2xmEapuolnHf0B5UEAuTMVmyRjw1UoIsFDx8RY2YJee0
         VHDk+cS+IGm6lek06QchkEo+/AdBKKiHkII5Ag7/E4wJ/eXmRzRm6p7XofDpHzZcv9Ko
         COC7waf370QWz5IZHHXEFaPhrCWD2aFomHLiMeuXvJarD5bwRXjRnl3bjyIZN2glXPnZ
         XXzJHgM7riCDYBAILBhEhu/JQpjEJ7fqfAU6ev9XNpN+GEO3+JqE8D4ivNE25T7+goMV
         2sIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S6rHeCM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f717599asi88652456d6.313.2025.03.10.03.28.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 03:28:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S6rHeCM/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1traNE-0007fF-I2; Mon, 10 Mar 2025 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1traNB-0007e2-Mv
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 06:28:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1traN8-0000xP-Nl
 for qemu-arm@nongnu.org; Mon, 10 Mar 2025 06:28:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2106679f8f.0
 for <qemu-arm@nongnu.org>; Mon, 10 Mar 2025 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741602512; x=1742207312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ha06NxopoyqRvQI/XZs/BZ1HMCeMvHjmNb/s5Nuvw1o=;
 b=S6rHeCM/SIKEpG/GiV01bxgrzg+QLYAq+nNqS924lq69YLNm5sGtmKXSHm5vZmL2r5
 i6gCm3CB3HJa8ZSTCeuZcVdDNOivdUnr+4C3rgRFJ+eqD5PR/i9fbhMiFSZ4y97yH//X
 egrH+M1IBGbVAvBlRnjLUl/K2Y439kyQ4/A369477vbndqN8zIcxqmHDRSom+SiQM2dB
 5h6lxuEwISAtjFzNfEG/iNf+r2G/SCc8w+Mg8Yn4GqZNLyAcL5sH1eIcPatIAArW6mFX
 VQuSJuLMqnIZa2yN/fhZJpF7UjxK4prmXvP3PFIM100SxN2gagQf5CrGS6ImfdpBHsDr
 N7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741602512; x=1742207312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ha06NxopoyqRvQI/XZs/BZ1HMCeMvHjmNb/s5Nuvw1o=;
 b=ZBoV8VE8PFjvua4reSClANIs/PeHQ2OAELXQy8zNcFowGAV5FiZp8j6wGAcvKaz8+P
 cp1oO7rgcey6WW+pd0ZXz2UKOuDXCVZrcn529aSy1L0yQ3UNNxq5rsPd6NZKc06u7SsD
 2R9pds0V2TN8bRQJ/XyVvXh6tUlCE6FgCaBmc4kmoTvom62g800xGmqvVrBDsaYPRrif
 74UH8gRCUZsQG8e4ioNBDdCTqhtqmUtUxBGO2cUudeQcSkQiOIqQJBx84/W/cg/dv63P
 IOo0BgT4QppaYwnYvoH08aaEpDlKWT69yKHpLf2KjD+zyiXt3DvceUnNw0eSfR0WmlGr
 5dHA==
X-Gm-Message-State: AOJu0YzBtQnhR4qxz9CrUc4zjZW13qgiEaoIlknA/uVhjlQabJTSU+HM
 whtEtnMc35pBuNFcVtMG0cNa+4arDvakC3Ix8SVvcq2hWq/DIqV91PalgzPFLftaM3jXmwZyQ/Y
 y
X-Gm-Gg: ASbGncurMeMh9UysXkVR1bFW80r6AcOvmiqMwbihPq0b94ZjiwtcOHvG9SWX4BFDsDs
 OGVCr+usyaJBvtqq+A21M/joU2PZRVtc002yb3GWvb/wpSxbILOxEv8e0m42vpLieCY5s9GzF8G
 IckBZ6VazqJxcI1tsmVeX5sWHnKjbscmGiUUe6tPMPmEk/crHhuNOoCZjH6i4YLZQfnA7skXm0+
 uzMWwyEVHZ1bJtn5mAfonFePmNrugFKWEbLL9ximTVfIRmx9kr5WBr8x6pg1LJAYiVazsR8B9df
 2zE2z9CZBLzOj50XZsQNGt5ObfsAlGXoySCXd3y83TxOhY5k8v4=
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id
 ffacd0b85a97d-39132db703cmr6853563f8f.47.1741602512520; 
 Mon, 10 Mar 2025 03:28:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb79fbsm14684029f8f.13.2025.03.10.03.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 03:28:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH] tests/functional: Bump up arm_replay timeout
Date: Mon, 10 Mar 2025 10:28:30 +0000
Message-ID: <20250310102830.3752440-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ceGfp29B/HHO

On my machine the arm_replay test takes over 2 minutes to run
in a config with Rust enabled and debug enabled:

$ time (cd build/rust ; PYTHONPATH=../../python:../../tests/functional
QEMU_TEST_QEMU_BINARY=./qemu-system-arm ./pyvenv/bin/python3
../../tests/functional/test_arm_replay.py)
TAP version 13
ok 1 test_arm_replay.ArmReplay.test_cubieboard
ok 2 test_arm_replay.ArmReplay.test_vexpressa9
ok 3 test_arm_replay.ArmReplay.test_virt
1..3

real    2m16.564s
user    2m13.461s
sys     0m3.523s

Bump up the timeout to 4 minutes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 97c3f4ad4e9..608732bec63 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -31,6 +31,7 @@ test_timeouts = {
   'arm_orangepi' : 540,
   'arm_quanta_gsj' : 240,
   'arm_raspi2' : 120,
+  'arm_replay' : 240,
   'arm_tuxrun' : 240,
   'arm_sx1' : 360,
   'intel_iommu': 300,
-- 
2.43.0


Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp731318njb;
        Thu, 8 May 2025 15:07:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/XkcmKOvqjJj70wFE7RlHIYs/jUUqNOYn8PVAB8nKIHBjmeiVYYWVzm4LieXlw+ahgX/Ep2/xoQCL/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHLmCbmU8NI2DdueIe+c0xIbyp+PZD0Sniwj+fIV530jiPfEufyjfgPm7XyWJpYyfrAQp8e
X-Received: by 2002:a05:6214:1bc8:b0:6e8:fbb7:6760 with SMTP id 6a1803df08f44-6f6e47956dfmr15413006d6.1.1746742064229;
        Thu, 08 May 2025 15:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746742064; cv=none;
        d=google.com; s=arc-20240605;
        b=TuimK5X13bNp5nfDM5l5CzSLSooYmUg1ZqfPwXZ02Dk17cRZIXGhBlxOqVmy78BggT
         G6mAo6u9X7d7ZRIwdspSWzXTdxwYQ+GLcNLQdiVq4y7NAgS4rg5YzS2qhbuUoE1cyv1R
         0f+YcTP1Klcu0kb4xERd7nMzFQE+pP+t5zXgaVPuJriPAdUQY69+8P715P2ov7uahaM/
         iaAEIPi4ODVkES2w3ut2bY5UPPZomAUOPl/TGuMNvLa8QYGvhlQqKyVFguZgcbVZoN++
         ekjGmCgisxalgRHdds2g0daGQ5jm9CER2lIT9wyNLlOSs5m+JVIGm049vpA0SQ9oUV3j
         v/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=r/pZDNj5CYqDMrS+f9OQvU0SRaHFWWrjwhjlTFIbAco=;
        fh=xNQ7i73U4I2ZsdU/dKF+fa+8pughUf89wFfJROyf1nw=;
        b=OIquRj+ctQqi58NMjg5cIxRMxDvKCn/fRKOdTMrlSPM9jKa7g7rdzjwo1keo+YnaqI
         Ak7XHIkOnZ6DPJWSndO6x7cz9axDEDVFMHgoKp2kB+6paZbQ9glAJXmZVNYhCmt4vTSG
         n2NxoOn9tgcDlu+wvCCwbF5UE4Z3U4TqG37IedCuzvR3PgJmJPiLuohp1r2hLtPzSew7
         LR3LG+41b+wJScU359SyDQZ+rrO5olUnTgY2du1uJ/B7/3REyzMh0nBnI0unQozP+KNF
         F+BFr1zNp3o5gdAVUTGc8fgCwv40/Y8gcwwufCAXJ4/QoS/6mD/2Z6G06KgqwbQvWbyr
         /zvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yehTiwGU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a4b100si8418606d6.289.2025.05.08.15.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 15:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yehTiwGU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD9Or-0007LB-Je; Thu, 08 May 2025 18:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GisdaAwKCC0WJKRQNbcNOJWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--nabihestefan.bounces.google.com>)
 id 1uD9Oq-0007HX-9E
 for qemu-arm@nongnu.org; Thu, 08 May 2025 18:07:28 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GisdaAwKCC0WJKRQNbcNOJWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--nabihestefan.bounces.google.com>)
 id 1uD9On-0001ge-Pi
 for qemu-arm@nongnu.org; Thu, 08 May 2025 18:07:27 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-74089884644so1536879b3a.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1746742043; x=1747346843; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r/pZDNj5CYqDMrS+f9OQvU0SRaHFWWrjwhjlTFIbAco=;
 b=yehTiwGUVWhyX8tYLzQkh4VV2Mz28ooi0dCGCyww/rOKiJOW6eN4f6F4Bjicp2GyWi
 aNPN8zAIVt+rry9AHK6lDG+mxLvR/fIVoEmtCV7vBvQguBdAy5B9gLYWH8UF6ALIJTr8
 Z9DAZpiN6e9sI6CcKrNKURfodpwMpVrTFBwL29frOTwaYos/ZneRcFj+CDNxkpsJnpzZ
 vNlJyqwW/EI/7XTtMADFSSxl6/Mzqu2Oc3Lo6lNogQvrM/+hZarLF5Djyk6bvGNRFGsM
 dVp9xCNRsIR5YYoT4P69F3PDwwFklyevMfHrTSvUuInouabsUrmKM2JxDFwQ6LVPoN7E
 ovtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746742043; x=1747346843;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/pZDNj5CYqDMrS+f9OQvU0SRaHFWWrjwhjlTFIbAco=;
 b=eIdL2we4Accy9GYtRZLePAGwt7ofbnLFYThcSm4h5cZTiWCeJwiwEXsmqL1TcSPF3J
 hJu3oQRbbBd4M5Bxhc51pV3PrHlRLPN0lg756WswYDiZvNjMgxo5ojmhDB4wM5QviDFd
 MG0yi+qFie4mrXzg2lQpdZLrdCnyUwjqJibksF2meWY7HLZtxh/MxC3WhbP9DkMuMorS
 QIPoGy93Y4313HPpIvLHHTP/V0EufvNR6q60ZzNmVbSPMklgyTDlENrh1ga5XAlftP09
 XU1VOe31XPvgdF5O92r9d8kLGQfR14Eq5w+zExC8g+KSi/Plj20p86rWq9avcMPSU0b5
 hzSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfbAjCvqoUTXOhMYXnlwiW3ai676yqG5Z1vu0N0rAczYICo3/tnP4HPXURF6FfzbsL+7z5iz4X9w==@nongnu.org
X-Gm-Message-State: AOJu0YwSTbibLlnvk3Cc/YPywLv0JKr4+UD7Y4Rq4WWW6fvS5ji7NR2o
 fF8sgL5trpfnxjCPSSAOO8jvKDVFhl3z6USWXecdXK8pzKgNJfwij5d+4WYCBqfnBCay5xok48e
 fUvo35Svsfjtr5VRPXlYRRY/TZg==
X-Received: from pgbcp14.prod.google.com
 ([2002:a05:6a02:400e:b0:b0c:3032:f595])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:338f:b0:1f1:432:f4a3 with SMTP id
 adf61e73a8af0-215abb397f6mr1064386637.23.1746742042889; 
 Thu, 08 May 2025 15:07:22 -0700 (PDT)
Date: Thu,  8 May 2025 22:07:16 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508220718.735415-1-nabihestefan@google.com>
Subject: [PATCH 0/2] hw/arm: Nuvoton 8xx - GMAC patches
From: Nabih Estefan <nabihestefan@google.com>
To: qemu-devel@nongnu.org
Cc: kfting@nuvoton.com, wuhaotsh@google.com, peter.maydell@linaro.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3GisdaAwKCC0WJKRQNbcNOJWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--nabihestefan.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.499,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: /F9Lzj1HYgd7

This is a set of patches to add the GMAC devices to the 8xx board and
migrate the GMAC tests to 8xx, which is how they were originally
created.

Hao Wu (1):
  hw/arm: Add GMAC devices to NPCM8XX SoC

Nabih Estefan Diaz (1):
  tests/qtest: Migrate GMAC test from 7xx to 8xx

 hw/arm/npcm8xx.c             | 54 ++++++++++++++++++++---
 include/hw/arm/npcm8xx.h     |  5 ++-
 tests/qtest/meson.build      |  6 ++-
 tests/qtest/npcm_gmac-test.c | 85 ++++++++++++++++++++++++++++++++++--
 4 files changed, 139 insertions(+), 11 deletions(-)

-- 
2.49.0.1015.ga840276032-goog


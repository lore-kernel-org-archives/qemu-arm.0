Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp857087ejb;
        Sun, 19 May 2024 02:43:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy6KzuXxLRkG1hiTQBgOOGoGw1T4JyF28BWRgjdPvgfXnPCXiql2NQ1cvDn1Wzr8uPfK9JbTMeIDfBd6MO7dLnw9TCu6s9
X-Google-Smtp-Source: AGHT+IF49PKGLutmPoewZXfeKSYfjZVz5/HVhdxe7fRRRAwAEJJddpSagF64Y0SzhSVX2w3RwLDw
X-Received: by 2002:ae9:f212:0:b0:792:9136:1d92 with SMTP id af79cd13be357-792c75ae6e4mr2514497285a.38.1716111837397;
        Sun, 19 May 2024 02:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716111837; cv=none;
        d=google.com; s=arc-20160816;
        b=n38DGxjdK6cixOWf3tb1cD6ZnGZ4cSTkD7D3ZKB3XmNW7s6BT6LPfuEU1kFUSqtetB
         U7FS61hT9B69p+bYOK1fZDV172IubxgV3v6+HIxBhszV86//NW8UgFW+RlU0YYVP3xTw
         G6H5FsH6D4ZpQ2XWaQOFfKOf8Y2g8AJDu/K5ildqMMQfmpGXISJDA+VjYhllabYz+9UY
         MByqGy7OGZJR5HCD2qTL32Lncb7VRehw970S1V0ooVtZn7ZZsKDkRhJ3XAV5WYJBMrFw
         fo2z+pGzHwmKHimki3uJRT2Ovb1WfmFIcK6ReGO694qe7SvChSxkUf2DH/0q1Q3BU/6O
         tsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/LDWpHwHgNc5ou1ACtf6yw2EFoNe3kKL5zlH1rq5LfQ=;
        fh=uobGJT4CIynhdc2wU066L3fjWOAeQtKgF493TCCUp5g=;
        b=lYAvsRyla7nl2GsEER6jNz6VYNDOmApWFwCmBmH5qYjApHgjTGACFTCfwE9myA0CQz
         d1DKGVygK1bGpBSLr0yloHVCI7E8E2v33DOZA0PIoheAM61Aod2VElamB6/rgRjk4KFd
         u76UD1dTgNUb1YInjYYdkoePqiIFuYbUklldHsbPlZbf4l3AJI5y7c+vfNDoSjAZ+zP5
         SLPx0Pr3fVahyPcB1+GNAOE1sC6645MxocIknX6Q4j56X6QQWwOddxDb+Qr+K6atrer5
         YMxtfE3jXF0acMETlSMDFAJiTOZi3LhnIUAJckxoKdyEFdTw85VHMit2BCn/mmdv99+h
         X+hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZiR7CpEv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf297ba2si2190322385a.194.2024.05.19.02.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 May 2024 02:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZiR7CpEv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s8d3x-00021y-7O; Sun, 19 May 2024 05:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1s8d3v-00020O-EZ; Sun, 19 May 2024 05:42:39 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1s8d3o-0004Xc-TA; Sun, 19 May 2024 05:42:39 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ee7963db64so50459365ad.1; 
 Sun, 19 May 2024 02:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716111750; x=1716716550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/LDWpHwHgNc5ou1ACtf6yw2EFoNe3kKL5zlH1rq5LfQ=;
 b=ZiR7CpEvN6cSA+I/NXeVTamf/yAqqaI+Bl3nxvvqp9idfg6bKlRog1L5emQ3eqm4YS
 9rJj27uob6oAzzkpdBjVnoeMtMKUGiBBe6sroMVQlwA40iRuJJFr/xELylXWsezSNdbf
 bJzJ3/XYKnO4mT6idzDZhzKRaAmUNzf26vXstPzvN1eG4xSitm7cejb5xcH9mN13joe3
 Wja3iaH3vI+oXFreR4R/6hx6AEaorg6ELouvwikLVkQ6ihQquPmpnoX2VRrdU90HTg4h
 /3ridY88+ACWZd36VvfCjqQiyGlX/neJgR+MoihRlyUM3dABnLCLIfDFoBLKJRZIaBYd
 yc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716111750; x=1716716550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/LDWpHwHgNc5ou1ACtf6yw2EFoNe3kKL5zlH1rq5LfQ=;
 b=weLnqLJkixe/oDF5lHHvoR3B5TjivObXKzE7Oi9V549uMN5NjQKZgpHEWCAZM+PrKR
 1FFn2l+pAnDRhgm1chrzFPoibBTNNwsmtQiLB5o32iRqlYNLkmmBxOQy4NLXhvs3Rm7f
 ar3bDabLgKQ8PfFrQJ2YMo5HerJnGdRNTZrbVdR1WL8tPdVpFZ0cVpRtUFFzedCLom2n
 gkU9+PcBoJr7CZktNM9umIbFjxNVcT/NmuxYbpZ8IUvfRsxZCvSDlg0Yfm5+CV4dql//
 FTvSnarAht9yLcohsutn07cBxChU0ILlrdP8MmqGfn60hjP8R1XZLJmGjJJRoJTcQag8
 x8ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1oegOH/qJSavcSwhjtWjx3EUWLGBJF0O5tJuBWV5MX5NnrO+Nn6CHMEoerqVz1vRUN66eIoWL2+//v3S6HRBRAAFi
X-Gm-Message-State: AOJu0YyXDWgbQ3uglwzUy6wOYnltGpP4tSDxKpdJYPTvBslka5t8BQJs
 MKgGjGlerkK6O39oK4keqkT+hLu1Ty0yaRoQb+e2VWJLJxBqCpyvRHWXxg==
X-Received: by 2002:a05:6a20:2595:b0:1af:d2f8:382a with SMTP id
 adf61e73a8af0-1afde10f1bemr35914561637.34.1716111749785; 
 Sun, 19 May 2024 02:42:29 -0700 (PDT)
Received: from localhost.localdomain ([49.47.193.102])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b62863a265sm19977932a91.10.2024.05.19.02.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:42:29 -0700 (PDT)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Rayhan Faizel <rayhan.faizel@gmail.com>
Subject: [PATCH v3 0/3] Initial support for One-Time Programmable Memory (OTP)
 in BCM2835
Date: Sun, 19 May 2024 15:11:03 +0530
Message-Id: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ML5fK+HFa8PF

All BCM2835 boards have on-board OTP memory with 66 32-bit rows. Usually,
its contents are accessible via mailbox commands.

[Changes in v3]

- Forgot to replace constant with macro in one particular spot.

[Changes in v2]

- Replace read/write with get/set in bcm2835_otp.c.
- Use impl instead of valid in bcm2835_otp.c.
- Replace all constant values with macros defined in bcm2835_otp.h.
- Change memory region size of OTP device to 0x80.
- After further testing on a real Raspberry Pi 3, I noticed a few things
contrary to my initial assumptions:
-- The customer OTP lock bit is bit 6 of row 32, NOT bit 30 of row 30. This is
currently undocumented to my knowledge.
-- The above lock indeed applies to the private key as well.

Rayhan Faizel (3):
  hw/nvram: Add BCM2835 OTP device
  hw/arm: Connect OTP device to BCM2835
  hw/misc: Implement mailbox properties for customer OTP and device
    specific private keys

 hw/arm/bcm2835_peripherals.c         |  15 ++-
 hw/misc/bcm2835_property.c           |  87 +++++++++++++
 hw/nvram/bcm2835_otp.c               | 187 +++++++++++++++++++++++++++
 hw/nvram/meson.build                 |   1 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/arm/raspberrypi-fw-defs.h |   2 +
 include/hw/misc/bcm2835_property.h   |   2 +
 include/hw/nvram/bcm2835_otp.h       |  68 ++++++++++
 8 files changed, 363 insertions(+), 2 deletions(-)
 create mode 100644 hw/nvram/bcm2835_otp.c
 create mode 100644 include/hw/nvram/bcm2835_otp.h

-- 
2.34.1


Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp552246njb;
        Tue, 13 May 2025 07:15:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXwXT2xmR8mNSVv3fljJbBHl/0ZEWW6eqQRTbdcyReiJeMcpOmvaG10qtOdzutuW8dLvicTXRFiHox+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGrcM9UOyHmDQO34cZr+K9elzo5quAfw+E4xIHowYTU2NQ4MXe7r+bfw1fHr2socB7Fr01C
X-Received: by 2002:a05:622a:216:b0:477:e78:5a14 with SMTP id d75a77b69052e-49452714949mr246359521cf.3.1747145744939;
        Tue, 13 May 2025 07:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747145744; cv=none;
        d=google.com; s=arc-20240605;
        b=Qdszvs/6ylNHkQT1dmRxbqN7vDbE5zj+s3L9K9IHv4/q3nKhOxzcEQsqmr1AORO4gx
         mNCRj15+8CFHNi4+nrG0OEEudvs+N3IdW/Y5v/rDkaGDczVn9I1K42k8ygp9qZeEYnws
         wPS7VRQhgbmacl/C7ozOhd3ieJIjqiaA9FUgFMTz2H7segFLdqhj1rLqXsPW+ao34HDG
         5D0uxOG0LNG4hL1jHiH3dKlanAvSjR8Tzz+YvL9uMRxg8HL2ZaA1ojC6/H8qevgRt9z6
         i8GVMC6I3uX+hMZE3wAYXsFwKFTaGZwmkEimV/Nudcw1+U6hRnt512/x+09o134gYXVB
         AYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=F+maDH+SeTIObLyt1PoV+b1biPi7a1G5liB2x6ZkIPE=;
        fh=ZZwLt5H82yHLOWpnvJwJfXwO1u4fGNY7kNtWC/UDUJc=;
        b=HaSUk/eoquLFV1+NtfXznUBfn2yc8Fn6FVBZ+DiI9INib4ZnoaUZcKApzx9em8exKy
         IOSoUsXlEBKVTzEKE27Mz9uVX9ocyovzd729eoLMYJDvOIICeOlzdON7vUQJo27iZBag
         WXuLiNGTeSVS3MHRnGvv8JNkKN/R0phEyJ8tE3r5mS6oqcdInf10CjjhheAIJlxrc64c
         er+iqiDE+W+/k9AbcqA/GsyhBjUQHmFpj2pJEHt+90uXrdkKUv6Sk5c4gQ+2nU7H3OaB
         vHL7T2Y/XZBrGodsWMZmsBuM9Nj/mLxW6PcLyR+J78Os9hVGkc5dDcGiPV9Fh/exVuTZ
         gbyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=OeIQM7Mn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945259a1d9si113120411cf.477.2025.05.13.07.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 07:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=OeIQM7Mn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEqPv-00041c-G8; Tue, 13 May 2025 10:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqPr-000410-OI
 for qemu-arm@nongnu.org; Tue, 13 May 2025 10:15:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqPp-0005Ww-US
 for qemu-arm@nongnu.org; Tue, 13 May 2025 10:15:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a1d8c0966fso3652841f8f.1
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1747145727; x=1747750527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F+maDH+SeTIObLyt1PoV+b1biPi7a1G5liB2x6ZkIPE=;
 b=OeIQM7MnnDagy+LiETWgfWvZt8tzoQfk8VjEK8t438bQbQ0Sr041Pk0hxvdauGJsIt
 6XBvKwE9W+qjScJsF+aQthSfA2RLxb0tCQZOGobdYw//V6XWbuDkmHK+UQriEowOhRk6
 zymj8Va7hwkvws9sgc5cYosQYQnorYN6KMqhSy4rDhLiLcXgwbuWlXuWAah98nhmZHMQ
 0jDOET4xPVoHNcvrIPqSV171DrBb1/aCPaLEpVP3V8he+xLVdMMlS06CXaHHLDmWAThd
 39iI/60vUua0dQkx9Erd+yIlA1JtSE7E8fjE4ttbgexTMq4AspwiY1QyG6r4ZlQaWgqk
 94kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145727; x=1747750527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+maDH+SeTIObLyt1PoV+b1biPi7a1G5liB2x6ZkIPE=;
 b=jydF20khMO6fIb5zW0q3b03i6c3Om78wvf1w/LlWinowLRyCiXldFSCTealdsPrv8E
 CzIqyoLgDvlutE66lMFOToDHdrsFQSAtd/9qYYIF/9J5PpdVxVUjk5r3fDPoa27ZLM51
 w0IAEkcmMZGeIEbMOK40sNnVxrdoDUdaRPIlg6RryHfg6G+3iSgtxOS5xKg2MQnsEyGt
 fnUAgX29Y5GoSPWv2YOO7SLcDrWCE6NrcG81a/F6ykGEWAmMQ/ZRsNPyskhzxHkMAdMf
 Tsuwu3r5YWvuP74B+M5vmlYUet+goIyRrCkXZ3C3DX3RQLepyVEs2Ae2JET9hm0yFUsx
 P6TA==
X-Gm-Message-State: AOJu0Yw+j2PFPDWqDcJaATkwN9s2WAyQwQhnJbFpzFoJ79i99kaysbH+
 iy7J4IFyz1DTDu2Caiu7Wuwa44hTjX79ONpqjyWKd5YX2417B5zREfOq5SRVDw==
X-Gm-Gg: ASbGncvQV281tsSp5ppXG/g/8MxqZr2RZDq8TiFbj2pOaXKf4eFMrWDBIPfVwsv4Yax
 VNcCK887X1g6JreE3apR6OLUqkp2PhC/wyZ2FdICa0kqI1YQErQKNdEhh4GhL+qS92mW74c7nhR
 g9HDYmQbhBDoMgF3S4qIcaiNXhxcJwBACL2cdxHP1ix1WVmaK+Hrb8Nn+bsUvfuIAGcGOifEk4U
 iqTisZ7ic6dPH52qCmotlmhYKkv8Bh2aHRJKdzESbEWKe5N3C97zEdAsav2N7wPSViJsWbBgkUN
 i385ZYTxVpbF/hfnlza9NhDApkIC8x1sqIJUfIqfyUXzGKf5HqERQxVyj8zZz70jnoH0ngAzpx5
 COos2pYCiretNxidg7r2t42kD0SU3Xp+/aqsKN2TYrXD6HKZY
X-Received: by 2002:a05:6000:1847:b0:3a1:f538:d9d5 with SMTP id
 ffacd0b85a97d-3a340d345f1mr2724047f8f.28.1747145727135; 
 Tue, 13 May 2025 07:15:27 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm213438805e9.39.2025.05.13.07.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:15:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 0/4] xlnx-zynqmp: add support to boot on RPUs
Date: Tue, 13 May 2025 16:14:44 +0200
Message-Id: <20250513141448.297946-1-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OhkfDUPPIiGX

This series enhances Xilinx ZynqMP support to allow booting on RPUs and
ease gdb connections to them.

It was validated with home-made binaries. FreeRTOS was tested but without
success: outputs/IRQ seems broken. AFAICT, FreeRTOS is expecting Xilinx's
QEMU thus I didn't investigate further, but I'd still like advice
on the 3rd patch ("wire a second GIC") since it could be related to it.

Clément Chigot (2):
  hw/arm: make cpu targeted by arm_load_kernel the primary CPU.
  hw/arm/xlnx-zynqmp: adapt cluster-id based on the boot cpu

Frederic Konrad (2):
  hw/intc/arm_gic: introduce a first-cpu-index property
  hw/arm/xlnx-zynqmp: wire a second GIC for the Cortex-R5

 hw/arm/boot.c                    |  15 +++--
 hw/arm/xlnx-zynqmp.c             | 104 ++++++++++++++++++++++++++++---
 hw/intc/arm_gic.c                |   2 +-
 hw/intc/arm_gic_common.c         |   1 +
 include/hw/arm/boot.h            |   3 +
 include/hw/arm/xlnx-zynqmp.h     |   6 ++
 include/hw/intc/arm_gic_common.h |   2 +
 7 files changed, 115 insertions(+), 18 deletions(-)

-- 
2.34.1


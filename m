Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4416867njb;
        Wed, 11 Dec 2024 15:04:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyIS6gg5M3AwQ+/iqncHbBPjmUoBnYumdfm4YJ28m3ens+xpM9YU91OuYI7GSxIbbHyaut7g86aizS8w==@linaro.org
X-Google-Smtp-Source: AGHT+IE5Hct2m7F4a9PQky1XVHsXRzW2fWOE5xSdjS1LGRqMWmR+oNTb74V2fRpHpID3Rw3SBKEV
X-Received: by 2002:a05:6102:548a:b0:4b2:49ff:e470 with SMTP id ada2fe7eead31-4b249ffe477mr1134455137.21.1733958272082;
        Wed, 11 Dec 2024 15:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958272; cv=none;
        d=google.com; s=arc-20240605;
        b=bWDhYMAHSofP01JoD84/E2HQOr8ScyfScDcdeAo2nzA6XcBr+43WybLsUQyEzq/DN1
         sGmPOTTfyBui9yGP/gn83XpYVkpvUmpEdqyzzXa69RnBiYSWBvUuoDMd8ctu2znFKGs6
         o8+AeUq8wUl8B2G5a/5K+lba5vXsbr72gzjWQ7L7QMWrnqxcmoJY1vv4aDduf3tUzfCe
         HMka941n2sZFr9fhmKx0JSQtDVzJOaXERCYMju8E/8sXuYRkyIjjuNUVM80NsstNWbp9
         6EmxxS+7qh1FctwrSoDrf8bz4KZFallPxQEO4rJSceUU7g1xKlfg0hoq6a2h8PMZi5++
         ZxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pC1Uyy5m1Ql3guGbpj24VXkLZ8MdRFxFFCdpGpXSAVg=;
        fh=pjtkcy1Yg9b273Uvvy0xy/OM6EU66LeZWf3WFtBQydk=;
        b=EF16GZ3BfygOePNvvGcqa+rSi0xJgNKalXYjEpkEHWvO2qL8NCsOGdcMzd5gDVG4h+
         xSW2t5Kwbhx6auOk7bO22aJgSdzxTfxMD9GU2lUua4lmmHuO/QmDsVYWwvXxWE522z4z
         KhDDzJMnPqV8oc4SIUXpMYiTZL5EuBTnOZ5BTZxnuRrpci7RFB/35ZKHzyzU3Rexp+a8
         XMZyxA0JkN0mO7e6l89CU4QtT6rov8QQntUkcb/sUOLtpUANAOgEaUyOJ4TGVf06lvW3
         CUt2RM/Jxs0Nd/coGLj+KQ4sR7KOZHG1IDQqGrW8crI97EDj4CrZ/MObc++C1Cmmp0iC
         P+OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/T6VuwN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afee4f51e2si2643472137.445.2024.12.11.15.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:04:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/T6VuwN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVkS-0002n4-4d; Wed, 11 Dec 2024 18:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkR-0002mn-2A
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkP-0001nS-GQ
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:02 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434f80457a4so7107795e9.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958240; x=1734563040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pC1Uyy5m1Ql3guGbpj24VXkLZ8MdRFxFFCdpGpXSAVg=;
 b=P/T6VuwNWlXtJOEX3RDL/PKrUcERuFyxG4ImuOx0PuqvgspCsAtMQ/fqGiCVK8+xs/
 gCHtlk6AXpu20J2w3DwbFcnDijRuEGQEzb8OF1CNElRgfXjfuHfiH77ncKIPPm85KQKf
 0Le5gQDAZWbOAh5nBAPeVDZpxj6edtvuuE1XjoSlAKO2Ic2Rrh3zldxZFxnzWXnMmIn3
 3+xULQw7AtRiBXP4gKth6jeTqVnQhwJzg7ybCWU9Fx6DIXsA725srVIeoJqZgdyA5B2q
 u2epJ3xg+nkNZuA3qqsChy7uPVvQyF2KSxCd2U73acVyXTGgQRAJGVrBEjOmWV5v1qnl
 fZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958240; x=1734563040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pC1Uyy5m1Ql3guGbpj24VXkLZ8MdRFxFFCdpGpXSAVg=;
 b=iIRrPLFcR/aJF9i6YChZAFWoTPSSGt7J67i429k4GH+Y7UNOScSbWObfd97Unw9QYS
 lrVbgIkeUeVH+jAsYWDFxWdNBJFxh+hWBqRXn05SD1zyBrs1EZ9nzs9SFkkT3V22vx5j
 WporLboHzmVE7qOc1UsqzIX87DiiJgzU+GRFdr3Y0ytFtGyT8QI/tTNjdrsVNDrF96pj
 LdHyPDkXph07PL59t1ZOCvTeaboxWl74MWPwaHyVq3ZXhcnAbPguZZXYUt/unG3rramm
 H92VnwEabUHE49wU9gVETR0Pdr1bBmSaTAP8/WR/WvJ2VJPKyNMuV+G3pL90XNKPXGpO
 nq3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5NwuJzOPl0pRZQZft9VnfBXpLBn6M44lcy7TIb4EnYMr7tb9yX8BT1F6oMpaAKW3I/XzsHFBTGA==@nongnu.org
X-Gm-Message-State: AOJu0YzAr2D79AQXrm0cHUDC/V2/mSmZtlGihEy56VEkuIfUiDx+9frt
 8HYgr1QutbXtNpDk4/yNveqZXOjIbeD7kLnauxUBHeJNHr56tByRDqzdXLqPWk8=
X-Gm-Gg: ASbGncsniXaflL+7fhIJj6+cnoOWF0qB8UJxANX0K+TbInks8jg70uKsABIdpK+GU8P
 MqJN2ZHUgEXtUUp17irdBFpRbOte2eStuqSsNFJ/Yp6dhrxiBwMAJnF+usZMGe++4zJJ3DLPwEL
 RSgYb0ktMufbA9Q2EKXYkjoMKy9XP86t8tsQdSl/Q7s71hz/4FUdjezAUszO2YWSmB6M3F8e+S6
 czsFfUA8VQy/rj6pObMrzoGwH1+QY/Z2YGD5wqi/mryS2HEgW2J4fMIb7dqa5Lr3peuoIh4d5kP
 dkB8+8hd3aiVW+n6K0Znj6JHv6E/CkDwzA==
X-Received: by 2002:a05:6000:4025:b0:386:3958:2ec5 with SMTP id
 ffacd0b85a97d-3878886cb39mr554381f8f.28.1733958239833; 
 Wed, 11 Dec 2024 15:03:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a4bb8sm2285775f8f.33.2024.12.11.15.03.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:03:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/9] misc: Reduce 'exec/tswap.h' inclusions
Date: Thu, 12 Dec 2024 00:03:48 +0100
Message-ID: <20241211230357.97036-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: zITKuFIl2IAx

Include "exec/tswap.h" where it is needed and remove it from
"exec/cpu-all.h" which is a header included very often.

Philippe Mathieu-Daudé (9):
  target/xtensa: Remove tswap() calls in semihosting simcall() helper
  target/mips: Remove tswap() calls in semihosting uhi_fstat_cb()
  accel/tcg: Include missing 'exec/tswap.h' header in translator.c
  hw/arm: Include missing 'exec/tswap.h' header
  hw/ppc: Include missing 'exec/tswap.h' header
  hw/mips: Include missing 'exec/tswap.h' header
  hw/sh4/r2d: Include missing 'exec/tswap.h' header
  hw/xtensa: Include missing 'exec/tswap.h' header
  exec/cpu-all: Do not include 'exec/tswap.h' header

 hw/xtensa/bootparam.h              |  1 +
 include/exec/cpu-all.h             |  1 -
 accel/tcg/translator.c             |  1 +
 hw/arm/boot.c                      |  1 +
 hw/arm/npcm7xx.c                   |  1 +
 hw/mips/fuloong2e.c                |  1 +
 hw/mips/malta.c                    |  1 +
 hw/ppc/sam460ex.c                  |  1 +
 hw/ppc/spapr.c                     |  1 +
 hw/ppc/virtex_ml507.c              |  1 +
 hw/sh4/r2d.c                       |  1 +
 hw/xtensa/xtfpga.c                 |  1 +
 target/mips/tcg/sysemu/mips-semi.c | 43 +++++++++++++++++++++---------
 target/xtensa/xtensa-semi.c        | 15 ++++-------
 14 files changed, 46 insertions(+), 24 deletions(-)

-- 
2.45.2


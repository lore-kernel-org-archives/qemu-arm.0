Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4687160ejb;
        Mon, 6 Feb 2023 15:35:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8Dk9S8tyhsKtc7el/HoqykTNh7HggTj+OQevVM5ouTPoCcJ+y/ac5juq6L3k5dVt12xhYE
X-Received: by 2002:ac8:4e88:0:b0:3b8:8756:6de8 with SMTP id 8-20020ac84e88000000b003b887566de8mr1823745qtp.67.1675726522968;
        Mon, 06 Feb 2023 15:35:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675726522; cv=none;
        d=google.com; s=arc-20160816;
        b=i6y4hyoxeXAOsqdTvj2FhZ/z1YvbzVSN/kZNt0N6w0hWN7QGJAVnV1u1zdgRLVrk2b
         nxvoBAZucYjLTzNQCNPmIXxcN+7WLDFE3TnLBGw2N+Og0dU+eFB3sTdbzAExISZ+DjXb
         vlWkOHUnqr2STd21U8+4OZmq2I7nLg/oJnRnZ3RtgQ0didug8qXA3ZnMpeQTbOfexpiA
         8QbFjMdCqAPcZD1+ptWW+a3vW004khrIbcDqjyA0gylrMdObPBPNK1ZnN7Z3Jq5Oh48i
         +WyhOw5dlBaZ7oOqulIlgoucH0arBgvWJAmdAIPCd9kfoxt1HfK3mucdKOmylOQLSnXj
         xQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=FYWw/qRjdcb7I6Rft+1C6I9O+sG+q2eO6RDEKUbphx0=;
        b=xU9Dy0DO2JWY8Ag/3O1pqBIm4GHPY04V68AL+/F+8WaD//QkSm0QziacQoMsJzi8qH
         /OeAaWGwLEvdZfwQnITovZ4VpRLh1VPSSw5h40xDA9xZTkzmZKEa/rz0vaTzuy/mQ7+d
         rrHDcoOmYH7bvFovylUpR9aiMU4v3aaXkRqKEbTeso7IvE/i4Mr8KHIIwCDCjNPGaf+A
         b+c6V4TcYvBrDQOGMF+gG6sGRDCqmiaUjz2m6TbyggD+46YgZFGa+I7jvFjYfH2iRuEI
         BDMthEBYjSfiYPUtIqy3OVPx2enk0TzgbVku1iV9ibPHwPI1XNUt330Y9Gx8xxf6gd/Y
         3xSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=UCXXWM74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020a05622a104d00b003ba1ccba50fsi5298122qte.557.2023.02.06.15.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 15:35:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=UCXXWM74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPB10-0000W4-Pw; Mon, 06 Feb 2023 18:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jI7hYwgKCFUJH4xBGF43BB381.zB9D19H-xE9ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0Y-0000Ie-Jw
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 18:34:54 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jI7hYwgKCFUJH4xBGF43BB381.zB9D19H-xE9ABA3AH.BE3@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0S-0006Dz-Cl
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 18:34:45 -0500
Received: by mail-pg1-x54a.google.com with SMTP id
 e11-20020a63d94b000000b0048988ed9a6cso5766811pgj.1
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 15:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FYWw/qRjdcb7I6Rft+1C6I9O+sG+q2eO6RDEKUbphx0=;
 b=UCXXWM74nYoVXuvviTlBWaDwqwbTfaWrZFCsgE7AjZbuiXHP5JPbW+cnyl8lA2S7Ob
 b+KP+6+w8AHmNe4/is4nhMHkWdHDY71RNCGcISJRWQWDeLop/yT6URFZeA3reQu7y6o8
 2tbnyTaLWXEhPJbzX9PpGxAQYp0HzBEU0xDAiLHE6DvnvDRLZFxfvCKoeAZvzrmMLAn4
 QuX3PsNJbuNaMqNPRVQ0azu0VTRgSv9SZQ8yxLzgodKgeQRJaSwZVISqh70TWl3VLU/T
 8g4WpHB4RKYUB3NXrdK1oWgscjAjQYyHyzMwMHVOP5PZFNXe3xrx1QUtHNuzW15vWsI9
 ZC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FYWw/qRjdcb7I6Rft+1C6I9O+sG+q2eO6RDEKUbphx0=;
 b=gv7Hq0K/usEtd+sxysPn4HIDj7gC2Xhb2sremNx2fUGk/dkviJ39TPrbYBqp9mh8g5
 uxg61yt79ZXmdsPqfBBNVOVTgrsq65214u84+sMR3HXdPQvAU0Usj4lyvFqmrTXXNY7i
 FNj7Qz3WuIY9ZS/KkvoCZHJNjFeY3jU0GqBmuILAmf10MTl3Mqotn4Ji/nJM2HIqsH9s
 ZoKiU4Rf0hR+/7zA5MJHdqg0FrjTubdizAYVNHoRgftdDZHgS2C1w+8hBQbs/+gvrgyJ
 3pN9G+gmtSHNEnf2X45fwzaLyKFyT8I/mnSR4UCw3nfAK5Fm2rLDC4ki4EWCR9yenRRR
 Pk/Q==
X-Gm-Message-State: AO0yUKURO5IepbVDlMlC4IQYEhZn89QnZy9c5gCa7qXUHXaJOXJgMxpL
 yXFExnVrkF95NdkSJIseZzq4fma8dAKnEw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:1001:b0:230:ca06:f0fc with SMTP
 id gm1-20020a17090b100100b00230ca06f0fcmr819685pjb.95.1675726476385; Mon, 06
 Feb 2023 15:34:36 -0800 (PST)
Date: Mon,  6 Feb 2023 15:34:25 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206233428.2772669-1-wuhaotsh@google.com>
Subject: [PATCH 0/3] Nuvoton Peripheral SPI (PSPI) Module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3jI7hYwgKCFUJH4xBGF43BB381.zB9D19H-xE9ABA3AH.BE3@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: HZEae8F16tD+

This patch set adds peripheral SPI (PSPI) modules
to NPCM7XX SoCs. These modules can be used to
connect any SPI peripheral devices to the SoC.

This module will also be used in the next generation
NPCM8XX SoCs which haven't been merged yet.

Thanks!

Hao Wu (3):
  MAINTAINERS: Add myself to maintainers and remove Havard
  hw/ssi: Add Nuvoton PSPI Module
  hw/arm: Attach PSPI module to NPCM7XX SoC

 MAINTAINERS                 |   8 +-
 docs/system/arm/nuvoton.rst |   2 +-
 hw/arm/npcm7xx.c            |  25 ++++-
 hw/ssi/meson.build          |   2 +-
 hw/ssi/npcm_pspi.c          | 216 ++++++++++++++++++++++++++++++++++++
 hw/ssi/trace-events         |   5 +
 include/hw/arm/npcm7xx.h    |   2 +
 include/hw/ssi/npcm_pspi.h  |  53 +++++++++
 8 files changed, 305 insertions(+), 8 deletions(-)
 create mode 100644 hw/ssi/npcm_pspi.c
 create mode 100644 include/hw/ssi/npcm_pspi.h

-- 
2.39.1.519.gcb327c4b5f-goog


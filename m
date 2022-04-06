Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp1042147lfu;
        Wed, 6 Apr 2022 15:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoeE0w7YNmUxpfJnpr1zGy06ZupvmVA0mdQjIuskYwyHtBgpFPpIYzbwiyFemhpiRZ4k3v
X-Received: by 2002:a81:1b86:0:b0:2eb:8d44:3ca3 with SMTP id b128-20020a811b86000000b002eb8d443ca3mr9519153ywb.386.1649284509409;
        Wed, 06 Apr 2022 15:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649284509; cv=none;
        d=google.com; s=arc-20160816;
        b=ipQfq5XmRUlDpvgelHD5bX8SaxpgIpq9R+Lue92vb/V2nz8iFVF6eO7vB8kEz1ACdW
         UTcBeSE6VjvWQlFDdsUTg0bJQKwuRj+FWkzkkNLXzPH7HK87fITOOdIjAV8jyU2xuLEK
         h8uVM+h9kLeQ0Uo8JjuTS9P3wCxZmPiJT2xOA4QbphLNOBAqZoNFC6HzGhdY1bmi4FZw
         bSwgveSUZPMLy0H/8JlXMv6JdnTApUswKXyZ3OE6G0ih8pvpUk1Ys5Inmu/yskkGZE18
         gK1yDTfPQldyHQcSvtxbURx8trC0NfBjP+ETJ+S+7+tT4yZnikg4BEukj3K9W7QStbWX
         ZKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=za+GIZQ1g+M8oIvy1mifuz9vQx1PyLnJAIldTNUuLEo=;
        b=gePlZtp7nfPgx2bZq/pM9ptvV2lFABBp/EpNB4svENMK5fkbjTylsmoxopOt57NA45
         x5yRRoslmtkawblkh9becUYU8yi/PD0/H484ma4aoENURIrnPwLATTJvBqmf6CifqZY3
         t7m5xaXxthbwGqTvKx2KMUmGBegpQ0fgh6SXpityZOwNmsTJ34nOkl+T0KrYOjzWWbaR
         JAWLmEEIIdtDniCOtBSXjmrx0cTaWNDIkTYjM450HgJnCuz5YKVvDo2xJFa8zhyrBQUz
         D7CSEFi7d/KTLogdp2PyOPsx52KO9Z2wIapcYAtRS4AqjkHHUnYbI0av5qjTgFCqHOug
         km3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=AHpZdoFc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z66-20020a814c45000000b002e5bb9dcaf7si11289853ywa.384.2022.04.06.15.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 15:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=AHpZdoFc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncEF2-0002t9-P8
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 18:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hxVOYggKCAQ0ylesxwlksskpi.gsquiqy-evqrsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEl-0002sq-Cw
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 18:34:51 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hxVOYggKCAQ0ylesxwlksskpi.gsquiqy-evqrsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1ncEEj-0004VU-VP
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 18:34:51 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 s18-20020a170902ea1200b001570031e832so385513plg.6
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=za+GIZQ1g+M8oIvy1mifuz9vQx1PyLnJAIldTNUuLEo=;
 b=AHpZdoFce/H6DS3k+znjCLT+08vzPPi7OemRgp2h/68oAszPTBOXkvX7WlnwSMSe3M
 OpaFsrLYiZe9KZ8t3nC7O79XQux6GAwnvtzJAHDdUo/JjnXfc6xjJ+8eSSmdTmO5tarl
 wdi1+NYI5ekZElnR0zJPoE0xJ3or3GcgSr5ZllrxV+ELk9MOnpeQWIl9QfFs+GHPWF7E
 Xavq7oKGwHO+uQEoHBgGMCw4V2lzLNAoOGKKgElyGh4jsXJaUvOGwf3TajdUNMSPPf+D
 bqsLNhg3bOP14/NJ1ovUC2C5odwkFZc7TBh75kIRrmMnenQejwa4gSIRyqtBQPVmxGcg
 pi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=za+GIZQ1g+M8oIvy1mifuz9vQx1PyLnJAIldTNUuLEo=;
 b=xUoKFz6g8oEgQrwuNo0CJ66Ct+P9e03NFmo8WMC89IwDS1Wfd9jCe9do5gTKCXU6dV
 ib5DQK4KnE195BVjUtAUgjcFpmnruvXfst96UHNVxZp8ujtszmstV7iy18LOGvEKyWJd
 nTjQVOhuwkAj0P3fYd2QwCximNDmqvW24BKbZw+cr9/Is8uG0qs6R+uTv+TdVy/+M1Vp
 TSzheH5CUxxvOQ3uqdFzDmdQx0+/NoP0ioCa7EBi3TV+SnrRxzfq/3nQn7O057ckkOOy
 0JulQBeh68x8DmlPUxp1HijuckJTeYmVnuJx3pKfCHQinYSytJWFV5MpwdeJ/Tir8Z/M
 nATg==
X-Gm-Message-State: AOAM533YCySk+6YYY+e+d44pgOItTBX8wHiEWGXI0PR7+mPwAqDamnn8
 irjfSJxNwLY8I6oVZGKJ108psmwK7zHPCQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:db48:b0:1ca:ab67:d75 with SMTP id
 u8-20020a17090adb4800b001caab670d75mr213769pjx.1.1649284487440; Wed, 06 Apr
 2022 15:34:47 -0700 (PDT)
Date: Wed,  6 Apr 2022 15:34:38 -0700
Message-Id: <20220406223440.2901032-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH 0/2] Define NPCM7XX PWRON bit fields
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3hxVOYggKCAQ0ylesxwlksskpi.gsquiqy-evqrsrkry.svk@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlrYPzITDjH+

Currently, the PWRON STRAP values in NPCM7XX boards are magic
numbers. Similar to the aspeed ones in hw/arm/aspeed.c, we
define bit fields constants for them and use these fields instead
of the magic numbers in the current implementation. The code
should behave exactly the same as the existing one.

Hao Wu (2):
  hw/misc: Add PWRON STRAP bit fields in GCR module
  hw/arm: Use bit fields for NPCM7XX PWRON STRAPs

 hw/arm/npcm7xx_boards.c       | 24 +++++++++++++++++++-----
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)

-- 
2.35.1.1094.g7c7d902a7c-goog


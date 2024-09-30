Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1101071njc;
        Mon, 30 Sep 2024 01:53:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzeURbDb9HCVVVP6FCR/J1dueAqpKvNdMJ/cPZPwyjFuaPnCgzTJoVcBWvgWrhWWHcStpwPChJJYpzFA==@linaro.org
X-Google-Smtp-Source: AGHT+IHPp95+Rgb3SxQfff1jZXXqcxv3DnwBrtL0hfdSr0/zPjNGPCEqcseLf2zsycTtPX8DvZpq
X-Received: by 2002:a05:622a:181d:b0:458:26ef:6c with SMTP id d75a77b69052e-45c9f200823mr187886521cf.13.1727686382185;
        Mon, 30 Sep 2024 01:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727686382; cv=none;
        d=google.com; s=arc-20240605;
        b=PG7v0gxksoPi7/I5H9EECdrMS3ksrCgfus82dI6LEzCNC6heMRykeFI4cUeSGoK/Lw
         CBGvAJF81exQct1gzPIA8O55h667ORBIfBxX6CKofNpePyoT0at1C6nU5GLZDxj5o7uw
         2xB5jQ2jyFzg8PE646yo1PeIL78z/7sMdgJdWs+gk8ZQvx2pZMixYvifO+9HWVPBAu9F
         QV8Nqztvlv+woxhByEue4Am7sTmmpEyvcW1/vBqa7NYioXY23ehDrLV984OMypSfNIcS
         rMw2NGNOaFqjD07QAiYnj01HFmaVoW8vYb6v4510954Ej8m8sgqZam/TgJdxjyXG6JkW
         1iGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=08qVp+/fgfZu3JIQF5SjbdrYsuFI7HcMrlPsZUz4voU=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=FQuSMwTsGpG1xfeEH6Y1UEnRd3koqEXyopLbHrBQdts3f0qZmSe0torjkAMVz6c3yD
         3+hyaIBHJsha1a/HtHgMqByvJVCc2eLBUgTcNZFwisSjHm8h6sEYIVC0gqMMyux8C+1V
         A3lvTgffZuK5qIxSupc+fomHfATGf7VS+/pAb909Vk7v+Rnn5+Pv6qCLRBll2xCQBuua
         dj9/vQSbPraLbDJPjcT4qLimayoEmD0TWx9Gvf5HHFG3cN5RHr8QYdN67ZP8HpCGQPCC
         p2wpGf7GTzjEl5/+z4b62S2NRa4qvqmPUmDa09Xh5vj1qfsRRcpUsI55CiS5irxD5Bu4
         p0pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f2c0860si77023491cf.223.2024.09.30.01.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 01:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svC9D-0002l2-0J; Mon, 30 Sep 2024 04:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9B-0002gQ-Qr; Mon, 30 Sep 2024 04:52:49 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC96-00025U-L7; Mon, 30 Sep 2024 04:52:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 16:52:39 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 30 Sep 2024 16:52:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v6 0/8] Support GPIO for AST2700
Date: Mon, 30 Sep 2024 16:52:31 +0800
Message-ID: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XuRqqF+IrD74

v1: Support GPIO for AST2700
v2: Fix clear incorrect interrupt status and adds reviewer suggestions
v3: remove nested conditionals and adds reviewer suggestions
v4: add test cases to test GPIO for AST2700 and update commit messages
v5: fix aspeed_gpio-test test failed if arch is arm
v6: add to test aspeed_gpio-test for aarch64

Jamin Lin (8):
  hw/gpio/aspeed: Fix coding style
  hw/gpio/aspeed: Support to set the different memory size
  hw/gpio/aspeed: Support different memory region ops
  hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
    mode
  hw/gpio/aspeed: Add AST2700 support
  aspeed/soc: Correct GPIO irq 130 for AST2700
  aspeed/soc: Support GPIO for AST2700
  hw/gpio/aspeed: Add test case for AST2700

 hw/arm/aspeed_ast27x0.c        |  18 +-
 hw/gpio/aspeed_gpio.c          | 427 +++++++++++++++++++++++++++++++--
 include/hw/gpio/aspeed_gpio.h  |   4 +-
 tests/qtest/aspeed_gpio-test.c |  77 +++++-
 tests/qtest/meson.build        |   3 +
 5 files changed, 506 insertions(+), 23 deletions(-)

-- 
2.34.1


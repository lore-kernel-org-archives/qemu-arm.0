Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp617782ejb;
        Wed, 26 Jul 2023 08:12:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzP+t1jqZwfTgx0fR9I3BNeAEnkm4bV+/y52mmtsMuimoq70xgLf1jleCfSu8KFB0k7tF6
X-Received: by 2002:a05:6214:62a:b0:637:707:120 with SMTP id a10-20020a056214062a00b0063707070120mr7652826qvx.15.1690384370733;
        Wed, 26 Jul 2023 08:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690384370; cv=none;
        d=google.com; s=arc-20160816;
        b=iHC7UBwHGQDb1nnn6GVf+CBEK8E5QXW4BxtbLyYNbXSsWJ+wuCNQVaEf0Nv88gB/FN
         Iu1lpUvOybtfkK5/tX3CG7j2+Tw2n5fnRSNMlHqJaXt9eH7XhNf9+B5affw7ERROSdol
         baL9sFTxOnM1RpXZSfYs2FtSQbjU/C7vFFHNjucPbuvajwuSMeyCizQ1PoU942fkX3xc
         RhhqxZ0ydjG6a07M18VfkqeZpubg8YiYeSnwBwH/OFWZJ0D5Y5VtJuQEgoTst5UrtV9Z
         KYG9lA6bDi3AHNAwHOiG6rPGH9gs16TZZfNSTYFknJbv20/oQXsXJdMrnY2P0D0UiDBu
         kvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vGd9BO2gWsDD5jiD7uGX7NI67n8YdnepoA7sxpi283w=;
        fh=JgnsB9XLFuPngT7wqypJCHdtxW/PW9Tm1+2z4tmHVig=;
        b=YgHxVHuph9Qq1GPMUNLOb5seE4Rk9jZt5C1BqG5nfX0+SwTpf8T4Ue/TQpVV3W2IyU
         +Pf9YDkuv9b1q9sA0uxg7i5houShJPerl2MxZFwvE4c5bWnjnrtmbs0Vvj8qMu/2r+O9
         fEP6Nn1J1DDG94GiocC1KK4m74SaX/Tt6SP3RqhuQZpyxPWilPC5g0iJfentznWVK2/d
         zjKCWJkh8RpFrgCsTeNT1/G1ozCh/LTdZDZRi7EO7npEbPE1t3tq6XXHZbcREwpFkVnS
         h4ET8qHyBhgQjwA8j4d5SlJYXzm8uhg7/MSalfwO3O5Dwp/mleB8YIQ2eqk3Rl5BtWH4
         +VzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020a0cb249000000b0063d1f9b0d6bsi2119421qve.282.2023.07.26.08.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 08:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOfz8-0006Pt-NA; Wed, 26 Jul 2023 10:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qOfya-00066e-TI
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 10:58:56 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qOfyY-00039Q-V0
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 10:58:56 -0400
Received: by mail.gandi.net (Postfix) with ESMTPA id 493031BF20F;
 Wed, 26 Jul 2023 14:58:48 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 0/3] Complete i.MX6UL and i.MX7 processor for bare metal
Date: Wed, 26 Jul 2023 16:58:43 +0200
Message-Id: <cover.1690380197.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=217.70.183.201; envelope-from=jcd@tribudubois.net;
 helo=relay8-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: cSsjQybZu0sj

This patch adds a few unimplemented TZ devices (TZASC and CSU) to
i.MX6UL and i.MX7 processors to avoid bare metal application to
experiment "bus error" when acccessing these devices.

It also adds some internal memory segments (OCRAM) to the i.MX7 to
allow bare metal application to use them.

Last, it adds the SRC device to the i.MX7 processor to allow bare
metal application to start the secondary Cortex-A7 core.

Note: When running Linux inside Qemu, the secondary core is started
by calling PSCI API and Qemu is emulating PSCI without needing access
to the SRC device. This is why Linux is using the 2 cores in Qemu
even if the SRC is not implemented. This is not the case when running
bare metal application (like u-boot itself) that do not rely on the
PSCI service being available.

Jean-Christophe Dubois (3):
  Rework i.MX6UL device implementation/instantiation
  Rework i.MX7 device implementation/instantiation
  Add i.MX7 SRC device implementation

 hw/arm/fsl-imx6ul.c         | 163 ++++++++++++-----
 hw/arm/fsl-imx7.c           | 204 ++++++++++++++++-----
 hw/misc/imx7_src.c          | 289 ++++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 include/hw/arm/fsl-imx6ul.h | 149 +++++++++++++--
 include/hw/arm/fsl-imx7.h   | 348 +++++++++++++++++++++++++++---------
 include/hw/misc/imx7_src.h  |  68 +++++++
 7 files changed, 1038 insertions(+), 184 deletions(-)
 create mode 100644 hw/misc/imx7_src.c
 create mode 100644 include/hw/misc/imx7_src.h

-- 
2.34.1


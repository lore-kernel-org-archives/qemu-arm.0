Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4810180lfq;
        Tue, 29 Sep 2020 11:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI0nCwIPQHC14CTvohUY41A98Vm/FWMd6XLTNBczavJ0kcx18aS09gD8o2WzPv7yElTvp1
X-Received: by 2002:a25:b68c:: with SMTP id s12mr6934659ybj.502.1601402886604;
        Tue, 29 Sep 2020 11:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601402886; cv=none;
        d=google.com; s=arc-20160816;
        b=rhyz9YtjDCLP366juPLqz/Niu2w4m1xYorXEZxfzUBqRUGqku6pN0lZslIwUs2GhBW
         kb0x5m7uszJqGc1txJjZinuoMekXh1tCB5ctSKXR1Ozve955rFuN4+cvURd0gRxmw1KU
         im+MKQnVXBfMbUW7Fw3dc+0kEymcW9QQesD0XOLFo0AxPiktp6bvoPcQ64KYdYKRsg2A
         XWxvAWv4pT4XLTAroBOhfNdMsiZ4Vp+rHFmEPXzA+QiYKzNDCUNMYzVYN+P5Lsl5z4ap
         g4xwqs3kg3qY0+qbzGUbvNMgeWD6imPV8P+Z2SiyRozYlrsElDA9gCT+0wnonOuIQnIb
         aqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=+h69EmieUbWvODNNCpUiSWzZcoG0tS7XdI1g16MM+WE=;
        b=Uix3kTyQSrNGgxU2KWtk/nZUZsOb3ktvJUGAGx6ot7LJRmEByT0CzMnDnYfKY8XbQ8
         0HR7/0/QIss//6Ips4bn3RmUVf0DRT6ClUuTcCRyt/m7M8zffCMk1BauPowY0FURFUy7
         cCmS0tsnSSR6Y3eGRGrXACjiZUeyUvoNDOkbqQC+8JpxWu7wtiA7vQJKPvAjkERuEBj9
         rZygFdCN3A+Tbxg7/PELnQAxgYSrR4WAgfYygyrTMDckD5vH9hrN8JPTwCmecQCiHVKC
         CCXDVQ1cqOqOJ0P8e2LvFCRObPghw/0I7MY1lIGJ9U0tX9Dfse6od0T4z5oAa9fdNU77
         Iu9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZbgeoCG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si4983732ybt.54.2020.09.29.11.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 11:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZbgeoCG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNK2n-0000uR-Ov
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 14:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kNJz5-0006n8-Uh
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 14:04:15 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kNJz3-0001LK-VE
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 14:04:15 -0400
Received: by mail-qt1-x833.google.com with SMTP id v54so4291311qtj.7
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2020 11:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=+h69EmieUbWvODNNCpUiSWzZcoG0tS7XdI1g16MM+WE=;
 b=ZbgeoCG/qDIswEqh85pjfQIIgtqGWD0Y8F0l735YR4M1qQ0aF+HMrAzX4K9M9IONDl
 hEuhkeMXPkdovnvdAPoKSJpO8f/Xcp5aqFQgAt8Rr+bK7fSUtGOXpjKRHHvx/BnDE6um
 Zs0V3TsVx9i5FIVqfmEwqaqk0uFnwIAUQ96ymqHSxuPkBhMaq1FwJ9hd6G7wQCrsfF0+
 EYToxYKwNyyR6t+EYdN6B0/H2gflecNJqO+fezMqKaooipAi7WBE4e7jhGW95aVHV7Db
 Zdm7T+3xkbnZbBdKUioej80URhx9p68AAXPoFe/C3eoSw4Cb35jeSXDlMT3zunL0Q0VV
 hCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+h69EmieUbWvODNNCpUiSWzZcoG0tS7XdI1g16MM+WE=;
 b=qmbyvvMdMxMFzYhx+NdPwXbCJW+XdTuGFE5EOW+f1riqMxZm2v2c4rd8J0CAFLYyjw
 9d46nIEcJf+owz189+v27j0nvVeYZntIBHQ+dyQA0pPVx76KqN6q5piR3JNer7ceHifJ
 zCGVJfaDYIQ7wDqI/cG4wYV3zslqMHtSoJboIwyIhzgK9+PyS8Ssx68/28wC7jr6L0B6
 XxCsVj5L0YwaSnHEPzA5+OiziTQ4CYXZOd37U1I3qmS+JXjO+Ni7/KqwvdGzelXnu+9Z
 RH6eggfTArmC9LTvqYhav5gljUTBuWu95ZfdUccM0CZ7B2DmteIvFINwH5E3qUr++qw3
 BTsw==
X-Gm-Message-State: AOAM531vqYti4vETtw35vFisXlnQSBnKyPTEei+WjRQfDFU7y383CG7j
 Hyq+HSbY13X/S6Xmu4qECElp0w==
X-Received: by 2002:aed:29a6:: with SMTP id o35mr4616608qtd.123.1601402652116; 
 Tue, 29 Sep 2020 11:04:12 -0700 (PDT)
Received: from master.hitronhub.home ([2607:fea8:e2a0:e950::661])
 by smtp.googlemail.com with ESMTPSA id n7sm6600337qtf.27.2020.09.29.11.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:04:11 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 0/2] Add watchdog support for SbsaQemu
Date: Tue, 29 Sep 2020 14:04:08 -0400
Message-Id: <20200929180410.33058-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x833.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H66XkGrX9rLM

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM BSA v0.9 and then used 
in the SbsaQemu reference platform

Changes in v2:
  - split the previous single patch into 2
  - addressed the fprintf replace review comment

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  23 ++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 344 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  68 ++++++
 6 files changed, 441 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

-- 
2.18.4


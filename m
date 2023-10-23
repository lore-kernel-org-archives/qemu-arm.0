Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1704723ejb;
        Mon, 23 Oct 2023 16:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO1k9ChpNt5TM1adezacL8+XKZBf/DP4euC/gxLjn7dkanmKbUplREN2wHC6KD8N57WpVP
X-Received: by 2002:ac8:5843:0:b0:41b:7738:a8cf with SMTP id h3-20020ac85843000000b0041b7738a8cfmr15916504qth.17.1698104850640;
        Mon, 23 Oct 2023 16:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104850; cv=none;
        d=google.com; s=arc-20160816;
        b=b4Z2eAwz2CTJUUO0vhE3lZKOgHGZ/H9vWCupRCGutTC1L4tHeCDJfOXKR+PB8H/9XP
         aq0OCMAh0c0zuhDE6FbiJEZw9m3rxudm0BIfB+s0nXQ7yEYZWFW7r70/01WkOs9niGaC
         lwfJvBeEwumSrRan4+RO8xAvQUkFX/uO+mNyZS7MxznoBypKCdr3RcUP+HzzhsO53ZkH
         xHRmC0Pb6N0mbygEfGstLdwH+VK1lPDap/rruvJxmugJRT0SCIfxj2sjrgPaDUlmGGWY
         jHiBtPWXnjmu6+W896O9Ts8ZvnoHQMf9KuIIRy2YkLdLwxxelVN1iYvNdYZafzmcR3VR
         IOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=jyf88QQu3A+1FJdbFxQwh0CcA+yg8MiRY41kWN5s8gg=;
        fh=zgB0nr66aUP8jEcSE0PpLS11AJD6dvVKT/SWj45fxEw=;
        b=ROhyrD9RTeV6hc7gVqbu7n+Yx5mO2YnIPCnCz4nRNy4ki3/RK9ZBs5WEtTWN0izUiK
         8afANRMvoKo3GT9De5lWIDFRlx8cS/Rk55aGse9HRd088jPHRcHj/6NAJbvzwkvVO2kX
         PZxo1CKANC+iY+WSVGUCy0z7StBhCAagG2WmQTAXPYn6cWntDj1m4MeUjL6uq6sDMgpS
         S1VjBgC0SYP2XB9qFf3pkCPUKbgrsfyix65B34mHKtK7ZNbctBLnRPEhwwMYEOA6x8gb
         2OT2QpO2hroxul2g7UFJmcP5TcCfU5t+qeySjlERihlxUFpn3DrL/8DN/P4HlImXxITd
         qD7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rkh7GJpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020ac859c4000000b00419691400edsi5872263qtf.478.2023.10.23.16.47.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=rkh7GJpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv4dV-0002rE-Vj; Mon, 23 Oct 2023 19:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38QU3ZQYKCAo3s3421qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1qv4dR-0002mM-94
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:01 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38QU3ZQYKCAo3s3421qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--titusr.bounces.google.com>)
 id 1qv4dP-0002l4-7m
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:01 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a81cd8d267so74926887b3.1
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698104817; x=1698709617; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jyf88QQu3A+1FJdbFxQwh0CcA+yg8MiRY41kWN5s8gg=;
 b=rkh7GJpkzon+E6LP6gR3o9bElGuQDlMzXoLIgVrEgTcCNmuMhblr0q8zYZCRURtN+w
 D3dPWK4nzcNEOy7o4q01FUPkBA9WqHwSezZ03yaleQEWBbGyuyNtQqMYOYeb8qYHwSfI
 Ht25mn0/x/jriHaGowtMqAAuuS4QryQn8Kgh3qTVHXCdHtvJfIhCs2dh9oreZIWQES4l
 I3VKrk5xL59jFSv3gMS7cTWkCmQxTgzNBVRFA+WupxdWFsczGTpPvR/iNguGv0t9A52y
 ljgtTrEMw7NN9Xi8AZ6r9RUjwZGikSBCIIJJtkotg3fm8kXCALMOALHnd/SjPuL2qaPP
 NV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698104817; x=1698709617;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jyf88QQu3A+1FJdbFxQwh0CcA+yg8MiRY41kWN5s8gg=;
 b=ptrwjA9YC/u/KtOTWTC6R3wKmDUXk1pZbCw+KK9SwmpyOwnUQWkfd6En8Hb9pVCaIE
 q2NwK9P4KPCbnXt8p1fiQGOcm9+HHuCDgHB1Y6dE1Kiw8On4W+NGQ4wvhq4nooUId5sp
 v7go3lJnBGuyKS0OrnZsoZaDoK4YUFh+vAcd9tRq6nZ6hyfsL/WWEQVDaJF6S8DnrjAf
 9gnDwCJq7is7h3gP5BfqipBUcFK7iIJ53W/xD/TI/tvt2sqanEMEU5MdxaEU3e+uEydT
 73U1hFViIhieLy29GHNUX1HPRNx8fL+ql6UIXUgih6sq/mS2YDf8l6fkDrCTIVQFFSCJ
 1lgQ==
X-Gm-Message-State: AOJu0YwmeiEYzc1pPfXvhCWtQ6VvWZfxus3k5tteim6Ti63hwMrW3K6d
 ES78lHUKxsBaztVkGipn+NX0b8ELnCc=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c946:c18c with SMTP id
 v3-20020a056902108300b00d9ac946c18cmr274864ybu.6.1698104817016; Mon, 23 Oct
 2023 16:46:57 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:46:39 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN8FN2UC/x2NQQqDQAxFryJZN6AzxdJeRbrIaGbMwqkkKoJ4d
 8cu/uLxebwDjFXY4FMdoLyJyS8XeD4q6EfKiVGGwuBq55sytIWS5ITzFFbDzWPrBm7rEKN/v6B
 ogYwxKOV+vMWJbGG9j1k5yv5vdd/zvACiJIU1ewAAAA==
X-Developer-Key: i=titusr@google.com; a=openpgp;
 fpr=228BD42BAD6A2BCD3865AEA6C41200175CD21E30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983; i=titusr@google.com;
 h=from:subject:message-id; bh=BULLV6pkDd+M0BBQ0LSkUD4dT8NFaiHW2TZtErq+oJU=;
 b=owEB7QES/pANAwAKAcQSABdc0h4wAcsmYgBlNwXs9KspIa9gyFAnuCWviwZUKBEMty8AUXifz
 f9OrYmlqaeJAbMEAAEKAB0WIQQii9QrrWorzThlrqbEEgAXXNIeMAUCZTcF7AAKCRDEEgAXXNIe
 MC9DDACBpTHMy0kqx0v73s98Udn10xic10Qbcn65Z+Wrhzg7gh/pHdlg3pLpLL2Ic1Z/LstgsRh
 EY0Itqj/rMpdY7MuTal6eHxBTuvAZ9TEbHicuu64JBu5u7aVWfrVyNLXMKmYVFCvRhpXGs6Byp5
 YvsUtvpBWzKFo0vt2xhJa+dClixp3hS4nZIABZAX3ILcQ/sB2xUhJEcWwZvu3wTq/7+WhL15v9O
 H4o72cKxdmGklIj9jgCIt1gDIeA+smmhCxWbkbCQ29Lpqyyx1f+b5PIFm90vzM9Sg8WcbLi1Keg
 jOzocSwhim+Ec+MQdE85/kORIe1TsYLl3cE0R2z78/13P2ygDO1bodlHwjSMiGTa3nVERWR4nr+
 lpYjeUzZKCwCtWQ1aZmoiMI9AKWSqLSaMIwJSlWrzsP+ZsGh0wDchYsaz+Ib5EcGT5UyIGaBvtA
 xYt/qNSPdasWQhg3Yti59y9Guq/dYq2Ms6ZlHcaZqHEYCXgpGdaPk7qcMMXjnYYktTR4c=
X-Mailer: b4 0.12.2
Message-ID: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
Subject: [PATCH v4 0/8] PMBus fixes and new functions
From: titusr@google.com
To: philmd@linaro.org, minyard@acm.org
Cc: Titus Rwantare <titusr@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>, 
 Stephen Longfield <slongfield@google.com>, Benjamin Streb <bstreb@google.com>, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=38QU3ZQYKCAo3s3421qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: qqqgxDagBC8i

This patch series contains fixes and improvements to PMBus support in QEMU.

The following has been added:
   - Support for block receive
   - Support for devices with fans
   - Support for the VCAP register for devices with onboard energy storage
   - A bitfield struct for the vout mode register, whose bits determine the
     formatting of several read commands in PMBus
Fixes:
   - String read now handles now logs an error when passed an empty string

This series is in preparation for some additional sensors that exercise
this functionality that will be incoming shortly.

Changes in v4:
   - Added missing commit tags

Changes in v3:
   - Added fixes to PMBus: page resets and fault clearing

Changes in v2:
   - Expanded commit descriptions
   - Added the ADM1266 device model that uses new functions

Signed-off-by: Titus Rwantare <titusr@google.com>
---
Titus Rwantare (8):
      hw/i2c: pmbus add support for block receive
      hw/i2c: pmbus: add vout mode bitfields
      hw/i2c: pmbus: add fan support
      hw/i2c: pmbus: add VCAP register
      hw/sensor: add ADM1266 device model
      tests/qtest: add tests for ADM1266
      hw/i2c: pmbus: immediately clear faults on request
      hw/i2c: pmbus: reset page register for out of range reads

 hw/arm/Kconfig                |   1 +
 hw/i2c/pmbus_device.c         | 237 +++++++++++++++++++++++++++++++++++++--
 hw/sensor/Kconfig             |   5 +
 hw/sensor/adm1266.c           | 254 ++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build         |   1 +
 include/hw/i2c/pmbus_device.h |  17 +++
 tests/qtest/adm1266-test.c    | 123 ++++++++++++++++++++
 tests/qtest/max34451-test.c   |  24 ++++
 tests/qtest/meson.build       |   1 +
 9 files changed, 653 insertions(+), 10 deletions(-)
---
base-commit: 384dbdda94c0bba55bf186cccd3714bbb9b737e9
change-id: 20231023-staging-pmbus-v3-62de60bff397

Best regards,
-- 
Titus Rwantare <titusr@google.com>


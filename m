Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp79586ejb;
        Wed, 8 Feb 2023 14:44:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9TIzMyfjMjzHp6T0I2RVXW40OgZ+LCRrvNTz0ADo49hT+8gGGZwDXYLX0THVqEAIMmGu4h
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1f09:94ab with SMTP id 13-20020ac84e8d000000b003ba1f0994abmr15804002qtp.57.1675896256242;
        Wed, 08 Feb 2023 14:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675896256; cv=none;
        d=google.com; s=arc-20160816;
        b=DVQaxaHbhw92hpONE8MqXUTHIvidStXYC1/f+e3509SCbqG8dodc7tf/eJ8B4ljKXx
         uvfOF+0M80Ql9vhSv+TaDt8JcY0FV5tsmVevW8igjpFk/lxKB7eDXARjSwAw/gjjh1tu
         r2LU6kzvCpScoBA1faA3yPAFg5MhbVIYuZK+Ib+6oMa1bueG6iZ8/nlUlmuQG5oKJV45
         iOEjDtQ2oDMDJl2iE0u6vt8AQkDaCbqjGA/JT+HcQCSAbVmxNRO3JblsXH/KDv6fBfNN
         kLKtoma5+tg8WWLYNAoAiMYBi8/YRw/6m4r9HXJ4rS9BSqmAhrT8F4LyAGGIM9vDBi5x
         xjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=r/00doHFcVzc4IB9itN8rc2KL7Q2cB+ydnX+2AslmSA=;
        b=CUJ6gLyQ5wjd4F40vX4wv+q4HmjFlwR/K37JPzOT6lsDbVg41ySBKQkf7Eo/kKhDGG
         Zi6Iz0lwAfoHK1TvELDsM85VdvICmVEhmD8B7gcN0m6HGtEFZf5iOW0UKNNNdGsoFuLn
         XdRPbyf4U4Xip+YgPEB7jug4GsFfZN8g/ZRwChkTRxXPRNOowoEO+ybAG7rrQZaJ4RQd
         nTYqD4iaPIT/9NNEenchHKQCKjZQKBincJcqgqI21r81Xwr9/iasae9w1QtJIrWy9LSV
         8VqG0CTMojVdHlByzlNa+ROO4g/4EhD1JOqsbvOnYDIP6UqM+av3BzbdCupM+Kk8SIs6
         T2qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gzaccR0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020a05622a000b00b003b62c3eb9b1si61796qtw.572.2023.02.08.14.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=gzaccR0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPtAU-0008Qj-RZ; Wed, 08 Feb 2023 17:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qSXkYwYKCKodSdecbQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--titusr.bounces.google.com>)
 id 1pPtAS-0008Pn-S5
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:43:56 -0500
Received: from mail-ua1-x94a.google.com ([2607:f8b0:4864:20::94a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qSXkYwYKCKodSdecbQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--titusr.bounces.google.com>)
 id 1pPtAR-0002fH-96
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:43:56 -0500
Received: by mail-ua1-x94a.google.com with SMTP id
 c30-20020ab04861000000b00419afefbe3eso135166uad.4
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=r/00doHFcVzc4IB9itN8rc2KL7Q2cB+ydnX+2AslmSA=;
 b=gzaccR0OKY1Fdz0BZ0Jd+lnK3/1jGorNlMRwT1t+shazOTVhP4nM7DqqiOuyFz+NXv
 d6ISYb8VtWt3fM4xhptEMd35mFLJualp/LkzQ558rC41tBtg0UasmZ+9dEeYIBLtoteI
 99jM8ylT4T4mn6HmLZPmvIr7PAEmYldwM99vZEVtuiLhbprtXVFLfl7MCWGYba+4y+tC
 ZOE+0tYIuvMrxk4Er2f/MW/fT9kNbF/0tvdNd4B44ZE8iXVd7GC3yyyoFe9+mPKxnp0/
 Rg//4Zl9Lysi0/JatntYbktX+g0x6YVL51pX1ACXvajkD+D2ucF/iVtv5zCdvWvLhsM3
 0a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/00doHFcVzc4IB9itN8rc2KL7Q2cB+ydnX+2AslmSA=;
 b=TYW7dWgnvvKrgnYnzODrPQ4C8R2ROvWtSinr9pq+W5TRGBc9J3uL5bFdild43GnZeQ
 ovvvqQ+uUyo3uhoGe2WG6HuS5oSjHxKuZgLIaOxbLHucKPo1fSd6iN9PVkw7TYrx8bw4
 vC1X7kDD8TJjd+KYJImBpIKzGurcjIT680FapYf8CCwLCgZsepXjumHXjJ7XGJsWqTYE
 43zLBV05DriGT+EkOPz9bTAjAGENR8bzXi/hDKKqEiccggW1HAQAzWjzLW4p4RiNvkDm
 YM76YJOUPLgYIcLhf2ox3eDvCYNZMCkn495lDI/39efhnCYK6EvogRQA/QZsHRr/aLnw
 HhTQ==
X-Gm-Message-State: AO0yUKWt24hPLwLvbTBYpRs2QYEXhioG/ZLai7S8GSoEZ72bIudjcKV5
 mNZElnXyEDg+pGrzyyQNmmqLxZlO6WY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:ab0:624e:0:b0:653:d63a:91da with SMTP id
 p14-20020ab0624e000000b00653d63a91damr2345902uao.28.1675896233452; Wed, 08
 Feb 2023 14:43:53 -0800 (PST)
Date: Wed,  8 Feb 2023 22:43:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230208224339.270589-1-titusr@google.com>
Subject: [PATCH v2 0/4] PCA I2C GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3qSXkYwYKCKodSdecbQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--titusr.bounces.google.com;
 helo=mail-ua1-x94a.google.com
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
X-TUID: qmtYVG6ItO6+

This patch series contains a set of i2c GPIO expanders,
with support for 4, 8, and 16 GPIO connections.

The devices are configured as GPIO *inputs by default, but can have pins
configured to be inputs with qmp commands.

For example, the following snippet in a board file for a system,
configures a 16 bit pca6416 to have pins 8-11 as inputs, then asserts
them.

    dev = DEVICE(i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "pca6416", 0x72));
    object_property_set_uint(OBJECT(dev), "gpio_config", 0x0F00, &error_abort);
    object_property_set_uint(OBJECT(dev), "gpio_input", 0x0F00, &error_abort);

We currently use these to test hardware presence and LEDs in simulation.

Thanks

Since v1:
- addressed comments
- fixed typos in commit messages

Titus Rwantare (4):
  hw/gpio: add PCA6416 i2c GPIO expander
  hw/gpio: add PCA9538 8-bit GPIO expander
  hw/gpio: add PCA9536 i2c gpio expander
  hw/i2c: add canonical path to i2c event traces

 hw/arm/Kconfig                  |   1 +
 hw/gpio/Kconfig                 |   4 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 500 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/core.c                   |   8 +-
 hw/i2c/trace-events             |   2 +-
 include/hw/gpio/pca_i2c_gpio.h  |  78 +++++
 tests/lcitool/libvirt-ci        |   2 +-
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++
 11 files changed, 766 insertions(+), 5 deletions(-)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

-- 
2.39.1.581.gbfd45094c4-goog


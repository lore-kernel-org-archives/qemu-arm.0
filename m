Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4517974ejb;
        Mon, 6 Feb 2023 11:50:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/05ga/SZ2E7VcDMZm6BFAF2NZdQrq4FdrXFN3YaUF8g1JS9kAurCWmVkzPeliQ9UKkbGTR
X-Received: by 2002:a05:6214:d84:b0:535:664b:772b with SMTP id e4-20020a0562140d8400b00535664b772bmr573643qve.6.1675713054347;
        Mon, 06 Feb 2023 11:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675713054; cv=none;
        d=google.com; s=arc-20160816;
        b=mLIcg6B77GvvaD0HCs/YodIrGN57pthmjehPQQYbJDnnIAwZtfGd7RIJNwjV6UbApB
         hiulfHqGlV0SFjZaKnEtEjmXqVVazSAotnj3ptn+SBY8mhwT2mOgvMOpYAQjjrPxo6k4
         U9u4bkmM3jLzlUnAUHdF9aVXhp8iHKfp6vUoCAwDhuaql43zLJkizxbM1y+dIJmMQ8lY
         fzQU1wn3vW0Lv9fQ89uABywvX6CMaxxHbvM18QCV5qSQC3O7v2VlFRzV/PeXvIlW+vL8
         wXCfJC+9mMKMHNsDKfkUNZuPuQyXntTmY4Qr0hW8LNttkxH6zxhpaAuMdmhJqbYwBO9Y
         jfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=MIABIvJXLyUfLEOgHi2fdvN3Sdm0XCg8OR5adWLI9Ds=;
        b=qOE9WQpQM++JoAoAD0aKEJi90Hj6zEVgQBRe16u9/yJQg8cwt0qTyBZ1o05JVUXqAe
         m/YhUl+xdogrXMTSRGL7I0KGlr1ECV0xPV7Mb28TUCM7qm7q5Ts6UybPAYmPMDhDXnzJ
         7svtz8mf+PKhdPdhjCpQDKBH8SBAFMyIwsWwzYcLtgaYmauX/lPx1kiEsKJegQmI8TVU
         ddF85rzZl0JKS2IcvtJletpXKDfsaOhHhfjRqcDGS8kvMQWPvkZNOyvxXwb2BW0SM8/v
         G/WHMAA3uyBxet4JFNoty40mj/o9a3TfV5cCtZyv3TzlIDwRvp9+2ZmXJfWIxJwIojCH
         KLUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jat5SGEC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk6-20020ad45d46000000b004ad5edaeeb5si10494022qvb.357.2023.02.06.11.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 11:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=jat5SGEC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP7Ur-0007eZ-Qy; Mon, 06 Feb 2023 14:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <311nhYwYKCjYlalmkjYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--titusr.bounces.google.com>)
 id 1pP7Uq-0007eQ-I3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:48 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <311nhYwYKCjYlalmkjYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--titusr.bounces.google.com>)
 id 1pP7Un-0007sU-N1
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:49:48 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-4c11ae6ab25so124065697b3.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MIABIvJXLyUfLEOgHi2fdvN3Sdm0XCg8OR5adWLI9Ds=;
 b=jat5SGECEFw0KjrKMdqy8WV7sRNQOrbupm13DFddb7goYZNMV8LEG9QUUWaRAZNrXD
 4TNRYKdhmyezN1r7ltZkCtWy2GxG180ItwjdisyfXZN+VB10QrYb7YL2GeqjCdxBjX3z
 BJihT2HmlSJISCZ+Mc/lR7qstqU7+yoDiQxznhaNdjWNaEaFK1IgDrQGsXatrkIV+XFh
 TznEG81n3efk8c2c5R2lsonLpqQJ1H2cLofAfjEruAj9j1ckH96t1cRDPVC3pI5xqdtN
 0AebUBHW872TwpyfdBiQN+O6jPhjGnjAPzxl181zW0BUOSWNVgAoj7pWa134DMBkpO+U
 UmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MIABIvJXLyUfLEOgHi2fdvN3Sdm0XCg8OR5adWLI9Ds=;
 b=5kEuCYQdvWj8lsy4rkLriqNF8jajBDMcNGAbDQsettKBSOsDtQ70c+yy6uU2H7436r
 E4zM3d1M9ujceCGcelO93bs2pYi54ufEqkHOirE/WYMPlxetVkfoF0hcV8DFYpXxIStq
 QNfCugZVdj1D5zerugv4tFPNgKJQXqg79asbpBsdZxKIfghzoNY11vt1l9f71Jh1+KTh
 DLbf76XIdUwjOjeIfiJaP2HudTIqhVKX99HOaPIUsSnrPkIW0lo8KBnthjyXMwyfA4uR
 mEohRlJ9ah2tJo/TDeCxh+1dh6rHL/1y/qbwTuz6C4sufwB+GrvV0615C4DmLOqop9q3
 i2Vw==
X-Gm-Message-State: AO0yUKV8i7O4+Nw9L2F1JlTHP0hyTGbOALSHKeoBv1xKqrzN8IgcSdEy
 NU0kp0h+fJRa9kA2Ap+uG/P5B6lyeeY=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a0d:f044:0:b0:527:ad97:a05f with SMTP id
 z65-20020a0df044000000b00527ad97a05fmr40981ywe.88.1675712983441; Mon, 06 Feb
 2023 11:49:43 -0800 (PST)
Date: Mon,  6 Feb 2023 19:49:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206194936.168843-1-titusr@google.com>
Subject: [PATCH 0/3] PCA I2C GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=311nhYwYKCjYlalmkjYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--titusr.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: Su5aXAvCoq7w

This patch series contains a set of i2c GPIO expanders,
with support for 4, 8, and 16 GPIO connections.

The devices are configured as GPIO outputs by default, but can have pins
configured to be inputs with qmp commands.

For example, the following snippet in a board file for a system,
configures a 16 bit pca6416 to have pins 8-11 as inputs, then asserts
them.

    dev = DEVICE(i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "pca6416", 0x72));
    object_property_set_uint(OBJECT(dev), "gpio_config", 0x0F00, &error_abort);
    object_property_set_uint(OBJECT(dev), "gpio_input", 0x0F00, &error_abort);

We currently use these to test hardware presence and LEDs in simulation.

Thanks

Titus Rwantare (3):
  hw/gpio: add PCA6414 i2c GPIO expander
  hw/gpio: add PCA9538 8-bit GPIO expander
  hw/gpio: add PCA9536 i2c gpio expander

 hw/arm/Kconfig                  |   1 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 482 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/Kconfig                  |   4 +
 include/hw/gpio/pca_i2c_gpio.h  |  81 ++++++
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++
 8 files changed, 744 insertions(+)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

-- 
2.39.1.519.gcb327c4b5f-goog


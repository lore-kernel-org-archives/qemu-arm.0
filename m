Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3305592ejb;
        Mon, 20 Mar 2023 14:56:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set80QUARwTvxtzL71zBYTx+o8PaK7YxmTqHGFSqmkbjcOwlt6puBIeYVna6/rmwZeCKTdvl1
X-Received: by 2002:ac8:7e93:0:b0:3bd:1bbc:8d8e with SMTP id w19-20020ac87e93000000b003bd1bbc8d8emr1427742qtj.0.1679349371550;
        Mon, 20 Mar 2023 14:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679349371; cv=none;
        d=google.com; s=arc-20160816;
        b=Oet1BH94xkniNzUp6uZVrlcWWSnT3bGJUvV3eABzFvdF46dgjZlaVn1JMFfhS42dcF
         1Qzu5IKnUMD0TL+SLk86RH3OgZ/ktEKrTA0NVW3JpwMLBnPBxf+pAr6dK7WO+RukdV1D
         tVgD592uvPmYoJYdzvn+D55FQNqmw2ozOY5NJhZ6p9UEIYXHMMh83KZF5KgvwM7MAzbg
         6a3+DvWy3MbZNBCJ3OJQ0YLWZkjrUrYu+oofI6EFGh3Q5gGgNrJoshoIr1Z9Eo+kg/+3
         HEJ4g0kk3bP+eEb5pR49p2SK3iatBGfNK+KzMHtolUfiYa2sIL0CoOOu0H8inJPvay2n
         XAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=9TQ8MIG/ABiPoAVWjvrkNmohRgr/91qEVY2JL4G1ozA=;
        b=neyyr0meQz+9x7xkxb/k4l3+b7tR1+vp+653ISNsaErRXa+FXZhXYe+NWSIcQ1wrrp
         UKqxBmH9jzqr1y6V4aCSJFzpLm8AIBpXVdiQncG1zZJK3pg0TofFF3CpknBD+13QBahu
         gfye9EQfRZwx7wECaUNnnGUn+A2DBk7oyuspH6GR0nam+pT5/NxcFgHwdEYAdVVIJGvc
         6lcfBwK8TccKrVJ+PcmEsKNoxC04LWaYd4QTOcBo1237iR07ytokQ//L4FhulDw9gVg0
         X2LoiXKmfLxA1ELLs5ow3CF5ebGofAbm5OKTAgi+HQ39NNDApZz9d2ihJfPbg0kkT8fY
         lyhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=QxbTy5+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 82-20020a370455000000b0073bb1a96041si6390361qke.699.2023.03.20.14.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 14:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=QxbTy5+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peNTa-0005Xg-Na; Mon, 20 Mar 2023 17:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCIc4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTX-0005UY-Nn
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 17:55:32 -0400
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3UNYYZAYKCIc4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1peNTW-0006YS-49
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 17:55:31 -0400
Received: by mail-vs1-xe49.google.com with SMTP id
 d18-20020a67e112000000b00425d3211955so3257678vsl.2
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 14:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349328;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9TQ8MIG/ABiPoAVWjvrkNmohRgr/91qEVY2JL4G1ozA=;
 b=QxbTy5+8J7w3g3x2kBgVlDZo3XSpom3nCLSqkP1qtfDkC5RIb+Osyu7K/BbzIueOMo
 h6MO1ChS6v5pgcvuWur6Gu0vLulJywwCBICsv6pNweldE4AH/BpfDXDpDfzTgp93hG27
 ylRvdJkKr+mhGLBr8TV9cSsR7lsu1BzWUvI1BI6zd/F8e6EwbTZJ5WlJAs8K8xTTpcNW
 s0lLD+XBlF3Sfamqw5mK59g5ENKkRUs9LuNsq29TtMbC0793Hb2iAeUcV9wIXh4k0Add
 JC3MqrirrNu9vu5SJLXCNDlbp4EioRg1pB/+svpj+r1vezpUdKAnec6f0r4YObMkXs7d
 LVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349328;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9TQ8MIG/ABiPoAVWjvrkNmohRgr/91qEVY2JL4G1ozA=;
 b=loqoIo/Txpr2hSrvSDQE9wc5PLdvZGkJYiQ3MXycLyox/lVPqZzJJwjmkmMGzCdND/
 W3bNWUghIX5x2bc0v/I4oBVXoq3N8HaDPorQl30jDvKLl+pl5DFQ3yXye1lBW7hIVxRE
 GP3b8zXD1qRAsaEwabRow6tyKLncHtUogVBpZJNtyN777MRvpX/8hTAogtUTsxJ+wV5g
 mIW1f8+bEJG/7PpM31/nFNR6WogZ/JFddV+bbbazJHk1Zn/kGPVG7eOkya7JThaeyRRS
 Cvw+Q1I31fbJuPJOTrpwYkXl96cnaILgoOJok51jrb9OsuDWgeQk/7pfML61pl+fffWH
 6khg==
X-Gm-Message-State: AO0yUKVGSg4vI+Y8j7o7L5kSlzO8rXrpAxCdP82QytHq5LnHymA6r8ps
 GFn5CRu2+Z26rpxKfOWhfULztsAVNQo=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a1f:aa15:0:b0:432:6b9b:bbd8 with SMTP id
 t21-20020a1faa15000000b004326b9bbbd8mr103223vke.1.1679349328173; Mon, 20 Mar
 2023 14:55:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-1-titusr@google.com>
Subject: [PATCH v3 0/5] PCA I2C GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e49;
 envelope-from=3UNYYZAYKCIc4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com;
 helo=mail-vs1-xe49.google.com
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
X-TUID: IgNZy09m9qrh

This patch series contains a set of i2c GPIO expanders,
with support for 4, 8, and 16 GPIO connections.

The devices are configured as GPIO inputs by default, but can have pins
configured to be inputs with qmp commands.

For example, the following snippet in a board file for a system,
configures a 16 bit pca6416 to have pins 8-11 as inputs, then asserts
them.

    dev = DEVICE(i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "pca6416", 0x72));
    object_property_set_uint(OBJECT(dev), "gpio_config", 0x0F00, &error_abort);
    object_property_set_uint(OBJECT(dev), "gpio_input", 0x0F00, &error_abort);

We currently use these to test hardware presence and LEDs in simulation.

Thanks

Since v2:
- switched to extract / deposit API
- added deposit16 to bitops.h
- squashed PCA9538 patch into PCA6416 to use the same send and recv
  functions
- updated unit tests use asymmetric 16-bit test values
- add patch to imply I2C devices on NPCM7xx boards

Since v1:
- addressed comments
- fixed typos in commit messages

Titus Rwantare (5):
  bitops.h: add deposit16 function
  hw/gpio: add PCA953x i2c GPIO expanders
  hw/gpio: add PCA9536 i2c gpio expander
  hw/i2c: add canonical path to i2c event traces
  hw/arm: imply I2C_DEVICES on NPCM7xx

 hw/arm/Kconfig                  |   1 +
 hw/gpio/Kconfig                 |   5 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 410 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/core.c                   |   8 +-
 hw/i2c/trace-events             |   2 +-
 include/hw/gpio/pca_i2c_gpio.h  |  69 ++++++
 include/qemu/bitops.h           |  26 ++
 roms/edk2                       |   2 +-
 roms/openbios                   |   2 +-
 roms/opensbi                    |   2 +-
 roms/seabios                    |   2 +-
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 188 +++++++++++++++
 15 files changed, 716 insertions(+), 8 deletions(-)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

-- 
2.40.0.rc1.284.g88254d51c5-goog


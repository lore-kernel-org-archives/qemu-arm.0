Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4467342njc;
        Thu, 7 Nov 2024 11:55:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWj+lHscWkbBJsJg0tWP4+0yBJwGc2/EqDsVC2APYOPdGwByKoxpKkZJxMg67dO7WOu9D7FEm3YMocJlg==@linaro.org
X-Google-Smtp-Source: AGHT+IHz0lWGRTLJcr5Z+cEUSa0f8vFZ+ah/OqiX2wQjnR7uP7vh8InKFEHrJ9HfuUAW+N/tii+l
X-Received: by 2002:a05:620a:4485:b0:7ac:b93b:b250 with SMTP id af79cd13be357-7b331dc5331mr64464485a.0.1731009312273;
        Thu, 07 Nov 2024 11:55:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731009312; cv=none;
        d=google.com; s=arc-20240605;
        b=gXxLZDIXXgbk3TMLyjXUB0XIChL+sheMNyqI8gZg8ZkrLJvhjRqudf/IB1MWvdgspu
         YY93R+J2S+eAFRsc5UKy7Ungu4+fBY89WeXj2v/CU88jqKZhJZv79JIVcN84CnpN3ULE
         Cxtcc2wt0SXdd1vGkthK+vUvt6GLhJV3SUSBtAeZhBO9W5Qpo/7CncYloLfMf2Fp4pSu
         xY8E9MNx0TCDeD7Hi+Mp/isMHmIABpi7H5ybMDEOi2uXF5o7Jc14hhCxyIoEEQylhFgY
         gejYehpWkGzVElCeKqihznYK2Jb+Hjd01r4va45Id0QoEv0awVOrR15nQU5pF1pjhAAl
         l4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=Jzv6DPkMq+AatJ9bE5NP8pF1sQdsh9cAVnptctptWRA=;
        fh=XuBrA54R9ySozHoD/qCHuwIA1pKE6YAf4KhJE72ECqw=;
        b=jty8fmTEbRSXtEE8GwngxL4bssuMrOfi6s1Vs9QTLAFDbgA/Tx5ULFCRpJjSrRtT4g
         VdiQjx1Zy6BsGFI5Cy9fGUUsXbR+8K9Q/Tx4AaIfryoY/rPeSy0G27g6ybxYeJsHqGgG
         WLb+iYGw19hd5Hq4iDEa+XtC89rHVWoltOD+XlRoxFoMKZDK9EOcsP+gH6n+sT/+sHH2
         rFx4BbyjKux9KOHwoR+QM8W9KpnWSAyiqo8+9yAWnAGmc+/OB02ojO1ggUZIkPAHcG8J
         HyrTY044xnWJG1+fbTuasBnE1d4YITdjA7FdtVdwVzN7LwKaVXt86AfwkY67oqIkqbM5
         NNvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=h1QWR4dm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acb9bb5si230382985a.269.2024.11.07.11.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 11:55:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=h1QWR4dm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t98au-0001Sq-OT; Thu, 07 Nov 2024 14:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ERstZwYKCDwrgrsqpemmejc.amkocks-Ypklmlels.mpe@flex--titusr.bounces.google.com>)
 id 1t98at-0001Qm-4e
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 14:55:03 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ERstZwYKCDwrgrsqpemmejc.amkocks-Ypklmlels.mpe@flex--titusr.bounces.google.com>)
 id 1t98ap-0003K1-I2
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 14:55:01 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e29205f6063so2268472276.1
 for <qemu-arm@nongnu.org>; Thu, 07 Nov 2024 11:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731009297; x=1731614097; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Jzv6DPkMq+AatJ9bE5NP8pF1sQdsh9cAVnptctptWRA=;
 b=h1QWR4dmkZbMAaofqSXG9Y/s3OBcZ10KT4BSI62Vtoihrws1tiNiGfmui22DtlBq54
 eWeISE2e8HQgPh/sB7UzpeaalnCuOtxSQkorabzb6a4hbnBAjNeLR6ejwU6r4Q1rO9L5
 LpnUyDh6HlbCpGMEWKpdvJ+8cQNh2xE9XvUHEwo/sjwLYELg4/H73kYOtuCJJGUGw9xj
 ZG//Mo4sw22ravpGTZk1M1WlYTYVAat5VOqNp+agprDsYCPUMhFFZ9PfZJS0M9tp7ES3
 mAXwPok+WmuyHkl4lAqxRE67Hm8NsZrVkN4179bm389ElCjGGxwe5tRxA4SQZaw66+46
 4z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731009297; x=1731614097;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jzv6DPkMq+AatJ9bE5NP8pF1sQdsh9cAVnptctptWRA=;
 b=TR4I6UCwPoLrzjJz+ogaMieVCDW0cN7Xi7jtpgFwqOVyrQ3sHhjOEcVDy6VTIpei3/
 6PXustYjNAyQFP2R7E3L+LeKlEaAIiJOZGxZwn3pg1LSJEd9YbsAoC3OU7UvScB2G5xT
 Eby9Nq/V8m/NuL7wVSEF8mVIYUEiTfstOYSvoyEwKLr1aKfohgcVr2PAhIUnMbq7O74O
 xsa9y7p4uDkVIq0cj5BWzBoquzdf3PMg4mivAbj7hmfJWI449uvP0OsarZn1lFpDWoZo
 ccdFcc34sneZ+V5l+SZtAm71zzktI6rtW1rSd8ewYKofYQJs5LO+mxdOxoIOQ6sbV+vb
 RHlw==
X-Gm-Message-State: AOJu0Ywg3JJgy1zti4ouo8o6S3x8HrLXO3QAaEiVzV2zsCcnDx/DzRge
 3tyTz7PJ6RznyDCyHVzok2kcuaEXyD7mGkWfah+LvT8oR4YEHI04orSabmn+tkuJT3S78LO+Ai3
 67Q==
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:dc:567e:c0a8:e14])
 (user=titusr job=sendgmr) by 2002:a25:2d10:0:b0:e33:4850:b1bd with
 SMTP id
 3f1490d57ef6-e337f843c12mr621276.1.1731009297594; Thu, 07 Nov 2024 11:54:57
 -0800 (PST)
Date: Thu,  7 Nov 2024 19:54:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107195453.2684138-1-titusr@google.com>
Subject: [PATCH 0/6] Add Quanta GSZ BMC machine and PCA I2C GPIO expanders
From: Titus Rwantare <titusr@google.com>
To: peter.maydell@linaro.org, minyard@acm.org, clg@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org, 
 venture@google.com, wuhaotsh@google.com, milesg@linux.vnet.ibm.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ERstZwYKCDwrgrsqpemmejc.amkocks-Ypklmlels.mpe@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: TkHkcO7JlVru

This patch series bundles the GPIO sensors previously sent for review:
https://lore.kernel.org/all/20230206194936.168843-1-titusr@google.com

and the GSZ board commit sent here:
https://lore.kernel.org/all/20241007171700.1594342-1-titusr@google.com/

The Quanta GSZ a current Google machine of the day. This machine will be used as a platform to enable features such as the PECI bmc interface, and Intel eSPI virtual wire interface in QEMU.

This patch series also contains a set of i2c GPIO expanders, with support for 4, 8, and 16 GPIO connections.

The devices are configured as GPIO inputs by default, but can have pins configured to be inputs with qmp commands.

These sensors and machine are maintained and used in CI daily within Google.

Titus Rwantare (6):
  bitops.h: add deposit16 function
  hw/gpio: add PCA953x i2c GPIO expanders
  hw/gpio: add PCA9536 i2c gpio expander
  hw/i2c: add canonical path to i2c event traces
  hw/arm: imply I2C_DEVICES on NPCM7xx
  hw/arm: add Quanta GSZ bmc machine

 hw/arm/Kconfig                  |   1 +
 hw/arm/npcm7xx_boards.c         | 160 +++++++++++++
 hw/gpio/Kconfig                 |   5 +
 hw/gpio/meson.build             |   1 +
 hw/gpio/pca_i2c_gpio.c          | 409 ++++++++++++++++++++++++++++++++
 hw/gpio/trace-events            |   5 +
 hw/i2c/core.c                   |   8 +-
 hw/i2c/trace-events             |   2 +-
 include/hw/gpio/pca_i2c_gpio.h  |  70 ++++++
 include/qemu/bitops.h           |  26 ++
 tests/qtest/meson.build         |   1 +
 tests/qtest/pca_i2c_gpio-test.c | 188 +++++++++++++++
 12 files changed, 872 insertions(+), 4 deletions(-)
 create mode 100644 hw/gpio/pca_i2c_gpio.c
 create mode 100644 include/hw/gpio/pca_i2c_gpio.h
 create mode 100644 tests/qtest/pca_i2c_gpio-test.c

-- 
2.47.0.277.g8800431eea-goog


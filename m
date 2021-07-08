Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp524160lfg;
        Thu, 8 Jul 2021 10:21:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQpyHP4Qxbqgze6Jkxo9e9AzW3qnGXQNpYjw+Mh0mK6blYF7kPOEjdl2IEcJhH/go8APA0
X-Received: by 2002:a05:6102:d8:: with SMTP id u24mr22921372vsp.50.1625764898566;
        Thu, 08 Jul 2021 10:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625764898; cv=none;
        d=google.com; s=arc-20160816;
        b=CMeQjD3yKyJ//D+O2Z+7uTQv5ofSJTJ+7DkYQxT1pNHjFQ1YvPSIvR8ytUtRO5DfSf
         koL2YtokmB0egwXMRcWDMtHLBn6zXqSv8m2Pp53h5aw94SzosI4X6t7EHWAgjQ/GtaXh
         BLsKD+xHTXjgYdh26MleF/w6vzzfR6U/+QxjIIOj4yI/YsPprPbbxknzLLaNCwzVSGmq
         YYo/POysBMOq0toAmFFtIQTOd2j3RSTAIAUVcUnidyNd9qldR2Hcc9Yy9RaDxJQfD8cM
         HOq+ScmWeSkwXd0gJ9gDKk8K/8PbPYkSsx3k/EIxClCSxYO8XRyOpRs12VMNuL/Kkimc
         5mZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:mime-version:message-id:date:dkim-signature;
        bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
        b=t4MXBoxrz+MUBGcxsr1vh1mNOZ5snpsDwZCuzr276MF7cQ7yK5QxyZLpu2NFBA8Al7
         jj4Rq2n8G0RneBBz7mfBzVYyPnl26pm7pwEocpnr79Y1UNr2iQBAL7SDl/XJFT7Mc9iW
         J34cYr4qBx1VJrmRF0L71+IQG1pE0X5kxTGs5LcOnN9u1rESe/VkYG2IaLYeXOavkLcs
         CjDyAQAya7ETJCtUm6Yn/ub1IXyC00hC5Fvon0Cq7ecS+VU4NkLtkiXlWXKssQrhPiFg
         g0ynZGoZ5s8pNM//J89AZGbtQKY1c5xp9gfbKpn1cwReEAB3LMaHlcFj3Ee4A1Y7kOnH
         BR4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=U6n+48LR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si2740957vsk.365.2021.07.08.10.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 10:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=U6n+48LR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1XiT-0008KY-Pg
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 13:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36TPnYAYKCPovkvwutiqqing.eqosgow-ctopqpipw.qti@flex--titusr.bounces.google.com>)
 id 1m1Xhe-0007iX-LC
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 13:20:46 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:55286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36TPnYAYKCPovkvwutiqqing.eqosgow-ctopqpipw.qti@flex--titusr.bounces.google.com>)
 id 1m1Xhb-00040H-Ik
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 13:20:46 -0400
Received: by mail-qk1-x749.google.com with SMTP id
 4-20020a3709040000b02903b4d0f603a9so4349368qkj.21
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 10:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
 b=U6n+48LR5NRD4ybZqBw/DIHVvTqxQlwgOhEinse2pV2jca8Wlu9Vk5gQmQE5DbibdF
 DdxcZwu1X6RrPfUw7B1jHIm8crpDvYmQBWDX5c4sltzLoXIITsNHWKecHRUBREvzSGMN
 kRRQdnKtNISR5tHuDUhXyKYZGq0L8n2g68psFX7xBKRkxm0UG2XSPA8byX0uF9ZB06n2
 qO0JyoVch7Me5qGK7L9edh9GTTcB7GIuDClAtbwMfHwTBSAeERdLP1Mtvmmjg8SyBbke
 FEn5+PNXTIF3+KUOGsb1788iEgAxKZ31bbqlsjnJvSQzlrlGAalioGZ8k46Km4coezbs
 +5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=FHr7GpTjcPKiQulO8xLSX0cn+GAjyuX024ozidFHqF8=;
 b=m7sW/1lo2uEoLvI3t7sJP1JuZveUMo5lLMugOWH3XYFQpp/YC3EIjEOsc7RhrjEVf2
 TfuI3fCPGHSf/uAyWUvapEXL8a2mQuNcEU1C2TXisFIUthZ9M5bzYXAMELdGzDwRZCVx
 Ae9sA/fLwK74xGUjL0d25z4Vas/5vtSICLOzyc4aQHFtl/PohGA7Deyk7QVRqcrND+E7
 AzZqmRWC37xyr03pgEBewBzTZOjwgGtny+UnLU62lxhQD8gSIGRAUWKuuwsXzrj6dHE7
 Wbiqa7FibxVJekuDMEf6JyMnHSS5M1XYJk9NhJybJO0GSGtKeBowavNBAubXvfpiyCn0
 uFCQ==
X-Gm-Message-State: AOAM531sQzfsSEmnQ0wqVV6d+eOdKRD3fNXOoAWzeTKhpC9XVZZHpL+u
 UGJVs6tYPQOOyD9IbgCHySzw6xIXE2c=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:6b42:285b:df15:bf])
 (user=titusr job=sendgmr) by 2002:a05:6214:190:: with SMTP id
 q16mr31079439qvr.9.1625764841628; Thu, 08 Jul 2021 10:20:41 -0700 (PDT)
Date: Thu,  8 Jul 2021 10:20:12 -0700
Message-Id: <20210708172017.1865352-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH v5 0/5] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=36TPnYAYKCPovkvwutiqqing.eqosgow-ctopqpipw.qti@flex--titusr.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ScgWL1H8B3ul

Hello,

This patch series adds an interface to start supporting PMBus devices in QE=
MU.
I=E2=80=99ve included two PMBus devices: MAX34451 and ADM1272.

PMBus is a variant of SMBus meant for digital management of power supplies.
PMBus adds to the SMBus standard by defining a number of constants and comm=
ands
used by compliant devices. The specification for PMBus can be found at:

https://pmbus.org/specification-archives/

Currently, the goal for these devices is to emulate basic functionality by
reading and writing registers. Timing, and some logical operation is not
implemented. This implementation supports nearly all available registers fo=
r
PMBus including:
   - Voltage inputs and outputs
   - Current inputs and outputs
   - Temperature sensors

Unimplimented registers get passed through to the device model, and device
models can opt out of using the standard registers with flags. The included
devices make use of these fields and illustrate how to interface with the p=
mbus
class.

Datasheets for sensors:

https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272=
.pdf

Since v4:
- switched to BIT_ULL for flags to enable 32 bit hosts

Since v3:
- added VMState descriptions. Adding PMBusPage info to the vmsd has proven =
to be tricky, it's a TODO for now.

Since v2:
- bump for feedback
- removed commented out code

Since v1:
- addressed Joel's comments
- split out tests into their own patches

Thanks for reviewing,

Titus Rwantare

Titus Rwantare (5):
  hw/i2c: add support for PMBus
  hw/misc: add ADM1272 device
  tests/qtest: add tests for ADM1272 device model
  hw/misc: add MAX34451 device
  tests/qtest: add tests for MAX34451 device model

 include/hw/i2c/pmbus_device.h |  517 +++++++++++
 hw/i2c/pmbus_device.c         | 1612 +++++++++++++++++++++++++++++++++
 hw/misc/adm1272.c             |  544 +++++++++++
 hw/misc/max34451.c            |  775 ++++++++++++++++
 tests/qtest/adm1272-test.c    |  445 +++++++++
 tests/qtest/max34451-test.c   |  336 +++++++
 hw/arm/Kconfig                |    3 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/misc/Kconfig               |    8 +
 hw/misc/meson.build           |    2 +
 tests/qtest/meson.build       |    2 +
 12 files changed, 4249 insertions(+)
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 hw/misc/max34451.c
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

--=20
2.32.0.93.g670b81a890-goog


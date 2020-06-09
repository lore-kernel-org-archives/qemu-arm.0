Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp448428lfc;
        Tue, 9 Jun 2020 05:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzRdVy009B3HAKuE4J31mpipe5yx5GEkmb0TcPnw5HKmnwWloXR/IzpYjYgZImcNjzq+6Q
X-Received: by 2002:a25:2041:: with SMTP id g62mr6077012ybg.429.1591706485776;
        Tue, 09 Jun 2020 05:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591706485; cv=none;
        d=google.com; s=arc-20160816;
        b=KqntzJZH2KZ3hVEiGk3h/dVmp0cCG5JXlRK8K+GgHFQ+F43cXrLJr5+eBa3pkL8qhm
         m7EmzYwUr7JLso+my30i9QkhVG/VVjB0iJPtfwt3FAqjYLn+gbM2vWpiMqMIpF2T8x8a
         K6ht9wXW/9qSz7Xm7jc9UU3WjVvd40HoHPFEAYkJf3ChCqVpr3/Vi90RQSlxN3No231H
         QmoCG4ZPJiEaHPwXvvr2Q+k0JskDRp0cRQSQsiK9xiByU6FxnD/0ljpwnidZHLwiOJmt
         oItgib1YwKLzKOEW5sFCp7NFQXeOKwcVg0Ty1QF9dkhXT9DO+68c0h4MsN+LgK5wxTni
         uW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4vYBQ4QOoLJ0tWi1pnrplMJpUmOVbtMFmv0oacXtacU=;
        b=O+X0NUcl0fcEy6/YcW/wcJbtR+oJ/NHMHPqRspDpXNUMEBeVcp2BUtYJXQfW32J9jS
         +Dpo4AH6wDkCYjH/k71/Wniklb4y9Txtz+DTbjy0tZVqc5FGYGPWzOmpFdjfDVNbNWIa
         CRjwl0wx1u6LBMWAX7BqhAKGtuFqtQebh5/qBAXsD+FkKLjwbLQflyiktprsAwrZab99
         hgREiW9hNmWdotpXO/A33d1LKIcV09c6TkB0/NOWNY8/bgsfK3tKeN7i9H0fsRhSgI+F
         gfUb8dl98qz9eFSUX9hVJT6MZNTi27e63U7v/BzEVyn+u9/+EsBHu5yT63UKI5IB3Opz
         ENhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=glwBomo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s138si2408561ybs.285.2020.06.09.05.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 05:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=glwBomo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jidZF-0001GL-3p
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 08:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jidSj-0000Io-5M; Tue, 09 Jun 2020 08:34:41 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jidSY-000749-To; Tue, 09 Jun 2020 08:34:40 -0400
Received: by mail-wr1-x443.google.com with SMTP id x6so21053052wrm.13;
 Tue, 09 Jun 2020 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4vYBQ4QOoLJ0tWi1pnrplMJpUmOVbtMFmv0oacXtacU=;
 b=glwBomo4hogbRJTESikWKaZdE/9Pss6V+ntW5JGrUihb260OeBiLq8tPVaV7WCekSt
 qJYzKm9g6IZYFpAVQ57Yt0l4YCkjNDPzEIHXUTk3nV7RJI6sU45PhRlQE/5S2FmzsITI
 ITX29OFSgmdU+AYbph7uefhB0rUzvjwhArze8O2ghbKvSNEpgGzBzoOVfGuVi1GYcdun
 ytjEtuW3NhjFJXdHSYNCqvSjQ4Km/BjQjWqVg6mTJvHNuAEr4NGZkdUVgj6jxH9TgP9B
 Uv6rtOitxzTEh/0P0HuSb9jpLD+OPzy114hpavzL5n2CZApowRMgWFKdfU7fwpGuDpXC
 P3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4vYBQ4QOoLJ0tWi1pnrplMJpUmOVbtMFmv0oacXtacU=;
 b=IXT5Q3CBvxB5tDikBNYIMdtKSgHBKqm9WgZKU7Gj0Jno+QI/2itDqne2kfn2cuTgMu
 9oSur6fENSdiuKqAUhJlMLd679tBtMtPHPU4kDavHBL7r7Ig1SdfEsz0h1wEuapyDuNA
 JHx32Vu4L32rYqsiYC+jqztQ2umuljTk75HsCE+EaZAwxJQiaSaEsMl9WWgFP+11UslH
 O3EVRNdikvGzwZxSHYVWxAfVyttsiFQe8CWcBkWPIgPdjwDB/hMDYsiKlzGSiJui+pWM
 u3evlrIAaTPPX7qCXyfrrqNibt/wAKj5gBBwsyy6P5hZ9Oh1htIt4mBvfVoy7ENnNSqi
 YECA==
X-Gm-Message-State: AOAM53052FzSjb8lU8JL+98RoIx8JL71wc1swFh93lOrFf9ZPv15j6Sm
 /r+EaiPrE5xlfwX2divWPLOVPldx
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4021066wrc.85.1591706066909;
 Tue, 09 Jun 2020 05:34:26 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c81sm2920931wmd.42.2020.06.09.05.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 05:34:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] hw/misc: Add LED device
Date: Tue,  9 Jun 2020 14:34:20 +0200
Message-Id: <20200609123425.6921-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ORgv3hQjvqq

Hello,

These patches are part of the GSoC unselected 'QEMU visualizer'
project.  As the AVR port is not merged, I switched to microbit
to keep working on it.

This series presents a proof of concept of LED device that can
be easily connected to a GPIO.
The LED emit QMP events, so an external visualizer can display
the LED events.

If there is no negative opinion on this series, next step will
be add Zephyr test for the microbit, then we'll work on LED
array/matrix.

Regards,

Phil.

Philippe Mathieu-Daudé (5):
  hw/misc: Add a LED device
  hw/misc/led: Add LED_STATUS_CHANGED QAPI event
  hw/misc/led: Add create_led_by_gpio_id() helper
  hw/arm/microbit: Add a fake LED to use as proof-of-concept with Zephyr
  hw/arm/tosa: Use LED device for the Bluetooth led

 qapi/led.json         |  47 ++++++++++++++++++
 qapi/qapi-schema.json |   1 +
 include/hw/misc/led.h |  44 +++++++++++++++++
 hw/arm/microbit.c     |   3 ++
 hw/arm/tosa.c         |   7 ++-
 hw/misc/led.c         | 108 ++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS           |   7 +++
 hw/arm/Kconfig        |   2 +
 hw/misc/Kconfig       |   3 ++
 hw/misc/Makefile.objs |   1 +
 hw/misc/trace-events  |   3 ++
 qapi/Makefile.objs    |   2 +-
 12 files changed, 223 insertions(+), 5 deletions(-)
 create mode 100644 qapi/led.json
 create mode 100644 include/hw/misc/led.h
 create mode 100644 hw/misc/led.c

-- 
2.21.3


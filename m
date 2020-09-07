Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3882967lfc;
        Mon, 7 Sep 2020 09:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN1tUnJErBuY6pG3EIGPG+f3X7TeBay9wZhFJV2obFtYtFJetp0wiL8zquXmjatN36mnSo
X-Received: by 2002:aed:3145:: with SMTP id 63mr21854365qtg.29.1599496424104;
        Mon, 07 Sep 2020 09:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599496424; cv=none;
        d=google.com; s=arc-20160816;
        b=zI9a0NU0jU2z2hkpUM+K4rKTIySO/IV7Ks+14bUX9OyYpxZAwa/yOHve6FKSJ3AmsL
         OstMOWoj3EHKiAHKOaDBVydQlb8qOAZlwDEPw+N0HZkN8grTWrgkRUfTkyB+hmwkOhs8
         213iiQTn+bs0ngyyKmausa2HW7s4LE2cPLoab12CFN6qAhJFBSG6kPjWNXL8D40GipLZ
         r7Rwe8xxsDdqX/U9YOltLCkwsJnTVVSxSGIH1avGmAjgF60wrwpFVGF6JegYAmXLxSat
         inPSInInYiyYrY54lKC5xl7jcG1F4ZRN1X9Uxd7Ut2Uo7SYPF8pwtAKHK/QTiCv8dRWT
         kWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=cSRX0IrVQUHVu+1/H+Z6t5teq8mgHDxT64C3+9vqyLE=;
        b=j+ljEzRmuPRhlzlvZwVFj/susZgOg+BKCjdZBTjFGeOPKStMg0T59n7B91Ys4Fqfl4
         hurRLMMklgl4jxlF7Lc1cu1tBwTm14B2AXr72T+Cs65uA/nlHzVoOEae85JAIImh3a5T
         IKbD7m7ev64km9WaWVGGj7Z+yrv1esMafp7Aps1CXWcO2D/mEI2qJfG8Hg0pohQG6+Sd
         59pQY9hnLpXS8Gr5avBsL9T3wBdKECbSrbwCm1urzXuntBqpw2OZl28OCkg9HWPHveFo
         sr8TKvkMMyfaJoG5d7EhY+vduOz359CDCA4DKTCDUV4QAt/Jn+D3GYTeH3YILflDu0cc
         3Ixw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RpaYLmoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si10079991qtk.126.2020.09.07.09.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 09:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RpaYLmoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFK5P-0000Sd-9w
	for alex.bennee@linaro.org; Mon, 07 Sep 2020 12:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFK4l-0007y4-LZ; Mon, 07 Sep 2020 12:33:03 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFK4j-0007bY-Tl; Mon, 07 Sep 2020 12:33:03 -0400
Received: by mail-ej1-x643.google.com with SMTP id z22so18908823ejl.7;
 Mon, 07 Sep 2020 09:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cSRX0IrVQUHVu+1/H+Z6t5teq8mgHDxT64C3+9vqyLE=;
 b=RpaYLmoNznAp+lxRWu+ntyAk5Wz0XvsfqzF0Z+YySAnvw6zxNv6bbUJQ3fWU/EqRS+
 NsprNsFxk/pyqX4gE+SW+OCiud606SE4WAwJIsL9SwVih7DIQXLvxwmuPE4pErIJ4dWR
 tjaKhiZqPn/hilQ9bAPote0+gZ70nxc6e36IiDknWJSMUND4IfiD04ghdd6TE2TKuRjn
 i3ZPcF1dXtPjZaCX1r3JU3Wa18nCKFk6TeNkjK0pCGJCpoJfyXQCWDR6F7zwwHroJo3I
 bXsBUAQa3FJa+xckl6FZhElhJ/eSoEpFLfZ7GvWjOQamagA9TlOYe14tVoTrqS65Za6e
 0F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cSRX0IrVQUHVu+1/H+Z6t5teq8mgHDxT64C3+9vqyLE=;
 b=YvbJTrUWigqS0Oyd5k3XSXuA8GW/3EvYN1eh6/dtS8jtpp2Vzza/q4uKOhxCyATEjj
 tG6p6Z88lLvorCJS4SRuc6TausQiwh5UY18aMrQHtw442ZysQXp/Re0t5fAI0SAfiwYK
 XtNY8p2JvE7Ceo5+ksx+id9P6AA4oVjcNj3zyiC49br0IQ3yK1Bzg7EabiG/W54IJ17z
 SUsgatB4QnHp6b1/8EJc4Musyt0kl5QmHz/Joj0OjjqRt0mR5X9/UhCPu6KSoKzT/H3R
 +MIidUw4a6AKullDRuN4kPAau1pkEnlu6ouH+4Y+DC7/S7VovudrxK0hPM7lt9Rzp2GK
 Mwow==
X-Gm-Message-State: AOAM5308OjebDu5ZNCymhIOp7fZMTfhUrfI4+8W36Ab/47gmZdqXhIRx
 HhWj6PoPiBW+0l1uiAHXLfwXEXLkf00=
X-Received: by 2002:a17:906:c1d7:: with SMTP id
 bw23mr12042698ejb.171.1599496379532; 
 Mon, 07 Sep 2020 09:32:59 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u13sm15700199ejn.82.2020.09.07.09.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 09:32:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/8] hw/misc: Add LED device
Date: Mon,  7 Sep 2020 18:32:49 +0200
Message-Id: <20200907163257.46527-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vgeQlm1jHFfZ

Hello,

These patches are part of the GSoC unselected 'QEMU visualizer'
project.

This series introduce a LED device that can be easily connected
to a GPIO output.

Since v3:
- Rebased (TYPE_TOSA_MISC_GPIO)
- Rebased (Meson)
- Addressed Richard's review comments
- Improved doc/comments

Since v2:
- Rebased on PCA9552
- Model intensity to be ready for PWM use (Dave)
- Remove QMP events until we get a UI visualizer (Peter)
- Remove microbit patch (Peter)

Since v1: addressed Eric Blake review comments
- Added QMP rate limit

Next steps planned:

- PoC visualizer...
- look at using a dbus backend (elmarco)
- look at LED array/matrix such 7segments.

Regards,

Phil.

v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg714663.html

Philippe Mathieu-Daudé (8):
  hw/misc/led: Add a LED device
  hw/misc/led: Allow connecting from GPIO output
  hw/misc/led: Emit a trace event when LED intensity has changed
  hw/arm/aspeed: Add the 3 front LEDs drived by the PCA9552 #1
  hw/misc/mps2-fpgaio: Use the LED device
  hw/misc/mps2-scc: Use the LED device
  hw/arm/tosa: Replace fprintf() calls by LED devices
  hw/arm/tosa: Make TYPE_TOSA_MISC_GPIO a plain QDev

 include/hw/misc/led.h         |  92 +++++++++++++++++++
 include/hw/misc/mps2-fpgaio.h |   2 +
 include/hw/misc/mps2-scc.h    |   2 +
 include/hw/qdev-core.h        |   8 ++
 hw/arm/aspeed.c               |  20 +++++
 hw/arm/tosa.c                 |  53 +++++------
 hw/misc/led.c                 | 161 ++++++++++++++++++++++++++++++++++
 hw/misc/mps2-fpgaio.c         |  19 ++--
 hw/misc/mps2-scc.c            |  25 +++---
 MAINTAINERS                   |   6 ++
 hw/arm/Kconfig                |   2 +
 hw/misc/Kconfig               |   5 ++
 hw/misc/meson.build           |   1 +
 hw/misc/trace-events          |   6 +-
 14 files changed, 354 insertions(+), 48 deletions(-)
 create mode 100644 include/hw/misc/led.h
 create mode 100644 hw/misc/led.c

-- 
2.26.2


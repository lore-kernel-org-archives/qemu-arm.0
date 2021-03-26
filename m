Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp887811lfg;
        Thu, 25 Mar 2021 17:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk/ty2weKQHwmlq5APO2OVlunVMo4E8HCrfHm4hfQ+cy8I37om5B0m4FSh2L13C1JW7QaX
X-Received: by 2002:a92:c611:: with SMTP id p17mr8380584ilm.54.1616718555160;
        Thu, 25 Mar 2021 17:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616718555; cv=none;
        d=google.com; s=arc-20160816;
        b=a1fnOyzTjZd+E3vx88H9B4dtviJlG4hosLukjGRwAo1YUM+6WR0buCqWdPse4fqZSa
         JzIrrwWMBq+1OCrlm4VbfEchu3E8AmTh8O5l/ZPb8Jp970bFyrPVYW0mG+vJz4AOJJfn
         DZoRO40zyQBHDVb/gEdoTjmvvd9dkCGxJZYUVfndhUiMk5S17yGUvUCFB4yUDpttaJHU
         Ra5FSBwmXqg8LwI4yLVYfUw54ig1pfgxl6lQpOTV9IVj4ulGPPsSDCR0p1rDjd22+f4v
         gO6t+kzB5S6nOGzNDgL5j4DxebDQxJl4RbIVrbuHb6M3b0w5WCaa2hgd6t3CT+If+kJa
         2NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Knkj/RyLO7CUAQgShHIIeHkGAEGdZR261rELTSjtX1g=;
        b=G67EFg8XUSSnMMMK1b/QoX6TgWhzl09ebmyAR/zOJYFOgsuY40rk5UD9gD7XwZFTMp
         A6+naB+D7BaEgwL63/FDXVtISpE55SsYkcxgpcb0lu8CGe4/lmFqIIprTnVT+K9AJtfG
         kYs7/TKqkRoF3dOJkxbMQLmhu0vxq9UX0lxuJ5o4pP+6CzrjZRaAAPhM3swxdfEX+X3h
         PmNtA1CUwKyRJRxiWmWRWaXhemHJ6CX680HrDnGc98oa6fLM2xsc5jUc1E5q9JECendz
         Xdttq8aeun9qDk+7r+xk83p8W/fNh/VkGBjn0OIpY+L+l0lDcARAjIVE8KJvMVxkzkwD
         qd1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M0C5w70L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si6161174jad.52.2021.03.25.17.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 17:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M0C5w70L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPaLi-0003RN-FZ
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 20:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaK9-0002Od-Kz; Thu, 25 Mar 2021 20:27:39 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPaK6-00040W-UY; Thu, 25 Mar 2021 20:27:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id x13so4003209wrs.9;
 Thu, 25 Mar 2021 17:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Knkj/RyLO7CUAQgShHIIeHkGAEGdZR261rELTSjtX1g=;
 b=M0C5w70LzoqLP3EN49v2Z/5T6KW0ekLgqMX4HIPf9YCZge21B15FEbSeXVRifhguEY
 IxzkbVSt7NMHabFcWDkHKsqVY9aVuXe9Y/tdt1dhocqMGQn0jnITXhzXhMY/TQroulF1
 Y7jxDskMZiclWofhJ3UuZYwJUYRrWLlEx8x9N0nxw1QuPVUGryBXkENNLJIuzxSh30ya
 0ZZmv6WLkqvH3dL4JB+aAkgehei83ydGVbWTbPN1gZ/71h9FCGMAiti5TuPZOBFz83To
 tJlmdRqQrzEm2+u4ZZU0uP/w+7h1TuD/+UVWO7RglvnpGQHLLErHxlYFF/ztIfiioS1F
 xpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Knkj/RyLO7CUAQgShHIIeHkGAEGdZR261rELTSjtX1g=;
 b=CgS1THj+AYARk+BuecsG1UbUz2yIhvxoXkHUbv1hYP1+WjD/AlE/9vqSgXDlW2yxTW
 l8uARP0itPR3Gg4lFhHUWTOizc8wjEpW4QGVRjwk1Fh2/Emt9E8e4y9mWJYFslywquTS
 /dXtmgrq1eLDjlV5PUPJZR6Q7g4NkGQslG052tZ9jaQS3MNUXqnm0qmrpwchVEc7yprx
 IG/hxR2DWv9bknjsMC2XWXi8aOXB/2sOqRMr5ARuxzzeufsKGnvLjIEDN2IdDUIpUTKx
 JByt2WFok/a04NIxzKPB+EnpzPHTOffSjJP3G2T83La+0d2TmQ8ohe0ydCOagxGyZUyr
 WJBg==
X-Gm-Message-State: AOAM530X06Hx2MaA4wc+iy9g2o4PCRfAKmz4HtZDrP9sC3CcT2Fpx1qN
 XZ+NPpqCbD1yNwq/J1kKHMuumPu+zYLbmQ==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr11724322wrs.94.1616718451585; 
 Thu, 25 Mar 2021 17:27:31 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x6sm8376233wmj.32.2021.03.25.17.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:27:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 00/10] hw/misc: Add
 memory_region_add_subregion_aliased() helper
Date: Fri, 26 Mar 2021 01:27:18 +0100
Message-Id: <20210326002728.1069834-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fLyCDa3ChAxF

Hi,=0D
=0D
This series introduce the memory_region_add_subregion_aliased()=0D
helper which basically create a device which maps a subregion=0D
multiple times.=0D
=0D
Examples are easier, so having a subregion aliased every @span_size=0D
then mapped onto a container at an offset, you get something like:=0D
=0D
          ^-----------^=0D
          |           |=0D
          |           |=0D
          | +-------+ |                 +---------+          <--+=0D
          |           |                 +---------+             |=0D
          |           |                 |         |             |=0D
          |           |   +-----------> | alias#3 |             |=0D
          |           |   |             |         |             |=0D
          |           |   |             +---------+             |=0D
          |           |   |             +---------+             |=0D
          |           |   |             |         |             |=0D
          |           |   |   +-------> | alias#2 |             |=0D
          |           |   |   |         |         |             |region=0D
          | container |   |   |         +---------+             | size=0D
          |           |   |   |         +---------+             |=0D
          |           |   |   |         |         |             |=0D
          |           |   |   |  +----> | alias#1 |             |=0D
          |           |   |   |  |      |         |             |=0D
          |           |   |   |  |      +---------+  <--+       |=0D
          |           | +-+---+--+--+   +---------+     |       |=0D
          |           | |           |   |         |     |span   |=0D
          |           | | subregion +-> | alias#0 |     |size   |=0D
   offset |           | |           |   |         |     |       |=0D
   +----> | +-------+ | +-----------+   +---------+  <--+    <--+=0D
   |      |           |=0D
   |      |           |=0D
   |      |           |=0D
   |      |           |=0D
   |      |           |=0D
   |      ^-----------^=0D
=0D
I know it need more documentation and tests, but I prefer to send=0D
as draft RFC for early review before spending more time on it.=0D
=0D
Based-on: <20210325120921.858993-1-f4bug@amsat.org>=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg795218.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  hw/misc: Add device to help managing aliased memory regions=0D
  hw/arm/musicpal: Open-code pflash_cfi02_register() call=0D
  hw/arm/musicpal: Map flash using memory_region_add_subregion_aliased()=0D
  hw/arm/digic: Open-code pflash_cfi02_register() call=0D
  hw/arm/digic: Map flash using memory_region_add_subregion_aliased()=0D
  hw/block/pflash_cfi02: Remove pflash_setup_mappings()=0D
  hw/block/pflash_cfi02: Simplify pflash_cfi02_register() prototype=0D
  hw/misc/aliased_region: Simplify aliased I/O regions=0D
  hw/m68k/q800: Add MacIO container=0D
  hw/m68k/q800: Map MacIO using memory_region_add_subregion_aliased()=0D
=0D
 include/hw/block/flash.h         |   1 -=0D
 include/hw/misc/aliased_region.h |  91 +++++++++++++++=0D
 hw/arm/digic_boards.c            |  28 ++++-=0D
 hw/arm/musicpal.c                |  29 ++++-=0D
 hw/arm/xilinx_zynq.c             |   2 +-=0D
 hw/block/pflash_cfi02.c          |  36 +-----=0D
 hw/lm32/lm32_boards.c            |   4 +-=0D
 hw/m68k/q800.c                   |  61 +++++-----=0D
 hw/misc/aliased_region.c         | 185 +++++++++++++++++++++++++++++++=0D
 hw/ppc/ppc405_boards.c           |   6 +-=0D
 hw/sh4/r2d.c                     |   2 +-=0D
 MAINTAINERS                      |   6 +=0D
 hw/arm/Kconfig                   |   2 +=0D
 hw/m68k/Kconfig                  |   1 +=0D
 hw/misc/Kconfig                  |   3 +=0D
 hw/misc/meson.build              |   1 +=0D
 16 files changed, 375 insertions(+), 83 deletions(-)=0D
 create mode 100644 include/hw/misc/aliased_region.h=0D
 create mode 100644 hw/misc/aliased_region.c=0D
=0D
-- =0D
2.26.2=0D
=0D

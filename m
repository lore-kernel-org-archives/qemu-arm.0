Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp733059lff;
        Wed, 16 Jun 2021 14:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQMbH/clSpul1E6a42XWKDHOEL1nbhANC5JOfSzRrB3Uvu8R6ccFmje9CIcCTlMoxy+5ip
X-Received: by 2002:a67:efd2:: with SMTP id s18mr1731973vsp.20.1623879801023;
        Wed, 16 Jun 2021 14:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623879801; cv=none;
        d=google.com; s=arc-20160816;
        b=N2dAXjapbb7Cwo1MYTqQAQ+0RqhYlnjE6EZBBMPPzYkHPgvntRvqEqZdyak2kGJOny
         IaWPFFYWLHUsGGK09pzWh8Wy8mYwk9Zx2NdG2DFf4mtq5HSgsG4b1Thw0wipKsmstsGM
         CPHlgrmxi3igHPQUFO3ZMV8Z81tJkqVvAJIQ7MhOlf3X69FASSHa2ax8c9nOdBYl8ILy
         Js7hCQCSS7SlX2Yac2qo2V+fb4A/j8DmzrEnbi5KX07n74pH0h+63nwTaVdqLx2QV6ix
         M8/g1BEsEtG45XA9L8d65SI5j/6LfFFGNmwwOEpD7fmg4UkA7ucM8d1UFaphyZq82lIB
         6mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Ip/zcUYPJ8iUD8BSFX5rVZ45yqs1C85tuOa7rdKRn1E=;
        b=gnh3pMPNs7OqmelqA6GnqmVdgpcrWxLAqteU3Y/JcWmMzYfjX8XKdzAU3zAptzVqyF
         4I55jucXDXfgoWracMshnk6p9nar3R/R9Uori+jjTZiu2A6cUu0t4I4edWVzx1UxCtLl
         1hzaQr7jeEL5HpToPf5IpEMYK7oGcjHYnfdTG4HkcHyUy8rgzOC/ZaqZ0BTd6m9CeTV7
         mhdf3nNc9gerE1Cam2dD/KEoFgpmoMw6XC7+8uDH8eBg+hYZtbOmhD1f36cNtBETMCGl
         /489A6pAozgiBDAr16YTTMJ4lxBBGrVPZf4qhI7/If+50+eIhEIJU51Zn+Jrfcx9RbYl
         yHxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o4RYS1KT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si2856197vsk.260.2021.06.16.14.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 14:43:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o4RYS1KT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltdJg-0008Sv-9D
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 17:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJN-0008Or-QZ; Wed, 16 Jun 2021 17:43:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJL-000658-Rf; Wed, 16 Jun 2021 17:43:01 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c18-20020a05600c0ad2b02901cee262e45fso2446952wmr.4; 
 Wed, 16 Jun 2021 14:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ip/zcUYPJ8iUD8BSFX5rVZ45yqs1C85tuOa7rdKRn1E=;
 b=o4RYS1KTMqQ7wUK1RGeVRHw4Cs/VbdJpAvNGi0VtrHahghtMfHJXuayG1p6AbO4DOL
 2dRYv/e/SHQC+MViFvsIbnJrrKxu5tcrcaWErXu2QjIlhHPqgm4YQOkuT54eO5sS9zRI
 cnmw5x8p17+1xDTtC9qwRHTx7JuO43kTS5SqRkaR2QWJnvHAMudgjWcPvPdnKjYcGUB+
 nLWgbEm8zuigcOgnz1IAosqi2DfsuYx9KazvTHFFQfrPW63D8t7gm8B3aeLKzVY0bn67
 EwkKKmWFlxyhmSrHgNtCnSsrvWBNRAT1b12T6LsXvhregCN2AMTpli8y1JnRcNnjKqtR
 NlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Ip/zcUYPJ8iUD8BSFX5rVZ45yqs1C85tuOa7rdKRn1E=;
 b=CoQJIWE/KBoCvQUWQT8SG7OKeGz2HYTVpnP/HtLz0re4STLNs10JuyVaRfy+dd0ALJ
 p4zV7o/waM/rgpQjuiRvYwkd8kAKH6MCN0D5iR4npK1eRalaf2CH+szKJA7rR9+ugz4E
 C5biH2NnRHDSxtlwqM7HWKHvz2IxfI3KZQhldOPyuaDmkpeFgbN03XVwVXxnm+yVjNvK
 FcVW6yoGXSjMfxDkBMuGcA9WW1v5HFRkvUF9SX0Fk2/2u5iV/4Wjilo30uO76IbikIAE
 0Kd6YXRoy5SuPNWyasvQSGayuteomHzjPqQxkKdBQbvgk7NFAG5OvLBL//FMyEeXeXNg
 8RnA==
X-Gm-Message-State: AOAM531yDhG+3rBm+0v5vgM9m9WTEwo7Wkl+eopvWYgpsBFru4+mOs2C
 /WQFjBPVXxe4STriSZfeDz07X77qS1BwXg==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr1132100wml.168.1623879776988; 
 Wed, 16 Jun 2021 14:42:56 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u7sm4163938wrt.18.2021.06.16.14.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:42:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/15] hw/i2c: Remove confusing i2c_send_recv() API
Date: Wed, 16 Jun 2021 23:42:39 +0200
Message-Id: <20210616214254.2647796-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bhLvkSRZpSg

This is a respin of Zoltan's patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html=0D
=0D
Patches 1-13 reviewed (could be queued)=0D
Missing review: 14-15 (but optionals)=0D
=0D
Since v3:=0D
- addressed minor review comments from Richard/Corey=0D
- added R-b/A-b tags=0D
- implemented Richard suggestion (last 2 patches, 14 & 15)=0D
=0D
Since v2, tried to address Corey's review comments resulting=0D
in a i2c_send_recv() removal and code easier to review (to my=0D
taste at least).=0D
=0D
BALATON Zoltan (1):=0D
  hw/i2c: Make i2c_start_transfer() direction argument a boolean=0D
=0D
Philippe Mathieu-Daud=C3=A9 (14):=0D
  hw/input/lm832x: Move lm832x_key_event() declaration to "lm832x.h"=0D
  hw/input/lm832x: Define TYPE_LM8323 in public header=0D
  hw/display/sm501: Simplify sm501_i2c_write() logic=0D
  hw/display/sm501: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/i2c/ppc4xx_i2c: Add reference to datasheet=0D
  hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/misc/auxbus: Fix MOT/classic I2C mode=0D
  hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT cases=0D
  hw/misc/auxbus: Replace 'is_write' boolean by its value=0D
  hw/misc/auxbus: Replace i2c_send_recv() by i2c_recv() & i2c_send()=0D
  hw/i2c: Remove confusing i2c_send_recv()=0D
  hw/i2c: Rename i2c_set_slave_address() -> i2c_slave_set_address()=0D
  hw/i2c: Extract i2c_do_start_transfer() from i2c_start_transfer()=0D
  hw/i2c: Introduce i2c_start_recv() and i2c_start_send()=0D
=0D
 include/hw/i2c/i2c.h      | 46 +++++++++++++++++++++---=0D
 include/hw/input/lm832x.h | 28 +++++++++++++++=0D
 hw/arm/nseries.c          |  3 +-=0D
 hw/arm/pxa2xx.c           |  2 +-=0D
 hw/arm/spitz.c            |  4 +--=0D
 hw/display/ati.c          |  2 +-=0D
 hw/display/sm501.c        | 16 +++++----=0D
 hw/display/xlnx_dp.c      |  2 +-=0D
 hw/i2c/core.c             | 76 ++++++++++++++++++++++-----------------=0D
 hw/i2c/imx_i2c.c          |  2 +-=0D
 hw/i2c/pm_smbus.c         |  4 +--=0D
 hw/i2c/ppc4xx_i2c.c       | 15 +++++---=0D
 hw/i2c/smbus_master.c     | 22 ++++++------=0D
 hw/input/lm832x.c         |  2 +-=0D
 hw/misc/auxbus.c          | 70 ++++++++++++++++++++++++++----------=0D
 MAINTAINERS               |  1 +=0D
 16 files changed, 207 insertions(+), 88 deletions(-)=0D
 create mode 100644 include/hw/input/lm832x.h=0D
=0D
-- =0D
2.31.1=0D
=0D

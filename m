Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2573038lfo;
        Sun, 31 Jan 2021 02:59:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm3T+a80c9yJNDIHxYjx7xbzCX4yRGmT2+T0i4fA88PGVnZlMUHbDjPUZP9ZfnBKZJ7x6Q
X-Received: by 2002:a25:c285:: with SMTP id s127mr14058535ybf.383.1612090783480;
        Sun, 31 Jan 2021 02:59:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612090783; cv=none;
        d=google.com; s=arc-20160816;
        b=iZtZag1BsUsCVUBLhwVC627cbWSeIpmM+4nThuWvphX9wgFaRcWKsjxjm2V1bCKdKY
         KgyfnkG+73LMXM+kR1+/p5eOrwn4gFFblhk7kla458arRQV6UNXjegkRaspU1VTAqNpq
         r3hG56c5Go7pLQLvmxhl3an+/5YazhTCushM4T57SZYuyWsZDpZy6HlFuZ8LMhYVfNMa
         RmO0AphnPQvISfre8C9U7CLeKFa1FWz2FN/4bg2BiMkEQzvIQwe9jOHZVGvkIfZJeWv9
         noWsHYJhF+cEim9mLsYtjajbefGtlUn1CsyFCqni2UJ0LsQJ0DQSnXPcCYW/vlVatSNQ
         04fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xn8k8+mGs9XJdl/4elQ+sUFuX+oW3atWPyLWH373rMI=;
        b=QGS36B9RA+WCzWqe/oeAJtxqvWgtX3zOMMdI81cfZmPGbMLdiLbGXvxotfBaq5E4Il
         vkzlSBWYRnBWtepwA1lamkgk4GnxIS92FvBLo5PrAo5GIke2ovkV9Nwpd8cJ/2RwM4k1
         FY8ODu6GDpoN7NixEt3tsxiSDQt1vTRRnyt8KZ3dOMXn/QSYPtkN+GkAtfz7Pe+f+t0p
         2ijfAeamW52qf8btAvrpiCgHxV3t6PPGBl6cmqXKbRhK9WNXntWihxj583CZzmBqDMky
         wAHJYE+S5lLtnsPttx3GBFh8OQ9S+HfAhiA5mWeXcRgGlCC6IqF+8UOinjbi4nuu8woN
         e+Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nM060cCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m82si7095505ybc.198.2021.01.31.02.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 02:59:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nM060cCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6ASE-0006lN-RT
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 05:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ARx-0006l7-Ch; Sun, 31 Jan 2021 05:59:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ARv-0000Eu-V5; Sun, 31 Jan 2021 05:59:25 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so13448794wrx.4;
 Sun, 31 Jan 2021 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xn8k8+mGs9XJdl/4elQ+sUFuX+oW3atWPyLWH373rMI=;
 b=nM060cCkw60FS6adkEsjm3lKDTGFfz4+RKlgj/ylpZaonfEWY6Rx609zraCwzwwK2T
 HPfrpMeqWr1Y1QLap7GTh8BAIlRHkseHhnHKFhhdn+mxzlurw/2vcvffpjmkI4YKdHg9
 WDS5TowWSebiPHdNexjEe1MhyoHGGEXPerputJ66f41AVkjTxHf6bibcXazKmKIqffnV
 ZxAZUF1ueXNKH2yp63MxG66kQwC/IpyV+ZjU5Lu4Kifqx5m7Sc57xnWpiz4Lw3LUL43j
 g88H8nzO35YxiMxmei7y1Awlmy7h1jjyRi8EN6BtDoT+cTYwBnUVxjAWC2z0/Z907qcA
 rljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xn8k8+mGs9XJdl/4elQ+sUFuX+oW3atWPyLWH373rMI=;
 b=oR2vsDrQ8M9uV8OkDMJyI5bxXyxqPX4HJUmvABZ4omGOpxgNjissMKeElg22jY6vra
 nwa9DYdpd1R2Crc5z0xVNS8pau6mAjOXvg+Xpg7jQ2v9XzDtthrgQWFWOYwKl+RB3ro7
 X8REgIlrameBJgZNlX/7rAzLwcPloh3aUPN0bVxiXBllcxAfC/sW4gHOAUk5KatNGlSm
 UUaXm1Hrly58z6tcWHUQJiu7J1qcOF69n8HgSV0k+Wvk2h5C5/oAQ61Qz870K0N5E/fc
 w3LmBkJhlDdfE/2vTN2VqzD62M2ovGVCYSS08y+X7dWES0Ta4TczweevLdbs4lrm7SsJ
 tBiQ==
X-Gm-Message-State: AOAM532PC5a3Oi+6Wig2q+xhIX4K1zylB7S64uY/6/hCokVrOrrdFgDG
 i91Q81dnjzsxRzFdyp65enXe5WL78i8=
X-Received: by 2002:a5d:68c6:: with SMTP id p6mr13163198wrw.332.1612090761631; 
 Sun, 31 Jan 2021 02:59:21 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id v25sm18141225wmh.4.2021.01.31.02.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] hw/arm: Misc trivial fixes/cleanups
Date: Sun, 31 Jan 2021 11:59:11 +0100
Message-Id: <20210131105918.228787-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYBxZBHuuE31

Trivial bugfixes and cleanup patches noticed while rebasing=0D
my "Support disabling TCG on ARM (part 2)" series.=0D
=0D
Since v1:=0D
- added patches to remove 64-bit specific features on 32-bit build.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ=0D
  hw/arm/exynos4210: Add missing dependency on OR_IRQ=0D
  hw/arm/xlnx-versal: Versal SoC requires ZDMA=0D
  hw/arm/virt: Do not include 64-bit CPUs in 32-bit build=0D
  hw/arm/sbsa-ref: Restrict SBSA-ref board to 64-bit build=0D
  hw/arm/xlnx-zcu102: Restrict ZynqMP ZCU102 board to 64-bit build=0D
  hw/arm: Display CPU type in machine description=0D
=0D
 hw/arm/digic_boards.c  | 2 +-=0D
 hw/arm/microbit.c      | 2 +-=0D
 hw/arm/netduino2.c     | 2 +-=0D
 hw/arm/netduinoplus2.c | 2 +-=0D
 hw/arm/orangepi.c      | 2 +-=0D
 hw/arm/stellaris.c     | 4 ++--=0D
 hw/arm/virt.c          | 2 ++=0D
 hw/arm/Kconfig         | 4 ++++=0D
 hw/arm/meson.build     | 4 ++--=0D
 hw/dma/Kconfig         | 3 +++=0D
 hw/dma/meson.build     | 2 +-=0D
 11 files changed, 19 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

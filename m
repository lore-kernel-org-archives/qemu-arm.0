Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1467073lfc;
        Thu, 12 Mar 2020 18:46:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsKh7uc6oJnsboSHbGV5T6OWadZoAqUxlW0CHrdNL+bGv3u7TXybr2LFgId4FzO0HgGkdRh
X-Received: by 2002:ac8:2648:: with SMTP id v8mr10392656qtv.65.1584063988600;
        Thu, 12 Mar 2020 18:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584063988; cv=none;
        d=google.com; s=arc-20160816;
        b=gD40uF+rBzlELKcQTtfUdMGvJipNELWppZcEX9XTQp4JNs9rfsbdTl1BAn1dcdbtGD
         eoVXZ2KpphEPHJ6fUjfzPDZ/S0XoO6HyD6n274YKSqfdzd3JfTxe3wgRITmXpX8lsIrp
         nrtVm3LgqIC/Kd1xfSYWdIgsHhtA+GBsAWUHCMkHakt5kbo6f4WUjxfNHjlvjRPyQI/d
         C0KjjHOT2JvFcKOrZ6Y4r6tIXcMZvQ8ADPHyqKBYANuU7cxHiFlZANqQn9AZkgAEn8/X
         j9WnBj8MV9pAwgbPGeY+TZ8SCw9xSUKUJ+bT6G6SjuSMUR74Sg/X1d+VI+p/RLl8jDNo
         aozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=3nP+DcWKLTYYKct2ubngpCtOm7Ri8oAKLhdkhHkT/ig=;
        b=lpthQIiFm/5n07lk8+2dAXT6yg88QQ86EiqFzNRjXNAiDmAXmmtm99OgEHRLqRhtIw
         JbCOnh/zF2E1DHOXXf3fdvzh/fiZ7r75rxFYLbztUY1md9IfFGcuwgHbXywd6U/Qb/wr
         5yKO6RWmdszsdP7UFbI85/ixZqI3wg6bBLXtopTrkBOhVRPByi6mq/B4wI36HlPQ3FCB
         tzla/Jpx5eT9BoUeuD0KpPyMhXI/DY33yXws8p46eE+9x4M1UwpEXJqqevVHhrLq554H
         YOOJnZKwI89ZJVVLZRdP4UIlfmYwwDk6EWtsrcZeWJ5qWeKFmMHQgARYsIDgvLgFgN4p
         k52Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rLGgjIke;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si3814151qkl.68.2020.03.12.18.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 18:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rLGgjIke;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCZPA-0001Ht-0H
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 21:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCZOg-0001EB-F1
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:45:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCZOe-0005xs-Fi
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 21:45:58 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43740)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCZOe-0005wf-AX; Thu, 12 Mar 2020 21:45:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id u12so4007295pgb.10;
 Thu, 12 Mar 2020 18:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=3nP+DcWKLTYYKct2ubngpCtOm7Ri8oAKLhdkhHkT/ig=;
 b=rLGgjIkegX5yV1VDD79JbMlyf4SDYnGnD8z5g0DjCwoUKxCCnwYkwG+7gzascm6Z6G
 lH7q9hcU62/ngF1mCiGrs1rOOuH0husYFzleirp5nqWeGCr+gPlKX9I0H7flcF4LhnCD
 kvrPzd1WFyAoSg6Y7RTiyS8ueOzMJbUjJ9xjF/UakKlisymc2buTlU8tl8ooT6QxVlOl
 xpjZV6XwP+RtIrZwoWemWTMRvGB6Nx/vHt3lleLUy/ZJpRq8o9KgGSqYp4S5pdUP0xnG
 sRpbpBiddly475ryO05HWNtBoZ7TntOxAl0UJo+TSfssk4IwnLAUrJjU3BCEJyYt8zgf
 iIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=3nP+DcWKLTYYKct2ubngpCtOm7Ri8oAKLhdkhHkT/ig=;
 b=dw4Vk8GkTSwMWSqg9GjKE/T6FuO/OP0w2F3qgXSgCnYyu/OvGDsqPAXLhRRtCAGGYF
 9wxyUG6rXTJlJr0RNE8uun52mpw3Qu/+Jqx4BnBSIlfw8zFDNfI7tlmdQPF9HsnoTCWr
 0yTOC7P6PLYN0k0c4JIpaqm+p/HC4y/jQXHrOoMFDGQWRh9SHKX2GrkcTfuFxrzAlOX/
 wmOOo8TBx48kuQEg1XNxYSzVJpQk3NL1nsvxdw864Lto3pyUAZBxczLM50xL6qdJb9Pc
 1dftLJX9VLi0eVbXzjxYpcoFAxB/im6uAEyE2Rd8/45bzeRTO7ATtmr5B1u9LlR/Vg0k
 4AaA==
X-Gm-Message-State: ANhLgQ0WWfkuk4mbcAtDf6/kc192OoeOsdAL0Y9vv7z4oSBA2zD/cJgv
 +g0v/Lpr0NbgfGJ0X0BixiA=
X-Received: by 2002:a63:ef04:: with SMTP id u4mr10587087pgh.292.1584063955082; 
 Thu, 12 Mar 2020 18:45:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f19sm13741857pgn.42.2020.03.12.18.45.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 18:45:54 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/5] Wire up USB controllers in i.MX6 emulations
Date: Thu, 12 Mar 2020 18:45:46 -0700
Message-Id: <20200313014551.12554-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aAQqn8vCNL27

This patch series wires up the USB controllers on fsl-imx6 and fsl-imx6ul
emulations.

The first patch provides a basic implementation of the USB PHY controller
used in i.MX28 and later chips. Only reset bit handling in the control
register is actually implemented. Basic USB PHY support is needed to make
the USB ports operational in Linux.

The second patch fixes USB and USB PHY interrupt numbers for i.MX6UL.

The third patch instantiates unimplemented pwm and can devices. This patch
is necessary to avoid crashes in Linux when it tries to access those
devices. The crashes are observed when trying to boot Linux v4.21 or later.

The final two patches instantiate the USB controllers for i.mMX6 and
i.MX6UL.

v3:
- Minor cleanup in patch 1/5 (see details in patch)
- Added patch to fix USB and USB PHY interrupt numbers for fsl-imx6ul.
- Added patch to instantiate unimplemented pwm and CAN devices.
- Instantiate USB and USB PHY separately. They are logically different,
  and the number of instances is not always the same.

v2:
- Implement and instantiate basic USB PHY implementation
  instead of emulating a single USB PHY register

----------------------------------------------------------------
Guenter Roeck (5):
      hw/usb: Add basic i.MX USB Phy support
      hw/arm/fsl-imx6ul: Fix USB interrupt numbers
      hw/arm/fsl-imx6ul: Instantiate unimplemented pwm and can devices
      hw/arm/fsl-imx6ul: Wire up USB controllers
      hw/arm/fsl-imx6: Wire up USB controllers

 MAINTAINERS                  |   2 +
 hw/arm/Kconfig               |   1 +
 hw/arm/fsl-imx6.c            |  36 +++++++
 hw/arm/fsl-imx6ul.c          |  49 ++++++++++
 hw/usb/Kconfig               |   5 +
 hw/usb/Makefile.objs         |   2 +
 hw/usb/imx-usb-phy.c         | 225 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx6.h    |   6 ++
 include/hw/arm/fsl-imx6ul.h  |  16 ++-
 include/hw/usb/imx-usb-phy.h |  53 ++++++++++
 10 files changed, 392 insertions(+), 3 deletions(-)
 create mode 100644 hw/usb/imx-usb-phy.c
 create mode 100644 include/hw/usb/imx-usb-phy.h

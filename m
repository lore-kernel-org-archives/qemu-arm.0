Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4948226ejb;
        Fri, 30 Dec 2022 06:58:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuUB1q76bQghHWPMYi4IuAMh38FordL1+Omkws8CsN4QU1x0ifwQiLD6kwtCaE589nzZcjF
X-Received: by 2002:a05:6214:3284:b0:4c7:7b1d:dff1 with SMTP id mu4-20020a056214328400b004c77b1ddff1mr40602181qvb.21.1672412288110;
        Fri, 30 Dec 2022 06:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672412288; cv=none;
        d=google.com; s=arc-20160816;
        b=dhp9QA9UWP7v+x2z09VGU6FkhjOkOaMXdXOprsotcT/5dIQgrE9Tt6e6mNBUkBMYJq
         U8EzOjxwbKaBN2kcpW0WpPDoV9JtESb0BGu3qcDvU9wtDEw2e3mjEIC4SUqa5EJM5boC
         lZ4nhxKS/UXo/mGZIjQXg5A0MI+Kh0/6O/wAFTmHslVv/k2slVJHPU6Axu74/WKPESXN
         6ePD7zdO64wizsiBciO48lJyiYEWS6g6wnQ6/cIh+L+cPxP1m4l505JWQOIQKlE3Fyoc
         yabRn0JaVBWGek3p2ERP2I6lvYEXYJabbwoA157kppzjsLTmdMysbZduk0qnINwxkIi1
         UVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pf+h+h7iGxZoZPjaf1usKzjYF166hzRl7jLzm/M5oXU=;
        b=UhAd/FgxrbZMMXaQs7X8bl3Fmerom3jy0PiA2PmZXvs+9A6e6KaloFb2D46mCKrdP9
         lu+Eu6ojVXFp+oPVBKzLljth9fxf1nTj4CFPryslu5j3snh0E7wl6FExxG7PBS+Y7Xyh
         0+Pu6P5TPibi5OYbjKu9yhn+OpS3NrXL+HUAe/WsAakEBkHCgPTmlEMInTA0JSOzxry7
         LbyonIQvJJZhSy/UdbxNrgQ5NrtOEaA4ByYPyJsNKKlfJBwey1Jzfbcg2ka4Obfh69eq
         +Bq6VUGEN4s7yuZUZKjsBuYZ5FnV59+zXeEAd3TL8QXXk82jbiIeRR9nZYuO1dkmUBGD
         SAFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RnSbsfV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020a376511000000b006ff04dcd8fdsi9946635qkb.668.2022.12.30.06.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 06:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RnSbsfV0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBGpV-000053-Sp; Fri, 30 Dec 2022 09:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpU-0008W7-Dn; Fri, 30 Dec 2022 09:57:52 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpS-0000V1-Gf; Fri, 30 Dec 2022 09:57:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E9D7B81C95;
 Fri, 30 Dec 2022 14:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6AC433EF;
 Fri, 30 Dec 2022 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672412259;
 bh=Laep0/9pb7GyjxRQNEjRJl/qxsFB0/AeNLVKIZig9W0=;
 h=From:To:Cc:Subject:Date:From;
 b=RnSbsfV0gW+qcllPC3JiCfrWuDRUQi5fmEcQw4m0jTZ1dz9R8sjZwg3LiQLmOIpwC
 10UZycbpj+Jbmz27AIN+YDST6tU+euXg7YowSA5r9tdaNrZXDPy8JZrsPIu3JOlGta
 AOoxIzm6AhNViM7oohrXkKd5qzcqsl84/7h7agHdWJXn/1GGIAi4kU1fC2tMOH4G7P
 QTEYfm8eIblUor+RunM1uxuJ6qccy9hM2qNp0R/oR6xpVzxLe9rlDuBzG3NpDVBjQU
 WwEjwQj0xa1W4P8WhGQQq3jo4xUtgtkMKnh3d34r3JFIwmYjwkmfEwKAzs9iXNuPvL
 jwRvkbOZ8WHZQ==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2 0/2] hw/arm: Add support for STM32 H405 and fix STM32F405
 memory layout
Date: Fri, 30 Dec 2022 16:57:31 +0200
Message-Id: <20221230145733.200496-1-balbi@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=balbi@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YUc2RHoYZw7w

Hi,

The following patches pass checkpatch.pl and have been tested against
55745005e90a.

Felipe Balbi (2):
  hw/arm/stm32f405: correctly describe the memory layout
  hw/arm: Add Olimex H405

 MAINTAINERS                             |  6 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 docs/system/arm/stm32.rst               |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
 hw/arm/stm32f405_soc.c                  |  8 +++
 include/hw/arm/stm32f405_soc.h          |  5 +-
 8 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/olimex-stm32-h405.c

-- 
2.39.0


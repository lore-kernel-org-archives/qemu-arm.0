Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp624494ejb;
        Wed, 2 Aug 2023 14:09:48 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEju7ZCX3KuYXDnowkx9W9isjhtmnHMdJOGVojZZoOU/8p82D6fM9/MYSFjUFrVQfMZ4V9F
X-Received: by 2002:ae9:de81:0:b0:76c:c1cf:7a35 with SMTP id s123-20020ae9de81000000b0076cc1cf7a35mr6111468qkf.46.1691010588085;
        Wed, 02 Aug 2023 14:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691010588; cv=none;
        d=google.com; s=arc-20160816;
        b=xR2Zqt4ezAUaDP31F/uvvO9pAoUC1R+Zziv3yqvDb2A44ldGIdczfypBKMwPdBjDhr
         oD5IuiFv/3ofPGzxn+JePsVkRtRSmaeV8LYOQDOeiw9BaNAsONwg/QhO4zcP40FD1nya
         6O6koLfNvD+XBBlW9FJqUSbNY+q7lxwIZBtnxdicnwS1R8mEEHblTj4oHJtb7X9x76PK
         Yq5LP2u7vnM/O6MLvI7bxCuC69qedIC6daRQ0U9OHlmjOOD/Fz8sWAs+8N6hDpCL0G1Q
         E5WajGnsgtjSjvUdMuSUaPpJuFLJAW4RLnCSjJ1BX4R5I74YGbFRxex9VVn3JQjCkJ0L
         LT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=x/AvWMW5E7XeOOv8X8+m7CBNy+OZRkG5vN7/mI/K2/8=;
        fh=+WBZG3uX9FXOqUEW7dRrAA3LgeoMrjfTvks8rWRkhTI=;
        b=Mdh2hqCGVYQKCs+nFWK63qYo23EEJ3qmRPfii3WharZ8sMaKyAWu1v7zMDezYtp33F
         WAY9lrk0QMGZMwwpnVerGqVntd6r9ePskdYGPw0wdYb2Tcr+UN6bGmYigOomMFZAeLvN
         1mDw4GtOvJsZ0lt9E3QMf1+/a04l5mLp4rEYBhH6XTWiOnTvEgdA0m8b9p8SG3Ihn5w1
         3CJVYDD3H0h8UDDDi/cK/12YLcCqTtaBRIYSOaY/8ZaIkiFkF8/2Wq6fmA4WID4DUsId
         PkrncTiUC3LNX0OdcZSaP0tUsLdgkKJz3GgEPtoizxHigvS8/dD7POr+K/WagMroHmbx
         NOAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05620a295100b0076cc9ea95a4si2415376qkp.220.2023.08.02.14.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 14:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qRJ4x-0003UO-Ur; Wed, 02 Aug 2023 17:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qRJ4v-0003Px-Rv; Wed, 02 Aug 2023 17:08:21 -0400
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qRJ4t-0007ND-U6; Wed, 02 Aug 2023 17:08:21 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04997FF805;
 Wed,  2 Aug 2023 21:08:11 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] Complete i.MX6UL and i.MX7 processor for bare metal
 application.
Date: Wed,  2 Aug 2023 23:08:03 +0200
Message-Id: <cover.1691010283.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::229;
 envelope-from=jcd@tribudubois.net; helo=relay9-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S1ZEa9C5frh4

This patch adds a few unimplemented TZ devices (TZASC and CSU) to
i.MX6UL and i.MX7 processors to avoid bare metal application to
experiment "bus error" when acccessing these devices.

It also adds some internal memory segments (OCRAM) to the i.MX7 to
allow bare metal application to use them.

Last, it adds the SRC device to the i.MX7 processor to allow bare
metal application to start the secondary Cortex-A7 core.

Note: When running Linux inside Qemu, the secondary core is started
by calling PSCI API and Qemu is emulating PSCI without needing access
to the SRC device. This is why Linux is using the 2 cores in Qemu
even if the SRC is not implemented. This is not the case when running
bare metal application (like u-boot itself) that do not rely on the
PSCI service being available.

Changes since v2:
* use GiB, MiB, KiB constant defined in qemu/units.h after code review

Changes since v1:
* split the i.MX6UL patch into a refactor patch and an addon patch.
* Split the i.MX7 patch into a refactor patch and an addon patch.
* Fix SRC code after few comments in code review.

Jean-Christophe Dubois (5):
  Refactor i.MX6UL processor code
  Add i.MX6UL TZ missing devices.
  Refactor i.MX7 processor code
  Add i.MX7 missing TZ devices and memory regions
  Add i.MX7 SRC device implementation

 hw/arm/fsl-imx6ul.c         | 161 ++++++++++++-----
 hw/arm/fsl-imx7.c           | 205 ++++++++++++++++-----
 hw/misc/imx7_src.c          | 276 ++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 hw/misc/trace-events        |   4 +
 include/hw/arm/fsl-imx6ul.h | 150 ++++++++++++++--
 include/hw/arm/fsl-imx7.h   | 349 +++++++++++++++++++++++++++---------
 include/hw/misc/imx7_src.h  |  66 +++++++
 8 files changed, 1028 insertions(+), 184 deletions(-)
 create mode 100644 hw/misc/imx7_src.c
 create mode 100644 include/hw/misc/imx7_src.h

-- 
2.34.1


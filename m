Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDECC88E63
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 18:18:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5omC-0005i9-4F; Sun, 13 Sep 2026 14:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x5omA-0005hp-Ei
 for qemu-arm@nongnu.org; Sun, 13 Sep 2026 14:18:02 -0400
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x5om8-000223-Ai
 for qemu-arm@nongnu.org; Sun, 13 Sep 2026 14:18:02 -0400
Received: by mail-lf2-x11.google.com with SMTP id
 2adb3069b0e04-5b89a0e69dfso1456811e87.3
 for <qemu-arm@nongnu.org>; Sun, 13 Sep 2026 11:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789323477; x=1789928277; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2iVnvtvgBTzNKgSIpJFBLB8jsQ2CSjE2UWOxHlCMc5w=;
 b=ly6BaShJFn5Kxvvy1TlJP0dF3+jHrDcJiWhuTsVsBgqqw2u0XJGAXFL/BJupAh0qxO
 252pK1e+goo2/Fz8nqG9See1FNounZaOGPAaJwc/vIjN17TGxIJNziANxzKzWbxCk1jC
 uu/sgMltthxGTUo/kR1T7Xrw7Qjsn1M74Cj3OXrcR8YNb2VwiFIae0bddWlOS8mVUpL7
 uL2CJRY4vrgxeYlKPRlu2wrnEOLbcRpBX8cKuQBF0pVUPBNS7cP9ZndeM55XEyzZi8Y2
 vfXsvZp3KlvYNNU8hESaUIJrOMOrikfbT18hIbzn0KiqppHTWMl8r24YZfwFHI+rSQ1Y
 +bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789323477; x=1789928277;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:sender:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2iVnvtvgBTzNKgSIpJFBLB8jsQ2CSjE2UWOxHlCMc5w=;
 b=jVo+WnH5c4fs2DYfWVr2Y2kUg2WYi2dH71ObF1DAtraTGCHFmXadheZxoK7eJvWy1q
 ssVgSPCCO+pQmvz6zml5lmPE4FXbt9Lxs4ELeIRrnM5CE3fTvvZbHAEwhzpyPWQK2gLR
 Hzt3GG7FffssaL7r2O5soHNSrnUR23Ua41641V8G85Oidp4ShKSML0PG7kmY/xdSMLOB
 nZXbJXusQuoOAAyMHTGRgbrLjmP13JR+0n/HQFQwbZ/4955VprDXKWy0r4guo7gG4v+U
 gT2B+3evkmMV3ZN6QJfGwdWktg9IzXi5Z8qiJmWjSYCs4VOjvtsBsX+q/9c+ETSWCMEO
 ENsg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzTOyFhO6NP29utJcGS62NgfjTH73CoF6l63VH5THTtl4EaatmywGCVePhW8Xz2XFH/mj+NGAoBPw==@nongnu.org
X-Gm-Message-State: AFuF++l4g6rnRve/dfgHpuC8sYJaOgE5cLPHyQL9EWFDpdjiXcJZMStK
 dGep6lFhVDSXae3doWsZC4s8a4rmlGDhH5lwzi5/KjMBX0P2w3+jV6dm
X-Gm-Gg: AYBFou38XOcVoFWW8uX8v9YwoKTj3eRf/r4e+sWunkdIjs8sA9ZhSq1oQiIXe9lh8IO
 1rQTWE9+NE55pTtyFbDMU33jWYZlNdcoWUy75c5XMtIS6h6bRYdJfIrEvgxqVRkAedYOJTZ71ft
 KWk+3Fp2Yau4/ad+IQxp+rTCXPIe1vMGaugbZo+6YsmpCOo0HQRcSUM0hcdvzlWlayhTNnvvStC
 SXDgm9Ps5CGDXM6NSRZSoK3i7cLi2Z/AvGLI0VGDm2XR35wgCMEj7qC2FrHUuU4ulu0dVf3Nb/8
 PSKDBVjMMAqDLqclGiZRMx+KmvAP0TQew5Or85CyXuTptAvhAbTi5771G1Ts1IdhNGHx8iNZFuw
 o4bTpKHPsil1mJ81Nh+3GKo393CmwChpjll4/cDBOVQf1f95OZFC47geNSOlTc/T3eG8x4w1Stx
 GEkS1avn2GKtFtD0p4VnxsNIE0X33CtEox2vSZ+uFh/LGK8FEpULXO3m1qG+MklRHDvts8gj9n2
 +wW2Pr/Oyvm3X7Uaxb0W7qcupzBeX/kSuA+vuIRH2g87bNtSWhz990O09Weu5IlVu4GrA==
X-Received: by 2002:a05:651c:a10c:20b0:39b:2ff8:64ae with SMTP id
 38308e7fff4ca-3a5a5191544mr11393201fa.9.1789323476764; 
 Sun, 13 Sep 2026 11:17:56 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a5a3326aecsm21122951fa.19.2026.09.13.11.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2026 11:17:55 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 0/3] Allwinner A10 GPIO support
Date: Sun, 13 Sep 2026 20:17:29 +0200
Message-Id: <20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XM0QqDIBiG4VsJj+dQC7Md7T7GDix/64fS0OE2o
 nufBYPYDr8P3mchEQJCJJdiIQESRvQuj/JUkG7QrgeKJm8imJBMcUX1OD7ROQi0n9FTCVpVnNf
 GNhXJ0RzA4msHb/e8B4wPH967n/j2fqnml0qcMiq0rJSUxlrOr/2kcTx3fiIblcQhF/+5yLll0
 HYtq0sm4Jiv6/oBJjFKMesAAAA=
X-Change-ID: 20260818-allwinner-gpio-6ea84117df94
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Jack wang <163wangjack@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:36::11;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lf2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patch series introduces GPIO support for Allwinner A10 and
Cubieboard.

The support is focused on input/output and interrupt functionality.
The qtest suite is also updated with tests for implemented
functionality.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
Changes in v3:
- replaced forward declarations of gpio_is_input and int_ctl_cfg with
  definitions
- updated use of extract32 for int_cfg_n to use full stride INT_CFG_IRQ_STRIDE
- replaced custom bit manipulation with deposit32
- updated output GPIO line handling to have same behavior when lines are
  configured as input as when they are assigned to special function
- removed update of outbound gpio lines in the reset function
- improved test organization with common add_test function, as suggested
- removed leftover comments
- minor style fixes
- Link to v2: https://lore.kernel.org/qemu-devel/20260829-allwinner-gpio-v2-0-f0ebcb07302e@gmail.com

Changes in v2:
- allwinner-gpio-test: Added test for interrupt triggered on both rising
  and falling edge
- Link to v1: https://lore.kernel.org/qemu-devel/20260819-allwinner-gpio-v1-0-2a64866dff11@gmail.com

---
Strahinja Jankovic (3):
      hw/gpio: Allwinner A10 GPIO emulation
      hw/arm: Add GPIO to Allwinner A10 model
      tests/qtest: Allwinner GPIO tests

 MAINTAINERS                           |   3 +
 docs/system/arm/cubieboard.rst        |   1 +
 hw/arm/Kconfig                        |   1 +
 hw/arm/allwinner-a10.c                |   8 +
 hw/gpio/Kconfig                       |   3 +
 hw/gpio/allwinner-gpio.c              | 449 ++++++++++++++++++++++++++++
 hw/gpio/meson.build                   |   1 +
 hw/gpio/trace-events                  |   6 +
 include/hw/arm/allwinner-a10.h        |   2 +
 include/hw/gpio/allwinner-gpio-regs.h | 227 +++++++++++++++
 include/hw/gpio/allwinner-gpio.h      |  41 +++
 tests/qtest/allwinner-gpio-test.c     | 535 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build               |   3 +-
 13 files changed, 1279 insertions(+), 1 deletion(-)
---
base-commit: d43c2d5f89db70359a7b3a7e2ad7098fcc0165ef
change-id: 20260818-allwinner-gpio-6ea84117df94

Best regards,
-- 
Strahinja Jankovic <strahinja.p.jankovic@gmail.com>



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A365DCCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyF9-0004yj-8Y; Mon, 20 Oct 2025 18:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyF8-0004yE-6v
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyF2-0007VK-6A
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so45886975e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998834; x=1761603634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxZHsO1L/VrZlP2B/qXka5RVk62bKTEPJ3UyLZsjPT8=;
 b=PcxZuS9cwCxCAAsqyiX8jc967NHhNk0cL5TNoLaXBq7iBy5xM+qGr13eIVpDEdxow4
 ENciI+BVnYMoTmOicHOVyKPOFF3rH98uDvkb2L0CIkb0PzFdDPH3LJ/c3amWqzFwZ8Vh
 SBVuNs93lcuP+RSjBe9BJj8v+SWlmxzxX7b2wIh2/8g5vYo5uWG+zIduv8fEzBz3iBVO
 IjNcIsizbBrPWkwmjAydt+YGdvYZqrD+9QT9TkUi7mSTuNRaaG662yp0E2zgpBsHzA0s
 +INHXk4KZMyx8lca4vkw3prEMtxULuLe3kyzHIZatvcC37OQ1fiXk2BHVk4oCynbp1Tb
 n0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998834; x=1761603634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxZHsO1L/VrZlP2B/qXka5RVk62bKTEPJ3UyLZsjPT8=;
 b=pJ4Rga8Dz4CoSr27G/HomI720yVrFcJs9CWLm/df0/cJsTyKHukvo/s4poaUchQDgf
 zTS4qC3e1ZvyopnfBOIcTi6+w3IeI+8wCVM1Qu+XkY34RsOwCS9UwrA2rlFhO7P5srfm
 rWX5IESSK3s7wLK2mzxfQGU5PoT7UpZhUTBR55siAcPLQQjcrKxaQYQFTBGHpXN84H5i
 rYimesihOqIQWcUCN1blPSrNcRBxhZyY1uBePNNn8Ti4ltb7HtNewsfbnRYPnxZghfTJ
 0/gvNVm48Q4OdqXWOK90D1r+pQs6TYjWPoxzoePtJ7Jk0AlSjWyDEU324YF84yMifQTO
 HC1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULZrjFjHZjDImbZ07T2ImlvRGgqSkBr0igXD4lGr5FScPvdErC2BxAzOuuzweEt32nlbQAZaeK5g==@nongnu.org
X-Gm-Message-State: AOJu0YwhU7OX16LNgCp1HfJmHN7Y8swI/OJYjgopDReByF4lAbcSoXlN
 KXZwpa7fkev0gwgGHc13UqBDNwD4v9EtqtHWbpDPRAwHh7OMtIL9xTXkWOCWQLr9E80=
X-Gm-Gg: ASbGncs6F2z7YdRr3DZp7YblWIJ+BWmOTYrof4pFYNE95k83T279Q3p6EltYcW4o4Ew
 dqKl6/XY/TGW7wRx7lnCahTRsoD0ZAGiDalGOgku3fnXKo+DUj08KihcFCKElDaVp/UIv2TZGGI
 8WS/fYAK3Z/BrlmCOE9SRv7hXPuc5GZemlToFZaqUHDJvtFX3GxXHvnXEQ+d3kQMxamhF6MmtYq
 pMO6FtHTsOMeqme0wz9QP1HvkQtlZ3OdTZPi7Dzb3uesIo2IVHYtDLaClU+kW+D4BbLSTQPjvzp
 i3rqJIxH78QCECA3wTbN5Wfg3PJK/8qn1ZBquSCn+FDZF8hgDqmfDjgD7q4FxLbrrNnihdftiRA
 WAS3tnDtjeU9jEwMSYHpw+8NCdOnGONIT9q2RUYEen3ZH6O0/uPLPsBlhIIxBgJh+PlONHK95ax
 xTdCmNOyLwzzNzqtZQK0HUsD1IO066huWQClAiYndVymXr8iAVOxKyk9cwcSbe
X-Google-Smtp-Source: AGHT+IEwMxOuCWyV/6qxEwKsYmeDiLastoEk5BExLJA71Ro2jioPCr2gC8ivxh/TIEJpoCW3OFO0Vw==
X-Received: by 2002:a05:600c:540c:b0:46e:46c8:edac with SMTP id
 5b1f17b1804b1-471178a6f9emr97207625e9.11.1760998834464; 
 Mon, 20 Oct 2025 15:20:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496d23237sm2523945e9.10.2025.10.20.15.20.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:20:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 29/30] hw/arm/meson: Move Xen files to arm_common_ss[]
Date: Tue, 21 Oct 2025 00:20:09 +0200
Message-ID: <20251020222010.68708-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index f9d615e360b..28106de94b0 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -68,7 +68,7 @@ arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_common_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
-arm_ss.add(when: 'CONFIG_XEN', if_true: files(
+arm_common_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
   'xen-pvh.c',
 ))
-- 
2.51.0



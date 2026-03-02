Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBF7EB3637
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:04:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBM5-0000J1-Kd; Mon, 02 Mar 2026 17:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM3-0000Hd-Rp
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBM2-00016T-7G
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso963082f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488984; x=1773093784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtSSxc4Ah1ot2GgQBdeTXSOp3+KBMfYLcFsfHrMmRLk=;
 b=f1rmWHumNZ3vV0LVp0UkUYP9Spj/mt4wwLrkG9c9qPhs1xKgXymg6FErL/NQmb/nSA
 sQDONW84Hm0R+2g51FkYHSXuKoKQPDP+LIMeQiJNqP3Y/wxyZwzitxwJWzsWkFtszd9c
 oC/V+YPv0JGaxLvN3Sx5/zMiasat97sg5nr8ZYG+mz9l8CYPFd0aREmzvpqHGOQE+ENn
 zK7S+z4I9K0T9c9s7wYobGgMp5YJ90mNv/tOaEwETB/PrfHOrcnAzoeMhlBqRsuv2sqr
 Dgqbj3U4fGh2L1xUyzk/UOdNAWDzX+2oMcFtqYd67AhxJzAUd9eblTOa4KCnQUUMI9sm
 E+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488984; x=1773093784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TtSSxc4Ah1ot2GgQBdeTXSOp3+KBMfYLcFsfHrMmRLk=;
 b=p/Ii9dy8R5dJHC9KuIDghNoXTYb83E/aQGjHp2xmIp2VvVQp6x4eILHmj7fMfuq3bf
 wTMUnQulzLg4+ViWGIQIKI8WSX76RNgHf4GyCnGUs3PFLvKz4DY+pPfCMl1279dQXAju
 N9QuowbbABM1UlF8piAAPZZkX9Tg+aQeKPOisP2kP3vGPAluvyAq2knHa4GUV8DFiTFV
 EeTVlYedGay4Vu9yICL8hqRFyqcklCC80hWVVOZvKkAheOn62pC6PqppoAFOnXm7XRjn
 xcTkGpTlJIBgQDW7RkaW5UkXdh7+yq9bben36CaA1bzxThRXrd8AZI0BYU2v1zQI/51+
 uSdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTPOSitORWvIGG0+fdD3hxa0IUQ0EHgMJY6FS9pUFPgQLBm0LZVhq/Z40BFHtOOBQobJ/mkWm8eg==@nongnu.org
X-Gm-Message-State: AOJu0YwxFzVNh3O8B7zLl0KXPW9fsS6qoia1/ySSmbKOvZMoDdJ93Q08
 5H2+YbTNYNv9HJ94sinKuUhkivbtiFB70rEFpXg/+B4j87pxbWIr/aeZ
X-Gm-Gg: ATEYQzwQ5mNstwkLkygGxFVgaLahCBv7ywsXaGBmqkeL+i2/CyMNx51vH6AHg+jNnDv
 wmkXPps98Dip1vZ3YQk3btQ5Ku3RK0eFtzQ2VOpBQ6PiZ+UFLwm65Fs2dYUf1bpngh6whIpKmEC
 cwJ/Z9dxZ98rNSgEC8sKSHj9yjNAfQTCxSJz9TCTZIjhXw/WEH7AMGUyYAgyHhnBB/iIIldAQ96
 t+EJkuvml9iiAn9PYED3QMvDqnpAzX67g5MX7HAtwnxK8M/DOUh+u1eFJ21Lqc2EeNtdBI+aJnT
 tmE16PU/OdsqnicbPn4IwLQgGPS5ssjS+NchI4E/0dGhvA0LDcM0xCHWad9TGCHQt6D/UWloB+E
 kR85TS/TGP56VQqF/qM0EFjO0aDnxpkdCKDY1fTmIN+zcHTDyx2gdhcPRAb2nrmPpKlapjf2J6k
 8hSfYktw2bY4wwNqgFZKu3KlpGATBSds/G5DSLF3prlsnIdTupehk8/75uLhtNEUFVFnyaYc+Fz
 siNIRfRG1yzO5uvP1ydqJT59mk8Wy65lmG4bmm7XhFkkl8=
X-Received: by 2002:a05:6000:18a6:b0:439:b886:20cd with SMTP id
 ffacd0b85a97d-439b886219amr7543680f8f.16.1772488984307; 
 Mon, 02 Mar 2026 14:03:04 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 01/12] hw/arm/Kconfig: Fix serial selection for NPCM8XX
Date: Mon,  2 Mar 2026 23:02:43 +0100
Message-ID: <20260302220254.1166849-2-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302220254.1166849-1-shentey@gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

CONFIG_SERIAL selects the internal TYPE_SERIAL device which is akin to
an "IP block" that needs to be integrated with glue logic. In case of
NPCM8XX this glue logic is TYPE_SERIAL_MM which the code uses already.
Fix Kconfig to select CONFIG_SERIAL_MM which matches TYPE_SERIAL_MM.

Fixes: ae0c4d1a1290 ("hw/arm: Add NPCM8XX SoC")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c66c452737..20e99e52b1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -493,7 +493,7 @@ config NPCM8XX
     select SMBUS
     select PL310  # cache controller
     select NPCM7XX
-    select SERIAL
+    select SERIAL_MM
     select SSI
     select UNIMP
 
-- 
2.53.0



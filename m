Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D104C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmVE-0000RT-Pa; Fri, 31 Jul 2026 08:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmVD-0000QL-B4
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:38:15 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmVC-00018G-1J
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:38:15 -0400
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-47f9ab7ee38so550926f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501492; x=1786106292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=H0i9wFR+0jszuSIzriUDQZoOMEXHplug+y13hr3wwAQ=;
 b=H6TILlRL9sZgizrhDw7QURsmVBlpWojsfBeJkzvf/Q6UTM/59uJ4/3OFZI2AVA5g/z
 ga7hYAmLDWgA7uYD2Mc/McfP85jMM+vvrK8SbWcdatokpoT11NXpDHBuh2aiDIOVUObt
 syj1pChn2V99QU3rJvxc/Fy1OeyVRpOJDPyaJB0pVZlFlv4g/7CxdnPw7nEp6nTvNLuI
 5nSMt4dMq6qRgoPynHX8zKgp0s6Mfd157LsY/owfOzv2ZivoK+Kb0a5llHWIZ3m8DlGC
 OGft8px5r0q+7Q1qRJeIakbyLXCqkscQwgMz0k5N0oe0gExbQV13zridscpD81eTDtQF
 KCmg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAFt4UVg+JcItMcbc3C1bEcY4IUWqQRE/k+rSNL1G71C/HyIV+VOhFvU1tgNiMIHkG6xnrc1kjXA==@nongnu.org
X-Gm-Message-State: AOJu0Yx70stGH2DAwDIXu2xFEc8heW2b2r4kc/kVZ3DoWeWTsafP1OCL
 amNMZYiCwLvWjJC+7r23T/3Ej4SFIW96nJnqQB8qKlLgRrHWrqFotarU
X-Gm-Gg: AR+sD12vfb8zufm+J2UpYTyffVaYQhzcyoiXaR7SzJo0/Aqjd6YRuIzR0TQ+ISzyPMY
 Iy2U117yBGZyNqb0mBl2H0s2kJlqO3m8XqwQ99L1F6A8wwtWVs+sE+vKAwNQig3hTfCSdR9DJ69
 TRy6Ud+NcKmCorKJO5XKIZVPlVMWaRC9M8i2mUR7TPYjzaGHiHGXHZ1qV6YkuR5at5eS65Kyt73
 VU4KCg395qFaMib7/UJKr1toSQeZBAvy3beW4NKP5xxAp/1/yPRGu3cjV47Y6b3Hn4zZHryTRVa
 3dL+38gf7LY1bGGLFqBZZWfVAqjOZ26eDr/Dtaw7G4RzZuxocxaZIaHv02X7WF6ittezWMsoDiD
 VyDMSGekvPIHAsWaY0kQYQRWJSv57pG3iNhDl0IqoK1DbjDtNYx9VF6BPTmvaMkQGlp9wMVK/iV
 kCoClIEHfWcEVTf9ykjk2HKlA2/tJEdF7ifxLXS7ZPKF0fgB8R3x1Ye7iaJQ994m0RPrbq4f+51
 j9zma32PWu5DQcok4klg3YIktUcypXqzlA2
X-Received: by 2002:a5d:5f48:0:b0:47f:9822:d99b with SMTP id
 ffacd0b85a97d-47fd2a426f8mr4362739f8f.0.1785501492502; 
 Fri, 31 Jul 2026 05:38:12 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e296csm4474934f8f.12.2026.07.31.05.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:38:11 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:13 +0200
Subject: [PATCH v2 14/25] hw/arm: catalina: use the real TMP75 model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-14-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494708; l=948;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=yr6ARhHsRJdWelmON/tAwpVgyc94u96MVCdEOI7hMno=;
 b=+vP28J89xkAkyyQIPR39YLuI2lDmZqn8xSBG6w8WrD32a+VWYSs397H+VlsUQBjDilpeF8hRB
 EMdQUT4TIcqDtCp9Dg/7Xt/xBmvTD/zs61OvIcs/xaLARYiT4x8aVW4
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.48; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f48.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The Catalina BMC instantiates several ti,tmp75 temperature sensors. Now
that hw/sensor/tmp105.h provides a proper TMP75 model, drop the local
TYPE_TMP75 alias (and its guard) so the board instantiates the accurate
device rather than a plain TMP105.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/aspeed_ast2600_catalina.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_catalina.c b/hw/arm/aspeed_ast2600_catalina.c
index 33e75338ef..928e140b21 100644
--- a/hw/arm/aspeed_ast2600_catalina.c
+++ b/hw/arm/aspeed_ast2600_catalina.c
@@ -22,12 +22,6 @@
 #define CATALINA_BMC_HW_STRAP2 0x00000800
 #define CATALINA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
 
-/*
- * Guard the alias against the TYPE_TMP75 that hw/sensor/tmp105.h now
- * defines.
- */
-#undef TYPE_TMP75
-#define TYPE_TMP75 TYPE_TMP105
 #define TYPE_TMP421 "tmp421"
 #define TYPE_DS1338 "ds1338"
 

-- 
2.50.1



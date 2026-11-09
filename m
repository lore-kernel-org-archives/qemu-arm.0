Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1CB606A330
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c8cMpjto
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQNfe-0005Or-27; Mon, 09 Nov 2026 06:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfc-0005OT-Cw
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:16 -0500
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfa-0000Ga-MT
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:16 -0500
Received: by mail-dy1-x1336.google.com with SMTP id
 5a478bee46e88-36dbde64409so1332647eec.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794224173; x=1794828973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uNaO0wgwi4Lzs7E2ManR6jBV5/KErR0RmzXMkUIskao=;
 b=c8cMpjtopAeyx5a7u9+KBSQosn3c0ticAXmbuqSLXWyUQajdgmMhGRnsaf02B956S4
 MYzBm9UB30SdopAHgw3WOd/VXD2IxjEPviyPN0WupiBDSeu5RT64+FgYhldVbyU4zni6
 d6ZhSwMBDh0l9Tos33sd4jTSzzKhJizcdYZIZ2z9NZ7XPD3BHATEv+/yksu60syBfkhv
 VzMhLO/DRieLZcp2IZCvEwatub1Szv+Cgu3aJFP/PGEN7ULoopODA1nEA1p/AZS9ctCy
 RGMMcXFidGGjXNZbeNI3gCGPmOg/J6Ndi2YR1pxnDrz75TEnpjyikpSOjGfrikUyjFXf
 K54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794224173; x=1794828973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uNaO0wgwi4Lzs7E2ManR6jBV5/KErR0RmzXMkUIskao=;
 b=bcncxAkGKYuAVe5j0XhDsxValKf01o251K4yDKfMFX5+NYROR9Q4/0ZUDC08pscj51
 9tAdXOsaV78/UJ+6ellJRjGvOsOswfxope4Uyir2mVGdXNcIiuGTBueDClnwPObZp39V
 z/leC8Q/yQRRLDqZmKrI0hSceVmFOiB5wEIQFRZ3SnJf8zbk8xIZ9Rm/jUCjTFxkmhyy
 sr/TqCrRndSoCrGe9CgX6B9ld4BWJHPEen8FbVdRYuWdnnymXFjl+jeklhR+3qlcIAFr
 LhcCARmzWCXN3dYqLvhunZS8DXfoSZJ2DLA9UWKnPssyLfgcCIxijS3XTe0Z2M7iRZlp
 qlqA==
X-Forwarded-Encrypted: i=1;
 AL+hErFuBbMP6CpQ8o/HvZ8wwdksoc99i2+oXvX33uWyO2exfJoUwONxyt4r0+P+cdBi+Ojj9h0v3s3Arw==@nongnu.org
X-Gm-Message-State: APuU4Z+vynWT5ZB7aVvDObPTqIjs7mYIT1eiln8CEhKm4kTCqV6V9EgD
 oxM/3f0NTJugGIlIAafaXIq5kXaXFMPVrzzsf6FZsGo8wPD8mav5gyRN
X-Gm-Gg: AYBFou1He8bh0BSsurzr6+2cOnrHBpU4h+033ZPFa9h0rqdpGorETiVzUsZzuVTAZKa
 ubCSEbUvSfGkPJshop4oXxbTPkEjm+LIZ9cH6kVZOLgsZyVqMMPJqDnQAndTN42aX2jh3uJcx9D
 jsgvyRTmz3BFILa4NfiMtbf0/Fwt5Psbo7wRwGd8trA4fNIMPMf+Et/ZI3H0WDO1A6BNucmF/8j
 SdzDBU4mI4bOh4afijr0g+X0CS1YXDunzm/Fn9GnUV3Xect107ZwiaRtGTPV58CLd+asYwV9b0q
 vA6FRpPOArGYW0RTecYB8XDl/UKBk8BsqukzI0PMB0spx01Rt+eiHYwTAX1x0GN57Y/QhrzmDID
 ujyT91B+ldn57utMgivpGNiVqsfRcymAghA8lrPi+OxiqcjTPQPOZ+kSOA1ox64ZyIy20gBjQtE
 cWDDq9SBt6WNv9bytGspKueeUiqbhjWBvHCG8YjkTmnzGHYwSnOe0UCbBEUYM48a2BQ/2Fum63o
 F7KoGZvUfPk3OorNBAquFC29fRRkAyTza/PvarPJy9KLkHDpA14lt395Qi3/xLTh0l2STyMKCdQ
 feV478vUceNYfDJ1kuAxXEdudx3ggX80
X-Received: by 2002:a05:7301:1a03:b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-37258843f2emr7082834eec.36.1794224172968; 
 Mon, 09 Nov 2026 03:36:12 -0800 (PST)
Received: from ubuntu.lan ([2405:4802:913e:86f0:35c7:7294:a0c3:69b2])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-372660f444csm19762941eec.19.2026.11.09.03.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:36:12 -0800 (PST)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH v2 3/8] hw/misc/allwinner-sid: Separate ALLWINNER_SID config
 symbol
Date: Mon,  9 Nov 2026 18:35:31 +0700
Message-ID: <20261109113545.18561-4-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109113545.18561-1-dovankhai97@gmail.com>
References: <20261109113545.18561-1-dovankhai97@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1336;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x1336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce a dedicated CONFIG_ALLWINNER_SID Kconfig symbol and select
it from CONFIG_ALLWINNER_H3 so the SID controller can be reused by
other Allwinner SoCs.

Signed-off-by: Khai Do <dovankhai97@gmail.com>
---
 hw/arm/Kconfig      | 1 +
 hw/misc/Kconfig     | 3 +++
 hw/misc/meson.build | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 616beae7bf..21480e277d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -309,6 +309,7 @@ config ALLWINNER_H3
     select ALLWINNER_SUN8I_EMAC
     select ALLWINNER_I2C
     select ALLWINNER_WDT
+    select ALLWINNER_SID
     select SERIAL_MM
     select ARM_TIMER
     select ARM_GIC
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 685b7ff1e7..1639978874 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -268,6 +268,9 @@ config LASI
 config ALLWINNER_SRAMC
     bool
 
+config ALLWINNER_SID
+    bool
+
 config ALLWINNER_A10_CCM
     bool
 
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index fc3800baec..059d4c01a1 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -55,7 +55,7 @@ system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-sysctrl.c'))
-system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sid.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_SID', if_true: files('allwinner-sid.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-ccu.c'))
 system_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-dramc.c'))
 system_ss.add(when: 'CONFIG_AXP2XX_PMU', if_true: files('axp2xx.c'))
-- 
2.43.0



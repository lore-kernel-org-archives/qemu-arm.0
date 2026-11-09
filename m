Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6C606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e4+BLMZx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQNgJ-0005ZO-7f; Mon, 09 Nov 2026 06:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfl-0005PD-24
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:31 -0500
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dovankhai97@gmail.com>)
 id 1xQNfj-0000Hu-G4
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:36:24 -0500
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-33fb4680717so1725732eec.1
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794224182; x=1794828982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bNr7qOmknhoc05KDkjIjP7LadN/7Cinytf6TaPmBuNw=;
 b=e4+BLMZx84G50uVxhxc0dUgdiGsghxJkhQeud8qAtHrR54dbQkPxSiFqqrXnBIPFi/
 XiKDktBw+RZH/FpRNsQs3bjQBrOELuJyQfnWQ3i2HnDmCyyaYDL0U0ep2NXsMCFDN+yQ
 efavjfODsnIoggeYHCf5xetdaFPL8l2cURObJVWTOfmat4/Hx4x5SLhVr6CI+LRdKRdH
 BlYryzL5nP7JtFyoP2V4BGoPQbQ6VFPQo2RQhVhj6Seugpnip5L5AVpLzIZjsgDuROQ0
 ZPcA4J7lBUxJr0P9w+9/iZ069CFK77xOGsg69wr8smATIqhH3MiLI/h/YLxl6/nlDQze
 UIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794224182; x=1794828982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bNr7qOmknhoc05KDkjIjP7LadN/7Cinytf6TaPmBuNw=;
 b=qIUUDnMobBCzNBH0zvSYT5G6mQuUPSGQabr2XmiIO2Cj+Gj+f8fmNjBDjn0ppXsysW
 sgh++YXdGkKhwjaQbuXJFqoUdueSWfwJ22nXTEBLEJDsZwdcLSMgSKlSvEwmp+dMMDxp
 1hnj5vKTqyRMvPCxHwhBGrGDrhYKD7woHPOUp4IJ/PmXlYzcKG5/IDLvVgR1FXLLBnTA
 Jzf77Eer9JGxmNtFUiPtTdLzJU6KOaMfvKysB7wOJYxe96Qc6frxiG08/RFp9HLJBEtM
 lBEPi/+FF/TeNQFY0d0rN+CoyWV77IyPYWYRAivWPJ8yYyILe4oibatezPjCKS4KnAfW
 OZuQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGLZv7Dw8P5ZiDYssjxEP84z2IflLQsFnkdxpz98O5AFB69d472b03QizZAPyuUq+OCGqQCNe1+Bw==@nongnu.org
X-Gm-Message-State: APuU4Z/yG8R80O2nPmkMiw/uFgOP6S5q4zzV7e2qybTPEXlV7GwkA7n6
 KRzJAryaH4DY/qZPkplAXMTp37xVbEnOymrv0oD86eoNeSmol0jqKYfY
X-Gm-Gg: AYBFou2o6idclaXVQzMakJMe9wOEkOMYjHdN/1+SrClqDIzBqasY5ASzFih2UO1sOJB
 arO1eiScGkubcqJJzu1JiEPHwucMNi/NAzYe3PIYU64hfYMHS3xzC4gV9H5yIcS2e7ovEX5XXNg
 +UWPLEIAKeA/mOwZ4ygc639Z0lpDsAHF0q7N8XY8EBYvVp305KrBDEYJrjIeJYFANbFTw9rLSeR
 AIQE/sOEM7RQiKOm6QRFfkZ9D9fjkOYue2fGlY9DM8kkkFDN2Cp1m7jP2veGgo34MhZCot76ndp
 n2dRD9aF047CAdrwTLIkaPFozwa/cNNn7aqnSVfT5d9oAxvOpizjxxE3U1kdewFNEG6a5xfz7Im
 zsYy7zThcBbDITM8gEvvQ2tV46RWl4SpGmvMPUYnxHFfrCrQ+rNjPpQkgwG4A4xE5itWJcmSNKw
 xJf50EUW5lzr0y/0eI5KXGkrhVjG/05vUw9KzTcq0yrH679uwENOFR5+XxaLGdA56+ojSBM2YYR
 bQGPK293bvAWwL+gcBurprQ2NwPFBiysJi0C/h0dmisC47iN7IYsCsWo3gOecsd3XeLJUZaLJF3
 wKhuQKZ2I6gT8XMPW1NlgqYCKQ4FljNS
X-Received: by 2002:a05:693c:8844:b0:36a:1e0c:e28d with SMTP id
 5a478bee46e88-37252e3abc7mr7732129eec.4.1794224181353; 
 Mon, 09 Nov 2026 03:36:21 -0800 (PST)
Received: from ubuntu.lan ([2405:4802:913e:86f0:35c7:7294:a0c3:69b2])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-372660f444csm19762941eec.19.2026.11.09.03.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 03:36:21 -0800 (PST)
From: Khai Do <dovankhai97@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com,
 strahinja.p.jankovic@gmail.com, Khai Do <dovankhai97@gmail.com>
Subject: [PATCH v2 6/8] hw/sd/allwinner-sdhost: Separate ALLWINNER_SDHOST
 config symbol
Date: Mon,  9 Nov 2026 18:35:34 +0700
Message-ID: <20261109113545.18561-7-dovankhai97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109113545.18561-1-dovankhai97@gmail.com>
References: <20261109113545.18561-1-dovankhai97@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=dovankhai97@gmail.com; helo=mail-dy1-x132d.google.com
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

Introduce a dedicated Kconfig symbol ALLWINNER_SDHOST for the Allwinner
SD/MMC host controller. Previously it was conditionally built only when
CONFIG_ALLWINNER_H3 was enabled.

Select ALLWINNER_SDHOST in ALLWINNER_H3.

Signed-off-by: Khai Do <dovankhai97@gmail.com>
---
 hw/arm/Kconfig    | 1 +
 hw/sd/Kconfig     | 4 ++++
 hw/sd/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a1c09272fd..18c45bc9e4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -310,6 +310,7 @@ config ALLWINNER_H3
     select ALLWINNER_I2C
     select ALLWINNER_WDT
     select ALLWINNER_SID
+    select ALLWINNER_SDHOST
     select SERIAL_MM
     select ARM_TIMER
     select ARM_GIC
diff --git a/hw/sd/Kconfig b/hw/sd/Kconfig
index c69bf24f8d..5078fd4fab 100644
--- a/hw/sd/Kconfig
+++ b/hw/sd/Kconfig
@@ -1,3 +1,7 @@
+config ALLWINNER_SDHOST
+    bool
+    select SD
+
 config PL181
     bool
     select SD
diff --git a/hw/sd/meson.build b/hw/sd/meson.build
index ebf09e30a4..d15baaaf12 100644
--- a/hw/sd/meson.build
+++ b/hw/sd/meson.build
@@ -7,7 +7,7 @@ system_ss.add(when: 'CONFIG_SSI_SD', if_true: files('ssi-sd.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_mmc.c'))
 system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_sdhci.c'))
-system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sdhost.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_SDHOST', if_true: files('allwinner-sdhost.c'))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_sdhci.c'))
 system_ss.add(when: 'CONFIG_CADENCE_SDHCI', if_true: files('cadence_sdhci.c'))
 system_ss.add(when: 'CONFIG_AXIADO_SDHCI', if_true: files('axiado_sdhci.c'))
-- 
2.43.0



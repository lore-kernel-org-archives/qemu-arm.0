Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1F8606A319
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sx8LzyxI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJHEq-0001Ap-Va; Tue, 20 Oct 2026 17:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conti.manuele@gmail.com>)
 id 1xJHBJ-0000rh-JG
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 17:15:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <conti.manuele@gmail.com>)
 id 1xJHBH-0002Yx-NM
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 17:15:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso30699f8f.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792530933; x=1793135733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=c/nIjS2GzZ6W7FtfGE5EeGltb2q4XTYFs7kvQmKLBbo=;
 b=sx8LzyxIdA5rh3VYh7WtgP9MZKYx66d7D0hZDPGZLZFGxe7VwL4DiuKKPlXOUG0C3k
 mgQ06eqVgGPLidhHZdqCBzpjIgWiTM9BXy2D+kOGIuHMzXsdr3fdshAMIEF7bCLEBdN8
 9A7UtMjIea/kII7KJDgoPU1LRYxeb92WS/CEV2YOvaZcuhF1b2zDSSFOXlfHamroZuLN
 FD1ObnAKJv7T2zLr36NzDgka0dWMLKu374vBUQbrsbchLjcurqC6uyBbKZLrCNyCVM3n
 /A9DUJogkY2NytyC510ouEtvqd6atytQ0Vq7xLrcODBuWGNPOvdQqzR0bLedLJBaWyrH
 fYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792530933; x=1793135733;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=c/nIjS2GzZ6W7FtfGE5EeGltb2q4XTYFs7kvQmKLBbo=;
 b=JABOHLgG6QmF610c0B0qGuTxUe1I8Zws+oP4oGCc7fhp33fYtYLUbjVTiTfm49INyJ
 tQqemVzZUzmbph3jQgasKb1Bir6L+TvUwhMUMubm08ExjGP/D5g5sqtor7y99UEk+pMu
 7D7lBRT+pz+myTVYYtZnVVUY8U/5of7UWCudSFiX6w3E75dayBzoQrL2EAF+M6OEgTuy
 CutnjGiBgauyO1tN1JQIH8Xfw7wc4lpGyf0tZWf/Uc15T8Ov8g1ZClCK2Tx6/8EP2qro
 eL1jzUKRAoxd0E/pcHr4Kci/Nj8foA46d0B0kBqM3FPV3s9Hklzf/i3lgtTXNcZqxsgN
 MATg==
X-Forwarded-Encrypted: i=1;
 AKwUvByz2rIJWG8jFVoINUmbY4ihaL1lRvW/UBqQKOTfYO2Z41JxlWm75/dblEUcdL+2f/53jZVFdDCAbQ==@nongnu.org
X-Gm-Message-State: AFq9FYLVVDDurJxEJXAAuOa8H+ERrbthA/XGBLgdRpz1VMvxYjgpTh3c
 05HSiDey1xoLVROIlKy7hkf/QIWxsYSRj2i7cSgZpIgMau9NgU98BUWl
X-Gm-Gg: AYBFou2VDpYcmwxk7kYBpNI/sShviqyARR3EhI0TzUzq3YwIBAprqgRvxYNuEikkDYB
 WvYSz8cuartF/U4YpRTv5lJfuFD32S5M909Po3urCggHPwr3vXCuUf2Ozoum6tnqnTHSIZ39EUZ
 BJnQiRsFemAr2EA/PThEea4CSiPvvGz/hdK38haMGLV89Nzo3OSi2hCFgxUHVo5jMDJYErKeQiH
 Qc27MBVDFiiI6v5kfdrsOisb5c6vvRfyUMOdHq6e5xy0W3VUtwC2gIV8eKcK+uS5A0GeTYCe8Hr
 C/RIJz6y/W5Ly6hPxqS8fFk2nytFXxYvUh9mXuEapPVu0Lil+gWQcIzuKKZyY/chjhjtNRryHuv
 jue0RwN4926gh48Q0KRS1s6obInhJyRO0EDqb0Tm1YUU0giySjjl3zGdHkbAO90O+QyucYCgECY
 Q0k/I8IZCEubSz7ftOCInoFV+ooYWcuQA/WuwtcG1b2j2gxx2r9g8NPdDikAHESS2SzrmE0HMrx
 d89ABpiPyFEmiZ9luV/X4ENU6q01SsuwX0Yr3hJSw==
X-Received: by 2002:adf:ec82:0:b0:48d:f4b2:b29d with SMTP id
 ffacd0b85a97d-48e07fb62fdmr19664337f8f.53.1792530933202; 
 Tue, 20 Oct 2026 14:15:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:7d0:d21a:4a00:39f5:8799:5de1:6dc6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e258424bcsm893150f8f.55.2026.10.20.14.15.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 14:15:32 -0700 (PDT)
From: Manuele Conti <conti.manuele@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair@alistair23.me, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Manuele Conti <conti.manuele@gmail.com>
Subject: [PATCH] hw/adc/stm32f2xx_adc: fix left-aligned conversion results
Date: Tue, 20 Oct 2026 23:15:29 +0200
Message-ID: <20261020211529.99689-1-conti.manuele@gmail.com>
X-Mailer: git-send-email 2.41.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=conti.manuele@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Oct 2026 17:19:16 -0400
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Left-aligned regular conversion results must occupy bits [15:4],
[15:6], or [15:8] for 12-, 10-, or 8-bit resolution respectively.
At 6-bit resolution the result is aligned within a byte, in bits [7:2].

The current single-bit shift and 0xFFF0 mask both misalign the result
and discard significant sample bits. Select the shift according to RES
and keep the existing right-aligned sample generation unchanged.

Signed-off-by: Manuele Conti <conti.manuele@gmail.com>
---
 hw/adc/stm32f2xx_adc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/adc/stm32f2xx_adc.c b/hw/adc/stm32f2xx_adc.c
index 50a04a0..e2dfc83 100644
--- a/hw/adc/stm32f2xx_adc.c
+++ b/hw/adc/stm32f2xx_adc.c
@@ -69,10 +69,12 @@ static void stm32f2xx_adc_reset(DeviceState *dev)
 
 static uint32_t stm32f2xx_adc_generate_value(STM32F2XXADCState *s)
 {
+    unsigned resolution = (s->adc_cr1 & ADC_CR1_RES) >> 24;
+
     /* Attempts to fake some ADC values */
     s->adc_dr = s->adc_dr + 7;
 
-    switch ((s->adc_cr1 & ADC_CR1_RES) >> 24) {
+    switch (resolution) {
     case 0:
         /* 12-bit */
         s->adc_dr &= 0xFFF;
@@ -91,7 +93,10 @@ static uint32_t stm32f2xx_adc_generate_value(STM32F2XXADCState *s)
     }
 
     if (s->adc_cr2 & ADC_CR2_ALIGN) {
-        return (s->adc_dr << 1) & 0xFFF0;
+        /* 6-bit results are left-aligned within a byte. */
+        unsigned shift = resolution == 3 ? 2 : 4 + 2 * resolution;
+
+        return s->adc_dr << shift;
     } else {
         return s->adc_dr;
     }
-- 
2.41.0



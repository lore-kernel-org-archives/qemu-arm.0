Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2680200lfc;
        Mon, 25 May 2020 23:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSfWXGUK++X4ok/hfny32BpWeqBbVWhTqaAYMp8ED4z88PxCRmB/15qctrdPY+MkF+4J8c
X-Received: by 2002:a25:5ce:: with SMTP id 197mr47332752ybf.30.1590474928904;
        Mon, 25 May 2020 23:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590474928; cv=none;
        d=google.com; s=arc-20160816;
        b=OShJGiItg3uKS8D/0JL99YvXgdRSB9dDXTDdTs2XCz+gAaZUAGrdR2Vy1YwgAb8tlR
         owCEzWY8eWG80ybJAiHFwr1/hCWggm9fJBsr6YASsM+jHty7VN/pyvN7wzb0zSr1FgJB
         GcgQbMGkHCh9nZr7dYTBQAHpTf+E+pFf4jgYqZzrVSbxk/QyT6FqIflSYUIJ+WdLMpoR
         Ueo2eIF2gliBuCukCGUoyKegFF4VlEzxeU7ir9e/93mWx3JYDNJ+oy54+zIajfSuodOd
         Sk5MnvdPdvunEDb9i3uOZ3/XJ0MWRng8KThLswNbTkHl72qxxmfz5j/AO3zWy46Dmtk9
         G/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ov/VdfiuHNjDqTE3fCbRjg14CTP5C1i83HxvBrv9WtA=;
        b=DZMYlbiolnYSYpRi4vfuFi82IOUemHtldAJAeluv797AoQLk1JlhmyhE8jZNmkytZv
         q92DvdF460b+N4vdtkw/t4AXRV/GEEN3TfeR7brcnM8zDV1ceK0qskYeM0+BjF3s4N5F
         7rNJVTvoCf79yENZFFHLbAjCtSXzb693zLS4sRO1r4jwc6eCy2x276apBxwk8z9jZxe0
         3xAAvZNi8Ws61L/8FHoDZb+45zdmxkw38gvJEProw5SDF8uuyuNZmfIDZcl0cKFEzDxQ
         ma3nbnrVnDsYP0ftVI+HjwhEMX/rn7IFSFlv0CkYRJqo1F9EZLu+hKLTPPYocybzW3yR
         y6fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OWAVylar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si8228670ybc.391.2020.05.25.23.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 23:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OWAVylar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdTBQ-0006lR-9A
	for alex.bennee@linaro.org; Tue, 26 May 2020 02:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSze-0007Hg-0b; Tue, 26 May 2020 02:23:18 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzd-0002Vj-99; Tue, 26 May 2020 02:23:17 -0400
Received: by mail-wr1-x444.google.com with SMTP id x14so13820350wrp.2;
 Mon, 25 May 2020 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ov/VdfiuHNjDqTE3fCbRjg14CTP5C1i83HxvBrv9WtA=;
 b=OWAVylarg3JafVIX7ehrlkaBdrqhN/Gdovid3wA79p9Ua/i5VE6kUrjWdxyZyaF7SI
 uOdrZHfbpqmUl+Kd1fJbzYbPCcd/lGWGbZbSHms2vovJLt/kEVhOuTU/DkzSOwMC01Z1
 3/gIVfZY/6b8Ge9PucFI7A2M95dOPK8F/C+XG4trh5vT/1rwQIci4Lmmw5miZEQEf+Kk
 3y1zpt72kkLfA6oMH+SLR8KXhMOd1zROiwLMh+xpiZ3YYyzkunPGpTIh15hB2/JzZae8
 7agU85qa8vNuSrSno+c5WwCGxeE/30d22w16P+Nf1UPETfndGf32Q3z4rliPrOuCXsnO
 /Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ov/VdfiuHNjDqTE3fCbRjg14CTP5C1i83HxvBrv9WtA=;
 b=NRUEhKuEtExMTJUI9ZVbNCN3jcbrmmA48FciTk0S/N7lHTp73OVDE2IW92l6Yib1Or
 Zx4HirHa6CeVrAej7JAbTlnAdsPd0spr3XWfX5VkFj0lVLm06HwyQJukaH3uWdLFz6P+
 h8GJMHQXZuxAG0Y7zHSwItLOCta51uFkz1CuKNxEejkYRSimiqaOHZ2aDFsfCHzGa2Pj
 NfZg3/93V88o7Rw5pxAZj+1y3Zxgnzxu7wiJK+1DZWHoNInrNe2gmg39w3PZV+Vo342/
 sjsxgCoBuYaMkdI3eGGIJJtrXwxccGt3ICHWylZnB4Fyn8HOyiwiFtCdwlCpLWElztV+
 nbQA==
X-Gm-Message-State: AOAM532P3is17DkuunfmiLaRqMnLZjUl2gXpmlNEfsHCctq+/YXKf6cF
 CcoullXthF77LutkpXOSzfM=
X-Received: by 2002:a5d:6601:: with SMTP id n1mr10254440wru.23.1590474195299; 
 Mon, 25 May 2020 23:23:15 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id a16sm5764745wrx.8.2020.05.25.23.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 23:23:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 14/14] hw/display/pxa2xx_lcd: Replace printf() call by
 qemu_log_mask()
Date: Tue, 26 May 2020 08:22:52 +0200
Message-Id: <20200526062252.19852-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200526062252.19852-1-f4bug@amsat.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D6XgwWSDXryO

Replace printf() calls by qemu_log_mask(UNIMP), which is
disabled by default. This avoid flooding the terminal when
fuzzing the device.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/pxa2xx_lcd.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index d5f2e82a4e..ff90104b80 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -426,9 +426,10 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offset,
         if ((s->control[0] & LCCR0_ENB) && !(value & LCCR0_ENB))
             s->status[0] |= LCSR0_QD;
 
-        if (!(s->control[0] & LCCR0_LCDT) && (value & LCCR0_LCDT))
-            printf("%s: internal frame buffer unsupported\n", __func__);
-
+        if (!(s->control[0] & LCCR0_LCDT) && (value & LCCR0_LCDT)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: internal frame buffer unsupported\n", __func__);
+        }
         if ((s->control[3] & LCCR3_API) &&
                 (value & LCCR0_ENB) && !(value & LCCR0_LCDT))
             s->status[0] |= LCSR0_ABC;
@@ -462,9 +463,9 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offset,
         break;
 
     case OVL1C1:
-        if (!(s->ovl1c[0] & OVLC1_EN) && (value & OVLC1_EN))
-            printf("%s: Overlay 1 not supported\n", __func__);
-
+        if (!(s->ovl1c[0] & OVLC1_EN) && (value & OVLC1_EN)) {
+            qemu_log_mask(LOG_UNIMP, "%s: Overlay 1 not supported\n", __func__);
+        }
         s->ovl1c[0] = value & 0x80ffffff;
         s->dma_ch[1].up = (value & OVLC1_EN) || (s->control[0] & LCCR0_SDS);
         break;
@@ -474,9 +475,9 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offset,
         break;
 
     case OVL2C1:
-        if (!(s->ovl2c[0] & OVLC1_EN) && (value & OVLC1_EN))
-            printf("%s: Overlay 2 not supported\n", __func__);
-
+        if (!(s->ovl2c[0] & OVLC1_EN) && (value & OVLC1_EN)) {
+            qemu_log_mask(LOG_UNIMP, "%s: Overlay 2 not supported\n", __func__);
+        }
         s->ovl2c[0] = value & 0x80ffffff;
         s->dma_ch[2].up = !!(value & OVLC1_EN);
         s->dma_ch[3].up = !!(value & OVLC1_EN);
@@ -488,9 +489,10 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr offset,
         break;
 
     case CCR:
-        if (!(s->ccr & CCR_CEN) && (value & CCR_CEN))
-            printf("%s: Hardware cursor unimplemented\n", __func__);
-
+        if (!(s->ccr & CCR_CEN) && (value & CCR_CEN)) {
+            qemu_log_mask(LOG_UNIMP,
+                          "%s: Hardware cursor unimplemented\n", __func__);
+        }
         s->ccr = value & 0x81ffffe7;
         s->dma_ch[5].up = !!(value & CCR_CEN);
         break;
-- 
2.21.3


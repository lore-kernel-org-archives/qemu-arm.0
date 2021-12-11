Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583279lfk;
        Sat, 11 Dec 2021 11:11:39 -0800 (PST)
X-Received: by 2002:adf:ed88:: with SMTP id c8mr6523519wro.661.1639249899619;
        Sat, 11 Dec 2021 11:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249899; cv=none;
        d=google.com; s=arc-20160816;
        b=UMH9SROy/WIzYApvzurkp7AT12oM4qcAkSJEDGoViWCJbOSuYLU9eOQGBDUKyHC+pS
         YGrx+UVQ/UsvwZ/6ONHJb+c9Grz6A+krcqLuatFCUHd5cWZFNf0fW1Ks1fv1W8H8nBbO
         6iRDNpETNtlggNf8i4oXjmzGZnRBXik3uWdJ4dnGOVaoAId36m5CBGaDMSSfBt5xdAE+
         FIQmUtZ4iJEp3LApyO90+GAod/EPIRh+OHdhUqq1u+GnIrRssmp+P0HSaYCDAs3BdpzR
         vxObVWge3kiBt/D/TZ2d3Mo1op/repSj5Xa/ST7VUJjhTWXLNtht1kQiohBbPp6D0v+U
         toAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m/WoaEcAXkHQDQGnYA2VaWKRKb5cvTpqbwK+SMbmTCw=;
        b=gNKCY4eccQqJRfmGgBDjAN22eJTe5mbqqw0NbbU3xIPH2efWVWaV0gWOoPvtyrU9IE
         GIPadWb7UcyLROzXzpK8v8SIK4ak1PqEooMbop8qTKCkX0e2kKP3Os1looZxkQf7Am/l
         o/IKZr3irFpjq9m5wfBoBX1wIpVJ/3vipOk3KFGjoclAlR0YnT+RS7w5UNMvcDFwNl7z
         MQahWGRrXo73OhVXMdTLFDMX807rb+728vbc22NF1PRCeAlCXXQhxlHQxs4Cv9Jb+Ih/
         aHeNM5zEzNvyTkI2zlnZTYOCkk8OK6MPB/ate79bEjNM2RuhE/guIRYS5gvICfrhRHQf
         a5Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3Ph0Dfw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l10sor4216383wrz.52.2021.12.11.11.11.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3Ph0Dfw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m/WoaEcAXkHQDQGnYA2VaWKRKb5cvTpqbwK+SMbmTCw=;
        b=h3Ph0Dfws5fw5CWIFcyqSGOd4BHzj+ETZCT7WVSl6xmt6W3Thjony2p7hiWiKwvtWK
         IwKcsCLKPYwPS+TA34DDvlmsvf6va4oFsHlZW3+dj0er+cDtnUOFvBVzYlcPkMpPqDNp
         il1x+4nZHfhKd/vd8S639fKKhATJjyUbv+hshdUYBntkeYGmYSP81yXX0fgh12aBYjM2
         N4UMXjKLrrzf+5M/cp/gcwOJXkjJcCmTx2uAuB//4qGkQjKlotEUh0OWvhuE455wyApy
         82mmY/XMC39iouIkkvqURcvdZwESp8uSpJnMSd3nq+O+FhIuEnVocVIoBBuShDq5Vgc0
         3+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m/WoaEcAXkHQDQGnYA2VaWKRKb5cvTpqbwK+SMbmTCw=;
        b=tFsw5CJQnBLkG9wiu+X3t9sPIog0LohfrDO7oUJCTAZGCB6VOEJULdN+ANc0H/fBKg
         xBY58JcofhSG8TmS6MtbQ4s1qcTNMvDcEZilceZ5zFuTOKqBciLzgEIjfn1lgbjQeT93
         fES/V+kfeAhuBKDVcdkedgIUNakxkF8ZJMnWSq+i+/MiC+YSVQfB4YMH9J2HPDFAre0F
         oy/Sqb1K9QwHo1RgkNajmEgJ3loGyNnEoWJ2JaiFX8ysIRo3o/PGE2XldV8zQSQa2Pf0
         d1/75zyEg1g1hZLnoBMpufg7GtDofKWNyb/vYD5aWywJzmthnExdnESEKTYe13wE1dGP
         cGfg==
X-Gm-Message-State: AOAM53238LcE/4Q7tvkwZfSfLee8UHVi/4WNKZJvFiKYEzN951ffWxpj
	+eqjP+v7S69bxm45IrobLSMtJDti/L9cjiUE
X-Google-Smtp-Source: ABdhPJx4SRFNU7p8nQvtpgAB8WK/xT31yhvdKstuX8+r8wYfyCfSnyfuPN14zvbW2YA06fnqOWSybA==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr22091003wrq.194.1639249899312;
        Sat, 11 Dec 2021 11:11:39 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 03/26] hw/intc/arm_gicv3_its: Remove redundant ITS_CTLR_ENABLED define
Date: Sat, 11 Dec 2021 19:11:12 +0000
Message-Id: <20211211191135.1764649-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iuEGbz9TrN+u

We currently define a bitmask for the GITS_CTLR ENABLED bit in
two ways: as ITS_CTLR_ENABLED, and via the FIELD() macro as
R_GITS_CTLR_ENABLED_MASK. Consistently use the FIELD macro version
everywhere and remove the redundant ITS_CTLR_ENABLED define.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  2 --
 hw/intc/arm_gicv3_its.c  | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index b9c37453b04..63de8667c61 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -289,8 +289,6 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 
 #define GITS_IDREGS           0xFFD0
 
-#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
-
 #define GITS_BASER_RO_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK | \
                                               R_GITS_BASER_TYPE_MASK)
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 677b96dfe23..985ae03f5fc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -651,7 +651,7 @@ static void process_cmdq(GICv3ITSState *s)
     uint8_t cmd;
     int i;
 
-    if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+    if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
         return;
     }
 
@@ -887,7 +887,7 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
 
     switch (offset) {
     case GITS_TRANSLATER:
-        if (s->ctlr & ITS_CTLR_ENABLED) {
+        if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
             devid = attrs.requester_id;
             result = process_its_cmd(s, data, devid, NONE);
         }
@@ -912,13 +912,13 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
     switch (offset) {
     case GITS_CTLR:
         if (value & R_GITS_CTLR_ENABLED_MASK) {
-            s->ctlr |= ITS_CTLR_ENABLED;
+            s->ctlr |= R_GITS_CTLR_ENABLED_MASK;
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
             process_cmdq(s);
         } else {
-            s->ctlr &= ~ITS_CTLR_ENABLED;
+            s->ctlr &= ~R_GITS_CTLR_ENABLED_MASK;
         }
         break;
     case GITS_CBASER:
@@ -926,7 +926,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 0, 32, value);
             s->creadr = 0;
             s->cwriter = s->creadr;
@@ -937,7 +937,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 32, 32, value);
             s->creadr = 0;
             s->cwriter = s->creadr;
@@ -979,7 +979,7 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
 
             if (offset & 7) {
@@ -1076,7 +1076,7 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_BASERn register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             index = (offset - GITS_BASER) / 8;
             s->baser[index] &= GITS_BASER_RO_MASK;
             s->baser[index] |= (value & ~GITS_BASER_RO_MASK);
@@ -1087,7 +1087,7 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
          * IMPDEF choice:- GITS_CBASER register becomes RO if ITS is
          *                 already enabled
          */
-        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
+        if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = value;
             s->creadr = 0;
             s->cwriter = s->creadr;
@@ -1298,7 +1298,7 @@ static void gicv3_its_reset(DeviceState *dev)
 
 static void gicv3_its_post_load(GICv3ITSState *s)
 {
-    if (s->ctlr & ITS_CTLR_ENABLED) {
+    if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
         extract_table_params(s);
         extract_cmdq_params(s);
     }
-- 
2.25.1

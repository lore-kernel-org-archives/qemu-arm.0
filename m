Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp252565njc;
        Sat, 8 Mar 2025 11:04:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHUN6sjGOpkm47Dw8NE8CWaZqX/+DhubnIQtcAl5HV1WGzxK+4R4zR8wdfD2/vHwmo0pHvsLXA2CIq3w==@linaro.org
X-Google-Smtp-Source: AGHT+IFtU45rfPkvwtsVJI4M9JaMeNWA08/VrtRMKTD0aM1+EOPctfb+em9W9Vt8KKZ4TPbzpaXj
X-Received: by 2002:a05:620a:6604:b0:7c3:cbad:5735 with SMTP id af79cd13be357-7c53c8d94e6mr656198185a.28.1741460680495;
        Sat, 08 Mar 2025 11:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460680; cv=none;
        d=google.com; s=arc-20240605;
        b=R/ai9E7iu1i7d7zbboX0sGMMB4NrAZWb0wZOlfRZDhpEKLuAvbey2GFMBDC4IYyCAY
         Md9gY/F1Zr3rR0W7JCSUKKVcRt1AD4cVK4Z18ETETRH3klETsFiXKmGG70hgIZVNLlF9
         6F0xWE+hAn77lqZFyh3DioBDRwZKKU/yvc+Pg0F92gVViRaqap5bZ2rbSQpoz2wLPMaF
         t4pKI5KEcCu2GQsKyjl5zcE4K0Wm72kwE8SHi3XfTgZjquhNP3vRXMlODvD2IZcYf1hc
         +133cGP+z5AGjepVd0MZP6gfeFvxhj2tPwBoBRlk99UaNfl6EyPgcv4SRhe5lDNoNpDC
         /o0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DdQ356KPyw7Fp0a97T7o8FXWBighqGS1ZACq8XsdKoI=;
        fh=+bAainw22awg1aZKfKagm54jCF3aGLJuPGYXoiRF6gM=;
        b=BINTiKWwTZbrSHxhQOAtcM67R4gUx8Oh6B1RzwTPSlgF7/vmnfkJA0mGDLlIRGosbP
         m0cThn8VubFQ0jLi/jcPqgfWOz2HH/mPu1rHIkverUiCY5ywOFb4dpxGfBuvXoRPcPAl
         F1yVgaVmx99RQcZbmtCVbt3ga38pYJ233ts+SGhSOSj7+27pv7NxQdW/nqwwE0bw/c2q
         rWJokeRQK6iqNfQ2gthjGfYw4en+r4ueUT3ZH1fp9oOyxN3dz7ew40hKlNlcWhGOVqci
         KxQ/FvkyIFmNbK5IwznBTNVyCUBKlPqVLj4LwhmYZdcxR/Ac25Yp+lAWYlxuUHibKHfT
         6dOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=THyi2zKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5547640si607241585a.572.2025.03.08.11.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=THyi2zKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzSM-0007eb-Nd; Sat, 08 Mar 2025 14:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzSG-0007Rc-PD
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:25 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzSE-0003dn-78
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3912c09bea5so2230683f8f.1
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460601; x=1742065401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdQ356KPyw7Fp0a97T7o8FXWBighqGS1ZACq8XsdKoI=;
 b=THyi2zKKUJ305BRTeD9ifIzEjRK3s1OFxxTwTJ2MmCKTefKC5Th1HmW5LPnXUx+S3z
 HiAvRdK3YUMZQNf0w+xZP8e+11ScLKB0kpdy3kKIgqXDy0NFG05p+fKFV8KOCZ62z/Yk
 Igckkx2Z8cTwsPRZ3GUJAw6tBBXRgcUqS2KZpNlKFtABfGjFuRBbOewHnn2vBqkc8/2L
 V/FSmu9HHoHUgJfWnLrpRT/PGY8rbcVK0zlr30hBENn7Gl+/+vLf5x6IXxcuLk5n05J9
 9QJwGUkRWw/3XUQEvmCNPW1fkI4kTYsKNxY7G9FOJj7OkONN+r2mEx8tX4qDSSanCKM5
 d6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460601; x=1742065401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DdQ356KPyw7Fp0a97T7o8FXWBighqGS1ZACq8XsdKoI=;
 b=VgdOlfx9FPFf5wVv9wEzPd0neG1CaL2eRRApYDTa7H0opGofnI1GnwyMQI7OYhgDeS
 35Rvh9ysB7bZ89Hyb9+k3G4UKVmqVYA/s3HZt1JEHvmoGovJfXqeHbRnkXxOSIAVTyhQ
 UuqI+qI/S9T1rtQJzHlPOIKaBE3o02t2blQmq1Y1AJyJ3SaGYT+gw4Ob6uMmz2wgG2wz
 kfzxIqFemalx7AdgOEh3LoxiTRaXMaWd1yOet4r7//r8lPh/klrcvpwGlhcItgkDvmU4
 w+h1+ndWtIEIMZ78nepl8QTwgG98q2+ymd/2/8Gyj+sACqtNwTuvV8x7ddKN2Zr+6QTH
 CLUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzqXLUTmviI2Hn5t+lloCjkw6RFhiEojF16XyIa2L8pPi8xXpIV+RIEvlUgxvF1pf3I4BF7QPbdg==@nongnu.org
X-Gm-Message-State: AOJu0Yz73ngHimd/kajBMxug6vDnG462H0Cg7m54NoiKBk758y6Wew6b
 SH295x8suwzfDoTvYYwRrhYeIC3+cF88guN50hgvo6oaa4oZG9xxeBZyOHMfL9c=
X-Gm-Gg: ASbGncvErxwhe5vnmP2i7qb7lJ2oobuWVw78SE3dqLyipMTrp7eBCRpF12BbMdx2p2H
 J4eSjrMjdBWkOTBOcxG2i+6T0fzkwdZ89MwT9Sq5dgweUnvAoEBzm3pIoMr9MWokepzSde9hrm3
 vzFlP1aBQe1HywbWkvB0unjns3gecbGzAV/hahIqYEKZmT8Uem6Yz1bA/5ID3k7er1Ahf44XNU+
 b5t4FVhdaPqIR5LvwXpZgLsTgDGHX7VsZ8tTfXjn95TVYnfNtiFW+Vgv2LU3g9X3cZ7DG3cSUTS
 EvV1PhG09R5YjjDJ/lFEyIvU+7Sn0mtmoEGFreucGI7UknfTwmffLhXcka3ydFDKi+37V7qQ1Sb
 zZskffYDXLA9ugi/FRUNmhVXQW1M4Tw==
X-Received: by 2002:a05:6000:144d:b0:385:faaa:9d1d with SMTP id
 ffacd0b85a97d-39132d98bc3mr6314885f8f.35.1741460600656; 
 Sat, 08 Mar 2025 11:03:20 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c10437dsm9772819f8f.99.2025.03.08.11.03.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 10/12] hw/sd/sdhci: Allow SDHCI classes to have different
 register reset values
Date: Sat,  8 Mar 2025 20:02:28 +0100
Message-ID: <20250308190230.7508-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r3lBVJxeVkxg

For the registers which are not zeroed at reset, allow the
different implementations to set particular reset values.

Remove the misleading values commented in sdhci-internal.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci-internal.h | 24 ++++++++++++------------
 include/hw/sd/sdhci.h  | 20 ++++++++++++++++++++
 hw/sd/sdhci.c          | 14 ++++++++++++++
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 9072b06bdde..d99a8493db2 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -70,7 +70,7 @@
 /* R/W Buffer Data Register 0x0 */
 #define SDHC_BDATA                     0x20
 
-/* R/ROC Present State Register 0x000A0000 */
+/* R/ROC Present State Register */
 #define SDHC_PRNSTS                    0x24
 #define SDHC_CMD_INHIBIT               0x00000001
 #define SDHC_DATA_INHIBIT              0x00000002
@@ -88,7 +88,7 @@ FIELD(SDHC_PRNSTS, CMD_LVL,            24, 1);
 #define TRANSFERRING_DATA(x)           \
     ((x) & (SDHC_DOING_READ | SDHC_DOING_WRITE))
 
-/* R/W Host control Register 0x0 */
+/* R/W Host control Register */
 #define SDHC_HOSTCTL                   0x28
 #define SDHC_CTRL_LED                  0x01
 #define SDHC_CTRL_DATATRANSFERWIDTH    0x02 /* SD mode only */
@@ -104,17 +104,17 @@ FIELD(SDHC_PRNSTS, CMD_LVL,            24, 1);
 #define SDHC_CTRL_CDTEST_INS           0x40
 #define SDHC_CTRL_CDTEST_EN            0x80
 
-/* R/W Power Control Register 0x0 */
+/* R/W Power Control Register */
 #define SDHC_PWRCON                    0x29
 #define SDHC_POWER_ON                  (1 << 0)
 FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
 
-/* R/W Block Gap Control Register 0x0 */
+/* R/W Block Gap Control Register */
 #define SDHC_BLKGAP                    0x2A
 #define SDHC_STOP_AT_GAP_REQ           0x01
 #define SDHC_CONTINUE_REQ              0x02
 
-/* R/W WakeUp Control Register 0x0 */
+/* R/W WakeUp Control Register */
 #define SDHC_WAKCON                    0x2B
 #define SDHC_WKUP_ON_INS               (1 << 1)
 #define SDHC_WKUP_ON_RMV               (1 << 2)
@@ -128,17 +128,17 @@ FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
 #define SDHC_CLOCK_IS_ON(x)            \
     (((x) & SDHC_CLOCK_CHK_MASK) == SDHC_CLOCK_CHK_MASK)
 
-/* R/W Timeout Control Register 0x0 */
+/* R/W Timeout Control Register */
 #define SDHC_TIMEOUTCON                0x2E
 FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
 
-/* R/W Software Reset Register 0x0 */
+/* R/W Software Reset Register */
 #define SDHC_SWRST                     0x2F
 #define SDHC_RESET_ALL                 0x01
 #define SDHC_RESET_CMD                 0x02
 #define SDHC_RESET_DATA                0x04
 
-/* ROC/RW1C Normal Interrupt Status Register 0x0 */
+/* ROC/RW1C Normal Interrupt Status Register */
 #define SDHC_NORINTSTS                 0x30
 #define SDHC_NIS_ERR                   0x8000
 #define SDHC_NIS_CMDCMP                0x0001
@@ -151,7 +151,7 @@ FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
 #define SDHC_NIS_REMOVE                0x0080
 #define SDHC_NIS_CARDINT               0x0100
 
-/* ROC/RW1C Error Interrupt Status Register 0x0 */
+/* ROC/RW1C Error Interrupt Status Register */
 #define SDHC_ERRINTSTS                 0x32
 #define SDHC_EIS_CMDTIMEOUT            0x0001
 #define SDHC_EIS_BLKGAP                0x0004
@@ -159,7 +159,7 @@ FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
 #define SDHC_EIS_CMD12ERR              0x0100
 #define SDHC_EIS_ADMAERR               0x0200
 
-/* R/W Normal Interrupt Status Enable Register 0x0 */
+/* R/W Normal Interrupt Status Enable Register */
 #define SDHC_NORINTSTSEN               0x34
 #define SDHC_NISEN_CMDCMP              0x0001
 #define SDHC_NISEN_TRSCMP              0x0002
@@ -170,7 +170,7 @@ FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
 #define SDHC_NISEN_REMOVE              0x0080
 #define SDHC_NISEN_CARDINT             0x0100
 
-/* R/W Error Interrupt Status Enable Register 0x0 */
+/* R/W Error Interrupt Status Enable Register */
 #define SDHC_ERRINTSTSEN               0x36
 #define SDHC_EISEN_CMDTIMEOUT          0x0001
 #define SDHC_EISEN_BLKGAP              0x0004
@@ -205,7 +205,7 @@ FIELD(SDHC_HOSTCTL2, VERSION4,        12, 1); /* since v4 */
 FIELD(SDHC_HOSTCTL2, ASYNC_INT,       14, 1);
 FIELD(SDHC_HOSTCTL2, PRESET_ENA,      15, 1);
 
-/* HWInit Capabilities Register 0x05E80080 */
+/* HWInit Capabilities Register */
 #define SDHC_CAPAB                     0x40
 FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
 FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 53aef17ad34..e24392eb10d 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -116,6 +116,26 @@ typedef struct SDHCIClass {
     uint32_t quirks;
     uint64_t iomem_size;
 
+    /* Default reset values */
+    struct {
+        uint32_t sdmasysad;
+
+        uint16_t blksize;
+        uint16_t blkcnt;
+
+        uint32_t prnsts;
+
+        uint8_t  hostctl1;
+        uint8_t  pwrcon;
+        uint8_t  blkgap;
+        uint8_t  wakcon;
+
+        uint16_t clkcon;
+        uint8_t  timeoutcon;
+
+        uint16_t norintstsen;
+        uint16_t errintstsen;
+    } reset;
     /* Read-only registers */
     struct {
         uint64_t capareg;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f08918587ef..cda608f8ec2 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -294,6 +294,7 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 
 static void sdhci_reset(SDHCIState *s)
 {
+    SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
     DeviceState *dev = DEVICE(s);
 
     timer_del(s->insert_timer);
@@ -306,6 +307,19 @@ static void sdhci_reset(SDHCIState *s)
      */
     memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
 
+    s->sdmasysad = sc->reset.sdmasysad;
+    s->blksize = sc->reset.blksize;
+    s->blkcnt = sc->reset.blkcnt;
+    s->prnsts = sc->reset.prnsts;
+    s->hostctl1 = sc->reset.hostctl1;
+    s->pwrcon = sc->reset.pwrcon;
+    s->blkgap = sc->reset.blkgap;
+    s->wakcon = sc->reset.wakcon;
+    s->clkcon = sc->reset.clkcon;
+    s->timeoutcon = sc->reset.timeoutcon;
+    s->norintstsen = sc->reset.norintstsen;
+    s->errintstsen = sc->reset.errintstsen;
+
     /* Reset other state based on current card insertion/readonly status */
     sdhci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
     sdhci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
-- 
2.47.1


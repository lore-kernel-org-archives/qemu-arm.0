Received: by 10.28.173.206 with SMTP id w197csp2610880wme;
        Mon, 8 Jan 2018 07:44:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBouIcBxHDNM698GUQNJw3fF0ZAvJnwZtvmEhhorHd7zejllv8so/P7BIoDFJ4bZXrAAnylXM
X-Received: by 10.37.179.23 with SMTP id l23mr11154938ybj.255.1515426240563;
        Mon, 08 Jan 2018 07:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426240; cv=none;
        d=google.com; s=arc-20160816;
        b=skXedNbR+EThvUyM0PKL/SUNdh9gQdbjUm3BCAyh/r+SMGEoUbugfnCKZYIAaQJhyK
         3UXIJHi55w+2KBDuiLV9hxQMBLBy7r1W48iv8YAOjw2YKpkL4w9PSGHzqyKD/l3PQ2cN
         lRzasqV+wZXyCazY3gkLGjofYQZqNztDPTRaWPrxv8FH0Qk8AFvyy4gLU/41XR3JO/X3
         3wUcczAtlzI8/i1x4S3Xqw++PNVmhjGvr7NqVR/XouMXlovuVklvm0PZkzHgNyuNpnZr
         KY/gaE1tYgqo/H/fgIHx4xZjnT53aO8goP75WgGC5FEUd6ePyJIcnaja0ObcUdfbKrJT
         FO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=A3tFw7iQcd2iAvav3zBQa7pgS4zm53KKebvudYiTcW8=;
        b=BYLGjaddTH8HwK62oOFDk7AqpY79Jh6Ps/k7bH/AQCIRoBQ4kgWqksMDMjyE2SHSdu
         oKwKSzO+o/pw76gQCXsEnAUCcygxRxM0+WadrrtgiRlLNzQPRGpTRjRL/zpKj2688TKG
         CvYkg9WmkZs/hWJN3L3crH4yJzgGMMuPghKp3E2mimIOTvXo2OWUG5jJgO+CgyrcJhUn
         ml0bgZlMhe8NyCXNQTjosM5ayPP1Kzyf9l2ChzGWaAlWmHEFrgjlLSEYVL6UCNuIfEJa
         cciL5k9zDkI8OI3vewKn06wHXFQ5w52SvTe8ganGizRPAPd2teO+uCq9gKltAi4LaDOl
         9JTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rpBrH46V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4si2556491ybk.558.2018.01.08.07.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rpBrH46V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZai-0001LA-07
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:44:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaM-0001Dg-Rm
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaL-00074Z-G6
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:43:38 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaG-00070B-1t; Mon, 08 Jan 2018 10:43:32 -0500
Received: by mail-qk0-x241.google.com with SMTP id j137so14639847qke.10;
	Mon, 08 Jan 2018 07:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=A3tFw7iQcd2iAvav3zBQa7pgS4zm53KKebvudYiTcW8=;
	b=rpBrH46VhszNra2dyLD2CQe608W3NR1/3YlPTOsAskmvMyN21KH71W9gHAscm3cyAX
	elkNiOEV2Whdfk5bcdsprK6DHKZkThKDlyahy0xu8r27NvAnXF5k51FaolNI7Gvt/DQM
	YU8hozDglsd+tZCdxRFg5bd94sOP5kIT3qO98jJFpufdiADM6PFnuTcsXBTNDBlmM+Dp
	Zk3M8QrsSDttwKnnM3hIoVvGFJl3AX062l8kgM8BMiUi+Z2MZ5oe8k6X/GQsGJsZrB9x
	UwfWe3udXdPGbDq3aaQZCR38fvhVwlO/Zh20Dw1ohFRaBs3x3ju0/c/jleQj9lskBHRo
	dYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=A3tFw7iQcd2iAvav3zBQa7pgS4zm53KKebvudYiTcW8=;
	b=o789K91K6yoL9FPtwPIQtfLlIJm7u+j3pOOdcgye/Vb+0nrgyV7t1VuPE7/ySldREq
	Vfscf5Fc8D+ypJzeZWyrb44WGOE7jX5Lfl2qqtbDY93B57C7ziZn0erYIgtJKtFBFHd/
	p3JQYhDnySekmOsBN28igoX23Bf0bUM1Hb4PFjiCPuphJ/DyF7HSxyBtwVcfLjXCSjbN
	1YtjZCO1XioSZxdIqUiMRevgRxHyirUVK478T4eof3osaxc6719v8jE8tPRGwlTmOQOn
	48aHlV0KNtqGao7gd9pShTyels3gucYb3TKVV6KMP0RZAFaetDaAyv3T2tRU+fJdEyEj
	UAoQ==
X-Gm-Message-State: AKGB3mICFCgJaNvEz2F4kkusqukBkhONWfBaonulXXLVG9YN09c+Kmwn
	oINfQHoXzn4lQsbnJdfA4N8=
X-Received: by 10.55.121.196 with SMTP id u187mr17321514qkc.215.1515426211387; 
	Mon, 08 Jan 2018 07:43:31 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:34 -0300
Message-Id: <20180108154303.6522-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v5 02/31] sdhci: add basic Spec v1 capabilities
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kOT1F9RflupH

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 22 ++++++++++++++++++-
 include/hw/sd/sdhci.h  |  6 ++++++
 hw/sd/sdhci.c          | 58 ++++++++++++++++++++++++++++++++++++--------------
 3 files changed, 69 insertions(+), 17 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index cf4a055159..6944fcaf00 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -86,6 +86,9 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
 
 /* R/W Host control Register 0x0 */
 #define SDHC_HOSTCTL                   0x28
+FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
+FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
+FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
 #define SDHC_CTRL_DMA_CHECK_MASK       0x18
 #define SDHC_CTRL_SDMA                 0x00
 #define SDHC_CTRL_ADMA1_32             0x08
@@ -96,6 +99,7 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
 /* R/W Power Control Register 0x0 */
 #define SDHC_PWRCON                    0x29
 #define SDHC_POWER_ON                  (1 << 0)
+FIELD(SDHC_PWRCON, BUS_VOLTAGE,        1, 3);
 
 /* R/W Block Gap Control Register 0x0 */
 #define SDHC_BLKGAP                    0x2A
@@ -118,6 +122,7 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
 
 /* R/W Timeout Control Register 0x0 */
 #define SDHC_TIMEOUTCON                0x2E
+FIELD(SDHC_TIMEOUTCON, COUNTER,        0, 4);
 
 /* R/W Software Reset Register 0x0 */
 #define SDHC_SWRST                     0x2F
@@ -174,17 +179,32 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
 
 /* ROC Auto CMD12 error status register 0x0 */
 #define SDHC_ACMD12ERRSTS              0x3C
+FIELD(SDHC_ACMD12ERRSTS, TIMEOUT_ERR,  1, 1);
+FIELD(SDHC_ACMD12ERRSTS, CRC_ERR,      2, 1);
+FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
 
 /* HWInit Capabilities Register 0x05E80080 */
 #define SDHC_CAPAB                     0x40
-#define SDHC_CAN_DO_DMA                0x00400000
 #define SDHC_CAN_DO_ADMA2              0x00080000
 #define SDHC_CAN_DO_ADMA1              0x00100000
 #define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
 #define SDHC_CAPAB_BLOCKSIZE(x)        (((x) >> 16) & 0x3)
+FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
+FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
+FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
+FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
+FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
+FIELD(SDHC_CAPAB, SDMA,               22, 1);
+FIELD(SDHC_CAPAB, SUSPRESUME,         23, 1);
+FIELD(SDHC_CAPAB, V33,                24, 1);
+FIELD(SDHC_CAPAB, V30,                25, 1);
+FIELD(SDHC_CAPAB, V18,                26, 1);
 
 /* HWInit Maximum Current Capabilities Register 0x0 */
 #define SDHC_MAXCURR                   0x48
+FIELD(SDHC_MAXCURR, V33_VDD1,          0, 8);
+FIELD(SDHC_MAXCURR, V30_VDD1,          8, 8);
+FIELD(SDHC_MAXCURR, V18_VDD1,         16, 8);
 
 /* W Force Event Auto CMD12 Error Interrupt Register 0x0000 */
 #define SDHC_FEAER                     0x50
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index ddd5040410..266030dc8d 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -102,6 +102,12 @@ typedef struct SDHCIState {
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint8_t spec_version;
+    struct {
+        bool suspend;
+        bool high_speed;
+        bool sdma;
+        bool v33, v30, v18;
+    } cap;
 } SDHCIState;
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index cd4a8efdd7..e7dbab2fdc 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -44,12 +44,6 @@
  * 0 - not supported, 1 - supported, other - prohibited.
  */
 #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Support */
-#define SDHC_CAPAB_18V            1ul        /* Voltage support 1.8v */
-#define SDHC_CAPAB_30V            0ul        /* Voltage support 3.0v */
-#define SDHC_CAPAB_33V            1ul        /* Voltage support 3.3v */
-#define SDHC_CAPAB_SUSPRESUME     0ul        /* Suspend/resume support */
-#define SDHC_CAPAB_SDMA           1ul        /* SDMA support */
-#define SDHC_CAPAB_HIGHSPEED      1ul        /* High speed support */
 #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
 #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
 /* Maximum host controller R/W buffers size
@@ -63,9 +57,7 @@
 #define SDHC_CAPAB_TOCLKFREQ      52ul
 
 /* Now check all parameters and calculate CAPABILITIES REGISTER value */
-#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_18V > 1 || SDHC_CAPAB_30V > 1 ||     \
-    SDHC_CAPAB_33V > 1 || SDHC_CAPAB_SUSPRESUME > 1 || SDHC_CAPAB_SDMA > 1 ||  \
-    SDHC_CAPAB_HIGHSPEED > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1 ||\
+#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1 || \
     SDHC_CAPAB_TOUNIT > 1
 #error Capabilities features can have value 0 or 1 only!
 #endif
@@ -90,16 +82,33 @@
 #endif
 
 #define SDHC_CAPAB_REG_DEFAULT                                 \
-   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_18V << 26) |     \
-    (SDHC_CAPAB_30V << 25) | (SDHC_CAPAB_33V << 24) |          \
-    (SDHC_CAPAB_SUSPRESUME << 23) | (SDHC_CAPAB_SDMA << 22) |  \
-    (SDHC_CAPAB_HIGHSPEED << 21) | (SDHC_CAPAB_ADMA1 << 20) |  \
+   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
     (SDHC_CAPAB_ADMA2 << 19) | (MAX_BLOCK_LENGTH << 16) |      \
     (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
     (SDHC_CAPAB_TOCLKFREQ))
 
 #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
 
+static void sdhci_init_capareg(SDHCIState *s, Error **errp)
+{
+    uint64_t capareg = 0;
+
+    switch (s->spec_version) {
+    case 1:
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.high_speed);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.suspend);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V33, s->cap.v33);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V30, s->cap.v30);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, V18, s->cap.v18);
+        break;
+
+    default:
+        error_setg(errp, "Unsupported spec version: %u", s->spec_version);
+    }
+    s->capareg = capareg;
+}
+
 static uint8_t sdhci_slotint(SDHCIState *s)
 {
     return (s->norintsts & s->norintsigen) || (s->errintsts & s->errintsigen) ||
@@ -1032,7 +1041,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     case SDHC_TRNMOD:
         /* DMA can be enabled only if it is supported as indicated by
          * capabilities register */
-        if (!(s->capareg & SDHC_CAN_DO_DMA)) {
+        if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
             value &= ~SDHC_TRNS_DMA;
         }
         MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
@@ -1186,6 +1195,10 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
         return;
     }
     s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
+
+    if (s->capareg == UINT64_MAX) {
+        sdhci_init_capareg(s, errp);
+    }
 }
 
 static void sdhci_initfn(SDHCIState *s)
@@ -1305,8 +1318,21 @@ const VMStateDescription sdhci_vmstate = {
  * specific host controller implementation */
 static Property sdhci_properties[] = {
     DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
-    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
-            SDHC_CAPAB_REG_DEFAULT),
+
+    /* DMA */
+    DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
+    /* Suspend/resume support */
+    DEFINE_PROP_BOOL("suspend", SDHCIState, cap.suspend, false),
+    /* High speed support */
+    DEFINE_PROP_BOOL("high-speed", SDHCIState, cap.high_speed, true),
+    /* Voltage support 3.3/3.0/1.8V */
+    DEFINE_PROP_BOOL("3v3", SDHCIState, cap.v33, true),
+    DEFINE_PROP_BOOL("3v0", SDHCIState, cap.v30, false),
+    DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
+
+    /* capareg: deprecated */
+    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
+
     DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
-- 
2.15.1


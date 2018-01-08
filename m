Received: by 10.28.173.206 with SMTP id w197csp2616203wme;
        Mon, 8 Jan 2018 07:49:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBovBflUGXCgxf1ccK8g0WXfiBSG/IkHpktXdI55QRvVM1vtm30AQVqazhAziwgRnEperrh4d
X-Received: by 10.13.254.131 with SMTP id o125mr6157376ywf.185.1515426559482;
        Mon, 08 Jan 2018 07:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426559; cv=none;
        d=google.com; s=arc-20160816;
        b=oDWE8e4l0uXA1gjo1x3fvYp9EQoTykOwUYII7cOW/F+5lpMcMsd1Q6t+grO15pUt1p
         BwWw+low6/bsMd2HjLE/NLWz+6cMnb+q0+rS9zAl6soiPktf/WBFo6IVLHg1YTB84mlx
         9NjymH0riSkMC9fY9IpgcLIrL2PMK1q9mulF4Bv+XuDxRTSe261kVXjreSH+Kh4lDwUn
         vmTSeL/G5yUVdSijImt4ecOb8lJ8Przn+imNzDaz6kQFFPT9M3pOw01iXqeYFdJmWE1K
         UrD6rnw9kxi+nc+tQXxHtgw8BI1u93vGk19dZ8j7mArf0vTFFKkF8/s3bOT6Xw9Xl2jK
         ONHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+vTQqOxYTzbAsYf8IrzRmG6cLGyqRv5XVXQacX/jIQU=;
        b=kV5xB+KziRXX9zGZ4X766nB7FkmH+rXDm/l9sk9CliAb65mlvq/SDkGk+F/bIXaTzS
         fA1xUW/sbnYyZpENucCoIRQlFmPDtCqroffyEo5tbo8L+WivyQBZradmRYEFAPB6pM2i
         iHj+YrRVf05J+4BAml9Cfxv8OCNS3OC7VIyguVIt74MK8/BEeaUqLwt64Q8iLya7N1fl
         tSRafEP9cwGQCx8LIJsI5eAGyC4kPoprv3DdbNrbWWIeYKnooHXn0ckLGPNJqtsiyxFO
         7B7yPbqQwsgL/ooTWVDPVLOClEszzn4N5b+7LswTKZa7fzRczzIt20Jo+b63yN84ydFs
         fsOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U9ofv5qc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d123si2511456ywf.261.2018.01.08.07.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U9ofv5qc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZfq-0005WY-R2
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:49:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaX-0001MA-5W
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaV-0007Dt-RJ
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:43:49 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:44638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaV-0007Db-M4; Mon, 08 Jan 2018 10:43:47 -0500
Received: by mail-qk0-x242.google.com with SMTP id v188so14616595qkh.11;
	Mon, 08 Jan 2018 07:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+vTQqOxYTzbAsYf8IrzRmG6cLGyqRv5XVXQacX/jIQU=;
	b=U9ofv5qcuowCLuSC9nxstowc55vAFJ8rnfl3ZHJhn9kAFDqBCnTZMFPGvG/aghU1YH
	PHA8kVwDNUOd1A+jfN32+Be9pPzgIN/6TK1764DqERIedDqVDFNrsXibX6c6jFyC0ypT
	+QVdC5hou9a2ht02dFhWERs8PihcW/EkW0UPQRKSry1sgCgkmwyOVXdYuwO7NqZJbkde
	9IOVagQpO9aWFPsYdniXDtrBek0cn+ftrFHdJsHvHoxHfgvF0OFMwbZtt3/MkZLf5wqS
	HDWllBoCvSNXWRSrXk2B5GeUQtRQIFwB8l9LXX2TFa7CPiMMDiam8I25E+F6SxAK8TLg
	jl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+vTQqOxYTzbAsYf8IrzRmG6cLGyqRv5XVXQacX/jIQU=;
	b=WpNW22/AoQhmKoYbQOq4dG/a8wUSu2e7udibLWMd1ZlnilGgYRcIJr5Z4DoIrXBHK3
	Ctm9IWZo6g4kdk9YD6vuN+M+5rpUlQrCmtvx6Jud/cYmah8TgJtHW6b3IjyMGonXl5Q+
	kvIxJ3zuwLu7TWJUlx/iSP24AYzLp0vhY/reosQUNelfRqeR4ehUdPio82frdFPqU8Jt
	5OBB/1Pmw6xmO+ptw99mL4cPqnQTJq+cgWqnPIckSejzUSEbMQeiF1gVBdzA6emEp2bN
	z7CSt5U85a/PVbUqEz5eqwCcR6eDawXrDNKLGcgF3Q1bAdMUI6+75NH1AQiw0HrHZzxo
	S6Zg==
X-Gm-Message-State: AKwxytcBLY9A+EeBzCryNeg2W01YjWVBvkrHfz6Ff9DZYGlyvyM7R0B+
	67+pwcw1Uy7EoxDeDFmy1ac=
X-Received: by 10.55.162.140 with SMTP id l134mr17011401qke.124.1515426227043; 
	Mon, 08 Jan 2018 07:43:47 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:37 -0300
Message-Id: <20180108154303.6522-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v5 05/31] sdhci: add DMA and 64-bit
 capabilities (Spec v2)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IPIgcDjtqVhY

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 14 +++++++-------
 include/hw/sd/sdhci.h  |  4 ++++
 hw/sd/sdhci.c          | 40 ++++++++++++++++++----------------------
 3 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 0561e6eaf7..affbe4015c 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -89,12 +89,12 @@ FIELD(SDHC_PRNSTS, WRITE_PROTECT,      19, 1);
 FIELD(SDHC_HOSTCTL, LED_CTRL,          0, 1);
 FIELD(SDHC_HOSTCTL, DATATRANSFERWIDTH, 1, 1); /* SD mode only */
 FIELD(SDHC_HOSTCTL, HIGH_SPEED,        2, 1);
-#define SDHC_CTRL_DMA_CHECK_MASK       0x18
+FIELD(SDHC_HOSTCTL, DMA,               3, 2);
 #define SDHC_CTRL_SDMA                 0x00
-#define SDHC_CTRL_ADMA1_32             0x08
+#define SDHC_CTRL_ADMA1_32             0x08 /* NOT ALLOWED since v2 */
 #define SDHC_CTRL_ADMA2_32             0x10
-#define SDHC_CTRL_ADMA2_64             0x18
-#define SDHC_DMA_TYPE(x)               ((x) & SDHC_CTRL_DMA_CHECK_MASK)
+#define SDHC_CTRL_ADMA2_64             0x18 /* only v1 & v2 (v3 optional) */
+#define SDHC_DMA_TYPE(x)               ((x) & R_SDHC_HOSTCTL_DMA_MASK)
 
 /* R/W Power Control Register 0x0 */
 #define SDHC_PWRCON                    0x29
@@ -185,19 +185,19 @@ FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
 
 /* HWInit Capabilities Register 0x05E80080 */
 #define SDHC_CAPAB                     0x40
-#define SDHC_CAN_DO_ADMA2              0x00080000
-#define SDHC_CAN_DO_ADMA1              0x00100000
-#define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
 FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
 FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
 FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
 FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
+FIELD(SDHC_CAPAB, ADMA2,              19, 1); /* since v2 */
+FIELD(SDHC_CAPAB, ADMA1,              20, 1); /* v1 only? */
 FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
 FIELD(SDHC_CAPAB, SDMA,               22, 1);
 FIELD(SDHC_CAPAB, SUSPRESUME,         23, 1);
 FIELD(SDHC_CAPAB, V33,                24, 1);
 FIELD(SDHC_CAPAB, V30,                25, 1);
 FIELD(SDHC_CAPAB, V18,                26, 1);
+FIELD(SDHC_CAPAB, BUS64BIT,           28, 1); /* since v2 */
 
 /* HWInit Maximum Current Capabilities Register 0x0 */
 #define SDHC_MAXCURR                   0x48
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index c1602becd2..4a9c3e9175 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -103,6 +103,7 @@ typedef struct SDHCIState {
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint8_t spec_version;
     struct {
+        /* v1 */
         uint8_t timeout_clk_freq, base_clk_freq_mhz;
         bool timeout_clk_in_mhz;
         uint16_t max_blk_len;
@@ -110,6 +111,9 @@ typedef struct SDHCIState {
         bool high_speed;
         bool sdma;
         bool v33, v30, v18;
+        /* v2 */
+        bool adma1, adma2;
+        bool bus64;
     } cap;
 } SDHCIState;
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 05681c86d6..56466e0427 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -38,24 +38,6 @@
 #define TYPE_SDHCI_BUS "sdhci-bus"
 #define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SDHCI_BUS)
 
-/* Default SD/MMC host controller features information, which will be
- * presented in CAPABILITIES register of generic SD host controller at reset.
- * If not stated otherwise:
- * 0 - not supported, 1 - supported, other - prohibited.
- */
-#define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Support */
-#define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
-#define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
-
-/* Now check all parameters and calculate CAPABILITIES REGISTER value */
-#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1
-#error Capabilities features can have value 0 or 1 only!
-#endif
-
-#define SDHC_CAPAB_REG_DEFAULT                                 \
-   ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
-    (SDHC_CAPAB_ADMA2 << 19))
-
 #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
 
 static void sdhci_check_capab_freq_range(SDHCIState *s, const char *desc,
@@ -71,12 +53,22 @@ static void sdhci_check_capab_freq_range(SDHCIState *s, const char *desc,
     }
 }
 
+/* Default SD/MMC host controller features information, which will be
+ * presented in CAPABILITIES register of generic SD host controller at reset. */
 static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 {
     uint64_t capareg = 0;
     uint32_t val;
 
     switch (s->spec_version) {
+    /* fallback */
+    case 2:
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, ADMA1, s->cap.adma1);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, ADMA2, s->cap.adma2);
+        /* 64-bit System Bus Support */
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, BUS64BIT, s->cap.bus64);
+
+    /* fallback */
     case 1:
         sdhci_check_capab_freq_range(s, "Timeout", s->cap.timeout_clk_freq,
                                      errp);
@@ -794,7 +786,7 @@ static void sdhci_data_transfer(void *opaque)
 
             break;
         case SDHC_CTRL_ADMA1_32:
-            if (!(s->capareg & SDHC_CAN_DO_ADMA1)) {
+            if (!(s->capareg & R_SDHC_CAPAB_ADMA1_MASK)) {
                 trace_sdhci_error("ADMA1 not supported");
                 break;
             }
@@ -802,7 +794,7 @@ static void sdhci_data_transfer(void *opaque)
             sdhci_do_adma(s);
             break;
         case SDHC_CTRL_ADMA2_32:
-            if (!(s->capareg & SDHC_CAN_DO_ADMA2)) {
+            if (!(s->capareg & R_SDHC_CAPAB_ADMA2_MASK)) {
                 trace_sdhci_error("ADMA2 not supported");
                 break;
             }
@@ -810,8 +802,8 @@ static void sdhci_data_transfer(void *opaque)
             sdhci_do_adma(s);
             break;
         case SDHC_CTRL_ADMA2_64:
-            if (!(s->capareg & SDHC_CAN_DO_ADMA2) ||
-                    !(s->capareg & SDHC_64_BIT_BUS_SUPPORT)) {
+            if (!(s->capareg & R_SDHC_CAPAB_ADMA2_MASK) ||
+                    !(s->capareg & R_SDHC_CAPAB_BUS64BIT_MASK)) {
                 trace_sdhci_error("64 bit ADMA not supported");
                 break;
             }
@@ -1321,6 +1313,8 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, 512),
     /* DMA */
     DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
+    DEFINE_PROP_BOOL("adma1", SDHCIState, cap.adma1, false),
+    DEFINE_PROP_BOOL("adma2", SDHCIState, cap.adma2, true),
     /* Suspend/resume support */
     DEFINE_PROP_BOOL("suspend", SDHCIState, cap.suspend, false),
     /* High speed support */
@@ -1330,6 +1324,8 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_BOOL("3v0", SDHCIState, cap.v30, false),
     DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
 
+    DEFINE_PROP_BOOL("64bit", SDHCIState, cap.bus64, false),
+
     /* capareg: deprecated */
     DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
 
-- 
2.15.1


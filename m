Received: by 10.28.173.206 with SMTP id w197csp1005666wme;
        Thu, 11 Jan 2018 12:57:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBouEwOadfA0gNgSyOjtox8yQm267wBQToqPX3bw1wJDF1XKyFo99tBGmcH4P8Z0syn4KHq8j
X-Received: by 10.37.6.131 with SMTP id 125mr13746484ybg.233.1515704252822;
        Thu, 11 Jan 2018 12:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704252; cv=none;
        d=google.com; s=arc-20160816;
        b=UqoIYY/a2N9itt4nX7FnieeawNE+Emc0IBr3UjVVzHl/bads+wrUBAlvacspkm15p7
         A15uYcPG29Ey/ukTFONXE4K6Ppho3ISOPhMwHkPJlEFR4PdwL8Dj1Z1NmYCgIRP3c8Nt
         XPvbNvXoFLk7DBshy2rBWAaxm4btDYlPEYjv39G0/Hm6VzC3lqg+p3bWXueBEKChmnGw
         4WLtE3GBCLL2EDR122O00xQiUqMsw0QEv6D07NfIQeweuaGTSgT9nx0Kw1VyneLw3PGH
         H9bN02kSopdAHgrG6Q5WzBJn2qFRr7h+DE24WHpq91u3lgYOR6Zp6SVuMluvacDYEDEJ
         E86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=II9DiPEFi6cFDmTR2bUVIEZrLT02jncUaxS4Dbzkfkk=;
        b=Gtm+jDJgTF/LY1FMKbHLKhs6I4yIxpBZTSkB75VofJRQFwB0YcV2o0HrsUy8KEBo8T
         W9My+pNPdVppx7GOdRaEHlO+bFMBo52dkqT+NBn/vEeGpeXJueiej/cygChmbh4tmrL9
         HLm8pbdnliBhXQp+WltYJKwCEmU50O09TRMVBjaAH3x540C4V+NDmEJffujEVQC4+0EW
         +9JXvaoF3cnHlSQzxts+Nv6h6YNVbzEl2gN72nQRDzgxa+mx7EeMGgEd9azhtMIgDVMp
         UhyYhq/R6nmBnmZ4/FjgM3bIQT73U6/Au8l9afEwhU3bqkdEBsZ+ThUAvX3upLfEMsCf
         NQmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KnBICEkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n126si2416100ywn.803.2018.01.11.12.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 12:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KnBICEkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjum-0005eh-8Q
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 15:57:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuT-0005Xa-BV
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuS-0002QQ-CC
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:57:13 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44132)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuL-0002Lc-Ve; Thu, 11 Jan 2018 15:57:06 -0500
Received: by mail-qt0-x241.google.com with SMTP id m59so3551578qte.11;
	Thu, 11 Jan 2018 12:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=II9DiPEFi6cFDmTR2bUVIEZrLT02jncUaxS4Dbzkfkk=;
	b=KnBICEkCwxz8nAwWs7BK9Tc31F+yL8kKdmpIeI+0FFEz3q4eOtaqnAbjMeZv63BdJD
	gWA1bLIIwRf7DLVgzqvtjj9U9XKJi/9xDkkLq5/P9JPpO6YlwrxL0jVYZ5xcRy05O03T
	zJaJCuO9fYnfHzWeIFIuadpOkS+l9pV7uH22dsxoy569MT++nk/g9thUljqclLRbAkmM
	VZvqSBAEZZQLaxMB0N/uOLXPE377aDvZiGTQ2WB2eyOWpxM9woKiFb9Rhg1zuXnGoAQD
	wx+q+AXQqq00hTX7CEsrS4dKTHue7Fg7B8blq5VBBkTSgOevCcgDJlZ97qnDx0pS+Bfs
	9doQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=II9DiPEFi6cFDmTR2bUVIEZrLT02jncUaxS4Dbzkfkk=;
	b=HFpS5HOzTrxNeZ8cy8+h0XLDsqZZ8+LjUdEsp5TNq8dIJetEIA8ohjItjtfUFyhUsM
	v6BjGg38aaI2bBj+2HpAnU4BPqZck+IuCU0z2Oxv2dRzkq4bSe94kzPwyXFDWu7W6yH7
	TjN4pHod4MBlDlJbcQ6q3ETTpQVBk2QQr1hZ7bZWmi6KeNvvBJlm1ZHRhNYC3SUsrO7c
	hbT99vD8JxZ7i/qF2xSzr7Cg1fyDWJy/amhHBA6xQ+XynKXPzLa+ofnUWcoaEqNyfsF3
	GkPoCjAWr6sAbddV/2AD+EI028ld+mLrzhj5wVxiJNGTRWmvTUB6WCLEnPU6oZNj69E/
	vSKg==
X-Gm-Message-State: AKwxytdFo2PIcZMG4snlX5bjQ858qIZYp6DRyB/kgqUW8ybb7ZiZooJt
	VbiuMKdYWlVxiF/4kXTTdMY=
X-Received: by 10.200.37.119 with SMTP id 52mr34454818qtn.270.1515704225335;
	Thu, 11 Jan 2018 12:57:05 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:09 -0300
Message-Id: <20180111205626.23291-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v6 04/21] sdhci: add clock capabilities (Spec v1)
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ExgXIGCWHpVZ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 53 ++++++++++++++++++++++++++++++++-------------------
 2 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index b61953f7c5..b5b4e411ff 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -93,6 +93,8 @@ typedef struct SDHCIState {
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint8_t spec_version;
     struct {
+        uint8_t timeout_clk_freq, base_clk_freq_mhz;
+        bool timeout_clk_in_mhz;
         uint16_t max_blk_len;
         bool suspend;
         bool high_speed;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 54c1411d19..4c1fcf2c32 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -46,36 +46,32 @@
 #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Support */
 #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
 #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
-/* Maximum clock frequency for SDclock in MHz
- * value in range 10-63 MHz, 0 - not defined */
-#define SDHC_CAPAB_BASECLKFREQ    52ul
-#define SDHC_CAPAB_TOUNIT         1ul  /* Timeout clock unit 0 - kHz, 1 - MHz */
-/* Timeout clock frequency 1-63, 0 - not defined */
-#define SDHC_CAPAB_TOCLKFREQ      52ul
 
 /* Now check all parameters and calculate CAPABILITIES REGISTER value */
-#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1 || \
-    SDHC_CAPAB_TOUNIT > 1
+#if SDHC_CAPAB_64BITBUS > 1 || SDHC_CAPAB_ADMA2 > 1 || SDHC_CAPAB_ADMA1 > 1
 #error Capabilities features can have value 0 or 1 only!
 #endif
 
-#if (SDHC_CAPAB_BASECLKFREQ > 0 && SDHC_CAPAB_BASECLKFREQ < 10) || \
-    SDHC_CAPAB_BASECLKFREQ > 63
-#error SDclock frequency can have value in range 0, 10-63 only!
-#endif
-
-#if SDHC_CAPAB_TOCLKFREQ > 63
-#error Timeout clock frequency can have value in range 0-63 only!
-#endif
-
 #define SDHC_CAPAB_REG_DEFAULT                                 \
    ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
-    (SDHC_CAPAB_ADMA2 << 19) |                                 \
-    (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
-    (SDHC_CAPAB_TOCLKFREQ))
+    (SDHC_CAPAB_ADMA2 << 19))
 
 #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
 
+static void sdhci_check_capab_freq_range(SDHCIState *s, const char *desc,
+                                         uint8_t freq, Error **errp)
+{
+    switch (freq) {
+    case 0:
+    case 10 ... 63:
+        break;
+    default:
+        error_setg(errp, "SD %s clock frequency can have value"
+                   "in range 0-63 only", desc);
+        return;
+    }
+}
+
 static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 {
     uint64_t capareg = 0;
@@ -86,6 +82,16 @@ static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 
     /* fallback */
     case 1:
+        sdhci_check_capab_freq_range(s, "Timeout", s->cap.timeout_clk_freq,
+                                     errp);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, TOCLKFREQ,
+                             s->cap.timeout_clk_freq);
+        sdhci_check_capab_freq_range(s, "Base", s->cap.base_clk_freq_mhz, errp);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, BASECLKFREQ,
+                             s->cap.base_clk_freq_mhz);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, TOUNIT,
+                             s->cap.timeout_clk_in_mhz);
+
         val = ctz32(s->cap.max_blk_len >> 9);
         if (val >= 0b11) {
             error_setg(errp, "block size can be 512, 1024 or 2048 only");
@@ -1299,6 +1305,13 @@ const VMStateDescription sdhci_vmstate = {
 static Property sdhci_properties[] = {
     DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
 
+    /* Timeout clock frequency 1-63, 0 - not defined */
+    DEFINE_PROP_UINT8("timeout-freq", SDHCIState, cap.timeout_clk_freq, 0),
+    /* Timeout clock unit 0 - kHz, 1 - MHz */
+    DEFINE_PROP_BOOL("freq-in-mhz", SDHCIState, cap.timeout_clk_in_mhz, true),
+    /* Maximum base clock frequency for SD clock in MHz (range 10-63 MHz, 0) */
+    DEFINE_PROP_UINT8("max-frequency", SDHCIState, cap.base_clk_freq_mhz, 0),
+
     /* Maximum host controller R/W buffers size
      * Possible values: 512, 1024, 2048 bytes */
     DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, 512),
-- 
2.15.1


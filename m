Received: by 10.28.173.206 with SMTP id w197csp2613931wme;
        Mon, 8 Jan 2018 07:47:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBos0qCyJsMEfrz46Zghe9pU3Ihkp9bkgITQdHiuCtbfmBodwfV0Uxt6kSLJA8Yr95V8jH7HC
X-Received: by 10.37.183.76 with SMTP id e12mr11740547ybm.427.1515426420851;
        Mon, 08 Jan 2018 07:47:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426420; cv=none;
        d=google.com; s=arc-20160816;
        b=Jp+vvDeFrWTrmRuFMwzMKOr7X1qxmBHlVejITJzIcXQmDik3nOXo0iee1xvjzjzE9p
         C1rwDL2hxRYH8nVIAYNSSeSJ1s/VJxdLHXAXIKSGCSnMtTljyAVcyb7MSkDYMSojCLkg
         xYdoQ+hUBYQ9wykK6Jm2/Mtl4VPSm9856vHF1J+O3M3mHC+vFaGR9j2Qh3R/DVpvnXBR
         4wISjxWKI0H5M87epeuAcbpsoq6+iM2WfE9A1qyzoqQSGx8x1r9XzO+6WX7xZxGqxY9x
         +LpFHayeFYDqABns/szjmyx6MdOLnkRT7l98slXcH2fPz8v/FgyRdDCeIwtoH4kDDWng
         zibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HWQWhGWtMmZ88ewit7xq+LWBjgBXVuNpMGsXmtIA4Js=;
        b=dsqW6Myj4t9T+HhaRE4/gdpUYj2lsrInWhU0bbTWmaHNjAc3vLEXMOkgMfBqsMcKNz
         S5U4bqwhVYgOOpbRwV2bgwA8ZkIQckbLfXOFILOj8QtMz17Gy/clkEG6RXUbLISuI3tQ
         dLbGwwVdw3s0BSVyqm1WLTt/RhfDyZsEi8rkeVW2AKI0JzR45Zd7doWao0awyouRGJzb
         F6FTFOlqcfDBKm6PxX35khX+8RsdKSnIrW8PoyvIce2zx0jawb2wnm3NrY10qDBEL7kl
         pjs4MzxGnUu90q2QHPtmTSPxoAN/v6nTlHXuqWrk131tygc5CrGNoxh91f+E/RtL8WAb
         NalQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LmEne42/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s184si35515ybf.108.2018.01.08.07.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LmEne42/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZdc-00042a-8q
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:47:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaV-0001K3-2o
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaT-0007CW-Ut
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:43:47 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaQ-00079H-TK; Mon, 08 Jan 2018 10:43:42 -0500
Received: by mail-qt0-x242.google.com with SMTP id w10so14068148qtb.10;
	Mon, 08 Jan 2018 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HWQWhGWtMmZ88ewit7xq+LWBjgBXVuNpMGsXmtIA4Js=;
	b=LmEne42/j3jw95OdiTsem/09T/3X5PtTWqh4ObG1ohdixh7TgJtZ9+ZqVrxcxN08KU
	3GaZf9YgPCvMQrW1OKJce/4zAWIVAQ3+4g6ZNCrEKT2QRbJiNsW7LiIX5t3+b28P8eDg
	bb3DCfommJY5G3rWFZ4X0PyE+A+UXfIKmcqWb4Z5pe3bDNqf0tiHl/WvhzFZyT7qLeKD
	56yrwoO8cUqcqzc0o4KvUPG5ikNNxZFv+idxMcIUg9hg/4kQofE5kWBii7wwSEqwU5YV
	0LXBILvzBIj/ec3nDWa9YZqG7KL2/NLeglzDHeripbW/jjOpqh8g/08UoxIWp1NBe5jD
	Cdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HWQWhGWtMmZ88ewit7xq+LWBjgBXVuNpMGsXmtIA4Js=;
	b=ZHAkQzceCKyOT1ixnVXvl6HIsvA7xyGI9+KghxpYejCXi56L64lNVO4gAeXo38jfZ7
	qopNIyrkbZf18RPBxHBzVYlPBplasbc6edX7u79E7wnM+Y3EpakXQ7p0RqEGeeU2KSr9
	9Qc3MiNQBa8fFKxTlAYftUAO5av4TMJyKTVG1c78XsA1r+hS7NIyFJp8rNuteB1xAo4Z
	rMMTOmLXc2SMeTpoQM9it1/5C/jM/PsHwNCUxn7FpsyPGe64tAnye7gWdtyCm34mVh53
	bwmPKVLYdXFwlE4bJ5ws7T155C2CbesDDnDocB09JeFQI7DsaY3e+auHNZRvdYIK7Ajm
	PTJw==
X-Gm-Message-State: AKwxytfNvjxvYX5H1nxRzzabx/eoHkgWn2etIW076HuGWfEI/OjTtTJc
	IflioxZ7mlqlSo0eAyjxPcg=
X-Received: by 10.200.22.33 with SMTP id p30mr16440134qtj.284.1515426222272;
	Mon, 08 Jan 2018 07:43:42 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:36 -0300
Message-Id: <20180108154303.6522-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v5 04/31] sdhci: add clock capabilities (Spec v1)
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
X-TUID: sXn9efevz0sm

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 52 +++++++++++++++++++++++++++++++--------------------
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 2703da1d5a..c1602becd2 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -103,6 +103,8 @@ typedef struct SDHCIState {
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint8_t spec_version;
     struct {
+        uint8_t timeout_clk_freq, base_clk_freq_mhz;
+        bool timeout_clk_in_mhz;
         uint16_t max_blk_len;
         bool suspend;
         bool high_speed;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index c78643fe54..05681c86d6 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -46,36 +46,31 @@
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
+        error_setg(errp, "SD %s clock frequency can have value"
+                   "in range 0-63 only", desc);
+        return;
+    }
+}
+
 static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 {
     uint64_t capareg = 0;
@@ -83,6 +78,16 @@ static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 
     switch (s->spec_version) {
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
@@ -1304,6 +1309,13 @@ const VMStateDescription sdhci_vmstate = {
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


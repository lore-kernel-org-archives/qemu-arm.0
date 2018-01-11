Received: by 10.28.173.206 with SMTP id w197csp1005676wme;
        Thu, 11 Jan 2018 12:57:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBotegpFzk/Dwo9AYZoAH/qNscQ4g5BvI4OaYKkmt0sckZNrYaBIiK5jdZNArKlZ9u7D0IbT7
X-Received: by 10.13.214.84 with SMTP id y81mr16640487ywd.499.1515704253593;
        Thu, 11 Jan 2018 12:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704253; cv=none;
        d=google.com; s=arc-20160816;
        b=HTJnn/Qkw/ccP2KXLjcMDRg6qq3nd8hk/u9WoMS/wAsaMOkYY56ELpiaaFscRnqEGO
         6fg2GfLx6zBMFF/yS4QTsuPYO/JNJbgqpuDqhnh4gtaRAIiEnUYuglY6r7r+uiQyPzZw
         Jvr9av9Zort95Frokay0VcM3MDkExyjglfPLwQM79M3YWpyn80Rz6u14cfFf1zB+lm/b
         qUv/en3L2cL0cnYiW4vd0Wc3QulHJUtbrATfKDhIyOZKKy+HOG0tm26xkdxPapfkXAzA
         EqCeNG4rXnfPyyEQbrtVrOP7bd9lHLJdnCedasQozJRQook3YQ6Pc4kU4T7FCdB/b/Jd
         MOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=L7J+kiGkzpd/SCmAi+Q8aOGQ2Y+EIxLiNY/DhHZU/NU=;
        b=rzI7RkLPBCty7EWSlY7cYC2i42mwpGBFxDj71ysytyXvLgjxqVF4CAhoJf///RZmqM
         nUNXrchnxDjBZLkphAA2I1fBVMU2zt05WyaST4+jVI1wixfifM4xGL5Xc/jwA4CPV+Tb
         2eQbrD2zQdqpaFQ21fYL3y7kBaKcfnou/csl+Alju6W/WzSTtVTOMV5qNiAOqoZDsBXf
         J+oBJspiCVCZA/1GmUJvAxOeLSHQUkeUZWUqam9U945f77v4ybCpe/f6cAh2+SnbM4vT
         n+q2rJtPkFdXQXuf8UzqM5zOwxwSObrmlhYfLptN4E8DKYwH5pXHOVI//drA4wcgU1XR
         I6MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j7mZWI62;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t70si1910841ywe.643.2018.01.11.12.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 12:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j7mZWI62;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjum-0005O2-VB
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 15:57:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuH-0005Ik-2P
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuF-0002Hw-Sy
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:01 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuF-0002HL-Oe; Thu, 11 Jan 2018 15:56:59 -0500
Received: by mail-qk0-x241.google.com with SMTP id j185so6102993qkc.5;
	Thu, 11 Jan 2018 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=L7J+kiGkzpd/SCmAi+Q8aOGQ2Y+EIxLiNY/DhHZU/NU=;
	b=j7mZWI62n7XEOH0c1ZSZ25vZ6GYf1BElWrAQ1Ioxoljry5AcroeQxwypyooHj5Lz3v
	u+LO7moxqNo3Crh/uSmfGyFNJTjDe4/wgQdzy+aXPw4749Zh4stwwPflvWwVfNrBtR+2
	ZXmWvgXSNqQ2wmTChLBskb1vcbnHZPqPhhHhQ+kwgM4uCZKnvfeEOJzdc0a0AVIiiwOt
	oY7TqVeU4un+7ixw0dzX1x5iQCZgz015dltfO6eZUCnAB2ZNmyVWuDbwpLG+TZQVLzdu
	xwBsZVDeoUAHYk9tJItOk1jcbYnqLW5LyV5nulfvbtdFxtrx13Fce/TSPgPjlTEvZS9R
	fZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=L7J+kiGkzpd/SCmAi+Q8aOGQ2Y+EIxLiNY/DhHZU/NU=;
	b=nA5LtmZ9KLlPo3YGcuPe3dRIT+6es7+gkjVsrQepU/cZ7lPx5rz+k/Tue4/KDXkpKW
	9JHb5S7vMAldMy9N21+JN4tveCnBwBfxC6zin4V1u73m8Vt2c5W+rWdj6gKV0Zks7suH
	ioy4VLs4a/dI4pAK4fCd5q97jjfzUcJ4EMb+flWwHY8DZuTHjz0N5Pm+1ZmhqRZhi+Cr
	PdIblbuf9liy/VPWt4k5AQHpea/dxpzCFI/tShPun1v0Al1UZjmNXBVrY9THc/DArOHQ
	h8f/aWIZUL4oMuKWiZSUfZerJ81y8SLD+VQ87PaFMfwGqjKllSn7vpl7Rgm2rmd3R61l
	0Y6g==
X-Gm-Message-State: AKwxytdm4YxkagKIT5KVL3Uo63SNMeg2ATl08o2aJqvBOLDXoTip0jxQ
	t6M/4XPOm3bFVl2TpDU0uoY=
X-Received: by 10.55.54.210 with SMTP id d201mr8848067qka.213.1515704219140;
	Thu, 11 Jan 2018 12:56:59 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.56.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:56:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:08 -0300
Message-Id: <20180111205626.23291-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v6 03/21] sdhci: add max-block-length
 capability (Spec v1)
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CeTiEyl3HKFM

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci-internal.h |  1 -
 include/hw/sd/sdhci.h  |  1 +
 hw/sd/sdhci.c          | 38 +++++++++++++-------------------------
 3 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 9acafe7b01..c5e26bf8f3 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -188,7 +188,6 @@ FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
 #define SDHC_CAN_DO_ADMA2              0x00080000
 #define SDHC_CAN_DO_ADMA1              0x00100000
 #define SDHC_64_BIT_BUS_SUPPORT        (1 << 28)
-#define SDHC_CAPAB_BLOCKSIZE(x)        (((x) >> 16) & 0x3)
 FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
 FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
 FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 09b756eb7a..b61953f7c5 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -93,6 +93,7 @@ typedef struct SDHCIState {
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint8_t spec_version;
     struct {
+        uint16_t max_blk_len;
         bool suspend;
         bool high_speed;
         bool sdma;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d26ea821d0..54c1411d19 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -46,9 +46,6 @@
 #define SDHC_CAPAB_64BITBUS       0ul        /* 64-bit System Bus Support */
 #define SDHC_CAPAB_ADMA1          1ul        /* ADMA1 support */
 #define SDHC_CAPAB_ADMA2          1ul        /* ADMA2 support */
-/* Maximum host controller R/W buffers size
- * Possible values: 512, 1024, 2048 bytes */
-#define SDHC_CAPAB_MAXBLOCKLENGTH 512ul
 /* Maximum clock frequency for SDclock in MHz
  * value in range 10-63 MHz, 0 - not defined */
 #define SDHC_CAPAB_BASECLKFREQ    52ul
@@ -62,16 +59,6 @@
 #error Capabilities features can have value 0 or 1 only!
 #endif
 
-#if SDHC_CAPAB_MAXBLOCKLENGTH == 512
-#define MAX_BLOCK_LENGTH 0ul
-#elif SDHC_CAPAB_MAXBLOCKLENGTH == 1024
-#define MAX_BLOCK_LENGTH 1ul
-#elif SDHC_CAPAB_MAXBLOCKLENGTH == 2048
-#define MAX_BLOCK_LENGTH 2ul
-#else
-#error Max host controller block size can have value 512, 1024 or 2048 only!
-#endif
-
 #if (SDHC_CAPAB_BASECLKFREQ > 0 && SDHC_CAPAB_BASECLKFREQ < 10) || \
     SDHC_CAPAB_BASECLKFREQ > 63
 #error SDclock frequency can have value in range 0, 10-63 only!
@@ -83,7 +70,7 @@
 
 #define SDHC_CAPAB_REG_DEFAULT                                 \
    ((SDHC_CAPAB_64BITBUS << 28) | (SDHC_CAPAB_ADMA1 << 20) |   \
-    (SDHC_CAPAB_ADMA2 << 19) | (MAX_BLOCK_LENGTH << 16) |      \
+    (SDHC_CAPAB_ADMA2 << 19) |                                 \
     (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
     (SDHC_CAPAB_TOCLKFREQ))
 
@@ -92,12 +79,20 @@
 static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 {
     uint64_t capareg = 0;
+    uint32_t val;
 
     switch (s->spec_version) {
     case 2: /* default version */
 
     /* fallback */
     case 1:
+        val = ctz32(s->cap.max_blk_len >> 9);
+        if (val >= 0b11) {
+            error_setg(errp, "block size can be 512, 1024 or 2048 only");
+            return;
+        }
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, MAXBLOCKLENGTH, val);
+
         capareg = FIELD_DP64(capareg, SDHC_CAPAB, HIGHSPEED, s->cap.high_speed);
         capareg = FIELD_DP64(capareg, SDHC_CAPAB, SDMA, s->cap.sdma);
         capareg = FIELD_DP64(capareg, SDHC_CAPAB, SUSPRESUME, s->cap.suspend);
@@ -1173,17 +1168,7 @@ static const MemoryRegionOps sdhci_mmio_ops = {
 
 static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
 {
-    switch (SDHC_CAPAB_BLOCKSIZE(s->capareg)) {
-    case 0:
-        return 512;
-    case 1:
-        return 1024;
-    case 2:
-        return 2048;
-    default:
-        hw_error("SDHC: unsupported value for maximum block size\n");
-        return 0;
-    }
+    return 1 << (9 + FIELD_EX32(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH));
 }
 
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
@@ -1314,6 +1299,9 @@ const VMStateDescription sdhci_vmstate = {
 static Property sdhci_properties[] = {
     DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
 
+    /* Maximum host controller R/W buffers size
+     * Possible values: 512, 1024, 2048 bytes */
+    DEFINE_PROP_UINT16("max-block-length", SDHCIState, cap.max_blk_len, 512),
     /* DMA */
     DEFINE_PROP_BOOL("sdma", SDHCIState, cap.sdma, true),
     /* Suspend/resume support */
-- 
2.15.1


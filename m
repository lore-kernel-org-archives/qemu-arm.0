Received: by 10.28.173.206 with SMTP id w197csp1012960wme;
        Thu, 11 Jan 2018 13:03:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBouCNXvDUNJuOORjiyoEPkBbQ1gJYmmR8zrHrY7QvOfrbM7l8EcD5VVBp5tMbhO1tJXzpuxT
X-Received: by 10.129.88.70 with SMTP id m67mr7689137ywb.352.1515704621054;
        Thu, 11 Jan 2018 13:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704621; cv=none;
        d=google.com; s=arc-20160816;
        b=xl9tpkIE1qzZM/eyouoVPA18PrnpmzfgKMUhM3fI3nDmPdLBSDGoPNGFbnwEqoAYTE
         OuFKTuVqel7FlkmZ1ipz+bI10sMfcyg0MDBAck2T6ImlNQ4Xz60s1c+06LHnwU7PTTkw
         QMunqAPkgXZCG7eCnWpxTfobPpKTLg9righoP4a0FSIVKdDasqC0g5YaZVcakMSrUNnV
         moxZtSVVmSW1092m+WA2tQ4IK9NYYrqtB0qnnuR63kWLOj2m9EnLKirQJKGyLb9PY+7Q
         zdZeGTV45D8rQb5Wsb3VfHae34KrN1I4WLp7rHjPZagYy5Tfh5sUTz6EuCEIidV7GO3A
         +qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xTN+gugdMHRG/LMynGYzPTUVjwp5F0AljzUHFu/5WlY=;
        b=IJFVtvB3hKkYJcVhsGfEz7d2gRJMMF1DrBfla3REHQzVtfed3tV6KZ4ZoqQyk/Ih/S
         l8/f/1ApFtZ4J3UBctqTyiG2oi4tJsNrYe4iJrvc26YswlwdohCr8L54OAT/Rc0ulGKa
         ECc7Ik7e2Hvw+M2yXg9lsSM92OqCdOmgseVFsMN/5pBeAcIM5byGmXJnB8XOiz+mE4Ls
         HJKh2ZW/h+R1gCADhGkUd0E9qZ5QxPXinlrW+EvJqCIN9cOiw1ywTzTWWnwpRr1442wK
         A9+WJpgHvmWh4bCRO5D0gI9R39MT1/P7vlL+SlTbJecq9EpGLuyRVe6osvZ+SiXMubY8
         dZnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cKiAAVPb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r24si2116316ybd.116.2018.01.11.13.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:03:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cKiAAVPb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk0f-0002rg-Kr
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:03:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjui-0005mC-Ey
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuh-0002cY-8L
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:28 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuh-0002cB-3c; Thu, 11 Jan 2018 15:57:27 -0500
Received: by mail-qk0-x244.google.com with SMTP id i141so6125003qke.0;
	Thu, 11 Jan 2018 12:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xTN+gugdMHRG/LMynGYzPTUVjwp5F0AljzUHFu/5WlY=;
	b=cKiAAVPbC6t4dAPnosh4Wi1oDbZC/yFFmbWax1tuxfYTw5+2LHQScD6DC8XpyTN4O4
	ghDgMb0pH+rMY3OXCD3Joj87NGAinCCCJY1Yb91vB8edB0kRLZA/JxkwpIi1j53ot/KZ
	EaRYoCfATppj+IJmIAmXMHrckI2nR+MAyLCnDLMsxGENf0HPMTZ+/WlKkBA+bawL1eem
	z1Cq94AG9Lvpm+KdqL1u9F79vLCPKP4u8eCl7AMkT8/8tS/uazwEuyu/UrxQIhBMVfmy
	e+WnEGQp/Y/FTgn6wEQ/seJBRGpo7TBaqHcSgoz7/UxSOTg+2c5uW2uK+N+YDeGmtDKm
	Ed+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xTN+gugdMHRG/LMynGYzPTUVjwp5F0AljzUHFu/5WlY=;
	b=r5j1w5+YzR027nO9CJHTQYRTWtZLyw5Mv9lruhgvyensG5CdOFQpf01tqBGcibMovm
	6+X/7H2LyH4BMxv1RIKsdWjD2wg9THRKVcii0sVgliIXLN46/Zyh8v1Rgjh4+x8soniW
	L78TEZ8sVxc8KleRb6wM12gCQnPAAvXDjcAF+ijtrMUv/SJrPQVC/lfnt7NpBuUnD8zX
	6f+1Q3JXszf2C9TCIqKZhVfs3Yw6K4Us/PtMHdIDPWQh98m3AEzKsNj3DnpoCw4UDUgN
	04kZjrFi0chcqD+J37mEyoRIASDjmgBSSbN1BMtrviWV3tXjIya7j2BZoqPc+qSh7bXg
	TJgQ==
X-Gm-Message-State: AKwxytdAJUfcS1otA9IA5rwMn9wfaJfJFjHI88vuSUJ7kAmkQVVx8CgW
	Ql6umr6o4R53bvOw+RiW0Bb3WZKT
X-Received: by 10.55.65.75 with SMTP id o72mr20087856qka.202.1515704246473;
	Thu, 11 Jan 2018 12:57:26 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:13 -0300
Message-Id: <20180111205626.23291-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v6 08/21] sdhci: add v3 capabilities
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
X-TUID: /0GJRTJDStOV

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 21 +++++++++++++++++++++
 include/hw/sd/sdhci.h  |  2 ++
 hw/sd/sdhci.c          | 22 ++++++++++++++++++++--
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 4ed9727ec3..ac4704eb61 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -43,6 +43,7 @@
 #define SDHC_TRNS_DMA                  0x0001
 #define SDHC_TRNS_BLK_CNT_EN           0x0002
 #define SDHC_TRNS_ACMD12               0x0004
+#define SDHC_TRNS_ACMD23               0x0008 /* since v3 */
 #define SDHC_TRNS_READ                 0x0010
 #define SDHC_TRNS_MULTI                0x0020
 #define SDHC_TRNMOD_MASK               0x0037
@@ -183,12 +184,23 @@ FIELD(SDHC_ACMD12ERRSTS, TIMEOUT_ERR,  1, 1);
 FIELD(SDHC_ACMD12ERRSTS, CRC_ERR,      2, 1);
 FIELD(SDHC_ACMD12ERRSTS, INDEX_ERR,    4, 1);
 
+/* Host Control Register 2 (since v3) */
+#define SDHC_HOSTCTL2                  0x3E
+FIELD(SDHC_HOSTCTL2, UHS_MODE_SEL,     0, 3);
+FIELD(SDHC_HOSTCTL2, V18_ENA,          3, 1); /* UHS-I only */
+FIELD(SDHC_HOSTCTL2, DRIVER_STRENGTH,  4, 2); /* UHS-I only */
+FIELD(SDHC_HOSTCTL2, EXECUTE_TUNING,   6, 1); /* UHS-I only */
+FIELD(SDHC_HOSTCTL2, SAMPLING_CLKSEL,  7, 1); /* UHS-I only */
+FIELD(SDHC_HOSTCTL2, ASYNC_INT,       14, 1);
+FIELD(SDHC_HOSTCTL2, PRESET_ENA,      15, 1);
+
 /* HWInit Capabilities Register 0x05E80080 */
 #define SDHC_CAPAB                     0x40
 FIELD(SDHC_CAPAB, TOCLKFREQ,           0, 6);
 FIELD(SDHC_CAPAB, TOUNIT,              7, 1);
 FIELD(SDHC_CAPAB, BASECLKFREQ,         8, 8);
 FIELD(SDHC_CAPAB, MAXBLOCKLENGTH,     16, 2);
+FIELD(SDHC_CAPAB, EMBEDDED_8BIT,      18, 1); /* since v3 */
 FIELD(SDHC_CAPAB, ADMA2,              19, 1); /* since v2 */
 FIELD(SDHC_CAPAB, ADMA1,              20, 1); /* v1 only? */
 FIELD(SDHC_CAPAB, HIGHSPEED,          21, 1);
@@ -198,6 +210,15 @@ FIELD(SDHC_CAPAB, V33,                24, 1);
 FIELD(SDHC_CAPAB, V30,                25, 1);
 FIELD(SDHC_CAPAB, V18,                26, 1);
 FIELD(SDHC_CAPAB, BUS64BIT,           28, 1); /* since v2 */
+FIELD(SDHC_CAPAB, ASYNC_INT,          29, 1); /* since v3 */
+FIELD(SDHC_CAPAB, SLOT_TYPE,          30, 2); /* since v3 */
+FIELD(SDHC_CAPAB, BUS_SPEED,          32, 3); /* since v3 */
+FIELD(SDHC_CAPAB, DRIVER_STRENGTH,    36, 3); /* since v3 */
+FIELD(SDHC_CAPAB, DRIVER_TYPE_A,      36, 1); /* since v3 */
+FIELD(SDHC_CAPAB, DRIVER_TYPE_C,      37, 1); /* since v3 */
+FIELD(SDHC_CAPAB, DRIVER_TYPE_D,      38, 1); /* since v3 */
+FIELD(SDHC_CAPAB, TIMER_RETUNNING,    40, 4); /* since v3 */
+FIELD(SDHC_CAPAB, SDR50_TUNNING,      45, 1); /* since v3 */
 
 /* HWInit Maximum Current Capabilities Register 0x0 */
 #define SDHC_MAXCURR                   0x48
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 26b50583af..f45e911065 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -104,6 +104,8 @@ typedef struct SDHCIState {
         /* v2 */
         bool adma1, adma2;
         bool bus64;
+        /* v3 */
+        uint8_t slot_type, sdr, strength;
     } cap;
 } SDHCIState;
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index ab4ffeca1d..773eb68fd6 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -63,6 +63,18 @@ static void sdhci_init_capareg(SDHCIState *s, Error **errp)
     uint32_t val;
 
     switch (s->spec_version) {
+    case 3:
+        val = FIELD_EX64(capareg, SDHC_CAPAB, SLOT_TYPE);
+        if (val) {
+            error_setg(errp, "slot-type not supported");
+            return;
+        }
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, SLOT_TYPE, val);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, BUS_SPEED, s->cap.sdr);
+        capareg = FIELD_DP64(capareg, SDHC_CAPAB, DRIVER_STRENGTH,
+                             s->cap.strength);
+
+    /* fallback */
     case 2: /* default version */
         capareg = FIELD_DP64(capareg, SDHC_CAPAB, ADMA1, s->cap.adma1);
         capareg = FIELD_DP64(capareg, SDHC_CAPAB, ADMA2, s->cap.adma2);
@@ -1169,8 +1181,11 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
 
 static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
 {
-    if (s->spec_version != 2) {
-        error_setg(errp, "Only Spec v2 is supported");
+    switch (s->spec_version) {
+    case 2 ... 3:
+        break;
+    default:
+        error_setg(errp, "Only Spec v2/v3 are supported");
         return;
     }
     s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
@@ -1319,6 +1334,9 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
 
     DEFINE_PROP_BOOL("64bit", SDHCIState, cap.bus64, false),
+    DEFINE_PROP_UINT8("slot-type", SDHCIState, cap.slot_type, 0),
+    DEFINE_PROP_UINT8("bus-speed", SDHCIState, cap.sdr, 0),
+    DEFINE_PROP_UINT8("driver-strength", SDHCIState, cap.strength, 0),
 
     /* capareg: deprecated */
     DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
-- 
2.15.1


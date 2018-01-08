Received: by 10.28.173.206 with SMTP id w197csp2629229wme;
        Mon, 8 Jan 2018 08:02:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBotRYatUItQRMNFUMgqolkz3tpNzZ8RPrfkdlEmeiVcLSd7IFjI1LnVJUlzYn6S1LeIXu5RH
X-Received: by 10.129.51.68 with SMTP id z65mr11095496ywz.475.1515427328580;
        Mon, 08 Jan 2018 08:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427328; cv=none;
        d=google.com; s=arc-20160816;
        b=noazbitGYacsAzCTcVR0V0T+nMp5roRVJQn4uxvcrTG8rNaTZ8BNV2HnneQVUMLDC0
         WFABWhY1xIf/6a+7VVowTozLQELNebyefKaCp+pT34nYak7wMzr62A1H9EPa0enyZvfE
         dp9V0MMmtETMcxtJ49X5JCQZWsPonABoEI7zKle7/u6iS3IQYH+S36FAyYFb1Hm6Vcx9
         eZCUBw9dnz5CSm6HwDCud3srylerXbzlJhZIetVehPuUmHaQs7j65wz219I0SLKubZE/
         WAEx3Pgi3ZmXZsA6wrPsjw0UBEbfDj6ob05GiozuGznqx3F69tttK5fyJZrD/0tet0K0
         CEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=EJwpKumRD9gYiYna505USDzhj2iRy5QkmG4+ZT5aMBE=;
        b=HGkmoKyQLLMq6d2CwmyFRjUzxesrEfmli4Urw8TTKdhpwpzZtsPXJmDEZyeFtOfe2i
         lbKdlUJRERVjjlIB0AifiOGbPRxxv8VXtyNC0KkCaTg09eGXlK47CvBveDepqm/fJYEH
         KI+N8gP5gMAnXMAqF+A+Kb0BEub32P0xTmywsvaSCZRUx7HEhlatKmfO9T4M34q/pRpH
         rCnRgzV6oASUw8Y3yFM2zsm9EHLjdJCWZd0Lg40Lr2ztnZJoHF8I8Wpk3vImJEXzRHUc
         8UO0vI12+ksqYG76tM4NxaKZoss5UbUD13X8ZMmHgOBSMQ1JmszfplfhGDsNOVAC1ptq
         bHTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bbd7YN/h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si2540804ywc.440.2018.01.08.08.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bbd7YN/h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZsF-0000U0-UZ
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:02:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbT-0002HK-V4
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbQ-0007qB-Pu
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:48 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbQ-0007pt-K7; Mon, 08 Jan 2018 10:44:44 -0500
Received: by mail-qk0-x244.google.com with SMTP id p13so14636088qke.4;
	Mon, 08 Jan 2018 07:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EJwpKumRD9gYiYna505USDzhj2iRy5QkmG4+ZT5aMBE=;
	b=bbd7YN/hYIsmfjue7SDKf6cObTIJgTnLY2yAEXsWB5u7GJboj3oJyZkt80aRIg+hI6
	e1kYTBsiZJRO0eaWer6BK4T1FMC2fdxz2lpUYw9VQk6TNMl5Vs94S7P8yvmvmzyKGMrH
	4azUMHz1bigl1wddX0hIbZl9/20oiYuruMXyp7u6nRT2JLRLJtnXQrYB4JPDqysKl2dk
	gXsLsbhh0MTDAAGZdSIjfxvo6HgoMqiCIkBkEEpu4Xx9cK9cZ3TxM8K7cQLhwnqbnmzb
	pmFM7V187/umW7+g2c9czdmJKtkZq9+Ou5Hf6CkPolk5DFL+yGjgE02H97CqZuJBD8X8
	onBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EJwpKumRD9gYiYna505USDzhj2iRy5QkmG4+ZT5aMBE=;
	b=HlsyyVocdk0O76H/8IdzUHTMtNwZ48Fne/h/eX9kQqjBd/eUPIvLXgTh2H3KaietPL
	AvbPXTVLrR62/utuS/s0A5xKl6hqgVJdPRnlNn6tYJzUAQuQFnpIjbZiwXxQLR3tS/el
	e/UQmbsgu5OnJb1d9DBW+qGzluti/XHa/rzyZyXVRaZtjEAwJpkRSDDDXYaeyFIz49Dk
	bJAc3vtF8y4WI/dD3M2+yZRdjHnGdrxpGtNr2J6QG8DdJIL5N+j7YvPzjY6ndSKNSjdl
	BQxVhkyFdq1LLyLHlo64FEhkBaGW3uIx1kC4VX/KYEglMJ8ARIZqB+S0HEwKP2wtO6xh
	nn5g==
X-Gm-Message-State: AKwxytfQlxOs1YUrSctaNU6YhEQq3e/ZZBm3NRe+wVxQl+qYonkXEPGS
	V5WlmKs4cUZaSb1mSOaVyPI=
X-Received: by 10.55.201.210 with SMTP id m79mr15420854qkl.287.1515426284064; 
	Mon, 08 Jan 2018 07:44:44 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:48 -0300
Message-Id: <20180108154303.6522-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v5 16/31] sdhci: add v3 capabilities
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
X-TUID: 9AN12pnnpkA7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 21 +++++++++++++++++++++
 include/hw/sd/sdhci.h  |  2 ++
 hw/sd/sdhci.c          | 21 +++++++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index affbe4015c..1da91a27b4 100644
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
index a80b7c0424..c0098fc920 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -114,6 +114,8 @@ typedef struct SDHCIState {
         /* v2 */
         bool adma1, adma2;
         bool bus64;
+        /* v3 */
+        uint8_t slot_type, sdr, strength;
     } cap;
 } SDHCIState;
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 83b027a3b6..3f5e0760f6 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -62,6 +62,17 @@ static void sdhci_init_capareg(SDHCIState *s, Error **errp)
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
     /* fallback */
     case 2:
         capareg = FIELD_DP64(capareg, SDHC_CAPAB, ADMA1, s->cap.adma1);
@@ -1174,8 +1185,11 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
 
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
@@ -1327,6 +1341,9 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_BOOL("1v8", SDHCIState, cap.v18, false),
 
     DEFINE_PROP_BOOL("64bit", SDHCIState, cap.bus64, false),
+    DEFINE_PROP_UINT8("slot-type", SDHCIState, cap.slot_type, 0),
+    DEFINE_PROP_UINT8("bus-speed", SDHCIState, cap.sdr, 0),
+    DEFINE_PROP_UINT8("driver-strength", SDHCIState, cap.strength, 0),
 
     /* capareg: deprecated */
     DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
-- 
2.15.1


Received: by 10.28.173.206 with SMTP id w197csp2611118wme;
        Mon, 8 Jan 2018 07:44:15 -0800 (PST)
X-Google-Smtp-Source: ACJfBouq/1f9g0BqqN4rAkwtvBU0YG5JkazUv/RZO9gLVEwTzbreAq++pI3+jhYaokuWoIuLtDSn
X-Received: by 10.13.220.4 with SMTP id f4mr11053574ywe.142.1515426254979;
        Mon, 08 Jan 2018 07:44:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426254; cv=none;
        d=google.com; s=arc-20160816;
        b=sP+9lC4kfYUUJoAmmFVFUt81NpPNvkmhLYh4LDAd3Z1dmt+wZlajqs4g6T8ncGl/Fk
         iLKxfnRjajKDe9g6PyJpVZQXng0/4zZ4kuA0NfRJINDDKD1bXN7rGafGhn0I8MvWMrbq
         g39HPrax1Bh/QBRYFbRMDcnu7HWXnIncPxhx4iTRWjEm7tAu2XdFnHUXcYPIxYeRyYJR
         DgVcPjETjRSAMskKX4IX5j2V9/29xcbj/IilNwFaL/SRILjmjr/8IUJyh9Emxef0MXo0
         zrEgn6309Fy5qOSpQ5cEoc3LYexBIhbssCDfDrMk30dDcEBYJUvOPfsuDmo2/eFGhp+U
         TFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pRZ5+8t9K0SBXbK27mqzP5criiKp2EjgQFm/Ifni1+k=;
        b=MH62vLP8fPHs7UV0Sj5L0dwfIM09bDDxqcKjH6ScO+pIEiHbD4u2XsCkZygJ1wy3f/
         DKlfvQ5o2lrEn4sc6MENthzTx0yo4kxLK17Rv4s+75ATu19xgnjMIrjpTDNbEw+Gxpg8
         /dh7EcViyiYNy5fz/ZBjd0tWdFXx7w4jm0cf4Xz3RNGY4AbHy7Q75x8cKGOm9z7dDL7S
         /bfzGc3SN1PCMYOptwxef0Pp3+REb+H/0bMnfekV3wFK9FlqubDDrJ3DCsKaNMne+UsF
         b9l8PzexuDeQmMRLm5POQdmeV3QezRTLQxXqX0CI3DrmwrKs/4xuldVwKrbaX+GGxS6k
         gYGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WkTVtfZb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1si2505470ywf.663.2018.01.08.07.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:44:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WkTVtfZb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZaw-0001K5-7E
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:44:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaM-0001DP-M9
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaL-00074j-M0
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:43:38 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaL-00074U-Gl; Mon, 08 Jan 2018 10:43:37 -0500
Received: by mail-qt0-x244.google.com with SMTP id d4so14068675qtj.5;
	Mon, 08 Jan 2018 07:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pRZ5+8t9K0SBXbK27mqzP5criiKp2EjgQFm/Ifni1+k=;
	b=WkTVtfZbayNc/NG9GxZXUNoYX0RWjOhNFFEXeC95SwpgYcgTqy4nQ1JZV3sP94lsEq
	8Ma7UgblJ5VoBrNyV2dLJSOBYp275f6PuFDxYgL4PxcQtiII084e61ITHf57LXScOSra
	ZJxhHX1vRJPOG/zIdxJhFF0WX8y//GaM88Ydf5p9BB7ZDlxOJY2Xc5ttQ8+SiNHe2B75
	WyU/wKBw5Z26n1eclh63YnU2pyBoJ6zEJDdYQptqf9Zu6lxQH2tlzWF5nWWcOBcxTeTG
	Y7rs3QBua3dFt8AYNLNwvXgf1SLbh0iUZyWyQcmzX+GP3OjLQPAhfH9ogInoJ3HJw3FX
	xYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pRZ5+8t9K0SBXbK27mqzP5criiKp2EjgQFm/Ifni1+k=;
	b=K3/+o1fWkgtsZyoUPJSgMaQAWwwnrz5Rq9jWVPayaB9ycRQPjVJqnrvNmwe4rb2FK4
	jTTX0JsMtEbHzoC/aZ/l42bDSvbWopWITcdbjl2PUcbdfJU/umQpeNZo7EEx+eg24qzH
	P9NlcguC4ZVvdte4UL/TuwSdi3ZPvuNr/n+vbBMQ9MmShQzdD+xmBZ7TeX0C9QicMq+d
	X740QVZcOCj3fnuAtHbJ2rKdPgz2EiTV9C2hS/9RWL8gEnRDNC3HMOiwzp/5whZ6UHFJ
	IlQm+/QpmPcar0zJHFLBU682lX0nRnA65WHE2pY2cryqa3G19r/eVe6qBnsk0PUCQqTr
	kvnQ==
X-Gm-Message-State: AKwxytcnOLZ5eHPAsGfNBKHZAnv0wdYOm3mjtBBVOpN0EACWm90YmKZS
	7oKjLTAIKmnNJ7kkFt/xvj8=
X-Received: by 10.200.40.115 with SMTP id 48mr18023741qtr.335.1515426216886;
	Mon, 08 Jan 2018 07:43:36 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:35 -0300
Message-Id: <20180108154303.6522-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v5 03/31] sdhci: add max-block-length
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +V6W26CbgJiV

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h |  1 -
 include/hw/sd/sdhci.h  |  1 +
 hw/sd/sdhci.c          | 38 +++++++++++++-------------------------
 3 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 6944fcaf00..0561e6eaf7 100644
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
index 266030dc8d..2703da1d5a 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -103,6 +103,7 @@ typedef struct SDHCIState {
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
     uint8_t spec_version;
     struct {
+        uint16_t max_blk_len;
         bool suspend;
         bool high_speed;
         bool sdma;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index e7dbab2fdc..c78643fe54 100644
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
 
@@ -92,9 +79,17 @@
 static void sdhci_init_capareg(SDHCIState *s, Error **errp)
 {
     uint64_t capareg = 0;
+    uint32_t val;
 
     switch (s->spec_version) {
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
@@ -1175,17 +1170,7 @@ static const MemoryRegionOps sdhci_mmio_ops = {
 
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
@@ -1319,6 +1304,9 @@ const VMStateDescription sdhci_vmstate = {
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


Received: by 10.28.173.206 with SMTP id w197csp1005331wme;
        Thu, 11 Jan 2018 12:57:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBovip5igIIuBq7dsYRWr9yLgMiTKw1PVJC3maMVCO/FwqEzl0BxfKTwva/VsisaFO4X4kYoi
X-Received: by 10.129.70.87 with SMTP id t84mr21796631ywa.397.1515704229673;
        Thu, 11 Jan 2018 12:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704229; cv=none;
        d=google.com; s=arc-20160816;
        b=k3SyaOn8Z4U+gaNKFVUTHrP2uWHvFRfD10kXG4x4d0lqJO6tymh6bZGDJeOupl4jG+
         KNpqQG9S2GNETOziUqHUyiNVwAAVNZ0dxn4NLpbT9knJELfPD+IofDRWOLcPtEnoKsrd
         ggmGAfogDR8tXwq44XbUkCHp68d6m466mQGZcWViVURCfX38wBCiv7qix6TvtRIk5oy3
         7IHPAex5gEfOfqOXWiXMTwlievzqzU+z5CLzb9Gg5akxKFeOf6QyCAbzcdo5T3YOCerT
         gVGjKyZ4PLMlCTvkTpI9EQO+SBygKy96OLv5XqBiOZxySE7jJPNPvysslPbATPmzF6y1
         o2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AA4lX2oy/5wotSIpkmi4A54FyuiV6UM7VS2dxaiLG8Q=;
        b=JcZr+/fcspSkr0wE11CtBfvc24vJv/1xTQ8TU2J7d3v9pn3MmYf4F9JTeSYVQdFoR9
         iFfbqapJ4Z/DiprSR7sKeoFG+lULK3SLD9FFcrNSiK6eFkbvf1H6Evw8JZrSlftJZXRr
         7aEqIliSZ0G5Gec6XXSt+W6zrc/hQgN5kXNJEtgJrklh6U7Hre96o8ENSsgviqEFBw++
         sPbET/3UzqiIlAPi1J3Aja8VfLwx99f480wfm6gL7+sA1s+I1wSB/W+RUDrt5oX1bCUw
         4t1MAW41L6ChQM1ECvLIe7qAN/ufArLKcIyh2fgGWZLh4tDL+ggyv5dXmYel1661DdlB
         NXnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uI9nokc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si4105032ywf.556.2018.01.11.12.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 12:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uI9nokc6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjuP-0005HN-2q
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 15:57:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZju9-0005BJ-Bl
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:56:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZju8-0002Cd-Ba
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:56:53 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:44720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZju5-0002AR-M1; Thu, 11 Jan 2018 15:56:49 -0500
Received: by mail-qk0-x241.google.com with SMTP id u76so6046833qku.11;
	Thu, 11 Jan 2018 12:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AA4lX2oy/5wotSIpkmi4A54FyuiV6UM7VS2dxaiLG8Q=;
	b=uI9nokc6UisdMbc8U1aJla3fOsL2aOi87kdEz7BqdFPeSs2JAaqgGMzrLBWpQ+2Xiu
	+oh+h8YmKkA8eGMQk1mrSd33/x+zbrJ7a9WYS333C3cE57RdIx4ENTgh9+cC0y1ww0wO
	chShyDnU/qFXZbwCYDzNaF0Iq2r3/MyWgHR717V3gU5sVxAYMqEFfDmddtTH1hPssxuk
	XW0H+IBfjRAozRDB2i/dzx02NDXPT/IIgRAYqST7qauJgcna34nWExZ2SjceLQuFV/R8
	71aMkNZCBMDJLpX9oFawu+2NvFhWt8xGWNkzBc8DY+Gva3eQ87D6z/ibXhWqPNSb48Os
	bfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AA4lX2oy/5wotSIpkmi4A54FyuiV6UM7VS2dxaiLG8Q=;
	b=K6+jTD/8HYCBL/huWSHeXt9qye8jCag9I1uBCDfGnoVzgtlBrX/bJmSSsoQM6Q+C4u
	wwO/iM00yDok7uQE8jd+tnTaC36nwwyZgsHhUtRMeZ8xGN/y+ysasOPQ6aP9Atd6lDrv
	bEWe1/zRFn0W9hR9NW2hSzhR+UyFT/527Tqmogqniwx3X+vw6ZZ53IAzVA1img3R3bYE
	XOlilPnWGcNjOOwSQVYROagEQG6RzueddHkKKL4UFNVLGx+lSdOZMezJKwA+VJcmVe47
	zB1KUuSdYwpxAJm4O4Ijmr2jDNZmqenXhETyTUJsCm8DL+/Zb6WW123zU/veDDaaslCv
	4mGQ==
X-Gm-Message-State: AKwxytfgwzjMjYI1kyuCVIngivm0hDwx8RNCNoy+BR0L1KNcQ/JVG7kO
	rbL3mNaDSHX42guGgWNCrqk=
X-Received: by 10.55.95.198 with SMTP id t189mr30910882qkb.171.1515704208994; 
	Thu, 11 Jan 2018 12:56:48 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.56.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:56:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:06 -0300
Message-Id: <20180111205626.23291-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v6 01/21] sdhci: add a 'spec_version property'
 (default to v2)
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
X-TUID: 6QBx49NrQKEE

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci-internal.h |  4 ++--
 include/hw/sd/sdhci.h  |  2 ++
 hw/sd/sdhci.c          | 19 +++++++++++++++++--
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index fc807f08f3..b7751c815f 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -210,9 +210,9 @@
 /* Slot interrupt status */
 #define SDHC_SLOT_INT_STATUS            0xFC
 
-/* HWInit Host Controller Version Register 0x0401 */
+/* HWInit Host Controller Version Register */
 #define SDHC_HCVER                      0xFE
-#define SD_HOST_SPECv2_VERS             0x2401
+#define SDHC_HCVER_VENDOR               0x24
 
 #define SDHC_REGISTERS_MAP_SIZE         0x100
 #define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 6117004949..8786676ac8 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -76,6 +76,7 @@ typedef struct SDHCIState {
     /* Read-only registers */
     uint64_t capareg;      /* Capabilities Register */
     uint64_t maxcurr;      /* Maximum Current Capabilities Register */
+    uint16_t version;      /* Host Controller Version Register */
 
     uint8_t  *fifo_buffer; /* SD host i/o FIFO buffer */
     uint32_t buf_maxsz;
@@ -90,6 +91,7 @@ typedef struct SDHCIState {
 
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
+    uint8_t spec_version;
 } SDHCIState;
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 7a2901ae4a..c8f750451e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -173,7 +173,8 @@ static void sdhci_reset(SDHCIState *s)
 
     timer_del(s->insert_timer);
     timer_del(s->transfer_timer);
-    /* Set all registers to 0. Capabilities registers are not cleared
+
+    /* Set all registers to 0. Capabilities/Version registers are not cleared
      * and assumed to always preserve their value, given to them during
      * initialization */
     memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdmasysad);
@@ -917,7 +918,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = (uint32_t)(s->admasysaddr >> 32);
         break;
     case SDHC_SLOT_INT_STATUS:
-        ret = (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
+        ret = (s->version << 16) | sdhci_slotint(s);
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
@@ -1173,6 +1174,15 @@ static inline unsigned int sdhci_get_fifolen(SDHCIState *s)
     }
 }
 
+static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
+{
+    if (s->spec_version != 2) {
+        error_setg(errp, "Only Spec v2 is supported");
+        return;
+    }
+    s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
+}
+
 static void sdhci_initfn(SDHCIState *s)
 {
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
@@ -1184,6 +1194,10 @@ static void sdhci_initfn(SDHCIState *s)
 
 static void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
+    sdhci_init_readonly_registers(s, errp);
+    if (errp && *errp) {
+        return;
+    }
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
@@ -1282,6 +1296,7 @@ const VMStateDescription sdhci_vmstate = {
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
 static Property sdhci_properties[] = {
+    DEFINE_PROP_UINT8("sd-spec-version", SDHCIState, spec_version, 2),
     DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
             SDHC_CAPAB_REG_DEFAULT),
     DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
-- 
2.15.1


Received: by 10.25.205.13 with SMTP id d13csp10448600lfg;
        Fri, 6 Jan 2017 10:57:13 -0800 (PST)
X-Received: by 10.200.46.36 with SMTP id r33mr4738337qta.92.1483729033428;
        Fri, 06 Jan 2017 10:57:13 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h188si2922829qke.106.2017.01.06.10.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 10:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPZhO-0001Yo-NN
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 13:57:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaT-0004du-Mh
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cPZaS-0006cZ-On
	for qemu-devel@nongnu.org; Fri, 06 Jan 2017 13:50:01 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cPZaS-0006cG-HO; Fri, 06 Jan 2017 13:50:00 -0500
Received: by mail-lf0-x242.google.com with SMTP id j75so6697802lfe.3;
	Fri, 06 Jan 2017 10:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DsXI8JZ52h/GDaA/3NJI7uSk6apHIGubEL03CIQe3Mo=;
	b=TzFpQnT7SyMk2BqeYSRwFkEnk4tA6Q3VRlKhWVmb2VHd9Au0QSofz27V6PBKrqhlyu
	vJeXRgzzzwyUz6W7K1OUodoq8zj7HcX3r7msWlb9D0vfFB1RDcANx1BcqPCOnmT0wN3n
	ubDzeeVPoD27wy0LtRi8I7RVfWS0vtJ3Um1NoUvCxRm3nWJYu9ODJU1gcYSMZdqxpE9J
	Xgxa9wzckJwyGim4tF4iEzP9QkBtbvIelyiezoNAPb4d3TDcmXDP3Aj3w6vvV2tknbya
	kEEGUIoez/VAHQdiS6f2MkH3m36iIuZBdtwmvtq9P3NRzZWo5FrKncahkoZ+pvwcdr3v
	frKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DsXI8JZ52h/GDaA/3NJI7uSk6apHIGubEL03CIQe3Mo=;
	b=AROCGJ+dFFecTtWLgWlY2sLCOeD5eDOwDZUDzTkiaP6EL7wdgS9FYQ3tqU8BzCOZ/p
	55ob1lRxyyXFrtl7hNDxPSUBNa47hB2ycfnfoLaJgGiaWJRkZyMo96dedsOMOFoH93DY
	KrNk7MKyrDcdiqwunG2UW6KOLdaIluMlYOehGFwUx1qb1ee9OE7sjB7pJtd1sDru7jkh
	sujjSIF2tSRBvoaEfPSwOybQtFR6pT3TV2KEp8UJ2Uv3OqI1eqs0NDiBzUlr+NrLz3+2
	iz5IHbKc1FJBfx1J0drfuTxQVwnO7XsPe6C22aMdApjes3uZe/fpjMQGsouBD04HnFgI
	ANdQ==
X-Gm-Message-State: AIkVDXLOMHlV8beNrGcpDi8FIhObbR0XNqtJgONiXEKlxSrCAU8Tl5u83Jd3RwHG/y1bqw==
X-Received: by 10.46.0.167 with SMTP id e39mr975369lji.49.1483728599178;
	Fri, 06 Jan 2017 10:49:59 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50]) by smtp.gmail.com with ESMTPSA id
	f42sm19448777lji.2.2017.01.06.10.49.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 10:49:58 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Fri,  6 Jan 2017 19:49:47 +0100
Message-Id: <20170106184948.3422-3-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170106184948.3422-1-mar.krzeminski@gmail.com>
References: <20170106184948.3422-1-mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v2 2/3] block: m25p80: Introduce die erase
 command
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6w1O6pIGNXUf

Modern big flash nor devices consist from more than one die.
Some of them do not support chip erase and instead have die
erase command that can erase one die only. This commit adds
possibility to define number of dies in the chip and adds
support for die erase command. Nor flash model is not strict
thus option to disable chip eras was not added.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 hw/block/m25p80.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 6dff81b..b065ddc 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -73,6 +73,12 @@ typedef struct FlashPartInfo {
     uint32_t n_sectors;
     uint32_t page_size;
     uint16_t flags;
+    /*
+     * Big sized spi nor are often stacked devices, thus sometime
+     * replace chip erase with die erase.
+     * This field inform how many die is in the chip.
+     */
+    uint8_t die_cnt;
 } FlashPartInfo;
 
 /* adapted from linux */
@@ -90,7 +96,8 @@ typedef struct FlashPartInfo {
     .sector_size = (_sector_size),\
     .n_sectors = (_n_sectors),\
     .page_size = 256,\
-    .flags = (_flags),
+    .flags = (_flags),\
+    .die_cnt = 0
 
 #define INFO6(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors, _flags)\
     .part_name = _part_name,\
@@ -107,6 +114,24 @@ typedef struct FlashPartInfo {
     .n_sectors = (_n_sectors),\
     .page_size = 256,\
     .flags = (_flags),\
+    .die_cnt = 0
+
+#define INFO_STACKED(_part_name, _jedec_id, _ext_id, _sector_size, _n_sectors,\
+                    _flags, _die_cnt)\
+    .part_name = _part_name,\
+    .id = {\
+        ((_jedec_id) >> 16) & 0xff,\
+        ((_jedec_id) >> 8) & 0xff,\
+        (_jedec_id) & 0xff,\
+        ((_ext_id) >> 8) & 0xff,\
+        (_ext_id) & 0xff,\
+          },\
+    .id_len = (!(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))),\
+    .sector_size = (_sector_size),\
+    .n_sectors = (_n_sectors),\
+    .page_size = 256,\
+    .flags = (_flags),\
+    .die_cnt = _die_cnt
 
 #define JEDEC_NUMONYX 0x20
 #define JEDEC_WINBOND 0xEF
@@ -359,6 +384,8 @@ typedef enum {
 
     REVCR = 0x65,
     WEVCR = 0x61,
+
+    DIE_ERASE = 0xC4,
 } FlashCMD;
 
 typedef enum {
@@ -514,6 +541,17 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
     case BULK_ERASE:
         len = s->size;
         break;
+    case DIE_ERASE:
+        if (s->pi->die_cnt) {
+            len = s->size / s->pi->die_cnt;
+            offset = offset & (~(len - 1));
+            printf("Die erase len = 0x%X offset = 0x%X!\n", len, offset);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not supported"
+                          " by device\n");
+            return;
+        }
+        break;
     default:
         abort();
     }
@@ -635,6 +673,7 @@ static void complete_collecting_data(Flash *s)
     case ERASE4_32K:
     case ERASE_SECTOR:
     case ERASE4_SECTOR:
+    case DIE_ERASE:
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
@@ -881,6 +920,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case PP:
     case PP4:
     case PP4_4:
+    case DIE_ERASE:
         s->needed_bytes = get_addr_length(s);
         s->pos = 0;
         s->len = 0;
-- 
2.9.3


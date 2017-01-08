Received: by 10.25.205.13 with SMTP id d13csp11030567lfg;
        Sun, 8 Jan 2017 00:39:42 -0800 (PST)
X-Received: by 10.233.235.214 with SMTP id b205mr81673374qkg.156.1483864782779;
        Sun, 08 Jan 2017 00:39:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m30si53928242qtg.333.2017.01.08.00.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Jan 2017 00:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQ90t-0004tI-Ug
	for alex.bennee@linaro.org; Sun, 08 Jan 2017 03:39:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90Q-0004Zv-6v
	for qemu-arm@nongnu.org; Sun, 08 Jan 2017 03:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90O-0000Oi-UT
	for qemu-arm@nongnu.org; Sun, 08 Jan 2017 03:39:10 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cQ90M-0000Ns-6o; Sun, 08 Jan 2017 03:39:06 -0500
Received: by mail-lf0-x242.google.com with SMTP id q89so3147559lfi.1;
	Sun, 08 Jan 2017 00:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R6Kj0AxVGeZxw51j6IDlzDTmqnBet8BaKBFzZNq4Q2g=;
	b=IX3Jzk/V3gB3h7IyQk7jqD8TZMh7v/2h1gsmFvIXwI0vyhXWvAYTTdHv8Vs9k1UZ3U
	F4MQNm3AMGi/I5B4bMN6N0OupRhWGPbFd1zwMNTS81DVR12PlD8orgV+m1A45DHTBbtU
	4E3PrJh/Ef2xoLf6VvgDUuNwpbjMEpZm+gi0A5qhXVmdgUL8DkhI1nezdUV4nk4DtZkl
	gUglaiz1WDLi7MHLTpOw6r8Qz8c1Ltb223TSgCiAbOi6FmO/9bmVcUhtWKnzZ/nZZ7o8
	l6zGS+qM2dFfuDzgCr33L1jI8WHz3osCSC5B5/AfNiIgBdEy0xmv5ji9xguUVKkejfxF
	JUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R6Kj0AxVGeZxw51j6IDlzDTmqnBet8BaKBFzZNq4Q2g=;
	b=JCemCnU3uQAzWC7oKTBGhRnmpq3M/g6OSXY4DhaLrof9ZZ2InVzRqPZLHtmEgLZ/Vg
	aI/crG8BDSXer4coiQ6fqD8SfhSrtkJSoaK5CbgGcdUlqCoIv5+0C5K3cgUajTezwQwH
	VwgEEBm5za5WpsHLw0t62vVBDWWwZ5eQOR1945G4vDWNBbudQKTSqC/0kHSdDBBuglaL
	9sFHDcJ0fKx2h/0QUePmDpbh7mPqelIGzg+kpj0exznBFouimlpREGWetNdWeOm++AsO
	FO66YXnB9VFaQDRwVbh18YsXKMqA8o6NsPlqkcG+R1rclAdycGBCppEj6wgl226qqTZR
	L9gw==
X-Gm-Message-State: AIkVDXK8FSqcRZCAM2H026qKdDpSpXnQAk507pkWCf9Ykskfk93/JnI/Cjjo9E61aHz/wg==
X-Received: by 10.25.92.153 with SMTP id u25mr22514009lfi.10.1483864744766;
	Sun, 08 Jan 2017 00:39:04 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50])
	by smtp.gmail.com with ESMTPSA id 1sm18532752ljv.40.2017.01.08.00.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jan 2017 00:39:04 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Sun,  8 Jan 2017 09:38:53 +0100
Message-Id: <20170108083854.5006-3-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170108083854.5006-1-mar.krzeminski@gmail.com>
References: <20170108083854.5006-1-mar.krzeminski@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-arm] [PATCH v3 2/3] block: m25p80: Introduce die erase command
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
	mar.krzeminski@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8+xyhfFc0nO

Modern big flash nor devices consist from more than one die.
Some of them do not support chip erase and instead have die
erase command that can erase one die only. This commit adds
possibility to define number of dies in the chip and adds
support for die erase command. Nor flash model is not strict
thus option to disable chip eras was not added.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 hw/block/m25p80.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 6dff81b..a9b025b 100644
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
@@ -514,6 +541,16 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
     case BULK_ERASE:
         len = s->size;
         break;
+    case DIE_ERASE:
+        if (s->pi->die_cnt) {
+            len = s->size / s->pi->die_cnt;
+            offset = offset & (~(len - 1));
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: die erase is not supported"
+                          " by device\n");
+            return;
+        }
+        break;
     default:
         abort();
     }
@@ -635,6 +672,7 @@ static void complete_collecting_data(Flash *s)
     case ERASE4_32K:
     case ERASE_SECTOR:
     case ERASE4_SECTOR:
+    case DIE_ERASE:
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
@@ -881,6 +919,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case PP:
     case PP4:
     case PP4_4:
+    case DIE_ERASE:
         s->needed_bytes = get_addr_length(s);
         s->pos = 0;
         s->len = 0;
-- 
2.9.3


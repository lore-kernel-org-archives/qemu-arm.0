Received: by 10.223.159.74 with SMTP id f10csp7093173wrg;
        Thu, 14 Dec 2017 19:20:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBos85o/MlwZAgqKAmzxwzROe05HrHaVBgf5csb2d+FbfAD2Jn8EqfNRYsNob7tGYTU10nBI0
X-Received: by 10.129.236.2 with SMTP id j2mr5679707ywm.461.1513308037835;
        Thu, 14 Dec 2017 19:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308037; cv=none;
        d=google.com; s=arc-20160816;
        b=lPIiIYMHA1kXlkEIiZfvl675PFzG9escxNS4HWtTXT4wpfJwLaYXFBTYCLqfXHLhOu
         AekgFxi4DwhdtTkusJLZ1lPxybqXPOz64HSeAe/dugZwYSy4mi5OPFEcJ4Re10iheKyd
         9iVRE1C1NC8ZUpTsDxBiFp0Q60ofcpbL8QHMCiLVM951DfISFyp2W1lWiJ5TU10isNgM
         mKR/RMCb7vk63BFjmaiyMCAedu81rsiiQ1ATgQ/MKu3M6kUBwwoWS8ddYYUMAQHIJOGK
         mH5O0gNOA1J/bB2iVaqjdspdf6XpQCmxzFZANqsY8essssPFQAHAx1XylPUO3Mz6ST62
         louA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ls57E8If77h5+EGITNmDYHQ6y1CEg+Rv1+7G+8wKWzU=;
        b=zW4s7QdHp3Spff5EkDl4iNpw5yIBccO740p45CQLtOXgdca8m0vvtHGxMjnRhA+q/5
         BXoPri/zWiUp+1W+m8cPcfMFzEY3lT+liZMdh8UW+CLjO/i/qtFMoEawgbCvntbJO5gx
         mbviBkfEvqOmlr9W3jAYEnSMSNue4Ym345HQsEOkdN5ojgUkddRxVUUmC4FH3bn0YP6C
         SkSK5SSyZgTPpKwGvhipQX2XCgRdaPTSuZDmHHgKWPJTBSjk/QR0fMl6Y/IkcRK5eNdU
         IemJamuZ/ww81q69TEAcT474jS561ZbSzUnMUOjSc7V8BrDaz35X1QMWIgeOzQgVPJ+a
         GpyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BroKnjvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y66si1080791ywa.475.2017.12.14.19.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BroKnjvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgY9-0000jj-4q
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:20:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUT-00060C-BP
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUR-0001Ia-FM
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:49 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUN-0001De-AT; Thu, 14 Dec 2017 22:16:43 -0500
Received: by mail-qk0-x243.google.com with SMTP id c13so8840241qke.2;
	Thu, 14 Dec 2017 19:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ls57E8If77h5+EGITNmDYHQ6y1CEg+Rv1+7G+8wKWzU=;
	b=BroKnjvoHRAVridsOQ6ibOSm5SIAtxg1V9CEyALikbd6L9e97A8lFtilDHM95Ujtuj
	EDN+NnWr4tzSwLKe7UMKuUh4Ynr1Ys8ug18JKf7B/ct5N02bz5nxzvaicToWJJtijmnt
	9sEiDS2wMsZ96VpL+Mrd2WxxHgDudVEqaIGssm5hlvP66N2SrqTBCuXBf7gd1FkwpNmh
	nXxTGdhImOhRCQKnlUecdtcSv9BYbtqPwS6lb3V0dAhAapN741L0dOCtnvkN/rvXTALG
	bNJPu/2PsEOYVRjc7F3pYpU261ojtG3WQre3NZwzTHD68aYAh5UD/3W/+BfWpa6/Ruh6
	mkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ls57E8If77h5+EGITNmDYHQ6y1CEg+Rv1+7G+8wKWzU=;
	b=cgXmEsu7t1MTpyBq0S1qqFQ0zfm9dXGPaz9f+9QAYAkKsPqwOzHBS7AWXeJFxN9czK
	c4KWSHymquQR56I2uS4jpv/i3Ea3CTjXWvQiSmdVVgb5IJl+gs/5vZZULF8x7Hmhyqha
	X9JwuvekQSWMIIlNZveRQ1eTJqa5v5AqMOlGkaFtw+Nih8hvrqTCD//nCnaqbeMmvQce
	jpbAd8QciYnQsQsMHjfT8cnBrVWR3AfBtQHkfUC8hN4ytir5ydP4XTmK+GFwtL5twaJk
	DTJ/vmvFmOCIIutt9pKkSk+oC55CoaNrTbEhnlXtBmEUMzs49dMYIH2Q5fr+qlgyp8/s
	tBow==
X-Gm-Message-State: AKGB3mLZ8sd6ALmUv5R3rXmmdGjPDsu0/HgyhUjlEBWFwUEgqYyhME/x
	eA5Up1xTOFPWJ/c4DiXS22o=
X-Received: by 10.55.221.212 with SMTP id u81mr19357290qku.174.1513307802752; 
	Thu, 14 Dec 2017 19:16:42 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:36 -0300
Message-Id: <20171215031547.31006-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] [PATCH v2 09/20] sdhci: convert the DPRINT() calls into
 trace events
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HfgXnoxHe30I

zero-initialize ADMADescr 'dscr' in sdhci_do_adma() to avoid:

  hw/sd/sdhci.c: In function ‘sdhci_do_adma’:
  hw/sd/sdhci.c:714:29: error: ‘dscr.addr’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
             trace_sdhci_adma("link", s->admasysaddr);
                             ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci.c      | 89 ++++++++++++++++++------------------------------------
 hw/sd/trace-events | 14 +++++++++
 2 files changed, 44 insertions(+), 59 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index ca71a70148..ba3afddcf2 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -33,30 +33,7 @@
 #include "sdhci-internal.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
-
-/* host controller debug messages */
-#ifndef SDHC_DEBUG
-#define SDHC_DEBUG                        0
-#endif
-
-#define DPRINT_L1(fmt, args...) \
-    do { \
-        if (SDHC_DEBUG) { \
-            fprintf(stderr, "QEMU SDHC: " fmt, ## args); \
-        } \
-    } while (0)
-#define DPRINT_L2(fmt, args...) \
-    do { \
-        if (SDHC_DEBUG > 1) { \
-            fprintf(stderr, "QEMU SDHC: " fmt, ## args); \
-        } \
-    } while (0)
-#define ERRPRINT(fmt, args...) \
-    do { \
-        if (SDHC_DEBUG) { \
-            fprintf(stderr, "QEMU SDHC ERROR: " fmt, ## args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 #define TYPE_SDHCI_BUS "sdhci-bus"
 #define SDHCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_SDHCI_BUS)
@@ -154,8 +131,8 @@ static void sdhci_raise_insertion_irq(void *opaque)
 static void sdhci_set_inserted(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
-    DPRINT_L1("Card state changed: %s!\n", level ? "insert" : "eject");
 
+    trace_sdhci_set_inserted(level ? "insert" : "eject");
     if ((s->norintsts & SDHC_NIS_REMOVE) && level) {
         /* Give target some time to notice card ejection */
         timer_mod(s->insert_timer,
@@ -237,7 +214,8 @@ static void sdhci_send_command(SDHCIState *s)
     s->acmd12errsts = 0;
     request.cmd = s->cmdreg >> 8;
     request.arg = s->argument;
-    DPRINT_L1("sending CMD%u ARG[0x%08x]\n", request.cmd, request.arg);
+
+    trace_sdhci_send_command(request.cmd, request.arg);
     rlen = sdbus_do_command(&s->sdbus, &request, response);
 
     if (s->cmdreg & SDHC_CMD_RESPONSE) {
@@ -245,7 +223,7 @@ static void sdhci_send_command(SDHCIState *s)
             s->rspreg[0] = (response[0] << 24) | (response[1] << 16) |
                            (response[2] << 8)  |  response[3];
             s->rspreg[1] = s->rspreg[2] = s->rspreg[3] = 0;
-            DPRINT_L1("Response: RSPREG[31..0]=0x%08x\n", s->rspreg[0]);
+            trace_sdhci_response4(s->rspreg[0]);
         } else if (rlen == 16) {
             s->rspreg[0] = (response[11] << 24) | (response[12] << 16) |
                            (response[13] << 8) |  response[14];
@@ -255,11 +233,10 @@ static void sdhci_send_command(SDHCIState *s)
                            (response[5] << 8)  |  response[6];
             s->rspreg[3] = (response[0] << 16) | (response[1] << 8) |
                             response[2];
-            DPRINT_L1("Response received:\n RSPREG[127..96]=0x%08x, RSPREG[95.."
-                  "64]=0x%08x,\n RSPREG[63..32]=0x%08x, RSPREG[31..0]=0x%08x\n",
-                  s->rspreg[3], s->rspreg[2], s->rspreg[1], s->rspreg[0]);
+            trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
+                                   s->rspreg[1], s->rspreg[0]);
         } else {
-            ERRPRINT("Timeout waiting for command response\n");
+            trace_sdhci_error("timeout waiting for command response");
             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
                 s->errintsts |= SDHC_EIS_CMDTIMEOUT;
                 s->norintsts |= SDHC_NIS_ERR;
@@ -293,7 +270,7 @@ static void sdhci_end_transfer(SDHCIState *s)
 
         request.cmd = 0x0C;
         request.arg = 0;
-        DPRINT_L1("Automatically issue CMD%d %08x\n", request.cmd, request.arg);
+        trace_sdhci_end_transfer(request.cmd, request.arg);
         sdbus_do_command(&s->sdbus, &request, response);
         /* Auto CMD12 response goes to the upper Response register */
         s->rspreg[3] = (response[0] << 24) | (response[1] << 16) |
@@ -362,7 +339,7 @@ static uint32_t sdhci_read_dataport(SDHCIState *s, unsigned size)
 
     /* first check that a valid data exists in host controller input buffer */
     if ((s->prnsts & SDHC_DATA_AVAILABLE) == 0) {
-        ERRPRINT("Trying to read from empty buffer\n");
+        trace_sdhci_error("read from empty buffer");
         return 0;
     }
 
@@ -371,8 +348,7 @@ static uint32_t sdhci_read_dataport(SDHCIState *s, unsigned size)
         s->data_count++;
         /* check if we've read all valid data (blksize bytes) from buffer */
         if ((s->data_count) >= (s->blksize & 0x0fff)) {
-            DPRINT_L2("All %u bytes of data have been read from input buffer\n",
-                    s->data_count);
+            trace_sdhci_read_dataport(s->data_count);
             s->prnsts &= ~SDHC_DATA_AVAILABLE; /* no more data in a buffer */
             s->data_count = 0;  /* next buff read must start at position [0] */
 
@@ -455,7 +431,7 @@ static void sdhci_write_dataport(SDHCIState *s, uint32_t value, unsigned size)
 
     /* Check that there is free space left in a buffer */
     if (!(s->prnsts & SDHC_SPACE_AVAILABLE)) {
-        ERRPRINT("Can't write to data buffer: buffer full\n");
+        trace_sdhci_error("Can't write to data buffer: buffer full");
         return;
     }
 
@@ -464,8 +440,7 @@ static void sdhci_write_dataport(SDHCIState *s, uint32_t value, unsigned size)
         s->data_count++;
         value >>= 8;
         if (s->data_count >= (s->blksize & 0x0fff)) {
-            DPRINT_L2("write buffer filled with %u bytes of data\n",
-                    s->data_count);
+            trace_sdhci_write_dataport(s->data_count);
             s->data_count = 0;
             s->prnsts &= ~SDHC_SPACE_AVAILABLE;
             if (s->prnsts & SDHC_DOING_WRITE) {
@@ -653,15 +628,14 @@ static void sdhci_do_adma(SDHCIState *s)
 {
     unsigned int n, begin, length;
     const uint16_t block_size = s->blksize & 0x0fff;
-    ADMADescr dscr;
+    ADMADescr dscr = {};
     int i;
 
     for (i = 0; i < SDHC_ADMA_DESCS_PER_DELAY; ++i) {
         s->admaerr &= ~SDHC_ADMAERR_LENGTH_MISMATCH;
 
         get_adma_description(s, &dscr);
-        DPRINT_L2("ADMA loop: addr=" TARGET_FMT_plx ", len=%d, attr=%x\n",
-                dscr.addr, dscr.length, dscr.attr);
+        trace_sdhci_adma_loop(dscr.addr, dscr.length, dscr.attr);
 
         if ((dscr.attr & SDHC_ADMA_ATTR_VALID) == 0) {
             /* Indicate that error occurred in ST_FDS state */
@@ -744,8 +718,7 @@ static void sdhci_do_adma(SDHCIState *s)
             break;
         case SDHC_ADMA_ATTR_ACT_LINK:   /* link to next descriptor table */
             s->admasysaddr = dscr.addr;
-            DPRINT_L1("ADMA link: admasysaddr=0x%" PRIx64 "\n",
-                      s->admasysaddr);
+            trace_sdhci_adma("link", s->admasysaddr);
             break;
         default:
             s->admasysaddr += dscr.incr;
@@ -753,8 +726,7 @@ static void sdhci_do_adma(SDHCIState *s)
         }
 
         if (dscr.attr & SDHC_ADMA_ATTR_INT) {
-            DPRINT_L1("ADMA interrupt: admasysaddr=0x%" PRIx64 "\n",
-                      s->admasysaddr);
+            trace_sdhci_adma("interrupt", s->admasysaddr);
             if (s->norintstsen & SDHC_NISEN_DMA) {
                 s->norintsts |= SDHC_NIS_DMA;
             }
@@ -765,15 +737,15 @@ static void sdhci_do_adma(SDHCIState *s)
         /* ADMA transfer terminates if blkcnt == 0 or by END attribute */
         if (((s->trnmod & SDHC_TRNS_BLK_CNT_EN) &&
                     (s->blkcnt == 0)) || (dscr.attr & SDHC_ADMA_ATTR_END)) {
-            DPRINT_L2("ADMA transfer completed\n");
+            trace_sdhci_adma_transfer_completed();
             if (length || ((dscr.attr & SDHC_ADMA_ATTR_END) &&
                 (s->trnmod & SDHC_TRNS_BLK_CNT_EN) &&
                 s->blkcnt != 0)) {
-                ERRPRINT("SD/MMC host ADMA length mismatch\n");
+                trace_sdhci_error("SD/MMC host ADMA length mismatch");
                 s->admaerr |= SDHC_ADMAERR_LENGTH_MISMATCH |
                         SDHC_ADMAERR_STATE_ST_TFR;
                 if (s->errintstsen & SDHC_EISEN_ADMAERR) {
-                    ERRPRINT("Set ADMA error flag\n");
+                    trace_sdhci_error("Set ADMA error flag");
                     s->errintsts |= SDHC_EIS_ADMAERR;
                     s->norintsts |= SDHC_NIS_ERR;
                 }
@@ -809,7 +781,7 @@ static void sdhci_data_transfer(void *opaque)
             break;
         case SDHC_CTRL_ADMA1_32:
             if (!(s->capareg & SDHC_CAN_DO_ADMA1)) {
-                ERRPRINT("ADMA1 not supported\n");
+                trace_sdhci_error("ADMA1 not supported");
                 break;
             }
 
@@ -817,7 +789,7 @@ static void sdhci_data_transfer(void *opaque)
             break;
         case SDHC_CTRL_ADMA2_32:
             if (!(s->capareg & SDHC_CAN_DO_ADMA2)) {
-                ERRPRINT("ADMA2 not supported\n");
+                trace_sdhci_error("ADMA2 not supported");
                 break;
             }
 
@@ -826,14 +798,14 @@ static void sdhci_data_transfer(void *opaque)
         case SDHC_CTRL_ADMA2_64:
             if (!(s->capareg & SDHC_CAN_DO_ADMA2) ||
                     !(s->capareg & SDHC_64_BIT_BUS_SUPPORT)) {
-                ERRPRINT("64 bit ADMA not supported\n");
+                trace_sdhci_error("64 bit ADMA not supported");
                 break;
             }
 
             sdhci_do_adma(s);
             break;
         default:
-            ERRPRINT("Unsupported DMA type\n");
+            trace_sdhci_error("Unsupported DMA type");
             break;
         }
     } else {
@@ -868,8 +840,8 @@ static inline bool
 sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
 {
     if ((s->data_count & 0x3) != byte_num) {
-        ERRPRINT("Non-sequential access to Buffer Data Port register"
-                "is prohibited\n");
+        trace_sdhci_error("Non-sequential access to Buffer Data Port register"
+                          "is prohibited\n");
         return false;
     }
     return true;
@@ -899,8 +871,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
     case  SDHC_BDATA:
         if (sdhci_buff_access_is_sequential(s, offset - SDHC_BDATA)) {
             ret = sdhci_read_dataport(s, size);
-            DPRINT_L2("read %ub: addr[0x%04x] -> %u(0x%x)\n", size, (int)offset,
-                      ret, ret);
+            trace_sdhci_access("read", size, offset, "->", ret, ret);
             return ret;
         }
         break;
@@ -952,7 +923,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
 
     ret >>= (offset & 0x3) * 8;
     ret &= (1ULL << (size * 8)) - 1;
-    DPRINT_L2("read %ub: addr[0x%04x] -> %u(0x%x)\n", size, (int)offset, ret, ret);
+    trace_sdhci_access("read", size, offset, "->", ret, ret);
     return ret;
 }
 
@@ -1154,8 +1125,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
                       "not implemented\n", size, offset, value >> shift);
         break;
     }
-    DPRINT_L2("write %ub: addr[0x%04x] <- %u(0x%x)\n",
-              size, (int)offset, value >> shift, value >> shift);
+    trace_sdhci_access("write", size, offset, "<-",
+                       value >> shift, value >> shift);
 }
 
 static const MemoryRegionOps sdhci_mmio_ops = {
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 1fc0bcf44b..e4e26c6d73 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -1,5 +1,19 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# hw/sd/sdhci.c
+sdhci_set_inserted(const char *level) "card state changed: %s"
+sdhci_send_command(uint8_t cmd, uint32_t arg) "sending CMD%02u ARG[0x%08x]"
+sdhci_error(const char *msg) "%s"
+sdhci_response4(uint32_t r0) "Response: RSPREG[31..0]=0x%08x"
+sdhci_response16(uint32_t r3, uint32_t r2, uint32_t r1, uint32_t r0) "Response received: RSPREG[127..96]=0x%08x, RSPREG[95..64]=0x%08x, RSPREG[63..32]=0x%08x, RSPREG[31..0]=0x%08x"
+sdhci_end_transfer(uint8_t cmd, uint32_t arg) "Automatically issue CMD%02u 0x%08x"
+sdhci_adma(const char *desc, uint32_t sysad) "ADMA %s: admasysaddr=0x%" PRIx32
+sdhci_adma_loop(uint64_t addr, uint16_t length, uint8_t attr) "ADMA loop: addr=0x%08" PRIx64 ", len=%d, attr=0x%x"
+sdhci_adma_transfer_completed(void) "ADMA transfer completed"
+sdhci_access(const char *access, unsigned int size, uint64_t offset, const char *dir, uint64_t val, uint64_t val2) "%s %ub: addr[0x%04" PRIx64 "] %s %" PRIu64 "(0x%" PRIx64 ")"
+sdhci_read_dataport(uint16_t data_count) "all %u bytes of data have been read from input buffer"
+sdhci_write_dataport(uint16_t data_count) "write buffer filled with %u bytes of data"
+
 # hw/sd/milkymist-memcard.c
 milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-- 
2.15.1


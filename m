Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800921lfj;
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr3329667wmo.191.1641921054721;
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921054; cv=none;
        d=google.com; s=arc-20160816;
        b=Oiz+H1aXb5iKt1HSi3Fddchp0I0B6XZ20dk8D5srxyo7u/DJJCHEseOD1V5/mmYjpH
         OVWaEatlqCf61++IFYMP3Hor5MjjfdX0RY5vbiesgcDx8kSkDdLah5JL0SHMmU6yNLAo
         iuHLJ5SYzbw8pxvBN6QOFdYkYDp2KU8dyHO4d6xpM5WTmtMBoQFE4xS374yFA823ns7G
         3vENOe0r6bctCTLyVcXLDNzbq9y1V1l6Fu4t2k4LsIF0mAMZMCTzdsfDlkgr3LeOEAG/
         oORbB6LYnv4KyJBYhcsfdiU+5qHuJ13/0q+r6keRQ0raWQJqHWYrgD1ug5Bu0NX4tdOc
         XDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BFQHZs/9RH00d4p+SGa4ONXVkeFMreYGGrbWyj+yUJQ=;
        b=nigJmk/kK8Lg4S3DQfCDf06v+W1yHOTxHs1NVYHIWuBuuhUIwpg374JYbopCJy9ZGK
         uDRXKLSFPx8KjHMkkG4CKxYXLgL6e/2so3zeb/dfXXPBOrnJbI0wZYGEYU6PpprmZFLq
         4DHZutBbJA5bKWV2Su6s/FO7dYZIXjWFnlzlX7DdKrrC0BDI4MC9oJ7Jo2RjyTZulcr4
         AhMSwUyXZi5YoxzqfCtz4dS91v5Gk+Kd+nGAPhb7uwoQddY5FNuc3jcVlnv1Z50oznTL
         Eu+5lwfTn37rAAYbdRa0ajsFVtlv68WT2HODQPy272/6g7y0dAH3RER3pV8T44dPYFy2
         4Rxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sRGzxppK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u16sor1294144wmq.4.2022.01.11.09.10.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sRGzxppK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BFQHZs/9RH00d4p+SGa4ONXVkeFMreYGGrbWyj+yUJQ=;
        b=sRGzxppK0CVZpo3DwmGDhKmGqTyklwhik1ijePBdJL9knV6Q/qcRZgIRZbYsKwEosK
         JiCq+aM6rrHA5g7vsf+3FqRoRqAM+6FPa/gr9KssacX9iObim8ao088I0rEV1s5v/TC2
         2b4++e+HcTeE6i7YWJpouLqhhaoOER2Vn2PNLaZ7vsrMEpQo/n7k7xt27RWrMA6qFK0Z
         +idhF1AQNfr6IFrHfereaTrvjb8qawUTl7YBQh41PMiw9yefnDXlrsbs/tRCoKjIV3NX
         reIyrgQlgEmXFvL5fQN6vrXmpVzG1l4lUg4nivC6BCnBDxQzm/uH7V/zsg2SZSwMtNUk
         6GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFQHZs/9RH00d4p+SGa4ONXVkeFMreYGGrbWyj+yUJQ=;
        b=em+bmW8I7L6BcoQLmi1H2r0Q9vKRBWZ7czaizh8LK1+F5meyfHHLrR46xgu5Xu8Uv5
         6u5L3L2t8dkOrLD3zZtjc0o5oNMfl45pF++6rU8Z1lAYSvFzhyUusc+IRysqE40HRQVW
         3FHUBv9OhbxtRVeyxSple3f29kL/5hELYqcfwYoI1Y7Nf7AaVWtRm0tjdeptIiJAbnHF
         oMArb17qQjiOZtNBcbkmNsPt9j44lTlCR0zbxO1TveqxNpd6DRHI9uARMGG0/ZoeK1gp
         kSLPZw6XRBCJfAAxAzQGAAc0Ku3v2dNREVpBw/HfjmVDOWCzyr+1uqnxfvLRr8wQNAI8
         G+Cg==
X-Gm-Message-State: AOAM5333Jr3xo4d+eNau1D/WwV/o8zeaa6Lr87vmHYhnMGgEbppF0LvS
	bXFd27I4hMuwanswuswH3gyqmeTd
X-Google-Smtp-Source: ABdhPJyvPn/YOova4KWHZdwJdW/qIXMbFBhuOvb6W9+JLB38UL/OmCq5TO5Dagz85dVYdLqfj6vffQ==
X-Received: by 2002:a05:600c:1f18:: with SMTP id bd24mr3260908wmb.174.1641921054326;
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 05/13] hw/intc/arm_gicv3_its: Use enum for return value of process_* functions
Date: Tue, 11 Jan 2022 17:10:40 +0000
Message-Id: <20220111171048.3545974-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iIaJuVb1TzqM

When an ITS detects an error in a command, it has an
implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
to ignore the command, proceeding to the next one in the queue, or to
stall the ITS command queue, processing nothing further.  The
behaviour required when the read of the command packet from memory
fails is less clearly documented, but the same set of choices as for
command errors seem reasonable.

The intention of the QEMU implementation, as documented in the
comments, is that if we encounter a memory error reading the command
packet or one of the various data tables then we should stall, but
for command parameter errors we should ignore the queue and continue.
However, we don't actually do this.  To get the desired behaviour,
the various process_* functions need to return true to cause
process_cmdq() to advance to the next command and keep processing,
and false to stall command processing.  What they mostly do is return
false for any kind of error.

To make the code clearer, replace the 'bool' return from the process_
functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
In this commit no behaviour changes; in subsequent commits we will
adjust the error-return paths for the process_ functions one by one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c1f76682d04..10901a5e709 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -45,6 +45,23 @@ typedef struct {
     uint64_t itel;
 } IteEntry;
 
+/*
+ * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
+ * if a command parameter is not correct. These include both "stall
+ * processing of the command queue" and "ignore this command, and
+ * keep processing the queue". In our implementation we choose that
+ * memory transaction errors reading the command packet provoke a
+ * stall, but errors in parameters cause us to ignore the command
+ * and continue processing.
+ * The process_* functions which handle individual ITS commands all
+ * return an ItsCmdResult which tells process_cmdq() whether it should
+ * stall or keep going.
+ */
+typedef enum ItsCmdResult {
+    CMD_STALL = 0,
+    CMD_CONTINUE = 1,
+} ItsCmdResult;
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -217,8 +234,8 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
  * 3. handling of ITS CLEAR command
  * 4. handling of ITS DISCARD command
  */
-static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
-                            ItsCmdType cmd)
+static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, ItsCmdType cmd)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
@@ -231,7 +248,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
     uint64_t rdbase;
 
     if (cmd == NONE) {
@@ -324,15 +341,15 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (cmd == DISCARD) {
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
-            result = update_ite(s, eventid, dte, ite);
+            result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
         }
     }
 
     return result;
 }
 
-static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
-                          bool ignore_pInt)
+static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                  uint32_t offset, bool ignore_pInt)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
@@ -343,7 +360,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -404,7 +421,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-        result = update_ite(s, eventid, dte, ite);
+        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -472,14 +489,14 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     }
 }
 
-static bool process_mapc(GICv3ITSState *s, uint32_t offset)
+static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint16_t icid;
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -509,7 +526,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_cte(s, icid, valid, rdbase);
+        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -578,7 +595,8 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     }
 }
 
-static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
+static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid;
@@ -586,7 +604,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -623,7 +641,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_dte(s, devid, valid, size, itt_addr);
+        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -641,7 +659,6 @@ static void process_cmdq(GICv3ITSState *s)
     uint64_t data;
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
-    bool result = true;
     uint8_t cmd;
     int i;
 
@@ -668,6 +685,8 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
+        ItsCmdResult result = CMD_CONTINUE;
+
         cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
@@ -726,18 +745,16 @@ static void process_cmdq(GICv3ITSState *s)
         default:
             break;
         }
-        if (result) {
+        if (result == CMD_CONTINUE) {
             rd_offset++;
             rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
         } else {
-            /*
-             * in this implementation, in case of dma read/write error
-             * we stall the command processing
-             */
+            /* CMD_STALL */
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: %x cmd processing failed\n", __func__, cmd);
+                          "%s: 0x%x cmd processing failed, stalling\n",
+                          __func__, cmd);
             break;
         }
     }
-- 
2.25.1

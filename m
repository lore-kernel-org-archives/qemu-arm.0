Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583466lfk;
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
X-Received: by 2002:a05:6000:15ca:: with SMTP id y10mr21452182wry.582.1639249913133;
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249913; cv=none;
        d=google.com; s=arc-20160816;
        b=JcJBaFVYL7grt/jpnT3K9Udz/SxC0I1G61R7eT3jpUQiE/nz6DTup0JSg1Ztwz4NHY
         FN5YI0sgKoeIyM1pfIc0LC1nkTGgeJEyWFrsFBmR+SKEDVWmRNm3Cf0vzB3qwOVwUrub
         6p5G20ItDyDD9q+6uEUDpOh4MdGroJNWWKIf2WPoWsklWjbw4bq78krqp+/Dp+aZIlfm
         FjyexkiyeErNzJVc7noxekb2BmL85PIbgUmRrZY3UA0Xw0dghexchn7688zegNOxq/JW
         KGAb/nSN0EGlPnwi80BC6EXCmsT+FUaf1+UnN5lr1pkGaRSbkgLXdDb67GDTnZaeHpP9
         x3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TJuIv5J/JmxTEY+V8lHlD1XeS9m8n/+5s3Wz2HsU0Ew=;
        b=q72xOfDEoTEq5KRyrp8mbh2GkszQLsqqh1+/CWOXgf00x6UHleJIwekSMhiHEzz1Kp
         uoQ/nFxe1y2gSWKIk/4H8xNMrED7FRONOrihms/pz+OxLqEQOck/K6durwY4nwQmzp/N
         ctwX53mChanTOFwY/uifPyv6oin05JODpej/pvTEF7LId2HvcgoOnES23MQFn05725CE
         JYJSbw35NaB/YdMDdDeO2FAwWpRmT/fNHyuvNznVoXM6ye78JSFGlu9tg3dKwJ7STc07
         KHoA36idetXHe8LsFmkJBE9agerB+cdBwCspmSxWDgNmZGXQHuk43SbBeGoKw3ptTvt4
         5PkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMpfmGEX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i20sor1029142wmb.14.2021.12.11.11.11.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMpfmGEX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJuIv5J/JmxTEY+V8lHlD1XeS9m8n/+5s3Wz2HsU0Ew=;
        b=bMpfmGEX8sRQAqeKuWxelLKpazh1yBQMVDbeC0SgKS3tzRvXcyceFQy/1an2r+0OKj
         m0QvQDLyl+wjeRTQ5kbPTUu2A12YvuFhMK29W5gMIcsVYG7pMrJvj0hhUL0bl9xl+tbJ
         NotmHYuMoe2NqNlPoE9VqgbWUtQS0WSqLRgvv9hbmdwbMN3odTOD0FmIYnjbWm4Cm0Zw
         OVuL74CQT3FVw8ubzYJZlNfN1MI2jssMs+0V2fHCVORLOyGYHhqd9cvlWTJSPRrXxDbx
         f+wERu+j30BSk0rvGseuqFTMsknxjr3gorBsu85fOhGYVgWsCWxDs/G0ZtUsiv087r77
         Wq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJuIv5J/JmxTEY+V8lHlD1XeS9m8n/+5s3Wz2HsU0Ew=;
        b=dcqjT9UzjPnU+d0LiItttqTejzC6i1vHXEbTc7ve1ifi3iOLWidyvSxNguMfwPEhte
         57KxK9T+Z6QdTESvexBJdpdDSj+qLEkMkZpbHnt5e7vaKMUdbEgCAUV4PVJK9cHTbbKb
         PjyUNZpnqxPzD5AnZPa1r6XrnWT74keQHatUXfUu5B1mtvR8ohBD1iyOBvZcYi2etGh8
         FP7c6/PJDI04tzPMBIFyfKLc/WST4U2lj3GFiJYib5ZUDUb7wx8OSwJwgohTey9Opb5W
         vOMecpr6T09rA3jMk2Alv0UPNxQF/J2ErEQrTF9xky4LXK6Jz/kjQfSxKS8KFSz2bEmp
         CEmw==
X-Gm-Message-State: AOAM531VhwFioKJTwCG2n0C87FrAIx1eSgmsFhsKIkM/BMuaoy0ZeTxq
	SxdgpAPq39BhMVjEVD4TZ57KdWA9
X-Google-Smtp-Source: ABdhPJxibFBr2ELVstNnnsQKjbIbnmcSjJBmvm4B7iuGd0CJ3dNmvdWhOmgqxe2RTjLV32JCntBOLA==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr26127460wmc.47.1639249912739;
        Sat, 11 Dec 2021 11:11:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value of process_* functions
Date: Sat, 11 Dec 2021 19:11:29 +0000
Message-Id: <20211211191135.1764649-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: B0f+zLXnss3g

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
---
 hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index f3eba92946d..59dd564d91c 100644
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
+ * The process_* functions which handle invididual ITS commands all
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
@@ -323,15 +340,15 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
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
@@ -341,7 +358,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -402,7 +419,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-        result = update_ite(s, eventid, dte, ite);
+        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -470,14 +487,14 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
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
@@ -507,7 +524,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_cte(s, icid, valid, rdbase);
+        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -576,7 +593,8 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     }
 }
 
-static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
+static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid;
@@ -584,7 +602,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -621,7 +639,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_dte(s, devid, valid, size, itt_addr);
+        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -639,7 +657,6 @@ static void process_cmdq(GICv3ITSState *s)
     uint64_t data;
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
-    bool result = true;
     uint8_t cmd;
     int i;
 
@@ -666,6 +683,8 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
+        ItsCmdResult result = CMD_CONTINUE;
+
         cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
@@ -724,18 +743,16 @@ static void process_cmdq(GICv3ITSState *s)
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

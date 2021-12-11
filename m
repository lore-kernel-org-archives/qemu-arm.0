Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583357lfk;
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
X-Received: by 2002:adf:e38d:: with SMTP id e13mr21126681wrm.402.1639249905329;
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249905; cv=none;
        d=google.com; s=arc-20160816;
        b=h8hny4fqcTI6QNhbKDhw/mZLGDwHyUMEOS28cLxnb8OZFcmv6q8borie9/0EQrIduN
         Ec/Ey0u8i879I55W1/Pg2nYr9CEFHanOXlfgy3O26K3De0ViO2RVjjShYE2FSii3K8BH
         5K7hLtg0AhI2ZDfDomlBUYGEs5odRo6+pi9VAotwopRyx7Wk9MP7GK9zJLhoy/MP6kFf
         arHMyWCacnL2qDHivVxYL+j7vjd8yGTLim66nJKm5Lyg09H4K1iYm6+nQFUFi0BcvqvD
         tcM+0FKtG661zybNB47cSTC4nARb1Nbn2BP74sReGcMb89svfYRA3GNgO8xvtWQOXi0W
         RrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y2QysQTQAWSazy2o5oN/Juze7nEenPNm5O/YPOxLtXE=;
        b=hTwTYo7Q0j7kJc8+FqgNpa39gvassuBvcVjleuJ4ryxGRsUKW5PWflDN/0YbICJcwp
         Pk/Tg2XdvRf2Q+nMSYntD/ILMzodhiPwkimn1ZB3PWhNLoXEO4vjV/fn0bsKGaVAfjR0
         8IZZlSRc4wFg8EoXiYuJ8dNZfYQEWjLR431+0LQCY5sP59QNKy8OFXiB2E0xCud8Rs3s
         /KrB/Z1WWYDbnWs9tF0e38VjJdy5qK315lMmzBSE6YQtMLuqnuMwrgCgnSge5iJdpToV
         0HRf1xhf6ubED8NUIYKYf3a0hPdWgVzU423NQ85Mv54UYt1nRVVXydddy1ZSh5yy3z/C
         Mggw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNHJePsN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g6sor232466wrw.22.2021.12.11.11.11.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNHJePsN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y2QysQTQAWSazy2o5oN/Juze7nEenPNm5O/YPOxLtXE=;
        b=gNHJePsNhRr7hcGcxPbTSEK8kKRsPIWZXgNLOv4dDIml4JSV5Z4pUiw1N4Dl47Ov/W
         /lB4hk0w3abtaHPJkoqwNY/rtIRdcz/BhAHd02qjU4L03tU0xrZ1u6eiSTGsWsllXISA
         iV5XgGZ0SWq+g3rjh4GTBZX2ZZIqOc7WEC0KpgDtVJshAE/TAXYIPoUs4ulxJx1xMKOo
         qrdep4N6yP+gzQKfsiT2wVgj2D9uDAAKvIwXiP89qTMxb005hek95ajmGYyYcrwb7o1P
         1ewqOCe5CepnvoevLx4/jylnOBxwouawe3mijuYs6xEwNynNzeg4BDel57KtEESnvSvQ
         6/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y2QysQTQAWSazy2o5oN/Juze7nEenPNm5O/YPOxLtXE=;
        b=7B8fhtwfG9RYHGTeGObhpqPplZxOt1sy03DYH3pnBokKRwiFpQi8t4J3t16D+Zh2oL
         nPPPcHsxeWzzR5ADsL843GSPlmXK8YVAbqDJGu7qmdB8FUYjMpUSXofQuk7e+yJb+wm4
         6pkoncXjNtz2QZhUSM79+pA4Pha7uS79l69UkBe0C585q7o9WYOZ0Rprz75GuW4x3lEY
         Yng3VOmMRiiUTY+0igK6BmsR1wFwKDTeE58oQsMI9U3/BDuSmlIjGnIrzCbKqf/4GXJa
         TiVFTHIeBRqbGiJlAHc2pRd+YiQqEa4YLZA8M/FMbqsBxwDAC4xYZP9PNwXkk77AOQEe
         BKhg==
X-Gm-Message-State: AOAM530rrJ9V5ipCaoDXIpr2mcI9BAranYkzIbl/RHLQmyf75V4lcz3Y
	aa5ZC/s06PaCUa4R3TCqR277oevCv5GhkcIo
X-Google-Smtp-Source: ABdhPJwwVSkPac+SZ0hpPEEn6OwFZnV7nMnrmFvZ3U7HS5uo5cig5K0Gh9aMSVFVU5W9K4vC/n57mg==
X-Received: by 2002:adf:d082:: with SMTP id y2mr21907560wrh.214.1639249904962;
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 08/26] hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL define
Date: Sat, 11 Dec 2021 19:11:17 +0000
Message-Id: <20211211191135.1764649-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7yrUy2Pm7MhG

The GITS_TYPE_PHYSICAL define is the value we set the
GITS_TYPER.Physical field to -- this is 1 to indicate that we support
physical LPIs.  (Support for virtual LPIs is the GITS_TYPER.Virtual
field.) We also use this define as the *value* that we write into an
interrupt translation table entry's INTTYPE field, which should be 1
for a physical interrupt and 0 for a virtual interrupt.  Finally, we
use it as a *mask* when we read the interrupt translation table entry
INTTYPE field.

Untangle this confusion: define an ITE_INTTYPE_VIRTUAL and
ITE_INTTYPE_PHYSICAL to be the valid values of the ITE INTTYPE
field, and replace the ad-hoc collection of ITE_ENTRY_* defines with
use of the FIELD() macro to define the fields of an ITE and the
FIELD_EX64() and FIELD_DP64() macros to read and write them.
We use ITE in the new setup, rather than ITE_ENTRY, because
ITE stands for "Interrupt translation entry" and so the extra
"entry" would be redundant.

We take the opportunity to correct the name of the field that holds
the GICv4 'doorbell' interrupt ID (this is always the value 1023 in a
GICv3, which is why we were calling it the 'spurious' field).

The GITS_TYPE_PHYSICAL define is then used in only one place, where
we set the initial GITS_TYPER value.  Since GITS_TYPER.Physical is
essentially a boolean, hiding the '1' value behind a macro is more
confusing than helpful, so expand out the macro there and remove the
define entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 26 ++++++++++++++------------
 hw/intc/arm_gicv3_its.c  | 30 +++++++++++++-----------------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 63de8667c61..5a63e9ed5ce 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -354,28 +354,30 @@ FIELD(MAPC, RDBASE, 16, 32)
 #define L2_TABLE_VALID_MASK       CMD_FIELD_VALID_MASK
 #define TABLE_ENTRY_VALID_MASK    (1ULL << 0)
 
-/**
- * Default features advertised by this version of ITS
- */
-/* Physical LPIs supported */
-#define GITS_TYPE_PHYSICAL           (1U << 0)
-
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
  * ITE Lower 8 Bytes
  *   Bits:    | 49 ... 26 | 25 ... 2 |   1     |   0    |
- *   Values:  |    1023   |  IntNum  | IntType |  Valid |
+ *   Values:  |  Doorbell |  IntNum  | IntType |  Valid |
  * ITE Higher 4 Bytes
  *   Bits:    | 31 ... 16 | 15 ...0 |
  *   Values:  |  vPEID    |  ICID   |
+ * (When Doorbell is unused, as it always is in GICv3, it is 1023)
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
-#define ITE_ENTRY_INTTYPE_SHIFT        1
-#define ITE_ENTRY_INTID_SHIFT          2
-#define ITE_ENTRY_INTID_MASK         MAKE_64BIT_MASK(2, 24)
-#define ITE_ENTRY_INTSP_SHIFT          26
-#define ITE_ENTRY_ICID_MASK          MAKE_64BIT_MASK(0, 16)
+
+FIELD(ITE_L, VALID, 0, 1)
+FIELD(ITE_L, INTTYPE, 1, 1)
+FIELD(ITE_L, INTID, 2, 24)
+FIELD(ITE_L, DOORBELL, 26, 24)
+
+FIELD(ITE_H, ICID, 0, 16)
+FIELD(ITE_H, VPEID, 16, 16)
+
+/* Possible values for ITE_L INTTYPE */
+#define ITE_INTTYPE_VIRTUAL 0
+#define ITE_INTTYPE_PHYSICAL 1
 
 /* 16 bits EventId */
 #define ITS_IDBITS                   GICD_TYPER_IDBITS
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 88f4d730999..15eb72a0a15 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -156,12 +156,11 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
                                         MEMTXATTRS_UNSPECIFIED, res);
 
         if (*res == MEMTX_OK) {
-            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
-                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
-                    GITS_TYPE_PHYSICAL) {
-                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
-                               ITE_ENTRY_INTID_SHIFT;
-                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
+            if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
+                int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
+                if (inttype == ITE_INTTYPE_PHYSICAL) {
+                    *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
+                    *icid = FIELD_EX32(ite.iteh, ITE_H, ICID);
                     status = true;
                 }
             }
@@ -342,8 +341,6 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    IteEntry ite;
-    uint32_t int_spurious = INTID_SPURIOUS;
     bool result = false;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
@@ -400,16 +397,16 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
          */
     } else {
         /* add ite entry to interrupt translation table */
-        ite.itel = (dte_valid & TABLE_ENTRY_VALID_MASK) |
-                    (GITS_TYPE_PHYSICAL << ITE_ENTRY_INTTYPE_SHIFT);
-
+        IteEntry ite = {};
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
         if (ignore_pInt) {
-            ite.itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
+            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, eventid);
         } else {
-            ite.itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
+            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
         }
-        ite.itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
-        ite.iteh = icid;
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+        ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
         result = update_ite(s, eventid, dte, ite);
     }
@@ -1237,8 +1234,7 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
                        "gicv3-its-sysmem");
 
     /* set the ITS default features supported */
-    s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
-                          GITS_TYPE_PHYSICAL);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL, 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
                           ITS_ITT_ENTRY_SIZE - 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS, ITS_IDBITS);
-- 
2.25.1

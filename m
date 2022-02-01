Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660819lfk;
        Tue, 1 Feb 2022 11:32:15 -0800 (PST)
X-Received: by 2002:adf:ab18:: with SMTP id q24mr23329135wrc.617.1643743935276;
        Tue, 01 Feb 2022 11:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743935; cv=none;
        d=google.com; s=arc-20160816;
        b=XMiPQFU/eoaVY0iPAc67zErfBudCYjNRdoFyVnLdmxR304PJJF36aR+myOGaUfFvn9
         1buYtLH5EEGKcTH0GWMZbYRSa4QGEDGHL8OavRG/zoDrXdQ9Vv9BSNtQ+XLVUDrbo38Z
         Km/+ZxzuaLgaUyJXVcsy5fmlrXcQbbp0v7DawOmb8SIbjfWRPd87mEQ03SlSR9eczsJJ
         lk2HsWirnwV903MxcBAIt/mXVVFo8WMQNRzcYPiMeqtZOlmNZ5K8Pn00wsFQLe8ceNV3
         eCoB7H+sVxd57i2Lgmtv1PRzXsyPlE9wmF+dqkdGkXzzApByLRzVQd0VhgRzcxgHPGvZ
         sMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ywQcTYQTXZACbh58F2F6qFMIzANHo8mVYTxx87r5y/I=;
        b=Wj5lNbEifzvvloB2NTEP374o7RyfMYCMXDzniDuGTop4Hxm6lEnKiwUF105CBOMIXZ
         gOQa48yZ9+KMUZUvIwF/I+cXHa24iIfqRRAmpgcUymeC0ph3Wyud/jFuLA5R9D4cc4x9
         ZfO1pnKMCLzQv7JEwOnfZPvYvdj4OE5253YtPdyJKsLxR1p1ZTvRZcg6f2VPRrs9Hto/
         MM7lLV5QSxKM6LMT3pJEssn9DbpFiwxtakgYXF666pGK3qoN5lpyD+Uf2f9/qNFk/t7i
         uEzVcRZG8FY1QQKQJ85kddN2fp4HcuA+LmWivA9qCxdbeSlhEhKEdhgsGrEr965W4tEo
         NmLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r3SDdjCk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t15sor1743747wmq.16.2022.02.01.11.32.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r3SDdjCk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywQcTYQTXZACbh58F2F6qFMIzANHo8mVYTxx87r5y/I=;
        b=r3SDdjCk4hSLsVzZ//sQF63ojNMPqzH+ov6SA/eair7cn1oqwwYKfzbvPuZHsEj1aD
         WnTIYhSEKpK20tfSbq+lAAlIeCn8FoP0zHOO3W0IoI6MP5xhVwKw+yetAP+/O6oj372I
         rC3Ls2Le2pwHjUv7L00Tszk9hhck72+X27Gz4oiunTuUuOu+hCbkh/m5ucdYaUahVBU+
         OP+10u6CVFYfVCKD75u6C1d/dgdqr64MEvptN7wrBluGslXzZzSnlG2TdAuYFtjIBbL5
         Kny9QkEt/uAhwcYFOHEKh8QIpFuVGW5J/07ouTbvpm2F2sggd2C7u9cFrlyVcenoJXq/
         i/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywQcTYQTXZACbh58F2F6qFMIzANHo8mVYTxx87r5y/I=;
        b=M6ZbGAOOJCIyVWu5sIWkMjTeWTdqS+8CvGPosipSUIx8RDC4mK2EhGp8CSOCLJwbRU
         TDw5h1CCkjjGxHw1DUkoWy6sRFrQQmokcE6BDod669+/UYYt76a1E7SrXdLk7YOPN7gA
         o665JBfR7zroaWGVckdq3aqpKRzRbZLxFl8DGmZICTCwzZeDAE5TAqEJZq5wK6A1WPxJ
         w3EBHVsixCCWcvFUWt/pvsYmCYSDAdA/auBdllc2Sdb5q3ddbgtvIP+uCku2F+ebsnes
         ubbn+ncE3uG6gYb3PIWBIPMYlWGFP0PjqQ/0w2U78VoYv2kpe8AQuv9hJ5lqef/RodSk
         Ajhg==
X-Gm-Message-State: AOAM533OKR2grm075oRS5JKt5+fc/r6mCSWG+eEcqlXyIRneaDfLIPg4
	7nQALYCS2ZHqtUkJHlRAuW98pRwb
X-Google-Smtp-Source: ABdhPJyecTZm3OmOdCT1Q5Q652dSF5sIw0Xl4ghvxFghTXBnTy/kTz+jr10ZdAHVTIJ4Kx0BjGoOwA==
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr3112520wmm.8.1643743934897;
        Tue, 01 Feb 2022 11:32:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in get_ite() and update_ite()
Date: Tue,  1 Feb 2022 19:32:00 +0000
Message-Id: <20220201193207.2771604-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: i7LFfR+7VkrG

In get_ite() and update_ite() we work with a 12-byte in-guest-memory
table entry, which we intend to handle as an 8-byte value followed by
a 4-byte value.  Unfortunately the calculation of the address of the
4-byte value is wrong, because we write it as:

 table_base_address + (index * entrysize) + 4
(obfuscated by the way the expression has been written)

when it should be + 8.  This bug meant that we overwrote the top
bytes of the 8-byte value with the 4-byte value.  There are no
guest-visible effects because the top half of the 8-byte value
contains only the doorbell interrupt field, which is used only in
GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
cancel each other out.

We can't simply change the calculation, because this would break
migration of a (TCG) guest from the old version of QEMU which had
in-guest-memory interrupt tables written using the buggy version of
update_ite().  We must also at the same time change the layout of the
fields within the ITE_L and ITE_H values so that the in-memory
locations of the fields we care about (VALID, INTTYPE, INTID and
ICID) stay the same.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 19 ++++++++++---------
 hw/intc/arm_gicv3_its.c  | 28 +++++++++++-----------------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 60c8617e4e4..2bf1baef047 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -370,22 +370,23 @@ FIELD(MOVI_2, ICID, 0, 16)
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
  * ITE Lower 8 Bytes
- *   Bits:    | 49 ... 26 | 25 ... 2 |   1     |   0    |
- *   Values:  |  Doorbell |  IntNum  | IntType |  Valid |
+ *   Bits:    | 63 ... 48 | 47 ... 32 | 31 ... 26 | 25 ... 2 |   1     |  0    |
+ *   Values:  | vPEID     | ICID      | unused    |  IntNum  | IntType | Valid |
  * ITE Higher 4 Bytes
- *   Bits:    | 31 ... 16 | 15 ...0 |
- *   Values:  |  vPEID    |  ICID   |
- * (When Doorbell is unused, as it always is in GICv3, it is 1023)
+ *   Bits:    | 31 ... 25 | 24 ... 0 |
+ *   Values:  | unused    | Doorbell |
+ * (When Doorbell is unused, as it always is for INTYPE_PHYSICAL,
+ * the value of that field in memory cannot be relied upon -- older
+ * versions of QEMU did not correctly write to that memory.)
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
 
 FIELD(ITE_L, VALID, 0, 1)
 FIELD(ITE_L, INTTYPE, 1, 1)
 FIELD(ITE_L, INTID, 2, 24)
-FIELD(ITE_L, DOORBELL, 26, 24)
-
-FIELD(ITE_H, ICID, 0, 16)
-FIELD(ITE_H, VPEID, 16, 16)
+FIELD(ITE_L, ICID, 32, 16)
+FIELD(ITE_L, VPEID, 48, 16)
+FIELD(ITE_H, DOORBELL, 0, 24)
 
 /* Possible values for ITE_L INTTYPE */
 #define ITE_INTTYPE_VIRTUAL 0
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b94775fd379..48eaf20a6c9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -173,14 +173,12 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
 {
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
+    hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
-    address_space_stq_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
-                         sizeof(uint32_t))), ite.itel, MEMTXATTRS_UNSPECIFIED,
-                         &res);
+    address_space_stq_le(as, iteaddr, ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res == MEMTX_OK) {
-        address_space_stl_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
-                             sizeof(uint32_t))) + sizeof(uint32_t), ite.iteh,
+        address_space_stl_le(as, iteaddr + 8, ite.iteh,
                              MEMTXATTRS_UNSPECIFIED, &res);
     }
     if (res != MEMTX_OK) {
@@ -196,16 +194,12 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     AddressSpace *as = &s->gicv3->dma_as;
     bool status = false;
     IteEntry ite = {};
+    hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
-    ite.itel = address_space_ldq_le(as, dte->ittaddr +
-                                    (eventid * (sizeof(uint64_t) +
-                                    sizeof(uint32_t))), MEMTXATTRS_UNSPECIFIED,
-                                    res);
+    ite.itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, res);
 
     if (*res == MEMTX_OK) {
-        ite.iteh = address_space_ldl_le(as, dte->ittaddr +
-                                        (eventid * (sizeof(uint64_t) +
-                                        sizeof(uint32_t))) + sizeof(uint32_t),
+        ite.iteh = address_space_ldl_le(as, iteaddr + 8,
                                         MEMTXATTRS_UNSPECIFIED, res);
 
         if (*res == MEMTX_OK) {
@@ -213,7 +207,7 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
                 int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
                 if (inttype == ITE_INTTYPE_PHYSICAL) {
                     *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
-                    *icid = FIELD_EX32(ite.iteh, ITE_H, ICID);
+                    *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
                     status = true;
                 }
             }
@@ -412,8 +406,8 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, true);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, icid);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
 
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
@@ -688,8 +682,8 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, new_icid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, new_icid);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
-- 
2.25.1

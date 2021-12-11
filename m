Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583370lfk;
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
X-Received: by 2002:a5d:668c:: with SMTP id l12mr22122330wru.19.1639249906658;
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249906; cv=none;
        d=google.com; s=arc-20160816;
        b=aFFnEH1RgyFSt/TEE+WLxVprXuJy6RIJY0liROqKjXai18WzAFdUyuACJi398QE4eh
         mTtuAQxDOcuoRnqfY7CHAQRXI7wHoYWAV2Iasn9lfrsPL6p6Wq7xuAxquTdgMo0kyY9S
         6Pki+I38kXan0PmM6DlnA5hIJkJ/EV+HvWVDbb7bT3vE4tGiQyWTfmm6YhjfMp9viCPw
         o0l/I5F5gWngKhrWwygqFtMX2DVdMa3wBCg8I3ruFP4DxwEVYPyXD2d9e0uJXiwaIQfz
         u8fSVI4tH15DuA2ZxXuFRozq4yT4F+PHGIV3w5dDjgV1Tp7AcpLK9mH8sikxw/kJzGiC
         Lc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=c1o4mDLZEUBKMimLD4cOggkbAQaeevicaB7Ui64CkcA=;
        b=nEel1ykJissFRTotIYxKTrvMhFLBe6UMC1+pwX8Wr5025EiUS/HtqZdF2gQqHi4OLU
         mAVJQfV0qHW+Sqiz0ylCFN7TUYtVfEkeE1ZJ0jgJp9/YfFNLa1tkZ56pzwYrwZ7XnXqk
         9ShHw5F66BHHoBLg9MukiYAi5U8Tb+CZbXWkrThY40nmPSJty0PEZSgW+UguK9Wk7zX9
         5EmjpXOq1+ghdrQIsivO/+KJGsqq9u90roG57i9ppEGS0uxWBOJjJT87Uy6oizzGe5zO
         oQgBwxMxkqsfitfRXEyZh1B1LvTz5wnV6Oe/IwWS/a6gnSTDzegnE/srIEmIte2xoVKN
         r2Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cm7LZ2nL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n17sor1019930wmq.18.2021.12.11.11.11.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cm7LZ2nL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c1o4mDLZEUBKMimLD4cOggkbAQaeevicaB7Ui64CkcA=;
        b=cm7LZ2nLSSXFaQG2uEPioagcmhgdRRouvLtD9+Srv+OhsMUGXyvWYCsuAD5jjaZYOO
         c9R/u0AP/8FneAYZarqNTmA1AaRCFZl0uhR82w+lULBkKPKR8m3DsTOofO/SrpfbisGo
         0cdcDy3l5wGov2X6lOOE2gBlGU8XNNjgHMjhLHwY49LG4ZZqGayn6v/baopi92mDdqi8
         5FGI+8ugiO+aDPgOr+MXWbsL3sg2zdLU1owTXWOS5XheqyEFGO7brMw5mrZ3h2yL0/bz
         cXjtUgGgZXNeG274BB72tTzJWO/elOYVZuJuLINgnZzq71qHNUOVmJJlN/XaoY3DXgE0
         1Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c1o4mDLZEUBKMimLD4cOggkbAQaeevicaB7Ui64CkcA=;
        b=gFMHlxeJLtVZYiOuIBSC5psScte+CKs9E7+PdHj5Phrt1BA4LVG5CZeCSgp7t6ax7s
         mx4xwh0w6Yhwc7Fi9dafl5zf9KLI60/SJiJ9DgG3n8cPrlfyIskyio+PPVy3fdrdX/49
         PheILUSF5HF2NebyMU91zLNg8RmHdwE+JOrZhsgaDqh0efmfUFgH+S0444Y7pkglwD1f
         73CDeAoKrp6pDOzOIE7Vc4rQD9I/a7ehYl/N9BPMB4VC01rfZT9vWEGa06sma5stvpWC
         dBj9s94eK5M2rHQcV8FEig4ltrqBm8nBS20IuT628LIaMIM6MlK92dhnu5CLWcdUWJRE
         SaNg==
X-Gm-Message-State: AOAM532XGFNnJeCF999PqKRbrfFbtRpQctSIwwAlgOVXQhEMyCBfk11c
	jYIha46NMuB1bNiSwTkyyE/dpTWx
X-Google-Smtp-Source: ABdhPJzqo5NCKvodjX4ja98EmGIcdRvfqMwdCZvhX6di+SU4DGmHSoRgHzm3dyCrDxHXLtFda+ZwLQ==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr25785958wmj.15.1639249906394;
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
Date: Sat, 11 Dec 2021 19:11:19 +0000
Message-Id: <20211211191135.1764649-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yyv8nBJMRQdZ

Currently the ITS code that reads and writes DTEs uses open-coded
shift-and-mask to assemble the various fields into the 64-bit DTE
word.  The names of the macros used for mask and shift values are
also somewhat inconsistent, and don't follow our usual convention
that a MASK macro should specify the bits in their place in the word.
Replace all these with use of the FIELD macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  7 ++++---
 hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 5a63e9ed5ce..6a3b145f377 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -393,9 +393,10 @@ FIELD(ITE_H, VPEID, 16, 16)
  * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
  */
 #define GITS_DTE_SIZE                 (0x8ULL)
-#define GITS_DTE_ITTADDR_SHIFT           6
-#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR_SHIFT, \
-                                                      ITTADDR_LENGTH)
+
+FIELD(DTE, VALID, 0, 1)
+FIELD(DTE, SIZE, 1, 5)
+FIELD(DTE, ITTADDR, 6, 44)
 
 /*
  * 8 bytes Collection Table Entry size
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6f21c56fba2..7a217b00f89 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -114,7 +114,7 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     uint64_t itt_addr;
     MemTxResult res = MEMTX_OK;
 
-    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
     itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
 
     address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
@@ -141,7 +141,7 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     bool status = false;
     IteEntry ite = {};
 
-    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
     itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
 
     ite.itel = address_space_ldq_le(as, itt_addr +
@@ -255,10 +255,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     if (res != MEMTX_OK) {
         return result;
     }
-    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -375,10 +375,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     if (res != MEMTX_OK) {
         return result;
     }
-    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
-
-    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
-
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
+    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
@@ -529,9 +527,9 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     if (s->dt.valid) {
         if (valid) {
             /* add mapping entry to device table */
-            dte = (valid & TABLE_ENTRY_VALID_MASK) |
-                  ((size & SIZE_MASK) << 1U) |
-                  (itt_addr << GITS_DTE_ITTADDR_SHIFT);
+            dte = FIELD_DP64(dte, DTE, VALID, 1);
+            dte = FIELD_DP64(dte, DTE, SIZE, size);
+            dte = FIELD_DP64(dte, DTE, ITTADDR, itt_addr);
         }
     } else {
         return true;
-- 
2.25.1

Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583302lfk;
        Sat, 11 Dec 2021 11:11:41 -0800 (PST)
X-Received: by 2002:a5d:4143:: with SMTP id c3mr21442215wrq.254.1639249901555;
        Sat, 11 Dec 2021 11:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249901; cv=none;
        d=google.com; s=arc-20160816;
        b=pOEwmObjMy4/9jwXeYncAwv9IpkGB6hOeRLh4KHIJKtTjZ53gpv3TIS33NKfqr4oId
         jSL7HD3kPm4Bcli40997q803NP2gjAt37ZP2pIa5CY0CCqw+nVmbGOTWTRMqIaUZewJR
         ojdtkX1V30zBccrJLjNpqy+yugysmTvMRedlLi83vEfC67yyX6wHKmuHB7SkJlRyaes7
         dKKcEBuKwaA4ea0xOf6jUHS/MjGRdnsl5etampOKDjREvATpKiwhOWZRAylByKXYN3ti
         rnw8eDP1fpaQcDqKVVRRg2vzwtFgP81tje4Qvz8HuvfQ8pG8RUnlTlAXY5f1PGnrAmcZ
         mh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dGKwMD+9WuccUDXkjtypH8IassS21mNAMYjauEbj4To=;
        b=p4qTvhUcXRPlDDmOgJhDJrrW5vci1eBatCpKSfG4sQ2S3lR02B1pKXnlsZSNOhhYGV
         X3hM2K5rGcFAMy/qNnyHzbIBpx7S61hsqKGOFXc4stl5tzdSZPVzeXhP/BZib7pWKVCY
         v/PWG7i9fCHUKpRbouPgV5naRZrR4of6eZYdgIZ5wGLOj0mPbBeIXLH/oZbl8pkzqOuo
         m/dRrdVpGbF78rwTLdTukUwSlGEPT4fsWYRigOH7sNs9q2wQ4VORagLNT9y53TncUjgG
         X5fI4XydCSfpTUiZyOctxxscwoPmivPtlQpnTg4Q7iwW+FtJwM/CEuyK6AV4HOoVzVyY
         ZM8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EUGkDwZ4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o30sor1051340wms.6.2021.12.11.11.11.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EUGkDwZ4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dGKwMD+9WuccUDXkjtypH8IassS21mNAMYjauEbj4To=;
        b=EUGkDwZ4L/3RJmAKzoQmMssnjOp60ex1bKVMvKnDNbyWSb8GbXzPF8zEPd4YhvvRWz
         A9akBPt483ANcigqeWWv7eje6bfbrLz8n+yCfxzSp9yQ+OZ4yjAZpJsM1GQOrjNf3cOp
         BuuLU/erV6Kvyi/1kxKxpNBIlrQy45/fkextu3Jxm/o+9wD96WIbTX8iBmtpm8YHOhyW
         afxGVlEurdMQ5H8BeUdxVUw6/Mb5q8/Jvsoar18MNQnO7lofreWAXL1oYsFetYKlhIOR
         16LGDS+Zoc24YnOUeBHWPXbaGF+19CF+eXnfF2TNl5j2rwICVJ4Br6vtMAU2hJkrWDek
         pYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dGKwMD+9WuccUDXkjtypH8IassS21mNAMYjauEbj4To=;
        b=vbqOESEJJOIbsvCTMEPa6Nd0Hg9bTtsfUYlcDFBN/YqeSaEKUduL36AITsatY5qwLV
         2BynEtNfUtkm4+7K9myBqlXfbSwp5Y7Sqdv/2uhYZvkvnrtQYiv7nv6eSlEoqrxzCQSX
         SKNliGoD3DaOhIc7X0wqy2Iy6v/XtqMpMC2gT+tQmqIqj/ZRNQp/V7+0BHzfF6EeNQjE
         OZQ7XKdjyzusA3HhQ7iCTI07sb68qVrmRB9C8dIWnWY6teW6fbL6N/OO5YRb497cOy4C
         XLgXTGsBKDiLD3m+wNSRf7An2e0ppFwmZEqXD8iTFE2sIsKMw3r6Vy7Re9O3J9OKzA65
         ecvQ==
X-Gm-Message-State: AOAM533CfZ76OLdVcd/uQp1rM/JcYqpLQ+wMeyvOU3SquXnsN1UHLpA1
	Pl904jHXMI47v/tYTpbYdjxL2MbN
X-Google-Smtp-Source: ABdhPJwt1ZEayZvkYmQuQi4eL6V40p64hIeD3jrxYaWDCXNobGNyfljiVZ5N/2QVZ2VduEp5JB/B6g==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr25577883wml.21.1639249901211;
        Sat, 11 Dec 2021 11:11:41 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 04/26] hw/intc/arm_gicv3_its: Remove maxids union from TableDesc
Date: Sat, 11 Dec 2021 19:11:13 +0000
Message-Id: <20211211191135.1764649-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ol4sXFW5bca7

The TableDesc struct defines properties of the in-guest-memory tables
which the guest tells us about by writing to the GITS_BASER<n>
registers.  This struct currently has a union 'maxids', but all the
fields of the union have the same type (uint32_t) and do the same
thing (record one-greater-than the maximum ID value that can be used
as an index into the table).

We're about to add another table type (the GICv4 vPE table); rather
than adding another specifically-named union field for that table
type with the same type as the other union fields, remove the union
entirely and just have a 'uint32_t max_ids' struct field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h |  5 +----
 hw/intc/arm_gicv3_its.c                | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 4e79145dde3..85a144b0e49 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -47,10 +47,7 @@ typedef struct {
     uint16_t entry_sz;
     uint32_t page_sz;
     uint32_t max_entries;
-    union {
-        uint32_t max_devids;
-        uint32_t max_collids;
-    } maxids;
+    uint32_t max_ids;
     uint64_t base_addr;
 } TableDesc;
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 985ae03f5fc..f321f10189e 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -287,10 +287,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
      * In this implementation, in case of guest errors we ignore the
      * command and move onto the next command in the queue.
      */
-    if (devid > s->dt.maxids.max_devids) {
+    if (devid > s->dt.max_ids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>%d",
-                      __func__, devid, s->dt.maxids.max_devids);
+                      __func__, devid, s->dt.max_ids);
 
     } else if (!dte_valid || !ite_valid || !cte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -384,7 +384,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
     }
 
-    if ((devid > s->dt.maxids.max_devids) || (icid > s->ct.maxids.max_collids)
+    if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
             || !dte_valid || (eventid > max_eventid) ||
             (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
             (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
@@ -505,7 +505,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid > s->ct.maxids.max_collids) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid > s->ct.max_ids) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
@@ -618,7 +618,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((devid > s->dt.maxids.max_devids) ||
+    if ((devid > s->dt.max_ids) ||
         (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
@@ -810,8 +810,8 @@ static void extract_table_params(GICv3ITSState *s)
                                      (page_sz / s->dt.entry_sz));
             }
 
-            s->dt.maxids.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
-                                       DEVBITS) + 1));
+            s->dt.max_ids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                                DEVBITS) + 1));
 
             s->dt.base_addr = baser_base_addr(value, page_sz);
 
@@ -842,11 +842,11 @@ static void extract_table_params(GICv3ITSState *s)
             }
 
             if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
-                s->ct.maxids.max_collids = (1UL << (FIELD_EX64(s->typer,
-                                            GITS_TYPER, CIDBITS) + 1));
+                s->ct.max_ids = (1UL << (FIELD_EX64(s->typer,
+                                                    GITS_TYPER, CIDBITS) + 1));
             } else {
                 /* 16-bit CollectionId supported when CIL == 0 */
-                s->ct.maxids.max_collids = (1UL << 16);
+                s->ct.max_ids = (1UL << 16);
             }
 
             s->ct.base_addr = baser_base_addr(value, page_sz);
-- 
2.25.1

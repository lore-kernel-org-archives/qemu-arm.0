Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660864lfk;
        Tue, 1 Feb 2022 11:32:18 -0800 (PST)
X-Received: by 2002:adf:f701:: with SMTP id r1mr22262616wrp.428.1643743938743;
        Tue, 01 Feb 2022 11:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743938; cv=none;
        d=google.com; s=arc-20160816;
        b=SOORoZ5wAmSaPFXgLjx08TmZ0AsryzdZRLNkwwvlwHBjP8uZnbBPOkCFCNFrmnxklX
         UfHGULU3DKqdWEdpP0jWsNN29yOYGIWBZHScqS5te7UzSoMO4ga06ArY65Dy3ps80OJJ
         sV41QX8NDESIqd9XVEjnUMwjlkBuyH8hM2eJebygZpL11HvIUUMbEsLDNsemkvLWuZPH
         VIIzFb3+/qCAPKs24Dj6Pk08W8jyIsByQSLLKP5XfRwQLth2QJFy0MRBj88ztIaO77l6
         5MHCLK84ub9qjJhEIN5Jil0LKpApfHoJvK2m2ORKE19xh9xB/GwxeNc3u2xOWIXGWCSN
         3hXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EUHw8m4RBKGoqre1Z9En7gX4Mxb4JnFHHHZdcEKUkCs=;
        b=06aoJGZfHXdmCRvxzQapw6quxfEaI9gxsPjlZGjCSxuNoo6BTJDsF2vCiGnTzhHCgS
         x/eV9rjpUbmISQop6Pm8qFPn9VidXBZ9z+Op8by/PCqH8IR7seQ4jyj9LDy7aDp7JKEK
         N2ge/MnxnjG1WAc82NFcg/ppF4Kw/O6eZdKC8qZeuYRqFc5xrWgazJhgwmEwcqIgi4a0
         MwUOYoIRDeJUt3J0yqE3PkVBRWRjriDMqpUkCVI4lc5F6ae2+xDR9W1ftV650Cuuk3ww
         4zw05WwpdME6lMQKYAxG17ogBWyJmDqKQsMScQcVNx5lUhHmk2Kd+zHIoaMR+WbnRCJa
         r4xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PT4/0368";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z7sor1794438wmp.18.2022.02.01.11.32.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PT4/0368";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EUHw8m4RBKGoqre1Z9En7gX4Mxb4JnFHHHZdcEKUkCs=;
        b=PT4/03686p5mVTGJvRQrm4cVIIdOtAlPa/KD8mY1Rq5+bclMBYb+u55yDHaBPbkI8E
         nh7IOksZq5+jh6avyqzHYeqXMCs/eVYBJUOsd8/cY1yAqytRQXXzjVRk1NaudkXgrtB5
         ggE2Ev5EcGieE/YDd7tvbj56Pi/iVTpGQsEzhCLK4a1h7qzaFLI1m52W26SZhHy8gqM5
         zaurEAVMQ/sd4m4Jo1p+VIcu13NROFP9IgRewocuElJDRTMfkd65Cw5SiJ82HAN43r1R
         ExpyKFnopCf7sOWi0Cxtbcbw9F4/c1O+I47re0tPzJnEVK++hMUDB5hK7ZyoSk1ckQdJ
         WELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EUHw8m4RBKGoqre1Z9En7gX4Mxb4JnFHHHZdcEKUkCs=;
        b=5ixTwnXwzNbhvOJ+N8UvwEJpQpgj++ZGsnQgR1nKa3TfL7cEp7tfaZ078BTjpxzcLp
         jsaVjMGirdUWpMt07Gv/M9y9ll11BszlTi4HKZs3iVqgGnQBGXsRHDLst5mL9QjE0iuX
         7I88cjfZxFHEPHtkTcOpE6KpW7Kf6I/D/Xy7ondZSPMF9SgZqNDtPYN5j3jh5prBaoiH
         7Qp8eKI5pJKrHOB2/A5Dnoz0EXqtpEH0L2/vNJLu0NvQ54LHaWmHSkOrN67rwgLv2hpN
         5+/ypCYD3GvZ+ddcKz/OZ7q2zxH27KdpthDVRbUP3GDAkVaOxhuY0Akm23Pioks1OJrZ
         Pk8Q==
X-Gm-Message-State: AOAM533FZsCVRaaEkTaPL1oY+5CBPx6WtlT6TMStWchnXiJqfkmAqV1E
	6mNDILYoV6SXRsntXFvG1/y1b7g+
X-Google-Smtp-Source: ABdhPJwiENaiStnlF9RXLepv/dPjLSLwoaK61gmupM4YlmD6gvR3vpmZuwQ6/m/mNlkduLty9S77Tw==
X-Received: by 2002:a05:600c:1f0a:: with SMTP id bd10mr3093343wmb.6.1643743938426;
        Tue, 01 Feb 2022 11:32:18 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 10/13] hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc valid fields
Date: Tue,  1 Feb 2022 19:32:04 +0000
Message-Id: <20220201193207.2771604-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xy2XWIHjZbJ5

Currently we track in the TableDesc and CmdQDesc structs the state of
the GITS_BASER<n> and GITS_CBASER Valid bits.  However we aren't very
consistent abut checking the valid field: we test it in update_cte()
and update_dte(), but not anywhere else we look things up in tables.

The GIC specification says that it is UNPREDICTABLE if a guest fails
to set any of these Valid bits before enabling the ITS via
GITS_CTLR.Enabled.  So we can choose to handle Valid == 0 as
equivalent to a zero-length table.  This is in fact how we're already
catching this case in most of the table-access paths: when Valid is 0
we leave the num_entries fields in TableDesc or CmdQDesc set to zero,
and then the out-of-bounds check "index >= num_entries" that we have
to do anyway before doing any of these table lookups will always be
true, catching the no-valid-table case without any extra code.

So we can remove the checks on the valid field from update_cte()
and update_dte(): since these happen after the bounds check there
was never any case when the test could fail. That means the valid
fields would be entirely unused, so just remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h |  2 --
 hw/intc/arm_gicv3_its.c                | 31 ++++++++++++--------------
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 3e2ad2dff60..0f130494dd3 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -42,7 +42,6 @@
 #define GITS_TRANSLATER  0x0040
 
 typedef struct {
-    bool valid;
     bool indirect;
     uint16_t entry_sz;
     uint32_t page_sz;
@@ -51,7 +50,6 @@ typedef struct {
 } TableDesc;
 
 typedef struct {
-    bool valid;
     uint32_t num_entries;
     uint64_t base_addr;
 } CmdQDesc;
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e3b63efddcc..9735d609df2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -442,10 +442,6 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
     uint64_t cteval = 0;
     MemTxResult res = MEMTX_OK;
 
-    if (!s->ct.valid) {
-        return true;
-    }
-
     if (cte->valid) {
         /* add mapping entry to collection table */
         cteval = FIELD_DP64(cteval, CTE, VALID, 1);
@@ -504,15 +500,11 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, const DTEntry *dte)
     uint64_t dteval = 0;
     MemTxResult res = MEMTX_OK;
 
-    if (s->dt.valid) {
-        if (dte->valid) {
-            /* add mapping entry to device table */
-            dteval = FIELD_DP64(dteval, DTE, VALID, 1);
-            dteval = FIELD_DP64(dteval, DTE, SIZE, dte->size);
-            dteval = FIELD_DP64(dteval, DTE, ITTADDR, dte->ittaddr);
-        }
-    } else {
-        return true;
+    if (dte->valid) {
+        /* add mapping entry to device table */
+        dteval = FIELD_DP64(dteval, DTE, VALID, 1);
+        dteval = FIELD_DP64(dteval, DTE, SIZE, dte->size);
+        dteval = FIELD_DP64(dteval, DTE, ITTADDR, dte->ittaddr);
     }
 
     entry_addr = table_entry_addr(s, &s->dt, devid, &res);
@@ -901,7 +893,6 @@ static void extract_table_params(GICv3ITSState *s)
         }
 
         memset(td, 0, sizeof(*td));
-        td->valid = FIELD_EX64(value, GITS_BASER, VALID);
         /*
          * If GITS_BASER<n>.Valid is 0 for any <n> then we will not process
          * interrupts. (GITS_TYPER.HCC is 0 for this implementation, so we
@@ -909,8 +900,15 @@ static void extract_table_params(GICv3ITSState *s)
          * for the register corresponding to the Collection table but we
          * still have to process interrupts using non-memory-backed
          * Collection table entries.)
+         * The specification makes it UNPREDICTABLE to enable the ITS without
+         * marking each BASER<n> as valid. We choose to handle these as if
+         * the table was zero-sized, so commands using the table will fail
+         * and interrupts requested via GITS_TRANSLATER writes will be ignored.
+         * This happens automatically by leaving the num_entries field at
+         * zero, which will be caught by the bounds checks we have before
+         * every table lookup anyway.
          */
-        if (!td->valid) {
+        if (!FIELD_EX64(value, GITS_BASER, VALID)) {
             continue;
         }
         td->page_sz = page_sz;
@@ -936,9 +934,8 @@ static void extract_cmdq_params(GICv3ITSState *s)
     num_pages = FIELD_EX64(value, GITS_CBASER, SIZE) + 1;
 
     memset(&s->cq, 0 , sizeof(s->cq));
-    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
 
-    if (s->cq.valid) {
+    if (FIELD_EX64(value, GITS_CBASER, VALID)) {
         s->cq.num_entries = (num_pages * GITS_PAGE_SIZE_4K) /
                              GITS_CMDQ_ENTRY_SIZE;
         s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
-- 
2.25.1

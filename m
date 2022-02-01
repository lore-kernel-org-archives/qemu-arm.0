Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660779lfk;
        Tue, 1 Feb 2022 11:32:12 -0800 (PST)
X-Received: by 2002:a1c:750f:: with SMTP id o15mr3079754wmc.137.1643743932663;
        Tue, 01 Feb 2022 11:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743932; cv=none;
        d=google.com; s=arc-20160816;
        b=sNbqF9oiH1v1SNtvde+Jg0MTMGFPUXUgr8xfooeSuvPHzlV1uYLvCMQG0pGId+uOC0
         edfUy51DSLtKbIi0xVLnqqsADMYBJkdol0C1G8KSiuy5F3MkIwPKTS2cplQJ6Yhzhexs
         dnHsDsHgKeTQTTZRKy2qc1NdUwIOJ+REsdLugoSYmqgNXTANn4u0a12tdeRIMohysbpD
         4laZrA8q4JbkOM5j0jaWsFFEDUTClKS7LIEaIDc4zmZ6zdhGV06x/yzMrJxY2kPwC5jE
         fuhsedVGyK8VMmop2jgaPkoy0nVbTvKm6eqt/wlYO9TauxT/HTeSpkUMHkpK7VqOs82Z
         gPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YvlbklIZ7LuGPJG4Zm4kfWOMRWUOqrvxpxIx0INpC+I=;
        b=I1VkFnOS6R+qUboG6g9Mi9tg83I0u3Ge762Zt9ptmdWIJyk6Ysl3et9ZqDGBdU0fJm
         TSR9HewzQyMTfMzF/KCWgdOUJDgywmN0J0357biI4+OAll+qoSLlEgiMI3znKFsplYyx
         SXSSQEMa2zO36hrVusl/ILGMlLoy1RYguqg9MknkBbgs2i812OW4icIRm2qwkTk+T7HH
         mRm8yii3z5rMLCnyBFk2TgDsw1tHCH/+x0ys9n79z5fY45YBco53KRHS2e2i5jyyp/lJ
         C964Py0wnABLnUKLEQPS8hBFe8GhFB8CLeA+cb/mBjDguvyRJl07FQ26ZweHP92XcQKf
         l8EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5MI7hVu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f1sor13998772wrm.54.2022.02.01.11.32.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5MI7hVu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YvlbklIZ7LuGPJG4Zm4kfWOMRWUOqrvxpxIx0INpC+I=;
        b=b5MI7hVuCU7CMJq1/5ZgjhCwOhZiRch9rB9ajlPXBD4USaQMt/KoPRu5oBQP10uVm8
         hD7zBbP3k910QUSIcaLTJAYVfSvnopCSV2mp7FO2uFM7CAY8b0Il7JIaoZ1GBl39F3Ey
         EW76NIHdxqE99h8haum6ysMTP8hBlxHl8GawVwWNd1P+3bsoF8NpRkNc0k+A+igLtuLu
         vso59g65EkBTdqDzcgSDeBeIyn4rDBR5kSE3r1R52B1eF9LDD9HSwsQEGlVsX691hQ/U
         Pl1In1FsY2lWx99V/EwV6d3W7wNaLuuMwKlD9znPkqNlPkuy7GnPfKdGZ2HfxF5+Y1nW
         PmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YvlbklIZ7LuGPJG4Zm4kfWOMRWUOqrvxpxIx0INpC+I=;
        b=atx6z11JlVP9eo1+o4mQGdskoow/n1Vw0D1v3LvIsI8hPvePBO5UG4SW9fDpiMsIoj
         napGd3Hv3fAn2IDyivmmpj2DLJAcC3VbXjKeNUoTrsB4Y1iicKtdmVdKWgSLHeT6RrN4
         NXL4QC/cSbU/qFGlgAdaJNK+FlnEG5qog9gdx3z2cxS6Nrkwul8LtcUn/U4E+qkl08Fa
         W7T90Snp1kuMp3ySXU6QOvHLOdXOzAbT4MVQT2l/Vnd+lGhjpPSu+2VyyFBATr2yKSOM
         zc256pip+/e/eN7hpx8wxmf5i8uIWa/i3RJZb8hBvR6Xi8ioUfVtTvwLFl8B41j3sa1U
         LGlQ==
X-Gm-Message-State: AOAM530CV2droXA6S2tT37qYGwaGugKhcrdLrVWAJ9HJqB0sO11+PL2e
	L3/mxtLvg1lQXPQlb9dLZQt76yUK
X-Google-Smtp-Source: ABdhPJx47/q3lUDrFlqc0+nDFucO/xlcXZzCBzZWuyZLKWYQxC9wqmF2eWLRyLre5p+Vxv+bltfBcg==
X-Received: by 2002:a5d:64a9:: with SMTP id m9mr21965365wrp.661.1643743932299;
        Tue, 01 Feb 2022 11:32:12 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 03/13] hw/intc/arm_gicv3_its: Pass DTEntry to update_dte()
Date: Tue,  1 Feb 2022 19:31:57 +0000
Message-Id: <20220201193207.2771604-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uqHzp+J3sF4e

Make update_dte() take a DTEntry struct rather than all the fields of
the new DTE as separate arguments.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d70d7d59e2..1856210e79a 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -465,20 +465,23 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
 }
 
-static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
-                       uint8_t size, uint64_t itt_addr)
+/*
+ * Update the Device Table entry for @devid to @dte. Returns true
+ * on success, false if there was a memory access error.
+ */
+static bool update_dte(GICv3ITSState *s, uint32_t devid, const DTEntry *dte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint64_t entry_addr;
-    uint64_t dte = 0;
+    uint64_t dteval = 0;
     MemTxResult res = MEMTX_OK;
 
     if (s->dt.valid) {
-        if (valid) {
+        if (dte->valid) {
             /* add mapping entry to device table */
-            dte = FIELD_DP64(dte, DTE, VALID, 1);
-            dte = FIELD_DP64(dte, DTE, SIZE, size);
-            dte = FIELD_DP64(dte, DTE, ITTADDR, itt_addr);
+            dteval = FIELD_DP64(dteval, DTE, VALID, 1);
+            dteval = FIELD_DP64(dteval, DTE, SIZE, dte->size);
+            dteval = FIELD_DP64(dteval, DTE, ITTADDR, dte->ittaddr);
         }
     } else {
         return true;
@@ -493,27 +496,25 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         /* No L2 table for this index: discard write and continue */
         return true;
     }
-    address_space_stq_le(as, entry_addr, dte, MEMTXATTRS_UNSPECIFIED, &res);
+    address_space_stq_le(as, entry_addr, dteval, MEMTXATTRS_UNSPECIFIED, &res);
     return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid;
-    uint8_t size;
-    uint64_t itt_addr;
-    bool valid;
+    DTEntry dte;
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
-    size = cmdpkt[1] & SIZE_MASK;
-    itt_addr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
-    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    dte.size = cmdpkt[1] & SIZE_MASK;
+    dte.ittaddr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
+    dte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
     if ((devid >= s->dt.num_entries) ||
-        (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+        (dte.size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
-                      "devid %d or size %d\n", devid, size);
+                      "devid %d or size %d\n", devid, dte.size);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -522,7 +523,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
+    return update_dte(s, devid, &dte) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
-- 
2.25.1

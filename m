Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583483lfk;
        Sat, 11 Dec 2021 11:11:54 -0800 (PST)
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr22097349wrr.177.1639249914533;
        Sat, 11 Dec 2021 11:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249914; cv=none;
        d=google.com; s=arc-20160816;
        b=A3sTd061kxqePoqyPjPb1TxWzNkTIEewvs6WoMD8/qng0VFFss1f8dqoC+1Zy51mcy
         gpeKRCDDFQwH8qEA8qvgtXjD2sSG5OAleZTmbAwGewDdQC0sfUg4A5DO22wvnDaNRSNh
         maWTgambai7GmaKcukZRZeawa1Do781Roqu4d9Yco1DDUJRFpR23OTHaRJH1dfG9STxA
         BzkTOPQ81K6w+G5elWMZeLmygaU4Wyffl3gVSrVtvXrJNf0Z0rT8yI0ovVE0jJ8bmn27
         iWyoukNj1tu4RIoLrHSQWKjH7eKjPtMUJSvvJjTJ6lvjCw/SiPUUB0NMFPUtDR91aFpx
         mSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ubjue5TlSdk5h9YsUVm9ScV9BOtkzubh7xmfHrmHOSk=;
        b=B6cHwHgBDeVnptXEWfWE5OvodfIqgUOuCJqXcRFyFddN3sYy7nj2Lw3uW7I22a4F8T
         GH2zjVJHL0UIkkcrTVJAPSATfgdR9OmHgaB9YmZZlYLzXyGWYJjL3NusKBfsGT0dGx5X
         nMG2LqlUY6R8ZGvpHbwjW4762TFuM8GFJ1FLeLY1X8UWaZHX/PNe/G0TioUYwdeOFMpZ
         13+lSyDy07ofcJbHYccYkmaR24NVbOUEXsxD07uW6Y/JskP1BDtNv6Ud4N3T03NIzfj7
         loOBhZ8u/Z6Nm4uNVLF/iGBdH5cjpJ7zdefg7MaaFV2j0885C795tGPfS+sL9ZC3CKdb
         q3Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xWynYBng;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd27sor1057023wmb.3.2021.12.11.11.11.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xWynYBng;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ubjue5TlSdk5h9YsUVm9ScV9BOtkzubh7xmfHrmHOSk=;
        b=xWynYBngiAD1GSYobxiR457/RG1aT6VAGAM5YN+5cCpRQ6N7sxfB2Vrp1VDVtFrDSL
         G+auUisv5XgyVQWYuXBTIOo/fbCj/FHhekacfiw1t4JfxEtcl2WJ1bERGXkfF97gWr0t
         jvoSaf0SEW8x0iMwrTH4UQhV/dtpcWDBJZ5p25Vfov9OANf1rKsuvZFGt3MUl5U7rH8s
         XQ4Cwf9ibja9amg77fKDur27Mk3xdsGKF+FSLMeVPamADGaMAfdu+cnCqls1ewDgRzMe
         rpcaWz9bnDij27pwJ4O9gezMp+my0/Tsov4qfdnDZIiHFpTbem+cJfrcQyBEjpIwIQSa
         J6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ubjue5TlSdk5h9YsUVm9ScV9BOtkzubh7xmfHrmHOSk=;
        b=LFMDWEjhcF7OG2EVD+CA15fIFjmuj/2g2Wb5G/8L0dshQ68Dl2TFebZZsLCe+KUtFJ
         hSmj4QMc9gy1c80L8VAU22nmDQan7Cb5aMz+PCanBBvaB6E6fh3MrXW/vVhxHcKzESxB
         AMa29KZvXskd1ox5zB56Ov057WL8YTXt7uVYVvyYA8WK8yuUNqns/Kgv9x9XueZcTkIy
         d8jQhOmm7eC09hAUt176CRog2SsFY/k3sU/FbRVAw6mFPIiltE/STAHnCY2d8H/v+WjZ
         wkPQ+KT6hVDHBeq6F0jGAhSlxv+JjQc4Itwuw5rwOzz4SqeqgwDqzLo9hp5xduZGIccm
         BbzQ==
X-Gm-Message-State: AOAM531nPD196/Chbhh4cNptGnfg2FkTZIjHXMGMMnxGUL9mD6GErnEd
	BRIPsgGK5qNBKQwisgbVq+pqKCs2
X-Google-Smtp-Source: ABdhPJy2ZKFKs/wQGrfHc9l1J3p9kPBCbLIndm3qQdEUFR1Gfb9BF5nHOCmWLYF5MJNyMuzy2MCmwQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr25437616wmj.149.1639249914248;
        Sat, 11 Dec 2021 11:11:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 22/26] hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
Date: Sat, 11 Dec 2021 19:11:31 +0000
Message-Id: <20211211191135.1764649-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Jp5OjCDtD8QK

Refactor process_its_cmd() so that it consistently uses
the structure
  do thing;
  if (error condition) {
      return early;
  }
  do next thing;

rather than doing some of the work nested inside if (not error)
code blocks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 103 +++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 3a2254ea7c7..275af620058 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -273,78 +273,75 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
-    if (dte_valid) {
-        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-
-        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
-
-        if (res != MEMTX_OK) {
-            return CMD_STALL;
-        }
-
-        if (ite_valid) {
-            cte_valid = get_cte(s, icid, &cte, &res);
-        }
-
-        if (res != MEMTX_OK) {
-            return CMD_STALL;
-        }
-    } else {
+    if (!dte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
-                      __func__, dte, devid, res);
+                      "invalid dte: %"PRIx64" for %d\n",
+                      __func__, dte, devid);
         return CMD_CONTINUE;
     }
 
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+
+    ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, icid, &cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, cte);
+        return CMD_CONTINUE;
+    }
 
-    /*
-     * In this implementation, in case of guest errors we ignore the
-     * command and move onto the next command in the queue.
-     */
     if (devid >= s->dt.num_ids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
                       __func__, devid, s->dt.num_ids);
         return CMD_CONTINUE;
-    } else if (!dte_valid || !ite_valid || !cte_valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "dte: %s, ite: %s, cte: %s\n",
-                      __func__,
-                      dte_valid ? "valid" : "invalid",
-                      ite_valid ? "valid" : "invalid",
-                      cte_valid ? "valid" : "invalid");
-        return CMD_CONTINUE;
-    } else if (eventid >= num_eventids) {
+    }
+    if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d > %d\n",
                       __func__, eventid, num_eventids);
         return CMD_CONTINUE;
-    } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
-        rdbase = FIELD_EX64(cte, CTE, RDBASE);
+    }
 
-        if (rdbase >= s->gicv3->num_cpu) {
-            return CMD_CONTINUE;
-        }
+    /*
+     * Current implementation only supports rdbase == procnum
+     * Hence rdbase physical address is ignored
+     */
+    rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
-        if ((cmd == CLEAR) || (cmd == DISCARD)) {
-            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
-        } else {
-            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
-        }
-
-        if (cmd == DISCARD) {
-            IteEntry ite = {};
-            /* remove mapping from interrupt translation table */
-            return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
-        }
+    if (rdbase >= s->gicv3->num_cpu) {
         return CMD_CONTINUE;
     }
+
+    if ((cmd == CLEAR) || (cmd == DISCARD)) {
+        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+    } else {
+        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+    }
+
+    if (cmd == DISCARD) {
+        IteEntry ite = {};
+        /* remove mapping from interrupt translation table */
+        return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    }
+    return CMD_CONTINUE;
 }
 
 static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
-- 
2.25.1

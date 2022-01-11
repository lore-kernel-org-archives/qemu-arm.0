Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800876lfj;
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
X-Received: by 2002:a05:6000:38b:: with SMTP id u11mr4756356wrf.408.1641921052001;
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921051; cv=none;
        d=google.com; s=arc-20160816;
        b=QcmnAHRQuZiPNZS7Rmhc+4RVntyqEVOH8pQZuW2ZRZdWK3qlt2qitpwIA824DtcWuV
         hEyrqSLbt5VR5l4XCqiNelIrsRB9vDzLWEfnAkYz36dqbDx8IBnRE+QRS3Jje1MSqhM4
         xeMyPcna2kBmMAUuTd3MK2Pb0oepYwo8I6czbcCLlaHgiofHy5qCTChet5Bm0DzArthC
         9wfyzeDSTWq/k1kR06yw53Rxf5kpkWWMuzhEuqOHwp4iWNp04cCRgv93gYf8hIkH5KMF
         j//kWfuJ6+6744FClzsMOwh0wE+Ry+qHv6fyRCQYrw/al8+GcRQHOaHKzpsPJRf6K/C6
         2svQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ob5bbn/w0TzbvNqJivAvBR3jtD/48+Yhebkf8RVzKMw=;
        b=u6Lt8O4iOgSQDxKT/zuxg8GM+vxc+FtsghEzxsOnOoe2znelMG3aGABKAzWtr3TTQK
         0NzS/Kk+cAwx3nYXVHmHy8bCbudGHLqeXA/xYS4PcLqtjfYQLKN+7PbfvfEazUqmuEUl
         XsymfHZHaQ0d7eWipW9Lm+1sv/knCiZ+D/6Q6b6jAaMg61PwVcX3cz4TGdPurgci4nee
         9DHSboxbqzCPuacIWU2kMKo6ep7e+fRDc5sZEwIwvUlgTM89MNNQuGm3VEJjquUJAvYf
         QpgOR7lHIU/JOvfJgy39RJS8mABTTMjwOhPWTbLlPfWg2GoNmVBYASR1N7AEGU0mUIwr
         j56A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWVfeHV9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10sor5874031wrn.71.2022.01.11.09.10.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWVfeHV9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ob5bbn/w0TzbvNqJivAvBR3jtD/48+Yhebkf8RVzKMw=;
        b=sWVfeHV953skZ1ANSKtB6LVaJUAudCwVCsUQs+r8/tdWImub794kbVVD3TW1Opdqed
         9TfNlbHkP6MPWkT8mstz6mmXvnb/vAkns130luOY4YUZiyW5TOLZxYryuQeT4kSiWNql
         135tWjwhc6Wvk9DnHXG74LTAJu97ZKHm6aF4UsDscpnT6pE8ZRPmBlI5ZpNFPk46ZXWl
         G+NPPFsxqr/kGaIfATL2Y++B3o6dKYEO/mV+ut3avaXtfh6ldGyTXeKCKaz0jM5NZqdL
         ewkV+j0LzkBLV8mbRbNUTKa9tX37Fn6Oz/Oqi2ND6V66W3vEawcLQ3+goAW3nbt+CeIg
         teWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ob5bbn/w0TzbvNqJivAvBR3jtD/48+Yhebkf8RVzKMw=;
        b=Yfwq3GL4HFvg4VtE5cn/FAU0tBII7UVcn/PKjg7ofi4VSrvdfBWWdO0PUTQSnaKZXX
         oqRJJ1ktr/qwUg2t9UhaVTJtMgE/fCC28naubVndY7A4tWt0MSlIaZCnr0irqP8IAcHZ
         qXKCyNhvPeLUiEZU2XftRkKeZOFzJYF2fQd7JloTvGDcTaLW7G96eO3+2BZGZWKacv7g
         M4WZkL29zB/khkdMUooLpnYgQYsJHrpeRsjjLje+qWjZnYA//q5kU15figEmlW45t3kt
         cuTZVGwXlC507nzI43Wl0H250NqfhPBXs2mbovtNOqdLNrh5q4Ztmu8uG0/9gWXJNLAe
         UXlw==
X-Gm-Message-State: AOAM53021lMwO/CP67mDQdMkIrcZMjxZuG6QkXcsHzx9G0auugKHc1Hv
	xk2QWZ8GGWr5hjUeLw7O7rW8YoGK
X-Google-Smtp-Source: ABdhPJz+6tiYN8uN+ZbhGRQryNbfTu0AoimJeMiEJLMOi/9RtBm49pzsvfHk65PpTpam9N0/qNZdXQ==
X-Received: by 2002:a05:6000:1883:: with SMTP id a3mr4811160wri.565.1641921051657;
        Tue, 11 Jan 2022 09:10:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Tue, 11 Jan 2022 17:10:36 +0000
Message-Id: <20220111171048.3545974-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BkZ2yQXObxpc

In process_its_cmd() and process_mapti() we must check the
event ID against a limit defined by the size field in the DTE,
which specifies the number of ID bits minus one. Convert
this code to our num_foo convention:
 * change the variable names
 * use uint64_t and 1ULL when calculating the number
   of valid event IDs, because DTE.SIZE is 5 bits and
   so num_eventids may be up to 2^32
 * fix the off-by-one error in the comparison

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fa3cdb57554..6d11fa02040 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     bool dte_valid;
     uint64_t dte = 0;
-    uint32_t max_eventid;
+    uint64_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -299,10 +299,11 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
-    } else if (eventid > max_eventid) {
+    } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d > %d\n",
-                      __func__, eventid, max_eventid);
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -336,7 +337,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t max_eventid, max_Intid;
+    uint64_t num_eventids;
+    uint32_t max_Intid;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -376,11 +378,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
-            || !dte_valid || (eventid > max_eventid) ||
+            || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.25.1

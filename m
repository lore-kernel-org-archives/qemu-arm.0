Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583399lfk;
        Sat, 11 Dec 2021 11:11:48 -0800 (PST)
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr25528507wmh.15.1639249908416;
        Sat, 11 Dec 2021 11:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249908; cv=none;
        d=google.com; s=arc-20160816;
        b=tvmydMvWZaLAUcC/9zSfajp1b5NJQjAvN+65fAAIUjwggA9lXlLx+oi8fIsf7bLkk1
         gfDzNs4bpDPfq5WUPPUnfkN3Ky2ncEjaiTkxbqec4udGo5r7yiEvgDudJSK6Cm+MAxY9
         vGFzUgqD24ynvRPQxNPIQM2NdOH9xccPWnuaB/rHuFbfPbZFl1cWiyEdfsJb8WeAK5PU
         FkovxBk8MZPSaj1ZCfenFsbN0QznVaDsOKzLi9STcNKKBNReVMP6Gozu5HkvJCPp4red
         M+L03xlaAcENjuZUaQoG/JE1zZnTYk/2Ws+Tx7pky2ryAQa7zqoHLIhWMXGmUIRUgyO+
         ShlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=loQ+xquehh4CwIIEWlpnyYEH2qth7GSqNKiw5dsrAaY=;
        b=meKMRW90bqPGhdI1I2HgYK5DBSNUm5ba4inPVQr9gE1b+uirIc7CHjEpYWVti8FWtC
         hv64wVhh88YcyfMWpjgYSW58xDndvBHkIFk7jVZOqu4tmMOn6KDfS8yWYEjm8HLw1oei
         6cGnJBBSyO2i73f4P2Bl7YQo015tfIdH/9erlX3Ua/+JUi29Nk4xDrDxjkkWl3T259dk
         g5rt4dOjDwOYm3am5kWgop0Lq8z3uNaa+L3ERBupcgtHWjnkoA0FjKfhslHEC9hLL33N
         xAjJf2K2rMtgW5o00v+PG+jEY41BbsX0+YTvQ95qlo1cvFUogfJDHkfQYvcElQbwOTbg
         5YaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0vdpt2n;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g9sor4283789wrm.8.2021.12.11.11.11.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y0vdpt2n;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loQ+xquehh4CwIIEWlpnyYEH2qth7GSqNKiw5dsrAaY=;
        b=y0vdpt2nTfndFI0rRWV4i/jEHn/r3ryhwoJOMBQ5K6MMv37iqcpEdMZuc6iCJLO0fA
         KiWEbimICp7oDBQWrB3FMgc19fh7qbLXlfCkCSSaujgtHmkPmLkJtbmyQtFGuTpRyvDT
         qQJ7DA9Y7kQqxgeIaWUGuoTMsWWkI6WTEnhPoMOdxXshFo7JwBFrQolnHvO0wfHrVX0W
         hBwMaDF2V3V6mwffzwyQys5rk7C3QG6fTbZhZvn8lSSZB33k7kPV44X/r4yzymWVTc0v
         He9ih1OuCLdqOta1BiSTd6w1h/CMcOmyEK4TD8ZGXf4oUe+Qm+c/PclEMZBjYCmAfKaD
         d4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loQ+xquehh4CwIIEWlpnyYEH2qth7GSqNKiw5dsrAaY=;
        b=sXmmj0eQy+Hh6efR7xlyhA4DD7JTpHNlPfPasYexSovRshilZzMrbVmpkLEPZ8PY+0
         FI2wiyJCRC20w+UNnHmKvFbrnWzgG0dtL0/CfLlM3hFtS9Nxq0sJjmdduJ844hnKyckz
         9G65L3Q4pBgocsLH7gSOn8NKh7CT/mXq3kBGzO9XMj8ITATS53zkGO2Q06ydBLZOMoRD
         EK0n24kqKfcd2GVKDkhLI/w4dqpz1UeuFTFx323wZGGTV7ga8DNtqk7egA+PFA4Rgl4L
         2k4CN/06XpG41IjiOer2a2hjaA/5HiEUj+zRaBxv64/1ef2NWkYQTb4AOaori7v2Hz/5
         UgLw==
X-Gm-Message-State: AOAM533YM+6rchK6eDVn5Bgcpbrj0KFzd8momewDipH4paO0ONzY+nj1
	rzGL4er1WB/Gnhyx5mo8CY2vrw/6
X-Google-Smtp-Source: ABdhPJy8JpQeaXUD+WAEDfBYGXsRbif7M5fLErrvBQN4Yww7SnsrKZ3Ap1u24NfTi92VeQehxBm8QQ==
X-Received: by 2002:a05:6000:23a:: with SMTP id l26mr21738061wrz.215.1639249908199;
        Sat, 11 Dec 2021 11:11:48 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 13/26] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
Date: Sat, 11 Dec 2021 19:11:22 +0000
Message-Id: <20211211191135.1764649-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tpWBEadJBvAF

Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 3 ++-
 hw/intc/arm_gicv3_its.c  | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 14e8ef68e02..1eeb99035da 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -403,7 +403,8 @@ FIELD(DTE, ITTADDR, 6, 44)
  * Valid = 1 bit, RDBase = 16 bits
  */
 #define GITS_CTE_SIZE                 (0x8ULL)
-#define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
+FIELD(CTE, VALID, 0, 1)
+FIELD(CTE, RDBASE, 1, RDBASE_PROCNUM_LENGTH)
 
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index d6637229479..ab6ce09dbc2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -104,7 +104,7 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
                                       MEMTXATTRS_UNSPECIFIED, res);
     }
 
-    return (*cte & TABLE_ENTRY_VALID_MASK) != 0;
+    return FIELD_EX64(*cte, CTE, VALID);
 }
 
 static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
@@ -308,7 +308,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
          * Current implementation only supports rdbase == procnum
          * Hence rdbase physical address is ignored
          */
-        rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
+        rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
         if (rdbase >= s->gicv3->num_cpu) {
             return result;
@@ -426,7 +426,8 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
 
     if (valid) {
         /* add mapping entry to collection table */
-        cte = (valid & TABLE_ENTRY_VALID_MASK) | (rdbase << 1ULL);
+        cte = FIELD_DP64(cte, CTE, VALID, 1);
+        cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
     }
 
     /*
-- 
2.25.1

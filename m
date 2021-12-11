Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583423lfk;
        Sat, 11 Dec 2021 11:11:49 -0800 (PST)
X-Received: by 2002:a05:6000:1788:: with SMTP id e8mr22949652wrg.45.1639249909782;
        Sat, 11 Dec 2021 11:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249909; cv=none;
        d=google.com; s=arc-20160816;
        b=lOaVKfa+449p3nlTWhSUPkQRSvXzNIyO+XDgrRVAb3zmztua2D3/sVpCTD+yFqpIPb
         Ac4zY6bmisZ4XjfdzDqNPSqHpyGZw4jt/zKDyWEIyk6C/iTltvx4pV6NuHeMQ9aTtl4+
         OhCWAPZpj8NrzRd61HBM0Ewc8/BwwKyV2EgkbREk9IPrWtiurvfKBs67FrmNkQMA3sfo
         /2IvzzwupQOSMA9gBcEdo9Oywt7IdVkK9M2eoh/h3LuB1GXiR8NnlxioAtW4Rb6vbtZC
         NWyVIADlTU47vRw70PDctts3lDlMapu2QnppuEkNTsXKiEASP9Gn66/u+SZnk+LTpLom
         pXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fauFLGdzeAATmDF9gAqqL5XkI2O2hmApgmwaQGRzSzw=;
        b=q1325YyiU7eueZ2wp5+YjDjEiBehAgwRH8dG76KYLIW0sZoCWn0JsUgkXgyMgo//+l
         lLQDUPCcbNTpm5utKEjiBNKYbc4QNjQ5rxX+EzW6XIi6rotf9KC6tQJFkLBwD5QkRVyf
         JW+Mg6c1o2H/eXZpbVBlOqJNQzH8/1BaG1JkuiFFTvGZAkNshTcLrIi9N+rJiMVqfrT9
         GexaKXpxKFMMttDxbOmfH6B6M9huF9J8f6dtforhl6PNYpmmjglZZJordOAKLty/Di9B
         ZsJ6/4v/f33SppVNN/c9zeo+VCc7sO0mMlGu7rSm1B7U1VMD8ao5anMU1HIw6O1wT+7e
         CZzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AlE7D7Gb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b3sor4307838wrr.9.2021.12.11.11.11.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AlE7D7Gb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fauFLGdzeAATmDF9gAqqL5XkI2O2hmApgmwaQGRzSzw=;
        b=AlE7D7GbLHI79jzFrXAfny3wEJ7RB15j5jdR6T1DzOzG7fQOp6QBV/xup+mzbrG9BJ
         e48/T12479lqywsqNfkKE1PdU8Pqrl05oGF2roKo1Qr1ubW2lCUsaKGYGRgb9TTzBF6/
         B5HnTV6hZUcfTZnmZca5r+02j2rSUyWfpuqBhuxv0Rq72buvq4qjbKdKmi6Vd0Gjwr9O
         5GQIxzhlbwaFRFBb+YBr3FoiSVvb7bu8WvjenbFBB5iRCdFlZtpnQgTurk5qe2yRYrsw
         xASLEAYdnCNv3XykGx5IcCZeioH0UoM1rXjAdW3xeA7ajYaFTtQAzyOLDcDTd88FhnRQ
         uQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fauFLGdzeAATmDF9gAqqL5XkI2O2hmApgmwaQGRzSzw=;
        b=U3UnkFujvzZYyd67Yd8sS31qabKaUxkQj+PYEqusj28z4xGczU8u/sVooI5GoYYL3r
         jzQ0iGnCSNDd69oRp5Z3Nh/u8Qm7+FYg4sUAR/wr8aQHdKEh/eh7ofnmrgNTRn2+Bvp/
         qrFB1EoQSvPvWOFZLs76XHN9KjmMMDj4p7p5mpax3fSEhMzwXJMV9MNGd6LnWJN3aUPP
         wbKgSup649THh9RwiEgE1HnwolKp2m26HfE6ceGvJxBfB8TcaYLQbZt7asV0gbFSwf/C
         pc3MsM0rQ7r4cH50VKtb9JYyiGKXzn3I20N54JMuvBbV+waP/ZuyGyTG1eA8lBubBqeC
         T+zg==
X-Gm-Message-State: AOAM532GDXLJX0guPmWLQkSn3Ryc+y9KUOZcJjg7mi+n99OMRI+SOsuI
	h4wUrrXsNn+YmJhpDmi1RYmdEC9e
X-Google-Smtp-Source: ABdhPJx+w2Ew7zIYDVX6bR6/h8l888MDhiIcbnVWL76aui+J+KZrlze1XnJJTpCXTvPjrsiuAt2m8g==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr21247343wrd.144.1639249909532;
        Sat, 11 Dec 2021 11:11:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 15/26] hw/intc/arm_gicv3_its: Rename max_l2_entries to num_l2_entries
Date: Sat, 11 Dec 2021 19:11:24 +0000
Message-Id: <20211211191135.1764649-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DjepRSDelZzq

In several places we have a local variable max_l2_entries which is
the number of entries which will fit in a level 2 table.  The
calculations done on this value are correct; rename it to
num_l2_entries to fit the convention we're using in this code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7b50d3a29f0..e4105282b57 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -74,7 +74,7 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
     uint64_t value;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
 
     if (s->ct.indirect) {
         l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
@@ -88,12 +88,12 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
             valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
             if (valid_l2t) {
-                max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+                num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
 
                 l2t_addr = value & ((1ULL << 51) - 1);
 
                 *cte =  address_space_ldq_le(as, l2t_addr +
-                                    ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                    ((icid % num_l2_entries) * GITS_CTE_SIZE),
                                     MEMTXATTRS_UNSPECIFIED, res);
            }
        }
@@ -176,7 +176,7 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
     uint64_t value;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
 
     if (s->dt.indirect) {
         l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
@@ -190,12 +190,12 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
             valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
             if (valid_l2t) {
-                max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+                num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
 
                 l2t_addr = value & ((1ULL << 51) - 1);
 
                 value =  address_space_ldq_le(as, l2t_addr +
-                                   ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                   ((devid % num_l2_entries) * GITS_DTE_SIZE),
                                    MEMTXATTRS_UNSPECIFIED, res);
             }
         }
@@ -416,7 +416,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     uint64_t l2t_addr;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
     uint64_t cte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -450,12 +450,12 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
         if (valid_l2t) {
-            max_l2_entries = s->ct.page_sz / s->ct.entry_sz;
+            num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
 
             l2t_addr = value & ((1ULL << 51) - 1);
 
             address_space_stq_le(as, l2t_addr +
-                                 ((icid % max_l2_entries) * GITS_CTE_SIZE),
+                                 ((icid % num_l2_entries) * GITS_CTE_SIZE),
                                  cte, MEMTXATTRS_UNSPECIFIED, &res);
         }
     } else {
@@ -521,7 +521,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     uint64_t l2t_addr;
     bool valid_l2t;
     uint32_t l2t_id;
-    uint32_t max_l2_entries;
+    uint32_t num_l2_entries;
     uint64_t dte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -556,12 +556,12 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
 
         if (valid_l2t) {
-            max_l2_entries = s->dt.page_sz / s->dt.entry_sz;
+            num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
 
             l2t_addr = value & ((1ULL << 51) - 1);
 
             address_space_stq_le(as, l2t_addr +
-                                 ((devid % max_l2_entries) * GITS_DTE_SIZE),
+                                 ((devid % num_l2_entries) * GITS_DTE_SIZE),
                                  dte, MEMTXATTRS_UNSPECIFIED, &res);
         }
     } else {
-- 
2.25.1

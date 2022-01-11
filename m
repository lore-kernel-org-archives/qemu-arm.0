Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800990lfj;
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
X-Received: by 2002:adf:dd88:: with SMTP id x8mr4720200wrl.586.1641921059510;
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921059; cv=none;
        d=google.com; s=arc-20160816;
        b=0eFJyq0ICNJySXrbX/jS5QyVW3Jy8eaWHPtqx5pfy+kfHUdSUHwczMZGWxXVN24okT
         Hk50Hxz6XLw9azxCFYRoRUpCcjwJ1/tketf2k8syBRxEa5l7TKr/pRSEB32AyK0oTBnD
         6c4itqnEuQcuWd6pAuYvoAXiuJDHDe4HRGVkjUnAXopYG5+8Cls3qNnC/Vz7gAc0C2pj
         dlbWlEnDa5I5DHKqRIcp4sn2gWB3chH0bUNhQris8eoZk0XDDsorFtA5TAZhAkdqdAkm
         F9yTLGtf3HJKBRF3oLRykldC/qG/XvuKpamFDEjeT9RxoX6+zk1IJTuryhI06GPeeoZp
         H9+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WpU33ZVGPAyCC9DTXzdZDHcDLe8eur6K3oHNtIfAuUs=;
        b=FeYVzjI3/dFh1OSoS5C3kSzy0p62ssdJAT65lP9QabLTLCT0eKIdM7rC0n7O41gaqO
         ux5xez8gGF3IRYQsyOy6fbXJXsGetR0iWhnnB9oJpuBKIafxIkA8PS1zu6N6LDQC7o51
         12fST68UkaB668yUAmWRqG0ntRxsbrY2IkZr9YHfP0808tHT8GTCZA0I/sq67PirXFaS
         RfoVyVWrlz+OgRaIWBA5e6L5efWUroH0HyUr0VUXy2j2BP3tgeTijyoBrfko9l/rnpuX
         uexxiRCDVkVPwtnsfIIBI+DM27XRa+KbDKe2/TpIi5eQ+MpPa2UtpowL7XlJz/2YTuXE
         mUkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szDT6OJx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i18sor3911955wrp.9.2022.01.11.09.10.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szDT6OJx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WpU33ZVGPAyCC9DTXzdZDHcDLe8eur6K3oHNtIfAuUs=;
        b=szDT6OJxANgIElJmFK6SuaPQKe0pFaJNPg6rQJcpyRqt4rkVYc8gi/9uevnCpm6/Jv
         pFMVFbnE4JMdXffnwMk7kF2OPsQPM+ChH+wEhiz4f296p9kOpA1n3sDIv7p65aK4Mn4E
         AyqXkD1Ugij3w4/DBOiBo8jocTT578lM/9PqB6sjMfLbNhDhV4VyNUN68psUoEl/TOl2
         BoKl3408EHGcd4xdnrGViO0R8h8/7/nHzi2l0ifYAV3rCP1kaOltRKEwOPLzc6KNNc1M
         ZdNiOOqAqQT97Z/SIYsFnZ5ugpTNDgx/az//LOzhOvyT5aKjqQLZR9CKqWZD+tWdhfrH
         QdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WpU33ZVGPAyCC9DTXzdZDHcDLe8eur6K3oHNtIfAuUs=;
        b=wjU6hxsg1Y+AzsB8ow1y3ooJuIQT1waSkFNSIi1zqLBJw30qW/Wd8v4wjHDpgmWBhp
         APh5HzEiOfF1my9DqOFtqDBVrzcB4jn3ysh5ZufgIp2QkIxHFAAOaOyDALCubdMQYmBz
         gD38HefyLEjADfqsr4Wn5/R55uHctlC9t+qnx1CMHY5WUHU8YJZ/HhRTVMktI/whV03D
         1ayO76ZCnQEEY+wEgQgBsaL8gWg/m+6CVLU50tq7oCmFFt9iqPxqsH8YiMQEyeDV0UF5
         74ru1eFS8nMObVTawjchRl7O4sMozjtYaK2xMrWhEekH8RIqzQ+Cq6xWDwidx5aElzl6
         /93g==
X-Gm-Message-State: AOAM531WGMyY8d93LjFMF+fBjX/XMnWp1mjlaGvIc83teMYE5gAr15y3
	5z1vt1Qoy8wGxs7MBgO3UybL6KA0
X-Google-Smtp-Source: ABdhPJztl3iR9W5DfAB4WXN8g0TqV8VKRn2H0FGsK8nBXHXm3jg+Lt0RNUNtM+1tF9xQdAQxGiObKw==
X-Received: by 2002:adf:f390:: with SMTP id m16mr4659738wro.651.1641921059252;
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 12/13] hw/intc/arm_gicv3_its: Check indexes before use, not after
Date: Tue, 11 Jan 2022 17:10:47 +0000
Message-Id: <20220111171048.3545974-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TAeJKKcbHm86

In a few places in the ITS command handling functions, we were
doing the range-check of an event ID or device ID only after using
it as a table index; move the checks to before the uses.

This misordering wouldn't have very bad effects because the
tables are in guest memory anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 42 ++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 985e316eda9..ef6c0f55ff9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -255,6 +255,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     eventid = (value & EVENTID_MASK);
 
+    if (devid >= s->dt.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
+        return CMD_CONTINUE;
+    }
+
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
@@ -272,6 +279,14 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
     ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
@@ -296,20 +311,6 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
-    if (devid >= s->dt.num_ids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
-        return CMD_CONTINUE;
-    }
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
     /*
      * Current implementation only supports rdbase == procnum
      * Hence rdbase physical address is ignored
@@ -375,6 +376,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
 
     icid = value & ICID_MASK;
 
+    if (devid >= s->dt.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
+        return CMD_CONTINUE;
+    }
+
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
@@ -384,14 +392,14 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
+    if ((icid >= s->ct.num_ids)
             || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
-                      "devid %d or icid %d or eventid %d or pIntid %d or"
-                      "unmapped dte %d\n", __func__, devid, icid, eventid,
+                      "icid %d or eventid %d or pIntid %d or"
+                      "unmapped dte %d\n", __func__, icid, eventid,
                       pIntid, dte_valid);
         /*
          * in this implementation, in case of error
-- 
2.25.1

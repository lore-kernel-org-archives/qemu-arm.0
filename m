Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732445qvl;
        Sat, 22 Jan 2022 10:24:55 -0800 (PST)
X-Received: by 2002:a5d:4201:: with SMTP id n1mr8186636wrq.239.1642875895159;
        Sat, 22 Jan 2022 10:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875895; cv=none;
        d=google.com; s=arc-20160816;
        b=Qgd5V0MiNTUClS1bRvfl2kf9UNnxYRh/dU/GlIBq/xnrTWUkO+d4q7Vn3MezhCs6yi
         AKMlFWiZX6UcdLf5rkG2bxhLZ9pQGDDOB5hI7Xz66yuhGdhOoJmXhLgETk4xVtLqP+AW
         AZ2tgroj3RWNYsmapfFsxdoOrw490oEsTf5uri9rI5odreM+2qy2lgQZfQ8EJuHyOBhz
         OTxKx9K+t66ZZQBY3Nv0wtAlP77sOSNmHyUxuvVsx91CwzdKKy9uR+BxDJLDP96SsVQO
         cBohYVLxcjsc/Wko9p94ir3s7YOjhCbuzMbEWVotT/IH9Oqt7+KH3wTa76gbL9DpACgk
         Ql8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MVgp6Ydys3b4ZUYTxQ7NMxi3s2REQ8l+tqo9NG4Dx+g=;
        b=U1tvml4QpaRZL64c9Nqs1KERQXu+LzM4cVO+EYEl7Tk4mXDcJG0yEuesBMadj6nqCH
         epyJM6ZX9ek/j8nsnFpWA9owvspzFuaV8/dTVPAbjXMeKTBdRDoXU4ZX2WnWKqUAKawi
         Ftsoe7qphrWTw6hzmzvECjk0+iQC+QT0iU/nEDmkdIAecwc0S/7kiv0OtLSh+j0LgPPG
         USIvwlPSk/TNZGSZ8eGf0783OXfZ1hdTJ6iQ7ad/Q1awJfzu/ZyfnmQmzWAwpoNT1lqz
         CybYGpcfPvsb5PVSPzm4EIavrKWv2EAz09RNntfvNf1fV5PVJYDuCasOI8olCxas4kM9
         L0Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEWtf1pr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q21sor5800068wra.37.2022.01.22.10.24.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEWtf1pr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MVgp6Ydys3b4ZUYTxQ7NMxi3s2REQ8l+tqo9NG4Dx+g=;
        b=WEWtf1prF/r0AoWHJ50DAOT1HyPSZWocu/NqtlB+sKgw96e2GmeHnQz462C7nShxyF
         NzyqG5H/la+WTvVtBwL6nXg3dIdeNffsNpFTfJQTONeUtNNtX5NkwNU8ImaIhY2lTDR7
         kEezG3Z5Q9gZcId5+suVJOKa9NrsTW/OpGuPRcFedmeriy2n4OdZ6j0sc6IaZ5+et5+Z
         mhlbePPOfa/poK0PT64UEF7TPUVO1pO75ykF9OGA6p6uuWi7CGrhj8fwB+5lXApPQ+V0
         EnUtHiYy3S/Ec9mzF+pff/8aRjD4pEIVT3HJzuNGpjP+tmOqppvRbK+rB8P0Y1LI0Ma2
         4AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MVgp6Ydys3b4ZUYTxQ7NMxi3s2REQ8l+tqo9NG4Dx+g=;
        b=RJuSCU0zq9pjJbeg8eHa/IgM3n++jLzoTmn+3gQ9jvj4KQltX/+TtqfHVn5dnnPn/O
         vaRn35llLf6nJOTz3NcYJwHuFlp/DVZbwZ2YbzXtj4ZwCQ+pP1c/+f/hpdAnrpD90dWI
         j/xdEwflb6GKkkzTJ82NoBrZXWbEY2EcNTsJElAer3L8Z34XY1JVcX1xw6Z0VTgBASpD
         J4AQH4Lnm/BQqpwplEUvzmu2WC0jiCwAZrz3Dm4vGBegPAWRwgHhw1MagZltOjmQ0CR1
         +hWvaot+3tlUsXxEmKLQp8BZTJqfzIUyV19X3iHScN6LHppc6OIfFs8U2+ijRIf7Hi9F
         Nitw==
X-Gm-Message-State: AOAM531Bn6mJleG4MdGOpp5M3mvrI1qPsV5wLuod6EicRcTwp3hiIbxZ
	Mh7AM0KQC2tqWln3nH/OCStMR4TrPn7t+hMS
X-Google-Smtp-Source: ABdhPJyCIp6F5YifLPMjl8licT+rBw27eKwXgqyIOxNR9V4AdVPTFoEM+TXk2cNTMIaIkw7hGxYEGQ==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr8235096wrs.592.1642875894841;
        Sat, 22 Jan 2022 10:24:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 12/14] hw/intc/arm_gicv3_its: Check table bounds against correct limit
Date: Sat, 22 Jan 2022 18:24:42 +0000
Message-Id: <20220122182444.724087-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OdYSKVK/IW10

Currently when we fill in a TableDesc based on the value the guest
has written to the GITS_BASER<n> register, we calculate both:
 * num_entries : the number of entries in the table, constrained
   by the amount of memory the guest has given it
 * num_ids : the number of IDs we support for this table,
   constrained by the implementation choices and the architecture
   (eg DeviceIDs are 16 bits, so num_ids is 1 << 16)

When validating ITS commands, however, we check only num_ids,
thus allowing a broken guest to specify table entries that
index off the end of it. This will only corrupt guest memory,
but the ITS is supposed to reject such commands as invalid.

Instead of calculating both num_entries and num_ids, set
num_entries to the minimum of the two limits, and check that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h |  1 -
 hw/intc/arm_gicv3_its.c                | 18 +++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index b32c697207f..3e2ad2dff60 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -47,7 +47,6 @@ typedef struct {
     uint16_t entry_sz;
     uint32_t page_sz;
     uint32_t num_entries;
-    uint32_t num_ids;
     uint64_t base_addr;
 } TableDesc;
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 237198845d7..3f2ead45369 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -256,10 +256,10 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     eventid = (value & EVENTID_MASK);
 
-    if (devid >= s->dt.num_ids) {
+    if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
+                      __func__, devid, s->dt.num_entries);
         return CMD_CONTINUE;
     }
 
@@ -300,7 +300,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
-    if (icid >= s->ct.num_ids) {
+    if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
                       __func__, icid);
@@ -384,10 +384,10 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
 
     icid = value & ICID_MASK;
 
-    if (devid >= s->dt.num_ids) {
+    if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
+                      __func__, devid, s->dt.num_entries);
         return CMD_CONTINUE;
     }
 
@@ -400,7 +400,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((icid >= s->ct.num_ids)
+    if ((icid >= s->ct.num_entries)
             || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
@@ -485,7 +485,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid >= s->ct.num_ids) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid >= s->ct.num_entries) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
@@ -566,7 +566,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((devid >= s->dt.num_ids) ||
+    if ((devid >= s->dt.num_entries) ||
         (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
@@ -791,7 +791,7 @@ static void extract_table_params(GICv3ITSState *s)
                                   L1TABLE_ENTRY_SIZE) *
                                  (page_sz / td->entry_sz));
         }
-        td->num_ids = 1ULL << idbits;
+        td->num_entries = MIN(td->num_entries, 1ULL << idbits);
     }
 }
 
-- 
2.25.1

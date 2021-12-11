Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583331lfk;
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
X-Received: by 2002:adf:fd83:: with SMTP id d3mr3598239wrr.600.1639249903901;
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249903; cv=none;
        d=google.com; s=arc-20160816;
        b=FLrLoR6u850bTQATCcPj9qj2ze1BNfWikhZaIMXpi5mGHaqTT0NyhJ+nwPgqMWcaZR
         sH9BgJDrTzAx1CO89cSbEzRkTixGvwiLdRNjXjpMZDvPys+yQoXktsvXtmn5cj2CJChA
         UTPkRw7GfHzSWlTRmIxxJayxx5qWBks6FdQNWLdHnVAbEaehCwCy7WzAM/29x9nbOpaw
         uR89/xMcKo9uPsMQuh8izbxYiDpYtN7mJhLOcOP2m7RKsG4dKxvnXVczYHN5YoQfRL5N
         nIbsYcEUrfsSx0+dVYMokBczED3fQWxh+bmDQVk6uy6YESY9OuWZURjcqXpVBBcSi2zj
         zhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UU9Ga+a5TMHIVvedbmFulE35BgOQRPa9LBAE1rDIpwU=;
        b=IU+gMAZFIjypELGFbs7Ep4hSCBmrTYNAxt1VjQXabxhkb1gEN0X+71X6WasEWoLcvO
         MXUKFIRwfCf6wZ/56c+u7fvNKdZJzrYEXI0A140ZzgX+O6cwd+Qg49iBfwLEjO7s3xnp
         0YIK8IiQm0BqwQKMWcfaud+bRy+1CguoFBjyCss8PCvoKdvSpJdGq5DCZH9AT+gg2E9M
         bmnddLBD754cpHdKzo5/oydqq0IpzlLGBPYNSVgjfeaHeY+I9WEAru+sGTksUcGOpChB
         Xfr6F4mXmth4pWujymPUU1rLHbxoD3XfHVX0W0hYvMv47W+O+WpkxaIiNBzo74yRCFuw
         mZyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMm1wvhe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o17sor4238709wrj.48.2021.12.11.11.11.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMm1wvhe;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UU9Ga+a5TMHIVvedbmFulE35BgOQRPa9LBAE1rDIpwU=;
        b=PMm1wvheXPbQuQuB8P9oX/1LQyZdKtL8ThYojAzGabUTtYTvsXO3mj2WRXD9kCkewW
         mf4wXwhVNdavEt9R7aqpwUjuWxk3P8yN7lF18arLj7PLBc1SeC48u0k3lSrNgxGBCrdM
         cIq7NdQXzuyHhnZwp/sp/1b+PjJOdKMGkFWeE6bLcBVq+Mc9wSSu3QrSbBz+XpDkftAz
         aJMkpBNmxVaLcXm7rjS4VqR/AE9J7TiBJTGopFsB8f/M09f+YgKWsNxXHkP5dWZLZGU1
         tm5U4E0TlQ5EbmpXwlBHmonEildBYJcDXAv2nwlP+np/7hX4NPqWpkecGcHkjHhG4k4o
         nDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UU9Ga+a5TMHIVvedbmFulE35BgOQRPa9LBAE1rDIpwU=;
        b=kkXrelp/WNrM3QV4lBbRtxHX3Db7YwAS1fTVy/lL4P1813w2I6RNTQAwls+AhTz4c/
         iNx+oqVmcxhU/xI4M6iYS/r+dtEj6DJvsSdCDe5lucCYH22T4WrODcAUEeyxKm7AQpiP
         N3z5RMcBU+Pdt+Cdwf9kGnYWPMWobVBG0TOMYX+Aw0acVGqy6mStZI0jydwGT7ixT5pq
         VqRXdBc6jkZVZVa1dxQfo+W5hZHJWZ/T7lLGxOyie1LaFoVmjEkv5fIW3X+5J07fIAVl
         gKgGHHBL7Wl/kvfe3Vv6DRd3C/JTmFFNFmgkZKQSuO0nxWlJO5kOxmy1FpDjiDuDyv+k
         rZ1g==
X-Gm-Message-State: AOAM532tiWKSE2trB6JeuAko6LkM/CS2sRXu64WkldH1cAIr23eEq2r+
	6Pl/Y51uScCom26TEyWVJI12eJyd
X-Google-Smtp-Source: ABdhPJy0v+mXynBuIV53zTypPVUtsGr7bepsXujsumG96mGhhjl0hUH+jj4nHKBzBIuKST+Eh5CFWA==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr21380833wrr.223.1639249903595;
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in extract_table_params()
Date: Sat, 11 Dec 2021 19:11:15 +0000
Message-Id: <20211211191135.1764649-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8+4GwbEXvSJ2

The extract_table_params() decodes the fields in the GITS_BASER<n>
registers into TableDesc structs.  Since the fields are the same for
all the GITS_BASER<n> registers, there is currently a lot of code
duplication within the switch (type) statement.  Refactor so that the
cases include only what is genuinely different for each type:
the calculation of the number of bits in the ID value that indexes
into the table.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 97 +++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 57 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c97b9982ae1..84808b1e298 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -758,6 +758,9 @@ static void extract_table_params(GICv3ITSState *s)
     uint64_t value;
 
     for (int i = 0; i < 8; i++) {
+        TableDesc *td;
+        int idbits;
+
         value = s->baser[i];
 
         if (!value) {
@@ -789,73 +792,53 @@ static void extract_table_params(GICv3ITSState *s)
         type = FIELD_EX64(value, GITS_BASER, TYPE);
 
         switch (type) {
-
         case GITS_BASER_TYPE_DEVICE:
-            memset(&s->dt, 0 , sizeof(s->dt));
-            s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
-
-            if (!s->dt.valid) {
-                break;
-            }
-
-            s->dt.page_sz = page_sz;
-            s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
-
-            if (!s->dt.indirect) {
-                s->dt.max_entries = (num_pages * page_sz) / s->dt.entry_sz;
-            } else {
-                s->dt.max_entries = (((num_pages * page_sz) /
-                                     L1TABLE_ENTRY_SIZE) *
-                                     (page_sz / s->dt.entry_sz));
-            }
-
-            s->dt.max_ids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
-                                                DEVBITS) + 1));
-
-            s->dt.base_addr = baser_base_addr(value, page_sz);
-
+            td = &s->dt;
+            idbits = FIELD_EX64(s->typer, GITS_TYPER, DEVBITS) + 1;
             break;
-
         case GITS_BASER_TYPE_COLLECTION:
-            memset(&s->ct, 0 , sizeof(s->ct));
-            s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
-
-            /*
-             * GITS_TYPER.HCC is 0 for this implementation
-             * hence writes are discarded if ct.valid is 0
-             */
-            if (!s->ct.valid) {
-                break;
-            }
-
-            s->ct.page_sz = page_sz;
-            s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
-
-            if (!s->ct.indirect) {
-                s->ct.max_entries = (num_pages * page_sz) / s->ct.entry_sz;
-            } else {
-                s->ct.max_entries = (((num_pages * page_sz) /
-                                     L1TABLE_ENTRY_SIZE) *
-                                     (page_sz / s->ct.entry_sz));
-            }
-
+            td = &s->ct;
             if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
-                s->ct.max_ids = (1UL << (FIELD_EX64(s->typer,
-                                                    GITS_TYPER, CIDBITS) + 1));
+                idbits = FIELD_EX64(s->typer, GITS_TYPER, CIDBITS) + 1;
             } else {
                 /* 16-bit CollectionId supported when CIL == 0 */
-                s->ct.max_ids = (1UL << 16);
+                idbits = 16;
             }
-
-            s->ct.base_addr = baser_base_addr(value, page_sz);
-
             break;
-
         default:
-            break;
+            /*
+             * GITS_BASER<n>.TYPE is read-only, so GITS_BASER_RO_MASK
+             * ensures we will only see type values corresponding to
+             * the values set up in gicv3_its_reset().
+             */
+            g_assert_not_reached();
         }
+
+        memset(td, 0, sizeof(*td));
+        td->valid = FIELD_EX64(value, GITS_BASER, VALID);
+        /*
+         * If GITS_BASER<n>.Valid is 0 for any <n> then we will not process
+         * interrupts. (GITS_TYPER.HCC is 0 for this implementation, so we
+         * do not have a special case where the GITS_BASER<n>.Valid bit is 0
+         * for the register corresponding to the Collection table but we
+         * still have to process interrupts using non-memory-backed
+         * Collection table entries.)
+         */
+        if (!td->valid) {
+            continue;
+        }
+        td->page_sz = page_sz;
+        td->indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+        td->base_addr = baser_base_addr(value, page_sz);
+        if (!td->indirect) {
+            td->max_entries = (num_pages * page_sz) / td->entry_sz;
+        } else {
+            td->max_entries = (((num_pages * page_sz) /
+                                  L1TABLE_ENTRY_SIZE) *
+                                 (page_sz / td->entry_sz));
+        }
+        td->max_ids = 1ULL << idbits;
     }
 }
 
-- 
2.25.1

Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1846485njb;
        Thu, 6 Feb 2025 14:14:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJ3J1UEEoIun8y/ZdYJIaXSCQWmEyh9Upfj/CTIdRo4OavyCwtDiheeoI2WYF/ceiqbpEoI5ED9mXivw==@linaro.org
X-Google-Smtp-Source: AGHT+IE0feYSTADNEGS1uBJtPrY+jVEvDpyYg9F9Un8yNyDvbWHokrOwCySs56hdaIvubCr1GHzy
X-Received: by 2002:a05:620a:bcb:b0:7b6:d736:55c1 with SMTP id af79cd13be357-7c047ca784cmr135890985a.48.1738880077358;
        Thu, 06 Feb 2025 14:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738880077; cv=none;
        d=google.com; s=arc-20240605;
        b=WdqgpIOkS8jMtsZpOSGPNyr/5pfKXct3YmIxoUE4cqoELy7uRor3JtEAvnI+HnKJF9
         BLPFtLZttIaAO3ZgrRvKjdqsHHP39Yxn5n2s6ZblI5BzNgZqRAihADq0QFvKg6YBs6Tu
         vz0keDSK5WFvQeLQiMzw7Xwg6sHLx+1XzT4TVONbKYkjckYQxT11xE+9oHZnCJtW2Npq
         7W8VFEc/xez/rk2LGsPk01QoHd8qauyL9Sbheplf/nxuOddvZFGjIxLSdii32T5jA0dI
         ffa1sNnCDW3E8iyMtZHEM9S+dYQi3IFueZVjgBOHaYnxrBppm75dn3qHw2esKEReQePn
         wK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=kvE7Ht553KRGIAvaHX5qBB87bcC7M5MR+v6uhs8tY1M=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=bHu7zd0iWOTBmR9+VWTgwUiSlbN66b+ek78pmsHWdEeh5h9QBrG68e4H4Orkybyh5D
         MGUAZEmOYnuJuqxyUdCoLAzlM19hk5sqa4KhPCLjRxternxLj8yL1pEIxJGDHlbALc0O
         T2MvXo69o24xVEj/+Iff8USB6Oh8XEehxiIrFxXjOtdh76HIC8jgul0oxYE/bN9GJk0t
         k+wqPGfBlgsDkudtCt18Bx6o0EYEHhoNNQhTDLa1LV9X3bZw/adpFLF9tUuGcwJxjIWP
         avnC08cTALBlwKJ3Q7zVFMozAFjrVsP2WTa6WcM2CPWtOX5RkI3zi8LDBgvoPZw2/pfr
         gQbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sEeRo6Rm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e0a16bsi197524385a.169.2025.02.06.14.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sEeRo6Rm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgA6y-0005vC-Bw; Thu, 06 Feb 2025 17:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xjOlZwgKCAc31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6m-0005hF-5I
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:29 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xjOlZwgKCAc31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6i-0001S9-Sd
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 17:12:27 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f9c34c0048so4058162a91.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 14:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879942; x=1739484742; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kvE7Ht553KRGIAvaHX5qBB87bcC7M5MR+v6uhs8tY1M=;
 b=sEeRo6RmhzJEzX2uz3hHksh8bAHcFVO9wHaLnSQ0TY0Urvmt7ha0Z035czu9LekgjC
 6Adzpoh5jadPgKB+udTje5t/YLLaEZnPg0D4fEjhcaa5JynXWd7cnQ5WdR57KZVAEoR7
 vL1ZV3fkXIl0F48GBmJrHkxVO8mM18VWEC6vrwpv3fW44jBOc1Ot4x6ct5b9LxRNJWSt
 fLUviikahaeVcdAjmJTETc1IpsVhNWtA4l2BOzXVK0X4Ot9WLdqaEd//RmIEzV0SuSRb
 l9euvHI6RBJg/KMbmLzT/pfH77wLF2Qa5B6HG/uhmDT60DOgepv88KDP72wtr8v1DURP
 go8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879942; x=1739484742;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvE7Ht553KRGIAvaHX5qBB87bcC7M5MR+v6uhs8tY1M=;
 b=K4dXVZTMXLF8Y4kwB6RMcHbQeei34pBwQC9D5+iEcu2hl2z3+pnDDl/lTVf4errIoU
 M3JZt5JVXol99iPCXu81Ekr8YShbGLQHjaFSozETaDT9FHDn7Q0dI/HE3MhUeqf2ApE9
 u8oAcE36lo0FL4m0YNlYVp7q4EtefoSjMh12aXxRetkukmxtsdNkgh3OSrFWEXlSmizx
 P4qiPdNR8xiciH7Bk0CB+PeTXQIC7tWKnsE8g2alHzJKs5AkOfA2X91hUlrvB4PfgeOl
 U0P0HjjLhe9TQSPO024LRwkHI9xtA7bkSgZxtLabxU4D6oQ8ite2KXGoS9PGxAmsaJb/
 Squw==
X-Gm-Message-State: AOJu0YzNXyovRN/yQRbM3oaktH9iqeWRlv5pHfYjU7LRG8d70WyB5+Tc
 912q7VtukdguPRIVD93ov/zmPnLxiifQeMfxw75sZwy1p/3WFtfUm5SUc0I2KT+ZXjlhVD8aDCR
 F1PgJhPkABQ==
X-Received: from pjur16.prod.google.com ([2002:a17:90a:d410:b0:2f2:e5c9:de99])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:194f:b0:2ee:59af:a432 with SMTP id
 98e67ed59e1d1-2fa2450985amr1053633a91.31.1738879942207; 
 Thu, 06 Feb 2025 14:12:22 -0800 (PST)
Date: Thu,  6 Feb 2025 14:11:55 -0800
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-10-wuhaotsh@google.com>
Subject: [PATCH v4 09/17] hw/misc: Support 8-bytes memop in NPCM GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3xjOlZwgKCAc31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rXU/G58lJtsy

The NPCM8xx GCR device can be accessed with 64-bit memory operations.
This patch supports that.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c   | 94 +++++++++++++++++++++++++++++++++-----------
 hw/misc/trace-events |  4 +-
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 7cdea2e392..d644d7ddd5 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -200,6 +200,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMGCRState *s = opaque;
     NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
+    uint64_t value;
 
     if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -208,9 +209,21 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     }
 
-    trace_npcm_gcr_read(offset, s->regs[reg]);
+    switch (size) {
+    case 4:
+        value = s->regs[reg];
+        break;
+
+    case 8:
+        value = deposit64(s->regs[reg], 32, 32, s->regs[reg + 1]);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
 
-    return s->regs[reg];
+    trace_npcm_gcr_read(offset, value);
+    return value;
 }
 
 static void npcm_gcr_write(void *opaque, hwaddr offset,
@@ -230,29 +243,65 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
         return;
     }
 
-    switch (reg) {
-    case NPCM7XX_GCR_PDID:
-    case NPCM7XX_GCR_PWRON:
-    case NPCM7XX_GCR_INTSR:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
-                      __func__, offset);
-        return;
-
-    case NPCM7XX_GCR_RESSR:
-    case NPCM7XX_GCR_CP2BST:
-        /* Write 1 to clear */
-        value = s->regs[reg] & ~value;
+    switch (size) {
+    case 4:
+        switch (reg) {
+        case NPCM7XX_GCR_PDID:
+        case NPCM7XX_GCR_PWRON:
+        case NPCM7XX_GCR_INTSR:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                          __func__, offset);
+            return;
+
+        case NPCM7XX_GCR_RESSR:
+        case NPCM7XX_GCR_CP2BST:
+            /* Write 1 to clear */
+            value = s->regs[reg] & ~value;
+            break;
+
+        case NPCM7XX_GCR_RLOCKR1:
+        case NPCM7XX_GCR_MDLR:
+            /* Write 1 to set */
+            value |= s->regs[reg];
+            break;
+        };
+        s->regs[reg] = value;
         break;
 
-    case NPCM7XX_GCR_RLOCKR1:
-    case NPCM7XX_GCR_MDLR:
-        /* Write 1 to set */
-        value |= s->regs[reg];
+    case 8:
+        s->regs[reg] = value;
+        s->regs[reg + 1] = extract64(v, 32, 32);
         break;
-    };
 
-    s->regs[reg] = value;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool npcm_gcr_check_mem_op(void *opaque, hwaddr offset,
+                                  unsigned size, bool is_write,
+                                  MemTxAttrs attrs)
+{
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(opaque);
+
+    if (offset >= c->nr_regs * sizeof(uint32_t)) {
+        return false;
+    }
+
+    switch (size) {
+    case 4:
+        return true;
+    case 8:
+        if (offset >= NPCM8XX_GCR_SCRPAD_00 * sizeof(uint32_t) &&
+            offset < (NPCM8XX_GCR_NR_REGS - 1) * sizeof(uint32_t)) {
+            return true;
+        } else {
+            return false;
+        }
+    default:
+        return false;
+    }
 }
 
 static const struct MemoryRegionOps npcm_gcr_ops = {
@@ -261,7 +310,8 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid      = {
         .min_access_size        = 4,
-        .max_access_size        = 4,
+        .max_access_size        = 8,
+        .accepts                = npcm_gcr_check_mem_op,
         .unaligned              = false,
     },
 };
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 0f7204a237..f25dbd6030 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -135,8 +135,8 @@ npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " valu
 npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
 # npcm_gcr.c
-npcm_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-npcm_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm_gcr_read(uint64_t offset, uint64_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
+npcm_gcr_write(uint64_t offset, uint64_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx64
 
 # npcm7xx_mft.c
 npcm7xx_mft_read(const char *name, uint64_t offset, uint16_t value) "%s: offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
-- 
2.48.1.502.g6dc24dfdaf-goog


Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732365qvl;
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
X-Received: by 2002:a05:600c:4e4e:: with SMTP id e14mr5331056wmq.98.1642875887999;
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875887; cv=none;
        d=google.com; s=arc-20160816;
        b=y+SpVSes5Ao3nME/1Hlm7CnpntZv0lubU4k3T84A9MvntnWV2KVqjlLcUHqHpYf2OP
         US82rnjc8imWKTWSAetO8e8Z3hq9sSzWzLIRLe2pXIjR4XIEr545fiGyRbq/0j0LynBL
         64iCXNsQQAbkXEcefis/kqq75t25sR2Y2Wyijrs6CJS+fIBhLreeCBZxj2K2oyeFXpDn
         erdMyLEVoDgACkpEJJuYd74jLV9ODUowQChDVYUGAFF/oXoMMPRuTEBIGmxY/Z4OmEM+
         /Oyg3SfDrMHcKf5pTstN0D3WSRh/M6M38LR+EsdD9pk/YkV4rKX7Vj0s+ZksCbvcy4fZ
         4Vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zh5iADESENSAPofEn1J+i6o1QEpzQBPyUBojzWQHFvY=;
        b=NkRqUgn9DnpVM87tj5CnpwHyrKLnWvs3niXfxs4/vw04eZOXlByd8Z4kMav/bWyv8u
         ELsAbjauxmbXbQcW62V21IjJCk/PkW8VUlfybZTuHPaYu9HAk8evr6mRpxT4VeW4Eksh
         y+WYxnDkHZaO8xH1Zn2XSwuAEmU+pTp70OLi3BgErnrlcU2wvsN+SdpHNwpGvr4MLDJ3
         kVmA/Xg1GyinvD8DwAL8zEVVkamYwyg3v7mrOpncWwX+bypQDc79sSaXhsFYMNlvqpIL
         VZibetouDq/0wGhiyhFBoBSJUumvGquYzw/2whqUTAdcEpUi6kb66RbH6KnjWkFsbjQT
         pw2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNFyUlsd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o9sor893766wry.73.2022.01.22.10.24.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNFyUlsd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zh5iADESENSAPofEn1J+i6o1QEpzQBPyUBojzWQHFvY=;
        b=BNFyUlsdZtICX3qNu/OFMR4H3TWGMjxBYjymkrm+M01/5kL5XdbSRJWn3k0mnmKZNP
         oswBqIBc7l7kyjoZEtBq+hIuoYhC5rjSCMWcZ1nMKLpFpnL5cbKz32NW8sxoWjg8DGZI
         zwiuENM5JRzp2h1xmQAIf4il7n6wmeiGEWQj5KLdeAy5AUpFcz/nCpbtp2M6mPRqoBdO
         qPvhtx0QakcWYrI8DLtjq0U0v6DLhSytfJ+rZFGMpaPlPNc6XuAMYloppDOK39pw5K39
         geswZUZmypqiUOW+Twn8zJ1+KgK72ishXAeolOAvgyK30YY3764fLw2GCg7s8UG5xmp1
         4Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zh5iADESENSAPofEn1J+i6o1QEpzQBPyUBojzWQHFvY=;
        b=39zW6FBFeixq7NGS3wwhayPYktdJLlc6/cqA7mpPvOgmBrMNVUAl+icaqa3TwjeiA8
         SHK59JpFl2oi4Wv0RAuOLnXddq7bsj/DberlTQxlgYXzIsrKH+6FTHdpYK/izykJO8Lm
         8HjfYJNNwjhbCcFOdkDGn5f8iZCJpZhdQALOTx4i19Mc/J4gjos5ekuF/eVYkV1gyMY4
         zeXiREuuQgfowkPDmwF9CnzCgbTaDQ+mMH231fKTnCpS8qiC7O2f+sCU3XjvJrWgzZHw
         Y3NBIVFIHzwnS696fB/fcqhHGyQziKHLXz6Qbo/hOVvhQ+i9n7nZSm1O7yur7INmReZ0
         R67A==
X-Gm-Message-State: AOAM5334SVKpyeJM+KK4l2spvS4OVyPbfpiuyEEljoknj7pjoiv5n4It
	ysaW6AiPzWGNSSGrMqe6j9luqiBdlCPkzjlT
X-Google-Smtp-Source: ABdhPJw5Wa4eX6hnmBccyiVU+CbnB1Nx/DnUEijXJaMwQDewdt0cuymOeYburhnV1+/AMINqyd9ftQ==
X-Received: by 2002:adf:fa8d:: with SMTP id h13mr8309558wrr.154.1642875887701;
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 02/14] hw/intc/arm_gicv3_its: Add tracepoints
Date: Sat, 22 Jan 2022 18:24:32 +0000
Message-Id: <20220122182444.724087-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wOMM9tlf22iT

The ITS currently has no tracepoints; add a minimal set
that allows basic monitoring of guest register accesses and
reading of commands from the command queue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 11 +++++++++++
 hw/intc/trace-events    |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b2f6a8c7f00..6d2549e64b1 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "trace.h"
 #include "hw/qdev-properties.h"
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "gicv3_internal.h"
@@ -634,6 +635,8 @@ static void process_cmdq(GICv3ITSState *s)
 
         cmd = (data & CMD_MASK);
 
+        trace_gicv3_its_process_command(rd_offset, cmd);
+
         switch (cmd) {
         case GITS_CMD_INT:
             result = process_its_cmd(s, data, cq_offset, INTERRUPT);
@@ -818,6 +821,8 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
     bool result = true;
     uint32_t devid = 0;
 
+    trace_gicv3_its_translation_write(offset, data, size, attrs.requester_id);
+
     switch (offset) {
     case GITS_TRANSLATER:
         if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
@@ -1107,6 +1112,7 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
+        trace_gicv3_its_badread(offset, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
          * so use false returns from leaf functions as a way to
@@ -1114,6 +1120,8 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
          * the caller, or we'll cause a spurious guest data abort.
          */
         *data = 0;
+    } else {
+        trace_gicv3_its_read(offset, *data, size);
     }
     return MEMTX_OK;
 }
@@ -1140,12 +1148,15 @@ static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
+        trace_gicv3_its_badwrite(offset, data, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
          * so use false returns from leaf functions as a way to
          * trigger the guest-error logging but don't return it to
          * the caller, or we'll cause a spurious guest data abort.
          */
+    } else {
+        trace_gicv3_its_write(offset, data, size);
     }
     return MEMTX_OK;
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 9aba7e3a7a4..b28cda4e08e 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -169,6 +169,14 @@ gicv3_redist_badwrite(uint32_t cpu, uint64_t offset, uint64_t data, unsigned siz
 gicv3_redist_set_irq(uint32_t cpu, int irq, int level) "GICv3 redistributor 0x%x interrupt %d level changed to %d"
 gicv3_redist_send_sgi(uint32_t cpu, int irq) "GICv3 redistributor 0x%x pending SGI %d"
 
+# arm_gicv3_its.c
+gicv3_its_read(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+gicv3_its_badread(uint64_t offset, unsigned size) "GICv3 ITS read: offset 0x%" PRIx64 " size %u: error"
+gicv3_its_write(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+gicv3_its_badwrite(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u: error"
+gicv3_its_translation_write(uint64_t offset, uint64_t data, unsigned size, uint32_t requester_id) "GICv3 ITS TRANSLATER write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u requester_id 0x%x"
+gicv3_its_process_command(uint32_t rd_offset, uint8_t cmd) "GICv3 ITS: processing command at offset 0x%x: 0x%x"
+
 # armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
 nvic_recompute_state_secure(int vectpending, bool vectpending_is_s_banked, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d is_s_banked %d vectpending_prio %d exception_prio %d"
-- 
2.25.1

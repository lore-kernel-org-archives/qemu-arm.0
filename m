Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311439wme;
        Mon, 21 May 2018 07:04:19 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrgKkBzRuvZccLM59jUI00D+d4bn+XvMoVnECPSAW665LPR27FlKjLY/72XPzWddDBusxoq
X-Received: by 2002:a1c:3313:: with SMTP id z19-v6mr10380180wmz.48.1526911459117;
        Mon, 21 May 2018 07:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911459; cv=none;
        d=google.com; s=arc-20160816;
        b=Q0UP81P3ZF/COxMlzoLz1elwifLUhEi/jHre+6XdwkOYYplh6gsgvAoXIvKOx9MbF5
         1hCTgsohPc6nkVIf1GJF6qAQF6h2R39BMmO70Ej79fXfAQhcOwt3vmSPBJNhuBeSys6t
         zLH9MoFthMpyGxrW6rjTdqCnnUiHH4CBHF5tWL12UwqPqFzmBdH7l02BhxA6SDU+gT+z
         uR7dW5Iow+Np+YG2b9WBD452rkp10AEU4WSzlXGWuLPqXwUOQoDyHHOJ917iLwiHtKj8
         CQFJKhS2Wzmc7VSTv9d32ILDsLaaEtgY+5lymfwqIerMHspGwrAjRptfU/pYICOJMqW+
         +W7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=jX15A+8EFHCTxlwZV+aCHxY5QtHJmKsLLJMmkgjkyx4=;
        b=HdXAVA3WV2cAH2rxcSS8Z2pb60B87g9KSY74eYMPe3RjJ6P7u+uFPKNBhKI42WP8ng
         ztWGS2VQh2hazz1LCjjrJEIydcXEH3Xpbev0OPVKn1ts1M71YQ+RiH96RkXlQPEugOYz
         Alp0cD/YYtiykbEHTuR8HAWW887q1lG6spGMDEuPOdK22z/f6EKzWqL8nOg2/cfqwUDL
         Y8lH4Dtm7FZgazubUaqmcun0m2tQPY5A/J4Rv+BpbUFZIsN3chCSwu/sgXTrWPpfDWIU
         Am1/dEQdIAUIADIwOKdxjGXLcXYB8eHkqH1sfVQ4FOzUfu2GcDa0Phr+bUPUq606GfjN
         nZZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 35-v6si12181312wrn.274.2018.05.21.07.04.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ9-0007lh-7d; Mon, 21 May 2018 15:04:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 19/27] hw/misc/tz-mpc.c: Implement registers
Date: Mon, 21 May 2018 15:03:54 +0100
Message-Id: <20180521140402.23318-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: MsgEocYCNcaa

Implement the missing registers for the TZ MPC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/tz-mpc.h |  10 +++
 hw/misc/tz-mpc.c         | 137 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/tz-mpc.h b/include/hw/misc/tz-mpc.h
index b5eaf1699e..1fff4d6029 100644
--- a/include/hw/misc/tz-mpc.h
+++ b/include/hw/misc/tz-mpc.h
@@ -48,6 +48,16 @@ struct TZMPC {
 
     /*< public >*/
 
+    /* State */
+    uint32_t ctrl;
+    uint32_t blk_idx;
+    uint32_t int_stat;
+    uint32_t int_en;
+    uint32_t int_info1;
+    uint32_t int_info2;
+
+    uint32_t *blk_lut;
+
     qemu_irq irq;
 
     /* Properties */
diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index d4467ccc3b..93453cbef2 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -28,16 +28,23 @@ enum {
 
 /* Config registers */
 REG32(CTRL, 0x00)
+    FIELD(CTRL, SEC_RESP, 4, 1)
+    FIELD(CTRL, AUTOINC, 8, 1)
+    FIELD(CTRL, LOCKDOWN, 31, 1)
 REG32(BLK_MAX, 0x10)
 REG32(BLK_CFG, 0x14)
 REG32(BLK_IDX, 0x18)
 REG32(BLK_LUT, 0x1c)
 REG32(INT_STAT, 0x20)
+    FIELD(INT_STAT, IRQ, 0, 1)
 REG32(INT_CLEAR, 0x24)
+    FIELD(INT_CLEAR, IRQ, 0, 1)
 REG32(INT_EN, 0x28)
+    FIELD(INT_EN, IRQ, 0, 1)
 REG32(INT_INFO1, 0x2c)
 REG32(INT_INFO2, 0x30)
 REG32(INT_SET, 0x34)
+    FIELD(INT_SET, IRQ, 0, 1)
 REG32(PIDR4, 0xfd0)
 REG32(PIDR5, 0xfd4)
 REG32(PIDR6, 0xfd8)
@@ -57,14 +64,55 @@ static const uint8_t tz_mpc_idregs[] = {
     0x0d, 0xf0, 0x05, 0xb1,
 };
 
+static void tz_mpc_irq_update(TZMPC *s)
+{
+    qemu_set_irq(s->irq, s->int_stat && s->int_en);
+}
+
 static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
                                    uint64_t *pdata,
                                    unsigned size, MemTxAttrs attrs)
 {
+    TZMPC *s = TZ_MPC(opaque);
     uint64_t r;
     uint32_t offset = addr & ~0x3;
 
     switch (offset) {
+    case A_CTRL:
+        r = s->ctrl;
+        break;
+    case A_BLK_MAX:
+        r = s->blk_max;
+        break;
+    case A_BLK_CFG:
+        /* We are never in "init in progress state", so this just indicates
+         * the block size. s->blocksize == (1 << BLK_CFG + 5), so
+         * BLK_CFG == ctz32(s->blocksize) - 5
+         */
+        r = ctz32(s->blocksize) - 5;
+        break;
+    case A_BLK_IDX:
+        r = s->blk_idx;
+        break;
+    case A_BLK_LUT:
+        r = s->blk_lut[s->blk_idx];
+        if (size == 4) {
+            s->blk_idx++;
+            s->blk_idx %= s->blk_max;
+        }
+        break;
+    case A_INT_STAT:
+        r = s->int_stat;
+        break;
+    case A_INT_EN:
+        r = s->int_en;
+        break;
+    case A_INT_INFO1:
+        r = s->int_info1;
+        break;
+    case A_INT_INFO2:
+        r = s->int_info2;
+        break;
     case A_PIDR4:
     case A_PIDR5:
     case A_PIDR6:
@@ -110,6 +158,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
                                     uint64_t value,
                                     unsigned size, MemTxAttrs attrs)
 {
+    TZMPC *s = TZ_MPC(opaque);
     uint32_t offset = addr & ~0x3;
 
     trace_tz_mpc_reg_write(addr, value, size);
@@ -122,9 +171,15 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
         uint32_t oldval;
 
         switch (offset) {
-            /* As we add support for registers which need expansions
-             * other than zeroes we'll fill in cases here.
-             */
+        case A_CTRL:
+            oldval = s->ctrl;
+            break;
+        case A_BLK_IDX:
+            oldval = s->blk_idx;
+            break;
+        case A_BLK_LUT:
+            oldval = s->blk_lut[s->blk_idx];
+            break;
         default:
             oldval = 0;
             break;
@@ -132,7 +187,51 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
         value = deposit32(oldval, (addr & 3) * 8, size * 8, value);
     }
 
+    if ((s->ctrl & R_CTRL_LOCKDOWN_MASK) &&
+        (offset == A_CTRL || offset == A_BLK_LUT || offset == A_INT_EN)) {
+        /* Lockdown mode makes these three registers read-only, and
+         * the only way out of it is to reset the device.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "TZ MPC register write to offset 0x%x "
+                      "while MPC is in lockdown mode\n", offset);
+        return MEMTX_OK;
+    }
+
     switch (offset) {
+    case A_CTRL:
+        /* We don't implement the 'data gating' feature so all other bits
+         * are reserved and we make them RAZ/WI.
+         */
+        s->ctrl = value & (R_CTRL_SEC_RESP_MASK |
+                           R_CTRL_AUTOINC_MASK |
+                           R_CTRL_LOCKDOWN_MASK);
+        break;
+    case A_BLK_IDX:
+        s->blk_idx = value % s->blk_max;
+        break;
+    case A_BLK_LUT:
+        s->blk_lut[s->blk_idx] = value;
+        if (size == 4) {
+            s->blk_idx++;
+            s->blk_idx %= s->blk_max;
+        }
+        break;
+    case A_INT_CLEAR:
+        if (value & R_INT_CLEAR_IRQ_MASK) {
+            s->int_stat = 0;
+            tz_mpc_irq_update(s);
+        }
+        break;
+    case A_INT_EN:
+        s->int_en = value & R_INT_EN_IRQ_MASK;
+        tz_mpc_irq_update(s);
+        break;
+    case A_INT_SET:
+        if (value & R_INT_SET_IRQ_MASK) {
+            s->int_stat = R_INT_STAT_IRQ_MASK;
+            tz_mpc_irq_update(s);
+        }
+        break;
     case A_PIDR4:
     case A_PIDR5:
     case A_PIDR6:
@@ -248,6 +347,16 @@ static int tz_mpc_num_indexes(IOMMUMemoryRegion *iommu)
 
 static void tz_mpc_reset(DeviceState *dev)
 {
+    TZMPC *s = TZ_MPC(dev);
+
+    s->ctrl = 0;
+    s->blk_idx = 0;
+    s->int_stat = 0;
+    s->int_en = 0;
+    s->int_info1 = 0;
+    s->int_info2 = 0;
+
+    memset(s->blk_lut, 0, s->blk_max * sizeof(uint32_t));
 }
 
 static void tz_mpc_init(Object *obj)
@@ -321,13 +430,35 @@ static void tz_mpc_realize(DeviceState *dev, Error **errp)
                        "tz-mpc-downstream");
     address_space_init(&s->blocked_io_as, &s->blocked_io,
                        "tz-mpc-blocked-io");
+
+    s->blk_lut = g_new(uint32_t, s->blk_max);
+}
+
+static int tz_mpc_post_load(void *opaque, int version_id)
+{
+    TZMPC *s = TZ_MPC(opaque);
+
+    /* Check the incoming data doesn't point blk_idx off the end of blk_lut. */
+    if (s->blk_idx >= s->blk_max) {
+        return -1;
+    }
+    return 0;
 }
 
 static const VMStateDescription tz_mpc_vmstate = {
     .name = "tz-mpc",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = tz_mpc_post_load,
     .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctrl, TZMPC),
+        VMSTATE_UINT32(blk_idx, TZMPC),
+        VMSTATE_UINT32(int_stat, TZMPC),
+        VMSTATE_UINT32(int_en, TZMPC),
+        VMSTATE_UINT32(int_info1, TZMPC),
+        VMSTATE_UINT32(int_info2, TZMPC),
+        VMSTATE_VARRAY_UINT32(blk_lut, TZMPC, blk_max,
+                              0, vmstate_info_uint32, uint32_t),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.17.0

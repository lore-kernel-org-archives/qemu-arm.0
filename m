Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp761782wrq;
        Wed, 20 Jun 2018 06:20:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLMNXawnIlhaaPw/L75AGOicuaEXSwYtZjW001esy8YRmMJ86gY3TGYS+7h9h2NIYO9KnRo
X-Received: by 2002:a1c:ec47:: with SMTP id k68-v6mr1780017wmh.109.1529500836478;
        Wed, 20 Jun 2018 06:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500836; cv=none;
        d=google.com; s=arc-20160816;
        b=TvGuMqr28vdRPkEG7CixmsL01Q2VizIShJfTDAetYrDXHEcKVEyGL+iEvNq4Xil4Rh
         cpSglTKPD+QDCiHrwaZcLTACx/eKV/f3dwfHD34JawfBttrpGMrB+VbzQODV/nlWdJX2
         gdVaCc4sENjIWrllrfsKFa3RfFK3UXV9/K/A8OOogX3AfVj4NkDMffbbZiyfsMhgMDkP
         gS8k0ZAFPb+MVpMOvtH44ZrA0iTYDdPLhadikM7TyTEm7ropz3PlPfUcbZsuFZdE5PjU
         UbVk5xwTLC+qU/iytsg8QwjixF+sB1l1FGVtv4+v7hX/kjVLu/huVPHvc6Sc/4le0Fgw
         UnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=TaREnZsPBAhfshZjB2OlVRTEFP1Xhwbc6pS+JxPaRWo=;
        b=o2q8XjmbjKmMzO8lpaVRSGbkemUpfq0etncXf3rrTG8VHbJBUcsZ+iHpHAZ0pQioHU
         F2ZxkGPGr4wah5AiLVe5BCTUM/pdTHoE/YV4G1cGXwpJyxpDHmhe9hMT4KK3oO6ZqkRg
         YsU1OkJkB2QOC6N7fFDfM+mm4ZX9Gvu7lVjMmY6f08zHT12Tj9CrAD5PCCV4amNeUSke
         3ejjB26fPMl2aoAhJ2AMY/aavCVCvXTVX3TOpH8Wj73X8uGS3BHlOJnD7kOAQt9q0cdz
         FRWjb0j6MOiwzZ7BiePIw0xKxJJUnHOlth4Bbz0Yof3Beeh2sw0LmDTUPrlQWZkQ0O+x
         xjQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id x2-v6si2273989wrr.281.2018.06.20.06.20.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 06:20:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVd2J-0001Yw-Vg; Wed, 20 Jun 2018 14:20:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 2/8] hw/misc/tz-mpc.c: Implement registers
Date: Wed, 20 Jun 2018 14:20:26 +0100
Message-Id: <20180620132032.28865-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
X-TUID: dofERHU7tfty

Implement the missing registers for the TZ MPC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/tz-mpc.h |  10 +++
 hw/misc/tz-mpc.c         | 142 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 148 insertions(+), 4 deletions(-)

diff --git a/include/hw/misc/tz-mpc.h b/include/hw/misc/tz-mpc.h
index d1a65fd9a38..6f15945410d 100644
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
index 569bccfda7a..e5b91bf81a3 100644
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
@@ -57,10 +64,25 @@ static const uint8_t tz_mpc_idregs[] = {
     0x0d, 0xf0, 0x05, 0xb1,
 };
 
+static void tz_mpc_irq_update(TZMPC *s)
+{
+    qemu_set_irq(s->irq, s->int_stat && s->int_en);
+}
+
+static void tz_mpc_autoinc_idx(TZMPC *s, unsigned access_size)
+{
+    /* Auto-increment BLK_IDX if necessary */
+    if (access_size == 4 && (s->ctrl & R_CTRL_AUTOINC_MASK)) {
+        s->blk_idx++;
+        s->blk_idx %= s->blk_max;
+    }
+}
+
 static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
                                    uint64_t *pdata,
                                    unsigned size, MemTxAttrs attrs)
 {
+    TZMPC *s = TZ_MPC(opaque);
     uint64_t r;
     uint32_t offset = addr & ~0x3;
 
@@ -74,6 +96,38 @@ static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
     }
 
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
+        tz_mpc_autoinc_idx(s, size);
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
@@ -120,6 +174,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
                                     uint64_t value,
                                     unsigned size, MemTxAttrs attrs)
 {
+    TZMPC *s = TZ_MPC(opaque);
     uint32_t offset = addr & ~0x3;
 
     trace_tz_mpc_reg_write(addr, value, size);
@@ -127,7 +182,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
     if (!attrs.secure && offset < A_PIDR4) {
         /* NS accesses can only see the ID registers */
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "TZ MPC register read: NS access to offset 0x%x\n",
+                      "TZ MPC register write: NS access to offset 0x%x\n",
                       offset);
         return MEMTX_OK;
     }
@@ -140,9 +195,15 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
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
@@ -150,7 +211,48 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
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
+        tz_mpc_autoinc_idx(s, size);
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
@@ -266,6 +368,16 @@ static int tz_mpc_num_indexes(IOMMUMemoryRegion *iommu)
 
 static void tz_mpc_reset(DeviceState *dev)
 {
+    TZMPC *s = TZ_MPC(dev);
+
+    s->ctrl = 0x00000100;
+    s->blk_idx = 0;
+    s->int_stat = 0;
+    s->int_en = 1;
+    s->int_info1 = 0;
+    s->int_info2 = 0;
+
+    memset(s->blk_lut, 0, s->blk_max * sizeof(uint32_t));
 }
 
 static void tz_mpc_init(Object *obj)
@@ -339,13 +451,35 @@ static void tz_mpc_realize(DeviceState *dev, Error **errp)
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
2.17.1

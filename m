Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp761804wrq;
        Wed, 20 Jun 2018 06:20:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLmSHw7dwnl+G6hPu471PAUUVrcLH/TTFv36LVBcqur7f/pwKpoAbF1XuzocuRge9PbxmiD
X-Received: by 2002:a1c:cfc2:: with SMTP id f185-v6mr1714692wmg.101.1529500837380;
        Wed, 20 Jun 2018 06:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500837; cv=none;
        d=google.com; s=arc-20160816;
        b=qzQ/SFq/DAvLCabbifVQnG3L9eH70FvR4ym8W0X3o4gQRP7O1EC9B8pn8vUFiCJ360
         0HYrNgfxQvDyMHwNSgJ/nnMNscK6taNWhCDHAb0zIvLFDfqwNEzBU2WwcvXSRfY05vwG
         hJr62CuyixN+rx6BxDP+4H/aYogshsOIkbQvto9Uq4rKj5qoMoBAG7Z4KXF/k9Xm1i9u
         83nU4kLmN+YqXK/ORvAJxdM2KrdSuhfTYvbgUJym4QxXF2xp8mi9VPv3XeatgTzL28X+
         m2PFCfpEho+x69mw9WkIRNdMpyoNrW7xdK4wrQKKb61JP9X4sUYbA8t5EbJYNZaGKcl+
         dPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=wKYAO+hdtl/mLa70+yordnQuFmw1WNTSP4ELq+07L8I=;
        b=wlUEnZK73Syc+ptNdUw6K9AIdrSk5fpDUT6bsjT5pK4fEkKxrVHRsHtVRgTLPXu7Fu
         UqWgykSqHvyRtuXifnMJlRdnHsg7GLgzfciOc3mTlCIVSe0JTnnzha+gSnc9b6d8jGvA
         JglF4EEpOevpOr2tGWnlqHXZKPaQKHbgF4VffLKZCqG/ItAhsrbX7uGeXfe2y7ldmp3d
         gLfurARS0SUEdScxt35L48ViXAbT8dzZOw5953hiJpYBjM/1CdMxixe7X+fLONPkYn2D
         /PQiGOIG36lgeDzgVGYDXDq+yFees/xGE030HMxl0e8h8uUEhKpklpcNGFUN5ZX61M28
         c+rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id w201-v6si2293393wmw.64.2018.06.20.06.20.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 06:20:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVd2K-0001Zk-TT; Wed, 20 Jun 2018 14:20:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 3/8] hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
Date: Wed, 20 Jun 2018 14:20:27 +0100
Message-Id: <20180620132032.28865-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
X-TUID: kVs/3kbV4RZZ

The MPC is guest-configurable for whether blocked accesses:
 * should be RAZ/WI or cause a bus error
 * should generate an interrupt or not

Implement this behaviour in the blocked-access handlers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/misc/tz-mpc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index e5b91bf81a3..fded5922a21 100644
--- a/hw/misc/tz-mpc.c
+++ b/hw/misc/tz-mpc.c
@@ -43,6 +43,9 @@ REG32(INT_EN, 0x28)
     FIELD(INT_EN, IRQ, 0, 1)
 REG32(INT_INFO1, 0x2c)
 REG32(INT_INFO2, 0x30)
+    FIELD(INT_INFO2, HMASTER, 0, 16)
+    FIELD(INT_INFO2, HNONSEC, 16, 1)
+    FIELD(INT_INFO2, CFG_NS, 17, 1)
 REG32(INT_SET, 0x34)
     FIELD(INT_SET, IRQ, 0, 1)
 REG32(PIDR4, 0xfd0)
@@ -287,6 +290,45 @@ static const MemoryRegionOps tz_mpc_reg_ops = {
     .impl.max_access_size = 4,
 };
 
+static inline bool tz_mpc_cfg_ns(TZMPC *s, hwaddr addr)
+{
+    /* Return the cfg_ns bit from the LUT for the specified address */
+    hwaddr blknum = addr / s->blocksize;
+    hwaddr blkword = blknum / 32;
+    uint32_t blkbit = 1U << (blknum % 32);
+
+    /* This would imply the address was larger than the size we
+     * defined this memory region to be, so it can't happen.
+     */
+    assert(blkword < s->blk_max);
+    return s->blk_lut[blkword] & blkbit;
+}
+
+static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs attrs)
+{
+    /* Handle a blocked transaction: raise IRQ, capture info, etc */
+    if (!s->int_stat) {
+        /* First blocked transfer: capture information into INT_INFO1 and
+         * INT_INFO2. Subsequent transfers are still blocked but don't
+         * capture information until the guest clears the interrupt.
+         */
+
+        s->int_info1 = addr;
+        s->int_info2 = 0;
+        s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
+                                  attrs.requester_id & 0xffff);
+        s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
+                                  ~attrs.secure);
+        s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
+                                  tz_mpc_cfg_ns(s, addr));
+        s->int_stat |= R_INT_STAT_IRQ_MASK;
+        tz_mpc_irq_update(s);
+    }
+
+    /* Generate bus error if desired; otherwise RAZ/WI */
+    return (s->ctrl & R_CTRL_SEC_RESP_MASK) ? MEMTX_ERROR : MEMTX_OK;
+}
+
 /* Accesses only reach these read and write functions if the MPC is
  * blocking them; non-blocked accesses go directly to the downstream
  * memory region without passing through this code.
@@ -295,19 +337,23 @@ static MemTxResult tz_mpc_mem_blocked_read(void *opaque, hwaddr addr,
                                            uint64_t *pdata,
                                            unsigned size, MemTxAttrs attrs)
 {
+    TZMPC *s = TZ_MPC(opaque);
+
     trace_tz_mpc_mem_blocked_read(addr, size, attrs.secure);
 
     *pdata = 0;
-    return MEMTX_OK;
+    return tz_mpc_handle_block(s, addr, attrs);
 }
 
 static MemTxResult tz_mpc_mem_blocked_write(void *opaque, hwaddr addr,
                                             uint64_t value,
                                             unsigned size, MemTxAttrs attrs)
 {
+    TZMPC *s = TZ_MPC(opaque);
+
     trace_tz_mpc_mem_blocked_write(addr, value, size, attrs.secure);
 
-    return MEMTX_OK;
+    return tz_mpc_handle_block(s, addr, attrs);
 }
 
 static const MemoryRegionOps tz_mpc_mem_blocked_ops = {
-- 
2.17.1

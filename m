Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311421wme;
        Mon, 21 May 2018 07:04:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp56sesPWBwOtImfLbj76mH/Jo7eeMV+Tuigo91gU7YooxbM+ReYM2Bh4wcoe6+cyAxOmw8
X-Received: by 2002:adf:e843:: with SMTP id d3-v6mr16865785wrn.146.1526911458489;
        Mon, 21 May 2018 07:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911458; cv=none;
        d=google.com; s=arc-20160816;
        b=hvRxCqi1v5AI1dupCTaoRiXclQHj58sjk58AhFJ/jmPMiVbkhZhPP//QOax8cqTWkr
         aplgrY5GRWYQ6SaDdRH4QXNxDB7rKfChnbxtYnKR+rVNgdMCtuCQE8hkEQc+T68VpA/U
         miwW2AGGvckfP46rb1jF0LgyCTKBQyOlf0/wjmgXIAHj0LXTakkCOF6URgcwmjS7bKif
         KJvcsWgssSMD02ErivuhQYOkg5CnSWiEO8jctMFFbhnhwBQm/zT4R74gHfRDhFqbdzGj
         lVhEU+Z9yp0Wve6S7sdGyvX75ce12DgsvmUKWWw69kxtbVh3OL7L6ntYDhGdDHhNAMxL
         pW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=WzHFQ3yY9KwiAzZVvfq5ZNmY56d35ZaQGbp+rk1l9BY=;
        b=glReYTmtB81ciJitt6NtDd0+wH90VDbu/2y21JpswqYjghXIqZCd3T1EGIpV/Zfx0B
         ELBbJy8hDtqFr5Fw0pXJMHrb/Klh+kARQyjrQZG0oBbkpS9DvSFg2b3ghxpVxhgPqBVh
         vhMXiLx/e/D7/EHGlCU9x0btGl5E9K3dgmLrWBOkTQ57Fe8b8QmdrK4Pd39/rSi66uAg
         U88dEdzQKz95J16G7z4Zi4hJ2DD9PXbJnoiG0U6DHI5ZHxXygyI9ekECHo3eUJKkTcm+
         KjcwZI1S9jfrBEnHo0zVxr8yX+7mMwDbtqgyORYR6JvbJd3q2cqoVl4A1i3m5LWguF+d
         9FTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 42-v6si13501624wrt.26.2018.05.21.07.04.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ9-0007m7-TQ; Mon, 21 May 2018 15:04:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 20/27] hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
Date: Mon, 21 May 2018 15:03:55 +0100
Message-Id: <20180521140402.23318-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: /Z28c6j/wroc

The MPC is guest-configurable for whether blocked accesses:
 * should be RAZ/WI or cause a bus error
 * should generate an interrupt or not

Implement this behaviour in the blocked-access handlers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tz-mpc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 93453cbef2..39a72563b7 100644
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
@@ -266,6 +269,45 @@ static const MemoryRegionOps tz_mpc_reg_ops = {
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
@@ -274,19 +316,23 @@ static MemTxResult tz_mpc_mem_blocked_read(void *opaque, hwaddr addr,
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
2.17.0

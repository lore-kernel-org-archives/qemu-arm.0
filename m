Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743542wrq;
        Mon, 4 Jun 2018 08:29:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLzzQYunBaMzwetPonZiKVm44N79TYHDZVarCq9gNaDc1M755j4in0HPPVQ9XZKWvQAvLE0
X-Received: by 2002:a1c:3c3:: with SMTP id 186-v6mr10290354wmd.140.1528126188489;
        Mon, 04 Jun 2018 08:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126188; cv=none;
        d=google.com; s=arc-20160816;
        b=Qg8dN6TdEiggXG1txMjCobMkkCZ+uM68iVOKyq1hTOqdeodU9MZzwV9MT1bqfU2ySP
         nt8oDXEmz8olhfWQ6RDC1HBOJLn9JO/bnSiDGd+BaQRMjeDOi5pfmowqrGwrNZMMJoEJ
         F+NTWY3jb+BJXtdJKLDA1kRfVN/RB7p+aHvf7piQUNGXdCCRD7EK5RBHuEoztdN8+99F
         t/KKJx/ruVfZATNIRzXGgTrHX34k6L9QSHsMKHwmgLaObrRuuKHOxLbr7G/FeqOk5PHQ
         YpsxePTCfkE9hdwFJgHh/vvbOW3nUDhD594z5M7uEcqMdY5DAfoOFefL/Ay5+zRdBGX9
         QIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=SBmC+CIDQ9cicWS+jc0Sv1kadBKNrr5ghsVG+Qhs6DM=;
        b=OtIhBWtt+gBX+0wthiFFO+DfORq4kqGYkh3iELwxvBVRNoD8ivBNqD+eTImjoT6m/Q
         xaKUAJSLpYTjjSuV8YAFzDOBEQetGmV/53Q0Wk6hXrKlm7L3uXT/LMBJx+dfuE41/7UH
         +DS7zMXNzxR7WNfh74ZkeZVyz4D4MyitAPzZLSvCyU1qBH5sNya/eSxS+ZbGPCohgYeR
         f/DfRnEbwq2zsSnqiD8VZaMwPkNUTmzT0ToUeXkpZQl2X7DNcJfuvFYK5vjINQCStDvg
         b5qYb8lAyS6Y7KCn1M6y9YbnjdvP/n9nSeJliQqTxum7QW2tA9yXibXOTY/33vTN03HA
         lknA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p109-v6si25071722wrc.248.2018.06.04.08.29.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:48 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQZ-00073M-VT; Mon, 04 Jun 2018 16:29:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 07/13] hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
Date: Mon,  4 Jun 2018 16:29:35 +0100
Message-Id: <20180604152941.20374-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
X-TUID: Rf9nbWSQyHGx

The MPC is guest-configurable for whether blocked accesses:
 * should be RAZ/WI or cause a bus error
 * should generate an interrupt or not

Implement this behaviour in the blocked-access handlers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tz-mpc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
index 9db55e23daf..704bb3fb44d 100644
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
2.17.1

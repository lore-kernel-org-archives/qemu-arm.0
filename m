Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6A1D58B08
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 03:42:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1cMF-0004pn-JR; Sat, 14 Mar 2026 23:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cME-0004pI-Mt
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:41:38 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMC-0003aF-QV
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:41:38 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-2c0bb213b16so338117eec.0
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773546095; x=1774150895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YiOMf28ORrB2Me6DhKc96H6bxpOo6A6fc0FUbQxuhYQ=;
 b=K1ski8BufnwHXxX1l2jrDQhu3SAz88+ClpN/zhcU5ijOILMD53wgYxl6cQ2U0xfQ37
 9iPKY1eRhxj98nDHtMICkOI+0alruuBUY1rfjQWDxq2QLkIcvMmAamgL5HvsU2nLKDcU
 VR9fnbnuGvZn0YXV9v0qLlWORRefhFv14gYng7XAu6CtneZvVK3ABqQ3m+M8rN8BuZpR
 EauITPr2+pFzHNB0swkiekeNerY14ek0KpG4gVPh963iaQ5n+q92Ggmpdx0eCUa2RmbH
 vCjmX8+JfgPBbOteAzG12PpSx2E+/bPErQvB6OoI3C5AX4Yu3VpWyTEbqGGYhnTElUOQ
 SHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773546095; x=1774150895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YiOMf28ORrB2Me6DhKc96H6bxpOo6A6fc0FUbQxuhYQ=;
 b=m5b/j+YtmOkl0+E/jW2NJRfMadHy0zRHLhctQwmfOS1zPRtL3YDoRfmEY/KOFmHPCA
 RXF45wOf0n7peCu/osICcO/PIwIj5wtNPhF7EBpcAXhE3RSGDGzTveq+9O2MxT7AXn5P
 xnj3dD966//HWfCGkrlfGlItRrq1dB/osTUPt6vElcKm9cmk9xR35ifQ+ja6hvoxUQlt
 EIF1eGkcw7ZBXK+/ng37tObYY4N4bY/QX2HzYxJIR+EkhrSarJPv66QEbqUpWKvZEjqz
 jU6RmTh4XPCdWgIL8aVzgiKkhAgjMZdU6XrjGCf2+g7+o3E1t511odwpqT7ZUFBt+uHC
 gh1g==
X-Gm-Message-State: AOJu0YyYkmKgQVTdjq2M5ZQvcNWrXH/bSzxiIASiYNyrvINpuBub/XMg
 Er7Lyg9IG/4BHIuDpI1/UKwIdh8ZtD5ABce6jocjrdriKoV18ZDweQixP4nB1kF+
X-Gm-Gg: ATEYQzwLeOOmu4haUUIGEKTVarcRZhQHq3RnEYk9W32hc3ROJkNR0ER7SJoPWCvNtO9
 JXdbdOvp3jzE3HKto2HxLvVfHm6F0MDorlwQWbwUgMDuVHn3EdNqTOhdGOq8b5ab5ULcd8IGOdi
 F/46pFlQMtw9huy/Ynvpi40KkM6zBbx8UrE5/nNwWJfbToI1Ey9xyTDrI0W9b4fV9SN5r9aV1iA
 OCPjP6YvJ6jLKCm6IMcQayFPZnJp5Ctc21PylMhb8a8x6LG8GYWUcKDbCg0rDRTOsOxdwlHKKXt
 J4h8/Pyi2QVteDJtaOGAog3cBfYWyO96coeWS3cre+dBTd6sty1BZsQVEUfHlg2Ch+5EcstCU/A
 kUs8Q+1wJXibh4yWZwYJPmjbJXBkIVTz9m3o6afr+t6odB4+QZGAX01YzdMHfnXf9hxRZ3/i4Gf
 YxEVQlQ1LbMdXqFNQHTjJMipE6hBrg3lJtOzaqcz8=
X-Received: by 2002:a05:7300:e208:b0:2be:a440:7550 with SMTP id
 5a478bee46e88-2bea55edf88mr4372653eec.28.1773546095319; 
 Sat, 14 Mar 2026 20:41:35 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3eec8fsm8886424eec.13.2026.03.14.20.41.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 20:41:35 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v3 3/6] target/arm/emulate: add load/store pair
Date: Sun, 15 Mar 2026 00:41:20 -0300
Message-ID: <20260315034123.41921-4-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260315034123.41921-1-lucaaamaral@gmail.com>
References: <20260313021850.42379-1-lucaaamaral@gmail.com>
 <20260315034123.41921-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_BARE_IP_2=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add emulation for load/store pair instructions (DDI 0487 C3.3.14 --
C3.3.16).  All addressing modes are covered: non-temporal (STNP/LDNP),
post-indexed, signed offset, and pre-indexed.

Instruction coverage:
  - STP/LDP (GPR): 32/64-bit pairs, all addressing modes
  - STP/LDP (SIMD/FP): 32/64/128-bit pairs, all addressing modes
  - LDPSW: sign-extending 32-bit pair load
  - STGP: store allocation tag pair (tag operation is NOP for MMIO)

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/emulate/a64-ldst.decode |  68 ++++++++++++++++++
 target/arm/emulate/arm_emulate.c   | 111 +++++++++++++++++++++++++++++
 2 files changed, 179 insertions(+)

diff --git a/target/arm/emulate/a64-ldst.decode b/target/arm/emulate/a64-ldst.decode
index af6babe1..f3de3f86 100644
--- a/target/arm/emulate/a64-ldst.decode
+++ b/target/arm/emulate/a64-ldst.decode
@@ -10,6 +10,9 @@
 # 'u' flag: 0 = 9-bit signed immediate (byte offset), 1 = 12-bit unsigned (needs << sz)
 &ldst_imm       rt rn imm sz sign w p unpriv ext u
 
+# Load/store pair (GPR and SIMD/FP)
+&ldstpair       rt2 rt rn imm sz sign w p
+
 # Load/store register offset
 &ldst           rm rn rt sign ext sz opt s
 
@@ -24,6 +27,9 @@
 # Load/store unsigned offset (12-bit, handler scales by << sz)
 @ldst_uimm      .. ... . .. .. imm:12 rn:5 rt:5        &ldst_imm u=1 unpriv=0 p=0 w=0
 
+# Load/store pair: imm7 is signed, scaled by element size in handler
+@ldstpair       .. ... . ... . imm:s7 rt2:5 rn:5 rt:5          &ldstpair
+
 # Load/store register offset
 @ldst           .. ... . .. .. . rm:5 opt:3 s:1 .. rn:5 rt:5   &ldst
 
@@ -128,6 +134,68 @@ STR_v_i         00 111 1 01 10 ............ ..... .....         @ldst_uimm sign=
 LDR_v_i         sz:2 111 1 01 01 ............ ..... .....       @ldst_uimm sign=0 ext=0
 LDR_v_i         00 111 1 01 11 ............ ..... .....         @ldst_uimm sign=0 ext=0 sz=4
 
+### Load/store pair — non-temporal (STNP/LDNP)
+
+# STNP/LDNP: offset only, no writeback.  Non-temporal hint ignored.
+STP             00 101 0 000 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+LDP             00 101 0 000 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+STP             10 101 0 000 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+LDP             10 101 0 000 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+STP_v           00 101 1 000 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+LDP_v           00 101 1 000 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+STP_v           01 101 1 000 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+LDP_v           01 101 1 000 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+STP_v           10 101 1 000 0 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=0 w=0
+LDP_v           10 101 1 000 1 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=0 w=0
+
+### Load/store pair — post-indexed
+
+STP             00 101 0 001 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=1 w=1
+LDP             00 101 0 001 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=1 w=1
+LDP             01 101 0 001 1 ....... ..... ..... .....        @ldstpair sz=2 sign=1 p=1 w=1
+STP             10 101 0 001 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=1 w=1
+LDP             10 101 0 001 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=1 w=1
+STP_v           00 101 1 001 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=1 w=1
+LDP_v           00 101 1 001 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=1 w=1
+STP_v           01 101 1 001 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=1 w=1
+LDP_v           01 101 1 001 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=1 w=1
+STP_v           10 101 1 001 0 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=1 w=1
+LDP_v           10 101 1 001 1 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=1 w=1
+
+### Load/store pair — signed offset
+
+STP             00 101 0 010 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+LDP             00 101 0 010 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+LDP             01 101 0 010 1 ....... ..... ..... .....        @ldstpair sz=2 sign=1 p=0 w=0
+STP             10 101 0 010 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+LDP             10 101 0 010 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+STP_v           00 101 1 010 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+LDP_v           00 101 1 010 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=0
+STP_v           01 101 1 010 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+LDP_v           01 101 1 010 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+STP_v           10 101 1 010 0 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=0 w=0
+LDP_v           10 101 1 010 1 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=0 w=0
+
+### Load/store pair — pre-indexed
+
+STP             00 101 0 011 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=1
+LDP             00 101 0 011 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=1
+LDP             01 101 0 011 1 ....... ..... ..... .....        @ldstpair sz=2 sign=1 p=0 w=1
+STP             10 101 0 011 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=1
+LDP             10 101 0 011 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=1
+STP_v           00 101 1 011 0 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=1
+LDP_v           00 101 1 011 1 ....... ..... ..... .....        @ldstpair sz=2 sign=0 p=0 w=1
+STP_v           01 101 1 011 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=1
+LDP_v           01 101 1 011 1 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=1
+STP_v           10 101 1 011 0 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=0 w=1
+LDP_v           10 101 1 011 1 ....... ..... ..... .....        @ldstpair sz=4 sign=0 p=0 w=1
+
+### Load/store pair — STGP (store allocation tag + pair)
+
+STGP            01 101 0 001 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=1 w=1
+STGP            01 101 0 010 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=0
+STGP            01 101 0 011 0 ....... ..... ..... .....        @ldstpair sz=3 sign=0 p=0 w=1
+
 ### Load/store register — register offset
 
 # GPR
diff --git a/target/arm/emulate/arm_emulate.c b/target/arm/emulate/arm_emulate.c
index 0e77cf33..a7c62b44 100644
--- a/target/arm/emulate/arm_emulate.c
+++ b/target/arm/emulate/arm_emulate.c
@@ -111,6 +111,117 @@ static uint64_t load_extend(uint64_t val, int sz, int sign, int ext)
     return val;
 }
 
+/*
+ * Load/store pair: STP, LDP, STNP, LDNP, STGP, LDPSW
+ * (DDI 0487 C3.3.14 -- C3.3.16)
+ */
+
+static bool trans_STP(DisasContext *ctx, arg_ldstpair *a)
+{
+    int esize = 1 << a->sz;                   /* 4 or 8 bytes */
+    int64_t offset = (int64_t)a->imm << a->sz;
+    uint64_t base = base_read(ctx, a->rn);
+    uint64_t va = a->p ? base : base + offset; /* post-index: unmodified base */
+    uint8_t buf[16];                           /* max 2 x 8 bytes */
+
+    uint64_t v1 = gpr_read(ctx, a->rt);
+    uint64_t v2 = gpr_read(ctx, a->rt2);
+    memcpy(buf, &v1, esize);
+    memcpy(buf + esize, &v2, esize);
+
+    if (mem_write(ctx, va, buf, 2 * esize) != 0) {
+        return true;
+    }
+
+    if (a->w) {
+        base_write(ctx, a->rn, base + offset);
+    }
+    return true;
+}
+
+static bool trans_LDP(DisasContext *ctx, arg_ldstpair *a)
+{
+    int esize = 1 << a->sz;
+    int64_t offset = (int64_t)a->imm << a->sz;
+    uint64_t base = base_read(ctx, a->rn);
+    uint64_t va = a->p ? base : base + offset;
+    uint8_t buf[16];
+    uint64_t v1 = 0, v2 = 0;
+
+    if (mem_read(ctx, va, buf, 2 * esize) != 0) {
+        return true;
+    }
+    memcpy(&v1, buf, esize);
+    memcpy(&v2, buf + esize, esize);
+
+    /* LDPSW: sign-extend 32-bit values to 64-bit (sign=1, sz=2) */
+    if (a->sign) {
+        v1 = sign_extend(v1, 8 * esize);
+        v2 = sign_extend(v2, 8 * esize);
+    }
+
+    gpr_write(ctx, a->rt, v1);
+    gpr_write(ctx, a->rt2, v2);
+
+    if (a->w) {
+        base_write(ctx, a->rn, base + offset);
+    }
+    return true;
+}
+
+/* STGP: tag operation is a NOP for emulation; data stored via STP */
+static bool trans_STGP(DisasContext *ctx, arg_ldstpair *a)
+{
+    return trans_STP(ctx, a);
+}
+
+/*
+ * SIMD/FP load/store pair: STP_v, LDP_v
+ * (DDI 0487 C3.3.14 -- C3.3.16)
+ */
+
+static bool trans_STP_v(DisasContext *ctx, arg_ldstpair *a)
+{
+    int esize = 1 << a->sz;                   /* 4, 8, or 16 bytes */
+    int64_t offset = (int64_t)a->imm << a->sz;
+    uint64_t base = base_read(ctx, a->rn);
+    uint64_t va = a->p ? base : base + offset;
+    uint8_t buf[32];                           /* max 2 x 16 bytes */
+
+    fpreg_read(ctx, a->rt, buf, esize);
+    fpreg_read(ctx, a->rt2, buf + esize, esize);
+
+    if (mem_write(ctx, va, buf, 2 * esize) != 0) {
+        return true;
+    }
+
+    if (a->w) {
+        base_write(ctx, a->rn, base + offset);
+    }
+    return true;
+}
+
+static bool trans_LDP_v(DisasContext *ctx, arg_ldstpair *a)
+{
+    int esize = 1 << a->sz;
+    int64_t offset = (int64_t)a->imm << a->sz;
+    uint64_t base = base_read(ctx, a->rn);
+    uint64_t va = a->p ? base : base + offset;
+    uint8_t buf[32];
+
+    if (mem_read(ctx, va, buf, 2 * esize) != 0) {
+        return true;
+    }
+
+    fpreg_write(ctx, a->rt, buf, esize);
+    fpreg_write(ctx, a->rt2, buf + esize, esize);
+
+    if (a->w) {
+        base_write(ctx, a->rn, base + offset);
+    }
+    return true;
+}
+
 /* Load/store single -- immediate (GPR) (DDI 0487 C3.3.8 -- C3.3.13) */
 
 static bool trans_STR_i(DisasContext *ctx, arg_ldst_imm *a)
-- 
2.52.0



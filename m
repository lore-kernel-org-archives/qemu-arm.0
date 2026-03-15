Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AEDD58B08
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 03:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1cMD-0004os-Tt; Sat, 14 Mar 2026 23:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMC-0004o7-Uc
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:41:36 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w1cMA-0003X2-R2
 for qemu-arm@nongnu.org; Sat, 14 Mar 2026 23:41:36 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-2bdd40d3c61so2996128eec.1
 for <qemu-arm@nongnu.org>; Sat, 14 Mar 2026 20:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773546093; x=1774150893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbSg1MD18V9IGLdbKDVPJ9yDLz9GZTVkv2Dyy41T4fY=;
 b=ISgkRcfeb/U5I7D1R/PB6ieZlddDPdRjUuw80ZeJFJMNZkYwhMzy+X8Xknge8IYoQa
 jDh+w8CPrX5Yt5GX7c/kbq/sTLD+QC+TW6+AAdf/WFG22oQFyPNkoG9gar8ZU+68FzYE
 45w0CkvIJQDpSIZiCemuAEgSuNk12yrPa07NazUPj6GhYaltejwflZZZY6UAMijtj/gf
 1fyNPYH9UHsfNxXYiwuES+8FNRhfoPeF9+2BzSkQJbI9klOE6t3WwBGqPuyt+aLLh5TG
 3q1HRiZnLoubAjr0xEGdDSVpPddUgJEPnVmm2NCEHYBE2okS5AC/arOT57e5xo8yfBSV
 T9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773546093; x=1774150893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LbSg1MD18V9IGLdbKDVPJ9yDLz9GZTVkv2Dyy41T4fY=;
 b=g7+9Qb3uGKrd3+yKJu/bU53ojA2A1TOn7zsMRMsUEPn9rAwgH9cWRBPyQGWpIeIpUZ
 wf8SxAAT2jguFAuaMI9hv5/ezhp6Ppg9WfSE9/JU3ka5JRPuRY9xMf5QA/UZzn/xqkpj
 xIIU9Gxln2n+iqql+Oy6Z6hH8VQfs6FWMra0D4teRFq5SbKrCh2MFcZXHo8hyegL1snu
 yBIMb/VckfozYTU+mXAkUtOOP0UwmaA+SSs5v1AG/f/STOGfyUbnT8ZXftp7I/QBKhLo
 Gw5fH3vzS6NSb+xzUyQ25I8gPy7aWUrXgYRJ6YS19XGnLafFjgD4WfWmSjIOIXCwn2y4
 DPpA==
X-Gm-Message-State: AOJu0YxbpvazDVS+nXS01F799fcWhis4qS25zyGs/nTPxITl+moLVQ4H
 nxZOi9gDnONV8BcRGB3nlDu4ck4MV5PbOkz5MKWr7ciDUIkiwv7s2lULKzWG6HIf
X-Gm-Gg: ATEYQzw8oNzE/bvYk5F/OS1NlfV8QiuRQMJYKrhK+FYgrT4sA2xeXffMED6tS5I0Qyb
 eB6qw8CfqQDwEBWFB1hSR7OsuoQHEj88ctWj/NqKDduXLkmjgAObtvmt37Agwc0KfFe4187Mokr
 mkl/938S/HIcbduwjQPh59G0EMT5sn7EplZe8ZriddqUqDmocv56mpP0dJMUK3+eDpZEjcS1kjX
 2WCSW3fsdw0l/A+nNSqBS594bhGsA6PYFoSFjptHLw9iJ6hqjOjJN/WWrutpanboMdnioO7A8LS
 C7ddlGC1qvs6UEce75VLFODF1Wm6oCynexHwHlR6HzxHEw8ozVswvFOdBBfCq9GQUzPZb01EkN0
 qRdo0+YBkoF0BjSP7ULuvqGSFXsniFkcRlnAz+2lQtyCBXjOEQAi08SMkjhKDbHSi1CryQCaKyt
 J7gshaBO7IoqdRi02nJgDebGA5cAO3xNorfqH52Ig=
X-Received: by 2002:a05:7300:230b:b0:2be:1f58:32a6 with SMTP id
 5a478bee46e88-2bea555a8aamr3584887eec.33.1773546093154; 
 Sat, 14 Mar 2026 20:41:33 -0700 (PDT)
Received: from 192.168.7.2 ([189.6.247.75]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3eec8fsm8886424eec.13.2026.03.14.20.41.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 14 Mar 2026 20:41:32 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v3 2/6] target/arm/emulate: add load/store register offset
Date: Sun, 15 Mar 2026 00:41:19 -0300
Message-ID: <20260315034123.41921-3-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260315034123.41921-1-lucaaamaral@gmail.com>
References: <20260313021850.42379-1-lucaaamaral@gmail.com>
 <20260315034123.41921-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132d.google.com
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

Add emulation for load/store register offset addressing mode
(DDI 0487 C3.3.9).  The offset register value is extended via
UXTB/UXTH/UXTW/UXTX/SXTB/SXTH/SXTW/SXTX and optionally
shifted by the element size.

Instruction coverage:
  - STR/LDR (GPR): register offset with extend, all sizes
  - STR/LDR (SIMD/FP): register offset with extend, 8-128 bit
  - PRFM register offset: NOP

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 target/arm/emulate/a64-ldst.decode |  29 ++++++++
 target/arm/emulate/arm_emulate.c   | 103 +++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/target/arm/emulate/a64-ldst.decode b/target/arm/emulate/a64-ldst.decode
index c887dcba..af6babe1 100644
--- a/target/arm/emulate/a64-ldst.decode
+++ b/target/arm/emulate/a64-ldst.decode
@@ -10,6 +10,9 @@
 # 'u' flag: 0 = 9-bit signed immediate (byte offset), 1 = 12-bit unsigned (needs << sz)
 &ldst_imm       rt rn imm sz sign w p unpriv ext u
 
+# Load/store register offset
+&ldst           rm rn rt sign ext sz opt s
+
 ### Format templates
 
 # Load/store immediate (9-bit signed)
@@ -21,6 +24,9 @@
 # Load/store unsigned offset (12-bit, handler scales by << sz)
 @ldst_uimm      .. ... . .. .. imm:12 rn:5 rt:5        &ldst_imm u=1 unpriv=0 p=0 w=0
 
+# Load/store register offset
+@ldst           .. ... . .. .. . rm:5 opt:3 s:1 .. rn:5 rt:5   &ldst
+
 ### Load/store register — unscaled immediate (LDUR/STUR)
 
 # GPR
@@ -122,6 +128,29 @@ STR_v_i         00 111 1 01 10 ............ ..... .....         @ldst_uimm sign=
 LDR_v_i         sz:2 111 1 01 01 ............ ..... .....       @ldst_uimm sign=0 ext=0
 LDR_v_i         00 111 1 01 11 ............ ..... .....         @ldst_uimm sign=0 ext=0 sz=4
 
+### Load/store register — register offset
+
+# GPR
+STR             sz:2 111 0 00 00 1 ..... ... . 10 ..... .....  @ldst sign=0 ext=0
+LDR             00 111 0 00 01 1 ..... ... . 10 ..... .....    @ldst sign=0 ext=1 sz=0
+LDR             01 111 0 00 01 1 ..... ... . 10 ..... .....    @ldst sign=0 ext=1 sz=1
+LDR             10 111 0 00 01 1 ..... ... . 10 ..... .....    @ldst sign=0 ext=1 sz=2
+LDR             11 111 0 00 01 1 ..... ... . 10 ..... .....    @ldst sign=0 ext=0 sz=3
+LDR             00 111 0 00 10 1 ..... ... . 10 ..... .....    @ldst sign=1 ext=0 sz=0
+LDR             01 111 0 00 10 1 ..... ... . 10 ..... .....    @ldst sign=1 ext=0 sz=1
+LDR             10 111 0 00 10 1 ..... ... . 10 ..... .....    @ldst sign=1 ext=0 sz=2
+LDR             00 111 0 00 11 1 ..... ... . 10 ..... .....    @ldst sign=1 ext=1 sz=0
+LDR             01 111 0 00 11 1 ..... ... . 10 ..... .....    @ldst sign=1 ext=1 sz=1
+
+# PRFM — register offset
+NOP             11 111 0 00 10 1 ----- -1- - 10 ----- -----
+
+# SIMD/FP
+STR_v           sz:2 111 1 00 00 1 ..... ... . 10 ..... .....  @ldst sign=0 ext=0
+STR_v           00 111 1 00 10 1 ..... ... . 10 ..... .....    @ldst sign=0 ext=0 sz=4
+LDR_v           sz:2 111 1 00 01 1 ..... ... . 10 ..... .....  @ldst sign=0 ext=0
+LDR_v           00 111 1 00 11 1 ..... ... . 10 ..... .....    @ldst sign=0 ext=0 sz=4
+
 ### System instructions — DC cache maintenance
 
 # SYS with CRn=C7 covers all data cache operations (DC CIVAC, CVAC, etc.).
diff --git a/target/arm/emulate/arm_emulate.c b/target/arm/emulate/arm_emulate.c
index 2b4e2a9e..0e77cf33 100644
--- a/target/arm/emulate/arm_emulate.c
+++ b/target/arm/emulate/arm_emulate.c
@@ -200,6 +200,109 @@ static bool trans_LDR_v_i(DisasContext *ctx, arg_ldst_imm *a)
     return true;
 }
 
+/* Register offset extension (DDI 0487 C6.2.131) */
+
+static uint64_t extend_reg(uint64_t val, int option, int shift)
+{
+    switch (option) {
+    case 0: /* UXTB */
+        val = (uint8_t)val;
+        break;
+    case 1: /* UXTH */
+        val = (uint16_t)val;
+        break;
+    case 2: /* UXTW */
+        val = (uint32_t)val;
+        break;
+    case 3: /* UXTX / LSL */
+        break;
+    case 4: /* SXTB */
+        val = (int64_t)(int8_t)val;
+        break;
+    case 5: /* SXTH */
+        val = (int64_t)(int16_t)val;
+        break;
+    case 6: /* SXTW */
+        val = (int64_t)(int32_t)val;
+        break;
+    case 7: /* SXTX */
+        break;
+    }
+    return val << shift;
+}
+
+/*
+ * Load/store single -- register offset (GPR)
+ * STR / LDR (DDI 0487 C3.3.9)
+ */
+
+static bool trans_STR(DisasContext *ctx, arg_ldst *a)
+{
+    int esize = (a->sz <= 3) ? (1 << a->sz) : 16;
+    int shift = a->s ? a->sz : 0;
+    uint64_t rm_val = gpr_read(ctx, a->rm);
+    uint64_t offset = extend_reg(rm_val, a->opt, shift);
+    uint64_t va = base_read(ctx, a->rn) + offset;
+
+    uint64_t val = gpr_read(ctx, a->rt);
+    mem_write(ctx, va, &val, esize);
+    return true;
+}
+
+static bool trans_LDR(DisasContext *ctx, arg_ldst *a)
+{
+    int esize = (a->sz <= 3) ? (1 << a->sz) : 16;
+    int shift = a->s ? a->sz : 0;
+    uint64_t rm_val = gpr_read(ctx, a->rm);
+    uint64_t offset = extend_reg(rm_val, a->opt, shift);
+    uint64_t va = base_read(ctx, a->rn) + offset;
+    uint64_t val = 0;
+
+    if (mem_read(ctx, va, &val, esize) != 0) {
+        return true;
+    }
+
+    val = load_extend(val, a->sz, a->sign, a->ext);
+    gpr_write(ctx, a->rt, val);
+    return true;
+}
+
+/*
+ * Load/store single -- register offset (SIMD/FP)
+ * STR_v / LDR_v (DDI 0487 C3.3.10)
+ */
+
+static bool trans_STR_v(DisasContext *ctx, arg_ldst *a)
+{
+    int esize = (a->sz <= 3) ? (1 << a->sz) : 16;
+    int shift = a->s ? a->sz : 0;
+    uint64_t rm_val = gpr_read(ctx, a->rm);
+    uint64_t offset = extend_reg(rm_val, a->opt, shift);
+    uint64_t va = base_read(ctx, a->rn) + offset;
+    uint8_t buf[16];
+
+    fpreg_read(ctx, a->rt, buf, esize);
+    mem_write(ctx, va, buf, esize);
+    return true;
+}
+
+static bool trans_LDR_v(DisasContext *ctx, arg_ldst *a)
+{
+    int esize = (a->sz <= 3) ? (1 << a->sz) : 16;
+    int shift = a->s ? a->sz : 0;
+    uint64_t rm_val = gpr_read(ctx, a->rm);
+    uint64_t offset = extend_reg(rm_val, a->opt, shift);
+    uint64_t va = base_read(ctx, a->rn) + offset;
+    uint8_t buf[16];
+
+    if (mem_read(ctx, va, buf, esize) != 0) {
+        return true;
+    }
+
+    fpreg_write(ctx, a->rt, buf, esize);
+    return true;
+}
+
 /* PRFM, DC cache maintenance -- treated as NOP */
 static bool trans_NOP(DisasContext *ctx, arg_NOP *a)
 {
-- 
2.52.0



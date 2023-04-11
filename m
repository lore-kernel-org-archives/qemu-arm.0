Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184133ejc;
        Mon, 10 Apr 2023 18:09:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZwW6n3b0cQ+qHet+jvMnqLajdCQTLNAkZJHA8763lNB3KazMlhzg1SLR/b+K5R2KNIJOGK
X-Received: by 2002:a05:6214:21ea:b0:5a2:6074:6cfa with SMTP id p10-20020a05621421ea00b005a260746cfamr21296881qvj.38.1681175344246;
        Mon, 10 Apr 2023 18:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175344; cv=none;
        d=google.com; s=arc-20160816;
        b=nE9hxO+UkwMG3dXwK1BMej+EkLReS+KwXyWsW7g55FzRsCgNVyUJGlS5mcSW0TqfNn
         9ApT0EgCGzCTzYSZRYRK0LS0AyuHji8DbOgRCL7z/A/tVeSsCo37xSmVWtI+u0rY8Siu
         fxfq13Ib/+OCumMIO0IaVuXvkmhGOsIrqmhSAu9JlFcIrpwrOZvl0DTN8EtO0PNpZRPa
         ZHjDlG7H7rJk/GEUt+lMIhp3lSXt6Va5cvGLKSgEuUgu8b1nkfxW1NVHWhJLsPgNaXfo
         ZEXOvstURI2l66nEeeS705wm8zl7ds5UwuagRSoUSQkpiy8wTKuGucCg7uXIgOrrxYlV
         c0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hTmKURa4wkFWoU6jCXqiIPhcn5PtXi9Fy01Os3VPvIg=;
        b=Bmf1hQZz2Eqj7Q11zbtfbG8WFIZ4vseP89zQEWACuL22Olkn8Cz9VCj199X3oxB98g
         NTuW7erXlkhyhQHbBf+0NeivvGVzcePtb/1f+jpE7fuEN0ZRy9PP9K6xy2+pTv6nUPFX
         qqVfKwzJhuClTERvFCCWeNJqGgtJQDkfzXaFNCiQqzeKDj6Bm+pWmPv0L6cc2EDFt6kL
         3+VPOS0WfiY5ynJSEMzYx5JrYLDugyNU88ZCwYqkRdysjISBFhw+zX4he+yNl6YkiiY/
         CXzKtfpp93sbrVpHPLLUiFXgowlWXpAvU1/h5f8bwVBhNonRJYhIHMNhe6KeHHqocCuf
         xtJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lM5JGzTS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a174700b003e3950839dbsi8338847qtk.477.2023.04.10.18.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lM5JGzTS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Sz-0005j5-Dw; Mon, 10 Apr 2023 21:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SY-0004mv-Es
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SW-0000c5-Fx
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id g3so7596210pja.2
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTmKURa4wkFWoU6jCXqiIPhcn5PtXi9Fy01Os3VPvIg=;
 b=lM5JGzTSTfT5swshvZgSvZcw/pdfMNVjcqtQHEG6sIYG9xrSDP4N2Id595FVU3UbxD
 D7dmkYOdg37H9Tkq2zsKxrVoHEf0EQzOSULOAznqkg98RWeJd+2tTQzc0f1MyXLwP/mt
 sNjZMmufQ6YT+TrGfron6kWBIlxxLIwRWPCfDfaobHYpwrkND/j6R2b1LRzEOL5vZBrc
 ulhNWbUEDZz+h5lRglzjKciO8+l6Qx8cuI5S9doWfRWvsFxnQ8LIuB5iMVcY6JWqjREN
 W+pxS8b2qOiOWayrSF4utfGLjBIUMo15VTiXKxLIHQHg45i6OYK8/ls6vgfv2Lw+kXDN
 gmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hTmKURa4wkFWoU6jCXqiIPhcn5PtXi9Fy01Os3VPvIg=;
 b=ZgBXkxcyBE9j6Y9HghW54KWe5tqPkAPKbrTKAOobDXhukV9ZAj5JraP3OEj4e8Ih1p
 SkmfIiUKHuozgJitVsxqe9UM9zEEfMHh4gi39I/GloTr2X/CTRAOKqFgLqeoPWleIx1W
 udo6ea+eeuLtU1xI7Am/k6d7vEAeSJXFWyzmVPuhuQRmrk+ISSDx7YeEqf5aIlSzbPoy
 QNECvowATaWdl75HdT+2nnDACRy0Qu9cX9Csg6TUrvCMxeqyAqpNy6MqyIdkG1DedOqF
 uvHQaiO8QjIUtbHGx4S3HNxD4O/ko8LDIKi4HL1SaUifhiuEFX7FoJxD7Qd9ut51itHh
 kHog==
X-Gm-Message-State: AAQBX9dU4uMF5RrRf5MPQliZy2Um5RgbdK6G1n2d5Si5P01kVklsgYYx
 9ebqXWVEFequ7x436dMEQrujqQ==
X-Received: by 2002:a05:6a20:b191:b0:da:dc14:33d with SMTP id
 ee17-20020a056a20b19100b000dadc14033dmr11340804pzb.53.1681175167665; 
 Mon, 10 Apr 2023 18:06:07 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 18/54] tcg: Introduce tcg_out_movext2
Date: Mon, 10 Apr 2023 18:04:36 -0700
Message-Id: <20230411010512.5375-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: jjzZGclEQSXS

This is common code in most qemu_{ld,st} slow paths, moving two
registers when there may be overlap between sources and destinations.
At present, this is only used by 32-bit hosts for 64-bit data,
but will shortly be used for more than that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 69 ++++++++++++++++++++++++++++++++++++---
 tcg/arm/tcg-target.c.inc  | 42 ++++++++++--------------
 tcg/i386/tcg-target.c.inc | 19 +++++------
 3 files changed, 89 insertions(+), 41 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index fde5ccc57c..cfd3262a4a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -115,8 +115,7 @@ static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_extrl_i64_i32(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
-static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2)
-    __attribute__((unused));
+static bool tcg_out_xchg(TCGContext *s, TCGType type, TCGReg r1, TCGReg r2);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
@@ -354,6 +353,14 @@ void tcg_raise_tb_overflow(TCGContext *s)
     siglongjmp(s->jmp_trans, -2);
 }
 
+typedef struct TCGMovExtend {
+    TCGReg dst;
+    TCGReg src;
+    TCGType dst_type;
+    TCGType src_type;
+    MemOp src_ext;
+} TCGMovExtend;
+
 /**
  * tcg_out_movext -- move and extend
  * @s: tcg context
@@ -365,9 +372,8 @@ void tcg_raise_tb_overflow(TCGContext *s)
  *
  * Move or extend @src into @dst, depending on @src_ext and the types.
  */
-static void __attribute__((unused))
-tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
-               TCGType src_type, MemOp src_ext, TCGReg src)
+static void tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
+                           TCGType src_type, MemOp src_ext, TCGReg src)
 {
     switch (src_ext) {
     case MO_UB:
@@ -417,6 +423,59 @@ tcg_out_movext(TCGContext *s, TCGType dst_type, TCGReg dst,
     }
 }
 
+/* Minor variations on a theme, using a structure. */
+static void tcg_out_movext1_new_src(TCGContext *s, const TCGMovExtend *i,
+                                    TCGReg src)
+{
+    tcg_out_movext(s, i->dst_type, i->dst, i->src_type, i->src_ext, src);
+}
+
+static void tcg_out_movext1(TCGContext *s, const TCGMovExtend *i)
+{
+    tcg_out_movext1_new_src(s, i, i->src);
+}
+
+/**
+ * tcg_out_movext2 -- move and extend two pair
+ * @s: tcg context
+ * @i1: first move description
+ * @i2: second move description
+ * @scratch: temporary register, or -1 for none
+ *
+ * As tcg_out_movext, for both @i1 and @i2, caring for overlap
+ * between the sources and destinations.
+ */
+
+static void __attribute__((unused))
+tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
+                const TCGMovExtend *i2, int scratch)
+{
+    TCGReg src1 = i1->src;
+    TCGReg src2 = i2->src;
+
+    if (i1->dst != src2) {
+        tcg_out_movext1(s, i1);
+        tcg_out_movext1(s, i2);
+        return;
+    }
+    if (i2->dst == src1) {
+        TCGType src1_type = i1->src_type;
+        TCGType src2_type = i2->src_type;
+
+        if (tcg_out_xchg(s, MAX(src1_type, src2_type), src1, src2)) {
+            /* The data is now in the correct registers, now extend. */
+            src1 = i2->src;
+            src2 = i1->src;
+        } else {
+            tcg_debug_assert(scratch >= 0);
+            tcg_out_mov(s, src1_type, scratch, src1);
+            src1 = scratch;
+        }
+    }
+    tcg_out_movext1_new_src(s, i2, src2);
+    tcg_out_movext1_new_src(s, i1, src1);
+}
+
 #define C_PFX1(P, A)                    P##A
 #define C_PFX2(P, A, B)                 P##A##_##B
 #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 4a5d57a41c..83c818a58b 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1545,7 +1545,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
 
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg argreg, datalo, datahi;
+    TCGReg argreg;
     MemOpIdx oi = lb->oi;
     MemOp opc = get_memop(oi);
 
@@ -1565,20 +1565,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     /* Use the canonical unsigned helpers and minimize icache usage. */
     tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE]);
 
-    datalo = lb->datalo_reg;
-    datahi = lb->datahi_reg;
     if ((opc & MO_SIZE) == MO_64) {
-        if (datalo != TCG_REG_R1) {
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-        } else if (datahi != TCG_REG_R0) {
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
-        } else {
-            tcg_out_mov_reg(s, COND_AL, TCG_REG_TMP, TCG_REG_R0);
-            tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
-            tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_TMP);
-        }
+        TCGMovExtend ext[2] = {
+            { .dst = lb->datalo_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_R0, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = lb->datahi_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_R1, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
     } else {
         tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,
                        TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
@@ -1663,17 +1657,15 @@ static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 
     if (TARGET_LONG_BITS == 64) {
         /* 64-bit target address is aligned into R2:R3. */
-        if (l->addrhi_reg != TCG_REG_R2) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
-        } else if (l->addrlo_reg != TCG_REG_R3) {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, l->addrlo_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, TCG_REG_R2);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R2, TCG_REG_R3);
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R3, TCG_REG_R1);
-        }
+        TCGMovExtend ext[2] = {
+            { .dst = TCG_REG_R2, .dst_type = TCG_TYPE_I32,
+              .src = l->addrlo_reg,
+              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = TCG_REG_R3, .dst_type = TCG_TYPE_I32,
+              .src = l->addrhi_reg,
+              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
     } else {
         tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index ce87f8fbc9..238a75b17e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1916,7 +1916,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
     MemOp opc = get_memop(oi);
-    TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1953,18 +1952,16 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-    data_reg = l->datalo_reg;
     if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        if (data_reg == TCG_REG_EDX) {
-            /* xchg %edx, %eax */
-            tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
-            tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
-        }
+        TCGMovExtend ext[2] = {
+            { .dst = l->datalo_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_EAX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+            { .dst = l->datahi_reg, .dst_type = TCG_TYPE_I32,
+              .src = TCG_REG_EDX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
+        };
+        tcg_out_movext2(s, &ext[0], &ext[1], -1);
     } else {
-        tcg_out_movext(s, l->type, data_reg,
+        tcg_out_movext(s, l->type, l->datalo_reg,
                        TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
     }
 
-- 
2.34.1


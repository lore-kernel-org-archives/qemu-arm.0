Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184315ejc;
        Mon, 10 Apr 2023 18:09:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bUfssjDWV+8p5rU6GozMDaYAPUJ9o6XmMzoY8LEaUDSYPfnFyqkT8K/FN5SnwWSRWSYkPs
X-Received: by 2002:a05:622a:1d1:b0:3e6:9395:9098 with SMTP id t17-20020a05622a01d100b003e693959098mr15716660qtw.52.1681175372415;
        Mon, 10 Apr 2023 18:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175372; cv=none;
        d=google.com; s=arc-20160816;
        b=vEMyacvhTmBF4lN735iPSX0ZFg9ReKDdqENY2AvQYP8zxagGTPwOA2fduGuTrWptSy
         a1UL8YxmZIsj4ZdlDX7UFJXmgDi7TuKGx6LEtowEe2JZSAvWAK/ACTc9iP8YV7ZFl137
         eUyRRtMipHJnWuu5sKNZ7VDv5BSZ54RcXNEChZBhidiqnRG5LzdTIpN0GZjBhkLeIvtX
         0YH/iRxiVS5X+QyLZXqV4iYy4q3sLANxIjk1NMoGc6xtFpMgH3FKp9qoEqia2OmD5PQf
         DFspw8LYUrIl/Crq4crm+rM/nrjB8LLyKUOUYUq6sGxlj1iC1hXmtprIQ6duXN3B221F
         it4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aNpI8TMXBqiDgEVu+sIMvVj6w2E29oB3JUa3F6XJWPI=;
        b=G7GK3MynYaTIgfHDiQVhDfl8Yfzm8ZmRKXVuoxXwrMnA9722RLKUeUsvf3KsGcQjZH
         ePmdt1/MRYp8VTlZXishx8n40CaniEidT2qE8AocRnDRLAe72I53AsFcm8ZCNg8zyw/s
         8Xo5WKykmUk2kMslo+sFfY+89tRdux7LWg9GYs7v0JQrOgqqOyeWMMKrhXQOWOPtm+Xt
         e1e/wRSzwy8AeBCBsK4STw5iCpeIN8/H5yf4yiUi6jm5tk6+2r9a713wl+z04Ax4GyUw
         eisokyj/sbHwUgwBUTPB71p/iQC9gDUJXQwiG9auc0F8DGOFlh+acQAIM89eJ/mzmOdt
         2z+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jb16Xa9w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5-20020a05622a000500b003ba106601absi8074738qtw.414.2023.04.10.18.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jb16Xa9w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2TR-00087x-AS; Mon, 10 Apr 2023 21:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TJ-0007Kf-C5
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:57 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TF-00013V-F3
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-246637e35afso521119a91.2
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNpI8TMXBqiDgEVu+sIMvVj6w2E29oB3JUa3F6XJWPI=;
 b=jb16Xa9wt5rNzIHDi+ms4B15KuDKz63wIdhC0apT/tqXcGH4gC7PmMA1Ji6xYe6ogQ
 Yd2RV1YUxOGrDi+vvhI6s3L2fi7HT9wnt47yMQST1HyMdoZnCEnGCm/cIdNEwMnLC13T
 tmERuSDrYfD8UXxfxrqpKITqup0Ff+sDt0VshXwklwfe1Dms1ciOUjoD8uASlSfzaTTK
 asgapBAVB4tRIq4N2bE4ZKjqbrRWxazqaH1eFNA9cHMqpGYEl5eThYGzrPxG8ZKhObXD
 1DYTjtcD3/07gs3ZEItbF+3Cb2riMtWjvL6YONqCNGUaOvuoNxQhjxjWaBrzK+TBar/O
 XiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNpI8TMXBqiDgEVu+sIMvVj6w2E29oB3JUa3F6XJWPI=;
 b=WQ69/QI9xbTYsfsHa39fKLCV2ApnegvfSNrL+GKd7ndRMrFrUGfVCkcMKHcYqshdqL
 jyBc4khk66xVRWjHBirQVFhiTci/jnDCwDmpziJb5TAkUyq8lyuvWbc1JxHlsUaz/UAR
 8oNhMC32i28mvb2clhoTnr7i3TtMWBWihyntLzjM4NzS4Tdyanl0sJvtI/8nFuw+7rnI
 TvoOqCqUKIR1e2JIaiihczWkMsrbk8iQnDesC81aPflQA24zpHJu9vW/0xE4/ukgw24H
 SQQWyefUBKsMH0Y83sNkTaEbK06/l6vwa7W896xJCht6Yxru1+vFiYc7CeTJllH/9NYI
 OhEg==
X-Gm-Message-State: AAQBX9cwi+CQP0lK9PLjxarby/QKOw8wEuWWF/las/q22eZVpwl4gBGt
 +fvjpRlQNMF7ndbkfq8DjP1Tlg==
X-Received: by 2002:a62:1b8d:0:b0:62a:c1fa:b253 with SMTP id
 b135-20020a621b8d000000b0062ac1fab253mr9564031pfb.31.1681175211774; 
 Mon, 10 Apr 2023 18:06:51 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 36/54] tcg/i386: Convert tcg_out_qemu_ld_slow_path
Date: Mon, 10 Apr 2023 18:04:54 -0700
Message-Id: <20230411010512.5375-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: 8iloN/UPTRyn

Use tcg_out_ld_helper_args and tcg_out_ld_helper_ret.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 69 ++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 41 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 2b2759d696..0b3d7db14c 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1909,13 +1909,37 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
     }
 }
 
+/*
+ * Because i686 has no register parameters and because x86_64 has xchg
+ * to handle addr/data register overlap, we have placed all input arguments
+ * before we need might need a scratch reg.
+ *
+ * Even then, a scratch is only needed for l->raddr.  Rather than expose
+ * a general-purpose scratch when we don't actually know it's available,
+ * use the ra_gen hook to load into RAX if needed.
+ */
+#if TCG_TARGET_REG_BITS == 64
+static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
+{
+    if (arg < 0) {
+        arg = TCG_REG_RAX;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, arg, (uintptr_t)l->raddr);
+    return arg;
+}
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ra_gen = ldst_ra_gen
+};
+#else
+static const TCGLdstHelperParam ldst_helper_param = { };
+#endif
+
 /*
  * Generate code for the slow path for a load at the end of block
  */
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
 
     /* resolve label address */
@@ -1924,48 +1948,11 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
-        tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
-                     (uintptr_t)l->raddr);
-    }
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
 
     tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
-        TCGMovExtend ext[2] = {
-            { .dst = l->datalo_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_EAX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = l->datahi_reg, .dst_type = TCG_TYPE_I32,
-              .src = TCG_REG_EDX, .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], -1);
-    } else {
-        tcg_out_movext(s, l->type, l->datalo_reg,
-                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
-    }
-
-    /* Jump to the code corresponding to next IR of qemu_st */
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
     tcg_out_jmp(s, l->raddr);
     return true;
 }
-- 
2.34.1


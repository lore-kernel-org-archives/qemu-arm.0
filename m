Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp185520ejc;
        Mon, 10 Apr 2023 18:12:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350a2oBqBiLWxBWMOQEDW/muuJ7GsIzOMa4Fs/DvbgZsDDTfST/kiMfC8L1AUfh5g7MFJWbOU
X-Received: by 2002:ac8:5a0e:0:b0:3e6:4980:6f7e with SMTP id n14-20020ac85a0e000000b003e649806f7emr20599274qta.63.1681175530461;
        Mon, 10 Apr 2023 18:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175530; cv=none;
        d=google.com; s=arc-20160816;
        b=Mp/hZsPKaUmc+Q2eDFw3rLj57xHAvF/5HTkyt+ZUz7BgWk5EXKPLncmlw7WVgykG7o
         GX3fB4e+KnK5+zARWS5l3jRBLEPDtLDyKnUq070669nGpBn+TTMsj26pA8iaT+cqxAR9
         JhKaNLIoPk46p3WJL+N+jwCjTGxgTqIQVwgcK/t3zJVDN2ghGv5l8nDWeuaGM55ZQFMl
         pg98AUneWnPz4IPjIRFAILlPxHoXsZDhikRn/7jTiuqrQL9By1nqY5gNy9m1CV4t+xzr
         SaJChkTrPvwujH9gtEwCH6H2h5hDj262YdHsIBzfIQLjOaOilihY+xzbWJFxBcgP+qek
         +Ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5J9WnKoP/achPPxDvvdy6db5RC45T9pDxYTjKllqyCI=;
        b=nLgU6+JR1oSA+I7IRK7iKsvTHguYjE3OSoiZtwMfbCz576KTu8rF/wj25ZfldsxzV7
         yaNhFQgx/WNQUiegCEdZFeKKrX2zYQvHzOn3rhD2lWgG1qbnsTt+KwQ/8PpNBjQfCgLA
         vBHEhEvxMEJEUjYJsl9JYT19oVMuxHp7CcBrd7t/X50Q5InzEbcSsKj+S41fnKNHdjVC
         RV5QwP1p6PCNtMS7pQXZUC7+dXJFYN/gKQ7hNpdlwCu1XM9tGQofSwTIyt9SpFJEER9V
         /3G0xU9t4szSKmHouwI8B5mAnH9LL0jE41tDqxGvHB8MqmcN53vD6lX6Cl4CyNbWlwlZ
         ucYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gM2zaxIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s37-20020a05622a1aa500b003b853f5797csi8518667qtc.335.2023.04.10.18.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gM2zaxIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2TP-0007xU-5L; Mon, 10 Apr 2023 21:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TK-0007UO-Qr
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:58 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2TG-0000V9-OE
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id la3so6098456plb.11
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5J9WnKoP/achPPxDvvdy6db5RC45T9pDxYTjKllqyCI=;
 b=gM2zaxIaMVwFgvxdALKEIdCdqSGTKyg6Gf6jozAu8Ad+D3h+CvpfRxNXJMqqX2YaVy
 OPsDpQxf03MYwPM6548KtK1VSn+fTHhPwUW/dvrXtCMYg1mszHszD/tmgMLQLJ4M2SIZ
 +GgpbNHgqI2jV9sBFiNn8b14Mi6zCwzTOYg09R2FWma6HzAlvwGkuRS6aDdKVZ19cDTV
 XFFD6dIWLD4MMol8DD7YBpcvTHLsNezFs11kk8YslfB7SoGFtYzIYMCs8esAlGFdNeZ0
 /GMscnf5OGAN56blG6TjjHElI6MePIRiVq2a6h0bw/P5l8FFlwti4XAirNhhJVhALYnj
 chZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5J9WnKoP/achPPxDvvdy6db5RC45T9pDxYTjKllqyCI=;
 b=C8mKiXZdgpiFe2PMtXe+KqQJu5XKKajRhlxcAgovHg/V5vblicuXB72T3HxMvP7Ubf
 3yMe/gr21MRxXu6r5Dsz4gFzxe29qgJDmRrWrS0K7Y0eksO/O6lfHb5HXoUjmiILVJcx
 aVOw8nZ1QFNZY1EPbqo4BFvZ1zMZoV8uVgQxuLWhIvNpJWAQmUAe3LdIHLDF18HVxA62
 Rrk6Te2ZiG2Mv98t1S44yJtVqi81gdF0M43/IRmwMPiR1YfvyNMZxpxW6g+n/eacUFvM
 f0sSiPfUHAat6K5nbL/DMOzW6AVWOIrxgsWbVFHao97D4zOiNqDzdgjXWuetrAO9NJKa
 OEVA==
X-Gm-Message-State: AAQBX9cZ3yiufyANJh737V3ataUtXbH+svx2emHNYDOlCK9gxq+qVVgV
 +CqwtH5Wx+WjgJMoK2oXnGF+og==
X-Received: by 2002:a17:902:e5d0:b0:1a1:b52d:68e1 with SMTP id
 u16-20020a170902e5d000b001a1b52d68e1mr19196392plf.32.1681175213816; 
 Mon, 10 Apr 2023 18:06:53 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 37/54] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Mon, 10 Apr 2023 18:04:55 -0700
Message-Id: <20230411010512.5375-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: uyeW1lzs4UCa

Use tcg_out_st_helper_args.  This eliminates the use of
a tail call to the store helper.  This may or may not be
an improvement, depending on the call/return branch
prediction of the host microarchitecture.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 55 +++------------------------------------
 1 file changed, 4 insertions(+), 51 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 0b3d7db14c..f05755b20e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1962,11 +1962,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
  */
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    TCGReg retaddr;
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1974,55 +1971,11 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
+    tcg_out_branch(s, 1, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_st(s, TCG_TYPE_I32, l->datalo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        if (s_bits == MO_64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_sti(s, TCG_TYPE_I32, oi, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        retaddr = TCG_REG_EAX;
-        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
-        tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                    tcg_target_call_iarg_regs[2], l->datalo_reg);
-        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
-
-        if (ARRAY_SIZE(tcg_target_call_iarg_regs) > 4) {
-            retaddr = tcg_target_call_iarg_regs[4];
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-        } else {
-            retaddr = TCG_REG_RAX;
-            tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
-            tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP,
-                       TCG_TARGET_CALL_STACK_OFFSET);
-        }
-    }
-
-    /* "Tail call" to the helper, with the return address back inline.  */
-    tcg_out_push(s, retaddr);
-    tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_jmp(s, l->raddr);
     return true;
 }
 #else
-- 
2.34.1


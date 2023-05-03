Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652091ejm;
        Wed, 3 May 2023 00:07:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5bT1+tLu/s2+zMEBtrpT0yvu9r+NwCTCoj1l5HfD0CAopNFBWg0C/dxX8fUZyxwfRk8X/+
X-Received: by 2002:ac8:7f42:0:b0:3f0:a6f4:e6f8 with SMTP id g2-20020ac87f42000000b003f0a6f4e6f8mr29240282qtk.8.1683097666178;
        Wed, 03 May 2023 00:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097666; cv=none;
        d=google.com; s=arc-20160816;
        b=foSTAD2OuXgC2KgWctfkyPSof8yAqJfgiVvk4kFosOJtwaVk5GG48Vv2cu8hEifzDf
         Vjum55yfM8rhhUBkmF+o/c2qU9O33/Plm0ozifB73gRE4Brrw1Psj9DldXZrT2NLo83k
         /hR38A8MbxKlznTAqV9lKStEq0OvOaH8PRi5wGhq8E3nuRB1Sn5G8JMXEqVPAWCNDNcg
         yjJorx5DL1xQzco717OeHHFl7IGlHGR4ovmblHx5mQ/hMoLZRXoVpYSAZSR3HXsdm2bO
         qaUSGRRkQcsqIyF8O1Yl4tCkBI4A6GWnejC/OItaC82z2jl8mKCMeAcsRGn4g/vYs0EE
         9MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ewFnkUTNHWv3ml5hxpEpLBAtom/3ry8DZlVZK1eg3mU=;
        b=VutB9Kp2Y9ZKH/RAeQ9yIF6L676J+n+bU39RGMwnZUMAjYmSDJJX2F3J+MQnm48U7z
         89NdXDOLZ9kxr7sWfbFZnDob58Ssd8EUFzGJGnxv3OYH2D21HfP1c5yXDPF4yK33uZh8
         Al+02ayVguwA2djSiqEBp3PKnl69Ez3F71VZ5KzxCu6qePDz3AUe8yivJlq9gbFcoKNJ
         0V3es8qM7beGKV7KuzGyvXN3kX7nugz97hQS4dv3Hi8HWR2MVdjuNfgwwzcpzFc6A7d1
         wMkpdB0k8oyGNJipVx6Z3IcWLXA8hrjim1vADiK1mNkOTNAVYaxw1ijXsrFB1OE/2+Ps
         CFaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lsu2Olw3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a05620a0b5300b0074e0ac37a61si18138060qkg.339.2023.05.03.00.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lsu2Olw3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6SM-0001la-Ny; Wed, 03 May 2023 02:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rq-0000GC-D0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:50 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RF-0001j6-Pc
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so47047095e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097078; x=1685689078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewFnkUTNHWv3ml5hxpEpLBAtom/3ry8DZlVZK1eg3mU=;
 b=lsu2Olw38bhaNNp1WGqffa0xqmpB2JJBxlP9N1086sA4Sm6sUfKt92eNGKllSXNNxM
 oCTGc0M5cYJ9pAxdRKMOM31w2kTK8NYgr3u/El98gaTKaUXabHWKds8cXYDSQPQt0IYy
 L05v1yroxeGBVisy/aQW3TUL2vobZWiPsnhhXb7c1xcCIJT5Dnvnq4WiZm7EI1dKdXeW
 LjmLQm7xtSkv4BhKUDn4qeZotuoWZzfioL8GmpfXfSol0PzjpQbQ2cCOp0oTNA+vnT4z
 6Ey8g6CHmA5oLAge9/apfOQPLiD0I5lZsEov9lN5gZOnrtpOLmXGcJxYLlK5WP9PrE7t
 QFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097078; x=1685689078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewFnkUTNHWv3ml5hxpEpLBAtom/3ry8DZlVZK1eg3mU=;
 b=VEq6OZOwlAejz15JHEUibHy86d3MuWOuu8MR+NG3KPelAtdky7DenuExW9rUWgCL+L
 zI4/4THveklossWtkQC0mHocBrRZe+j2/SR3Pfam1pBNJ1E4f2TvT/9HJY3fWcttmGnZ
 2/3Z7J5ydpyWcBm+u88WOyXWqvagIDEx2BEoeuVHn944bZQz3CS2WGk2O/JQqk0qNvkv
 4JGP8/Ppz6mRvLlOvfVrAQ5PCa0Jb/hZzRk57nHk0Y/rKX4xR967M+EcyhNzE8NKazh3
 fDcPCvpjfTPy7jU/AK10Rd5VSWDYIIcsgqxr1lZt7JEWE0AFRRlLWJntOTQQvfyReF3J
 66nw==
X-Gm-Message-State: AC+VfDw+YZpS/a9eqTjW2GnuALM6pWwm0QVeKrXiDd1YGH0a+EqeUuhS
 G0LdcSDvSr0CCdhfRnJIqz9/LEgGWzZDHTvtUvsGVw==
X-Received: by 2002:a1c:f20f:0:b0:3f3:888b:ab78 with SMTP id
 s15-20020a1cf20f000000b003f3888bab78mr1106225wmc.37.1683097078228; 
 Tue, 02 May 2023 23:57:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 36/54] tcg/i386: Convert tcg_out_qemu_st_slow_path
Date: Wed,  3 May 2023 07:57:11 +0100
Message-Id: <20230503065729.1745843-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0W9Yhe+z7cyz

Use tcg_out_st_helper_args.  This eliminates the use of a tail call to
the store helper.  This may or may not be an improvement, depending on
the call/return branch prediction of the host microarchitecture.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 57 +++------------------------------------
 1 file changed, 4 insertions(+), 53 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 17ad3c5963..7dbfcbd20f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1854,11 +1854,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1866,56 +1863,10 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_branch(s, 1, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
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
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
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


Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2658974ejm;
        Wed, 3 May 2023 00:23:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4E+SmsvJj+R0rkGLIhamP3+ton/Jq3AF+Ucju4yFpBglKQZHJ2+Y1jKuPPweo3vsvqKOvA
X-Received: by 2002:a05:622a:649:b0:3ef:3bad:6d24 with SMTP id a9-20020a05622a064900b003ef3bad6d24mr26735950qtb.47.1683098590878;
        Wed, 03 May 2023 00:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098590; cv=none;
        d=google.com; s=arc-20160816;
        b=V7co1zEUpCcreZDsLZEpa6ap215BEWBfdCUpEb73VOXWoLZPsSj94R8+/19Q4AFGle
         OtBZEH/d2ebGEq9/yLgrdUp+JdJyO7ClfkAs3bDTwVkkg4CFrG9qIzKqNo0Tmok0GKCS
         5qpklyjaW2KyMND3kljDb1r7HFLLIQhEHQVaccIbt7iaSsAvzrRSb5U0LbGXB+mABsau
         yauU3wUmWi5IEHsSgizHlkHRESUkN53M3SardWvNDjxpULIo2HdgGw1rcOfDGU0J68wv
         blRj3kR3FR6AVYmwu+Mx1EYHNgoe0/u7fdQC9LdWcQPm60B2ONdRbl8Ho16fxsoSgNSB
         B5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pkgYs/pHlLvep4nhbNf+04epzdD+G5zrqDmAy5YX7Hk=;
        b=eVW+KtWdYo9RLX5iwhoVaVZoJ8VS6JM+0LDgSJjkvFNU68B8HtHqKw9Uee66JxtzoF
         DKPY4avnAEboi3T6H2MIcUFiDhnTctj70xBzXb0m+gWdEcRNzn9mSCt8Ymcut5MdbBJ5
         9w9bAHRUFZ3eCO0bBNV0EJ1QOAhHd2cLvyfUB3+VE98GZ7BoaJ96avCgfQrwsaySyWQ9
         kDK7loVbfji/cgmymc0d6UphSi6cxwhia6hHDQ4tqfRMzy3AS1kwX+Ojl7vmePtrc0BY
         pgwZlE0fteMDjpmpnl38zslPwPs8Dcr7TVkIv2gNmvxoOcMSrzRPqs1Zk0ZLcFwswDFB
         KFhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3Ry9I0y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020a05620a40cc00b0074dfe49664csi18855065qko.735.2023.05.03.00.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3Ry9I0y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Qv-0007ay-4h; Wed, 03 May 2023 02:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qt-0007ZM-PN
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qi-0001hE-OV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso28956095e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097055; x=1685689055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pkgYs/pHlLvep4nhbNf+04epzdD+G5zrqDmAy5YX7Hk=;
 b=a3Ry9I0yxE+Y2E4PDGjX6zYkj8q7d8H8j+2SclJPDFlYrDPJG24wXKAveLJHW7BAKo
 vUmPzDxCyGEs9U2sAdWsF6EoHWHaI1SWtuHvbINu9GJtfAFsmvIV9vkLAxyag/trTS09
 RRRF9ciR3TpRixvWWcpk1sRk6gfXpenkPDGIJrrmeBJDp/rblUPaCFJiPb66ulEsTSDR
 nlBcBQW0hOOIWguEcl4EaxG+3Metl3vDSgYY2RBGhgzZ6qh1o6xuV3T7lOB4zKTlSKAK
 W6jnI+9X4BNUJ6TRfostTpQ8/RZQnUCifg7Oh6RMcZ+03s9/4ead832fgkkH4Jh1IR9E
 RvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097055; x=1685689055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pkgYs/pHlLvep4nhbNf+04epzdD+G5zrqDmAy5YX7Hk=;
 b=Ocbnzr8FcYwB4aGTfspEwc1aTCVMDCULxULK0gR/T2MOd+7eiav7xhShUSRHRgZ/xT
 xk0XLRjFL05soqdsNg5lqSKZcgqKYhDDj6QgaSyGeu09yycTwYYAevfyp2mDFdF6Xbcx
 /4+ZSREFykt5u8FA9M8hPnUjQu5VflTwfUm0YoVTAA5StvD0+XuocAIrXSxBXhj6DXD8
 e5v4AebHezfbTh/gcsg9Vi+HtY7E6jJCAHBPlda0ye7ziW/aw0SIM9tImUTbQRfrWg/o
 7e0aKNtHtbFigGa2qpU1QJKxvlEt13BUrbhcPpU7smKYau+BsBpB35sQAKgLfuPuqrnM
 oTnw==
X-Gm-Message-State: AC+VfDz1W0p3qnIW6628Td7ZCRdSrqXB+ztyzAlLy3g5shzG+7rAhlwA
 yCB62DctwKffTSO0z0ntwSmsg82Ph1VGTMRPHoQvXw==
X-Received: by 2002:a5d:5222:0:b0:2f9:3af2:47ed with SMTP id
 i2-20020a5d5222000000b002f93af247edmr13480896wra.6.1683097055410; 
 Tue, 02 May 2023 23:57:35 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 07/54] tcg/i386: Use indexed addressing for softmmu fast
 path
Date: Wed,  3 May 2023 07:56:42 +0100
Message-Id: <20230503065729.1745843-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: JvztirUoqIWJ

Since tcg_out_{ld,st}_helper_args, the slow path no longer requires
the address argument to be set up by the tlb load sequence.  Use a
plain load for the addend and indexed addressing with the original
input address register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 237b154194..8752968af2 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1837,7 +1837,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_sti(s, TCG_TYPE_PTR, (uintptr_t)l->raddr, TCG_REG_ESP, ofs);
     } else {
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], oi);
         tcg_out_movi(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[3],
                      (uintptr_t)l->raddr);
@@ -1910,7 +1911,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
     } else {
         tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-        /* The second argument is already loaded with addrlo.  */
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
         tcg_out_mov(s, (s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
                     tcg_target_call_iarg_regs[2], l->datalo_reg);
         tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[3], oi);
@@ -2083,16 +2085,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
                          TCG_REG_L1, TCG_REG_L0, cmp_ofs);
 
-    /*
-     * Prepare for both the fast path add of the tlb addend, and the slow
-     * path function argument setup.
-     */
-    *h = (HostAddress) {
-        .base = TCG_REG_L1,
-        .index = -1
-    };
-    tcg_out_mov(s, ttype, h->base, addrlo);
-
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
     ldst->label_ptr[0] = s->code_ptr;
@@ -2109,10 +2101,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     /* TLB Hit.  */
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_L0, TCG_REG_L0,
+               offsetof(CPUTLBEntry, addend));
 
-    /* add addend(TCG_REG_L0), TCG_REG_L1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, h->base, TCG_REG_L0,
-                         offsetof(CPUTLBEntry, addend));
+    *h = (HostAddress) {
+        .base = addrlo,
+        .index = TCG_REG_L0,
+    };
 #else
     if (a_bits) {
         ldst = new_ldst_label(s);
-- 
2.34.1


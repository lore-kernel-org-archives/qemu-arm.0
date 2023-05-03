Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652978ejm;
        Wed, 3 May 2023 00:09:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ78gCTicmffhzN2CQVMNtXpMm2OjFmxZ9Fn7DbMZZuVJFwXPv5It0ol+ZzEGT/HkHJF8Xm4
X-Received: by 2002:a05:622a:1d6:b0:3ef:46b0:80e8 with SMTP id t22-20020a05622a01d600b003ef46b080e8mr32499906qtw.19.1683097784628;
        Wed, 03 May 2023 00:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097784; cv=none;
        d=google.com; s=arc-20160816;
        b=0YTBbZCeDXnMsHp04BBr3jU0s8kUGvRmuivv7xDg0oc/FFlA+5uF6KryATAOm0Vsaw
         XLOEytGSWuiYFi6Su/CfiNeQeuEc3OQT+9lMWJm4O5x/n76KN2/P8Lik9EjipYNed0az
         563OX2olchV7NgUyHU/eGeqcHt9nzCbmd2YzmULZqacID2uPwLpteYNEbeSIBlg2iw2z
         7sf2TJOKLggahtouEXXI3vGcHQs+5LgnEKhVKTucWZBon/3wF9r/jX7IAuudESdDKiha
         vkobXNEmtOp2nJeqystngRYg/zOpBlfsRkOLUNk76aMg2ZkWDmqBtNZNjLY2HHF79Vu1
         RlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lbibCyTnr9kxedetkEeMeR0n/g84TcpVDVIMMTB9mS4=;
        b=fDiDsdVz5Jweoi0VEPm5ur39q6l9n3RO0IUc4Sb35pjBEuyn1n+SESrDWvsAuvBEPO
         2Q38CJkH+MEnLPUiuMWeEQkY+o+SaFmpdxcnja89K8EyAEd75QFgygsKZ1MH5ClR3/rs
         3k43ObdB9dEK4yfiFPxO3hCMibK+29Xg9o2jzfJN3C8WsZ5dbVd0X5MvbPRq2X2fmbX4
         x+mHpbTV8CTn/XJj/8FWKjCJYmxbtyEBWn8jSIOMgKUj1pjocHTzNZhZrNZ02ce/nnbk
         fZN2lPMTDzXw8H7Uh150L5eYhMBR4fB62QHJTfaTkinZ7TzTBOBpfupTmYseR9Yo30nu
         gXRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cujk5uo0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a05620a24cc00b0074dffa9bc84si18681708qkn.579.2023.05.03.00.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cujk5uo0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6b8-0000ur-6c; Wed, 03 May 2023 03:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aU-0006u8-Jm
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a3-0005jT-2A
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so30035065e9.1
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097633; x=1685689633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbibCyTnr9kxedetkEeMeR0n/g84TcpVDVIMMTB9mS4=;
 b=cujk5uo0cS3wrev1l1yyS8/Z9ALAiUePLuWendhDGafxK5Pn8UE9fi737stdRe971n
 ZJ5DxBzfu5pcDmaN7YRdnfOdjtEzBZMgJ/MgfJCf86VE/wab5v30oizEvK7umMWb1y6c
 wtD93PUD3NI8usE8nZuHa7ygSiEtSQtfLIs3MN9+C5KMEacnoiiv9GZf49LqUML6diG1
 E7LImcMVQF85JPkQuGDB5iLOJUVbTYw3h6uPXcueNI7esn7fbf7cPvf9jI49igKIshUF
 U4vpykI/1T0LMDrhcU/jV6rAcss2TaRPe1SJobtMadXXtWNfYqCOpqIOc0iqE9Tdk3Np
 9LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097633; x=1685689633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbibCyTnr9kxedetkEeMeR0n/g84TcpVDVIMMTB9mS4=;
 b=GsSeRdK4hG8rQ/AopdthseBsPhxqmHfKgRTexwBnWuIhsZ31yNdZ8ipmprmuI/ypOC
 jgn5c6C22iN/6XuzhLYekK5qLgAVa/sHTtxR+Qth44Z+epN4zoYjmySgd8Th7M7+EEKv
 W+Jqm4P+BkyPcH/6zFxkIBm4PEALOgVZ50+h1KGr7L68HH9ccryj7iX7p8hGW0rHoHqV
 /m+D/aHhUVRwG6JQIbk5ctQz0N4cDothQ083HbpNrP7drXc6wDdkR4yV/+T5ZKmzX9SH
 t8L9hlEcFQkMEpmo0GTgTmtiRY5IJ/UqOAqdO7bC4KE8T26GBb4R7verwiFwDhzNdlWc
 Xu9Q==
X-Gm-Message-State: AC+VfDz+3m76RzDlrzvnhpQQJaqTwn38LQNrGt11QVIDSKJhW0aGwuiS
 3+dxZ+9A7BHmY8HHBEFLH1oHOA==
X-Received: by 2002:a7b:c7d0:0:b0:3f1:75b3:60df with SMTP id
 z16-20020a7bc7d0000000b003f175b360dfmr13232821wmk.41.1683097633369; 
 Wed, 03 May 2023 00:07:13 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 21/57] tcg/i386: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:20 +0100
Message-Id: <20230503070656.1746170-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4cwoaIP/xwPR

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 52 +++------------------------------------
 1 file changed, 4 insertions(+), 48 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f838683fc3..e78d4d4aa7 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1776,7 +1776,6 @@ typedef struct {
     int seg;
 } HostAddress;
 
-#if defined(CONFIG_SOFTMMU)
 /*
  * Because i686 has no register parameters and because x86_64 has xchg
  * to handle addr/data register overlap, we have placed all input arguments
@@ -1812,7 +1811,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (label_ptr[1]) {
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
@@ -1834,7 +1833,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+    if (label_ptr[1]) {
         tcg_patch32(label_ptr[1], s->code_ptr - label_ptr[1] - 4);
     }
 
@@ -1844,51 +1843,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_jmp(s, l->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    tcg_patch32(l->label_ptr[0], s->code_ptr - l->label_ptr[0] - 4);
-
-    if (TCG_TARGET_REG_BITS == 32) {
-        int ofs = 0;
-
-        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
-        ofs += 4;
-
-        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
-        ofs += 4;
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
-            ofs += 4;
-        }
-
-        tcg_out_pushi(s, (uintptr_t)l->raddr);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
-                    l->addrlo_reg);
-        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
-
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RAX, (uintptr_t)l->raddr);
-        tcg_out_push(s, TCG_REG_RAX);
-    }
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_jmp(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                  : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
 
+#ifndef CONFIG_SOFTMMU
 static HostAddress x86_guest_base = {
     .index = -1
 };
@@ -1920,7 +1876,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 #endif /* setup_guest_base_seg */
-#endif /* SOFTMMU */
+#endif /* !SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


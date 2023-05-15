Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6558397ejq;
        Mon, 15 May 2023 07:36:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7cKfHS2fCo6f3H+Q7tiPoBf8aO57JO0FT1HulKlEK2YOEdwzDqOBC9ZsijuFiANAL24E/P
X-Received: by 2002:adf:e582:0:b0:306:3bf4:715f with SMTP id l2-20020adfe582000000b003063bf4715fmr24059168wrm.40.1684161393158;
        Mon, 15 May 2023 07:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161393; cv=none;
        d=google.com; s=arc-20160816;
        b=1GMeEcWb1PrY4X8K6IBFk7+89uMBMjlk88vYFR3jBCvX/Q3lYtpa7F3J4VYunCbBxM
         3PBs5Ql1tNHy30nBBzuLpF6hrdTsVJOP7wXMG3yTbIy5tTRO2kAj8OAHk4w4Y65QESG5
         WnG4WtXybio5mNt/dLWb6rHd+4QbqeUGmh+xZqQaz1TVup4pdTvOZnVS/+x5x2qpHXb0
         RH0lTA2hHjHOXwJMeWLXTEoJ+yhNN4i1ecxqJoWGItL9aJozAiMv532UFI/Lubc/ccg7
         UrlXtqIajiEMNSS8vKI0TfReZKMo5xCwzSz6fx6EPCURHG/G8+aBG/LRVfoM9UmO7bGM
         BhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0BFtx9KYq0Th2HWZb/BY+/P+rVcQ7G1nOi7Bio8e4oI=;
        b=zjBHseCWdoedVIdLzOLfxSx3dM6en7K+dFp7R+uzFh3kkgj1Py+IOE0qrS6qfhELgI
         rlOMm0Tu6+cqqc/nT0RuXpGh8Ge7TpOYCSd0ocMLL62tkp0bdRaSN4WYIpYkRYlD2cS4
         3MOODSXgrSK7WYy/M7hMoSx+gileN0+mu8O3tiuazSLc0ErkbjkRezZQTnOZU6ic+c5D
         5BEnQWLxsghIi8GYvqD3H9uSCvL1nBZH3SfwkFC+GQT5SQBIQWok/hDTN7rLeBIUH7kd
         MxQaL30daejBfteD2xyF3yX7lawTZjHb48B/Ju5tKoxsOBfMAXaBwiTxTjPgxfrJncRv
         dDUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0mLsNBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020adfdb04000000b003063969efc9si15008013wri.681.2023.05.15.07.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D0mLsNBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIg-0000gr-PJ; Mon, 15 May 2023 10:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xm-OA
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGT-0004vC-TO
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aad5245571so88101865ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161208; x=1686753208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BFtx9KYq0Th2HWZb/BY+/P+rVcQ7G1nOi7Bio8e4oI=;
 b=D0mLsNBOlB4E1d/QXUJ3CBVX0Ojzxk1EkB2fw7iVbK3DU/z78M4krW//IrJ+lEcd6n
 fss0ZJd4kuYXC8lNa9LV9aaSsfJtqyrJFAaUajrPSJPQSkr6AhZGy3HBH8QO7JOoCbIJ
 BA2Ek+fEGtlXV+zJKIPl2cuqwWk80EXh45c8vwjpNN8QbmbMpV/X2QOP1ZVCC7xPrPIV
 NyNL0Inu5lMZopsp/MhXry2d4DHxogEykgyN/bYmwfb5NbDLxUBARlq/rkWOGcQ6k07Y
 7lzouWjfz2hiFnT1Vsoa16i2byGf+k3IJM8R4LAMMZK03+aV2pOHMJSOBPqRJyBYZ8bB
 12uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161208; x=1686753208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0BFtx9KYq0Th2HWZb/BY+/P+rVcQ7G1nOi7Bio8e4oI=;
 b=fnTrV9ryhVTBnZPCHVZPdk4q1mcEXCfh4rL/cZSi3O/JqIbJFXJbhRcqSe7hM5VdDk
 uSt5njmpajLzy342q8VJQVw1K6DDl/iz8GDxTY6++a0X3czEIeJy+S9Uw4Bfx7OlBF8V
 rHMopWMAQFiYHBIHZB4dZ2eRfbAsZI1AmcxjO/uIK9CXeVWd5sUGcguXO8Re0lYEfa4u
 hBjXGFh9BhlD21EcpCtZSm3VnsT/kCLQQsvQFbia0O4TXaow8wfpg8WukiU2ysslDYAn
 iYjo99OGYDIqbqSykBuCbCTj38pT9gSFDFQZe0gup8nZgDOTcCp+45T6sPALwvT9ZHzI
 3Tlg==
X-Gm-Message-State: AC+VfDzh+3cRM7YXo1b5+h1jiMMrBtgw2ixthg8yGwLIJCkOGV13q60l
 4rWb/MrYqQBG7yg1QmqLna7Baw==
X-Received: by 2002:a17:903:120d:b0:1aa:f53a:5e47 with SMTP id
 l13-20020a170903120d00b001aaf53a5e47mr40736600plh.16.1684161207962; 
 Mon, 15 May 2023 07:33:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 15/54] tcg/i386: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:34 -0700
Message-Id: <20230515143313.734053-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: 5S5G2Lar5Cua

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 52 +++------------------------------------
 1 file changed, 4 insertions(+), 48 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 911123cfa8..21553f3c39 100644
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


Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650156ejb;
        Fri, 7 Apr 2023 19:47:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YKjXb/1nAFkX8FgVSJp0bP3VHsaJ1ZaifMFk0fn4s+pioN6zG2DmVAVjuhRwxWmphKr4pz
X-Received: by 2002:ac8:5996:0:b0:3d9:199d:755f with SMTP id e22-20020ac85996000000b003d9199d755fmr6871104qte.38.1680922078176;
        Fri, 07 Apr 2023 19:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922078; cv=none;
        d=google.com; s=arc-20160816;
        b=LbhH52J7m/Ku+oMg64LIm6BY2OTcS3TSYsU3BJgOdeEtassEhBcCyFuDV84wJKR6en
         hAJVwn9HvukTrHEVy5KM9Y1xeO1TfcFkoMzrHzPm2crj3TQ/4A+R8nROKedb7/DxSBqX
         NIslVi51h0Oxg4Da9TFmoi6etoDXStNyuuo2l+8euOkAIlqsIZH7Cd5fffRKvhScMc9G
         zpt2C7Tjy8uZkTvUUgkBy6x7f6c9dZn7M+TmIxTW1uedEfUSvgoYtc68cknJGSa/nuN+
         CeB5jeg64+Ap96y5Jhtuy8L5oTSsTeDJZM0GGGquUqYrIhklMf3SYgoiW1YCuEks7xdB
         Yoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a+sskExgwdL7kNpVsak9SGGYO2z60XgotlxGnsJ8eQ4=;
        b=hHzzYtO+nBQtE+xwY19+IZsndDKNS6yOksixwM8u0O7DJ+W4Qozm9lEKf1bHiX4HUc
         07JO+2E0UO6cstr6qp+Ad7Wm22+MIBbHky78PAyobP34cfzB5NgMeNJ+0W33W+aBnWJx
         7HWktcFm8lEyDXzRjHSCwR56RomraiM72/sZHRm4YO4Hy3JMxMAUfQgOyc4lqn9rCLlg
         aUlAOHmdYCXSvRU5Be1qDFUwasRS/spqtsWjB054kTDA5GZkH110C8OLlYe6ncj+oof6
         b1txZ1LLz3IwU4FRdh20iEcYGSaNsB8lpc86kME9jDHR3CunjrqX7P2itjxdZaSXHvty
         eUhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMg+zWyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a37ea0d000000b007485cc1b307si3523565qkj.721.2023.04.07.19.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMg+zWyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYd-0007lx-2q; Fri, 07 Apr 2023 22:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYb-0007jS-9t
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:01 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYC-0005ix-9n
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id ik20so250612plb.3
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+sskExgwdL7kNpVsak9SGGYO2z60XgotlxGnsJ8eQ4=;
 b=NMg+zWyTpPnkv92xpy0TqsMuGsnq389StBGMoJoeS6T6KNlye/fDUkgTavsroY39TD
 A62SNHueP0v7lyRqAFEbUNTfIpta5S33ghZcF63820J5W0frNqRiZV4SEzC4OiGXpKas
 Oaf9wPpFwB2YaiMZMCqa0oKvavvyvgX3FEhZPToI5fGLKIIqRdq1YpzJuZs1qD7GTZTs
 z0QSARu+3rw422oa0wiuclLHysBH3AW7Qohp6WGl+nDKAmR8/6j0WhwjDimHiAQGyEoW
 59xSWHLd1svgnao9scC/kX6VYid34lI9NhOtpD2SwOwrlm8d+k48UIYjR9sXHolcBbJ6
 WUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+sskExgwdL7kNpVsak9SGGYO2z60XgotlxGnsJ8eQ4=;
 b=Ye+s92xqtc5BJ/T+TmI+K1DL/AqY/ujG3LNUf3qTheXBkF4h0GIm0YhsXmnkDEXo7X
 dpt5+BUYxELfheFQX/hWXXwqo6nS+JP4FMaJz+ZH7G4zU8FN0oqxTQFxGnT+iaaEOgUv
 N4mOF7xoBohBJC6Se/3DBCI3E8JdRCjQyqrZ6zh21lG7fLhniQWZ3O6we5ugDM8m1NFS
 dw5ONuD9neXeA0j6iPn5z79jPFlT82j7NZ/ivjcqfhQm8r7Ns5ZsKmUj/be5IH6+P988
 TibNHZiAci/a3oeHirz8+fPmJBBix3jyn+u1ZV4qw1QdBul9muNsOMgKBxRuXYrFwmvR
 E1GQ==
X-Gm-Message-State: AAQBX9dRv5sR1BTD2KDFZ3glUllHb5dJIqV9aYbMVODUbdWvVMxZ8VOm
 uxdSLWY3G7VwMapzLmvI1/gq1w==
X-Received: by 2002:a17:902:d4c5:b0:1a5:1471:e397 with SMTP id
 o5-20020a170902d4c500b001a51471e397mr5209765plg.61.1680921815138; 
 Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 21/42] tcg/aarch64: Rename ext to d_type in tcg_out_qemu_ld
Date: Fri,  7 Apr 2023 19:42:53 -0700
Message-Id: <20230408024314.3357414-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: /RPqK5nNol2z

The new name is slightly more descritive as "data type",
where "extend", despite the c type, sounds like a bool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ec3cf3172..40122e1471 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1851,7 +1851,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 }
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi, TCGType ext)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp memop = get_memop(oi);
     const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
@@ -1864,9 +1864,9 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
-    tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+    tcg_out_qemu_ld_direct(s, memop, d_type, data_reg,
                            TCG_REG_X1, otype, addr_reg);
-    add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
+    add_qemu_ldst_label(s, true, oi, d_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     unsigned a_bits = get_alignment_bits(memop);
@@ -1874,10 +1874,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, d_type, data_reg,
                                TCG_REG_GUEST_BASE, otype, addr_reg);
     } else {
-        tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
+        tcg_out_qemu_ld_direct(s, memop, d_type, data_reg,
                                addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
     }
 #endif /* CONFIG_SOFTMMU */
-- 
2.34.1


Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2655194ejm;
        Wed, 3 May 2023 00:14:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4j+mA9E4365Uyk+X9lw4GZVZBn9EF987HzJl+OMa+gJQj0ZfKyIcSJ/dsTXI3jukylPW4J
X-Received: by 2002:ad4:5745:0:b0:5ef:512d:2d47 with SMTP id q5-20020ad45745000000b005ef512d2d47mr1717358qvx.19.1683098079934;
        Wed, 03 May 2023 00:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098079; cv=none;
        d=google.com; s=arc-20160816;
        b=q1kZsA1d5ahP5LNGxhH16ZGPZRvc14SNrjUvivJ6yflTPT9DgFJUswfJGVVFiEtBC3
         nX33OxdZsDABpK+9WRTNV2u9H19//9lgV1KgdGlvYt9FxD4jO9pbjXWJfQTX6lYWAGTR
         Y1BXLBEUYowWMwPDAjcPyWSW3i0vXwx9cNIxnVEKfqrhhblh/j+88BYxPmodSehX8Vkw
         sVUmfnyeqKwhucRG82ooe/IT4+UnO7OZ3k1gl2k8hvw/1FDtIxxFU/h4FD7WiAGW2zZI
         xL7PA2FLdVk4OHU2X2G0xzGzpjOrL6UULpjCxXngAwMcHXf2Jp8pWnygaffjAxkXkskz
         iCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
        b=OtWhm7TgrAZiHihPn6CbbakGUXoLsinxQWxlSXFl70YtK8IVcQSDVS2PAEUk62IebE
         FugN+ykS07H/eoBojkedXBHmQdRHccy4wglyZFHQ2HRkh7w7BeI38JEIR525r/qiR0SY
         csdM7sIUDsOTA6qOGfVWSPppDoGbsk0KwY8sH/qK2svw0t1I30VrBLM6BXqXwK97XfBN
         jrP64XjR+MeMIzHMVRfShkEwJEh2sJoRf3VMPopr3lxBWYRCMRyliqR3edSwwx+2Lkix
         m7vVEUR6wso/Vkq3NNE4oA5ssdkb9SQXZat4Ey+gC5gz99RIrwQdDQUAfyXvhqAxyRum
         8+KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dUe2Krwn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05621419cb00b005ef470c0f01si18171736qvc.374.2023.05.03.00.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:14:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dUe2Krwn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6SO-0001z3-W3; Wed, 03 May 2023 02:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rs-0000HC-Jr
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RI-0001jU-Mp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so47047405e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097080; x=1685689080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
 b=dUe2Krwnc2Ecg6ORjizGmVwo3UmEK7md8XYQU9QWikQYDjYRqwgSQW/jicI71II1yI
 hJaVgy9VMKVr88mt2A5GI6Qu/88ixUT58ypn4JO4eZe6ZHSjqCnPPUeOxvUa9KNZsSUl
 rYTSWRytZDV62vp7b8sL8pQxYAA9B0egAGKi+8jt9LlMJZbx0X6YpBdNKfo1njXaK7+b
 QgptjBGY3LXgxTS18SGRvbgnvD91XW/EHk97N943/+rLZt1yhnXT2ng40CfnnU9BRfpp
 wNWGMixuQAejwb75MUZaXsPk6ks+wO5P3eX28ewXf+ftzuByVcVJsYtloz3hI+JrWXMe
 UQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097080; x=1685689080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
 b=YxuDy3HJ0lD42lvFRjdD+SPzoBh4IcvavYfgmiQw7W04TgpVCfc7RGLrpKsgzJhTfL
 KMDMUh8/SMIsDnRrPKk445cQqNSrB9YINM9g7oJCa3Xegl0EaE3O4fv/kKmvqwYoO6kF
 Iw1w+sZg1Hz2BIHtwRp5Ioswk/WB4gXMCNRrxyG4Vbe28TWvUfP6NZOdf+1H8fpHa4HN
 G7LBkt2B30porHIo2+0fmI3DfeepDWoc86VuDyeOF0ssgcCEKxrSn4RoycqiNwMGVDRP
 r+ADNrxksh58RUmSDWbMKg7BY/iV/Hqj0xNdUgehjResoHzKCCE5wFutM8zVHtle2KLv
 XEBw==
X-Gm-Message-State: AC+VfDwIKTzKBWo6XUEyu0uIswPD6FtMHJQDYDF0R48WxUgEc+FZMZ3q
 S/wazizzHvzqzYLVGxP+cMf6KzZ6Faaym5UGAVmX8A==
X-Received: by 2002:a7b:ce8b:0:b0:3f1:806a:83d5 with SMTP id
 q11-20020a7bce8b000000b003f1806a83d5mr13401499wmj.20.1683097080402; 
 Tue, 02 May 2023 23:58:00 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:58:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 39/54] tcg/loongarch64: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Wed,  3 May 2023 07:57:14 +0100
Message-Id: <20230503065729.1745843-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: zspd47T/wvQh

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 37 ++++++++++----------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2f2c34b930..60d2c904dd 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -824,51 +824,36 @@ static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     return reloc_br_sd10k16(s->code_ptr - 1, target);
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call load helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A2, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_ld_helpers[size], false);
-
-    tcg_out_movext(s, l->type, l->datalo_reg,
-                   TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_A0);
+    tcg_out_ld_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SIZE], false);
+    tcg_out_ld_helper_ret(s, l, false, &ldst_helper_param);
     return tcg_out_goto(s, l->raddr);
 }
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
-    MemOpIdx oi = l->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(l->oi);
 
     /* resolve label address */
     if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
         return false;
     }
 
-    /* call store helper */
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I32 : TCG_TYPE_I32, TCG_REG_A2,
-                   l->type, size, l->datalo_reg);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A3, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A4, (tcg_target_long)l->raddr);
-
-    tcg_out_call_int(s, qemu_st_helpers[size], false);
-
+    tcg_out_st_helper_args(s, l, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
 #else
-- 
2.34.1


Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp185403ejc;
        Mon, 10 Apr 2023 18:11:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZlAqYBdjTqoYbNARo3LJ5OvTRskl6cVjBMH8wyVoAV7z9PoHkKaPTNImSIczw2ZTUZqCWI
X-Received: by 2002:a05:6214:2423:b0:5be:ec50:7358 with SMTP id gy3-20020a056214242300b005beec507358mr24765998qvb.3.1681175515413;
        Mon, 10 Apr 2023 18:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175515; cv=none;
        d=google.com; s=arc-20160816;
        b=VKDT0AdzcvsG603NNPSHsoEGA6Gtps7Ka0hgLlK6A14XhVJfyYfgaKSkQHDvdEan50
         kTVzO8KBRWLo/QcZGDTzjqkOZfIEsQvRMMsejgkbRxGU0GUfCWUaUaIoFCtJeiOM7MI6
         m3Q45/iy6CuWXHn/FH4TE54woC3KkrTokV4wSexeLoswwhdli3tDI2/X7oTfzyaK885S
         TqkKUK9l1SYIQutTVh5qap5Pd7Kg/pqSeoP1FZ0EykD+ZIDaj+tuEvLEIsux81+OVx1+
         FNXmFGzpjVwidIAHWsVw0EbVYYHvveaOzdjziTQTiX7hEbWMWlNEJBsQqBssm7+S3NBt
         Xl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HnK4BFECi7OHgKxYc+lfZT/h6gVPJh9T4yUQ5x3FKOM=;
        b=kXxyQZmV32Rh+L+EmXanBQwx5tRsWHeNbZPd7WRNmPgZ/nmt0rLipdS9KTNMFmLs9m
         p2GsbV0jW7UC8Z9H5xL2re10kQRNUbVrClkUHdYAWszWOAD96cg1MadxnHlc4SKHTDYR
         b3cNui8ypEfsT8lPFBgDfG4IMHnU3DOUnfaIm9sLKiF7EjpovYnqaVdBgC1VG40B2vHK
         eNvJrsvwpOjVnBc9T+vV8xi4labqv0104nJVsGrXmVDMNU5nWH+SvHUat4A+cAGSSxrD
         X0ca2Sk94wXYxSlGwpRaYmOnAReij8G+jFv9xmJUKiStSWHIMTlTNxlZbzHuOVe6UjPa
         IxAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eWWR9GIp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020a05620a049200b007486951647dsi8231423qkr.577.2023.04.10.18.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eWWR9GIp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2Wb-0004WP-Fc; Mon, 10 Apr 2023 21:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WX-0003yZ-Bw
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:17 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WQ-0001vn-Bt
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:10:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso292990pjc.1
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HnK4BFECi7OHgKxYc+lfZT/h6gVPJh9T4yUQ5x3FKOM=;
 b=eWWR9GIp+q1RVVQ+IMfttFoogEtW3T7uH7j/Znp6Z6W/IRuchKYx5H8Lb3fuKnppmK
 3S1jsVJdNJ0qXq5Gt4jrVmNZF+SdaZS4ezG2EHoONCyhucoPsb0p9ww3XUcLGIAcPtab
 hCwbX9V0Fvk5VCvWTmo9A+ob8BGfE4Eq84bPnbOx6fPefm9iTn4hCSJjgn3L8c7HBWGC
 w06y5EhLcULFCwWipLN9eWcgU3UAdP4I6aMVEE08PEHgEkX7STQwAIEioqoVRqDTVcV2
 wruxqtqcRGjapUDgGkScuLNOfg8Pj7fiy3GNEcCIe3rgBU99//7kx05FhQkEAuPZPCJw
 gwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnK4BFECi7OHgKxYc+lfZT/h6gVPJh9T4yUQ5x3FKOM=;
 b=XJW5MmoKg2ii4u5TdTr1qw8TkPYqAiNkaTAOSfDuw61MaKHZ2W1OAZHxKpsC+Cw/+w
 //Gev8sDBrS3lj9W0XFn/H/tuLWMLn+Qe8HhY2tmKjNU5g6XPoFKnfaWuGBZuW+FXChk
 8HXMlVYbOEtBNros5LfXnlH6ZJPdnyZTE1+ioXyT11CFgDMYT4R6B4rZPK4OyxN0KDp3
 YUdQJtGvIFV4fOHkzfHNSQYZKXQOTUDuP6HVxOJMW5+PRiCXcf1L6FUceSZ1xffVFEg5
 oD8wxZszibsp4bMgU0TwwdaifXYMybJ0112UH+cWGg03/PXO3EpRR6tUlzVcua5JQ4ad
 j7SA==
X-Gm-Message-State: AAQBX9cflw2ENPpbZLd4pyBQNqt6H/P9aS0obzE5wXY+5RVeEXvFenXX
 9jdSY4x1LtG7OEqrCL77xNl55ULXhv/v7rY9t3MfhQ==
X-Received: by 2002:a17:902:f34a:b0:1a4:fca9:7f46 with SMTP id
 q10-20020a170902f34a00b001a4fca97f46mr11108288ple.11.1681175408528; 
 Mon, 10 Apr 2023 18:10:08 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 44/54] tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
Date: Mon, 10 Apr 2023 18:05:02 -0700
Message-Id: <20230411010512.5375-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: c8tJUObIFK+y

Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
and tcg_out_st_helper_args.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d610fe4fbb..6d7b056931 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1784,26 +1784,22 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
     label->label_ptr[0] = label_ptr;
 }
 
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_TMP0 }
+};
+
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R4, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R5, (uintptr_t)lb->raddr);
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
-    tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_R2);
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
+    tcg_out_ld_helper_ret(s, lb, false, &ldst_helper_param);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
@@ -1811,25 +1807,14 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
-    TCGReg addr_reg = lb->addrlo_reg;
-    TCGReg data_reg = lb->datalo_reg;
-    MemOpIdx oi = lb->oi;
-    MemOp opc = get_memop(oi);
-    MemOp size = opc & MO_SIZE;
+    MemOp opc = get_memop(lb->oi);
 
     if (!patch_reloc(lb->label_ptr[0], R_390_PC16DBL,
                      (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
         return false;
     }
 
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R3, addr_reg);
-    }
-    tcg_out_movext(s, size == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_R4, lb->type, size, data_reg);
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_R5, oi);
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R6, (uintptr_t)lb->raddr);
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
     tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
 
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
-- 
2.34.1


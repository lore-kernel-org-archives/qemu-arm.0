Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884374ejq;
        Sat, 6 May 2023 00:25:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4lSxz/7SMIQEGPtveavmNACFTREjXU6WS2qLvBvOrkj80UxrIhRSgErcKO6j2qmYJ4FUBT
X-Received: by 2002:a05:622a:1807:b0:3e3:8ed5:a47e with SMTP id t7-20020a05622a180700b003e38ed5a47emr6510459qtc.10.1683357913341;
        Sat, 06 May 2023 00:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357913; cv=none;
        d=google.com; s=arc-20160816;
        b=UrUnq1Xhx0Iir+bjjJvTA60pZH5Zx1zYMd8mAM4SBPqZKaALx2EfwoS+fTOnpvm+xF
         AYxhrAdY/L1rdmfIcyJtvSUpdZR32oO5Jw49Xzuk+zZsSOvgu99dPTWWxAQCT8sWk9Pb
         R7ePie0OUVlzD9O4i9svw+PNcAH+XQlXQfQrIuyz5P7gHTBOiKMp4ls217wnL2LBA705
         FVXjbDl7dDz64bgFo0L2GBb6EILMxgzo/O2b2CtpSKgwoK9IHVbcEnZ/FQV5dZvOyuv4
         NR/kDXaX8rzDCYyzSWWp2A+d7nvauT5fqgxS1wPAPY1kFChJWVPPAIsS+8Vs7mb9Ltzl
         T4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
        b=CNAg4Zp+6j1fJhoABCbbwHErtRx0FQg2KblQ659HbKvY47grPcw2UbPcF8/vFRs9E7
         LmO0Kv2nNwH0elkws606xwe6PdWbQUszXoWGgoFdfKHFonfVxt5lzE5XF/gOP5Dkdid4
         9xEEvUI+UYXIragMci50Z+502ojxMWHaKEbMytsw0BfQpLGiTYaqZwWcffNGgD3/JiOU
         k9v+fh3ed9QDh+sUoeXzl8JJz5p/yKq2L2vOCeR4xmPCdiWTRaExeH6QSg9zgjPSQc7S
         OB3NN8yWbQAYsbK5qczHwUw4aEpU7kh0/zLBBNH6tilcxRk5QcSEixnv5ajmdxrKk+AX
         Z53g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHVcye5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a16a900b0074e06b49eedsi1287899qkj.156.2023.05.06.00.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHVcye5G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCG7-0004dE-3t; Sat, 06 May 2023 03:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCG2-0004OP-Pg
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:06 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFl-0004Ql-Hx
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so408895e9.3
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357768; x=1685949768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
 b=fHVcye5G3RY+8FuSS6nq+n9f05jzX3KflHRKycYoDbPpkxVTpn5Cn4VvuclAkN4Rf5
 zErNDuZvmIL2cM4QN8XEjMmOvdxvHD8K6/PLhmlcrkdW3m6XyyS+jO15jdL2lnNNgs3A
 UU0TYeyd0tryGJjXBPrLG7u8IXIFdBaJyysww4DjY/uGd8OCzCzFLa2KK0t3wvGgwGLx
 23GV7trlS/m6eON6jUXH2ofj3jK7sMU2Xu/uPtmxJtvtwM8TwfPg0paihzvxBtM78kOg
 1N1Ns5z/2X5Ksz/aRtb/WRH7Zj15eLXeWbsLDdbUNSAJnkiOFlibqzUJTXDQJSy8u6bo
 Se8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357768; x=1685949768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIdMYknenlDL6zEabJSzjI8eOseBt6FLgSg6Xk98IsQ=;
 b=cZQZwfTgedbDNxHocUNoHeLlLg77GdR2RKrEh13zIRvXZ2VWj+vsDWEH8VIOT61CbL
 1h850fsyCrpD3iCFk8s2lQeQrhgDkfH/VSfKicbhz0wM9JQOZt57udH4Y9rRfhOcRzm0
 mwLoD2qONenqESG0vcthMmHhCT61Crw5dtBALglmP7yxSvCqfPtiQVMXYKzM5DbIig2Y
 EeMpgJwpNwWbNasZw5lDsZpA33rQjckvKpuOk0KjOxNU8bvRMK4qh2VFLhkRMSxuVYOj
 VOw58RAz0+1PQmBBBXbaSKIqUxncOZ2uDIIVqQ4CJXTtO7r9ODB7IKGoXYA6cGn1f3kV
 cLLw==
X-Gm-Message-State: AC+VfDy8+Re5F034/8u8Imx5T01KR2ioa3ry3uU/BnSGvWLXS1W7CNNQ
 lTdt2It30qyuM9XKzv+xi4GZpg==
X-Received: by 2002:a05:6000:104b:b0:2e4:eebe:aee3 with SMTP id
 c11-20020a056000104b00b002e4eebeaee3mr2472079wrx.60.1683357767931; 
 Sat, 06 May 2023 00:22:47 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 15/30] tcg/loongarch64: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Sat,  6 May 2023 08:22:20 +0100
Message-Id: <20230506072235.597467-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: hTA1zQNqVpfc

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


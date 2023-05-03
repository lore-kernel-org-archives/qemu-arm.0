Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2653762ejm;
        Wed, 3 May 2023 00:11:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vGfzFtHIk/ko4txIdXsgCZE4ZJpJ4ZCI2J5lbbAFxqx7LwZYlxR4UKDIMNfOrf7lh0UvT
X-Received: by 2002:ac8:5c53:0:b0:3ee:d076:78dd with SMTP id j19-20020ac85c53000000b003eed07678ddmr31787555qtj.12.1683097877240;
        Wed, 03 May 2023 00:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097877; cv=none;
        d=google.com; s=arc-20160816;
        b=QFXRlooeJxHoThlHhsh4m0HoPSfnt7SAi6f09Kn5TPmKKiB8C7tumjngyG9LTMXEOp
         ampaWo4eJufDhj34O6Kv4difLuiHERwOWK/r+8Xispb8UjLJ1gahhxu5xCRtK3NRJEGQ
         60bxg7Lzf+vPF+NvQnuQBAjRl3Ej+0CB/QW8krTymZqZGavoVgKrIeDuW0dc7jPiIEJV
         eVM584YXXBzNAJREiELlFqzHHFSIBwWZNMz1dExUjHp6GC5eYmfGtoqxwcb5PyoA/G90
         Tg+MjsxucWxBUoA7H5XudPlpeHeixuh+xe2R4+cd8Q2brALwnxdl9PhN6vbd/AabKabR
         VWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RwxIOwfcK07f8Ih0O3BZ3uVtj/nizIzXDkTDJdsGEMk=;
        b=DiFZS89c4znxxE9/Kj+tI133UBzuWENi9TvNsuyEvmRUTloO/DcxwLV/ErSvqKpr8F
         KA1KSVBNXYsHD7QnE2tbn33z2kwDDT7g+zgkNUv0Q+CRimiEJ6ap7OtYqEs6mhcW5/Yu
         4dCs9XBvzDphCRUMqV4zLg/ueaWIueJFYIvWI8JZQ2k88ZRgp+LHxRjhrKDLfHoTnr8Z
         45OCh1IZGPYxxsUN7NQY6DrO1/G8kpgtsIsCSBnamGTo1DJgWOAyYPz4UyHliZcD1rN9
         G8iBsQlw6mADzVQtywQemJ59DABMRAaGeqxfS5TUlatHGHKWM8OcCYS4Dd9aWO2QZSa3
         wg8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ar9PbvoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020a05622a048c00b003e4ea650fefsi18503270qtx.75.2023.05.03.00.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ar9PbvoX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6bB-0001JT-Qy; Wed, 03 May 2023 03:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aY-00079T-Mc
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a4-0005Zu-K3
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2938313f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097635; x=1685689635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwxIOwfcK07f8Ih0O3BZ3uVtj/nizIzXDkTDJdsGEMk=;
 b=Ar9PbvoXEisP7CprGBEplweyw1ndLyo4wA/3DQ2mgQuwfkD1lZo81FDOV9V6KSKf2/
 U+lNP943moxxmCET4sjKRGpFPz9dzbq7AIq1kWYIs4Tyb5/+oFGmL7ISYyUo+ReEogu4
 ZVZpUiIfEsF+7YjicK0mLD+egTz1YHpuZnkgHt2oxmTqwwguhZK6lzXPiC8HN50uu5UG
 b16JUmwmzlApGmhpEpxHNMsgmC+zCkz8/AL4nqee8S+CwFL8mP/mzDDRRFS/dJWeZWJj
 2rjB1k1PxqCiXPC4yRhhNbIFCJyAsua2JnyD28/uNfxXEMyzD5kSERz6Ofal8b6yNZMY
 h5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097635; x=1685689635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwxIOwfcK07f8Ih0O3BZ3uVtj/nizIzXDkTDJdsGEMk=;
 b=Hn0E9mZkVMUC88GYVjkhrNqL1YuZTz5cnNujBNFF2GnxivGVLLzoiTI7NB2I1aSy79
 pycBNZkovOUNKt8g6cm9JD+3JV39SSUIsOmZubUciuURwAhE0V8BN0fRXNGIW6xAozry
 LgLwNmGz+Tr66hP7a1pn7tKOhOLvHmMAoEv+/QOH2pdh7LFg9Jkp6DkPxizBjxBM8kaO
 p0ynb/tAnXd3y/gXKRYgajw/evifwKgHQe7C7KPQuGOKI81/TGLlKVgy8dkYFUqHYw8k
 TEqlTztgue39MODZZ5rbNeC0fftzZttKRDL3veyiAkSjBsOd0wBAhjR+JfhwcT/qKpd+
 Gs7A==
X-Gm-Message-State: AC+VfDzbsMX//3Cz1Z7KXl4LRq01SO8lFPjepmCtkb8x1GaSk9Qhn/4m
 m8SPLA7DkuybjaVE8GSoSLHvBzKEjHOWgJhCzXb1OA==
X-Received: by 2002:a5d:452b:0:b0:2fe:6b1e:3818 with SMTP id
 j11-20020a5d452b000000b002fe6b1e3818mr13618694wra.51.1683097635211; 
 Wed, 03 May 2023 00:07:15 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 23/57] tcg/ppc: Use full load/store helpers in user-only
 mode
Date: Wed,  3 May 2023 08:06:22 +0100
Message-Id: <20230503070656.1746170-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 0ykhfBQhQyo6

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 44 ----------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 0963156a78..733f67c7a5 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1962,7 +1962,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
     [MO_BSWAP | MO_UQ] = STDBRX,
 };
 
-#if defined (CONFIG_SOFTMMU)
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     if (arg < 0) {
@@ -2012,49 +2011,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_b(s, 0, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc14(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        TCGReg arg = TCG_REG_R4;
-
-        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
-        if (l->addrlo_reg != arg) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-        } else if (l->addrhi_reg != arg + 1) {
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, l->addrlo_reg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, l->addrhi_reg);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R0, arg);
-            tcg_out_mov(s, TCG_TYPE_I32, arg, arg + 1);
-            tcg_out_mov(s, TCG_TYPE_I32, arg + 1, TCG_REG_R0);
-        }
-    } else {
-        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R4, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_call_int(s, 0, (const void *)(l->is_ld ? helper_unaligned_ld
-                                          : helper_unaligned_st));
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
-#endif /* SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


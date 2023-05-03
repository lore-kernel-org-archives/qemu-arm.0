Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2654128ejm;
        Wed, 3 May 2023 00:12:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5asHoOvZjAl5dNytSevIyLetN/kNREyMir+vCY6P5cZ7fX1MQCIp92XlIT25MvoIGwY0wh
X-Received: by 2002:ac8:5a54:0:b0:3ec:48dc:4638 with SMTP id o20-20020ac85a54000000b003ec48dc4638mr28228706qta.44.1683097929247;
        Wed, 03 May 2023 00:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097929; cv=none;
        d=google.com; s=arc-20160816;
        b=nk2b6VOirGggdQI8vUHpYW4LHveVFklLmzwYb8t6+/OfpdydHnZu7ST3wLV5DToprp
         wL0rPfCUub68f2Sh0KAF2vE30UuulXvdWcnjKcQUThIgkPDtrLYC9SCokm8uDZpEMp86
         QbDc5MQwV11Hg+4YiPVS5F89gYdllQgk1dr7n+JClbepMhIpqTJ+cKa/udUjhCRJ7nlo
         ++XVZygqkSvxm8pqt9lMiYz1mSaZn6RaRIGdXFQs1sSfI6jmXKx/C7QaX5lYViRcWsK+
         zBCm1GfpP3r6U9v6JYfGosHzFqaJ9/JLonOahEOd8MTJh/8umQzKWm7553OzihHo7/qD
         RZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
        b=ODo2wgyLXw/ScxFAGRWHqf4G39iQl9IxPEqqJrmYOe6Coo4w+16CClvfemhLd31Ug5
         xG2OvHOSuMeFqSg5mEGYYlx9s/2jFquXQy82NfOQ7T8J9fg7ATZMVACt+XnLdLp6MHYx
         xdHojHsTed3TeWlx4DpCHnoE4kpknJ8zfoopI1xf+w50B9xOGkIqITNlkVuy/w6HmnV3
         AArhVC+JWo5KRQ6+hW/R6fIiFtCre0ouNDa17plaBJKDgMhKcK75ikqE7zD+8xPy15uQ
         CxXX172rf/Uqf1Y9sUBqDHNrGkjjudkVTDlIGe95xYiA03+NMq+UUKCINTwx5XXH3u9+
         6Khw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CaQjqtpS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3-20020a05620a148300b00753a1d53a86si105315qkj.79.2023.05.03.00.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CaQjqtpS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6ba-0003gq-Lg; Wed, 03 May 2023 03:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ak-0008AQ-JP
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aE-0005k0-K5
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:58 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso47408835e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097634; x=1685689634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
 b=CaQjqtpSDch0Exsm8wEG8Gdb9dWKcyj8xeVd9MEC/vB96p6Hd23o/LlGHSzGg2acZy
 zilBP52CFOe2LQ8GsjwqHWUEFjfwQfI6WP/mPrdzq4tubr7u4OyCA9aHwy+f0Q9wA7lN
 BCyPRZtKgAMUiRIRJ4CbSjHsLASEeW2M5eeR+4CGNvHPXJypFN2RL1Oq19sVS+3+ni/i
 edGh7iugrEyZ1u4MUr4O7b8MtFUz09VfK3xhVzBnMlp0PYOA4ocGJ++W4k9dgumZFHtK
 NGaagHS/dgtuOTeWYwouQVgSsku7qxBe7ZPcTOZyJth6wVMe6crRYTLipdWRap7GoAmm
 b1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097634; x=1685689634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5j/yMASWGStjwMM59Hf05R5CdVFVYJotd2cRr9oH9m0=;
 b=JoxG+YpN2vnpkk2e5QJgWvmDmfCYU+aQw1xLBENg66sDcK7+hwaAU+/OwC0m4E4XZZ
 IYEyUupymbrTJJ7QDE4sPveaVCCj8lorbXwhe3J99vBZKQNPNkoO/+/dbitjDfmyN+rm
 h3W+6AUPlalmRReZhQI773B9riceAI/RSCcnUrF5qCWnUpL9WTcaWT8a/WUzcoESB3dE
 ioJ69HXtEE5cXT0hnxLKw7lvQrxj8DdaXhR6POKXEjZ4JQffXylUJemWSKWPB8ztYBzT
 EVdp6XJT8XXex3tpDbENWNIFXHZlaP90prRXMG7xVEPSl7hijT5TjGN6dzVcjWRxQAOL
 o7hw==
X-Gm-Message-State: AC+VfDyhRj9r5R051mpevHx94pyy4UlIO0d+4os2jrwV+zbE0MyuCXzI
 CaGy7+ci6QJ5AzDs20lASdkFfA==
X-Received: by 2002:a1c:7912:0:b0:3f0:41b3:9256 with SMTP id
 l18-20020a1c7912000000b003f041b39256mr13784978wme.10.1683097634480; 
 Wed, 03 May 2023 00:07:14 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 22/57] tcg/aarch64: Use full load/store helpers in
 user-only mode
Date: Wed,  3 May 2023 08:06:21 +0100
Message-Id: <20230503070656.1746170-23-richard.henderson@linaro.org>
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
X-TUID: HTJ1v8T0wbSz

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 43acb4fbcb..09c9ecad0f 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1595,7 +1595,6 @@ typedef struct {
     TCGType index_ext;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_REG_TMP }
 };
@@ -1628,40 +1627,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-#else
-static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextract64(offset, 0, 21));
-    tcg_out_insn(s, 3406, ADR, rd, offset);
-}
-
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_X1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_X0, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_adr(s, TCG_REG_LR, l->raddr);
-    tcg_out_goto_long(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                        : helper_unaligned_st));
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
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1


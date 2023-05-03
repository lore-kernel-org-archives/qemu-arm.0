Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652391ejm;
        Wed, 3 May 2023 00:08:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dMclrI8tTzkvVZS6c3aa4/h1IDnb05GQK+vxDZ7C1HLTchXGFMM+c/nujI6uswlZnJBtL
X-Received: by 2002:a05:622a:204:b0:3f1:f65a:3b5b with SMTP id b4-20020a05622a020400b003f1f65a3b5bmr33739885qtx.56.1683097703575;
        Wed, 03 May 2023 00:08:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097703; cv=none;
        d=google.com; s=arc-20160816;
        b=NEu7YgqSO94UMjH7WIAw2o0LTDjb53fbSOfvm7QgJPVMRPWW58I2XHsuMD4h0ggs1n
         EtCAXDAhd03g6M03zRSqIkXLb8sDqCNJwn3U1vJWEC/rWU5P3A7zeUVVoS5TzxDV7haV
         eJH/vrOVTxBjsrlk9v0IE+fV3GvbY9xerZLRiAxJS+RQ7Le8thISCj6RCMryVSC0LZRl
         Vp/M467mgCt9ngVbxyUsWo4T3ynaJY39ebup/52n9WZBG2vMD5YKcQ4VNV+qGoCGDcPS
         kl0up3dwr6XlmoWt2SPJx1PJ/k1dr9nW/BcfwxzmnyxH8AzzsVU6T14Dv/i913TQd2do
         Sotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
        b=l2QbrLRnxsyu6AxCvhvBQrS1Qhn5IRmt0aDwtaJ2QgN9a7jv7TNCi6YSoqUqOvQWwQ
         KTDOL8g2q811jgLQO0nWgd9xXyBLdUd8H2VbpPfbYqDD1YLVXxvMAPa1nhmpHe5H0IAX
         ARFdJmmejA2xKw91C/WQlN93dyi2S9vC3MfXAG2eY5Mw62AJguHsoN4BGJxGdYRVkT2H
         HLeLYMJ5Z1ob8EjeIsCng9wpGcuQ5CUnIbNFCGmqQRtYRxDbCoKurLArlFS07Xq78dI9
         QAyf0yXdFhZtIfC8p68WQkZuC1+KiA8QPh5wOG6jwaryX9xAiyMAjypbn44LSA/XlzDR
         orSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vtLNHKej;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn42-20020a05620a2aea00b0074fb646790csi11687523qkb.631.2023.05.03.00.08.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:08:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vtLNHKej;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6ac-0007fS-Ab; Wed, 03 May 2023 03:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aG-0005NG-6z
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zv-0005fL-LO
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:07:26 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f199696149so30070255e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097626; x=1685689626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=vtLNHKej1AzcOUVp1vynR2qHc4G9/A0iKxMoBgZ+HEJ7vpfwyeKWxExBJ7XLfE1DMx
 ORziHduyMmZH00l4nuSlJtv0QFYhdL4ekVd48KXyRqBbzvMgku08fNJaFUqsV/xfZzEP
 N/RThaTTkhKUxu0iQBKlQwucNPG1YNb3idySmGvgeUbeaLMB4vv3QgEDYbX6dgkHnjoe
 /oLjR0eELxjJhhcV1r3MnxydusE7EdJiCkZaUG1B1cU3MKJWYFQJywMyq0lOYAf2jGuT
 eRiZucIVnw+HHcIOJi7NRzZCJkrxJsFHgG34UHqHMnpe8QAf8Bt+SlCcthFJUrYLBgMY
 7IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097626; x=1685689626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=SOV5A2KxDj1y2WnFpqnpKDxg9v+W5WqtUd12ydi1s7b7il64nTRtbNxPjLOgdcoBHw
 DcrNdZZxszYJ32xPuajsmOd5IrF9IuP7gqAdrSAZ/zV30QbdLW4ToR/nkXESzhUk6LP9
 FiyrB1QFrGWRC1JpeNNru3UMpYLHMrajDjF7MZDtMkP/9hK+3h0sPTaVaMZg1yPpW8Kp
 juvYX3uD/MjxP1CfRg7wwu55K1WU5A98I33taEwn6pk6k9KOTFj1iM1uzjk/WQAdRA1u
 MHh+95H0rRPMZSKQH6L6FjOoLe1+HkztfIIF3IjrtxDjTAvt7dnWIqqfQzBb+UZuWNYX
 2jKQ==
X-Gm-Message-State: AC+VfDy9NpHqPtvKBa2A4U0OHkI8B4hRnCDbU9oWZ+XswDTbRIdK9wGw
 pCOZSHKVGn8fMalqzfBUsToULQ==
X-Received: by 2002:a05:600c:2309:b0:3f1:72e3:576b with SMTP id
 9-20020a05600c230900b003f172e3576bmr13946918wmo.26.1683097626139; 
 Wed, 03 May 2023 00:07:06 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
Date: Wed,  3 May 2023 08:06:10 +0100
Message-Id: <20230503070656.1746170-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
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
X-TUID: dS8hnd9a9ST7

We can now fold these two pieces of code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 89 -------------------------------------------------------
 1 file changed, 89 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5bde2e1f2e..15f2f8c463 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -292,7 +292,6 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
-#ifdef CONFIG_SOFTMMU
     switch (mop & MO_SSIZE) {
     case MO_UB:
         return helper_ldub_mmu(env, taddr, oi, ra);
@@ -311,58 +310,6 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     default:
         g_assert_not_reached();
     }
-#else
-    void *haddr = g2h(env_cpu(env), taddr);
-    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
-    uint64_t ret;
-
-    set_helper_retaddr(ra);
-    if (taddr & a_mask) {
-        helper_unaligned_ld(env, taddr);
-    }
-    switch (mop & (MO_BSWAP | MO_SSIZE)) {
-    case MO_UB:
-        ret = ldub_p(haddr);
-        break;
-    case MO_SB:
-        ret = ldsb_p(haddr);
-        break;
-    case MO_LEUW:
-        ret = lduw_le_p(haddr);
-        break;
-    case MO_LESW:
-        ret = ldsw_le_p(haddr);
-        break;
-    case MO_LEUL:
-        ret = (uint32_t)ldl_le_p(haddr);
-        break;
-    case MO_LESL:
-        ret = (int32_t)ldl_le_p(haddr);
-        break;
-    case MO_LEUQ:
-        ret = ldq_le_p(haddr);
-        break;
-    case MO_BEUW:
-        ret = lduw_be_p(haddr);
-        break;
-    case MO_BESW:
-        ret = ldsw_be_p(haddr);
-        break;
-    case MO_BEUL:
-        ret = (uint32_t)ldl_be_p(haddr);
-        break;
-    case MO_BESL:
-        ret = (int32_t)ldl_be_p(haddr);
-        break;
-    case MO_BEUQ:
-        ret = ldq_be_p(haddr);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    clear_helper_retaddr();
-    return ret;
-#endif
 }
 
 static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
@@ -371,7 +318,6 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     MemOp mop = get_memop(oi);
     uintptr_t ra = (uintptr_t)tb_ptr;
 
-#ifdef CONFIG_SOFTMMU
     switch (mop & MO_SIZE) {
     case MO_UB:
         helper_stb_mmu(env, taddr, val, oi, ra);
@@ -388,41 +334,6 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     default:
         g_assert_not_reached();
     }
-#else
-    void *haddr = g2h(env_cpu(env), taddr);
-    unsigned a_mask = (1u << get_alignment_bits(mop)) - 1;
-
-    set_helper_retaddr(ra);
-    if (taddr & a_mask) {
-        helper_unaligned_st(env, taddr);
-    }
-    switch (mop & (MO_BSWAP | MO_SIZE)) {
-    case MO_UB:
-        stb_p(haddr, val);
-        break;
-    case MO_LEUW:
-        stw_le_p(haddr, val);
-        break;
-    case MO_LEUL:
-        stl_le_p(haddr, val);
-        break;
-    case MO_LEUQ:
-        stq_le_p(haddr, val);
-        break;
-    case MO_BEUW:
-        stw_be_p(haddr, val);
-        break;
-    case MO_BEUL:
-        stl_be_p(haddr, val);
-        break;
-    case MO_BEUQ:
-        stq_be_p(haddr, val);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    clear_helper_retaddr();
-#endif
 }
 
 #if TCG_TARGET_REG_BITS == 64
-- 
2.34.1


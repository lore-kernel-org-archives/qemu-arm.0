Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6558443ejq;
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VjSLjFySjmW1aMe+OOVhcr+wlHKSsrr/tJwDKhZvqGHPMucUONlZ15I3qB1eQoR4z6AjU
X-Received: by 2002:ad4:5ecf:0:b0:61b:7115:559e with SMTP id jm15-20020ad45ecf000000b0061b7115559emr51068832qvb.1.1684161396235;
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161396; cv=none;
        d=google.com; s=arc-20160816;
        b=UO9ABfJnn0Z8fWoAMcDWUFhWQwtizAX5MET8Uqf6MJWpbTGHNeAPs6EeFBlPqr+z7w
         BJgr0MVFcHuYBJbvBVInz8/GkmNkKqnunbokiPsa1tcoFiiArxgZrM/kgT8ZP0G2YBpz
         GV7DqUdsUY/ulvz1duJmpI5PCAFfm3rHuti1YraZoKcQKcO0LCdNqDfvcTTz3d7gJ5d9
         WYj76XA09gRKPGhjoM0nkqlca81bKxsWifJ6i8TLw8C2kpS3PWEkjE0V6LAAY/Hy59Q4
         s8h/yCNM5aL/vl6IoSXNYoSfUYqnVwGttW5DpPzbbMRy64zGD6kAbK4TynK+4xwo+4sS
         cPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aZUd62xGtvRPa1FRa9Mi8zYQ92RuZVwVBZs3Zj8eEbg=;
        b=WCj2cbx+5YppjeG4MzHxWcqJ8I0U4H2KS+/Y0alMD6zbKBdeKPVZ8ieK3ZGFA6VN3J
         D3oHI2ejc7Bri2nrylU2vzDfKUAEX/0xffoSIESHL0aIGo8HYVPfUI1C9Umk/6Bc6EsB
         OJwlbU0MxEzlmfB0OFcycghBaR2ZTl7p5OolfxbrCDaD++Z19a0hUVGcCBrmWOn++SWv
         hTs5zMDq9csh3lVaOrqSBiU5FrMjvB5SM7I1cO8IzzxhLCPhskYUEXt1WGRcpOneWFUq
         T/P5NbhLjxDmW3S5gvBpHyxu9+N/w5L3rN5NHZnN82jgGc+u0HmmYA0f2VvDTyb8gq6h
         izhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea8lcdlR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05621420a600b005ef5b0e47efsi9638344qvd.125.2023.05.15.07.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea8lcdlR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZHz-0007P6-Pi; Mon, 15 May 2023 10:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGT-0006jv-Kn
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:30 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGM-0004rv-W5
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:28 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaf91ae451so120241875ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161200; x=1686753200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZUd62xGtvRPa1FRa9Mi8zYQ92RuZVwVBZs3Zj8eEbg=;
 b=Ea8lcdlRv2hSkVaF/8DUszGBYxhDv6xHJp0xPkq3fSEgXjxuIa0QWJSh1ySSeSjVSr
 Ofkvf94pvgSODcPNNaT72VClfKVRjZYyWr4j2nQiQwware4w8uDK20fPbd4sk1FSac3X
 mvMLdTOWH7yZlZGKH1ikgNZoUUZxh4mLMas1IHQ69+QyzW+zciBegyPpo4LKOBMMwXVO
 cX9wYmxd2TgBoziBqnlXtJUyvIugzKFMc1/QXkXD2GuSKGxFHqzY7FUR7zGGttRSjVp+
 3AHpzfnhrWcqr3gJ2kabUeian7v5Wmuzn2FigljlrPLULMYl4O7tPaaUlTKFAz0Apdyg
 1iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161200; x=1686753200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZUd62xGtvRPa1FRa9Mi8zYQ92RuZVwVBZs3Zj8eEbg=;
 b=Xiw7iJQFzVGG1zff16scfsV/E1vBxjmIbhT4du7u06JQEP/1G1uyNmtMFk4k3eIL+8
 n+G2CFfxLZaYU6U2e0sZq7ky3Ty0UzDzHpz0ntaORDxT/nTCTVSqtFx4uYb6N+h12CvD
 M9IYWhtBh3MjV8gUiF/Bp4Msl2dzH8oB9vEHzQaU4JRERnSDvW/z838ZSEj+i6XKNz72
 8zyG7ivnmEcWo9WuBba/4SNn3p/872q1ZCUgsaUMxq83944UtaTDGyqxV28Qp/lvtP1N
 ZZ2YhD1fe2iL0I9PpOKE6MRc4mRWiuXpkru4K2rUFwhElTh0chNS9nb59MwB0GzYzrZ0
 3E4A==
X-Gm-Message-State: AC+VfDzvNbSsakzzQvce/ldktsK7sQhuMBs83L/QhPTtiIYaqUg3i3TV
 M599nb6NNoOrOpWjSxxxOQ/iiuFw8AQs9pen8VM=
X-Received: by 2002:a17:902:ce82:b0:1a9:9a18:345c with SMTP id
 f2-20020a170902ce8200b001a99a18345cmr42150632plg.44.1684161200358; 
 Mon, 15 May 2023 07:33:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 06/54] tcg/tci: Use helper_{ld,st}*_mmu for user-only
Date: Mon, 15 May 2023 07:32:25 -0700
Message-Id: <20230515143313.734053-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: r8gGL7JKXNzK

We can now fold these two pieces of code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


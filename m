Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720598ejm;
        Tue, 25 Apr 2023 12:42:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoNOnjKKn+V/BMovdBzR8hc9cNDcLIZw6As9byWGUVlPNYb+VOshVtTFnqTaBzt2ZWjhFj
X-Received: by 2002:a05:622a:1a83:b0:3e6:6c6d:94dc with SMTP id s3-20020a05622a1a8300b003e66c6d94dcmr34172993qtc.26.1682451768079;
        Tue, 25 Apr 2023 12:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451768; cv=none;
        d=google.com; s=arc-20160816;
        b=SLZtU2hmLQGzVlq5BNInMSssfBfCZyLGzP3CwIehXWl/PQg2kYeqHIYzH+6hWLpKzk
         B5QVQV8zS7RXPZdA8PfXOiAJPE4sMlUDYNAAmOtpRdmOiFwF5T0rcC9vW4GhyrNCkwdW
         2opgOb2MszpM27zxQbbWruBYl1ZaHU3xw+DLBOw2BIBB8sKl5iPHd3R+Ys/2494EomBH
         vHZ1ZDYTNn7TioNj6VIrl5vYmQURI0wuDoPAIhs+6wb4M9P7tYKcUKJt5LEffCqtPxGw
         cZrzFxVQW49ZnTI5OgM8gqdH94Z9suGJ7C+fNjE3r/X/ftBMfdeRx8DKj9MMxnDaN2DD
         4mRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
        b=TbiPpr0ww/Fx6LaESpc8kdokCf3XwkmUdfaKeCcdhvqJG1ENTP82hy5cX0L5Uv8nPM
         I1qnVNzlGoAXbJ/ZgPYDuFs5eZXojzj+BeR5F7kaCCoJ4N+WRUwhw719WeJNdTcaZZmN
         ZwQyr4FeukKbfHQOjyAvdYCkRsHdDn48y1Z++v00QhHc4exhT0yyEH1l4NFdHjpFpmn9
         WRNbq9JnLf8QESStJF5kCdg91UcglAKk5JVhgBKW77Np6k4zyHV5H2qKKYCM+FY3cqjH
         crKQRHd3JyEoYpOtNd6MZFZWsQXwVwISyHDnLJ35VFGPI6nGw/NB1sLDkQcEPP1w6HUi
         L7WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsdamwVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05620a430d00b00747a2434db6si9128907qko.770.2023.04.25.12.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsdamwVk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOQE-0002Ep-FN; Tue, 25 Apr 2023 15:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQC-0002Ae-QH
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:33:52 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQ0-0004UD-6q
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:33:52 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4eed6ddcae1so26819840e87.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451219; x=1685043219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=CsdamwVkbiauTYrARPNTLgxeIzdGS9bbIrRj2Ssr4tNCNn64tAWiTz64w4rbc2fGEi
 f8UXww4tGqehxaOxA8ttjIUnLSSEZv+6nlYhwh5CyKJh4e126cRgugXhy3lZIthWsNy3
 TgDK7l6SMoUV+ahKbJ4FyZl8AmemaMaVUCId/VkZO9EJ4sIN9IzjTDHgJgey3O7fbPXi
 2J2yeL48r6tzO0JKlMXzsFAO7MPUSsPBjZ5P74eHZEMrUb5d9OZaC7nABHp+BgkMY4j8
 TuLvtBJ2k20eYdjyUTdFEHXAk8rgQb+9wrq6KV9Ri+AWFnZO8H2WN+3sNxmHU3pEcsCn
 c18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451219; x=1685043219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WeZLbg9PNWPpx3WburKOtddAsovGFs3y9uMBDN6DTFA=;
 b=MG0jcscQBvdj2TqZ3BtGbTyVUSdRYswK/CzdNc7xusgK/3YfwhmaK+FV6hwVY560xo
 41DpT/35qxcM0UCS4kQW6OiEXtSyPlyIWgR67YXN4JoURlA95jslyRc62KiHvz9Yl8iC
 NKMGmsSFHoq+NfwxczGftB4+wKU0MsrGp6dV4n1vNVilw1yfcBoVYwT+1OfL6UBTp5q/
 P2CmrPFTiuc+85wfI5jrq5Ap5iDk5h9Gk4T/rSqLJxQVLrC1DSZROVqi6yC/16zVwjsh
 iQHy0HSM4Jh9PBMGH9531i6lLqdgMc4B04TtiBIJFzfOKstRvxC9JPSwcbxwJ2M9eVH2
 FYGA==
X-Gm-Message-State: AAQBX9ckWb1gb9kfj2cpJjT+u46o7T914cQ+k8O4Dnww3GxNOgDtsIql
 5KN82dsaboqIEdLT5XB/E1kp3x7vIF4T+vRxhwonqA==
X-Received: by 2002:a2e:9b87:0:b0:2aa:4550:9169 with SMTP id
 z7-20020a2e9b87000000b002aa45509169mr3649048lji.20.1682451219309; 
 Tue, 25 Apr 2023 12:33:39 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 11/57] tcg/tci: Use helper_{ld,st}*_mmu for user-only
Date: Tue, 25 Apr 2023 20:31:00 +0100
Message-Id: <20230425193146.2106111-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 0v4g8TGnKnAI

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


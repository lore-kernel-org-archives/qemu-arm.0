Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2652325ejm;
        Wed, 3 May 2023 00:08:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FnGfEydlfK4szpfmX1NjvJr46FpCrgVRnd6UrgIgyHhYilXUsa3+bxEHDX4b9ps4pbmQ8
X-Received: by 2002:a05:6214:2aa5:b0:61a:281b:9a4b with SMTP id js5-20020a0562142aa500b0061a281b9a4bmr7176275qvb.0.1683097694751;
        Wed, 03 May 2023 00:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097694; cv=none;
        d=google.com; s=arc-20160816;
        b=cDMJdAMTqH1HmvRXkzyj6I4KaPGiiqTVXxDZP60tu2i5kX6wNAv0Xej3chFc080gI5
         1nq3mDLu6Q/Ht8Vou8324P69iEB7PKxBep3e4gOwxhIt3S8iJ/jWfM8ajRrQ9vOWvP+Q
         YASfGPT6UcmU84iSjGSiw1hHRoifUw8XrZ296HMpzTvD0URjGd1u7Y0iv49XBtoLU+Td
         JrUiuTfApjI8LJQoiSJ2ETeiLjiZDRsMdIKYVjN5Vb453EluHS4AVgDO7ckHtO8kRgJJ
         szu+02R7SiIqRiufzasQnrlFADr2SmODKfQJV1fHs4W/8/X9CM3i79v2f4MkZ/llx03s
         seFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
        b=dRvulpFHviS091qHtUTwAyqIzhZuWO5xtBqEwADNHvCZeK4DHgfM37lkeepE+Dilm2
         xm15ydFEfWVhg/owzHWJbcmZNw/anpZoNKoRccd17AFwUSE0TLqKie+f3+zRgxwpI7L9
         NkpYCTHcvkxpm6ekEHEZ+Zq4BeeXpbdi7vFBI/ItNBJRVgCf/qCmH5AP5CiW2e99De4g
         BmQTY31xU+CLHVTTvJYyt0lW5OVgyeo7f4OpS3657naovC8RRit2tPgGmwt1ermQ7WBh
         muGaYwAyAT5Yyl289sX9T20FmQLkjgxXvDpfX/bgHgZJXrncw7/8SyQYpXPB6/xmz4NQ
         ot5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkMdBgXw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205-20020a370cd6000000b006ffd3e1339esi17556494qkm.444.2023.05.03.00.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkMdBgXw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6SI-00017p-BI; Wed, 03 May 2023 02:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rk-0000A4-M8
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R2-0001ff-Vp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so2087956f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097076; x=1685689076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
 b=CkMdBgXwreFY7CGlT3MnxzBZwaYwc+jr0OOKyz640kc5WDMLv82tPMTGslGoLKsQpY
 j47MsDcVTS3bRMFX8/CT4Qxu13ckfvqh8zCo5HRh4JpJSYNhj6BTmkVf6BiqbIhqKNXQ
 mmD1Kq8g9bfH4dYlFCXpCKskDmNd699rw55hn3KOGo4Mbgt6LsWJP5j4NqGeHiIlKdfv
 OFc0U+hRcZIlpktekEjE5E6jLJin/U9ie0tvO3l5TY5HbVnlnd6pVlyOhWKDGTvl+h4c
 yNArvMBWRkP/D4BYY//fANFGFVSxqBjp9sJxEk5VniOg8wx/44Z/tee1q37/bdFQZIfJ
 DbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097076; x=1685689076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
 b=SMlw7mKJC/xjRBY0E2HMTIC5HLccVG/S+CgWe9J+dtByy3LMt3tGjlmJfHU+hjP0q1
 Sh3gAI6LNCTpbUnuzcxfffy1ZEX2T3/5w4sFlWicCyVx2IbtjmTACyDoYgtnSUy8mzVK
 ZyYrPrRWfyA63ewLM9hKrO/3HRiCXmrCUBWekYSh78AK8chwCHeLJHC7++4F0u2iLYxh
 LG79+EQoknPfURzpNl+YGMpNLm2tjArjyQXo2yrqYEZGLhDOPmeirShBO+/QMooIHVLJ
 8D4/b+7GerjvKdAZwYeI+BPismuLRwkehxK9hU/t/aKnZPxyJptWpqAwZ+A2+bLmesN0
 hzDw==
X-Gm-Message-State: AC+VfDz//KiT/xmJ8dZfIu80ibRNgY508JAl3yLD82fAluLQQ0+IRdgX
 4E3eAfrTfsJng4AEo3rkGNLysGWcyLvLdkfNurrECg==
X-Received: by 2002:adf:e807:0:b0:306:41d3:fca8 with SMTP id
 o7-20020adfe807000000b0030641d3fca8mr776482wrm.69.1683097075911; 
 Tue, 02 May 2023 23:57:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 33/54] tcg: Widen helper_*_st[bw]_mmu val arguments
Date: Wed,  3 May 2023 07:57:08 +0100
Message-Id: <20230503065729.1745843-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: c4CopVzz2je1

While the old type was correct in the ideal sense, some ABIs require
the argument to be zero-extended.  Using uint32_t for all such values
is a decent compromise.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 10 +++++++---
 accel/tcg/cputlb.c     |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..684e394b06 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -55,15 +55,19 @@ tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+/*
+ * Value extended to at least uint32_t, so that some ABIs do not require
+ * zero-extension from uint8_t or uint16_t.
+ */
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c8bd642d0e..3117886af1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2508,7 +2508,7 @@ full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr)
 {
     full_stb_mmu(env, addr, val, oi, retaddr);
@@ -2521,7 +2521,7 @@ static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_le_stw_mmu(env, addr, val, oi, retaddr);
@@ -2534,7 +2534,7 @@ static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_be_stw_mmu(env, addr, val, oi, retaddr);
-- 
2.34.1


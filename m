Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp634044lfi;
        Wed, 30 Jun 2021 11:36:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNbssvfdUEwYQlknUqrSEfwyTajkehzRwnXIQwv//2WWn1lVluRr2EqIeRYNPKPQ4VCVg/
X-Received: by 2002:a25:ce51:: with SMTP id x78mr49532841ybe.457.1625078191717;
        Wed, 30 Jun 2021 11:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625078191; cv=none;
        d=google.com; s=arc-20160816;
        b=SFialxg3Po3L03tHvzNEmR34S6EkZbZDzuOnmrz7GGI2i/gxXCrlwQq67l50b32Q8R
         M/C+PCRre3Z2rGtnVP5Y1pNfiT8+S8tst/GrZd/XA15L1i4SF+2dsxpkdDdlvh4oLZ3r
         1kj7G0xxInr76M52YPQW0Gn9zG10GzHpIPB5fYr4dEq5E+ZEbSItneb/nRlqtp6214WS
         dP+xgYZaKkElTd5CRuwzQmjEEUoO9riB51EF+By/L+QyTgrLD6D1CsfaRhFV8uooyXBL
         SkMzT1I5rKGQrt+0DRuN9xeZOXiyhpLV0kOiJ0BeAudqLIt1xHqjrzswK253NwSYsdY7
         7cvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A7hAexeBQ5Ar+tSUN9C4Tdw7ktlK4SgTVxbaVoJ2i0s=;
        b=IL1Z2T93a4qpT1EIvOmSaRf6U0X6n1X5lRV3h3Yf40pKXdVjLAQrFlMh7OXbyM7J+z
         RfucYJL7flfmwwnlRiMIt8WMY+JiT9CjTMMYxy0J39Xw8QFFjNX9nrhNiwEkEctu2uUF
         tF7TV0nikp2HGhZjVhWkYizMEC8aHSH0Xe8SxskcZuojVWX60BPjcewbrE8SpA4I5KHF
         FHgtrktBOCD6Ccaa7XoAmnelDRYnKggKpDJH35MMHVAnHYU3UNjSgXGSx9wbwHEhdJKq
         5MAde/2fWd0VcpXp5PpuH0h/f+PlTgO4LpeYv9aRClVuCHN2tUZK/1jSHMqApCi/i5BA
         m3SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ihCziMj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si24497554ybu.418.2021.06.30.11.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jun 2021 11:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ihCziMj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyf4Z-0002OD-3i
	for alex.bennee@linaro.org; Wed, 30 Jun 2021 14:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0l-000581-Ej
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 14:32:35 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0j-00020J-CK
 for qemu-arm@nongnu.org; Wed, 30 Jun 2021 14:32:35 -0400
Received: by mail-pl1-x636.google.com with SMTP id v13so1976959ple.9
 for <qemu-arm@nongnu.org>; Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A7hAexeBQ5Ar+tSUN9C4Tdw7ktlK4SgTVxbaVoJ2i0s=;
 b=ihCziMj/HTV/Xl6uB6kQNq0V72HiCYO8CxkfPy453TKNlddisyHNuLIwOvXTVDgztH
 JYwznkd+mXm2SuWa3IBZSJN84BIKzIsCRNgskVb8IvYzkoUTI2O+aja5rj+GFmfN6j5W
 etHACZr+JOZBnprXC1w3Dy+Gj5x1pqPUTLT4tf7QuwHs5+GDXBWiMcISv6BOiJryMx42
 zKb1vo+OelWK9tOuAMOxmuNndBB6YBsr3vEJkSFTgeRgLXgZu6fwVcjZdDDZrYBLXgfK
 PYUjdogpDSPHDAaZvu5A8Vz1inNRtAkBb9uozZ6AlGmf44zugTyB0WiJHEtGZ7D29I1p
 ByVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7hAexeBQ5Ar+tSUN9C4Tdw7ktlK4SgTVxbaVoJ2i0s=;
 b=sjxzzRO89kV/r1oKNJg8cQmnpAm0huabRqTzsmHc30dyUgwyKC6TvSU/k2vIz5qQhH
 U+7A8wqe8S2zS3wIH+Xu1S97YFxoPOwllvVxmM9/Dlw3d91gm733ICdK26+ns4t++3Gy
 fD+XszB+2te+0vG855MWsulEdvGqT/I0VXfhRXLqL9u97LPlDJ/XvFf0N434kqym7F/S
 aL7bcjnB7DMOj4j8LXzDGLhVUd8LJ1NnfOGIXjat2RjwPnkyPKWIF0UtIdqpYDae9JV9
 tWx68d7Lue67sGzYmPuo78pYwYGrikH6Z8OnxeDderrYJfUopruDykjcFTHkgjcVY2Jv
 Ul5w==
X-Gm-Message-State: AOAM530lPCt9gLxOVSwl2R177EyxBZg7n3budEcAzkPSXJ9TwziQwvt1
 hLSRuSkFpmT9VNf7GZozw3ziCgwmaXISGQ==
X-Received: by 2002:a17:90b:3697:: with SMTP id
 mj23mr5658760pjb.118.1625077952128; 
 Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/28] target/arm: Use translator_use_goto_tb for aarch32
Date: Wed, 30 Jun 2021 11:32:05 -0700
Message-Id: <20210630183226.3290849-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tza73RaFd/0P

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8cd31feeaa..87c3c09df5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2509,16 +2509,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
-{
-#ifndef CONFIG_USER_ONLY
-    return (s->base.tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           ((s->base.pc_next - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
 static void gen_goto_ptr(void)
 {
     tcg_gen_lookup_and_goto_ptr();
@@ -2530,7 +2520,7 @@ static void gen_goto_ptr(void)
  */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
-    if (use_goto_tb(s, dest)) {
+    if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(s->base.tb, n);
-- 
2.25.1


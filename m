Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3064333ejn;
        Sun, 23 Oct 2022 23:14:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iuizuM776WxRTDuQItbscUcxNe3hanyMjLoB+9oI+1Caxh/BYimv+C1ILRlIOuzgt61GT
X-Received: by 2002:ad4:5dee:0:b0:4b4:b8a:78db with SMTP id jn14-20020ad45dee000000b004b40b8a78dbmr26545707qvb.12.1666592074573;
        Sun, 23 Oct 2022 23:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666592074; cv=none;
        d=google.com; s=arc-20160816;
        b=cD/KCNWeWH59FQ40aFmY81V4nthjYs5W7JHs0uiBOGA032y+B1yKQj1G+prfdvIaW4
         YJWTibv7fVUgiMXXjfMs70FZDUV5vO1Xf50pTYSBykbXWVQ1HE0LT6Y2zTdCcifh9GJB
         u9HzMUTS9+cicqeVqFD7CGb0InRkjjHHSkLn/B+CStwYVKHWOEazfkT9KgDqRWzhJ3cE
         ZJgAhU7zRn96hLLKyWrmJqQop2V2qVRm1Z0H0lB3rZJQQ2ydA7ljy6fvJfSwi2BHTTcw
         P3Vzou2e4guE3Ec+kArDDj0YMNYhBqU/cZXh9HwN0+dDbwWYdgL2+JI4bz2AEcbMiuMe
         0aoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IWw+aq7JNeHsl9fq/os7SQInlY545GVW3QOnHQy7rg0=;
        b=NYwmKz5Bar/jnM3qnQ/5qjGm4Bctya15eLsoLQldOESsEYokIg+4xUpYAPOUAm5/Xm
         AMIyNYyLvCLNaTaRjp/rFZLvlvvhRjuC1ZbspsY/DWApp6N7xbpiqyqxZiAYIE6Qz0K9
         eJdQgipasWVGI1+WxQUxMMqqDEoAvFgtwTiLgBEwx8QL2KDJVlgdnQNvzyD5wPrRKlBj
         ffk0VurOwHwCYX3u14rEvibXrhsXE+GwdXu8INfSkBM6JsSbfWssDISvKWqlCYxg2QgP
         U1jYRVhXYV5qJUCAcUO+THQBS3COSw4UldIkkoqHgdZMWvSlHfZs1qUyY2U5hAk2tjcE
         dktA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zClpVoaH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26-20020ac84a9a000000b0039cd62203d6si15523413qtq.595.2022.10.23.23.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 23:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zClpVoaH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompsv-0007ZI-42; Mon, 24 Oct 2022 01:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omps9-0006rR-Lh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omps8-0002PU-0w
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:37 -0400
Received: by mail-pf1-x430.google.com with SMTP id m6so8169008pfb.0
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWw+aq7JNeHsl9fq/os7SQInlY545GVW3QOnHQy7rg0=;
 b=zClpVoaHHqvDQGxHaG61TifYrcxiBqg/7hR7bhQ6rq57WCCFDvjg6nyP05HOvD0r9r
 Tvd8jNuMd0v7C6H1CegQnSO+bqlls2w+m5ZTMWBaTb2rtikAh3RdO64jB8BNGJrSQgj8
 fJw7Zd4B/sX3Xhuzv0gyTjH/NqHLO81iuBRGuy+eJxiGIPnfaC6XWv4eb+v74B3zWtEF
 kfqbwf+/l1PbY6Puv4LDCs/W6kTu1U5C9/Xs0cAXYEDe4ttyEUml+NrQMHDXxYEd4Dxy
 CzyFAbC/b8lDWOqz+vrCM5SNAE3HjxF5WlUvAcVi7izmsrTX/XHjQ5QT+p58STF1EcWo
 72WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWw+aq7JNeHsl9fq/os7SQInlY545GVW3QOnHQy7rg0=;
 b=7KBeMQH7AV8/HEAi8d9UN3dGAkVBu5hR42kWzFFM17Fd5shh9X368cenqt7XSR8r+b
 /PKRflaWnSoQZ8LydznQWFgtVo3qPHVLgBu0i0unRPJ97QG+OD6EAy/EDdaLbdy/qXtd
 yOBMm8Dx5oaZjm55sDFsW97sMv3I77WfZ0wMw6WU2J6jsvQRAKbgN9ZDiTvisp/jBe5h
 pcduO+Zue7PsLA+QVTQMSGmOgNH5TRuZH3hHmW6DH//eqF+7kznOIP/C5ynIZgp8Gd0H
 W5p6NA5WwiTerpIp/M1Czpvx+tnOr+OXMKb+b3uJJW+X3fyYhTX2lp+PNE8N10ie+Kfj
 gyPA==
X-Gm-Message-State: ACrzQf2aqc/I4idO31awAP9vEbXqxqUYZ6qF1Qe8f0lww6gilejYfefe
 iL1saIPBFP+CUsJDVpdk7WYmyLz7uMxI3ll/
X-Received: by 2002:a05:6a02:282:b0:439:7a97:ccd with SMTP id
 bk2-20020a056a02028200b004397a970ccdmr27308494pgb.297.1666588766214; 
 Sun, 23 Oct 2022 22:19:26 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 24 Oct 2022 15:18:47 +1000
Message-Id: <20221024051851.3074715-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RJkH7L64oS5n

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cc7751218c..8004ca86df 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1077,7 +1077,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     uint64_t descriptor;
     bool nstable;
 
@@ -1343,7 +1342,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (regime_is_stage2(mmu_idx)) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1351,7 +1350,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1404,7 +1402,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (regime_is_stage2(mmu_idx)) {
-- 
2.34.1


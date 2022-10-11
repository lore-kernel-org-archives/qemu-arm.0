Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2889020ocg;
        Mon, 10 Oct 2022 20:35:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49C0gxz+UcP3KmTa6x15QDDdM1hm3s7eQTQY+EvJ0Oq0HkyiMa0pFR15YFWEY41Cu/wGra
X-Received: by 2002:a37:454:0:b0:6ec:1601:bc79 with SMTP id 81-20020a370454000000b006ec1601bc79mr9017298qke.276.1665459316310;
        Mon, 10 Oct 2022 20:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459316; cv=none;
        d=google.com; s=arc-20160816;
        b=HrfwLWVyku7GlpKCUEhxI0GjdT7x2pjxSR0q1vaHG4LSYNiEbouWM5tIm2pc8IwFH8
         IIDGIzcfnVPP/Ix8s0GBr4lWmHl4Ix3VBDw+nZCGkDIIXXTqdV8vQvbcaFAt51/gMLJ7
         ff7SmM8jp1xPmJAnhJ4or2FVk1LtQt1Y5dxMhw62f7FNFp/Agg6lhtM8kh2eISw0EWZI
         tzQgf7etTJnzcqe96XtPaTTfpRUUIDlir4bMZTbno3wxK2z2nyjWuFuTwodcbMiugSde
         fAiGiotiwh99/uu214QyB1d1HtMAgnTJf/cC6pBk2ek0IGOSldwBa9d+jYyRj01fXeqK
         aGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=igwDK2m9zhrQhVMJ/mwLsQLF4ZyzFm7+yLAGfvHZQnE=;
        b=jLkw/SkSpspjWEj+BFhH/kwkueyWdX6NhDrUe6odC47pZ2F/WwPubebO1WJd0pmlc9
         cfm68GeOFUcYUxUHL5ZZRTlDR6/iFBF7hzHH4UkesDxJgeT383v1XDntIHsEa9i+nr6Q
         TTtzcDYX7GZOwxGoaA5UIqiNlNFE76IuVuyfSaKh7kv+K4h7zMcv6KV1i/RtI5o24Nav
         R4l3nKcXk50ATyPLjPvmYNOF9bGHcw9nqSawKBBM3Khyid8Lz48mo/nNu9HuxukRLQe8
         vYstdf6KPT3UE7ej38XyDG9oVZnNAy9OuQSaeGE9nTr+qyxnq9ZJgl6WF1tr0QK73zFf
         y5ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dx3siBOa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a0562140ca100b004ac8c423fc3si6668437qvs.209.2022.10.10.20.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dx3siBOa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi631-0001L0-PU
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nw-0002Ri-MW
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nr-00030k-B0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:39 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h13so10915861pfr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igwDK2m9zhrQhVMJ/mwLsQLF4ZyzFm7+yLAGfvHZQnE=;
 b=dx3siBOaf9ACqd49zF6xyV67g7G2cZR/dcN5pnQjKakwWveZA3ruKMjlR6XpWquYqq
 QJLGkGGM0tI8qnMRddjjJqwrYWoZGRQ890WJM5tVSyZTL+h+KqbuSD//jA7vnzlwFnwa
 h0v4Rl7WFetgwmWVtmIoJas37D01i1qto94kOwPZ9oMpUUEtdHtWUWzNgRNl/uGA1c9H
 nctB3mycaiAT+R+oFBfW+QyLMyghlQbUxb+33Unjfro1RsGT2l6TnVlNEsWS7zmD05c8
 1mby5gRHpZ/3M0DI7UdaHTIQa1hBktIvPGowAhBm1/dDjoc5E05qOqHWtyLEIVgXa9yT
 HeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igwDK2m9zhrQhVMJ/mwLsQLF4ZyzFm7+yLAGfvHZQnE=;
 b=fw23t6jl/SntIqPzc2eleT4MFH5+DRUnbUk+8FMnsnZ1i3gw6mwQWaxebmAM9R2cVK
 kE5pX5X34H/kiUdtdQUb8nDNmUgZC+DwKaWU/CfKPVj6ME7uoEtDM8ASBld/+vtCNDEG
 OymFe/tjx+qcW8SABq6kQelAg4I6R9swRtcPfK/LsHzotcq6oZnIdOaYznbbZn9jNa28
 YNCoyKOdEtf2sM/J1DnTWRcuuYyi2DZznT37h3S4hxYqXFQDa5jHwINPfLInw+cL0RsV
 JFIWx7A3dqoFuaxConL2p1mPPJ/oAhtJckdyODbArQOyHkKavGiuxTObNNjAZ+o3cLq3
 bjqA==
X-Gm-Message-State: ACrzQf2HhJjNUh+jL7Su8IFio+aEkAY6ABmZ4DXyOjtrfW2v5JSa2SQv
 EkHvefWsI3cQoJcjucv7tsHOgLHTrQ3oeQ==
X-Received: by 2002:a63:5243:0:b0:43c:96a:8528 with SMTP id
 s3-20020a635243000000b0043c096a8528mr19112743pgl.47.1665458374580; 
 Mon, 10 Oct 2022 20:19:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 12/24] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Mon, 10 Oct 2022 20:18:59 -0700
Message-Id: <20221011031911.2408754-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cqgKQPMFnIwc

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dd6556560a..6c5ed56a10 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2432,7 +2432,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->f.lg_page_size = TARGET_PAGE_BITS;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
@@ -2443,9 +2443,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
     bool is_secure = ptw->in_secure;
-    bool ipa_secure, s2walk_secure;
+    bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     bool is_el0;
     uint64_t hcr;
@@ -2520,7 +2519,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
          && (ipa_secure
              || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
 
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
-- 
2.34.1


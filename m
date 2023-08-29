Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3990633ejc;
        Tue, 29 Aug 2023 16:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ/XsESEJU2Hdqro2TdpzjLbDf4cxovDnUP3ovBfwkMR97E+U5NpbQOAhKDeqP++D8vhjJ
X-Received: by 2002:a05:6102:10b:b0:44e:c10f:c15a with SMTP id z11-20020a056102010b00b0044ec10fc15amr607333vsq.35.1693351679103;
        Tue, 29 Aug 2023 16:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693351679; cv=none;
        d=google.com; s=arc-20160816;
        b=soPJcyFO6fKejiXIGiU96PaP/4EsyP5RGugQLP1eEMiadyIuJYdv4E1zVYq5iDJLu2
         578GXWyBBbRRDAp8f9TMkAXepoSDhsZcXx/DKgO6UdMtlY/LnzdNmpdRlbK0GKRvxP2o
         HlwWyHFZKBjgArlUrUKY4mFU3tBDnEFHZKCRtI+1MsxbJ9CQEG+2BSXM6NJ10W4rMRtl
         y2a5EoWTE371nC53mCQdLOYFFnM6Vx5D8mMpFD2i3ZrDsHrlE1dGW8N+ReMr4iHUs9bP
         hmcibso32V+wWA/cCyHpV/1ooEPppkfwGCZdMHuACnK63re3R3XJUxmxDTIS9KiyoycA
         W2tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1kQdNiCM9Zqst6RWSQxeqs+p1o22wGyR4sXs05ml1eo=;
        fh=L6OjQZ2TPsHFQEGPRBuboSqhQBavDZ5pPqlyX67xn3A=;
        b=D+iqhTw8Vnj0IgaUld8CkQlccVlPGgFO/5UT1K7sIFX13rUtazwZPpc1ShrsYWPKa3
         i3ZOBcjkwnlRsjfexZjmezvJkOjjp9D/b4x8bhmaJlLGiFkDTRVkIgBkHAafQp3gBOZS
         l+MW9X8LXcTmKz72wBNr/Sp+8BvxkaBnj+oZynPozpu1Pv2lxawUoUmgRBKNZU56EpCj
         7RzcGhYJA/DxLVTBSCcVBfADSkc0lHX5mXJAOuXF9c9xh6n63fM1OtLJnyvcl1HkJ9p6
         BBxArXqIXZ8OQv+VnlOqR/R19OliRCazPcr1TDLeg4vajE26+KNpOBpSYMrP+64qVLeL
         eu6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1zBRhaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a0cc542000000b0064f55325887si6610066qvi.377.2023.08.29.16.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 16:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1zBRhaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb83u-0004ID-Hs; Tue, 29 Aug 2023 19:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83t-00049r-EB
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:53 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83o-0001Ol-Bw
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:53 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68c3ec0578bso2354213b3a.2
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 16:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693351427; x=1693956227; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kQdNiCM9Zqst6RWSQxeqs+p1o22wGyR4sXs05ml1eo=;
 b=M1zBRhaFJLKf4SKXp8KDIBr9Mw2/K1tBixAa0tOmVz4poIzyXwIM+23+EfA7xlrpBY
 59VC1SEr62ngm4Rv9qrCdGA7W1yimBvRWrAUygQZU/JoFkWdV/EWeme1Go5q+buQ45in
 NnZau6GedSO61cWYed8LrjJLzujjqJ3aboXVWDXeB7G+u56qUb6OfBVGOjOd7WH59Bbz
 1NSNMl4EzIm3MbMOFfsN/9f2PCYbIf68nqg13bxKKoOyQrlqdhL6YD+thn2+pvExpIwp
 ov+TeuXd5DEvQfuZ+ZkkHsEvklMOMFxHDaBB2+RCatgswSHfIZ+IIE0q7trlBJYgZnpK
 VudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693351427; x=1693956227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kQdNiCM9Zqst6RWSQxeqs+p1o22wGyR4sXs05ml1eo=;
 b=jakJhvEXp6JWMMf2Y2iR2n4yS0MpFfB+cYvNTOa4vfJOZFfYwlIv+7R4vWytUm7/o/
 zmKU3pa3QQZllylZ2mii7WVz1reVz19FLLDH9yYTwHTQ23Ajh+79fhmnXanypbmnMNF/
 PA19G7kv4MJiRXjt4EI1HPPmRboM+Y9IFyMtpqGTglXwFylbqXko5BG2IG5A/f3+HngY
 J2ehFUfCL1mnH2yKyTIKDYLwCqzHL4d/I/Z6e6Vv3M0j2HImPi3mnXcF4MEvkPJ5YDvZ
 nIOq37GzyauZJSb+KR5ZrsCL5SyrqKnYLRTsL9OA1bs8eaDbD6IIx9TBOmzGru6mPhR0
 3vqA==
X-Gm-Message-State: AOJu0YxjDMhchAw0Q9z9gTn6uwqN8Ex6mk3KOsQ2NGvlZJ6hd4ByrfB9
 xu9Gc6dOSM2Ola/OIqB4fir0hQ==
X-Received: by 2002:a05:6a20:138b:b0:14e:3ac2:e10d with SMTP id
 hn11-20020a056a20138b00b0014e3ac2e10dmr627463pzc.47.1693351426989; 
 Tue, 29 Aug 2023 16:23:46 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001b9dadf8bd2sm9829970plg.190.2023.08.29.16.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 16:23:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 11/12] linux-user/aarch64: Fix normal SIGILL si_code
Date: Tue, 29 Aug 2023 16:23:34 -0700
Message-Id: <20230829232335.965414-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829232335.965414-1-richard.henderson@linaro.org>
References: <20230829232335.965414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: epBa2P6KWyCJ

Most illegal instructions use ILL_ILLOPC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 2e2f7cf218..22c9789326 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -110,7 +110,7 @@ void cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_UDEF:
-            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-- 
2.34.1


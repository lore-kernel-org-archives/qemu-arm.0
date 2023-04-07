Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480303ejb;
        Fri, 7 Apr 2023 11:52:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350aQ+zTmMsZQIMm6/gxw5s9+6m+5CUD2BM+11zmOI5GRvSasLyfC8WeIjzo8Wm4NuUyNdJCo
X-Received: by 2002:a05:6214:2a81:b0:5ac:d562:4ea8 with SMTP id jr1-20020a0562142a8100b005acd5624ea8mr4482605qvb.9.1680893542822;
        Fri, 07 Apr 2023 11:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680893542; cv=none;
        d=google.com; s=arc-20160816;
        b=TdbURSz4ZlAk9mksL9s5PbtXqeMVDOJe2W9vpsM3aJqB3QBePofpluWVoW1+KkNiGs
         n6qtPDuc6eZDGK++wPgMMpzcN0pabZfytbQAe75teVeJisFWR7gvxEJ63N1bc4K6VHfj
         fnPs8/hSbJebYx6WtYoEYO2cx1WJ4HTb9r9YIq5V0dS5ddeI3otB0bGftoBHsKtVQXIS
         p7x18a152qGa6+aysvU/3f9ypC/iNHjNOf0hxh7Ujaz2G3pGy3oZpR1jRJHRQRKzPp+Y
         wghrMcdMtLGobFhYkTq8qHJ7zURGLMLZUtWC4MAuTyxoabgbRZb1zo7RYHqrKfKTyQI8
         9tzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2qWjpSR7JS8/58Ywm9SNFYWb7gykfyATwi7wvhb4xc8=;
        b=u/OZc4KsDi2f5x/2HF3hDD1OvSvt9DUqpBPp6LCYhGWf1L98/mcSkXMZ8LhqwUkQdL
         QRXdMc6N2oK5axPwqnNECFe0Zn5W45jE+/eaBLpa1JKw4QvIsZpKG4fyuUi2hbsGGj3F
         9nhijk1Bak6A5WUuuK+DLT6WgxFDv9Pdj77iem9AOT3iMA68oBhDKf1/vbW6cCYdJx/Z
         BrMbDePV5+oyVSSkGNSj7qG/duqEhzs94rTJa7B+MMxs5fowImU89rY7DR2kdG54pF6S
         FhsuYZHF7aibmTJJRzQhrGzlbO5+/ScQVgpA+QhJapG3fUxUbt76Ncc9x3o/2WOyl+7j
         OTYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7QEVjRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a431100b0074849bb2ccbsi3343416qko.291.2023.04.07.11.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 11:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7QEVjRj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkrBn-00054H-VB; Fri, 07 Apr 2023 14:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBk-00052H-LU
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 14:51:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkrBh-000873-G7
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 14:51:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso8515719pjc.1
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680893511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qWjpSR7JS8/58Ywm9SNFYWb7gykfyATwi7wvhb4xc8=;
 b=d7QEVjRj8bLrUGAByzh3iK60WtnSRXb9Ei1/8vlsQ8rDTAg6gZWxiKGsqjBUtAZlqN
 dpEc2UVgl0qHQHF0uzUrONXWKFXsB2JhR4OKSy8X7us3pavVh660IYVoZzfcv6N66NVj
 GzfGp+BxAjNu4zCt1ZMOuQSLu+Myd31W1Sk4DeSE2vswuhWPBj5zzx5gVV6zyYmUVY0C
 ihUES38khSFyREVm20wMhRudEHbezQ7vF+jUeaVPpBukiK0rhZ1sknxeIMao4fiZDlEl
 DZjNNhm+jwCPyL7MoEfoZwJgqi/ymDDVQAl7mQPWJQS1hmDS7bdEa1HGNhK07WS29AlZ
 N9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680893511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qWjpSR7JS8/58Ywm9SNFYWb7gykfyATwi7wvhb4xc8=;
 b=P/W7uBFEb1UkyQU8uJhgtDWtC2t0INjEUsQCov80VFbujFZQhM8csklPdVBDQ9NqY3
 B4cMgOmFluL8qXEzbvHcVPnTS6wcw8DpCfLUHqguLB8MAUycJCHCae9Dh7MfIy7+NAP3
 kRIJEvaIVzv0tz2APvV9BUZdE1dl3Kqld/mfZfOoX9E00mSq1g4eEz5TwHC2FBQzrf0P
 bGGgwX4ZZnC7IYL33Y0PgpIgDdKkN/fv0dOG25FdeYbf6eNQSLBCtkPuQNBx4MOVIkUM
 shNgLlrr1dwUmS4TP/+Bp3BcbpkKf2wGuQCxo/f2Kb25mUI33R6jTJe86yxjpb60U8Do
 XIcA==
X-Gm-Message-State: AAQBX9ddej4R260BfcKSfP7RvoH8iTZqAMXethTUMNu2qgeSJd7hABQk
 hTHaTDCyr3xYFZTcgfq4zp0rzA==
X-Received: by 2002:a17:902:cec7:b0:1a1:c82d:dcf3 with SMTP id
 d7-20020a170902cec700b001a1c82ddcf3mr12068847plg.12.1680893511072; 
 Fri, 07 Apr 2023 11:51:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709028d8400b0019c13d032d8sm3205796plo.253.2023.04.07.11.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 11:51:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] target/arm: PTE bit GP only applies to stage1
Date: Fri,  7 Apr 2023 11:51:48 -0700
Message-Id: <20230407185149.3253946-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407185149.3253946-1-richard.henderson@linaro.org>
References: <20230407185149.3253946-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tj1pLDmSsqqi

Only perform the extract of GP during the stage1 walk.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec3f51782a..58a6de09bc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1585,11 +1585,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.attrs.secure = false;
     }
 
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
-    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = extract64(attrs, 50, 1); /* GP */
-    }
-
     if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 2, 4);
@@ -1600,6 +1595,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+
+        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
+        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+            result->f.guarded = extract64(attrs, 50, 1); /* GP */
+        }
     }
 
     /*
-- 
2.34.1


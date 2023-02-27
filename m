Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4296752ejc;
        Sun, 26 Feb 2023 21:42:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8KzPLdG5vPytySaZjf9O1cJ8vCOXCNybQ+kKSYnzl7Es44iBTd/Y/TBKWyDkRUFULPZa3z
X-Received: by 2002:ac8:5c8c:0:b0:3bf:bb1f:3c2b with SMTP id r12-20020ac85c8c000000b003bfbb1f3c2bmr19520073qta.6.1677476546047;
        Sun, 26 Feb 2023 21:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476546; cv=none;
        d=google.com; s=arc-20160816;
        b=OjA6NdckSGD/WKw4vBBgMTMrLwZ2kwSVKGf0QkV5tHWuolVysZRhG0oNpPBnA8mqUN
         TDoXfpyer5M8sjkXgYju894HR3RRk3p+wkScyJlKD7+VpfdUaLTmXPeLQr+HbA8O6QVm
         jKzGsozfp+BK+rqEmT/c3C2rSKS9LXnAYsf3nTIUU2Xeec9nx1IkJIu0ENYIgVsOgduK
         NPxbgm4whF9Z5/CgaPj8/ynUnaUPwwPQwW8R+lC8Ehi7C1wZo+3NmakSIZSD4AYLxpzl
         oYSmAcTw8H6kLXJQ4tveCtdLRPhS+6Kju9MoOJpbnZwAZvhLJsyRHH/+AMIBscWfMOFj
         T2IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
        b=kAWOnwzoQIlzmxY2DpTuzPjq2RUa9Uuh0ehxoHysN+UJEOXeWQWQIhKgh7Dy1Q6Ssl
         QNYIMmgBHpZr2P3chWp8w1d5hewkUyybIU3wu0UlRMIHyT9egMv0q1cpyTL6ZUFPRMy4
         PDPnq7XKKSdgVrgybQkohIIlKGMagMlpdiyWXNrzE0xcP5JOwsDaSKFR8SezoN28ArDr
         KKoGsDqv/AVlzfS52Af0bbO+utgyfkWOaH+Cx6tnEOdIjivU1TtCMAvtFlr1r4ewuosP
         CtwoX4BQrr2nBAcMJAwkUT+EUXU29nU/Tj6prm40QNi2pKS5ZIHwQDgy23EYsJuWzhNZ
         tgHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mCNFkg1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020ac85cc8000000b003b86d51a5e8si6281484qta.647.2023.02.26.21.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mCNFkg1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW8m-0005RE-Oj; Mon, 27 Feb 2023 00:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW71-0000K0-SN
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:31:51 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6z-0000k0-7M
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:31:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so8933096pjh.0
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
 b=mCNFkg1KAEm6JAKFnd8Dj1uDhojomv3wDz7YeWWJxTZR56LZxsYGvCSSpTDNh//A+w
 6+ybr0XnCqwgrnapWtMr1nRSpuPRLsgTLnTad/ysGXM54NjZyTy8qMBFrQDsGSsmpOjg
 0JyerYruIwtvdMWjRMTe1kuTk72gBqKZJyP3JqXHzK7lAHicWuXA6JGGVdijfSMxlkMd
 3BHN4uLUS7k0IjusWqDcP/7oZhChoRF65UMmFWr9pb5NLifbXMNfrbKgaHZp7ANjVod4
 aDJSaNnGsGtX/ww+MPPVoHJYkIsNrPLb/ZZfme5yZ7MDmR18LsB/4ShqaFvPlNyaCpFn
 TGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6I7Tkr0gEn5C9IQe3ln5Tw/bG/eqeOfdkUEZ9u/mHS8=;
 b=wGGqDvvTsgcgWFm3PnF6xRbiWbGMAbn8kN+bQW1uh7rGiTQFoHVrapPNwrBnd4jFRV
 qRrP4rxrQLLedGAECSZZh13uaB0UGUvJKhht+69xHlzuEhggm0S6DcXm1JV5FwbhD/yo
 Ryqp4AhbwfSTDgOuNLIXbiNLKdZ3HjE32gTIFErVm5rdQqy1Pkb+kaBA5Pm4sXwu5ajt
 +0CyspcoE+bptgSAC4bPTJT69wzKNt8Io3nwbt4QlLKmS84kmAQUJFxPAy3EQ8hN+wH7
 dJgvLutoC9qiaYXGuqLJacFk6IgACk7Jo3M2Ouz94lDJWj577m5YvmNfR/77Sw2TfFls
 bylg==
X-Gm-Message-State: AO0yUKVbVB76tzjkz0pMEOJyyGWTzGNUm0/SpO53x76aMBievq6TBuyY
 YmrHPIn9G1nKJ/oyzz3Q4BTZtP2zpGEh9vkMMRA=
X-Received: by 2002:a17:90b:4f8f:b0:234:190d:e636 with SMTP id
 qe15-20020a17090b4f8f00b00234190de636mr25563686pjb.8.1677475904448; 
 Sun, 26 Feb 2023 21:31:44 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 76/76] docs/devel/tcg-ops: Drop recommendation to free temps
Date: Sun, 26 Feb 2023 19:25:05 -1000
Message-Id: <20230227052505.352889-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: 6oIOZz854H9A

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 561c416574..f3f451b77f 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -951,10 +951,6 @@ Recommended coding rules for best performance
   often modified, e.g. the integer registers and the condition
   codes. TCG will be able to use host registers to store them.
 
-- Free temporaries when they are no longer used (``tcg_temp_free``).
-  Since ``tcg_const_x`` also creates a temporary, you should free it
-  after it is used.
-
 - Don't hesitate to use helpers for complicated or seldom used guest
   instructions. There is little performance advantage in using TCG to
   implement guest instructions taking more than about twenty TCG
-- 
2.34.1


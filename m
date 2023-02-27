Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4394920ejc;
        Mon, 27 Feb 2023 00:08:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/tFT+EONp4libgnFFEYcezxTmsXql7HOwdPYMrqR4BaGs0lBHovjxf268z6IjSHnaN3PF6
X-Received: by 2002:ac8:5ac6:0:b0:3bf:d974:8ad5 with SMTP id d6-20020ac85ac6000000b003bfd9748ad5mr5298894qtd.61.1677485308101;
        Mon, 27 Feb 2023 00:08:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485308; cv=none;
        d=google.com; s=arc-20160816;
        b=xwrBlO//iNKFlDAaA/QYGHiBG8DYzsU1IuUmpx2WQ+su1oXgInkOhMfDOdgdQNXFkV
         oWfaysm6e/DS9CAPpwEJxR+XKuIayyUvZWKBkwbXzS6IAufnS8XWbtEQlNdfWV6/GOYR
         gvV1zI6cbOHLhcR1ReA8LNN5QHSSFA6Z4W9xXGQxdYNaCgrcSkqUZRn7B/OhjpsBsw5P
         oDSDVE192OSljA1lSbgnZq3sCPlRWKV3NXNCd0K2DF1tOh/1juAMTI0Iwgny3f+HuPZ6
         j+ke3dDnFYM0J5zehcGHvXSOAo9RhuwWP42LSY8CzEj1jrNrT+lyF45CALme6hxQkVoz
         3B9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FKIUVjbl8DPLcvn6krGNHyWegUHfiPg1Pbu7JBCgIrE=;
        b=XZKR6lWJv8scWBFv5V1A11kUiZe+dEYt1WozszQoL67EJCZ+WrvSwi3LipBdY5NzTV
         S/qypjRFWY4hsZLZORYedduX5lF89XJClZDKxCuzZv6ijPIQ+o0OvIFvi21qMzLrKLJq
         tgZGDZhUdGhoX8TStAtRSZVzL1XS7N4IpYqrm6ZQD6Bmlk/lahjHVGQxxzZrKopg7U/i
         6d9yIpAvRfbOYzoBAzCgPvJsdAAY7Rd/3+k6hpRofdoEJMC9vjDin8YrUaqBMPoyyOA+
         USTe5P0NQwNxqMMrK4i2vzPGjcQ8s503E2OxlnoOcdfag36dt0OJ3PloZSecjVZAlEoT
         8jQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r43K95Nn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05622a199700b003bcf93dc620si5759363qtc.596.2023.02.27.00.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:08:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r43K95Nn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWMn-0001ez-Pb; Mon, 27 Feb 2023 00:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMc-0000L0-BI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:54 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMY-00078Q-0U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:53 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8877436pjb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FKIUVjbl8DPLcvn6krGNHyWegUHfiPg1Pbu7JBCgIrE=;
 b=r43K95NnmgE112llmqV3lfV1zm/F4PSdwKsmPdzYhCNm28JRKnp6/y1Wl+Jr7GLKpW
 Qz8g+sfqk3/eydusr3rOBHwmwV4ZyZ9Mmr9GbTjLZaCR11urYP3lUfkPfRSXBa4Tqlni
 7ONJ3OIy0D8ZaHK0gOK2DudtrOl5hRJCxVlb3yVSOLIljUFI6/myGoaDuYixjvZSVoI3
 KU7ee+y/GUUI5nuaJCqqRiN8yUwRQu1rxri2D7E0MZ4IKXvE2V2vKQkpSwphkqwM3Y8R
 bszTqjVnlC8b1eA3odaW96AzAXE9jTcK/3QZUi1FTn7uHUJ9RaWY6elcI8byIU75L/8J
 oAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKIUVjbl8DPLcvn6krGNHyWegUHfiPg1Pbu7JBCgIrE=;
 b=6SStIRHe0HNzBvWNXR90yxSb/x66pMWhNVBmC8eR/VdNJ1k30kWqtv2Y4KPG/nc9U/
 OkILaAJ3/YEQEQ1Xea/Eb4lZQihSvUCALuflRsfWL+OvWM/SKLhovHOiDrLHEvFociWF
 IBkhyMgW+FPIcWSUXCwTVuOJlgOptx3lktxaiGqTA5/pHjsKMzILCgttsbO9sS5ijWlv
 EP8rrv2jJs6I3wy8kmRUkEuqp/qjYo7FXPSf0cPvWE7Trc9JseFLbJUoZdCm1egtVFWX
 Ghh79wI6qyS48GL3091VUHpz4n/50lAzryS2Zt5JoQbBlBKGQLBlH/Y/285v8yuCfS5e
 afXA==
X-Gm-Message-State: AO0yUKWsI2Pg55k4BTzohX6AVao/2RAxvQLV8MKsTztKhU2SOCV3JqB/
 HVSpe+McrBEUXsD+uxUykZXwzSnJ8fpF5TPqNys=
X-Received: by 2002:a17:903:183:b0:19d:bf12:8a69 with SMTP id
 z3-20020a170903018300b0019dbf128a69mr157112plg.49.1677476866671; 
 Sun, 26 Feb 2023 21:47:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 46/70] target/rx: Use tcg_gen_abs_i32
Date: Sun, 26 Feb 2023 19:42:09 -1000
Message-Id: <20230227054233.390271-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wWUddo5Qm1wL

Remove the local definition of rx_abs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 6624414739..998e6e0b7e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1126,21 +1126,11 @@ static bool trans_SBB_mr(DisasContext *ctx, arg_SBB_mr *a)
     return true;
 }
 
-static void rx_abs(TCGv ret, TCGv arg1)
-{
-    TCGv neg;
-    TCGv zero;
-    neg = tcg_temp_new();
-    zero = tcg_const_i32(0);
-    tcg_gen_neg_i32(neg, arg1);
-    tcg_gen_movcond_i32(TCG_COND_LT, ret, arg1, zero, neg, arg1);
-}
-
 /* abs rd */
 /* abs rs, rd */
 static bool trans_ABS_rr(DisasContext *ctx, arg_ABS_rr *a)
 {
-    rx_gen_op_rr(rx_abs, a->rd, a->rs);
+    rx_gen_op_rr(tcg_gen_abs_i32, a->rd, a->rs);
     return true;
 }
 
-- 
2.34.1


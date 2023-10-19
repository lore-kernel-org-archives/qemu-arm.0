Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp713956ejb;
        Thu, 19 Oct 2023 11:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQgfa9ybCuDUTakdtTwIbh1NQJOMrhx+TvK7m8QGSeZavqyF/K9gqSj76KAsrMbjRnQGWM
X-Received: by 2002:a05:620a:244b:b0:775:9ca1:7600 with SMTP id h11-20020a05620a244b00b007759ca17600mr3646234qkn.49.1697740469790;
        Thu, 19 Oct 2023 11:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697740469; cv=none;
        d=google.com; s=arc-20160816;
        b=GLXIUU1dRORmXMRF0QnjT56ZWavm12nogk2w9D2bGNTPT7tKkSSoS8oD4aOZmE6rBp
         nttavG3kqkyPCFjRIpLa2ctMg2XXNz/Y6O/7bJA/EoQ1mE4RWQ7mUv2lYiJkbKvc8zOV
         wfU+bgcyjj/cPC1o7orynLHKuw/uYsTDvzUInONVdrfqA9mAQWolRC3uzKjBulMWRR/T
         xDM4khQh7dg6hZI8cJWKREDMXrLPlq/1+ot10ShQDhyNIlgcp8WgHnRnLUa2elUODBKy
         0fdHYU2snJXwSGWI+HODP557DHrqdUjbcqFJ1AN9xwRVVwPvOfQImTklzpr2PdFVzeTr
         wKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wAV0MQyuUvJwJtAe5PEULJLUpPvnw9Xv2CxQWX7wnBg=;
        fh=rp4SvMZyvufgLOIbJsYRQQ45Pxd1jVTSEU6q8ruBOWo=;
        b=uirhfTnUi5hqPtGBq0HULFAoXCIeSY59lK9tsYxIsnQZbzSwjuYR/5Zg9faCOe+9FP
         YZzhgzh714jRm3Nddma+VDFI8TLWje8PxtftDKBEYQuaWQ9+Nf+Ipk9vl8KTrEhwatuM
         5QlGOui+P9ifHgGx4R3tzYuib0KNjh2iu1a3wiDk3mJdAvjv3mwwVgXeOHfvLHvQSdTw
         0t1/xOeifFGxx5Tv3f5lqcmVTOAYVfi8ZMkXooG+AJnbquaP94E8wQ9qaCLZlidsbmP6
         fB3f23TjEWKReqpzI1hLfFXOqdZO8dMLFj747sZMDazi5+IhjIg/nNVV22u48OB7XawD
         bi7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mT2edJl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05620a240800b0076db6af9392si20003qkn.254.2023.10.19.11.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 11:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mT2edJl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtXmD-0001gE-Ez; Thu, 19 Oct 2023 14:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qtXm6-0001HZ-0x
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 14:29:38 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qtXm3-00071a-LK
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 14:29:37 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-584042a01eeso384864eaf.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697740174; x=1698344974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAV0MQyuUvJwJtAe5PEULJLUpPvnw9Xv2CxQWX7wnBg=;
 b=mT2edJl4xwQl7S+FH+YhboxieIPTU/i/2D/Fi1gLIctRubxCAUiAQt2pbg6zdjaV4o
 Cfr4VMZ2A9KHpjDCjaPy9KImyM7rbsCBCjI/yq+vGnRd2W80i+OIM2QJAD2QSHuySNoJ
 YMLJtjXZMc8eCKAfErLsLYT0g0LzChm2rNRizLUDmRZaBtVjgHfGtYfW/WUogF1cAyz1
 jE+DsuKNGVOLETfq84sTxH6RMMZkNEeximTV7g3ldzHVXbW+zdJ+o4mOV7xTGFs4wyJM
 4vKV5693eCeDuKDcmvonpy4CAIJoaC4CMtVcanyXz6HAuG2CIApJxtMPj0wHxkxorRAx
 vBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697740174; x=1698344974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAV0MQyuUvJwJtAe5PEULJLUpPvnw9Xv2CxQWX7wnBg=;
 b=G7leLPGRUB3b8ZyIL5OvIQZcHu9rNJLxoKXgngGJA0WcCTnFkJzP4livBHLMh+79Ad
 oukfvjyB3zdldUP+A20Q8X+ry89ccp1GQ7/JtCFp6oiSvry8EYdcRt8njYDk/RcF5++5
 pMZbI/VUxGp1zvvEUGlI+PnShoTZL/vtTcgVcFbKO3jHlqeXTlyTGLEIve9PBtSU2QkK
 mRNaIPq35JYcV46yP3HclJbtCbMVZWD+gP94ZWWfxBllI0vB7gK0iOYe0RMtEHo0iZR1
 nzS61BxZKb+hJhtHwQKvwMwFCawqvxfByNYWEH3zX1sVpJsXQckZB98XwqWazwCW4AhJ
 Nhjg==
X-Gm-Message-State: AOJu0YwF91w63iYqxAADU73k/D7ExxTB1334oQ6p11hBtrvhGA2ytA4g
 T+zbovHRKmeOtpBu+G6O7umbrerRimt6nR29+C8=
X-Received: by 2002:a05:6359:5d26:b0:14d:b8d3:97e5 with SMTP id
 ps38-20020a0563595d2600b0014db8d397e5mr2656647rwb.20.1697740174416; 
 Thu, 19 Oct 2023 11:29:34 -0700 (PDT)
Received: from stoup.. ([71.212.149.95]) by smtp.gmail.com with ESMTPSA id
 e1-20020a630f01000000b005b856fab5e9sm72216pgl.18.2023.10.19.11.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 11:29:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
Subject: [PATCH 7/7] target/xtensa: Use tcg_gen_sextract_i32
Date: Thu, 19 Oct 2023 11:29:21 -0700
Message-Id: <20231019182921.1772928-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019182921.1772928-1-richard.henderson@linaro.org>
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
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
X-TUID: o7Cq3AFmjxgg

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 54bee7ddba..de89940599 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2262,17 +2262,7 @@ static void translate_salt(DisasContext *dc, const OpcodeArg arg[],
 static void translate_sext(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    int shift = 31 - arg[2].imm;
-
-    if (shift == 24) {
-        tcg_gen_ext8s_i32(arg[0].out, arg[1].in);
-    } else if (shift == 16) {
-        tcg_gen_ext16s_i32(arg[0].out, arg[1].in);
-    } else {
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_shli_i32(tmp, arg[1].in, shift);
-        tcg_gen_sari_i32(arg[0].out, tmp, shift);
-    }
+    tcg_gen_sextract_i32(arg[0].out, arg[1].in, 0, arg[2].imm + 1);
 }
 
 static uint32_t test_exceptions_simcall(DisasContext *dc,
-- 
2.34.1


Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4389500ejc;
        Mon, 27 Feb 2023 00:00:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9cA7X954G2L/K2vYIm3+hzyjI+mIKFJquOH2t6GCLl6I/63AbHFbunStYq0eqai5+qKeCj
X-Received: by 2002:a05:622a:1985:b0:3bf:a601:6a84 with SMTP id u5-20020a05622a198500b003bfa6016a84mr38886178qtc.38.1677484834175;
        Mon, 27 Feb 2023 00:00:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677484834; cv=none;
        d=google.com; s=arc-20160816;
        b=Z09dyW4S2Ik6IuDckSCa7qBezpNH6ElheZiBdPXf1ywIlKUN2fmwUq0Pi4dTXlIS2e
         bwI4t9zoMmlYDWpByPGRoC5VWKZE9ePXU0+ESkfxWy/ZX+wcfII1iWya4KV/wa3addkS
         j2aIGtGOeEDNvWKYnyVzqwV9AVflXEWO6W3SSKGeM+9mmkxMmAGaNz3FqBrLWZyG9O4j
         y4zMX+KZkDrt8me3Mu/z3LtMF+uxfq19VM50F7qW0ccLv8dOqNNtt6dT8ka9POegqdDM
         4o3Q+Vtmg73SLUbSIy4iK/yIUW6rdUo8E6Fd/IhxcJ+Z0pKDk4yrKDHUW8c1ZpkKcd3M
         CoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
        b=Hh8H4dbfFG8Er86aYJIy52IEkh6qBMlqkJEyLSaceA/xObtqv2hd+E7SAPCZbOINWU
         rFFdJZuzcIEGoTNhvi6c5WbHUcmH9kv7TM7a+bZEH8I9CeWGh5qNdVSb/MPhq3/zD/2r
         /IeqIKW8g7XkGSAtglO2zlsTZ3tHIVrnqI1M0i8AQB2ddx7cre/q689OMtt1yo5ZJIO0
         Ow4crEpL8zfQvaucMqdnUf4HFrfyvd0XlNC56WnzCcDgg8u8ALjOh09foiaUz418q+Jh
         FIOjG/n0qFzu1mAX5q7XoUJ5x4Uqs4CoJj/N02B8OdekMoYaz2w+4wH3FT9Ybs4TpxK7
         +SoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xys5m/Bh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020ac85bcd000000b003b62f36a410si6143922qtb.151.2023.02.27.00.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:00:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Xys5m/Bh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWIo-0005RE-Lq; Mon, 27 Feb 2023 00:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIW-0004cw-71
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:47 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIT-00057y-1e
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:39 -0500
Received: by mail-pf1-x443.google.com with SMTP id a7so2783892pfx.10
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
 b=Xys5m/BhbJaiCezwG82ZLYx/sXlKRyOWp1V43O+ESWxJ3q7z7L/1IWSXsz/lgCVpB2
 I8KNFl3Fu088dUar4wziVBNBRYCKoU3hQV5TH+h90k7dGz6S/tMJLB3XJqDSv8qh/E4f
 ghr49G7CYMIg+goESjyPWoDAbhfvQq4mCgU1R9EPILtsWX/UcB3oBtFaILFttPoHz+sY
 TMEHDTSYROdZv8CIOiqtdgN0wOHReaW9Y+WFNprr4rrDSCnOV9CTtkKDMxTEfvM45a89
 97D1MlecNJU0s/ZlDE8qVbvid6Z0MBRFJLDXUN7k5m586rIVYX1dkRRjtf2eryG8N77y
 QxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFwp7rJLT3ezFoTtdpkm7g7WVshe2Fl4tPXf7GfT8CY=;
 b=djug5XA2UI4N3brSlN5y4zkAuxxikoKNtALtfh3Qm3fXJrG/iRSQW19DFq/Edx2IiD
 Na3LWcX0kdWqStcUeHFDCpyUi8XOQh1OZEyNVQujyqM6xjAh1oWMWf1+hWALw4TD7AKK
 WBEmZtBxdLrQNpRHs1Y/E43oYsZDEmhZi3rA96AuF5n+sAfzPJp3f01Kw2YrE9C5bfZ9
 YqEJ5qNkRJwWysGx0kp0RoiGr/7ej5zGDduOXlfJp8YtfxXm+NTdZBMegrsnVwGGwhz/
 Hb/1AKtVjHz5wz/qF6j/SzXjPv5qkeqy1Ya3o+iDF3VWdU/8Pb5s9RXhDbRzMe+w0s8B
 1FNA==
X-Gm-Message-State: AO0yUKVUlo0qGgJtbi1xelvPWv1VQVoTq7U5+bKol8+TpWJ1xC7bF4BU
 DpvMjk9r4DXLvNnOdiStbk1J4w==
X-Received: by 2002:aa7:9a1b:0:b0:590:921d:5740 with SMTP id
 w27-20020aa79a1b000000b00590921d5740mr20538709pfj.13.1677476615305; 
 Sun, 26 Feb 2023 21:43:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 19/70] target/hexagon/idef-parser: Use gen_constant for
 gen_extend_tcg_width_op
Date: Sun, 26 Feb 2023 19:41:42 -1000
Message-Id: <20230227054233.390271-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-TUID: KymsjFhYmiUi

We already have a temporary, res, which we can use for the intermediate
shift result.  Simplify the constant to -1 instead of 0xf*f.
This was the last use of gen_tmp_value, so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 30 +++------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index c0e6f2190c..e1a55412c8 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -305,26 +305,6 @@ HexValue gen_tmp(Context *c,
     return rvalue;
 }
 
-static HexValue gen_tmp_value(Context *c,
-                       YYLTYPE *locp,
-                       const char *value,
-                       unsigned bit_width,
-                       HexSignedness signedness)
-{
-    HexValue rvalue;
-    assert(bit_width == 32 || bit_width == 64);
-    memset(&rvalue, 0, sizeof(HexValue));
-    rvalue.type = TEMP;
-    rvalue.bit_width = bit_width;
-    rvalue.signedness = signedness;
-    rvalue.is_dotnew = false;
-    rvalue.tmp.index = c->inst.tmp_count;
-    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
-        " = tcg_const_i", &bit_width, "(", value, ");\n");
-    c->inst.tmp_count++;
-    return rvalue;
-}
-
 static HexValue gen_constant_from_imm(Context *c,
                                       YYLTYPE *locp,
                                       HexValue *value)
@@ -1120,15 +1100,11 @@ static HexValue gen_extend_tcg_width_op(Context *c,
     OUT(c, locp, "tcg_gen_subfi_i", &dst_width);
     OUT(c, locp, "(", &shift, ", ", &dst_width, ", ", &src_width_m, ");\n");
     if (signedness == UNSIGNED) {
-        const char *mask_str = (dst_width == 32)
-            ? "0xffffffff"
-            : "0xffffffffffffffff";
-        HexValue mask = gen_tmp_value(c, locp, mask_str,
-                                     dst_width, UNSIGNED);
+        HexValue mask = gen_constant(c, locp, "-1", dst_width, UNSIGNED);
         OUT(c, locp, "tcg_gen_shr_i", &dst_width, "(",
-            &mask, ", ", &mask, ", ", &shift, ");\n");
+            &res, ", ", &mask, ", ", &shift, ");\n");
         OUT(c, locp, "tcg_gen_and_i", &dst_width, "(",
-            &res, ", ", value, ", ", &mask, ");\n");
+            &res, ", ", &res, ", ", value, ");\n");
     } else {
         OUT(c, locp, "tcg_gen_shl_i", &dst_width, "(",
             &res, ", ", value, ", ", &shift, ");\n");
-- 
2.34.1


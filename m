Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849FECD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIW-0007Ej-EK; Tue, 02 Jun 2026 23:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIE-0006q7-FA
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:24 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIC-0003kG-9C
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:22 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-8423efd76c8so2018857b3a.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457359; x=1781062159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZVmPJQCSPqi58Jv5BnxHTf+Z6+QxTnKCJHuK8VCAuk=;
 b=ynCqUh6nhUCaFSucmGK4lG3bI0HfyK/6Q1IdzwMCNb1cMPvnGBIY6NNLBoQe336HTK
 9aRWp1B76AJpjMdhueiiJBVdXaqgzf9JRELj4x2i87/oB/eZCKO9paGhjC4TktMD8Y/g
 tefXdfLfMijyJs+x8vYPhgMNBKT9q1Hlx2CFQPU2S4p8u2Qv5t9k01Ob7m+36iiZ+uSi
 GUbsM5LkrkQ3kcuxgI8AEcuWGsemCGc6RgehFBqvLdoqUVVnVPTvPQb97J/yqM8O9aP/
 ir2Az2FiVWfGRbylKo4ADBYQzCQos6M8/LxINXEkeZW7LpRaZG2e6N6hqGJHPkRPK79T
 zM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457359; x=1781062159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kZVmPJQCSPqi58Jv5BnxHTf+Z6+QxTnKCJHuK8VCAuk=;
 b=KKAArvPiEqxYEGq8+mCKJVKlRziKayaeDkl5nNW4hPhoA0CPBS4EjP+A9S+Cqh6GbB
 ZiokECkArSBRjFqdFYq6axkRqiKmD/+9Ltu9ve4X1/i0vVl0i0TlFnBCRrxsNith+iyE
 Ynj+C5aW7aXMjtC27JecTPB2Vwiyt2hEBZhL3ZwcgkFgiq8FdRTLKGbKu8PpzVpL99kG
 NNFUwXVU2sBPcfi/oKMHh7YIikR+8MiCIDA9iR7WbOLZ7s0dxsNagVik13wJyqIOk+vj
 muKsQ6p0Duoayw34PJHiJ9lqUr8t4M/zonLf3FIqlyVB1yusJKyGz41mf1QarWsLOZ3c
 zJ0w==
X-Gm-Message-State: AOJu0YzL0ZUn9DLRcIAZlG+EpxMjIzIGWFDc3KBAPTNjh77VUWGrnz+g
 QpvpUCAOX3VhT2E23Otx1SHa1KnUv3zWrkM6y2QOIw8T5sDJ5t5arnTIIM7Il++hJHxnKkgiFrS
 E/Qh1FLA=
X-Gm-Gg: Acq92OFiOScT27Sm2PyFB9/1888RCH61uGjuT11fDxNuj9HBYJ2iyau+Gnu4fxI4meE
 klA2sXRuSRHjmsYIyOoC7gV06ahQoBnLlyzyuKiv/QA/jnnH8JWWq0pFD941rTf8GbX5Sr5a3qp
 guVqL3khh2MpUl4D2dEoYHt61HcJHvIga+Ztm4p6m/CXKMMs3xId2mhjB3yZkWYxqMQwkMxn7Qf
 uv9HnxPaPGEE4vXGmqsaiqIU0YvHGfU6HihAOg+9rg9gWvW83icsCMw5wrv6zOiJlL15O+9ljtt
 y1B+6CsK05j2sY1cLh/2ofPG6TRs0HZ0yFr2xCWRRLf8HbggTZRw5PacJnVKx6CuLgScE6Wor1e
 3LJQqXvhVP+xlBp5wqipzOsDKCxGPBWwCz6XrCLT7/QqxgFp6BjBUTLeoJbpK1M/WxxHcfG2J9P
 qqZ9s2GzdObKPU985JsZSoTwnFnwyF0nGaKwuwLUac//xWpSslmg==
X-Received: by 2002:aa7:8882:0:b0:842:38d2:a35f with SMTP id
 d2e1a72fcca58-84284e8dc75mr1683502b3a.31.1780457358562; 
 Tue, 02 Jun 2026 20:29:18 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 32/45] target/arm: Implement FMLALL{BB,BT,TB,TT} for SVE
Date: Tue,  2 Jun 2026 20:28:41 -0700
Message-ID: <20260603032855.106930-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 3 +++
 target/arm/tcg/sve.decode      | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 78ee893f4f..6c4e372b67 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8388,3 +8388,6 @@ static bool do_fmla_fp8(DisasContext *s, arg_rxx *a, gen_helper_gvec_3_ptr *fn)
 
 TRANS(FMLAL_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
 TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
+
+TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
+TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 71ec09393c..06bbd7fa63 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1868,6 +1868,8 @@ BFMLSLT_zzzw    01100100 11 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_ex esz=2
 
 FMLAL_hb        01100100 10 1 rm:5 100 idxn:1 10 rn:5 rd:5 &rxx idxm=0
 
+FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
+
 ### SVE2 floating-point dot-product
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
@@ -1887,6 +1889,9 @@ BFMLSLT_zzxw    01100100 11 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
 FMLAL_idx_hb    01100100 idxn:1 01 .. rm:3 0101 .. rn:5 rd:5 \
                 &rxx idxm=%index4_19_10
 
+FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
+                &rxx idxm=%index4_19_10
+
 ### SVE2 floating-point dot-product (indexed)
 
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
-- 
2.43.0



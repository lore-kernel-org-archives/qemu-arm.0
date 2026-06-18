Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E034CD98FB
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:16:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4AM-0005Yv-NU; Thu, 18 Jun 2026 00:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A5-0005V4-6R
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A3-0005az-Ia
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:28 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2c6bb8a5980so3501645ad.2
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756125; x=1782360925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3chygMCcsKBu4o67vLIyPSrCAz2YQp8nqMW9makXS+Q=;
 b=qY/oMymPWRCq31OxnG8YdFOR0nN2onIsS8Vy52WzNXs877/Cd+nKk+jDwWSSY9qMTX
 h6eSTosqZRx7z+0vTMpJdkxSks1vqbWhmOtpCR+3g8uqOvA4tk0REnDzuQZktVCFooBa
 jRUb244ytYkZcoCYRs3MpXPUtUwruq0kQFR34MPyLBLbbNH8eNjz5uHt+NGLtVT0n2mV
 2dRH/ZGg7HcezGlt/KZZCYv/rW5v7d2PRnAKzVIwJ+XOKOtk5ZnBAPPjnHXINZYkuPgG
 HL0gqXH3d/W5BIqMiOUyPWc+J/cKpo9wTHtB9iz+zWDnAYYplb3e7OmAo1C4FCemkkaK
 +mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756125; x=1782360925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3chygMCcsKBu4o67vLIyPSrCAz2YQp8nqMW9makXS+Q=;
 b=CQhsVqP5T3IHlTCLj7sDKoFi9LESWQOulH6o9yOtMyCZEH+zRXH2Jd/duQYuT6I41n
 mZXwZw3ifAXdCLUbhvLxMBFcRhC97pcTmXYZBD26Vlr2knUrA9uqqzWNlwLgjTEaipO5
 GviEIyL6bfokUp4TSl6TytDk+BPigaYvKp18s5N6WXqT8Kmsp+4OVfhkYGQR9GIZ9oo6
 6Zy8e0JzkuYUbxXCFTB1U+czJNc0QrVhtnKoNrkdQTwAMdz3LsRSFjm7QeoZlaXKPT2O
 7lkdXIC9xqsDrzwSsn8FndFYTvfg+6CJ49WukzCai+/DgHHQYD04S9KS7ilohLa9SESo
 abcQ==
X-Gm-Message-State: AOJu0Yx17b936WmsiBr/1ZEjaAyVQIWJY4sxXdeaN5YgDmQQwNeAmUZy
 n4TTWLrgPDvBeJWl273RZp6Dkp9aCSuETn4UK6J1fkJOaplQAS2V3VY2/iHFH5Bp5S/93BpZWti
 gl6OR
X-Gm-Gg: AfdE7cmB+/pN6eQ19IsVOXeB7JD8KEKDBaQY0Y4fp99Ibbd7tRuE7AWuRrvJSvO/jux
 idBOYaqjkgokCSStbd/HT4EeMWsnibl8B9dDXSq3l66L6hGos4rkd1cSqfTF58dpuvNC034LvNY
 w74L8Y5QgUjo+L5D5202tZEBPBpNfdnCXoeB8+n+z3hh2iDlchg1I4DyuUGaDu8DieKjiUDEujv
 UGAvHPvMf6IVmhTS662aayy3VAz7pJajjmft/hIDd5b4H0ABK9svjvHON3WLtvvKnE4n0TdJYjA
 wHHqWQXCkPwtSzmBepAN+R/6Oev+S8Ort2U4djqG1rbgFVokc8pPUoe0TmBKVIALC3euIAFrKo1
 LlsFDMYEnLCAeGfbrWZBudDd0so6Zsys+6yQmsF+yQ/6Ii0LlkVpro9H+cRRu4d5yKVhdg96APK
 8UesozpaYaJexBZWC7sefRWjeZjsunoJc5VJzQvGDZ4vvbDUAHj9WwZoi6Gt5E
X-Received: by 2002:a17:902:e54b:b0:2bc:b80f:6782 with SMTP id
 d9443c01a7336-2c6e484a87fmr19979335ad.11.1781756125450; 
 Wed, 17 Jun 2026 21:15:25 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/10] target/arm: Implement FMLALL (multiple and indexed
 vector)
Date: Wed, 17 Jun 2026 21:15:12 -0700
Message-ID: <20260618041517.573469-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
References: <20260618041517.573469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/arm/tcg/translate-sme.c | 4 ++++
 target/arm/tcg/sme.decode      | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index ae1dbd0528..cc85c6d6e0 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1157,6 +1157,10 @@ static bool do_bfmlal_nx(DisasContext *s, arg_azx_n *a, bool sub)
 TRANS_FEAT(BFMLAL_nx, aa64_sme2, do_bfmlal_nx, a, false)
 TRANS_FEAT(BFMLSL_nx, aa64_sme2, do_bfmlal_nx, a, true)
 
+TRANS_FEAT(FMLALL_nx_b, aa64_sme_f8f32, do_azz_acc_fp8,
+           a->n, 4, a->rv, a->off, a->zn, a->zm,
+           a->idx << 2, 0, false, gen_helper_gvec_fmla_idx_sb)
+
 static bool do_fdot(DisasContext *s, arg_azz_n *a, bool multi)
 {
     return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 1, 0,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index ccc33463c2..80ad674cf2 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -771,6 +771,10 @@ FMLS_nx_h       11000001 0001 .... 1 .. 1.. ...00 1 ....    @azx_4x1_i3_o3
 FMLS_nx_s       11000001 0101 .... 1 .. 0.. ...00 10 ...    @azx_4x1_i2_o3
 FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
 
+FMLALL_nx_b     11000001 0100 .... . .. ... ..... 000 ..    @azx_1x1_i4_o2
+FMLALL_nx_b     11000001 1001 .... 0 .. 0.. ....1 00.. .    @azx_2x1_i4_o1
+FMLALL_nx_b     11000001 0001 .... 1 .. 0.. ...10 00.. .    @azx_4x1_i4_o1
+
 ### SME2 Add / Sub array accumulators
 
 ADD_aaz_s       11000001 101 000000 .. 111 ....0 10 ...     @az_2x2_o3
-- 
2.43.0



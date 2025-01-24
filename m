Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932061njk;
        Fri, 24 Jan 2025 08:37:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCjGYtmOvEMjJ6ckgSiqGh6ZVdJyfECzZySRVZbvasZdJI2RzBPr9nxlmuf/TpizFNiws9I0HHB3EZBA==@linaro.org
X-Google-Smtp-Source: AGHT+IH5McTJK61ooPfL8HB1o0iQbNkHKE1NVZ9fozoQU5qYN+OF2+qiLFSt8jhuWXUSlcJgPfyw
X-Received: by 2002:a05:6122:1908:b0:518:965c:34a with SMTP id 71dfb90a1353d-51d592cb265mr28326360e0c.2.1737736669582;
        Fri, 24 Jan 2025 08:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736669; cv=none;
        d=google.com; s=arc-20240605;
        b=TcnHvzD13TM3QgbEQSmVUPfMphcSldAgytd933JW1EUrFY/tHJ2Ksr/iPWX0xnE+tl
         o0f4kaaR/cf6av2gWFlQvNWzWiKVbM7GiOEevPy6p66GoXvg9bx3mZYcckOruDdC3Hgm
         EJX4liALDXb/ETihtqOHO7ABDPo4M3PV7ZEW4BTjOtzPfrrDwHe3OiKS+CAq39LilalY
         0xozuX6eUPGfy7koeobZVxMKzSmc+boEhcX9HkO1vEFIqpO14l9cXQPBPs+JAv/KF22n
         dHnrxd2qLBuLCHMEplddaGXKq/vUiHbrd5ZFVKzypv9K8oGtKeKuzzb8S8LuKyKvFJTf
         GSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vkN1tvZXYem3cLB2r+/GaeAu/aQPELpTO9bRu2GSjS0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=P9uDWBKShHR9Pf+AfzsmYLoJe54FelWBrTbOloRYBUEKtJrMnSl+XtOzQwdFtTZZoC
         5YhUHfo8K1N+S0/L0Qu8CBlVjyw0St6eIp4aIt6Uo1QcrNUf7PfjEb0RgIRvJpeplSH4
         ETwHeoSkly6JOnBoe5PfSEt2WeA6m6fxK5TvddVJgzE/sJTuVT92l0FysFWhyYCTvEb0
         rYmIg9dF0eebUPi/i7dNxVJ/vpUWJGdMTVuRlDi4tTiHcxSzy/07jfDeCWyP+HtnnYLM
         in3+uyjlRL7t9mziiSfaYQczLhLJmLI9G7lChbRJ7m/YJmLJt1Vd9t/2wt0gaVaHMCpx
         YtHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QA9ekjkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ec7f888si992917e0c.193.2025.01.24.08.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QA9ekjkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMfz-0005ql-8s; Fri, 24 Jan 2025 11:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ7-0005oj-3O
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:00 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZ4-0005kQ-K8
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:52 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso16866185e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736189; x=1738340989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vkN1tvZXYem3cLB2r+/GaeAu/aQPELpTO9bRu2GSjS0=;
 b=QA9ekjkF/0amWxMUvExS+Kru6TyW1dA2ONt43UHo27G2TEW2kcpkarY30KKZsqlzEh
 PUWM4vwyF/WEqY1V2rHnhn5X9MlJfQ1nImIE2nF1dc1pJDrJ58xDPEcxYQ4pYm6dMxqJ
 sF8Nd5cH92/4iIec2qWt/o635Yb5Yn5f7GeQcmhOrxMb0By1oNz0ALmjtZHuf6lJ7FW6
 MYHfvHAGSvbbzZLZspzzTduRMo4cDHAbJRV4+uVeewgNEqNkmtUTYwLFciMC2cYJxu71
 1Z85ECxr+AC5Ye5+Y1jMBReLuQ/IdQfJE8Kw4tAR/zvdiNmUHdy/1/b/EZhHLTX3CvXT
 3lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736189; x=1738340989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkN1tvZXYem3cLB2r+/GaeAu/aQPELpTO9bRu2GSjS0=;
 b=VIJdqZAbyHA0qhbH8i8j9D7C1QHMH05kK8Pi8iSwvZwsNVyqT1jeiyIzZ8I1op51Fs
 p+DsVKY0Zb+BuuAF/c/l90+kbDAUAALyD6hMWdTrRWiTr7kN1rIGW55kAzTuoETrQTKB
 1V3YlKVjmYZwHGLkuomFrNOk7d6J+cu5iE6xNivrnWBFfG7oUWaGLCnZMsrEyLfKTeW7
 K8A9lfJP2TQxe1wheceuiZ5mt0RnU4hf6KC6zNjY45ZfIR9IQturTtOJkS6Db1OJDzNO
 SVAKGjTUIAadXtSYKHM91N93IGKiTpSDxqG7PRLbEMKZAlk9naP8PIJiV91EGyqylWuF
 9bUA==
X-Gm-Message-State: AOJu0YyyKZWPRoKr9cbMevymGJnb4jw+5r4jIS2Jbbu4IdvzhdLiN2Ho
 ZJ6ugUNe/Xtcn3WjKyzmgu/9l1L/ApVtbZGHQxstqsQJb8/+3kxCEjvLisN47aRgP44DNZsB+iR
 e
X-Gm-Gg: ASbGnctKIYmAeY/3VquOlsLpisZxrzAwClN/US0sR5QxwkqMfCsjUoumMc7bu87Nfrp
 ddjDkuYao3mn2c6n1NxkLlSw1Xko0TEzKoCLvC6eH1YGJWlNXufg3lV7KqyFUpdx/aUATie5ggl
 LpGCBFdVvWH8TZIUwmogQuqDHCJL2wb823lw05DnfKywapoUmq+vpqsAPmuktWne6XJNLdwGMX5
 XJ2oTybiC5kxxD8FXck4S1DTwFj4gadCIogksLPhReB1MjpxAunpbhLy+KFx6Z0WknTGkLQNekr
 yz8fBPWNzDE=
X-Received: by 2002:a05:600c:1f19:b0:434:a1d3:a30f with SMTP id
 5b1f17b1804b1-438b9cc072emr73449355e9.6.1737736188906; 
 Fri, 24 Jan 2025 08:29:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 56/76] target/arm: Handle FPCR.AH in SVE FABS
Date: Fri, 24 Jan 2025 16:28:16 +0000
Message-Id: <20250124162836.2332150-57-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: fR5cbm8KlvMu

Make SVE FABS honour the FPCR.AH "don't negate the sign of a NaN" semantics.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 4 ++++
 target/arm/tcg/sve_helper.c    | 8 ++++++++
 target/arm/tcg/translate-sve.c | 7 ++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 867a6d96e04..ff12f650c87 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -541,6 +541,10 @@ DEF_HELPER_FLAGS_4(sve_fabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_fabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_fabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_ah_fabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ah_fabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_ah_fabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_fneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_fneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_fneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 976f3be44e0..5ce7d736475 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -879,6 +879,14 @@ DO_ZPZ(sve_fabs_h, uint16_t, H1_2, DO_FABS)
 DO_ZPZ(sve_fabs_s, uint32_t, H1_4, DO_FABS)
 DO_ZPZ_D(sve_fabs_d, uint64_t, DO_FABS)
 
+#define DO_AH_FABS_H(N) (float16_is_any_nan(N) ? (N) : DO_FABS(N))
+#define DO_AH_FABS_S(N) (float32_is_any_nan(N) ? (N) : DO_FABS(N))
+#define DO_AH_FABS_D(N) (float64_is_any_nan(N) ? (N) : DO_FABS(N))
+
+DO_ZPZ(sve_ah_fabs_h, uint16_t, H1_2, DO_AH_FABS_H)
+DO_ZPZ(sve_ah_fabs_s, uint32_t, H1_4, DO_AH_FABS_S)
+DO_ZPZ_D(sve_ah_fabs_d, uint64_t, DO_AH_FABS_D)
+
 #define DO_FNEG(N)    (N ^ ~((__typeof(N))-1 >> 1))
 
 DO_ZPZ(sve_fneg_h, uint16_t, H1_2, DO_FNEG)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c173627ad49..c234a4910dd 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -783,7 +783,12 @@ static gen_helper_gvec_3 * const fabs_fns[4] = {
     NULL,                  gen_helper_sve_fabs_h,
     gen_helper_sve_fabs_s, gen_helper_sve_fabs_d,
 };
-TRANS_FEAT(FABS, aa64_sve, gen_gvec_ool_arg_zpz, fabs_fns[a->esz], a, 0)
+static gen_helper_gvec_3 * const fabs_ah_fns[4] = {
+    NULL,                  gen_helper_sve_ah_fabs_h,
+    gen_helper_sve_ah_fabs_s, gen_helper_sve_ah_fabs_d,
+};
+TRANS_FEAT(FABS, aa64_sve, gen_gvec_ool_arg_zpz,
+           s->fpcr_ah ? fabs_ah_fns[a->esz] : fabs_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const fneg_fns[4] = {
     NULL,                  gen_helper_sve_fneg_h,
-- 
2.34.1


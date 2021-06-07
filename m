Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3689000lfa;
        Mon, 7 Jun 2021 10:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOh51SvuQgOWzFxrBQSO0OyRqT6361E3iEnoTbPRhJjf/21rQbyQZhTZtQU0kD9reAHkhI
X-Received: by 2002:a05:6102:2122:: with SMTP id f2mr10223351vsg.35.1623086245045;
        Mon, 07 Jun 2021 10:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086245; cv=none;
        d=google.com; s=arc-20160816;
        b=UBGTOTai8DqfZGPbc/FwNKEu0KY0QIz/IFZER4toSYCqGF7elajNS/PJJxWymWaEqJ
         37FFh5wIYhqTHfm0KRMdg903fgrEL1wzGFrywZ28XIE/Au8u3TTeCzKbFszy/uDjzf/v
         JaHbMiBkmaLM6tVWCj0gHTEz5dp6Y4XZYiT689Ubv2KU/EU3nhUNNN5kphqtCHgJfDxH
         L60p/Thn1CYUnYozsuohscDWDuAKLWeQEPgLLLYRwE/JpRzNb/cd8fBCu30RWwsYE0f2
         McQaRoAEvJFVIOCsLFf/6LbYkBUbXiN/b13Xeg+fz+HJiptxEog8Vt+wmt6wKCuoDg2x
         fAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UKObK+AC5cnOXlKUFJTRnyweOq/BU34z8pGGhw+DG7o=;
        b=EDk5d6Tsf3cxg0KegsLzcNQrdU5+g27vZ4PqZdnp35z1YjI1Vegr22Dk9kxbPBeeBJ
         YneY/HC5/oi0jrW6MmqhiuOvW+afC9WL3UrLhhf2sjQ9A4Gqh0catWHAMC0J+KTYzg2H
         0FXF5X7FZy8VpDJbr9X9PFIg+4sighcWiHXsqTvAHdKvrLCOhqHO5Nsnk9Ej53gQStp5
         00zgIix/qPL1j0kHkwbrQQUz2e9GpIY1zjx8JKn6jKMpQZ6kpaATnU2/6FrSMG820N/j
         s9Wcs7Iwh+qpLhyou/iI9N/kAW42PLHSsgMLvxNyN7drlSBEb0DVUFg9fsMQ9sUWf0aP
         X5rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKDtM0iD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si5180704ual.185.2021.06.07.10.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nKDtM0iD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIsO-0006bN-AV
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIag-0007aG-Sq
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaG-0007yY-Dz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso53977wmj.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UKObK+AC5cnOXlKUFJTRnyweOq/BU34z8pGGhw+DG7o=;
 b=nKDtM0iDMHHQ9Wtdl3RF5d9fdL4DCOMI7b65mPebD0izlxrheqvkcHgdDaQ8Zk4eA7
 5Ox8dJbo7Vi7tEeZXyOJbACITYavKu/pqAyG1y/XrR/ed1Ll8NrsOaIH3L2OlginAxWi
 DwDghPNTSO3M1LlGb7L11Vah5yVyIetBTMx02pGLcxnFM6z81Z4Iked7qjXkNSYnqEg9
 8dD4i0J6DqKFbzCkL+VBpEVgmMiYHl56gsYInb44ihLZ6KoNfaZ3T83EhDcCIr1y3FmS
 eEBEE9eWcUIEI0VLKqj6dOJbMFu38et4jBhEGE/U5xz2MDqnpDrSijVq2b0bpyCMKf64
 O8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UKObK+AC5cnOXlKUFJTRnyweOq/BU34z8pGGhw+DG7o=;
 b=W7jQIupFID5YQx6eMGqC5GWxAL1tVI8A8OupYT2eWHqrMJ4gsP1A+h4KhZNil7eEZ7
 qX3OsuWA2R4gKkwadxCVhhgfBhYG4jbkXVfHQ+SaDKgy4IUOj3W7qSck5u3pYZ7mLCrz
 O1Rm8qLb3vYvNRarlaqVCzHjI4pKPQXSv2qQuzHe55u9yKOk50/4VTFypIiSaO2WVPz9
 3LC/nUIsxJEsmA92v4DYgCwi2NKjNQUzafXZ5wYmvvyqjfT3QgMDPK0nykfEveR+Q9z6
 4mFNhdrGLUB/xeQt5uDOv9979QkIJD3/S0oaidtEvycyZg62FyLUR2IlzVkuF1fHUtR+
 T+cQ==
X-Gm-Message-State: AOAM533oZLTroIXWBW135XvAzl3UThGH3vfz8t2KMuL5N3d6LyYa0Zq/
 YpZpdjEzhcfcUFucl4e/tRg64A==
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr17790198wmf.146.1623085119147; 
 Mon, 07 Jun 2021 09:58:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/55] target/arm: Implement MVE VNEG
Date: Mon,  7 Jun 2021 17:57:45 +0100
Message-Id: <20210607165821.9892-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a3t4dW85TeBl

Implement the MVE VNEG insn (both integer and floating point forms).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 10 ++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 76508d5dd71..733a54d2e3c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -55,3 +55,9 @@ DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 66963dc1847..82cc0abcb82 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -80,3 +80,5 @@ VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
 
 VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
 VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
+VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
+VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 2ab05e66dfc..b14826c05a7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -278,3 +278,13 @@ DO_1OP(vabsw, 4, int32_t, H4, DO_ABS)
 
 DO_1OP(vfabsh, 2, uint16_t, H2, DO_FABS)
 DO_1OP(vfabss, 4, uint32_t, H4, DO_FABS)
+
+#define DO_NEG(N)    (-(N))
+#define DO_FNEG(N)    ((N) ^ ~((__typeof(N))-1 >> 1))
+
+DO_1OP(vnegb, 1, int8_t, H1, DO_NEG)
+DO_1OP(vnegh, 2, int16_t, H2, DO_NEG)
+DO_1OP(vnegw, 4, int32_t, H4, DO_NEG)
+
+DO_1OP(vfnegh, 2, uint16_t, H2, DO_FNEG)
+DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index badd4da2cbf..086cac9f0cd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -212,6 +212,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
+DO_1OP(VNEG, vneg)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -264,3 +265,17 @@ static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
+{
+    MVEGenOneOpFn *fns[] = {
+        NULL,
+        gen_helper_mve_vfnegh,
+        gen_helper_mve_vfnegs,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


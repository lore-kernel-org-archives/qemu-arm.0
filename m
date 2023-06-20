Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp200302ejt;
        Tue, 20 Jun 2023 04:12:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XtElWV3W3/OtsH89eukOEMefl/GsAdR+Kqn3EzfBWiEM190+kj3r71xoTEShstoOjd5ZE
X-Received: by 2002:a05:620a:8bcc:b0:762:5aeb:23e7 with SMTP id qy12-20020a05620a8bcc00b007625aeb23e7mr3482589qkn.68.1687259558670;
        Tue, 20 Jun 2023 04:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259558; cv=none;
        d=google.com; s=arc-20160816;
        b=LYTWl6xu4VanwYdSskz1coF3JCUTNc1wmpjgVq+Fg5KbJ3p3khnDTbx7iISNa/usLL
         imLiDdwPZ6ex5WTuIfH0H+iJedq5RHJYUyKV3ZqGY/rKePrFXMti+Vbuy9jejfMZl2KW
         usIVxVw9IAkmgfc8xhaGWxBpLFiIV2+tFUPRGlPN13n/PiXTIGRwz0VE/bPujHsR/5aV
         x5/c25YX7VI6bmkzUeg8L2bC8aSyBK67AZjs/EozROtL/oYRwc3iv9eoBWsqUd6pgVT3
         yffsQFidb43EyREz9zKVlrjKHKeGbV4kTmOF+/W4cCGCtGf2BBEUVW+rg6dUukOC2wOy
         Lqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NQsBpcgKVgYp7fXYDQVN06TvKGcdOIek7QQgIG6AozQ=;
        b=GOp+Lg+XK4UOUzCnYLbbeiQ6gaONi07vlRuhCuHM6ptJSMsNATL+JQO4bhh4fF9oxy
         1xLF2egpumQuEHph38Bfo1tFgoYJWPQziV/cSC8HQ4gsvdFjCfJ1KEwA/zf6fSdAJ9G0
         U7I/+PqUVIgwKWERZAd4/CZbPt7nMmAivcY9FinQkIuuntHMB6Q2gHyE9pUNhFqzukP6
         iVxQEJ/Qwv4z1kyGO3ASKPMQLJ8pcZ5pUlbosY83L9kZuwWtkpqnuV63H4NZgBbZBl4o
         oefl/zy8KlMgFcNHO/ULFzu/QDcTvH+ETr10NdWuri7ATy64znuDsPCIB1NSNvbSEH0D
         6R4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+JtSff8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020ae9e416000000b00763b90ee93dsi93316qkc.657.2023.06.20.04.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+JtSff8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBZEK-0006ue-4m; Tue, 20 Jun 2023 07:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE4-0006eB-QF
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:45 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE1-0004W4-Pq
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:44 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-988aefaa44eso307780466b.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259320; x=1689851320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQsBpcgKVgYp7fXYDQVN06TvKGcdOIek7QQgIG6AozQ=;
 b=h+JtSff8IYkVKAcdBJf7nEaauxjEKByEkA110g78iFFmEc8P88p9doYhiOONWqCcFF
 xm/3Vb8SYXwAfPgZFMyJVv3lSmtNlZY498Uy0Rh4I/7maeDJSwf9eqODmg2H6R/seoGC
 0YjJmjDadmgalAGubcLCT6jb5csT0tPJRPH7l+HxOJbLdAyGZR4ay2wV3cFuLsXbr1Un
 I4Ge2roiVIikapF7jiZ0gVu7qD1WPJP48dbjBz3AUkAtdjwpVDsTKkCc27eYx4Gz5wk/
 Ydgl/fKkYhxHtcIIA1b12UyHbDUsZyk5Rc4yY3dVQiioe0Hu6eC6Z3MjGGu3m3fvjXKa
 Ck+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259320; x=1689851320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQsBpcgKVgYp7fXYDQVN06TvKGcdOIek7QQgIG6AozQ=;
 b=kSjyhZSRLK5OeCNI2pSZVaO172Uzd77clcortDVBj8FLkSlP3lquIlSmeyKdbLZbrP
 ptDSraFqFWiZAhU1rX9l48oXz3OkBRR8KD+pPYEi19xArVcuqklJsDIzWPeIgKHm11/I
 iq6ARFuTx3R8QeK90z6iAppkNNEJJWrcbv4dM/KJoZjnhkbVrgQKOD6r/6MLCpBEE37o
 0fPSanYORT8EkZ0tTFgbZB4oG46n0Ay6vryRqS9j3wmRrVdIk1tUgo1ZMulkzkZ2CrQ7
 u2iJN4mOugw5yHRE4RfOeZpJ8KTzEn5olnbgfLbULcI8komaQRF/0GA1LMYibrHLKECo
 tGBg==
X-Gm-Message-State: AC+VfDzpyxSd34rryxAiFhIGeMuhAZaFDVE3b4U6CVeKHHzz8He2xpTt
 lVjqk2H8z8Pbz5ITA0gXtyuQ9FTrCzw+vkXjUKDwFyps
X-Received: by 2002:a17:907:36c6:b0:974:1d8b:ca5e with SMTP id
 bj6-20020a17090736c600b009741d8bca5emr10362897ejc.14.1687259320379; 
 Tue, 20 Jun 2023 04:08:40 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 30/37] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Date: Tue, 20 Jun 2023 13:07:51 +0200
Message-Id: <20230620110758.787479-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: OovI9nuLGcug

This implements the VNCIPHER instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 1e477924b7..834da80fe3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2947,22 +2947,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    /* This differs from what is written in ISA V2.07.  The RTL is */
-    /* incorrect and will be fixed in V2.07B.                      */
-    int i;
-    ppc_avr_t tmp;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
-    }
-
-    VECTOR_FOR_INORDER_I(i, u32) {
-        r->VsrW(i) =
-            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
-            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
-            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
-            AES_imc[tmp.VsrB(4 * i + 3)][3];
-    }
+    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
 }
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


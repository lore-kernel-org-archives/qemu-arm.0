Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1769092njb;
        Mon, 14 Oct 2024 03:51:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUScKC5Rntix0fXkNaseJ3PEneZwpacsAcP/3MooKeDtzNoFPr1m2M9TyKRHS4sZxqZ83NjDWoFDhAs+w==@linaro.org
X-Google-Smtp-Source: AGHT+IF89KLkIHMgN4I5kKf8fgYFwpCgUa7saukCd34LX58O8HxQl5PTQZFwOCT00xjOSIW+6bIg
X-Received: by 2002:a05:6214:320b:b0:6cb:a3a9:f07a with SMTP id 6a1803df08f44-6cbf00098e5mr150012676d6.33.1728903081760;
        Mon, 14 Oct 2024 03:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728903081; cv=none;
        d=google.com; s=arc-20240605;
        b=XEueyKobyRH7nGY4iJPW6mFyDDHd6L4Yh21Ld/U0A0IUGiYfgm/nDrfJsjT01l2o9R
         i51waqhmKD8/rBBANHHLRAGWTQt3s2+KE5JCXrxIr2a430C65QjPT2XoaMAo7LBPgKsW
         bsQLuyYQMYvZhVWkQUAW/Xv7LuUBj/uvW//dcfa1mDFnbuamiATTJniUBEc8cBOJZAWs
         PbMF8VJ/rFgZmQA36i30W8fhJ3uj2xHD0q+A7sKBeNVvWjJjTKeP/qsEq+hiaoLmglG3
         FIPyE3G/X5kSbGPyHsRd0W8z0UL+XvGLB9EwwBP2AMLYOgX2L+T6pGjef3g+NkUYFZ6M
         Ih/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=FqdRX8rWWQZot3qHzNkktBViXx6N2VJ6p90ru7IT+NI=;
        fh=yTdOFu0RRmJvKNVu4XYM43E6ZTPiDthxkzqZe1wiZSc=;
        b=K+efDEAY28YURUei/cTiSyKmvLm6SsTyB2OQNR2SrDLvicPdI7QYh3nYtFLCBZ2r6a
         Zk+g7PQOKieKhSLH86MSgMfnX7Wg/BjWS61AM6Z8NUbQmY8xL7vrYc5QYn6h3/QEDT+C
         REYydbxCtX7heqLJydVzyWk31XAxv4YwWDXN5zTcvunTfbeR3NVi9h5Q/3M49w1ye1zK
         OXDp6EHgLqRzVW8uzjUM77x1sFpjbYuPlX/5jbhZCcYghq5p77luVaU4sVGy7rCAVKNA
         Sp6l7keXfDjcYlV3V/9iH8Snl8sqQ73lI94Wpi/CBI3cbX0wgX7xhz5SFK9tH/OE1CMa
         596g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tPc/oLo0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe85e07b5si104562786d6.155.2024.10.14.03.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 03:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tPc/oLo0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0If2-00041I-7x; Mon, 14 Oct 2024 06:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t0Ier-0003z9-66
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 06:50:37 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1t0Iep-0006Ur-L3
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 06:50:36 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso119617866b.1
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728903033; x=1729507833; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FqdRX8rWWQZot3qHzNkktBViXx6N2VJ6p90ru7IT+NI=;
 b=tPc/oLo0tGXTA8NjOUm0VZ2RBQJOxRkGa3Th/tQizfwwRsROfHRVg7HLbrR7RL3vlD
 WBQFXCwDt7YrZnPQ5L0ZuYaTemTc/c96eX83IhTpGApusce0pwU07DVBEPu8ZJmCzqqb
 2OWFrqLfkbY0rNLDsJzITteoDkL6VmAPDNCxvKSp17PGXDDwbgd6ow5H0cJTy2T/Q9OV
 Aff94DDdmLF3sGWtDCU5ZbLnMl5FxKQpueNQJZEwKORRP/s1ZQlzbv8lNusWqsYttdWH
 OZT+i25l3hZCyPdLkbteDfzxv/0N3Na6qkGp0CGl75VBt7VdwY0vCaPOMbyToGSidEGm
 0oNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728903033; x=1729507833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FqdRX8rWWQZot3qHzNkktBViXx6N2VJ6p90ru7IT+NI=;
 b=Bcv7xi2zUWYmLsISiv6ubH1N+cG9AiDZfJZoadgkrsa99Ak3Jhgxuh0Ih9EdtPYTzK
 fjLp6wlsImcKQ6h/pmH15iRzun6j3eR9otWMsB0DxHLrmxOAGYoZYjQ1syE8FncQzPv1
 kKBfDBNqovV7ueE5bU6704Vg18/GiM2ZdsKHQuCTCin2K6wVBOMdfixmYbbwHaug91I8
 4a/IPMPXpB2LBMOwtLOMbQFGciZEB7wxUvvCMzovwatEfOF86rfNeB9l4pwy5g1W9XL6
 40QUgzufhbfwLfijOQmN0deG+Sf6YTon6OQtXMtbjkrRmgoDfW5ZSglG3X5wJny0wWX9
 GsSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9UvjufTX5DrV5PdLcTvnIEIYrYbxve8phuo9t3xcCML+c/JDo0T+GIaDCETuwEZ8CAZKwNUTSbw==@nongnu.org
X-Gm-Message-State: AOJu0Yz3PPNsqOdxFusqfaQr2PkXdqVIwrHh+mKHpiWmjXZiMtd0goM4
 gs+rcF62bjlcUULJJ8is3wGWLIbP+X4dyx/FdLpDtmNdObnTyjqyoqx7zmNXAT/csG3Gqrr+pBJ
 MAvU=
X-Received: by 2002:a17:907:948b:b0:a99:8378:b939 with SMTP id
 a640c23a62f3a-a99b931457amr1176555366b.2.1728903033348; 
 Mon, 14 Oct 2024 03:50:33 -0700 (PDT)
Received: from [127.0.1.1] (adsl-161.109.242.225.tellas.gr. [109.242.225.161])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a0b25226esm165504466b.59.2024.10.14.03.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:50:32 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 14 Oct 2024 13:48:57 +0300
Subject: [RFC PATCH 3/4] arm/tcg/cpu64: add FEAT_XS feat in max cpu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-arm-feat-xs-v1-3-42bb714d6b11@linaro.org>
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-12fc5
X-Developer-Signature: v=1; a=openpgp-sha256; l=866;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=2P48Fv5+Lkmmjb718r2nmwRh4AwjSWhQm01a98g8ng0=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm5EUGQxUTdudkxadVgrUDVnTFJNbUxaUWMraGV6CjhmNVhNeEM4bDZ6VTRKdEdh
 U21KQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnd6M2RRQUt
 DUkIzS2Nkd2YzNEowTkg4RC80a3JuSDZ4NVJ5NURFMXZNL2VuR25uNGtUSkNWWExQQUlHM3lYMw
 pKOVNxZFdvYi9WdFRraDMzalVlTFVVbU9WUnJjY1ByNXVXdEgxSmlEclFZNG82SnNsZnFIUnErQ
 nNoVmFNZzZNCjJGeEdMVUl4L0dzaFlyazBNTndKVjUxU3AwYWJHeHpyYjNTOHJxemh4YWxZN3Yy
 bXEwV1Ayb0hvVGdOcW5ZNisKNEZkVE5Nc09KMmJJYmUwODZ6Z2REVVMxeVY0N0pFWEZPaGZoc0R
 iMDYvNGNLMnJtY29ZS24zenkrak1NVmFmQgpGSDZ6OWdjVWxVcUhiL1h0bURFOWcrT1ZDbXZvSH
 FVZFFNbTZxdkxFVERNT1VPSnBjWUlIV1JNbkRIT0NIM0pECjIwUGdGYkdtM2FEQnVDcnBhZW1lU
 2Z5aVlRVlBkOXNXVldNYTdYNUJsaGhsM2IrOEZ6VnVTMStBSTM3Um9ZMncKVUNtL0JObkVaWVBr
 QXlwa1NaZzNCNWNUVmJtUWlOc1l3b1l0RG1mY1lYM0VkeXBucXJyanIraHhlMGJYSktEUApVQTJ
 0OFJWWmNDVTY1N0hWM1EzMzVSc2IyTkxNWWJ5RkJNeUhqeTBkVjhOTXY1emJSaXk0b0pzNTA2OH
 NSZS9RCm1JSHNyeXZOeTZwS2E5ektNZ3V1RUhtSE93MGQydzRCNmZIZk9MYnhHbUw4dXEvV0t5M
 FBLK2NYTFZCdERqYkUKdzZGQk5UQ0hKT3ZwemMzS0l5QkowZXZ1cm8vaTk3OFNQVGRBT1kxdHlV
 U3YwN1dWWVZvWHpDaTBwb1FPMUw2RAp3em8wSEwxNUVNWDFVcE1QLzFPQ0huMVdIM1NLRkFJNWh
 SRzhQMXFkQ3ZJNUx5UUM0UHhrT2t1aWMzcjFTQ2x2ClNXaTlsUT09Cj1HaWVMCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: xRhLR2YKk2w2

Add FEAT_XS feature report value in max cpu's ID_AA64ISAR1 sys register.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/arm/tcg/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 0168920828651492b1114d66ab0fc72c20dda2a8..8c8f88d84151952872f1b1987e98d789b501fb23 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1163,6 +1163,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 2);     /* FEAT_BF16, FEAT_EBF16 */
     t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
+    t = FIELD_DP64(t, ID_AA64ISAR1, XS, 1);       /* FEAT_XS */
     cpu->isar.id_aa64isar1 = t;
 
     t = cpu->isar.id_aa64isar2;

-- 
2.45.2


Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp199468ejt;
        Tue, 20 Jun 2023 04:10:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PiqlbSagm1LGq+jcyqIR+t8d/n1jMVqmmpPyqHatlOGUrGD+3ySq6Os7wwR7HQM1NPOdH
X-Received: by 2002:a05:620a:2b4c:b0:762:5682:b81c with SMTP id dp12-20020a05620a2b4c00b007625682b81cmr8038221qkb.41.1687259453124;
        Tue, 20 Jun 2023 04:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259453; cv=none;
        d=google.com; s=arc-20160816;
        b=rRADr6b0qEathUL6ZgA6n0JkYE7dSXVamDKxYmnXjobCoOF1jRRSmlBDgMc61uYDAN
         RjJtBqFB/DKeAjKbOAIz3o7mFIMykan91fVt+U7cfalFw3s/t8g7yXIeGdghpfBO3uL/
         RalGnu9MO1IJqdGj8ix++QK3yROKMM9i5H+tBTZgoZYkcepI14b1GliStHf4ZOF0zBUF
         Ek8/LBZAOKJQDGUk1FKLp+mXMs/9HPKueeAVyCYNkvrm/r4Mn0ugJBKh2hYhp7Fb9N73
         S9Sg6SBrM9nV973nC0fSrho59vJL19R/QJ6IrUTN7O6kiCL5af8yiGo6PdwrV7MkamFT
         A9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pgBAxhQFeKhLP03OUtk50UQNjg0nvOfEcQqaZaYFTpk=;
        b=UpVEVR3GdkcDPl6MgbaaSIoElZHNBfIYpQiKJN5lb235tpI7+qI6sVyYdT0ldqbEzC
         L4w31snYQzZNpLgSTykARFMfvki3ug4xl+Rim3l+pwuzLBL7bhoZe97pCPtaLCXvfqso
         e0qnqept5eM8kMKpsvv+JT30uNXkgqfCu+rU2uMngOWrKWVA8tQRKksI5T5b01Bf7zXr
         fs9gz0D8gauaKJw9hyLom9Q6XCoJGkkl+K63mU4IORrvR2F0HSMtTamlhNEOb1W78Cdt
         rfhNZf9PdU/FPS1poWOu3NaruPl2+Ui6Yj4uedxB/LxIkKxd1FWx3Ytp4KnJc2u41wPR
         9bAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZkfN037y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d28-20020a05620a167c00b00760bc47c3b5si712924qko.365.2023.06.20.04.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZkfN037y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBZEV-0007QI-AO; Tue, 20 Jun 2023 07:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE6-0006f5-3h
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE2-0004Wg-VV
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:45 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-98934f000a5so62458866b.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259321; x=1689851321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgBAxhQFeKhLP03OUtk50UQNjg0nvOfEcQqaZaYFTpk=;
 b=ZkfN037y/+U2htybBOOvy/v3rCEnN9UKqdSt/X+C2ZCIVev89oHc/+f/Koj5JocIRf
 bbCOPyNaXWk+9HyVC4vgtjIVo8X7bwTUc+S+5kecJ6XFZTzmU/SLQwp/4lMpUNOiZ3dm
 cw+8Zm1bzCZBwDEHJp5gELfwN/BkA3fa7rVAaR7DKwPopEJWoBpZItSRBPiaqvbcRsfb
 QyrJTe2uorG2B3pMNoKRbWtXp+sgtrytiqX364nx6Lkr1octUFkGxEwsxg7/zTIzVanj
 9E5hfcgdALjsOBgUxSin5nm9yUdZlauGVxZKSNBxuianbliv47coRwAVcebcQmm8wUSQ
 2mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259321; x=1689851321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgBAxhQFeKhLP03OUtk50UQNjg0nvOfEcQqaZaYFTpk=;
 b=Mgna1YsfexbRWKU3/DzdksGw7MJH+kyEwoLuZODMne3sc5IlAXcuNusRxFXxngQ2LD
 fUak8ew5l9mJClFAK292McQYeo5Y2XfdB26LQJMRksQpqbA1vWDXc8VVXLi4UB1Zn12i
 0WZ5m6B6KxgOdPTzk5AxKa0aDDDRE1PMxis04Mq9+ee8Z0IW/XFiqlBD4McqqeFhzaaw
 jQeO9LXZsFCkp9Zokst9zKz5Ct0LSdsHujo3sxSwZl/+gd5HJ/lgVH4Oeao5h6myXbCf
 rV4q/Jc4bovPO41aP+DaU+wOh5muYW+136Z9QmiEJE/l0mLUmIhkeoOz8fODo2al68ez
 M0ag==
X-Gm-Message-State: AC+VfDyPCNu7Sh5qCGPZRnIWhnMHEMNtFx5/RNY34hb2Fza+Jn5DV0ya
 KWiQkbVsqZXlQgc7zCT0fZJNkTEFTLaELStvQsgE3qEq
X-Received: by 2002:a17:907:7b96:b0:973:9f60:c57e with SMTP id
 ne22-20020a1709077b9600b009739f60c57emr13116579ejc.2.1687259321619; 
 Tue, 20 Jun 2023 04:08:41 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 31/37] crypto: Remove AES_shifts, AES_ishifts
Date: Tue, 20 Jun 2023 13:07:52 +0200
Message-Id: <20230620110758.787479-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UVv6R6xACyMI

These arrays are no longer used, replaced by AES_SH_*, AES_ISH_*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h |  4 ----
 crypto/aes.c         | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 24b073d569..aa8b54065d 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -30,10 +30,6 @@ void AES_decrypt(const unsigned char *in, unsigned char *out,
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
 
-/* AES ShiftRows and InvShiftRows */
-extern const uint8_t AES_shifts[16];
-extern const uint8_t AES_ishifts[16];
-
 /* AES MixColumns, for use with rot32. */
 extern const uint32_t AES_mc_rot[256];
 
diff --git a/crypto/aes.c b/crypto/aes.c
index 2676faa962..9795ae8614 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -131,13 +131,6 @@ enum {
     AES_SH_F = 0xb,
 };
 
-const uint8_t AES_shifts[16] = {
-    AES_SH_0, AES_SH_1, AES_SH_2, AES_SH_3,
-    AES_SH_4, AES_SH_5, AES_SH_6, AES_SH_7,
-    AES_SH_8, AES_SH_9, AES_SH_A, AES_SH_B,
-    AES_SH_C, AES_SH_D, AES_SH_E, AES_SH_F,
-};
-
 /* AES InvShiftRows, for complete unrolling. */
 enum {
     AES_ISH_0 = 0x0,
@@ -158,13 +151,6 @@ enum {
     AES_ISH_F = 0x3,
 };
 
-const uint8_t AES_ishifts[16] = {
-    AES_ISH_0, AES_ISH_1, AES_ISH_2, AES_ISH_3,
-    AES_ISH_4, AES_ISH_5, AES_ISH_6, AES_ISH_7,
-    AES_ISH_8, AES_ISH_9, AES_ISH_A, AES_ISH_B,
-    AES_ISH_C, AES_ISH_D, AES_ISH_E, AES_ISH_F,
-};
-
 /*
  * MixColumns lookup table, for use with rot32.
  */
-- 
2.34.1


Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp199190ejt;
        Tue, 20 Jun 2023 04:10:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4LmX38vS5tUAYdkHygud4SzDFtDE0S6Iky1i0ApQARgV3puplRvxdVtcVhu5NJbCp8biUg
X-Received: by 2002:a05:620a:8b07:b0:763:9927:65fb with SMTP id qw7-20020a05620a8b0700b00763992765fbmr4829030qkn.49.1687259420757;
        Tue, 20 Jun 2023 04:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259420; cv=none;
        d=google.com; s=arc-20160816;
        b=iJvIFE5xn4ApfDDPAsYTP6LF2C2AnQ/jkLNbodZZBiB3mpab9nG1P3RhYOWyzrLia4
         lKJyLdgszybUzuhb5GMDGphtSb7s9y0ueAAswJoDFjLBH1bzKCiIUBbxXS2H/hOAoJLQ
         8x3XlOEHbWLbbHeY6WFOFIKHelnbfNBR0T/JHP9z/gAsJkuTV53BMcGTPUQoWJEVRWkZ
         lk71FPphUcvQ9kTLhFGcdDGtiHxgMovjmOS+1VUBeaG68sWJdWGOowI1BGaLWaKbkvKE
         qxQCm72+ddwBSNHyeJQF3VjHRuClum4MEsAmam2F57V8/xWj0cTuajEWX+igS31dIijO
         UmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
        b=YKS24uWK2/ufwsMWDLKNvsEfndEBdbKlkb9lm0A6xgaw9/3GGHgCK6K83EzFxCbsai
         Xmrx8S7KZI5yXfvPgPbCW6nx7DCuuGfosAC1ZBl3XURmryBG3neKqyqdadE8lwXVBs6e
         AIlGp7SCck9BT1HIOGo7BCNfZHXcRGfutvQGXoclKMEM3nXY2crnC52/XqkLiyEJqwkO
         5ouzUeyGFjVQ5YdBO/HuEQQ3LeZj8Kd2AMn3YXsEm8AOp7NgfVavYruySD1sS8XJkrT3
         OwMZUASMZndho1pVjnSOV7RTtGcHGm/fJUalIIjkCWGK2YAcYHZ/vvxYjaGV6w0d4s0W
         rylw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vIDZqQ+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020ae9e50c000000b00763b5595c66si263455qkf.207.2023.06.20.04.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vIDZqQ+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZE1-0006X3-G4; Tue, 20 Jun 2023 07:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDx-0006QX-CS
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:37 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDu-0004Rb-J2
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:37 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-988883b0d8fso376469466b.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259313; x=1689851313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=vIDZqQ+4qe8OfzkAge7xCSI/gHQxa6IjBuJ2+qDZVO1bE+E4n5NoZ0KruDEvQ/iu4H
 vqsE9jdY584U3DIW4vSlMxtm8XPltTRgLUdvLmLZ/sqsK9qvXVhhbwQEAig9P6m/NWp8
 uhzXLFSJ3deDlq/aanAN4OMHQyj/O5T2rOD+fU5eDi1qqE25XM+LGwERs8f85PXNDSPB
 aLAEwfL/p6/0/1tOAPrCz4z5NFo74oQWGj8iOrrniysdXeW0Hult1A8QBAjWsYaa9m/L
 Q8TKjkEX2PUtQRVUxQ6VBdkC6TGjtOj9nHGAuzw4aoVYev5Qe8gfUjYDgBa+Z3WngMEE
 WRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259313; x=1689851313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=DVUwbpraHL/aVhiPXM+gdhs2v/n5/IrllJNEoArBd2XloWEGGIsVuqeAEX2xkqp8vs
 XzPKZ0uNXcauKWnFyIPUz/IJs87C9X8yAtUjsbb78x9xDubtLxFLg6hiZw6RKvdusDuD
 ANrtUQymqmXdvt75L7DUofsJfbwkgpEq/s5GRQZmPUv98bdhm6twmFfk8RvcaDpXwDiU
 K1QRFNQOaswO3mTMRjhoJ99BbA/EEMAoCyHH5LVwz7uqn6+b6gvAXBZupDoq/tesZYBq
 Znekz7d12WYOFw9Bh5QS+fBSnC2MsaHMw+epR9dNME0E2RDjud3UOA2fFbeCi87o6MFt
 psqA==
X-Gm-Message-State: AC+VfDyc7U2/dekHZuOAKSIS1DfNcVIwjMW6sxHMNlwu+comWWV+NJWs
 +siRlgrH9vxGabM84fpvNecXnw==
X-Received: by 2002:a17:907:7f14:b0:989:1f66:e44f with SMTP id
 qf20-20020a1709077f1400b009891f66e44fmr1620173ejc.11.1687259313240; 
 Tue, 20 Jun 2023 04:08:33 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 24/37] target/ppc: Use aesenc_SB_SR_MC_AK
Date: Tue, 20 Jun 2023 13:07:45 +0200
Message-Id: <20230620110758.787479-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8LsRz8HwOLtH

This implements the VCIPHER instruction.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 15f07fca2b..1e477924b7 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
 
 void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u32) {
-        result.VsrW(i) = b->VsrW(i) ^
-            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
-             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
-             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
-             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
-    }
-    *r = result;
+    aesenc_SB_SR_MC_AK(ad, st, rk, true);
 }
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


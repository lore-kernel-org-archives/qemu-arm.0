Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172983ejy;
        Mon, 3 Jul 2023 03:11:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG2ERhuttMFkTzoL02dHbgvR2dUNb39qb1SLuL5OG3So2SiVx8j+a/VL7GXKc2xnkVuwRyP
X-Received: by 2002:a1f:3f11:0:b0:471:adeb:2e7e with SMTP id m17-20020a1f3f11000000b00471adeb2e7emr3830582vka.9.1688379070999;
        Mon, 03 Jul 2023 03:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379070; cv=none;
        d=google.com; s=arc-20160816;
        b=ISMs7H2tTxGL/bTdJhg8to487Hj/KenIciqqRSBY1MD/5JwbMJ6z3Jg4dL99CBPkjP
         6lPKFR6vJbs33liDt0LG3wk5yNxbeZh7wLe/pvhnq7kFjaFK0gICKupcDqJaLXXQ4yrh
         ap4j4CJ535ippxlsRcaCDVWS665cIYh/XUMUZJrK19JreV1yaZBGonPAbQavxMlcnncJ
         OkGPyOxde9IzC8O+RyomV/8M7n7Uq7Sr8N4NdDBV5LrSHpaa9w/edN1ADXqkxDXKM6AI
         7xegQkfu6YYErCqpfRTcXMwQbL4V5lvy4XXgSZg+TE6LxTuaM523TM3Y38JgBc10/4+n
         5yAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KoRRyATrWAHPOTZCqqegjuftHV3UOSCP+hcOlJjHRIM=;
        fh=QgDoIuhvPgc2IEOs0IRGDFwvtZaiTfC8q6Rpekinx9Q=;
        b=YsmibOQfCSxuZ+/VPhMGohwlbJmZTg/o5rp9d5BNkgeciiWGiiE6IiZ18wWYkCO6AG
         M0v1JG6Dnjs0mBwk1Kh9g7oM7S6WQXdW5k4W0PKLn+/SwhpFl4BMAgujAslTKY7KWht8
         GAPR3gaOCiYpRiVVeIfiW4tl9O/X6UgjkkFp8c51fBJoS7vbvAPKKj6yRbOAsilALDX6
         hDEY0adghmmTPI/3JRXN/ah31gYo81qZag/Et+ftXkMumdWRJMednH98IiRhpJ7F7L/c
         yz+WgboFNgtVPJU5vs9KVdCSWvYpIexNVf7XadvhjBU7lKos7b5yKWNr+4cd9kJVFZsF
         +bZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRI3MCkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34-20020a05622a18a200b004034a0f3b39si3872407qtc.196.2023.07.03.03.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRI3MCkG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGSt-0005et-Fr; Mon, 03 Jul 2023 06:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRp-0003Ch-3q
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:24 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRU-00060T-75
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31434f51481so1759541f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378758; x=1690970758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KoRRyATrWAHPOTZCqqegjuftHV3UOSCP+hcOlJjHRIM=;
 b=IRI3MCkGlPttop81BvrXMKjRpBkCq7p7sMHGhx2SVdnGXkr18SLBdKfnzA6hxrk2E3
 bVwbz+4AU2wtMMXaOakkSOWeqah3rhkUavpn5GKjh8bLrrmSTeQJvDFFFPL6xbqkVMCG
 3U/iPBNpawMunoX7SLu0kEqOPKFMG3tYvo4LBO+sPOrbHiYu4Ju8MeJxb/jWipb2hH7D
 xUb1aOYuaomj2aSf3x1CPAXsqZLo0z7bLM9V4JpHDrUZ9mBUv9EPRLthPoYUsJR0ax1T
 +5tn4Q22AwLSQabuWTzuyudwXBTA49SWx4pXDQiF0QiAG+fWp+rhtz6B5giIJKYRPMA0
 94iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378758; x=1690970758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoRRyATrWAHPOTZCqqegjuftHV3UOSCP+hcOlJjHRIM=;
 b=EJnEjLrW1wZKYJiNbglyg372WQKZuh5qG5wF3K/oc64a0fVRmRXsiFJA2+UnxYXWfg
 ivxXjq90WcfdOO1cKbIWQLCr3f1/x1QKHX/T/d6xxF3BKoot0fB/W1WfagvWzNol53Nl
 Xg8puWVTbC6jtmMY2F+j46a/UwoX2ukeOoh5+3AeIr6g5J7PDZ+0orokxP7M3S6ZeSbL
 MVBUDXpU1YnNPkxqMmfsPKmpltjW5kDWepaPSuemcop+L24FN14lRO3U+w/api9LJMES
 d+kohrV7sYsCIdF+kpI8CtGGnBnfXLGtWBJLNVgT58o6jY8aCMyedf4W2XZxb3ilZxfh
 yrvg==
X-Gm-Message-State: ABy/qLaV72nlAZIqB4duUInXFkIqjfn5y6sjHd8HY77DM1aW25e53Fmk
 UZmOF9xIdS7X5Nu7NY+7a/MqPw==
X-Received: by 2002:a05:6000:14e:b0:313:ecee:5517 with SMTP id
 r14-20020a056000014e00b00313ecee5517mr12333265wrx.40.1688378758535; 
 Mon, 03 Jul 2023 03:05:58 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 35/37] crypto: Implement aesdec_IMC with AES_imc_rot
Date: Mon,  3 Jul 2023 12:05:18 +0200
Message-Id: <20230703100520.68224-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: ib/Iade2ijiA

This method uses one uint32_t * 256 table instead of 4,
which means its data cache overhead is less.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/aes.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 00e16d3f92..d93883eb18 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1377,39 +1377,39 @@ aesdec_IMC_swap(AESState *r, const AESState *st, bool swap)
     bool be = HOST_BIG_ENDIAN ^ swap;
     uint32_t t;
 
-    /* Note that AES_imc is encoded for big-endian. */
-    t = (AES_imc[st->b[swap_b ^ 0x0]][0] ^
-         AES_imc[st->b[swap_b ^ 0x1]][1] ^
-         AES_imc[st->b[swap_b ^ 0x2]][2] ^
-         AES_imc[st->b[swap_b ^ 0x3]][3]);
-    if (!be) {
+    /* Note that AES_imc_rot is encoded for little-endian. */
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x0]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x1]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x2]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x3]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 0] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0x4]][0] ^
-         AES_imc[st->b[swap_b ^ 0x5]][1] ^
-         AES_imc[st->b[swap_b ^ 0x6]][2] ^
-         AES_imc[st->b[swap_b ^ 0x7]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x4]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x5]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x6]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x7]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 1] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0x8]][0] ^
-         AES_imc[st->b[swap_b ^ 0x9]][1] ^
-         AES_imc[st->b[swap_b ^ 0xA]][2] ^
-         AES_imc[st->b[swap_b ^ 0xB]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x8]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x9]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xA]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xB]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 2] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0xC]][0] ^
-         AES_imc[st->b[swap_b ^ 0xD]][1] ^
-         AES_imc[st->b[swap_b ^ 0xE]][2] ^
-         AES_imc[st->b[swap_b ^ 0xF]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0xC]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xD]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xE]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xF]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 3] = t;
-- 
2.34.1


Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp200881ejt;
        Tue, 20 Jun 2023 04:13:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55Sj+iya9TG4GlFbY50Y58CZyIe0Tss6cH0oHTgWR72BzusOa8aOvIVxBQxUuZBZ5soIAV
X-Received: by 2002:a05:622a:14c6:b0:3f5:39a7:1b9e with SMTP id u6-20020a05622a14c600b003f539a71b9emr12879646qtx.56.1687259626643;
        Tue, 20 Jun 2023 04:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259626; cv=none;
        d=google.com; s=arc-20160816;
        b=FE3S9haG6DvbRS/wnsHKIZRDvC45HRb1kYYaEzrOJH7LAQicjsG7WdflMSgGG+1Ekl
         HBftLBp8VFIw0TmM79Ql2AyXIEcyq7pmohhIPkaYKf6G2lgW4GILpqANH2a54W07XlyG
         tgd8JQw0JBY7LBy+JwUzZh2vOeYQ4OfPKiSlFAyMBjzJrz4h2UCqd6JBl7iLPSvttaGD
         sC5Oj7VzJDjFzOOyPoO7Rzzrar5831YeH53MkoBYbJSg85ThrwinF3lLjCks4Xs41MR5
         SsWagloLN3FH2+w1toxh2VAEYTlOcUBxH5t+AqprZBt7dilvNKIFM0l4z6VazuIQgcrf
         kjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SPTofI9JsvJrrcptDf/DV5w5SQH9XzTd4Au47XuO2js=;
        b=pbeeOnamNkNrGnJ7cnyRsAeSlR1krjZykQyQaQhuWi3WI+ob0OUop9TiKia3YAlNh3
         44CIYukoqCh1ETakEs6lHj4Xfrn6x1N1rs3aH59OD0tITnbEVu7Xe4DM7sdYIZO2J6CA
         gIBupyrI6UJgz1MIXdEcn1xXuHBU5+orYa7i5SN5W2A6s1I38OeNub0vvi0cUEmGhtE0
         Ozofpy2YKd1ToBOmPhj3S8TxTy7Lqhp1/lIWJYfJavR9hdtqtFU6ne7XjiQdA3uPzYjF
         4oBNE7o23jElANAIfBfkPAlEdCseHGDyVMN7xDvy1deDxAmXxQtLinLT+jqXGaBa4VVK
         Uy6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gPIFjYXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05622a100800b003f6b9182339si660762qte.691.2023.06.20.04.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gPIFjYXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZEO-00072W-DR; Tue, 20 Jun 2023 07:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE7-0006g8-35
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:47 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE4-0004XM-5Y
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98862e7e3e6so374540566b.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259323; x=1689851323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPTofI9JsvJrrcptDf/DV5w5SQH9XzTd4Au47XuO2js=;
 b=gPIFjYXTMHbhLGRAx822xADv/NBe6+4/86riiKtDe9ZVPuEMKaykUORVhCgZC2Bmgd
 aoEtrzDGVdF0AHSvY7kmg136hh6RlVLhXluWyyYKdwpS1VazATY9bbDdOtqBKnMMfDbg
 6Bgugp9qIEHR885O2kYH0FOSvRx34h093Qjb7uN58K58LGIolwEs8J7Ljd4w66gGnVS0
 qOeX5xSTkkfWQwGTpFX+egH++nAyFOBylBOb+2xwca9IFwJPiR+Nqw2oYHMpiBHnklNg
 cvPjVahcWu+0P2kwQcueCaNDt0DxZWEwfHAtB7hSaDgBjw3T7MR7wHhjzwcVm1xP9SRZ
 CyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259323; x=1689851323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPTofI9JsvJrrcptDf/DV5w5SQH9XzTd4Au47XuO2js=;
 b=MLIhGWBPMujWdGOeONQFojMsy/zlOQGqBp4c8jm1MorDUr3ij69lvtGeHPcZu05mf1
 xMwyOw8+MW/nR2FiALgwGrq/2rKCdUofa5EVSuX/QXqcPzvC0rwqoMKAH9wlXbVP7xMm
 iLB2hRqAKhkB/w+gUAKZnfyLmLWauCaI0X60lrddXSh3y6/jrma3/iVBmM7WqIYtzCZX
 NhwNN4+Bx4Aim8r+D6ThsZkv/DUJtddaIQm2f6wCXJMi0c0TZXN4MpFTdDTDMOtSbksE
 xppAOM9AcHBi1UBauiZarpiMCF0d6vHX99RyHuRxtWDO08nO9aojcoRDEZCe7Z9xk7xE
 Ip+A==
X-Gm-Message-State: AC+VfDwjGcZLe0Y9VVMEXRcWvhySO7u/fsRp0Y2rbeEnfT0gbr83vtKu
 qBLFUwDVjOsYki7EhBex8gfx1g==
X-Received: by 2002:a17:907:2d28:b0:982:6bba:79c5 with SMTP id
 gs40-20020a1709072d2800b009826bba79c5mr11745289ejc.72.1687259322836; 
 Tue, 20 Jun 2023 04:08:42 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 32/37] crypto: Implement aesdec_IMC with AES_imc_rot
Date: Tue, 20 Jun 2023 13:07:53 +0200
Message-Id: <20230620110758.787479-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: 7HUyKBvEJkyc

This method uses one uint32_t * 256 table instead of 4,
which means its data cache overhead is less.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/aes.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 9795ae8614..307c27947c 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1411,39 +1411,39 @@ aesdec_IMC_swap(AESState *r, const AESState *st, bool swap)
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


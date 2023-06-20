Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp201790ejt;
        Tue, 20 Jun 2023 04:15:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51KqSu0ZDcMz8An5Mdnvh4TJsQ6+CqM8cF8D96TR7FQn5K8iXbfT8l/k9e0ncIEs8/XIKj
X-Received: by 2002:a05:622a:1445:b0:3f8:45f:997 with SMTP id v5-20020a05622a144500b003f8045f0997mr15082797qtx.22.1687259747917;
        Tue, 20 Jun 2023 04:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259747; cv=none;
        d=google.com; s=arc-20160816;
        b=bRRLDXMClNuCDaMr+SQ7WH2jtO1wGh+eQML4s+s02uzag1EM1uowXc//54w3kJo5jE
         HUHOKMW9gxZDEAn7bCCsMlvNCZpMphs9x9qSP3oVtQWi5VAaUfp6gNby5dOBmZ3VV51H
         dE+iinqmhgoPy/eSphQgqyB2UGxuTqBFdSfMOI7W21yvpSAk2Pg4A1hj1Kc0mVkkbRVD
         BT26Ofh10+2oeaDsSIxEOwc2DyZ1r38AZIBjuBGQFW+dSsNphyKjaNeXaDVwyjR+7vRd
         6E7FMIhsItdFUBwi7u+MT+7MDV2zNAHngkmO99nVtVL7sCBWIyImG/vp1LPpF+/AlT3f
         j8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3m4966dsyDinAuTFstQnqcz3WJKkplFB9WOExFLrlCA=;
        b=w4XriAT1K79lU8pLqjpcJVzhZcHui06EcY3SWZwv4yZDe35ojDykghD73rfcn0Pmsm
         P9xAKj5qyh6gYEJgGin6PV9MEbOWVhoFwAlpsiJadO3S2DIYZbn1uyZCbokPaJvK7xQC
         VuX4I0+5Q1Woe82toDr8NUUqYPGteRBZLIdBXzOXbTUorANefO5G1+EzVehwo+OfKbYn
         3dOXg1PMdwkiaYs4MqzUTuysMqZBxraKqPD9O7Hj3+YHdUlWmu1o3Iy4AZ/O1j/cJlJh
         JtWxSHY9TK5GOEbgHMiG+QBlPHFDxIi1FrNkN0JXlw/+mseOgGYmlODnrvKZ2XET5Ne0
         ASRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6cOxOtF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a165100b003ef42cd0da8si679368qtj.223.2023.06.20.04.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6cOxOtF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBZDb-0005tZ-Mh; Tue, 20 Jun 2023 07:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDZ-0005qQ-Pj
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:13 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDU-0004BX-A3
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 07:08:13 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-988883b0d8fso376396466b.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259287; x=1689851287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3m4966dsyDinAuTFstQnqcz3WJKkplFB9WOExFLrlCA=;
 b=E6cOxOtF/5Ogc0KnbHapRi1XFRUJRBl8yFy10Lme2aT6tL1I2SVWahADI476hcClpp
 3nZMHvqQ2Ba5kpUF8cv3Re6+YTx0I88tlHRPF5fQwx2ghc3DjRhASqgytWHOaxh6H266
 m7KSgw0C/2A5AxribyBY9ZJCxydln3WgSlG1evtFd6J74INPHQbawdMsOnb8VGnPh+jM
 RArPJXL5+ZdhkvyFCP2CxBSoxQg2hUJM6aw1IoZKzOn/19/nMC4J0Mf8w0L7B0yBCf7u
 CLVh9EjgXcr+dqlJOAwjLfdXHw8FpWvhCEPaOShPkZuw1+4c3lJfT/yiGc2Z+1RzmiWJ
 TVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259287; x=1689851287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m4966dsyDinAuTFstQnqcz3WJKkplFB9WOExFLrlCA=;
 b=FUn2hS8Ccl9Lduk5Rx1qLkF3pkNc5uVtQNE91jqnXYoPnsiIxzsxVM+RmeqJPJybsb
 h82yu2S/Jovd2p3I0A8uy3N6hzsC6y0QkcMR/5ApibGeRSrSizhGZvjk6nac9Yqy940J
 c3aNBKO8bgGROvEXlNJwYDlJdZYpfgtqSbDi6fhROYboEwj6LmrafGs+7Aqo4YHn9ZB2
 u4CEkra61jQE1Ik4qI1ONccqeSOKO2rppriqozejwPaYOoN1AfpsBL6OdEWLhMoR83P5
 yrxYB1IZfIybhqpCHmErh1k4pyneYBKi7m76v7gjvgzwMQ96B0LONaiQIS9dgpYskfDu
 0aQw==
X-Gm-Message-State: AC+VfDzAWRXlGowhkzYuQPpX9ztgZi7mGrZfiIuLk3R5nsaDNO3HBhtT
 32DxbGXT3R0Kh5w3bEQSawmrj+S+LZ7hgay2mClsimGY
X-Received: by 2002:a17:907:934d:b0:957:2e48:5657 with SMTP id
 bv13-20020a170907934d00b009572e485657mr9923738ejc.68.1687259286938; 
 Tue, 20 Jun 2023 04:08:06 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 04/37] crypto/aes: Add constants for ShiftRows, InvShiftRows
Date: Tue, 20 Jun 2023 13:07:25 +0200
Message-Id: <20230620110758.787479-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: is9MdzHs70GI

These symbols will avoid the indirection through memory
when fully unrolling some new primitives.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/aes.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 67bb74b8e3..cdf937883d 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -108,12 +108,58 @@ const uint8_t AES_isbox[256] = {
     0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D,
 };
 
+/* AES ShiftRows, for complete unrolling. */
+enum {
+    AES_SH_0 = 0x0,
+    AES_SH_1 = 0x5,
+    AES_SH_2 = 0xa,
+    AES_SH_3 = 0xf,
+    AES_SH_4 = 0x4,
+    AES_SH_5 = 0x9,
+    AES_SH_6 = 0xe,
+    AES_SH_7 = 0x3,
+    AES_SH_8 = 0x8,
+    AES_SH_9 = 0xd,
+    AES_SH_A = 0x2,
+    AES_SH_B = 0x7,
+    AES_SH_C = 0xc,
+    AES_SH_D = 0x1,
+    AES_SH_E = 0x6,
+    AES_SH_F = 0xb,
+};
+
 const uint8_t AES_shifts[16] = {
-    0, 5, 10, 15, 4, 9, 14, 3, 8, 13, 2, 7, 12, 1, 6, 11
+    AES_SH_0, AES_SH_1, AES_SH_2, AES_SH_3,
+    AES_SH_4, AES_SH_5, AES_SH_6, AES_SH_7,
+    AES_SH_8, AES_SH_9, AES_SH_A, AES_SH_B,
+    AES_SH_C, AES_SH_D, AES_SH_E, AES_SH_F,
+};
+
+/* AES InvShiftRows, for complete unrolling. */
+enum {
+    AES_ISH_0 = 0x0,
+    AES_ISH_1 = 0xd,
+    AES_ISH_2 = 0xa,
+    AES_ISH_3 = 0x7,
+    AES_ISH_4 = 0x4,
+    AES_ISH_5 = 0x1,
+    AES_ISH_6 = 0xe,
+    AES_ISH_7 = 0xb,
+    AES_ISH_8 = 0x8,
+    AES_ISH_9 = 0x5,
+    AES_ISH_A = 0x2,
+    AES_ISH_B = 0xf,
+    AES_ISH_C = 0xc,
+    AES_ISH_D = 0x9,
+    AES_ISH_E = 0x6,
+    AES_ISH_F = 0x3,
 };
 
 const uint8_t AES_ishifts[16] = {
-    0, 13, 10, 7, 4, 1, 14, 11, 8, 5, 2, 15, 12, 9, 6, 3
+    AES_ISH_0, AES_ISH_1, AES_ISH_2, AES_ISH_3,
+    AES_ISH_4, AES_ISH_5, AES_ISH_6, AES_ISH_7,
+    AES_ISH_8, AES_ISH_9, AES_ISH_A, AES_ISH_B,
+    AES_ISH_C, AES_ISH_D, AES_ISH_E, AES_ISH_F,
 };
 
 /*
-- 
2.34.1


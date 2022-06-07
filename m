Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2434742lfb;
        Tue, 7 Jun 2022 14:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQkB8fXXiHvdzZKDC0Fn6liynVBrglOVSoQ2jeunTVJxZV6tNFB5ojUdmKytbfbNomLyRL
X-Received: by 2002:a05:620a:2a14:b0:6a7:327:14c4 with SMTP id o20-20020a05620a2a1400b006a7032714c4mr87046qkp.3.1654638448846;
        Tue, 07 Jun 2022 14:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654638448; cv=none;
        d=google.com; s=arc-20160816;
        b=PViXXDI2quyFD8kjv0XarnTKjybqhNYs1Al4kE9/1KNHAERmLyZ6MkA5QY4ZJvZlv+
         GFHy7H7VSUZSVIHzh7XLsU7NeNR2N086PP0vj654Q/ZlGTSDuGUmJRn6ipt3wPPoMbZu
         h4bprsulbfDfknsE11UZymZjLZ5Y6kO7DszpG5QPDhZEeSLbCnGYjtxCLnOytU/+KMvd
         rSo+cpw9GVAkWi0lJ6ZCZyUxs647HpIHfCTP7/mLsFNgjuC9aBeJoNGFikAJnguDYTQR
         UNG9AZoTdqPovMR8gc7nfvJzoqRrQ4t6o4iok/D3ResCmwMHPCHhSXxusyEOHXtGHSIH
         61cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
        b=cyBgi1D6k4DgtQW7XrNZ5b1vfWtjqJhy/sjJ6hBFyGyENMK8S6keDmJY9sgR+Mha+N
         fZCRwF1yDXbrH5xlyACqHCc/CUMR+aYlOI+VnsfbYjufQGOPe/aqq1dzbBY7uXtwO4H/
         gWXtrAmtI27pbDjtF55opRjhOmcRhGfPm3ZAJ6hYRErR9nuKgto2xQquTIkrpLkp/h3J
         YaPVnEqOYaTuOZVXRpfb5s01kQ3nvs4TZX+dqccjHjZhbpNLLWiTRoVabmRecH6MUQLJ
         NDZ1YPM/Z6eQrA2wQ4lHOG7f35os0N78UClnPV9V3obgVtAXtjhSs2nyQ1wtGPUl4pqo
         p0wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0m5xHf+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a014d00b00304ffd30db5si576199qtw.438.2022.06.07.14.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z0m5xHf+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyh2u-0007U1-8B
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx2-0007jZ-Sv
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfww-0008EU-1P
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id d13so141128plh.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=Z0m5xHf+DRD4UJ0qaaSDvgJGpGOcx4m/xuR7GjwfhLP3Ixln8ajd27uiWKElFu1s2A
 R3i3Ydfaxr4u29M99ZCits9L6RRFmuZZtmVT61SBpO/cLrG4RRQkIAXCfZfxpAH/D3MO
 YAqpxxdBt8ojd83qEaXtaE5fsfJhuhbH6ut4EqdKkQolSTVQIB6Ph39bZMTu+ec9EcdX
 8sBQ4rhV6voSLxWVUzQqs7LQLSXfxYOCPq/sOPJibTuYU/7hh2AOb0x6w8xmX6A5655M
 qwtkXTdXbm36sj6imtHixjp7nf1yKzARgFBEYYHhBcamS7WLJG/oTocerDIf8e0FORjO
 ysnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DykCJozY64Fe8oG2Osy4GtewqpVyxda/M4nkZEjhEDk=;
 b=KzUe6oiE7tY7YEtBdESXTTEWRosBQQJMWkJpfl1Wvzu20TXYxmWydIinJH7Z7cO75N
 rVFXMfVAAsSYpNEP5KkPXV5C7kjQbq5WymU7Um6OwV0qJ8jy/ggXMb/Lhoap7OojqD7h
 R6+SQu2TDC9YMKRgnqE3gl5uHU3arAQNtAXofZjVbwBP91mx6+RnXYognbPD4WKiTPn3
 OHrjhckyeOlgbgvwOpcqE+vjbTylEDRbULU6nAuwd+muErIz+pI5S3SnuzMV/y3jFCDc
 9wUJy7qsHWYKS5tzFkRvmCGFJOIZGOz73fZ7myPiES7Y96OYKAjVryTpBOjc7st8cdes
 fBSg==
X-Gm-Message-State: AOAM530QTbwZbdaydgeOKXx707riSfKMsQCGbdhaAmjKdNwwqngSXeH+
 EJFHVfL2mKkoTfKsP3fuC/OryGMJ7fUkTQ==
X-Received: by 2002:a17:90a:ae14:b0:1e0:51fa:5182 with SMTP id
 t20-20020a17090aae1400b001e051fa5182mr68270983pjq.60.1654634233259; 
 Tue, 07 Jun 2022 13:37:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 71/71] linux-user/aarch64: Add SME related hwcap entries
Date: Tue,  7 Jun 2022 13:33:06 -0700
Message-Id: <20220607203306.657998-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YddoUHGTF2hI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f7eae357f4..8135960305 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -601,6 +601,18 @@ enum {
     ARM_HWCAP2_A64_RNG          = 1 << 16,
     ARM_HWCAP2_A64_BTI          = 1 << 17,
     ARM_HWCAP2_A64_MTE          = 1 << 18,
+    ARM_HWCAP2_A64_ECV          = 1 << 19,
+    ARM_HWCAP2_A64_AFP          = 1 << 20,
+    ARM_HWCAP2_A64_RPRES        = 1 << 21,
+    ARM_HWCAP2_A64_MTE3         = 1 << 22,
+    ARM_HWCAP2_A64_SME          = 1 << 23,
+    ARM_HWCAP2_A64_SME_I16I64   = 1 << 24,
+    ARM_HWCAP2_A64_SME_F64F64   = 1 << 25,
+    ARM_HWCAP2_A64_SME_I8I32    = 1 << 26,
+    ARM_HWCAP2_A64_SME_F16F32   = 1 << 27,
+    ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
+    ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
+    ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -670,6 +682,14 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
+    GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
+                              ARM_HWCAP2_A64_SME_F32F32 |
+                              ARM_HWCAP2_A64_SME_B16F32 |
+                              ARM_HWCAP2_A64_SME_F16F32 |
+                              ARM_HWCAP2_A64_SME_I8I32));
+    GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
+    GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
+    GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
 
     return hwcaps;
 }
-- 
2.34.1


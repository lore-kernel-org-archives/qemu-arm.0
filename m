Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4581108lft;
        Wed, 6 Jul 2022 02:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usH/Fn0ZkoUIFZT6YpHbsz9+KeOorwJc6ESrxKsNLwRCUWOrrpMwCln9NIOGB+UXGyD6aY
X-Received: by 2002:a05:620a:2697:b0:699:cca7:f8b2 with SMTP id c23-20020a05620a269700b00699cca7f8b2mr26812327qkp.738.1657101065624;
        Wed, 06 Jul 2022 02:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657101065; cv=none;
        d=google.com; s=arc-20160816;
        b=kmqjNLKgvBbuCXhSHN223LsIZaHelVvny/6DTpCXwbKiQuayXhKpDHhU8JFwsv99Nz
         M2W6XRvwQo3KilXMmhPH87qKvrFJwnw9HHRv5uCY2txhI0Pkj1FbTakt8rwRJEYplhao
         vXFvUf3l1nCCq9o8iyq4rlP+T0/r7Ng7j3UjpyF5avgjDvME5tVamaHGYuSEPsfLv6+d
         wMMDoWqwbEDZBe+8JDJcAl/q83MJWnfY6ti8nBftCT9HYDxzlou2Z4VhEF9EhbJVNpPv
         SykUxwTGiy2g6B1da6GQ8zuDvDc3PUG1qke+L4R8z9hB/Mg3a/UKhGbyAgW+xpKcUkl5
         PtMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
        b=zAnJ6uScQvPQUTbdqrR93B2DsNaDOPl2zB5lYrxIsJsb7HEZVW0lUROfWW7EtHTc6H
         fq6uIvKZCTvmz45AeYbeyV21LsJxiO1byTNV7Lwp2k/DRy++j7BsiKNwPGPtYAaWL55S
         C+PM9cPbw9mEWQ7PlWrOY+sYCrRZe59/0r5ToJ8C8Ih+0XvsVbZL0feItd8VrauZd0Xn
         IBf8pxtriyDhddGXkMjOczRw1eNs8wbvc1fl2UP877oWg2AuuEmoGqE9Li6nmZGQNz6C
         VJCEeNL4HxJPkPw8ySjF0bcr0kFxJPEHFb/32sD0p5s95C3HAlV7RFaWWWAnGCai1WbF
         pw+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qy062rT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci26-20020a05622a261a00b0031d2a40eab9si12056282qtb.427.2022.07.06.02.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qy062rT5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91gW-0000RB-RB
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PU-0000tM-6j
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:29:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PS-0001GN-Kt
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:29:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so9296143pjn.0
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=Qy062rT5xiCcqd1nA9P6hms0CJQdmJhYfq0hImy7ZKbvwJfmdOqUSO9m7lKSQKmW1/
 wNImjGohUMpXZhePoQzSOws6sP3Q4CUNn5FjlpffoqhF8UzeYP7MRDBFeeWnpazh8jrd
 /iZy0aTnykm/qOyfhj0hYXFkEMherXCjXBSpaKqU6Je1MoIwsWAshiINThoJMfjuvEx3
 aKVzxBlbJYR5SgIglmzrfxhUAuDAVkI0oaGINn8h15bE5+83UNSoPn0VbBIYOxG0eVY7
 KpzPhqPuPbF+b9U4MCjG0YZRo/bCevOzWIR3YdOWB1b0qlYoMND77pGUF2czVWSCnMLd
 rP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IH0GiEUf1cl31EpypJHGc9N38GuuWqV/keLjTWnDRUI=;
 b=pSABR8VJ6D7aVWkDA72myBao3paWafu/L8iJQZ2Oa93ZgV/OFiZPE9KeTjAtnJLyQG
 fFgV2wy1/MoMkmF4bftksk0zEfd1Muuh4KjY4iWZcU9XxtBOTbpIbBbWGag7dzwMywYa
 gM9BctFFxeZzd4G5sgj5rtS3Bmx9XHfxR/l3i5gnONJIeveGzRY9NEjFtjjFkLdrlnwC
 W9fziGFAnr3/mdc6XnGFwRLPjU+5PIMC7mUq2JfnzsymRCZLwh6C/V0ZJVXDwTpBdunw
 wyyuBLchctrYXwOFNGqJIGQLTPEzT6Zi71qeFZCoyGsrvajtVgk0wgtUyA5l9ybTpYUy
 PXog==
X-Gm-Message-State: AJIora/WbNKqrLq/LoiUNWuG7cDszMedei+uZ0iEIgRZ/f1OrJyyq7nM
 W7Wy08CF3C1GQI/FQBqciHU0Qw==
X-Received: by 2002:a17:902:a60a:b0:168:b5f7:4148 with SMTP id
 u10-20020a170902a60a00b00168b5f74148mr47174952plq.47.1657096161222; 
 Wed, 06 Jul 2022 01:29:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 45/45] linux-user/aarch64: Add SME related hwcap entries
Date: Wed,  6 Jul 2022 13:54:11 +0530
Message-Id: <20220706082411.1664825-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ApwkQU5iHkFH

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1de77c7959..ce902dbd56 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -605,6 +605,18 @@ enum {
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
@@ -674,6 +686,14 @@ static uint32_t get_elf_hwcap2(void)
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


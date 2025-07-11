Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43924C83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 14:09:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaERc-0007Uz-Vq; Fri, 11 Jul 2025 10:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uaEQr-000654-R3
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 10:09:01 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uaEQq-0005tp-0D
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 10:08:57 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-75001b1bd76so44193b3a.2
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752242934; x=1752847734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4NtslpW3/Kf+pVoZt/RQCZrcDXFq6jIs8FEoGRVG5I=;
 b=zzpSFUgwRz6GuxjoZS/Ybn+J01X/m90KzM0CZ3HfI3UfMrKXv2Siemf9Iebelwqm7X
 IUfVhZ0pGdymTgnkVo1LBnvXkWn0iDGAy9p8GzxMaS8aOpOcJGczPOtMoaTpBznMjz7B
 Nv7n4COH5bAal9qvUc2iqSg/awzTU817hzHc1DCbQpviYoN38kHd74WKlmJM6AENdi82
 nLJL8rWxr4OuBl784/VZ9H2mpwspE9hmTFNia2g00bJnsRDo+mopouD7zsk4vFTdPT1I
 J0ceQbki1Acv0wrRYbxnB3ZEg8sVDZbEr1ZH6YhWoTzFI+XGi7u05YfDzsZokY0uFKMS
 od1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752242934; x=1752847734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4NtslpW3/Kf+pVoZt/RQCZrcDXFq6jIs8FEoGRVG5I=;
 b=NMrU8hT8jJSfKM48uFQiHHPrcXqhiDiTK/i+EP7y01oK0uOx/sqynUu6UcMCCFyV2m
 swrTo8Jq0/LZNweZFgbvVZA+W8Q9lEnYT9WAagUVvD+M+oZ3COlpLmG2p5uVUWBMP2Pu
 ySCGms2t4oXzOVh8YeDmAKWdDeBFs8k8YYvcvM9c7HPwyYV4Q1jtMeuGT0aihIxEBFZz
 3l2/VQoUQ4RV44s6rZ9jp5+c+7lXh7sFicCnHJugItZz4eQXTHFhF9+cfkD8JGlt4WCg
 4AxA+sjlUpcGK8uFHhrmIZpyPNqhzqj6LpybSTjbS+G6G+d8HzME61Gvu7dFFBqWVIT0
 j0mw==
X-Gm-Message-State: AOJu0Yz8ASPd2juGDGbpbjpljvhXHn9hVtk3Xaf+YYx5oJ43ADWniz44
 KHmcYfxPXjWYTHgmEdCFGxm4+33WFCy7mIGgwmSayxho9kwZcruQQ0+iNmB3sauv9sAb4ankUlA
 pbZj4FWI=
X-Gm-Gg: ASbGnctKWPMvbsRGpJjsjf9A1ea0/xntPe89E3G2c/PK1WwtiTRj7CSIPLYwV94c3bl
 7+RTBp1OfvDKEqw+ZQyPGw9wJQXcKzrslPzwde5i6l59GJNR9JcUjqHk3HJvIBjvGk10dqP/ulZ
 48cRpxPYxR1jiwYh00gbY6rXhJGUkgQhvkwblaSOG9CUqB7GJBuSZLuCQZQ6KTiS+JexP/F7YIQ
 CTSi4KQkFKw0In6AScUgzY/sjBvpVlbtMdqZ4WQn5AsX/zcFdDToixp2toQd2q/rppwpQYbtS30
 ZbqfxwB9HmNNaaMf+Dx3HhSIH29NrVkgiTgPljgVzFVfelo2zPz9Cn7GJzIsHh/mw01co5Y1r2J
 UGssgT7FFxxePDdbLIiS68VkbWBbduXuPxq68TfBj/sdfXyYYOHRNhfwB+/0EfUh403WV
X-Google-Smtp-Source: AGHT+IFdBNGkIuSKOcgoVq5GvRCfnqUAbEHJSyD5Y+sBp/uxsISi7Wrp3JUCrhMtb4j7PJmO+6EmFA==
X-Received: by 2002:a05:6a00:b90:b0:73d:fa54:afb9 with SMTP id
 d2e1a72fcca58-74ee07a860amr4510965b3a.7.1752242933238; 
 Fri, 11 Jul 2025 07:08:53 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5d3esm5702280b3a.4.2025.07.11.07.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 07:08:52 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v7 1/6] target/arm: Add the MECEn SCR_EL3 bit
Date: Fri, 11 Jul 2025 14:08:23 +0000
Message-Id: <20250711140828.1714666-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711140828.1714666-1-gustavo.romero@linaro.org>
References: <20250711140828.1714666-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
EL2, so add it to the SCR mask list to use it later on.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dc9b6dce4c..ffc91d6b49 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1713,6 +1713,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
 /* Return the current FPSCR value.  */
-- 
2.34.1



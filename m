Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CF7CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDd7J-0006Wh-Dy; Tue, 28 Oct 2025 02:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd73-0006HD-Gg
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:23:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDd71-0000Xd-8w
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:23:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so49919115e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632597; x=1762237397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZEi183o7rD1WcugZJSDu8NGT2zNmRVlOx1Ob47ODbQ=;
 b=uMbyJCJ/8Y60JcvGBUK0sMoL8EqY4vmYatM0GPeieESMH4PmY9si4G6/GF4cHmvgv2
 s/+8JFFydj2ery5xXcHyplt8kZkVmGYn23BKi0c9T62z65Yj7uUKahq1bK0hfhm2rx85
 dF8zqmQz/j6Ka8QJgQXpO2+QBKl1+0TrCKdr7lPBKLCfVrVt1iYfIwkv0TaNWSXr+yr/
 d/VNbA91HMEK2C2j0HzE84PT9m/2hXnUV675ErWSy5sX8yep8vxBdAel77DBgbWH9uqF
 Xk/Y/n0NNckGtQPTNF9ymYiD0dNJmH9kp06mlE5AsKAtghRubUTwYeNfKXYJhhF7kzRk
 BmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632597; x=1762237397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZEi183o7rD1WcugZJSDu8NGT2zNmRVlOx1Ob47ODbQ=;
 b=gJ2Z1mBdLbz/6J5iVKw53Ifu51e6MaSjG5E/GGhke4SJUmWpxxCnVD1grC7ML5TeDJ
 9bLosi/CqtND4EzoPBaeJtq6YsIrp4GiE+Tf+y/A1oIfXI9/q9WyGV2qMiYRz/pncEVD
 c/871jaHNnod8aVJnCxsrzg6nFncXomWM9vTFrXpNeLeQBEqC+GOwfzC+rnUwRq+spza
 9U9sTJLDq02GC5OHlTDV0YZwVSfDimaiyJWzMXWilD4JMfa9CsCBaxH4dfJkhMKw0Elq
 GneHIZr9z8GIzX96kSIZzkA92w81Kt9RHmcaO26qqNc8HNqtmy0F9d9ca74sq8DLE1NG
 7egw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEcWGQLE+8Sd5y+OpLxPTzTQ9GgsJawA/ZTkw2dUtbPoaGLRffjD/J+DWgXPrl6On/QSdYLPbcnw==@nongnu.org
X-Gm-Message-State: AOJu0Yx9JWSZOBR/rFhrS1jDOedWjlwnVqrT3Q3KhvykvqaH9SE9IQBp
 SKUJR41hFfi38ApScflfUiT29c/1g9e73lXRXQ1goJfprB54fYSe1dWBgqpBXI/s76u1CLbPbwh
 WSNcbeyM=
X-Gm-Gg: ASbGncuiwh61/ppF0x+6Y02Lbk3sI4hoabCje5/cHDUV6niM9jEKEOcr1phES/2mW40
 NLfqYr/RImndxZ43uwVT6I/QkkL9p0Kr5Z2MAUxaQNtapx4SBEAcr/v8n/0feXoxc0yEXhh44Q8
 p+JyzTvE2gQgzYaiNpqhMlcg76RuntqrAQgTDCDsTQ7ldqWBC8Lug6pia+x/aqeuoYXojias5te
 EN8xLLLWEEXmo1vYEO1kQwTOYX6SbuQZEQ5f3pkCPO2qtEVnkXEtabaYMNYeepIBI6EIXat4uN/
 ERjZb4dKfpVSFbSWyyaJemQ8VZi9fUDJvabLCR+YVUBeTGrM+Mct9mWZAj017tjTrBOWVlfI6TA
 LbWYKVbZvdK40SJ5OCVpKI1nI5OHNo2oNQSPqokGYZYdBrE6lbgTU4zfBUOKwKDQ/4jXL13IFFf
 qOpyhIhuKMlkm95jydZo+XCASY+tww6IZrxqOyGa74YJEyFET/jOtbs8o=
X-Google-Smtp-Source: AGHT+IH8Q9+iIoE5G4g8CzKGNhZy3HBFsoa6N5b1xFBmfAx9OIV9zHVp7EGBzUn6GfIppHYVWzofHQ==
X-Received: by 2002:a05:600c:1d1e:b0:46e:6a6a:5cec with SMTP id
 5b1f17b1804b1-47717def7b5mr21075165e9.2.1761632597085; 
 Mon, 27 Oct 2025 23:23:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718489d96sm13647095e9.0.2025.10.27.23.23.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:23:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 57/59] target/arm/hvf: Emulate PMU registers
Date: Tue, 28 Oct 2025 06:42:33 +0100
Message-ID: <20251028054238.14949-58-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: audit it is safe
---
 target/arm/hvf/hvf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 22b7e34db0e..639eef3b800 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1234,6 +1234,10 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
             *val = env->cp15.c9_pmcnten;
             return 0;
         case SYSREG_PMUSERENR_EL0:
+            /* Call the TCG sysreg handler. This is only safe for PMU regs. */
+            if (hvf_sysreg_read_cp(cpu, "PMU", reg, val)) {
+                return 0;
+            }
             *val = env->cp15.c9_pmuserenr;
             return 0;
         case SYSREG_PMCEID0_EL0:
@@ -1525,6 +1529,10 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
             pmu_op_finish(env);
             return 0;
         case SYSREG_PMUSERENR_EL0:
+            /* Call the TCG sysreg handler. This is only safe for PMU regs. */
+            if (hvf_sysreg_write_cp(cpu, "PMU", reg, val)) {
+                return 0;
+            }
             env->cp15.c9_pmuserenr = val & 0xf;
             return 0;
         case SYSREG_PMCNTENSET_EL0:
-- 
2.51.0



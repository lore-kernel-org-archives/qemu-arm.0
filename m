Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96CCCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4je-00067f-Cn; Tue, 26 Aug 2025 21:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hs-0001fN-DZ
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hl-0000IY-0p
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-771fa65b0e1so660326b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257116; x=1756861916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQHHk+GzKEpRVqMmwJWOgMPUrj9GLRl3kw24x6qPa5c=;
 b=l6H6DCB1ZqctJlSdZTVutlUn4Jd7udBbxXEgSnjfQKCJu9wBt/B/oBZPz4DQBmZOLO
 M/+AlxdoXInfXfe8XDArplhXGoY82evgfr+RAWFH/tDdo2FaT0onnw0rEosPlfyXSQHr
 V0Hc0OcCmO4eo+Sb7oXu4hQE+QVjycdPJJJ2MS/5EbGeNP6sslBlehz0Nl91vz2CW2pa
 8URtsnwBV+pV+KsNYb+CX2JZaL7mIVU1kkRkdMf+WlF6+6vUEwnIav99wzMQ+6+i6OwO
 liZVSB8z9m65I+ibH+ZrPf48FPRGrjHupFP7ZGfLpkCYoxzlY+wbbdOB/NE2CaPMd3z5
 emFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257116; x=1756861916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQHHk+GzKEpRVqMmwJWOgMPUrj9GLRl3kw24x6qPa5c=;
 b=LsDnaVrNG08duTpqob7SwpuagDuY23Y0cG88t5u2e8wrtRfqQMwf1tnKuTtu2NBE6b
 wk0CA59Sw03CGsyWFO49x3LF/szgHFSdAMd13H1MUNbg7XLa5bXpQ0tA37DTJcV0gaaE
 J8k92UvrVezwmoHDj18euqk992dik2wANN5da10G1XzMV6r0MCbLJ2KYW6DWKcjM4YHj
 ZL8eiGtCWY/RdQITh0Zf5DsR+YOGa++Hiuf/PJDfSRzkF5F/RWzAd5C7wXgkEqr5C+or
 VOYPQeBES420wwYtzAMS9/vGw7x26aTvtSNGozQvxJYC9G4vqDpFJPd9Q3P+AwQFFc/E
 36ZQ==
X-Gm-Message-State: AOJu0YzvEg3OfOncV2MePotItkPb/8E3psNXiSxiqWV6/+h9BP7uAWih
 m/1gluu86sbaEJbIkGmxgak307zVayFn1v0wZ8u8KawuYdbZqzHnwBO4GBYmVcOgmWOMNiMbIqW
 p9alGVTs=
X-Gm-Gg: ASbGncs3Z1V4B4Ni+CNhIJs9YOP6IiroaloEEBZex6t/xAK85MweTSR2FMXOYH2kL2Z
 8vo3ZBQf5z+aCjUgQF8PMHZv2jbc8lkTlEnvBjlByC7g/+M4nQibdzveefIsetdXz1AFIuYox4I
 t+RsaFw/+dlkKK0Hfli3d8aun1PtuoAMV16JIzzot+hi41xIhsXR/MRMIyleS2lDDp/oZkxqy7j
 gZo4OkqYRk2pxRjva2SM75XTJmKfpzuQFpi6yal+u0IA9qTySFUfXwPgctim4s7QWAPJqraxNCz
 uytAR0l6/GpxUamZNesPJC4zBNK+5BfBCG9G3G9CDdPwN2kujIBdmdJACBgPfogmmTWc5tNtYjQ
 Qv3+H/uS6UG+ICAn+Jiexk1TgapX7mGt/2oif
X-Google-Smtp-Source: AGHT+IHIw1Rz5hAiaIfneDm2QDOaWkvGkeAaLtDGisvoniNCCIS80pgix2OB+9IsM6qSjsfVnfvnog==
X-Received: by 2002:a05:6a00:4b4e:b0:771:ed83:557c with SMTP id
 d2e1a72fcca58-771ed835a5dmr8661681b3a.2.1756257116210; 
 Tue, 26 Aug 2025 18:11:56 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/61] target/arm: Use HOST_ENDIAN_FIELDS in CPUARMState
Date: Wed, 27 Aug 2025 11:04:46 +1000
Message-ID: <20250827010453.4059782-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a5a8779aba..f7b861c6d6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -407,17 +407,8 @@ typedef struct CPUArchState {
         union { /* Fault address registers. */
             struct {
                 uint64_t _unused_far0;
-#if HOST_BIG_ENDIAN
-                uint32_t ifar_ns;
-                uint32_t dfar_ns;
-                uint32_t ifar_s;
-                uint32_t dfar_s;
-#else
-                uint32_t dfar_ns;
-                uint32_t ifar_ns;
-                uint32_t dfar_s;
-                uint32_t ifar_s;
-#endif
+                uint32_t HOST_ENDIAN_FIELDS(dfar_ns, ifar_ns);
+                uint32_t HOST_ENDIAN_FIELDS(dfar_s, ifar_s);
                 uint64_t _unused_far3;
             };
             uint64_t far_el[4];
@@ -444,21 +435,10 @@ typedef struct CPUArchState {
         uint64_t c9_pminten; /* perf monitor interrupt enables */
         union { /* Memory attribute redirection */
             struct {
-#if HOST_BIG_ENDIAN
                 uint64_t _unused_mair_0;
-                uint32_t mair1_ns;
-                uint32_t mair0_ns;
+                uint32_t HOST_ENDIAN_FIELDS(mair0_ns, mair1_ns);
                 uint64_t _unused_mair_1;
-                uint32_t mair1_s;
-                uint32_t mair0_s;
-#else
-                uint64_t _unused_mair_0;
-                uint32_t mair0_ns;
-                uint32_t mair1_ns;
-                uint64_t _unused_mair_1;
-                uint32_t mair0_s;
-                uint32_t mair1_s;
-#endif
+                uint32_t HOST_ENDIAN_FIELDS(mair0_s, mair1_s);
             };
             uint64_t mair_el[4];
         };
-- 
2.43.0



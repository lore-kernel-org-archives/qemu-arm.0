Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADEDCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:10:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dF-0006dJ-Vp; Tue, 26 Aug 2025 21:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4d3-0005VP-72
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:09 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cw-0007UK-EP
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:07:07 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-771fa65b0e1so659295b3a.0
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256819; x=1756861619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4VzluGVNtyKJrvXVDGigWrz7oPLdUT2YsAV8VDVK+g=;
 b=dBcFsylxDkpAk/XUzWb3PnrM7/VKpVGpnmRYlf4a4JMTTJA89UsT8wyGHuivQCLg2J
 iNnKTVL8PiGr88hofzVYg0HzEYy5AZ2Udz0zjmSf4/iViSmZsAsKmTIN7PUh736UDh2V
 1otyXGYbXismhCiZenZbWkFpqwfqyrUOrCao0d67MZzX5Tg6FfgkDcn1Vt8l6GlNtVBO
 EJGZ6MVCeupjyGysVE0gUwyHG63TpBDyOY0iZLO3tjwxLj2mCKh5FLmjzCWv4sVaKZMq
 gR8nhQD+i9kBaeyYI3WPPLd8esPrxzbilsqX3KkUjCDxTvIF5BExzn5UJR2lDB5skF23
 feLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256819; x=1756861619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4VzluGVNtyKJrvXVDGigWrz7oPLdUT2YsAV8VDVK+g=;
 b=VaDdYWVmgfavPr4wTPgZZIE1oKIPCIATj63/b1THeZ2g2zKDROUHtpsR8yyfXCdKEm
 Ox5OxQHNWglh+RtCm1/LbcDiDrb/nIqEkDKB8YVOUe7ZTjSc86+zpOCxRR9Sgha5oGCk
 MnRUVE7uJnLi0gR3W1E1bLvfbKu2DbboJVT/6bXnNj+Kk2yJG7hD073vca6D2+XMzBM5
 Yq75eV5hvysUZnIgWNtJysv6yMykIVGIDZhCKPwV6rC0x1tFk8aXG58bzPFxcAss3Clv
 7khvlEokHCFfE6ziVfe722Q0+RrVwpicon9sUSQPOcCNIUSvSViMuJ8fe2p9Z/qGcJMb
 31+w==
X-Gm-Message-State: AOJu0YyM3SlrZrMWQI4qu0bciYGTV1oJgsxp0LdeQUrwsW/5hMTPyl+P
 dpGH3CaQpU3FQcQ2O5c8EZ/C16NQLdT+G1t6mLo5ARjG16y3rbsuLvlxyGlaEZ8d1R0=
X-Gm-Gg: ASbGncvDVXbStOzP8iTqHQtvo3mxzp0yQmENSf/GmVD5lC2eFar8oPkjTDzZT0hU3XI
 kx7DHrlLfJl/bnV2NZvvLiE3FTOfj2SLBSETbMiQyzaAeobmOm8vOrToUUUfokYksLt6rfmYh8Z
 lC2B89FmsWkLDN0qEfJMvCTaGdJI1pjFp2dU7UG0QzTLyNOxOfmlVJuKjfcrMx6Cp8n8Dp3Hjda
 oiPKlMOrg+4xXRrjzu+anrDZ+KeAbRkLMQD5B29kVN5ueLen6gkyU/OJ280jqZq/xasRvW/dOEx
 LidvIluwj5CQ/IfnsMhsr+aQbrm9L5fub7q0Gsy9DsN21t2kG132eSDPM6jc0DCDWet5v0/ERZi
 yHweKGiHPOC+Htr+HJ8nVdlPpOuAVvcTPi5Pz
X-Google-Smtp-Source: AGHT+IHAPEr7d+JyW0l3CDykgcLwjOqu1e68QQty6uIE/pqXE6SRPBhYWw2V456kdFTreGMS83r+ig==
X-Received: by 2002:a05:6a20:a124:b0:240:5b1:e157 with SMTP id
 adf61e73a8af0-24340d1241bmr23386974637.32.1756256818732; 
 Tue, 26 Aug 2025 18:06:58 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:06:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/61] target/arm: Improve asserts in define_one_arm_cp_reg
Date: Wed, 27 Aug 2025 11:04:12 +1000
Message-ID: <20250827010453.4059782-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reject ARM_CP_64BIT with ARM_CP_STATE_BOTH, because encoding
constrains prevent it from working.  Remove some extra parens;
distribute ! across && to simplify.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ce03336fe..da6a8f0a8f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7552,12 +7552,17 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
     int opc2min = (r->opc2 == CP_ANY) ? 0 : r->opc2;
     int opc2max = (r->opc2 == CP_ANY) ? 7 : r->opc2;
 
-    /* 64 bit registers have only CRm and Opc1 fields */
-    assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
+    /*
+     * AArch64 regs are all 64 bit so ARM_CP_64BIT is meaningless.
+     * Moreover, the encoding test just following in general prevents
+     * shared encoding so ARM_CP_STATE_BOTH won't work either.
+     */
+    assert(r->state == ARM_CP_STATE_AA32 || !(r->type & ARM_CP_64BIT));
+    /* AArch32 64-bit registers have only CRm and Opc1 fields. */
+    assert(!(r->type & ARM_CP_64BIT) || !(r->opc2 || r->crn));
     /* op0 only exists in the AArch64 encodings */
-    assert((r->state != ARM_CP_STATE_AA32) || (r->opc0 == 0));
-    /* AArch64 regs are all 64 bit so ARM_CP_64BIT is meaningless */
-    assert((r->state != ARM_CP_STATE_AA64) || !(r->type & ARM_CP_64BIT));
+    assert(r->state != ARM_CP_STATE_AA32 || r->opc0 == 0);
+
     /*
      * This API is only for Arm's system coprocessors (14 and 15) or
      * (M-profile or v7A-and-earlier only) for implementation defined
-- 
2.43.0



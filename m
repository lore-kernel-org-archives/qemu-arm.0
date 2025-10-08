Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7B4CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:07:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cEW-00020a-Qs; Wed, 08 Oct 2025 18:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cDB-0001H4-KK
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:53 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCV-0007P1-VA
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso198803b3a.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960793; x=1760565593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bjs2KSAaFbdAG1b499mTeRXJBukAcX/iNNZB5CfLwbQ=;
 b=eEOBtiihkPmma1eqLoJyn8m0MVL0ck+wCja8zrAovNBgh1CArO5oXPQ8jFaMkHYduN
 9is67LWqvASkVYhXBJoPzuiglYTtrlZi1OLf3pDTlsBYI6LnxRyOwgxdHxjryQkLohgY
 3riQQa52GN08sVu80DKoU3knI4fhN6ExVGCQnZd3SVuxz+yGPyLJcPfX7j8ZIoLHboUd
 kxXcZZu/XspHdXPOL4MpxrPsDPFLxfXkXZjGL5u2MLAseyLzUDIZwof/iuOkGR8bdkFT
 p4btRvaD93tC30nhswLczMr65oF0lAbTuIP7+4aWqdoc4HtrNjmXj5K4MpYxdxXVrLlo
 Q5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960793; x=1760565593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bjs2KSAaFbdAG1b499mTeRXJBukAcX/iNNZB5CfLwbQ=;
 b=namQZeErkF3ZQfZZ0b2j5XffayoYNT4xv0xadxnU18mxJ7aO/GiVGEKlNP5qhAAUhF
 TEHyspI7zISwAksh6P26TTxhMseG7M5NKJR2lKyqOqif3uhBre/kSFmui92jxN+MX6Xj
 oP0L/AsVJ7oKJL3Zmjr08kfIR2LgzJyiuRsKR1BC2M/feBW+WphLpwpiyM5mMMkr/cyH
 u5XfE1/BDOgBPl52gAwUm+qTpFI0mUMRhMttO/Xer8ublPxHmBf1s3ZpZVLuPCiELXJ3
 rHIy1usr7xkQpJGdJeeN73nYRnfii+YhW7QDb4oh86qxgCrktA0Ak+jIiAiJ2AXkFIrj
 rSGA==
X-Gm-Message-State: AOJu0YwqlelDRIpuQ2GwtE59usPiRR7UjBV6YVzo84weW/64lt+47QNG
 ZeQpBKKrqGPN8mZK8dStMQVHyY7mr/EBGDXjQPRuj9N3lg2UQlhxSl9T0GHv2MUwpdI=
X-Gm-Gg: ASbGncuC+rn6wNt6SOuizu/VNt0t5IEcltXT4QsG5uMTN5GxDkTxxnjARKpeCNQd2CY
 kVnmYSU9ulw2s0SnYTzJNqNhBHCY+qhNuh9uXsicuyavCLwz5oh55lQp1oVuKSQ5DOA+Vy4rxvL
 hLLaiv+3rqM98CDR6N8LLsCKm0R+bpqNWOU35L2ykBs+FaHnrDdsUbdnuYq19PR64URPdRE03Q0
 mfbxt2mA/pHKzz2oFHG7XgQ8FqSfJE/3yM3rrkkIDBbIOol3tTnFBvlASw2vnuWo/jbtrSKglKB
 sjzhoHhLKk54a2sNDbpYQIXdhUmOGvquzWefC8vu+BLWR/kmiA14rNVXO8xRy6YPaKrgl+uOMaV
 fIupHsOIc7OfkVU7InrvZZA7mGb4UWLd7sXq04hoeK8v5NW2qM8IGED3kAz3QOudtFr0=
X-Google-Smtp-Source: AGHT+IHr6eY8VcJfZSP7GMbeh30NI8HiHwq2mgJDGRdmmxb2FMRk9D6ccta2XDYvZuYUgCTbEBIuww==
X-Received: by 2002:a05:6a00:194d:b0:781:7e1:a315 with SMTP id
 d2e1a72fcca58-79387c17862mr5482444b3a.22.1759960793105; 
 Wed, 08 Oct 2025 14:59:53 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 59/73] target/arm: Load gcs record for RET with PAuth
Date: Wed,  8 Oct 2025 14:55:59 -0700
Message-ID: <20251008215613.300150-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index dfd5b17831..918d5ed112 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1898,7 +1898,12 @@ static bool trans_RETA(DisasContext *s, arg_reta *a)
     }
 
     dst = auth_branch_target(s, cpu_reg(s, 30), cpu_X[31], !a->m);
-    gen_a64_set_pc(s, dst);
+    if (s->gcs_en) {
+        GCSInstructionType it = a->m ? GCS_IT_RET_PauthB : GCS_IT_RET_PauthA;
+        gen_load_check_gcs_record(s, dst, it, 30);
+    } else {
+        gen_a64_set_pc(s, dst);
+    }
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
-- 
2.43.0



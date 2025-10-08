Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB0CCD184
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 21:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6c9A-0003ry-4U; Wed, 08 Oct 2025 17:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c98-0003rR-LA
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c8z-0006cX-Rx
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:56:30 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-27c369f898fso3761355ad.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960577; x=1760565377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rWJOhjURiEbCRYa8c3KW2+y29uA+cSYlWdH7crvrg6I=;
 b=M8X7xigI4FTNliIB0bgQh3e/hgdGybTSEzm7sEv0PheIWAVpVnpdHs2Qc0XYEkNDsV
 LM2obklonWW0p1lDiARAXCgKKNn3wXypXbOx09wCMYr009nidCQL0wQIthyiT4Iif1BL
 AzI9SaKJIs5p8qAcbFJMokirVsYvd3D1YuxUAwcJU3vztsry0e5zuqD0oLWbpDVBqabJ
 qVtr6MyQ4pupWudap7joeWkY+Ri7sSyH5rjtvBzhVkbMLZ1oGLUsB/8sq0/BCQ/a3tTq
 OgbH7RelunCKkQzBfRE8eDcUd3Bct8oHlvoE3hbL3IEkwhGh7I1Bwy8VxLORe6kJOaf9
 AorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960577; x=1760565377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rWJOhjURiEbCRYa8c3KW2+y29uA+cSYlWdH7crvrg6I=;
 b=YM5IiNlA0XHROlZzZhxoR+5E9BLV+S0+NNaH1ZSJkFLSfzMya3lZCaWGACQXIsKcFC
 ivV4S70jZnj+tM/zpTDRUTkO389FM0xB88iN2Gsirrhg5Sz1LIvhMPTjQzpClkG8RPOD
 Vve3IZXZbWX/Ns2d4zfC2oZg13mhV4/iF/0IUfZiljvJgiq7sy/noMxLE4Viqa+ZZzjl
 cF2NAm+GYwNq8UdYeBCEVla9PVeC9KHnYQyMlcaeRfzElqQo+cgeHvlTdOwqoUhtB/VP
 O13Tzyqocx66Y48F/5Y28vdHrdGBQ2d+UoM5g4xhsRskG7pBZrxRKKVyi7Zef2v4WuNW
 WX3Q==
X-Gm-Message-State: AOJu0Yz/k9K+Ywfdfx032v/0+9+kzmoOPn7WtTwpOCxi9MHGMv9VUk53
 vyaapXXvEhGj75mCYF0E6I8tpcLAkilgtlKGBboD+90ZQw35LZ1NGH0zn5ui210XZ5j5j/erHpL
 jV49bUvY=
X-Gm-Gg: ASbGnctNLMvoGen2kbhIkznF2OReC7EUnKlf+Zr5HkCvHliTUyImiKHAt2n1zSjuYwN
 S+4XML8d9se/rb6+g8H697Zzb/vyiUOS5q4Lkm0rXJoI6kDUpginMHqr3rVnMHzWrGkb2mhndAm
 H1IfML1NWmS3ZHkSGHVFI2bhvAxt88kMY6v9V7cbXN7NDMFDy5jp10gLhxhfv1UiatXoKV/utJW
 2yzrCFmj72wK9JpcCwr5qPOrd3LJFmoVy3dQaDAO4NUteTrU3ktAEf/JNLHgsL66xRB/H2Ul2Pi
 TTFPIgbQL97zNeliS3zzYuOktHU5rXMyf9dhVXtUnzajO9j7Ic7TAa+nq6VMLVd8JfXRgHLWPyf
 LQXnWPE3CQ8Hzh5Nyin1GlfQyXgEzJ0swo+qFfmD/JEt3AiBytnhf2NsT
X-Google-Smtp-Source: AGHT+IEgurIOkx0WpZz/bZ8oRZg00njRa41uQsTCAmc35sWDU2EHECKuywkmLiBDYmWWlR5EGZkmDQ==
X-Received: by 2002:a17:902:ce81:b0:266:f01a:98c4 with SMTP id
 d9443c01a7336-2902723e35cmr65703875ad.13.1759960576617; 
 Wed, 08 Oct 2025 14:56:16 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 03/73] target/arm: Enable TCR2_ELx.PIE
Date: Wed,  8 Oct 2025 14:55:03 -0700
Message-ID: <20251008215613.300150-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b7bf45afc1..c9ebdf144e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5902,8 +5902,12 @@ static CPAccessResult tcr2_el1_access(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
@@ -5911,8 +5915,12 @@ static void tcr2_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tcr2_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uint64_t valid_mask = 0;
 
+    if (cpu_isar_feature(aa64_s1pie, cpu)) {
+        valid_mask |= TCR2_PIE;
+    }
     value &= valid_mask;
     raw_write(env, ri, value);
 }
-- 
2.43.0



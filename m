Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF6CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:16:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyv-0006vA-Rh; Sat, 30 Aug 2025 11:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERE-0007Os-1y
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:45 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERC-0004zF-Ey
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:43 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-24458272c00so29633415ad.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532861; x=1757137661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Puj47LzXnLjLJ6PpXBaEU69J8yF1nDWaKunYAxIVNeM=;
 b=caLHPpigPcRosc0If56qfxy63FjsQny19BHCIL+l491tiCk8TSa3jTggA+NdUBnxfm
 Fi4MJAlrhhPwY4tsIdXNy8OUx5IHVVUI1m/28fiowest1Dqlj5l3JkEaRyqpemIMWAcJ
 MK1BdOSWniBYfd4a/+REPq/EOCyVaxLIvuPGmm9BbM0rqLbvF7s3V4of+B9Zymfoo4gV
 S3qF3MbUo8zSW151+wvymgmvOKBlgLKsofinOd0Lmrj4ZoTSX11ykWxwfFYAKWWZDzMG
 WlAQxikHuJ/4RVZJr/Fbz6r6iLu+IiLWRmma2CULAeyor9PbKowbLDpI1xnMNtMEmAxU
 eoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532861; x=1757137661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Puj47LzXnLjLJ6PpXBaEU69J8yF1nDWaKunYAxIVNeM=;
 b=BD04wPx9LZgfnBkWimY7pU5gwV0uo38ZS+W4kIhjgQ0lF+c4fuCvg/4BuEu42+lnE7
 6vU4fKNsKRsBFo84urjITRTZsHDXUH1LE7RA4t2N9yPLiZBQ06s4R27fWrVZ4QPjXsGG
 IQqpcWgiTR32VW6HS00VKMxintYI0TVDXFnQFzTm/wkcH7uePeLP2WltNQjpyDhF10mV
 yYxy7dfWlV0sqKs6Yq1oQvvK7FbmhWcPNkTNBuYrYf2nNtA5Hc8q9pJhPIoVbBF5IEhN
 H44puxgapt/Beh2/nGCjNIHTaZzHaszYhHoTUd2Y8qMmntW0qFJFLphAbb+JcsfWmxRh
 41xA==
X-Gm-Message-State: AOJu0YyaL4OimgqJ6cLNlTRpCuNty6drMuPlpq21xK/YPYXH7sDPWBUs
 bPsGU70NVVjUw47Wup8V/vo5PhrDd980vHxTVGBEcIIB0uOXnrrrJ9N34Kyku5fsgeg=
X-Gm-Gg: ASbGncu5s2k01k/mFQwSppU96AX5Hk3jDdbV8CM6Jip6ThSoLLegeqeIWR/CnsNSqZY
 962V5jLtak3vKv44EeAUBbMRLINMlsklc5J3Wk8PCYEtMCZsZQ1SudkCSr06wzAxGxqFL5UtTfS
 g/FDV7MKj16Xen57z0qaRaJVXfmLJpgfzFLmIH+9TuI28nyAoIMnAEVDNN4DZbxZY3q8F7UoH2Z
 UI+7+74+tpf4pNnK6JQPaxpYV/DcgVmx0Ezqt+VKgNiFCbcbbKEZVzY7R1wbdoGYJ6beGWno/ZA
 t7lHXUazjphQHp7fiBwhX3RFrJ2cokQXsx433NqwtHfnBPAE58T20nWXWLL0oJ2ATcJq6xJCSKL
 D1Q6Kf9vg7rZ1q2KKQQBPMADO6+F3L5frmvF4aAAyQ9//t/bpQ5PqDzS7PSQBBKfoju9AJ0Phcg
 ==
X-Google-Smtp-Source: AGHT+IHsQIH00eycoTvaTg8dyKi3F5s1YOBCHYHdHD5dI4kh9ptsi7e8PfHV5hlMpsJXTxtv8Q55TA==
X-Received: by 2002:a17:903:41c9:b0:249:147:95bb with SMTP id
 d9443c01a7336-249448de13fmr12519985ad.13.1756532861081; 
 Fri, 29 Aug 2025 22:47:41 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 66/84] target/arm: Add gcs record for BL
Date: Sat, 30 Aug 2025 15:41:10 +1000
Message-ID: <20250830054128.448363-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
 target/arm/tcg/translate-a64.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 481e748ce0..336aac9d1e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1678,7 +1678,14 @@ static bool trans_B(DisasContext *s, arg_i *a)
 
 static bool trans_BL(DisasContext *s, arg_i *a)
 {
-    gen_pc_plus_diff(s, cpu_reg(s, 30), curr_insn_len(s));
+    TCGv_i64 link = tcg_temp_new_i64();
+
+    gen_pc_plus_diff(s, link, 4);
+    if (s->gcs_en) {
+        gen_add_gcs_record(s, link);
+    }
+    tcg_gen_mov_i64(cpu_reg(s, 30), link);
+
     reset_btype(s);
     gen_goto_tb(s, 0, a->imm);
     return true;
-- 
2.43.0



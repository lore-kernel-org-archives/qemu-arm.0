Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8C0C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLlC-0008Eu-R9; Sat, 02 Aug 2025 19:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiJ-0001Mg-HP
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:33 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLiH-0005Ci-Q1
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:32:31 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2e95ab2704fso2742718fac.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177548; x=1754782348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+ER0bRwaWJSVZXuKMTaNBSXf4hbZ3aeU4lFfN33xP8=;
 b=I2Sp/inoXJ5XeQHTqbMSgu6IUvuZvSJa0IZJs0j2r0Ul/hlECcxUK4G2Aygz5xQCVl
 XqQkjxgITDvJY6Wqj13VALGaIvYxEk/Hlj6kFty7U1cN2/TgUWd+o4HcUYaAd1DMZHi+
 +7loMcdcIApE1pa0z48ibkTZ/9gBq9uYAmBHilHnoFFcS6AdUdTEF55mby3IBSHje/bq
 W92t2aDLzsqzgBy9lj9rzIuTZyHyOOTBiBfkSBMXfQusyVaq2FGPr+Kgr/Bg3bprRBE5
 t1xgLfgMSMgSlzvM431DAtTAqrYClLScAMouWXwj2/8REoBsG4M/yrieGe8foOUEwRSV
 TvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177548; x=1754782348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+ER0bRwaWJSVZXuKMTaNBSXf4hbZ3aeU4lFfN33xP8=;
 b=OtyMSqvicHzHI/v+7TjTLNLBDNGBylW4ZHp5TqVoO2cg8E87hIwYRomNiIGxl+Gaw1
 QNIFH/NNQv4EbWJTENuxOFowiASholjMk5yCzGV9UwEN9FLkRWTBrCFVIUVQwSiZH7bl
 lTS5s4qZxAmwwkd+hu5pxPWteq7usOsJndX+T9SZ5p8jpwxHcIPO4Ps9wabJdClMauzu
 tVYlL4vP+AsMBmIo3T7exxqCqeQUj7VnfZZUW1KiwsyTseERODFqF1PdooIl4n2pMB/K
 /EI6jw9fOZhUsE7xYa5WAJJrja6oy8O7cJixwTJZ9gLP5Xsb/O7oYueuCURk2lSb6AsY
 PRMQ==
X-Gm-Message-State: AOJu0YymGAruaI3+V4rUqtpAQYvtekMw//eQfaUj+Aop7k0UWNIhJxQ9
 UY88Tb26M1gl8XWPgbnFCJIUz3chn0TxJkQbw6dBEgugl/OifFM3WhS/W40rizIYFIQ=
X-Gm-Gg: ASbGncsMlnofUnal/FQXe40yMI1mVr+6O4jllypw8KuWwJ8FQbFiWCELxFr4MEG/jlN
 fWo0bjoFKIBMqxQ2ilxRztQMsS6xuWt5Y9V0smNi/LfNDFKrJ0udEC0RYi85cpDdFlTbwcWMe9w
 pyV1fu5f9d0daYo7xHD7YBqKsjmQHYuxKatX2V+BA6HuCgnZkTEJcjN54o1/85kshAvfPunPkNX
 PkXQwGgpi82SD+iGBxVlo3X4oyD+Zr2myQ8Gxch/AtEZkGL41H0JEeZKuD8cEO2BIJyacurfv0U
 YCuF3ymIfJbppD5PCEMYzybAT8ki/p7KwhQGD+BJvRy67I63Oig23gmOAh1fvu+aL/XebxCN8sG
 tA4ZPeIDl7PjmjXaikj6yhnSPzfFWASphXZuYRZqPW5hrNcMcPBhv
X-Google-Smtp-Source: AGHT+IFJhpavev8tmCsno0hhsspVnsNFKxZqLAejzQxySeJtzBiiomFYZ2XygFfoD4LgIJjxIqNOGQ==
X-Received: by 2002:a05:6870:7041:10b0:30b:6a26:5193 with SMTP id
 586e51a60fabf-30b6a2652bfmr1588619fac.37.1754177548694; 
 Sat, 02 Aug 2025 16:32:28 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:32:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 31/85] include/hw/core/cpu: Widen MMUIdxMap
Date: Sun,  3 Aug 2025 09:28:59 +1000
Message-ID: <20250802232953.413294-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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

Widen MMUIdxMap to 32 bits.  Do not yet expand NB_MMU_MODES,
but widen the map type in preparation.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 accel/tcg/cputlb.c    | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 23eb849a9b..fc9a2291d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -201,7 +201,7 @@ struct CPUClass {
  * Fix the number of mmu modes to 16.
  */
 #define NB_MMU_MODES 16
-typedef uint16_t MMUIdxMap;
+typedef uint32_t MMUIdxMap;
 
 /* Use a fully associative victim tlb of 8 entries. */
 #define CPU_VTLB_SIZE 8
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2a6aa01c57..416aaa1040 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -89,9 +89,6 @@
  */
 QEMU_BUILD_BUG_ON(sizeof(vaddr) > sizeof(run_on_cpu_data));
 
-/* We currently can't handle more than 16 bits in the MMUIDX bitmask.
- */
-QEMU_BUILD_BUG_ON(NB_MMU_MODES > 16);
 #define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
 
 static inline size_t tlb_n_entries(CPUTLBDescFast *fast)
-- 
2.43.0



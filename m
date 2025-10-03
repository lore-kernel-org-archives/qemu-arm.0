Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D08CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:22:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jKc-0005QH-DM; Fri, 03 Oct 2025 13:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIb-0002k1-Cv
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:31 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGn-0006JW-7x
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:21 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-279e2554b5fso18833315ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511308; x=1760116108; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnGv3gaWQ9shrmt0WGxn8YCEO4EdUIFI2jl/MhJPR7Y=;
 b=Do/SFVuc2pdXoTGO2rZoaedAG0cOStAxmmZH2gziojXed0C2zG7QYfa5QsGILB4rxR
 bnoFqJmwnL3ewfqvhsDK92SFIrBN27c53ULm+1s1SUe93YqJoneZMkrBE2myF8xpa+Mc
 oW0NCYvwkxC669aTvFOo2ay6wplVcpbS6/c5vBLJyuYmPmuwQgNweZ25EVDs8EpGxjtZ
 IdptExWbtGrubZF/tyv8lRu64IwGKXqCQ0AMa5kWm7MNQTBFrxojqKrSxtkWdZ+5Jqt+
 TMLVmFigLAaWebNOCWNxAHeg0Wq4YvqmiI3F8ep/SJqnvVMeLZe03mAKEfWvDvhqXLBZ
 Avqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511308; x=1760116108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnGv3gaWQ9shrmt0WGxn8YCEO4EdUIFI2jl/MhJPR7Y=;
 b=Xtcdg3EJTXY4ma193om8JrbyE/2xPHg1rVb2kOkgRsEHyq8b24oSth+owvrlyKhFhz
 LGCivGvGbhxushdMZ4xudbA2/kHI946O85v71Zm/+fI70FrZgzIOsitwJK1xyZfpxYcj
 cd9cETHbeSyBy4hRGUg8nZ/DrvNskUqvz6TTywhNknJmTrPddltKbbXwNjlNv/+WZWqw
 TPDp2K0kufi1m7aTiKPvrwvCklM48c5sEmZWbcMU7g0jXibRu/vzY3bMDEKfYmibYDrC
 uI2oOQ6oIL1uIecFFyy3JR1Sk8VDXkoLU6yY7Nk2FrNhT5W5ruGcvJFHurPT6vfFhYZQ
 BeTQ==
X-Gm-Message-State: AOJu0YzelC9rQ+JnPUlapJr+RCeoFX8fQ3ORq1RnbZSop/3kUjI4Ib+s
 F1Mu054O98SV8aFuMfyaDA5QhXbfB+Hin6FGdMCGHRJnv8qAxFUnupiRdvTZgCWpJBI=
X-Gm-Gg: ASbGnctxa2ZMpfiyFM0jhj28J1jgwWdjUeG49fjFKIRGUuaCWwefxekL1q/zZaGXVwE
 zvxgc5U05vOEd+US4AQl4+e+540n6jpQUzHWnG+LFyQ0tWcNcSYdf+3IxhdJ76DW4QSnt+i5VW8
 ruQifM5Ghveq2Ih1zTveKyZI0eyq3oWRzOsyyKRpsBhkvj+ktNfZRPtMAY00RG84lIf/SZnJBeW
 8RZLUg01EizqXIrAKhDmb9CZxeKtFNA9TcLky3Y0njDFIiUZwXvGtxlRiRUnEpkVndbnMiGoJbP
 5VwpyqbMDVE+pZzMJGEt2+5WJL8H1q0EgOZmJvIhubXViRysD+NNuRkO+G36b22pavWzsDzHAwc
 InIlfW5x81njfLraC9W/YyEthhj02Xp+JzYIuPAek2i/nnvuSP4z4+aSP
X-Google-Smtp-Source: AGHT+IF08Qb1ZTCf8uYJaQEde8WiCdifUCrVA9ZUy2q8d989x069rCnd0LaEXacj6aquf7iDaA+rlA==
X-Received: by 2002:a17:902:cf0e:b0:278:f46b:d49c with SMTP id
 d9443c01a7336-28e8d038c23mr93721845ad.9.1759511308381; 
 Fri, 03 Oct 2025 10:08:28 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 30/73] target/arm: Implement gcs bit for data abort
Date: Fri,  3 Oct 2025 10:07:17 -0700
Message-ID: <20251003170800.997167-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/arm/tcg/tlb_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index ae2acd6727..f1983a5732 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -28,7 +28,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
                                             ARMMMUFaultInfo *fi,
                                             unsigned int target_el,
                                             bool same_el, bool is_write,
-                                            int fsc)
+                                            int fsc, bool gcs)
 {
     uint64_t syn;
 
@@ -78,6 +78,7 @@ static inline uint64_t merge_syn_data_abort(uint32_t template_syn,
 
     /* Form ISS2 at the top of the syndrome. */
     syn |= (uint64_t)fi->dirtybit << 37;
+    syn |= (uint64_t)gcs << 40;
 
     return syn;
 }
@@ -252,9 +253,10 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
     } else {
+        bool gcs = regime_is_gcs(core_to_arm_mmu_idx(env, mmu_idx));
         syn = merge_syn_data_abort(env->exception.syndrome, fi, target_el,
                                    same_el, access_type == MMU_DATA_STORE,
-                                   fsc);
+                                   fsc, gcs);
         if (access_type == MMU_DATA_STORE
             && arm_feature(env, ARM_FEATURE_V6)) {
             fsr |= (1 << 11);
-- 
2.43.0



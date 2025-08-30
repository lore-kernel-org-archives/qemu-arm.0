Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FF3CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:56:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNx9-00026v-4I; Sat, 30 Aug 2025 11:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMa-0006Ag-IZ
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMZ-0004H5-1R
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b4df220483fso504580a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532573; x=1757137373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jXVVpPrnUxKOJDwLJ9Z6F/DAfv+srkdIqMUZ2+d07Y=;
 b=vWyjygIZbJOxqcvFbOrOcIh7gqCqO/JEwDbD8Ip0ztcK3SWs9CQmnqXD5JoaIUvW54
 4beflCAUcgBBbuF0Vm1gxLNnPtDdrT2Hr2zOWCIL5AGhAH3lZsc5yFip1jWJdUWv4KEx
 rMNpYH26eD0cD5eVTn7aHV/PrKwMNppBRb96T63ycspCbiFbQ6uQW/aQEZMTkTow/Vwz
 JEE0+6nEyMhDuIxgSkbHYEuciX5gJyKztV6FLF1AqYmIrTnU1Dj6Z03paV+ib2iqsDcv
 H6uvvGZRn5YHsiCPEXoCTBNKzFHnTDJH4hqONl8ZtGveQy6AeBoYP7PoB68lmAmgDVZ7
 e4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532573; x=1757137373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jXVVpPrnUxKOJDwLJ9Z6F/DAfv+srkdIqMUZ2+d07Y=;
 b=A0QG/hxZT0pso0oXw+xFD5wR14vqHpG/Mm/wjIf773u3UTLaUUucebx2WgdU+f7qki
 ecFgy3luimr+pnPuyvmde7FiYpyXdekC9Tt3gJ8di7FslhLJHyXRDCf0L/F88Wrtxcvh
 E9OzD1QpKM3rYm1OJ1KoxfzABIMLeM75/eAQO1VBHg61vTUQBiJico7Uu9mIIfGkvlep
 ObvJILaAvzyrgeesTAw85vMNmC8Zfz/3axzL6UA5kxqoGCcJZ/QssUA2ft73HglpEXvp
 CyxiZIuA39BW1SiQcC/e/G9N0Brqcd5dggpb2+GxilSXh59O5hTuUJElNqsAs++Nmzqj
 4zIA==
X-Gm-Message-State: AOJu0YxvSBV+XSe4e9IX2M0QDvtlXk43HZ2vQWNQX/BWq0M1uzeAoNNz
 4IuMxdVvRRvHVJ+fAZjyspu0r2IYTZaOn/RuXp2ype4qUo1K+nR2U6d+jUCLD/U/W5Q=
X-Gm-Gg: ASbGncvU/30+oqAjyjqgSYP62CHq0md8/FcfsRcqAT+X5G0qU+MdEc1GOkqrEsg12c6
 MPLNgLDFzCYPHGO6jHlWzuvf5zia10HsLb2mLmG/yOploLM3H+xSm+H4Uj+1xJAzlDmPvslGWG0
 XmlarPkSGaO+7pm1GsW5gMAwIZa87odwloPaJqNeDeqRS9A+9Gf19ZWzYBDnZGkgqTVCfoATwKz
 H9p3cIeDZ3t3C4UXe84sIf3Tv3+1zo/E+MQvRUUpb4l6fPgQLZgRkf4N4ui216YjFipinvynu5G
 oWbd4zXcLxH9sv2d8YsjHFtG428Guiw9zZdSGXZL0HSUCogMe6bofHTjznIZvLYTCS6OCT7v4mN
 r3m/m/cGSs3A6EOncmtMP9MybdSiq9w0dMnjk7pcusD93DTLQB5TvogS9poJxAKlDAIw6CRI=
X-Google-Smtp-Source: AGHT+IGSSV9YaeKjz1SVhbzdzd8dc2AALtEpO9t02uivwQ2oE+SXSYI8tX9dkGSYQiMyb9AIZGsh6w==
X-Received: by 2002:a05:6a20:918c:b0:243:c2e8:f4c2 with SMTP id
 adf61e73a8af0-243d6bca374mr1584893637.0.1756532573249; 
 Fri, 29 Aug 2025 22:42:53 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 28/84] include/hw/core/cpu: Invert the indexing into
 CPUTLBDescFast
Date: Sat, 30 Aug 2025 15:40:32 +1000
Message-ID: <20250830054128.448363-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

This array is within CPUNegativeOffsetState, which means the
last element of the array has an offset from env with the
smallest magnitude.  This can be encoded into fewer bits
when generating TCG fast path memory references.

When we changed the NB_MMU_MODES to be a global constant,
rather than a per-target value, we pessimized the code
generated for targets which use only a few mmu indexes.
By inverting the array index, we counteract that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 11 ++++++++++-
 tcg/tcg.c             |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bd835b07d5..23eb849a9b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,9 +594,18 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 }
 
 #ifdef CONFIG_TCG
+/*
+ * Invert the index order of the CPUTLBDescFast array so that lower
+ * mmu_idx have offsets from env with smaller magnitude.
+ */
+static inline int mmuidx_to_fast_index(int mmu_idx)
+{
+    return NB_MMU_MODES - 1 - mmu_idx;
+}
+
 static inline CPUTLBDescFast *cpu_tlb_fast(CPUState *cpu, int mmu_idx)
 {
-    return &cpu->neg.tlb.f[mmu_idx];
+    return &cpu->neg.tlb.f[mmuidx_to_fast_index(mmu_idx)];
 }
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index afac55a203..294762c283 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -425,7 +425,8 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
 static int __attribute__((unused))
 tlb_mask_table_ofs(TCGContext *s, int which)
 {
-    return (offsetof(CPUNegativeOffsetState, tlb.f[which]) -
+    int fi = mmuidx_to_fast_index(which);
+    return (offsetof(CPUNegativeOffsetState, tlb.f[fi]) -
             sizeof(CPUNegativeOffsetState));
 }
 
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA018CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:09:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJj-0002O0-42; Tue, 14 Oct 2025 16:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJT-0002Ha-Tc
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:05 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lIy-0005Lw-Ss
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:01 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso4053239b3a.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472449; x=1761077249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYs+R8nBuhH5wnLhGR7+Tv1X+mkctfJ2nU8EoakcyGU=;
 b=YTiQdQqsJlHekxaruxFhBOR2Tbqk/yNl8wISELCn4vBMRebGC24QeJSg0ZPEiV7Uz9
 0X/6V0Glb+nfgfCKQU3tEeMu394ZuTkF55XGu8DbVnL7LA8n3tvjyWMLk17Wv2ZQJpMA
 ZkxrJsNiHPX7zH9X8DxJv61F/XBrKh4UQOxqLbyBt2i1YuQykJM3lHS0lTbZp2RwcrLv
 N4hUu6eRlLHB6+bnyVtydt0rFS0tuhuAfUC0lSdJA8b+7nz6GPLNRpxFgUH6Zp5hYB7P
 ufb4DOBlqO4oWQgEljkmYpjjzKnxW35dPP1XceRwOkivW53BIFUQ+Es0idfdjzY3/KBk
 kVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472449; x=1761077249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RYs+R8nBuhH5wnLhGR7+Tv1X+mkctfJ2nU8EoakcyGU=;
 b=ajrHQQEYAYXZBcudP1trDIeXs7PHGpmPqaMEVpS+xZYb7ubDipmMMfcQMI8aS8M5z3
 FCXnKwGSfbXN9iABiG7XHyP+1uKrXAj1oa89ZRTblwcGnvjza7Y4Fnuo656DtqUmbM9P
 Irdx2nvVMVUg8whLdlF9bYkzwURIiKpC2S9Obcduuu19mGV5PlW5cC7hzlE9HVuDNygu
 Ph6U1fnKgXbA+FJmCxfaao6cvuSU+n50pO5ZehVrWqRfpwNqCBdiA+oDH+NsVriLWP/Q
 Xk1qlcEUQKvj+KZOKiJEmrLRARrfQBA0rYgrWftj1Tji/iBfk0rylPs5NhvY2Yd5XZGM
 OUBQ==
X-Gm-Message-State: AOJu0YwWCMO8XsP9pb2eLVcz7GPACrh4ZsrQNHteK2Ka6yJzZK0qd5We
 kV/6wYY9dILWZlV2ory2dKwHlnpJEjdBTF5s3qlnv0S2DwkKwrPEgn0uk/adorm9g1s9GMYiWE/
 lIjarABY=
X-Gm-Gg: ASbGncuXlEDhtIaflhFNvko/l0TFaSWIro25yd+EYj+9+Bve7sP2UcYCuYebdrSWPsq
 zgKIRcF+gNRD0OHuTdheYnm9QMspB9ui2ALR1HEHNOB18no1C1hfAETWkMZC7W5AGYkU3qsnoCX
 +jG7vr1/MrLuHeg7UIhmrzPdVA5aYfIQC77hK+jGhnwsnIaxe7fUdovbQI6Yeikmrh71hMKiWYl
 xP6/mMo4kKrKgh0GsUIYdaVWYCK27KzhlWzCuh9WB8tbEX1c6FlfU94VwY0oIdR2El2fiwnip34
 WlR8k6X3rCpCtuD14zfQ+q+0ciQo6uxL8h8QMKNJxJfELIRpXwgMsY/C7LZlRxYiVtisW4wE3O7
 R4ZBPTWVk99vs0o/vN8qaShaSYFoLQGWr1xoDiS+ec5oYlwar7Ao=
X-Google-Smtp-Source: AGHT+IHPEMx4e4eTE1GhbtCL72Gkra25XCwoVcJSGS5u1w7u0d5tMSGxSSED9iUGP0IXib1cEP4xXw==
X-Received: by 2002:a17:902:ef09:b0:27f:1c1a:ee43 with SMTP id
 d9443c01a7336-290272c2564mr335665385ad.29.1760472449429; 
 Tue, 14 Oct 2025 13:07:29 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 14/37] target/arm/hvf: Assert no 128-bit sysregs in
 hvf_arch_init_vcpu
Date: Tue, 14 Oct 2025 13:06:55 -0700
Message-ID: <20251014200718.422022-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
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

HVF has not yet enabled 128-bit system registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0658a99a2d..aa42fa09c3 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -897,6 +897,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     env->aarch64 = true;
     asm volatile("mrs %0, cntfrq_el0" : "=r"(arm_cpu->gt_cntfrq_hz));
 
+    /* No support yet for FEAT_D128 */
+    assert(arm_cpu->cpreg128_array_len == 0);
+
     /* Allocate enough space for our sysreg sync */
     arm_cpu->cpreg_indexes = g_renew(uint64_t, arm_cpu->cpreg_indexes,
                                      sregs_match_len);
@@ -920,6 +923,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
         if (ri) {
             assert(!(ri->type & ARM_CP_NO_RAW));
+            assert(!(ri->type & ARM_CP_128BIT));
             arm_cpu->cpreg_indexes[sregs_cnt++] = kvm_id;
         }
     }
-- 
2.43.0



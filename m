Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDFACCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 20:20:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7JaV-0000Sl-FK; Fri, 10 Oct 2025 16:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaM-0000RA-D4
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7JaH-0002mM-3g
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 16:19:30 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-78af9ebe337so1934971b3a.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 13:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760127562; x=1760732362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CP76C7oRmzrw27VCj+6uaBSxUKPZ5rYHiNDf93P0cFA=;
 b=VH8nnEqPePlElnzgDcJQKCfUlaISHRvOvN+ZjbrDbb/0ikPXHSwk1FBXNfEtV8SPZx
 7yC5G727+KT2JmC1gZeaybEoVvsykvNZXeGLu3hSPl24a0sKMEPH6T3bTd6qF3y94x0f
 bjPhcRDFOxDIuq1uubmM7WbQ2iBKqESEbKv0UV0h6mJBbuD2OvFL7AzoHDB8Gc/dC/Bp
 wRxkrxZHSf1BO/oKbbKenroe1KE6N16EX1+ZLqoYbQ/vdtu3W+qQkCwfDsc2OoBPBj1T
 qT65xisdaqHOun6TQvbo5b8UdPhA4P/36XqsRgt1I/sLvUoHomjPsW3V9+gg1epPGe/I
 CJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127562; x=1760732362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CP76C7oRmzrw27VCj+6uaBSxUKPZ5rYHiNDf93P0cFA=;
 b=tDy9BNDGRxRPsqwcK8sqLmSDBmE4U7uTgwHBTHW4b0/lJbqtigNAivLTeduSIDVDcE
 OWc7ZP5mQ591BgAoT/MPvEUJJdnXR41DNsNmLbL7wfR2CSOLMhB+5Xjf5L+TJ9cDbHzU
 ta0kKie6AbBs8gr6PNlUoIPX0Zewq1w2e6/JuvqtuMds9XGiPbVaHZZt7mLeJSlPCzjh
 U+Zqqf85tWoIY15+qkTjAiI8xzPf9fJi7clZCucOu4JRk1QpUARMACOHDcFYZ9V06lIM
 06fy68ndHC0IVj6CJqGgt2OJdBfVS9+jFqNa3nzETsDnUHjvN5p0ebpQrkhgEHIWMh6n
 rx+g==
X-Gm-Message-State: AOJu0YzBGOy/Rb3ELz6RQheoAcWkVMs73fJCJ7ZBNnv0eWhD9E0mqAq0
 g1wcrXRTwpXEXYP+X1YFexmdHc4L2x1PZKD+on3CEs2Vym2fNCikgWt/PoabNcgqKb6+lOrvZmx
 Q7wlSHFs=
X-Gm-Gg: ASbGncsqiQOWcH/4usik1d10Nzdku4FA9RRC3kJ9GfTtgoSNdvWY2Oi3XMSE/jGAba3
 9xM/WPfj8ved9rjB3NBQNzD7ahlNYCu+6OYjRn/1ib8MG3w/rNkZSI2TLhWfJuT4mYdBv6QRiv3
 eczBxAda2R76SgAv2VfMwuWhrDhbOqQ3IPQGXGHAf3KGE/tJK4KVl3BBSY+mIxb2/Cx9GRzy1Q1
 AUIcH21HvyMdFKVS6P8d2V2MuuzOVxxI+FkCY1ooNakEu3n//+28KmHKhcKMFbjaPSI9kYRTOem
 uJis8/HFtZ2fZnmWFXd8KUfwzgKXUBu59G8EydOcDYszYaPDddPszG367mrcakPE6+UPDIchRse
 MBFX99G2jTcFtl/dq1XNmoJdihuRVzNn+7mOy+3fcHHlJkONGC7YuH5Lo41AtKQ==
X-Google-Smtp-Source: AGHT+IHrsSC0MB3bUEfGYxk95TRPMNyTgd7R8NwAEpXlWu4EDGq3kqy3NxGiL/E2+Va6qwJ+0wAQPg==
X-Received: by 2002:a05:6a00:178e:b0:782:ec0f:d271 with SMTP id
 d2e1a72fcca58-79385ce0c44mr15849346b3a.8.1760127562040; 
 Fri, 10 Oct 2025 13:19:22 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992dd7ee5bsm3764830b3a.85.2025.10.10.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 13:19:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/7] target/arm: Use el local indexing mair_el
Date: Fri, 10 Oct 2025 13:19:15 -0700
Message-ID: <20251010201917.685716-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010201917.685716-1-richard.henderson@linaro.org>
References: <20251010201917.685716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

We already have regime_el() computed to a local.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 54c45fc9fe..5fcf104272 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2319,7 +2319,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
         /* Index into MAIR registers for cache attributes */
         attrindx = extract32(attrs, 2, 3);
-        mair = env->cp15.mair_el[regime_el(mmu_idx)];
+        mair = env->cp15.mair_el[el];
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
 
-- 
2.43.0



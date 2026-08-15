Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4C2C5DF6D
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8k-0008I5-Mv; Sat, 15 Aug 2026 16:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8h-0008DQ-0Q
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008Os-HM
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3811f512167so3078385a91.3
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826273; x=1787431073; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a/hlEFf1FqljA5oL9KqdkF9I8pya5mr0tI2C45YHawA=;
 b=Iq/BfRjPDzwe1c+4zAyQA89TqLY2gDYeGniHnTTd350UU4xDUYQVD6RXYqb3H5uuH9
 xL+gSDWnUr8bEOJgQXdFng5BsKbxjBmtxRr39T9bX3YzzW93zUpcOVsDITkjCe95tlt2
 Sy2vbR6jL7xYMxHE2vin97mxksExdbIky9kZlPbvOkJzqduBzrr5wjIlM3WMDCj/rgQk
 GpyJnNF5kpetOqSx4VpklKz2yj/L+/mSSHaZiJgl3HyVFHePT/rb+zgYcZnka17eMLed
 xNxjtA24Uvx9AxcOtKLFdiVTVSaTqLRcfm0BauTcnMGe27D3F15ypqkHqM8aLBXbpLal
 pZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826273; x=1787431073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=a/hlEFf1FqljA5oL9KqdkF9I8pya5mr0tI2C45YHawA=;
 b=aYukbC+LEMMIyYawaSCk/AwZpkyjNQmXm2dTthOv+7bpfxKB+xH82aYbjDayEIQ9h8
 l1fMQKc2jZAORgo1ZgZhu7+BOO1n86sAPfN7R0bk+M+KJv4pmROusYsLIHakat3J25Si
 l0OUVfhcZYbXJzqPTzzvz4mFIN2Dz8OIJkbuad50tBJqXW7PHVLDGZBTwQQAr4mTOUVr
 LNAA2WIhpsPlLu8tNng9KEqPDKc7E2RwLlgAB5Iuy8sA5gpsFKdavdvomLvAgvdrc+mC
 Wot2C1w58F5CbS9z4nVfefHjlnKg7szF6KvUJFAqrfdy3wGcU8sL9El+Si4F9GSxSM+r
 ++Dw==
X-Gm-Message-State: AOJu0Yz8cSsKR6W13VHePSWEt0Xkq5LgIsUXVLcbOgSh22zcEMcCjEgY
 EbXUAve0FTaFXgpowCsWPPnF7Dys31WoUBXcdv3APzZICiL6QPDFL7YjqsQGtU4aFH8=
X-Gm-Gg: AR+sD13gDyRWePdgz1XVgdUzy4hvClmuLN/aSzLDMTJmYu4zFxTznchoFgxHq5/aqMK
 Iz2ikrv8zAlR90/upSI/YEVYuvAYAmQyp7s8pv2s1lGh1d9dEZLxZVnMtlSz+Zirtsc6MOCxejo
 Fm4PfsRg4JRs//cVVS4pYevQJ5GOLoqiLrgBukQDKohNrG5rVc+GU4zbI0iYV0Vm/l3cKOGGMU9
 V8XMLQ8B2OhpRmwxxhN8sRkZjJ6pR9O2Ea6Pcf95t/DAb74BV1D9G+F29GaAu8g2nPeBx5n4Wwz
 Rko7JVFSggQSnZ5gsNenC1sYL3hLM3UQ9sQfrUXVcTBRjozzCZ+Z2qO6oa3jOosZf5/roDlYOPn
 kLOL1PuHxgkm4zLwTw0ZAPtsa7I+1w5ES75tvgd68oSiIOj3qKRKPYI4LQeK2JqL2U/7B8d33If
 JoPEDM/oyVvUmIQUYOsU3QUy+5ZxuaQyqfuCokmZtJsdoVztsrPnJLV/cVRw+wNPAINhAntwfzq
 08DyBx5q8F0iujwWihj
X-Received: by 2002:a17:90b:2587:b0:38e:8300:af51 with SMTP id
 98e67ed59e1d1-3933b84b0b5mr16355159a91.8.1786826272976; 
 Sat, 15 Aug 2026 13:37:52 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 16/18] target/riscv: Recognize watchpoints with first/last
Date: Sat, 15 Aug 2026 13:37:28 -0700
Message-ID: <20260815203730.1468365-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/cpu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 11f2654da1..3318e82ea7 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1784,8 +1784,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, vaddr first, vaddr last,
          * Otherwise we'll throw a debug exception and execution
          * will continue elsewhere.
          */
-        cpu_check_watchpoint(cs, address, size, MEMTXATTRS_UNSPECIFIED,
-                             wp_access, retaddr);
+        cpu_check_watchpoint(cs, first, last - first + 1,
+                             MEMTXATTRS_UNSPECIFIED, wp_access, retaddr);
 
         raise_mmu_exception(env, address, access_type, pmp_pma_violation,
                             first_stage_error, two_stage_lookup,
-- 
2.43.0



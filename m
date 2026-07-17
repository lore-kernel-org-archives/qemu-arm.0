Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1249C44515
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:25:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrtt-0001Y2-So; Fri, 17 Jul 2026 19:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrts-0001X8-Mm
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:24 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtp-0006zV-Hh
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:24 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cb5a6aa8760so403726a12.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330600; x=1784935400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mZTwqniLxRl1m+Mbcq6QdOuxrIA10SI062fGGhdr3eE=;
 b=C4lIwUMCm+LHM7FJ9yZAFzuPJIlIm781TOP0bDaz+GTi12KLeTc1TGjGpVSpdq5ve5
 BChw47oM5wzuhxvcFjhCPlprYzbPddOtTxGIokZocor8Q7HrKJmZ2KluOqBNnOBP0wHV
 2Moapuku5mnQYZFeiLJLg6sEEE/N/mEnmxZNSUop12Cnk5yB+hFXLS60uPltTsaEVN0p
 /YT8Kd/OgqeSV9D+DZNN+pATzltlvKhqVHU13l0IyTphDqDT0HA003MUNtPTQBVGu5Dn
 +nlG2z+n/KDoNmM35zo3PEqABqR6ueu5Pkhp27WeLPhne7BT/jwaoGOWB5D2bki8KDo0
 aNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330600; x=1784935400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mZTwqniLxRl1m+Mbcq6QdOuxrIA10SI062fGGhdr3eE=;
 b=HgOCdYAsmO8r/1f2IcdvQaaNUpHWcOwTgH4FmuqoEXJDMV9x/yEmBIoTkJ/gBwQB0W
 5ElUPoaWedgG7Lb3MN2WYAJL2MYW7xOJxkR3KxbJiKPWekv45T8P5pbrUy7uDJQzI9z0
 cuR4tdkTUflwEbaxCRmfZyYaxiX4fr13RsxScogZNSkeUOQgKsFSsLFyPrjrvxr3BZzr
 Sd+shvioT21A59YaHvR8XzeoR3qvD+Y13IQ3GsjQGI9z0aqz76UVFcqydH0rHuBnuzkQ
 J6iq7BOYpsidQzDrEoleCQR0HoLqaMdS3kjRDPDEcqJPMB4h875ojq2V+27qD3Z1v8my
 Oe2Q==
X-Gm-Message-State: AOJu0YwUuLxQcXjBr0bQ9Ej6TG9nmGv5iLqA/fYLR/JoUk2P4rMyQj1/
 46eAzNeKARD0ID/osoOQjcxfDAuPbyhilYMJKD+2hqyUSe0lKvM3QI5pXVa2NptJXXldcsU0ck1
 IEpmP
X-Gm-Gg: AfdE7cnti6AdUqvipjZcBE64iqxEEsQ1ZGqD6EY0YBKOek1ffLrsOmRch6torQhlRK6
 JRQHbNT2XTb4WtKDGAlywEcJTMmorHqUwYW2vrFhk4TivoNC6huFVW0JaSvE4PXV7ah4aaSpxzn
 czQ8rJf61ddPGGdbI7C3abYjIpgFctOolQ6G8igDfA7mBwpLdeDqQRIW3GGruxzSfTt/giahGWZ
 5Rl6wgnTeJ4gdeNWG8X2nkE/IDfroC0X3HNm4/benKlzsx9oXMbwona+Jg3KyrwOguXKS8Y+Pam
 3r8n5yqwNjzDQaOH7GMFOUN0aScsRoJPPoyfSDVGYIEqJSEboFAxDR/r1fFv5MTV618IV6JQTL/
 rPtOzLh0gP21ApQ2Fb6E1I/atoLgJU/6p5mEjDvmvviKHnPziAsPAMGzcTLhVGHelmjd+7ZZM8V
 HVc2CZCLc=
X-Received: by 2002:a17:90b:3ec7:b0:38e:cb1:8ec9 with SMTP id
 98e67ed59e1d1-38e4b585bfcmr4868782a91.42.1784330600120; 
 Fri, 17 Jul 2026 16:23:20 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/17] target/arm: Drop TLB_MMIO check in
 allocation_tag_mem_internal
Date: Fri, 17 Jul 2026 16:22:57 -0700
Message-ID: <20260717232306.378988-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

There is a memory_region_is_ram check later that
actually does that this was trying to do.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 997248bd57..6177dea842 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -181,17 +181,6 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
         goto fini;
     }
 
-    /*
-     * If not backed by host ram, there is no tag storage: access unchecked.
-     * This is probably a guest os bug though, so log it.
-     */
-    if (unlikely(ret.flags & TLB_MMIO)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
-                      "but is not backed by host ram\n", ptr);
-        goto fini;
-    }
-
     /*
      * Remember this across the second lookup below,
      * which may invalidate this pointer via tlb resize.
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA50ECA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:03:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXK-0001Jl-7y; Thu, 14 Aug 2025 08:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXI-0001J1-Ul
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXD-0004BN-3i
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:28 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-321cfa7ad29so1525388a91.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176301; x=1755781101; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMQri4iirPxW00R1ccJFExnMIuYM+qTTYK6RBx2pETs=;
 b=kScnhijMkh4fK2TAPt87EurG5Y/CEYpuG1KGasSqvmKgIcu8LnkzIkQRCZWGnyKERg
 rTcre6mD2BoALSiUVZxmXxNEdWOhVgn8iB9FwyQm6eb/2dpOgeK+IokUwen/qozZeSKb
 2nNYGK4DTtMdNiPteMAvIpA/Z4P1EP40YdEACoEvXPvUyIxBBvgJ5zWj4sgPgCNLEbWw
 59bREfJGZeUwlhgN7nDKBnX6tD6OpldOAvgVZTy72z262zYIN23kg2ATyp2h6LvsptQi
 FIjrA4DUeg1GZkVCe50PCx/hIZXVJPuqP28CBUfHJWLYKVTSRs5+/PrXAOJb9iVUzZgm
 kQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176301; x=1755781101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMQri4iirPxW00R1ccJFExnMIuYM+qTTYK6RBx2pETs=;
 b=pr8EMwJ5uK9K1j0iM0hWAswgfXiCFSdggkhztSS9o2vUOwIZaU+JQk6ROaVhYw7pM6
 P2hlqy0Q+9oQZt4hnfqKaiHuuVI4SkaZzcIHx+RdmyLCc5rbOLPrSqPl4fVWeStG4srq
 Rb8hA+1LP8GQVButvWSpPIZIuspHyOvr16lO7bHGzyyD20PR5xdykvRScWBpsC49D4B4
 wIabspMJApVvn8vKQg9pGZmRGgRIZgSAHgG4r8F1vCI42ae4us13Hzic+lQXcwIdcbZY
 FmN4ln2VjpSZtBBQi67JR1ODFjXqzIGmNIPGM4nOfto66aCwPnfm1ir6tvjQ9MMDn9Da
 7I+w==
X-Gm-Message-State: AOJu0YwfkPvBAaJCe5BelFerQxgkrIiSJ5JbLXpVks4x60WXErP6K1d0
 x/gpT/Y6s/hH9YkvLYdsqMjilqv0tvsntr1HO6ELOrvEZGW8KPwh3OZxeiJh9W+inK3nbvDuEjf
 /yizhoE4=
X-Gm-Gg: ASbGnctYORxgqxkDuZ8S2jIrTKMZFc64pa+vV7DU/am62ycgYUvipGIfAkpU4k47mPM
 IocOGb/R9g7GDT93XCu2y/ImxEGIuOyi7w2d786bKXOKQ1OECQJ3/dwlJIFk3D5X1sObjR961YN
 k5v/uF8rTucH/qYar83fFifqkB8d/GMGCEa/CL69XL2Wnrv9NMXE+TH3uwR25eXDJd1tA5qWskU
 apdPd/mKiPWOnrMcZ6osV6KvyLH7nvVNIZwoC/y+sbfrG+9Ket2fDXjQsyB8JTi1Tnwr+646Jip
 TfiCDciQJTChg3sFmPLTKZapLfmrevg2vqoY0g2YClTJfxEV612hPLu9S21HOtxN/zpkP/7WHa4
 f4WhFG3QnayN/YNSuDyRTa3ggwT+K8vX1xgstT02lr7TrtbI=
X-Google-Smtp-Source: AGHT+IFZ5p52PRXa1B5zoo+oD3zwqhlKplNSRUKode8dH/AgWf95c1aSo4HrroWTDanby1M1KeMciQ==
X-Received: by 2002:a17:90b:17cb:b0:31e:a8c4:c188 with SMTP id
 98e67ed59e1d1-32329ae5446mr3782241a91.14.1755176300530; 
 Thu, 14 Aug 2025 05:58:20 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 06/85] target/arm: Skip permission check from
 arm_cpu_get_phys_page_attrs_debug
Date: Thu, 14 Aug 2025 22:56:33 +1000
Message-ID: <20250814125752.164107-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Do not require read permission when translating addresses
for debugging purposes.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1b90e33f52..c7db93b95c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3646,7 +3646,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
-        .in_prot_check = PAGE_READ,
+        .in_prot_check = 0,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-- 
2.43.0



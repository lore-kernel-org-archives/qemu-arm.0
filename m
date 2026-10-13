Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2937ACC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:40:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY2x-0006lS-BN; Tue, 13 Oct 2026 04:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY2v-0006kb-QD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY2u-0007Y6-6I
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:39:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a01933b584so23045735e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880778; x=1792485578; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yMqLoW+XIVeQet+rIDECiVnH/oSDnZLxZQh8AFD0o2w=;
 b=q48KTAVJRjjM7NPzja7OF5c9ebpWYLORzYv8op7q0XKMnqARCWNvhTzcmMORfHxD7+
 HCgckV2xIyUsevQ7Uo7+6BAvItrmRVaj7qgGvdhcwKGtD0SYZA/POd6b5zEPowSFyAGb
 IYPpSX695b07gdCXCOr3WIdtyHh2DgKx8k4lVETE2uLX3DGT2U7anNCV0P9G7Y9/Gcqn
 UfUmBGRWrGLl/Bk8XglI3LF4T7ZbRwPWxPVRbTam/4Tt1GJl56WA4/nceLcUEXCUZsH2
 rheKHrMXbc1JxnqvixdKOUgD2mV40ED35pzxibkbUN5mHILjLh+P0rEvW+LdKrEJb6v3
 IT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880778; x=1792485578;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yMqLoW+XIVeQet+rIDECiVnH/oSDnZLxZQh8AFD0o2w=;
 b=biLcoddQ0w7wDx0dLNYB9qDR/rI5mPFHr/6Tv0rjLwyF+ok1A97XDqt/Yv1A2QMRyn
 zF3dKRFTf8Q+JVCEq+eU4cZqtZrGG1Dixuxp7qgSiYKuRo6qwZzek4QZ04JVQz3EWUe4
 +YEBYaprv/idUqEOK+KSIja6f8Zi8jJof6V8oOEjnekwujrkJBBXyGkM+tTujQutMzsr
 xvUnKoGmMCIlh7hTmHO5nphkWeveHpTknpAmWNBQ0tNAf8z/HzzuWzZuk/4Pw2ry6mW8
 +H0wbIakFASpG2j5RtphCJRMNxtKBUpbz2PSy0Rhnidty8hU+queCpCGzjNPAvna8ZZt
 4Kjw==
X-Gm-Message-State: AFq9FYJxkA6+MsxCu4yHI7T0afdoIXVJx8Q6sioiVTx07GMyP80BbACX
 l6O6kyuMZlvXkmjCnZteEhTV7YeIfCBImPi9TewLbpTazdSLOxPl/I7VafkHgyEyZHeMFIMxXbL
 eehT0FXE=
X-Gm-Gg: AYBFou2wmbzUJev5FIv1Ht0xMXTr3bLmM33TSDjHiHyzCA/RgDRQw3H6e8+Z5H/cYH7
 wYq0flCtqWgigmAM/qy8baDmUNJ6IK5n7E7Y6KCX7jDHk0dENvkRiZJAxgZEZZaIe/07Tlarsoy
 WmkC50uIy3X5VVLLKI4T9ezDV2cHW0VQeHjJntfn68agWtAnDLQG+FVxLsOf2+kduLc0xvyNeiG
 jRn5+kYBqS22in3CutSSsVerBMxJwLVHU3un1nKgZ494HD8e3k+Ueyqijf4M+52Jypf/Y4lt4AC
 L5D3mINoz76tEFjDbDA4+jqtIj5tYSK/wqNt/mDLHqTsbRDok41EuuEaFu5ztyy3seWppxLbVbW
 mbyzpLfM2sUSeP6tKNiLT11zcsLDNrKq2WftNkx5LG0jf4aeEGB2fEYnRMZiWveo3mM0v1VtJjo
 tfaVv1SuSAjOEBVQz2kyZyNCRPyMan/k8C1s5tDOYWK+PeRJ4KrVr9WtWLBTsCOLTcwJho4h+PF
 +i+v/4ZWxN9DR6hFsUG6gY1UQr/Im9YmNNuVUKaCiMgNx2W9CHrJPL5t+uFPU2Yml3ILsC2q8ZF
 bpE=
X-Received: by 2002:a05:600c:154b:b0:4a1:6af4:c6be with SMTP id
 5b1f17b1804b1-4a18e4d1c0amr215390865e9.34.1791880778509; 
 Tue, 13 Oct 2026 01:39:38 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:39:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/86] hw/intc/arm_gicv5: Make IRS_IDR0 reads return actual
 value, not 0
Date: Tue, 13 Oct 2026 09:38:08 +0100
Message-ID: <20261013083933.1024405-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

IN the code for handling reads of IRS_IDR0, we carefully construct
the correct value starting with cs->irs_idr0 and adjusting it.
However, we never actually write the final value into *data, so
the guest will always see zero.

We didn't notice this before, because Linux happens to not care
about this register value except to check for the presence of
virtualization.

Cc: qemu-stable@nongnu.org
Fixes: 405ad2e76f13254 ("hw/intc/arm_gicv5: Implement IRS ID regs")
Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 08878193dfc..ebfb0878af3 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1433,6 +1433,7 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             /* ...which means VIRT_ONE_N is also RES0 */
             v &= ~R_IRS_IDR0_VIRT_ONE_N_MASK;
         }
+        *data = v;
         return true;
 
     case A_IRS_IDR1:
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57E9CD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 20:44:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXPlq-0005mu-T7; Wed, 10 Jun 2026 16:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlp-0005l1-AJ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPln-0003lp-H4
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490d1e54b3bso35284545e9.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 13:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781124205; x=1781729005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwHZ9gYg6F3c24UR8lvzGRrX0K3Wt5/wFulUFwGmu88=;
 b=BNsUMKfURb/TAYuStHJC6WuukS50fbcFkd/A5bVMlaXoUIjgSbIhbzt3GutJqrj311
 NvMFudtR0SiuOqTm5dLVdC7jclcHyj+ejjA4bu8t+bl+LIlB0lmcajA0Sn2EmkHSaLbN
 /8opj/6RyPo9bHo41EP1HrRcA8iZc+JISSaqednEw/MG4GAE4jQhQYPapHKrcBP/yua8
 DqCH7Q3LTyPySJeNoF9UqFF7DB9VS4FVflMv6zWhgBfLERXzlVSxOBSSLXCWv+GplCJp
 maICIBZiRX8BSp3QHwZofYnvYPUMQhnIBzFNV+RRIjOENUXiHZtD8lL+M3qHyO1pHR6K
 lO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124205; x=1781729005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hwHZ9gYg6F3c24UR8lvzGRrX0K3Wt5/wFulUFwGmu88=;
 b=rszbtnovxxHURpCwWQAumGbdqSmMt1pQ8Q71YA/1VWi9JKfzLXj1QyMnIYL0fFKW3J
 yczp6WVoB9nNL2i6McQThetb1XdP1PiqoZ/MB31S2AfMHmV1j0yn02igr9lWYyu9i5Uc
 AfkjgXGSico+3tS+t/9fdct5Xh2/Sw3EJIgz8XYrrfI7NLwkjsdPxD8TyJITql1xtWW4
 aGiu7Gl7SoLi6iNmdVIb+9/ZuuuNulrgOsXFT19BNGaRA45k8gAEY3Ghh7EFn7Vve76y
 HoAwYQQq2hnnHR7UawfjyrflkDIr+Yp6DML7DQbH+ravlvsNO5RjV8n+ZpXIFEkaJg9U
 TY3w==
X-Gm-Message-State: AOJu0YyETJ3ChHCRePamLTHYB0MtcR/Osj+oRNpj6HEx8z8sVXRRkB4T
 IV0PdEDrNFzV2tA7QTSm6KRRvABPbre9PbFy/vFJ9uLlKzOuJtZwKlUPgIXYRomkGUc=
X-Gm-Gg: Acq92OFBZSdVd5yo/l0AE24Cd8nz7akAYuPPIrHNL8o9QWJVq95Sa5vCZerNxqfJyZR
 4HXlwFI4HG9/5qaY6N4LR1uzjjSWF2/L97GojvTHlaaEvxyAT+roIWdSlRzmkdU6LCfd1/vlETh
 wzBYcscGCUpobtAlhuiOdEEY0FFnq9bXbZpq+emNfo7bjOTigqZ14vsLAJ07zK6SdnHm0bzaO0w
 CXpghy4M/ynIXAwcYZTDzufTFNKM9u5y5LeH+0DaRcz2IZSHp5HLXKCh8aNTxRDQ6AeoTxubVNl
 agUZpj454YJSpG6p/mPqgD8rLzIXuV4OpMSlvemEzR3Q9iY2NDzu1p9ifAY52WMzJIuKfFApnxX
 RoLnTW8Q+LJteSU4x0ysEfIpxdiiHWg9wbFRJw/cH6RIO5VBYYxjhznbQBd2WGmiGpYAB/J/Lh7
 PU198v5KQbc0YAgLeIVApmFvJS67LNYWlyHg==
X-Received: by 2002:a05:600c:8486:b0:490:e196:6574 with SMTP id
 5b1f17b1804b1-490e196664fmr34202005e9.13.1781124205618; 
 Wed, 10 Jun 2026 13:43:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc47d4e0sm92781315e9.0.2026.06.10.13.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 22D7A5FA2F;
 Wed, 10 Jun 2026 21:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/6] target/arm: split evaluation of CNTHCTL timer IRQ masks
Date: Wed, 10 Jun 2026 21:43:17 +0100
Message-ID: <20260610204322.828645-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610204322.828645-1-alex.bennee@linaro.org>
References: <20260610204322.828645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Whether the physical and virtual timer IRQs are masked are independent
of each other so the checking of CNTHCTL:CNTPMASK shouldn't depend of
not changing CNTVMASK.

While unlikely to be seen in real life we should still make sure we
behave correctly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9dd8fdfa41b..f4aae0a4072 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1802,7 +1802,8 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if ((oldval ^ value) & R_CNTHCTL_CNTVMASK_MASK) {
         gt_update_irq(cpu, GTIMER_VIRT);
-    } else if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
+    }
+    if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
         gt_update_irq(cpu, GTIMER_PHYS);
     }
 }
-- 
2.47.3



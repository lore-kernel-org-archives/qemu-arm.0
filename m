Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF22C9832F
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADot-0008D8-5T; Fri, 25 Sep 2026 17:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoI-0007n0-79
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:27 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADoF-0007od-En
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cc147d86bebso980933a12.0
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373021; x=1790977821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+cdoJ81YNEf4q3G5tKQRS1Ej9pjuy+FmmxI+jro6EY=;
 b=DQJ5kP0sgpe5doq+b6dM8qf79zLntWEkHMB6VEIMjfFmQaZ+n2ImtpBWpV0r+4mT+E
 azXB/ZTRQKJ1EFKgeJtd+VGUgHUOF/qKiejNv6Srqp3L7AbHHSUWkkYVZ0aCy4Qx/AGC
 hRHGbhfkdlQP8RtuH7inY7T8nSzLF5Ppe+0VweDhjtm+YUZ2CcokV8LzFAtAAdPK8YTI
 4XElKpSFYN8615RcwMKXaWbhIRbFmB2hfpYo0rfbOUHAl+eElqDdarX8MESHycgTYUOQ
 /r6jAC5FXKjnUQb/2Hqfqmp3/rnqPNa4tgDgLWcM7dFPR+UipsX7A91yTMTom0pKUb+b
 Wc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373021; x=1790977821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=C+cdoJ81YNEf4q3G5tKQRS1Ej9pjuy+FmmxI+jro6EY=;
 b=Bi2uED7Mj/FSIV9EnZlkxShzIkWcSCouRor277Ae81SZZj9V0j8cXqvubJVYSaM/An
 dcDyPFJUpCS9r/Xr00Gis47gfn8A5B/r33scxvRW02TwVipOYLzu1Tt2EMYWFiawjrBa
 ia2QxUgIavHipXIyUykKVVmYwcMTma9usrscMDNZg5fdCoLcVB+IE/ii9z9yA5sfTSyF
 es6aF3vBGyEWWeBSU2ultXGR7gcXwxQWldGyfD3YJXe/a2E9Xm3paDHSdIqeKKRGudi8
 L8cbvdjNSxIoMHiAiSBASrsAxXHCvEEJITswnxjT03OmnhrYELuamXyU+dBEQGwaAEup
 n0Gw==
X-Gm-Message-State: AFuF++kNhOXjz7J1k1TworrUWwhVKp+ue5lLCC4MrpjLCCvIyMBPTmRj
 8og+muY8f+hXrDhszkSVwztVW/Eqh04Q7U9jzYYYYov5YG+pZvTK0JHUDdc6aJhFUIgk92VAiKX
 PoTwa
X-Gm-Gg: AYBFou22mbzn3EMZMVzmaXUhrKH+VGpxWjVLsqZ6U6VOCpRnlFOkB/L3iFKoNEx91EQ
 vnNnr5M7rW/9NshqSQW8OT8ciciuYn8azDqZ7dC6B8o5uCjDsm0ovAY6Vnhf1ubwJqROxVeBEMr
 8Nh43yzh60JiJCBy4mho13SM91spOWgNPje49C5CM7zWcJAcpZKs41pnMVyGGb2jtEWX4IhLxAZ
 P4eCL3Q/B3bMUu9P8niOW08M8jj/6l/3TcAjX0rObCeOpjOl3SF+TaergKtpyPluFmsrdA+woZ8
 NDPsI9t1ttiYLLFeAIcWHtdsCTVWzDMl0Dad7eO/RX69wBs1PXTY0+WNRwCG8vTsqnoaWNksn6Z
 Im05TWp/V38+Z8kRBaoPVfshFNN78h+1d+vXmMLDTmc9p3c71/ReSdeAmIxHnD5VFeF868snkUK
 JTEYdceS9FE1LnrBhZkFnM2JfuWyLILeW+2C4V7KHAxBSrEvpjdDukjEJqWvzXoKy9BdxEidSXe
 bHnbPupjhXeomwIGsu2vBw8nWMef94CXz1uqR4t
X-Received: by 2002:a05:6a00:2e91:b0:881:236b:748e with SMTP id
 d2e1a72fcca58-881236b753bmr551959b3a.0.1790373020951; 
 Fri, 25 Sep 2026 14:50:20 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 14/14] target/arm: Enable FEAT_UINJ for -cpu max-v9
Date: Fri, 25 Sep 2026 14:50:04 -0700
Message-ID: <20260925215004.456336-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 34b63f9867f..3bd5c42a664 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -223,6 +223,7 @@ the following architecture extensions:
 - FEAT_TTL (Translation Table Level)
 - FEAT_TTST (Small translation tables)
 - FEAT_UAO (Unprivileged Access Override control)
+- FEAT_UINJ (Injection of Undefined Instruction exceptions)
 - FEAT_VHE (Virtualization Host Extensions)
 - FEAT_VMID16 (16-bit VMID)
 - FEAT_WFxT (WFE and WFI instructions with timeout)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index affd87a3ae5..aecee55ef77 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1457,6 +1457,7 @@ void aarch64_max_v9_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, UINJ, 1);      /* v9.0: FEAT_UINJ */
     t = FIELD_DP64(t, ID_AA64PFR2, FPMR, 1);      /* v9.2: FEAT_FPMR */
     SET_IDREG(isar, ID_AA64PFR2, t);
 
-- 
2.53.0



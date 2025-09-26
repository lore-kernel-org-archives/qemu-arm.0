Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219C3CAC5B5
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:12:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w4U-0002OM-29; Thu, 25 Sep 2025 20:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w4M-0002Me-KO
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:15 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w3w-0005EC-8j
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:13 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b55197907d1so1207487a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845498; x=1759450298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tB5C290k7yyIo4Y/P1tVjReN0Xb1fSsY20ynZPbwsQ4=;
 b=pXpLe2Cku21sw+ltMRJoAa0OB9N+0Xh1N8kALfkuXYH+9lCLTybd+SUwWuNqKd3mGz
 tanN22EFW8rp6MaZIaJqTocWH8DsngXfbJ87BHn/ODZyDT8Ijpd3NosbeR0AnAU/PVii
 KUGdBiWRMysjepnMAVSVcBdiFE4BfyAbp5pOoPuHpVTIBay2mJl3MQ5DOMjGUSUKv+er
 +WsBpQyiOJgdG25DOwZjjjk/+n5HKijkd9fQ31kDaTEKW+eLT2DXGRi70pK9HCZcY/bx
 2i36StAB7R+v89gd9gdXoUu60vozu94TL4thiMOFa4GAbzhePWTt8rCDv8r8UDg0bGYM
 umzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845498; x=1759450298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tB5C290k7yyIo4Y/P1tVjReN0Xb1fSsY20ynZPbwsQ4=;
 b=DjkNnhakEzht1ErNcHJWAKmbR3Ai2am7XlclC0iDfWgTDR41cf97Q3+mWERrc6t3U/
 67Qx62E5ip1h1oE2VkIA12WXj0dVjgworFBrD1a9RjNivJAoKIWmyDQzjd0clT0Jwa0y
 16Rrkh0ExCo5y2uh1bYYxPBGwr3eis+3gTTTkH14LAo4kjEQcZmOkjSDJ1sVQQ1yNGcH
 d9mXxjAUEbyI1X9YY0hdD+k7EqRIOO1UROd5q9/QgEJZI4BTGZTyaGbJFqxzTVSgP5gi
 xyCN8HBWRvQeppfzqJ6RURKkTPw9Nsffqdx1xBgeldUGrcAmYMZsMP7L2oy/W5rYT8Vp
 bfjg==
X-Gm-Message-State: AOJu0Yz+oufNAYE43fNPf4YnTEFaBNyTs6V/fhCR+PUMifgKo7z0lXkD
 SvQ1u6f1z1a7EXkzHGpMcNqACVo+F0BYfPcOEzWpFWv3OEmlz6FWVfOuF/U1anzTLQsz02JnhKx
 0tk4A
X-Gm-Gg: ASbGncvz3EbXDHmsbLv5OM67+2kES/a6KP+m7sqEd8oNzkm2X+NQ4bHZdo3YOevDIjc
 h5pFwLr1lWE+0Kh8msNaNzIllFVpTWb31yOTLoVnYZhGu5xZgxOc3JL8bQVIF5ZL99oxsgW7x7s
 optIN/Atyg+jnt8Zem5DZM1atVDlaxkUQVyUaZksjLbW0ya9FHzr0gcjRN7aV8a2goShybzGDLs
 hC7zgq9R+ot/4uGx5qCRzzXow8EmcilRHc5nNBqF2Mrsj3cmROpJD9/n5cLWwMvpmKGJZGPy0Aj
 cp1BTqUKCDfNUucZEpvxRdz0u/gEk4Qvni1V5NJeh/O54sCPPO1mYZTzd0VwA05Fyea3FI7BqsO
 loVFOw+sWgRpfpet4O5DszM1CH7a4
X-Google-Smtp-Source: AGHT+IEMYClNsId25RIMqYL8dJaLmsFxmQBLvKlBiMXFDkOm4UDw7pNfploGjEQPtrmngoR+krHppA==
X-Received: by 2002:a17:902:ef03:b0:27e:e55f:c6c3 with SMTP id
 d9443c01a7336-27ee55fc7d3mr27117595ad.55.1758845497878; 
 Thu, 25 Sep 2025 17:11:37 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 03/10] target/arm: Enable FEAT_RME_GPC2 bits in gpccr_write
Date: Thu, 25 Sep 2025 17:11:27 -0700
Message-ID: <20250926001134.295547-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
References: <20250926001134.295547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c44294711f..bfc40c505e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5109,6 +5109,11 @@ static void gpccr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         R_GPCCR_ORGN_MASK | R_GPCCR_SH_MASK | R_GPCCR_PGS_MASK |
         R_GPCCR_GPC_MASK | R_GPCCR_GPCP_MASK;
 
+    if (cpu_isar_feature(aa64_rme_gpc2, env_archcpu(env))) {
+        rw_mask |= R_GPCCR_APPSAA_MASK | R_GPCCR_NSO_MASK |
+                   R_GPCCR_SPAD_MASK | R_GPCCR_NSPAD_MASK | R_GPCCR_RLPAD_MASK;
+    }
+
     env->cp15.gpccr_el3 = (value & rw_mask) | (env->cp15.gpccr_el3 & ~rw_mask);
 }
 
-- 
2.43.0



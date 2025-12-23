Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FD8E6FE51
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Dec 2025 22:27:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYAqY-0005YO-NR; Tue, 23 Dec 2025 17:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqX-0005Y1-Nu
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:13 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vYAqV-0007Nx-Hu
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:27:13 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c2a9a9b43b1so619028a12.2
 for <qemu-arm@nongnu.org>; Tue, 23 Dec 2025 14:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766528830; x=1767133630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOVaD0jg0/GjW5dyxIzZiWG1PvtxfZzn9U04k4yMi6U=;
 b=elyKkhQBOtSZKRqAjl+fy1gqu5qGueVGgOIVE0uJElMztvozW3JBrulSJ31mPsf3rd
 /c40noEzvGJ2o43E0fCcFYwEqU8YxNEPrFNpoPM8uo0xx9TKOSSHU+rWSpjL4ikZixjj
 YToovd8KQ64DvIz5fx0siVrgGuyVimfoyvAPBnXZ7toFKRjy/6PvCxOWHERI4ohhCqor
 I/WCPqt7c3nrBMFmxHsu9md3Yl0V8jRLhFhvvukCW/FFPBE6+C2rnCsqMQAJFhqTAWg6
 xeWXPCGlPlpQcUH2B/KJ45gfi1YIXrReOW0Vjja+tOP3cdW9CQXPFDSA9mEFu+byAiv0
 HjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766528830; x=1767133630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xOVaD0jg0/GjW5dyxIzZiWG1PvtxfZzn9U04k4yMi6U=;
 b=JEN0839QmRcJo7Ll/LghEILE6cMd1hwkY9rClQ2HTIcT+xjS6dkv/yeIiSJ03xtwKg
 E+ZYPwWawsA7MX07CmsF3XV85J6hmOONJyVKtnVn319As6qA62sSdqbCq1ZU7BXSQnmg
 8uA7zJf6+DDRS8npb+WRjVcbAuQ4oAjmXPgHy9yoSnFbZ2OYLIQ/zO5iac0vadwvnrH9
 ypz6C8WTnqJWqKPYoBUMOrBb4tA8a1/tD4Nz9xp4FA/36zfLfLHS+7IdcHsKN7NRhN4I
 VyZnzasrg/nZGlKI7kkUfTyXj6xEliQNfP6dpd+9DIeyLoMq2r0szebRuTYUmQRfIwbe
 BoPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeIXt1hlxXUUho+p7XrhKFaKTE+F6DTrTeU5LwLP/Q6tLpVwIBH7CGZR1Vu+RqKXeOgnBoKuGb2Q==@nongnu.org
X-Gm-Message-State: AOJu0YzXuwWlJaorqOs3vxs303KFVfPr0ISn9hX2FUCk+SK3xohzCPVR
 wOqxE9giveKGF7UwTJg5QKhFY25AiPIVIgFrUVRTO/V2iXLJ4DexE34zfpnh+lpQ8MW1opHCM0W
 A3ShZ
X-Gm-Gg: AY/fxX4H2ZJ+DuhEaMVB1eWhER1xNY8kvCuLWukOvkS/QOQtA8W0pDgOGzB1KK2zoOl
 WQ84dwa0q7lcELn8EPDFwkz+R9LeIPeGh2trgL+M+haOrXu/7JOKbDEdpYdrJYNHGLCPFGRBF31
 NAHbCFKsKubNSLDamjrOU4/AHMOGyj2BNloHl+vwt5dQdNNYDcJA8ym1NVreMlWmW3KBkh1LfCD
 p8g7z9jWoWYVEeZe2HuQpvHYrnvMz4OyBu7uY8aLjnCzaOHVpyHgNoqq0NxSg9F7WokHabTO5eX
 DMUmsovxtk9pSspncG0GKv86DcLcZS/YAoW2RQUAUFvlNYpJU4GqLVQOmeYS/gZ4/gTrU6d1hZ/
 tVbsSE0CcodyoJlC6UdQNy51cgvegO4qYH1dZNaeCvVpySfso7xZQuECipRswYC6izeAy2qUZ1b
 GmEQC/L0epgBH8prkq
X-Google-Smtp-Source: AGHT+IExL8BskEM26aQ8zwIbFwIP4O2H971Oyx6pAs3XvZjPwjLfwQsIp4M5kujgSNzVIVbsOMmvKA==
X-Received: by 2002:a05:7022:eac5:b0:11c:b3ae:c9f1 with SMTP id
 a92af1059eb24-121721ab82fmr17761991c88.1.1766528830024; 
 Tue, 23 Dec 2025 14:27:10 -0800 (PST)
Received: from gromero0.. ([179.93.129.179]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217243bbe3sm62803123c88.0.2025.12.23.14.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:27:09 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 2/4] target/i386: Add a _MAX sentinel to X86ASIdx enum
Date: Tue, 23 Dec 2025 19:26:47 -0300
Message-Id: <20251223222649.187935-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223222649.187935-1-gustavo.romero@linaro.org>
References: <20251223222649.187935-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x536.google.com
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

Add a sentinel to the X86ASIdx enum so it can be used when the total
number of address spaces is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/i386/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index cee1f692a1..ba0c4fa548 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2600,6 +2600,8 @@ void cpu_sync_avx_hflag(CPUX86State *env);
 typedef enum X86ASIdx {
     X86ASIdx_MEM = 0,
     X86ASIdx_SMM = 1,
+    X86ASIdx_MAX = X86ASIdx_SMM
+#define X86ASIdx_COUNT (X86ASIdx_MAX + 1)
 } X86ASIdx;
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1



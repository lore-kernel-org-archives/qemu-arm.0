Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF7EA7955
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:22:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDMD-0004Ov-2S; Thu, 05 Feb 2026 23:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDMB-0004Mr-3Z
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:11 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM8-0003U4-F2
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:10 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8230f8f27cfso779450b3a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351727; x=1770956527; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwB8GQ+jVdd4zLoHgSYFEXrmt93cdA0BGjD0ZGggFvo=;
 b=nWV7jOSdwQ4vRigYhtDfu1g7FjeX5+nQQ65LKc2gyAzPImo5hSTXGWmjLAsQkSICNN
 Oz/Ewr458J9/iC7xTa8NaH22cImeaCZCuM7tVl+pK9u836Is6nanGz3L0404hRNQgQWr
 PLNTuAx0nhddx0t9Zgyh77hqnbyIFFWvymLYYWC+/wUOdDuboso7p3qEHcKo7G+j9EJZ
 2hrYeLgppFQaUE53+kRL2C+n4k3TqyIbHQa1P/vOxtFPTcDUEj8/7edIghOVr56GzDIU
 IXwjYxHl8xjuJGBVqySjQBg0yovog59VD+z8VwwDLSBlf6NlpFo75PV1cmn7e0bZPA+s
 wy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351727; x=1770956527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kwB8GQ+jVdd4zLoHgSYFEXrmt93cdA0BGjD0ZGggFvo=;
 b=egScYsN/uUpv1wqVj59Oj+LicVq8rod0nJ1m8bwVdH7CB+0DOhYwyQYW1U9tA0A6uF
 6atQg/QPswqTzDXU2xyqtjWMM/fB230q0erw21+8hcF9Wb64CP4AaSd6z/HGX3BXTS0C
 XICT37xUQARggXEE4OZHrAbeMpS6b7p0Hx8z5wXNY4awzzHfX8JzFIopCFbmauDHkuNp
 amu5MWm3C7WbQ7vsL5QAc2gnf+5vTuZWaCRVyljlLJxLl8G0CL+XRsdzi7BmCjG1K246
 np0yRNE8lJjg1AYXSS1Ipoq4wkcmvL8ggWJYPLIK7m5fDJNNxWPYU/rZl0sGUyOrNGoq
 1wPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPAfO7R8Zz2oUZUh+srZAoDFA3UjiGx37MGzSdOSDs9mtlxCw4RlUa3zylsSoeLnbtNqGGFILovQ==@nongnu.org
X-Gm-Message-State: AOJu0YxOW+KT0KbbJxRxmtdEB1OC1Fr4sta84W0Ya0SDfgRX+DLrgn/I
 TTpSSJCAM06GvpuE21U6ODNvOsSFaAl5JAZEFhf1j7me7ick0aRiiCidQAk6+dOhpmk=
X-Gm-Gg: AZuq6aJxaZrRi3nhJKxnjxECibSxVujPc1TGmNbdqtAsd9uUyhTm9hNFrG1NuA/JAhd
 GY6RiYOBPA3+Wyza2jW9NVa0rPHECmv8qcWQjY/glInk4jmhvZLz4Kap2027H/QnyAAlXgZD8FL
 xEBRLBaOci4cZxQgI1W0rhd9+tDUDUO1feIv9bqMuGhgaDV3i9ZGFLIBNLvCnKYIHYWNmudjz8A
 NBmRwPZpWTT13li/m9eUajVbo1KpiCLuGhJctJejEylJqQ87NQOGEONsz96Htkp6gt0YmxZliV3
 gwgCUO6+ls5i3Epgequ4EJZul4LX3SIL4FDTjkuNv5SfebTMYm2HiCeEBF3YDl6x+wZTFrbzx2O
 pb/qF8fl2bIOYwGhMy2edJ/UbWZN9ZTYNSQZq1UpP3kgS+TOuV5wcmt2RadkZRDpRgf0zGtUJ/M
 KBT7avNliw+ClqKhRwXTGTrajlSC7JJLXH+E2miJrcC5R2l1e6fgJsniqZ/zDk/TkN
X-Received: by 2002:a05:6a00:94e3:b0:81f:4dc7:d31 with SMTP id
 d2e1a72fcca58-824416f5a0cmr1291419b3a.33.1770351727061; 
 Thu, 05 Feb 2026 20:22:07 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:22:06 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 08/12] target/arm/tcg/psci.c: make compilation unit common
Date: Thu,  5 Feb 2026 20:21:46 -0800
Message-ID: <20260206042150.912578-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

Now that helper.h does not contain TARGET_AARCH64 identifier, we can
move forward with this file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/psci.c      | 2 +-
 target/arm/tcg/meson.build | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index bca6058e41a..56754bde951 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -68,7 +68,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
     CPUARMState *env = &cpu->env;
     uint64_t param[4];
     uint64_t context_id, mpidr;
-    target_ulong entry;
+    uint64_t entry;
     int32_t ret = 0;
     int i;
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 41cf9bad4f1..12f126c02cd 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -49,10 +49,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sve_helper.c',
 ))
 
-arm_system_ss.add(files(
-  'psci.c',
-))
-
 arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
@@ -64,6 +60,7 @@ arm_common_system_ss.add(files(
   'cpregs-at.c',
   'hflags.c',
   'neon_helper.c',
+  'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
   'vfp_helper.c',
-- 
2.47.3



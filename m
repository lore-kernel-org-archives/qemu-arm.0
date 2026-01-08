Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33056D185FE
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr6J-0007Xa-DG; Thu, 08 Jan 2026 09:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5w-000728-Sk
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5t-0000iB-PD
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:35 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso19337855e9.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882871; x=1768487671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tMArHc3fpfAyjhrmZC/JPcKIoMMLYn+9tiOMpEVPwg=;
 b=rsPqBg7z/CpNF7p0A9Fq7t17E39KhznUwiz8jAoiGu0fn38vV2DRtT9UOwyAHhv66g
 OsAt+j9yocxJXgAY5nma9YBEv0jqcNFlzKdvoZbwj10ZDM3RvLEOdPy4LNY8RGJCVk6Z
 9W1F57tl3pKvOvO43+vM1A5CynjliboQoOodlj6gKLsJxya4Y+7/bE4g9hqPJVELkooh
 2axeuO4mWGJt+5jAQkGzeD8zGHh4s4u0YPHYszXFbx2Rty/JtXNi4fe6sqG5vKS6TRVe
 e/IGSIh9iUHjYCiipogHGPXXC8WnVkvZv0V0VOsQYuW/9NmqCtzoSdQFciJz/w4ZDsdf
 mnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882871; x=1768487671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4tMArHc3fpfAyjhrmZC/JPcKIoMMLYn+9tiOMpEVPwg=;
 b=FrXGqLeHV9l9HspmnprqZBfGKVThGfowPTjXYwkDz8NNZwCKeQ2krfvZ8KKRUlK6Kz
 AI8STEEbjwcWgTvXncORQvwUWFCjsw9N6kT0vuxClRQBJa3bvNOjhALNtxdbrffmh8XU
 Nqmd9B9nB+LgyH2pQQGm/QME/gVFhYdqudbw86BIT7DFe3uIguX2ABogN/UY0yri0qXs
 KHfZPxoN4VmkhNxvGnx+fYBEuftLLTiTz1rWkLbiQ2f7YZbNlmL6EBoy/biMwSCRtE9b
 afEH9bDITCtUUr/Wtls1TgxYRcjNy5K97yEw3vxj+qwwlDanYv4V8RxG2q3YZooGxDhQ
 mEwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJYT3Zc31gpPyVTZxVECqj9COIZ0vEwC+VHdRYahvIsnP/VTTa05RnmIcdyjkkVVuj0HiZKMJdrg==@nongnu.org
X-Gm-Message-State: AOJu0YxJjS7kuPKg5GT3U6noQO8egMeM4kTux/3EofLQR4otir9h5fP2
 2VdKAJ3V+Ueh9gD+HIjKynwkxHlGguv6QJVBOLK09Y6ZuOhGNnTLOSz/E9NnlSUzOqo=
X-Gm-Gg: AY/fxX6BkwSYZClh9UPUXnpzxaksNvBrKk0URRaQSZvaHGzgOVrJF0Ksufc0yEsD9gf
 SpgyQ9zU/pWQEtCrBk/fQmrFzxXc1Jkwv4J2FVpA7VZYmCXAdMgctEAWeQ/iPLoVVN5+F9d2WP9
 Ye5HMc1o3JAjOBNS7ReXMOYt9a8sR/eJmOrPKGQzfsJwo+vaj2taRPrk/Nl8sVI7jyy//FyrOhS
 yzddae4BAk/EA6RC0ykyFdykvmP5Bq6B2jZwsADg7EfJVXRJxyQJaXwDeAhyDmFIbP5py5IIIvB
 69UnfnDXMWqalsESrEuOXsXlAN2c+E5B6MPg9RwKcUvEW8Q5B+t4MaBT6VLfJ96UVs06RukbtmR
 u+yk05MlZRVD+xNZ7SIYuRejKjdVH6XCPDXyueB11AVNcJgUaSnhkKzVbL5+mno9pBJ3tg4AfVn
 iB016ukEnMqdk=
X-Google-Smtp-Source: AGHT+IHVOmi2wf66jvsMbt43DmnepHxzKqyfjk3Ie12Q2wlyN40HtlHxf0wwxQZu/Pawgbt1iVWkJg==
X-Received: by 2002:a05:600c:c0ca:b0:47d:87ac:73b8 with SMTP id
 5b1f17b1804b1-47d87ac7a94mr50207325e9.27.1767882870776; 
 Thu, 08 Jan 2026 06:34:30 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6f0e15sm151880935e9.10.2026.01.08.06.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BADCF5FA43;
 Thu, 08 Jan 2026 14:34:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 10/12] target/tricore: move cpu_reset from
 tricore_cpu_realizefn
Date: Thu,  8 Jan 2026 14:34:21 +0000
Message-ID: <20260108143423.1378674-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Implement a proper cpu reset handler for tricore cpus.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/tricore/cpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 04319e107ba..c3dda9f6a54 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -24,6 +24,7 @@
 #include "qemu/error-report.h"
 #include "tcg/debug-assert.h"
 #include "accel/tcg/cpu-ops.h"
+#include "system/reset.h"
 
 static inline void set_feature(CPUTriCoreState *env, int feature)
 {
@@ -81,6 +82,12 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
     cpu_state_reset(cpu_env(cs));
 }
 
+static void tricore_cpu_reset(void *opaque)
+{
+    CPUState *cs = opaque;
+    cpu_reset(cs);
+}
+
 static bool tricore_cpu_has_work(CPUState *cs)
 {
     return true;
@@ -120,8 +127,8 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
     if (tricore_has_feature(env, TRICORE_FEATURE_131)) {
         set_feature(env, TRICORE_FEATURE_13);
     }
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
+    qemu_register_reset(tricore_cpu_reset, cs);
 
     tcc->parent_realize(dev, errp);
 }
-- 
2.47.3



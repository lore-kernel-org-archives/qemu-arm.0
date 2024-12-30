Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp7914002njk;
        Mon, 30 Dec 2024 07:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfCsXNXsmtk6Ors2vLCuueSoquD6bkknJ+J3C7rdiKure1PLFLSJWyS3sWyX9nYL9BgO+MZWTTggaWyA==@linaro.org
X-Google-Smtp-Source: AGHT+IEGgbGJRwvl72UnRNjDB3v2bo/LEbWKyJM17HU/mL1kpMyE57muPzXqshcda4umY1dkc7nF
X-Received: by 2002:a05:6122:4302:b0:515:c769:9d32 with SMTP id 71dfb90a1353d-51b75c6f529mr24999466e0c.4.1735573262436;
        Mon, 30 Dec 2024 07:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735573262; cv=none;
        d=google.com; s=arc-20240605;
        b=aJ4LrbYHyAJGtEnBddprQBg/b9bdfNddy6a+I2LciJzWNm4e1Nm8wC+tiO7rM+AqpB
         MCyQqAYEbi+38RE4THBklqrUQh3NCxVAVdHeqPVeBrKv5Mh1sJRAXwgN4LA+evFF6B8v
         yiB9VHdrKLJPXv1HqZ6ZIVdTETYHSkGsgX/4OrQ1z5KZjh87PPaahd31I9kXQDM7Yp6O
         eBpLFuV7kyH9qkSHwfSHiAY0/mcNuAOnt37scZVfiEEc+zrb1WGLfotzsduEAD+IN+nV
         rFiiBvRBJXgSwLaQvT0kUASyi6IPG3XryvzkRX32owVs5aFnsmhCn2NnwNl//u2ipPDu
         RqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ijdzLVVBAgy15w9QsQgpQp9PmP6CutR0mq7PZBrBXtE=;
        fh=OVoH1D5fguxKzzG62lJ6AGF1SfzwY3u5i9u/qqJnGT4=;
        b=cZPQ0IMQhzG9oxAaNSoiEYmonZWvmgUKiN7EalhLyYm44/kLQY18XqttpombKO40nK
         awcukyP+LqO7DHSyMWGp0VZus93APJMcC5s/rzo0q5dgLEbKOsmt+xbbuOMEB/pf84jn
         Wy3ZYcFZHQZ2EcWjemWYFLSZl9MioYXDZM6URDZBuF+ATt9jTBWNBAr70rd2bgeNnh99
         QexNSbFE6vYbaUzVPYLeNdxWXtSyyePZzuYUNu6mTZahkY6JkCO3FgleGHH8LpmBH6gW
         AOFm03Bxet6CLCR+q966CRrK/Q0dcigZyKvINg4gnmV2XjBNT68H5YCqaula4GeidZBU
         +hWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+FjpBkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51b68bb5268si7636758e0c.92.2024.12.30.07.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2024 07:41:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+FjpBkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tSHrv-0000nU-2i; Mon, 30 Dec 2024 10:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tSHrn-0000kY-Rn
 for qemu-arm@nongnu.org; Mon, 30 Dec 2024 10:39:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tSHrm-0002zh-6x
 for qemu-arm@nongnu.org; Mon, 30 Dec 2024 10:39:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso93007605e9.2
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2024 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735573177; x=1736177977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijdzLVVBAgy15w9QsQgpQp9PmP6CutR0mq7PZBrBXtE=;
 b=H+FjpBkXb2fVVeMGPj8zzIgM3x8fCnOOX6kmJ3Tk1JKpe/AHGAPqCA/qLRWjop6vlx
 3/+rMBH4RSGHwpI/r9xV90d59MtX6kc/wO+A9r74hCjOpBd3Jth8ot5RSr8CAZndU5qI
 wSx+1dx5u9aOhmlPXkeYwJYQGbm9rYGa9olCmu6i1UD7Nkyoy0y06QC0lVrE3+c8jwJP
 ulTaRsuGNnjvxjyeTtGcq4tW8ZhgnZIOY9FL3OlOzGywnAyj/umsgdmhj3+nSVSTtde9
 tEM1NoGAZApDQrn56crng05cXiW3uAOmOZ/rNZBWMt9VQr2x6ToNlQn8mFbqTf7kXxcA
 R1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735573177; x=1736177977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ijdzLVVBAgy15w9QsQgpQp9PmP6CutR0mq7PZBrBXtE=;
 b=uL778ibHe57Yy+5E7e5hYikrDm30YyK7/nGHjq9aXENfRv8X2hBVcP9IBmWZsCZIJF
 OPHOkHQIraFZCLt5chcUDAGOVcq5N7dCTj34oUykYBL1Np3/+P5SV9xFE4qyeksmLzyS
 YdlX7XB/vi+8CPvq9FHFFPRr9SFAn5L/0V0Ye7NoCMnOvOz8MRbEr880gNn5g9LRPW5k
 aLw8bIQhKsZFPWJELGBOlR6fr534KzlWUNTPfHdKgk0aLHDRcE5wxUNuZvxOxz36Gavo
 JgVFT4xBXZnJHcW+ZYF71YJSixKEoYjihph0m6fL+EIloxq4IhQpexRdvfRMhpbEHE4M
 pKtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0wN6atDV0dlueEHz2tVw6BSJc0I3/h/hkXbwffQfIpyhtjLp+k0C0WT2xzwF5PyZI3xlLi6T3QQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+0HUq3Zz5c/R0SjJWmxeqIhzljyL+XgY/ENQ0Nyg/5bjsIlwZ
 y5MVMtusI7Wv8yv22p+WoD4+KWzzhkTXwqJkTPFQdI9IqeNSGWncF1Kx+ki/pgI=
X-Gm-Gg: ASbGnctFbrbIC/WvmpYKQ8iVOPY8BApfkBYTn+VKwIi4t4vj+qzeaOOoG2UhnNhF9jq
 Inyt6yA7A8mxvv0W1lsY8PrZbUHVbfT2ES/E8ovo0BDOzYYcIlczrpbuYhKOHSUKQCoYVzLC8gf
 ElaBCD8eUlTzbzBwXu5Vf2SvmGtdHCdpZJr/I2BMUxQkFxLJpIbpB5UZmF6IIT+Fgk2FK6vuFvB
 zq4+8WT6nI5HtSUTOC+heeFCQ/VC275eTBQ5I4ExC/31fNrVv7ErwnIglmS7PLYN49WIazQkZOi
 UUdeS/vCx9xX3lAPMsxV00FB9uXxRyA=
X-Received: by 2002:a05:600c:4510:b0:434:feb1:adbb with SMTP id
 5b1f17b1804b1-43668b76a08mr332642445e9.31.1735573176720; 
 Mon, 30 Dec 2024 07:39:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436612008casm360093335e9.14.2024.12.30.07.39.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 Dec 2024 07:39:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stafford Horne <shorne@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-ppc@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] accel/tcg: Remove pointless initialization of
 cflags_next_tb
Date: Mon, 30 Dec 2024 16:39:27 +0100
Message-ID: <20241230153929.87137-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230153929.87137-1-philmd@linaro.org>
References: <20241230153929.87137-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: txiaHUS8Gwry

cflags_next_tb is always re-initialized in the CPU Reset()
handler in cpu_common_reset_hold(), no need to initialize
it in cpu_common_initfn().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240427155714.53669-13-philmd@linaro.org>
---
 hw/core/cpu-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 1edc16f65c8..10d34455a85 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -245,7 +245,6 @@ static void cpu_common_initfn(Object *obj)
     /* the default value is changed by qemu_init_vcpu() for system-mode */
     cpu->nr_cores = 1;
     cpu->nr_threads = 1;
-    cpu->cflags_next_tb = -1;
 
     /* allocate storage for thread info, initialise condition variables */
     cpu->thread = g_new0(QemuThread, 1);
-- 
2.47.1


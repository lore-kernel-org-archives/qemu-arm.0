Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778368njj;
        Mon, 5 May 2025 16:20:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVONzhWCw+ak3Y80E20PihdWg/6zv294HD8OAnC4rmQBLkqCIGo7ZVX951FBgeVzh/F80q4Koo4SGfqfA==@linaro.org
X-Received: by 2002:a17:902:ebc3:b0:22d:c605:a30c with SMTP id d9443c01a7336-22e1e8d326cmr134698915ad.11.1746487250161;
        Mon, 05 May 2025 16:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487250; cv=none;
        d=google.com; s=arc-20240605;
        b=R07ifYN4W4EyPStt+uinoiBfneyhZPa+JI7NBKoMbb6SLjm9hE39BzeRJRzmGszQMe
         fFXvaSMDaqwrxmW7iJtyJYRfKgBija0H1gzlv3bk/xIgnDncaUaGEPFGAp5kNDUIpE+w
         jcxGnCPaEHwlyhF9wtki3QmggwAZwnQhBZV47PRDyfPmXlppSdHgEAJv1vAWKWT+aw6z
         eeEB/QDTJnvvQm9M6LHebqBanHUwH+jQV9q5G7ZsuRdH8IhjYcfgVQWoLTcinIq5NQZQ
         BX8zRX4mZ2oeFQcEUbYtn0HazyEHlge8jns4aI3e8l4eqUX92P0vP+KctXZtm4U57YE9
         JEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        fh=J6Wj5/Cn5GtyCQh6yC6mP3MnRSiyScFSDPkuP8bOBRA=;
        b=O/rLo1PpdL7TCzArag+TEn0JRPDH8ZiHnfWcua1+okK9qstFEdrI3UfJ6pZc+b/Nwq
         HeAKqy98HMojvisWKSooiM0nRGri9OyL1NZMIRZ/Y7YBgw4UUBrUb94pyKfHfv30SYfK
         9CBHz4xyaXw27bDgW7AieaCO4HNzio8xdW24eut6SYxc0GQl8Lbqg1H0B5EyftOZk+UA
         nak6ERR6Ow79L582yDPcO5DS585mxNMaPK4+Yi4YO1sPKZg2JxaiXCHeyXWqTjttRIAq
         61wXIWzCE8Kv2Pc+92yO3XkoMFimemu0oI9j8KS8wehZVamOWfobc+R5I9/WiVtEO/Am
         ZwNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SybUfYV7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8300asor63780205ad.15.2025.05.05.16.20.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SybUfYV7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487250; x=1747092050; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=SybUfYV7NIZMBwSYdENHd46PhQfVL4BKTfJ1HPI/e0+QiInMIHgb5msko7UJy51H1o
         OIR+87NvY0uUxQXz8/CaX+0CazNKJ0I0rc5A+Zygrwk9lWp1FA+afOs9afEwnCsbFWh4
         hGNF1swpmRVaFDMVJ4+mGaCEKoNqPtclpPZ4sRgRc52/PH2H3IlIiAS3IEykBCGYRcnw
         pUkNGGvUck53pZGOW7DNhYdszup8/exHt0eevU9iCvIUV/7fmIGR59YYd4Ezz1eeGtKw
         e4OyivCGezdAW1SaZwY/hl/Kz4Lg9B5EJpxjSkLOdzvHhs3E1YH79sEufPME0Xaldqf+
         ybdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487250; x=1747092050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=ULezsxzV/ZSGUoiLCGkSJMmawmd5DQkD2zImcPauAARIoWNUD9CFOcdUxtgZpoqn0K
         ZBVzx5t4DB3w/qAu1LYiBCyldPOE0pJoi1E71yzDJOQhfCGtQ6yDgcy43ZvlSwqSWAcg
         BORkmKFyC566GbMSGAZHOlLDXti3WjkSnj4lucNWb/uE+F0nn6Qe5qJEJYTIqV/qhFyH
         akYWYtpH9VI84OpCWkR+NSvxfASEWZJRItkaSS5MAoKE5XpKiKgKd7v+Sx9u6j3E1fzN
         W13Jrr4r2O4foxjEIf4d9QiXHhZxHCmZGY/SnqAxbDVIxW8peN55wvEEkfVwgO2Y4ni6
         9zyg==
X-Forwarded-Encrypted: i=1; AJvYcCXtDlNUS32w520DM6pdBH4H7HxMrGlgGTYhWdEf3n25318zolxZZmXrV12sdRwvvpKUC7KzQiFaCwITVA==@linaro.org
X-Gm-Message-State: AOJu0Yx4w9hL+j+Ujxe+oVxWcgN1b97gU4OBTB4wA48VpLnM8JDvdr/t
	s/6T7Gw9y4BSJW0/GNFQPHa9r2VbpWGm7n5Ixbc1DOHuEzQktdOjguiOwDuZ2xJDZgO5l3jLMti
	svRZ3bg==
X-Gm-Gg: ASbGncu7TobX4X9r+1X7S1W7ikm5/cIrdxUdO0UG8Pyq0/RJeFZe5GcxmE+qXJeuTX3
	iYpOzM21cXZd/SFstdqYeWWp9vbYVllkVvrrAffIzfh4gZhBqjpD5sTFuFB3uQ112UkYtQYnAi9
	1GMo3Qmhas4Qnu8uGg1rWFtCqFYBdKzyW8+kQmCdB/S5sI4D87eSLm+0kArjTdZkYuMckj/v4CE
	dGxIZeZfUDxDPi68bNcs2I4dVf1e2JDvbP/hfFLLEcZsmlq95E6hP7rNMU3OeovbrHdNdqeUyOk
	bFnVhpRs03UHDj8UaAsfrD+yYVhgZM+uhZK+mde2
X-Google-Smtp-Source: AGHT+IETv5cggtK7g8tYeqBJIFsslayFPnvoIslaVy/AYK+NCIa76R0mH5k9pEhCIh+PzFXX9HxutA==
X-Received: by 2002:a17:903:291:b0:223:2aab:462c with SMTP id d9443c01a7336-22e1e8e6848mr130031445ad.15.1746487249736;
        Mon, 05 May 2025 16:20:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 33/50] target/arm/ptw: compile file once (system)
Date: Mon,  5 May 2025 16:19:58 -0700
Message-ID: <20250505232015.130990-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EZOjsvv3PyBt

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6e0327b6f5b..151184da71c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,7 +17,6 @@ arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
-  'ptw.c',
 ))
 
 arm_user_ss = ss.source_set()
@@ -40,6 +39,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'ptw.c',
   'vfp_fpscr.c',
 ))
 
-- 
2.47.2

Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778302njj;
        Mon, 5 May 2025 16:20:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkXMyKKbX2Yy/CGaVYjVdURHACBjsL2cz0aEZqkDWSLPVHlqkMKLS5ryjAoNusQA7cZgIyta4YWn3iGQ==@linaro.org
X-Received: by 2002:a17:902:daca:b0:223:fbbe:599c with SMTP id d9443c01a7336-22e32866006mr17156805ad.19.1746487243163;
        Mon, 05 May 2025 16:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487243; cv=none;
        d=google.com; s=arc-20240605;
        b=hSpKTCZmt1cluKkWUTzGy2UwultjqLyE/syrfz6mW592gl6T4t6myCqGnr8wQFJ4w6
         /sM0pQzOBXcBHwyet7D7hEv1DbI71Fd7dNbdMDXUVeZBnVY8HjxCzT7IpicZWq8ltA/A
         SZKfX5HIJoDskYY03dsJg1phKaBK3Vr4/8pqBTjIH5ChayKpgxraYPUX79SkEsu5GKNR
         hGgJQUiMauzr9TQe4ejhYSFk3yZsdERFMOakL7th9faZG097lT7q+HauW7nl+akldh6L
         WEu792jYdlRrkI+pd/KgmHbe7i8gzzwiEcyUVo2iHiw7ilE75FK7YVUf2E5lYDmps73F
         +qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        fh=tz/cCVAi8ggkJ7R+V/2nWytbkyj/fjm2vlcnCMqoRYU=;
        b=NYMU3nMh/Uc3bxmO2Ml5QBujYkgI0bvc6bVt+je8rpLlp2ab7sjeTRvNUxEijiQAwd
         JNHAbF/VzxDBzpwCbl5/sTwqswDSgjWGffGUyTQPmsSlqYMBZtJD3nm8k3ZgTXRSwGx3
         j2mzD3lKtHWVoT64fF7EoZLdJSdd9VTOuMGwMUld7CJ+qPP789PchJ/XpHBwqT+gPGmB
         dZJGZ51XxaXpg65ojuUXbaFcdd2fjvHv4+tC8T1UwL4r8shlredgS3Py8uTTx5bGYPC1
         BVavZwwUmlqx8bu5tcR7JX6SPP33Mpup+/tQbKBChDP/2pyeTaLaQZJJjsI0CzSt+Smp
         TApQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuueTEsO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22df56e61dbsor52582865ad.7.2025.05.05.16.20.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuueTEsO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487243; x=1747092043; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=XuueTEsOinLxW99uCS8mlIZ5S8YplLFmddTORFGqDdvN0B5GDW1+JSwL8r3i3Eq/Dh
         LGJ5/hiQEXo11+2Vr76K3JkH2un53OlXGTrSAu0P5McruhP/bcI5UMBbaNZQiCDVKG9A
         ioM/2Iy9zg9WV8WW2RYxcIuSwHQKWrd3S8gIdXKZTBFKSIwjCwrPcbzShEraFvn4p+eT
         dXK3oO6yUCPE7mngHbwoiVYVdGkrWHpqqAphnZ14xIrCdLQ4pBENq9dbwry7TjXILrXd
         5EvLQkI/JCcooTPTcZeqgShM57+LG0m5jMsYeYuVT1XChTklpFwgHuQ4h8WK0tgwdCkI
         /PqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487243; x=1747092043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=ozV0a0VZYZMS+L/ORwgcmDA1egar4zneGrdr/Ywd6t9I4+C+oEux4UeMTCx9JPaq90
         5BMuIe9JJhudEiNtInap5phXGfR5uK4cXB6R38gslP6x/+mBqaF+sGS1nuHs9fjjWK5d
         23ciLfj+IvMFLg4NQEUXZWeAkxJRNFrwxH8sMyq0mOsiAAIX8QsPDreayDdnhUVT7xRM
         M4w8Z5p4yNysbk5W5avS9eDRWjAABiG1jHNkz1Rq5ad+qKC/pVcrAjEgENiBLJdlJVq6
         EcRl5AuV/YaPq025l1AhZmAIXzxBSwsac6AKsW90eYdDllaBAPUZnpSADifv/2KOLwa8
         Ic3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJjxyLMzu5y089yZ/Xhrj7TBEDE2Rgqh/2JCPMWqVqoGjYfNd+Zt9QasDihbomyqD4YIJV+uF9qIxpqQ==@linaro.org
X-Gm-Message-State: AOJu0YzCMboTinDRChm8D9YT4weZ+cOGDj5MM1veSRTcwSMx59fpHB4O
	U5u0E+6rvU7eGn4wdDmeBbqRcVJbN7Lw6fDPiXJBlNnQblv+SJ7h1aw0EoSgpEefAPnHbP2FEW5
	SzaMgFQ==
X-Gm-Gg: ASbGncuVdoIpCktIm5CKY/cfhoUnzWv+U6ynG6D/94xOHMHLpLZoHTIeQRxv4IDXEc/
	dDgt53YJj8UuKD7GGLwkb4N+tnxz0oXFIOc990OTdFfd9vYdOaBBehR0CEBH2kSb8XmCXB1Dwph
	4It4CMUUvg+l+rWg9QbyhRwdQpXXoTiVe0c6zjZ3iRIQlUEdVa+eUna5EtDAhhaOKf0KWXMvpnJ
	cfPdweaBd6Z9sQBWNMArXZ9WZ9Nf3zGR+2K9HYtDOewUm2YkrgDVP2FvsSBwsNt6s00G43wOHUK
	33yMyQ2fdjgWMGskFI1PphVXhNgvdNi424z6jRSI
X-Google-Smtp-Source: AGHT+IH5Uw7g4LrrMeNQldUBujYpCP1weLdfAKQARAwCGSAFxHYIUIR+BJ+7kpydaxwme0QVMesEtg==
X-Received: by 2002:a17:902:f64b:b0:221:8568:c00f with SMTP id d9443c01a7336-22e31e0e9c2mr19933785ad.0.1746487242699;
        Mon, 05 May 2025 16:20:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:42 -0700 (PDT)
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
Subject: [PATCH v6 25/50] target/arm/helper: compile file twice (user, system)
Date: Mon,  5 May 2025 16:19:50 -0700
Message-ID: <20250505232015.130990-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bK1ux/AvphHJ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 48a6bf59353..c8c80c3f969 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'helper.c',
   'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 ))
 arm_user_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -39,6 +39,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 subdir('hvf')
-- 
2.47.2

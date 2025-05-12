Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42809njb;
        Mon, 12 May 2025 11:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqoPJ//DP8V+5Rah6Y0YnUsLtcTk2IvY5IkUBg6Lbas8/MSjxfCwVtcjsuUsK1mUvMcKdEIfOIVuoesg==@linaro.org
X-Received: by 2002:a17:903:2309:b0:22e:7f20:52c6 with SMTP id d9443c01a7336-22fc8b5c3dfmr216253625ad.23.1747073133759;
        Mon, 12 May 2025 11:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073133; cv=none;
        d=google.com; s=arc-20240605;
        b=XIFteUz8HQ/HJyDHJT/3EaPI+X9uEiKb8EBMLVvCVDaTI85KWxXeBUArTYl6xSIGjn
         Y5F5kA/KGmapgMn0kGuv5zkoMmr3rk74NS5G/PYpXHHDpj2vDFGtgbbBdvZucS9oBpA7
         3bnnxhUfdfCtITBbmVfg+1XV343bVL8ekqPbOHoaqnY84PX4hnh/li8JSBcdjuMeMZpj
         sGhU/tzlYx99SrdVvQdSCCngOkuueyUdx2dNrhZNzvFsnmamL4mdKoVOl4UdR96VZHRu
         xF5Mq7pxjztOfAU5PSvmvvUzRnU5kKDrzPPiHrCHmsnkTMjFCbtbZXQWLSzbLT7LvJwn
         dw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        fh=uTxAdNMSYRe4OHYyLBuCIKWgNZ7a+ld4ZZf7KFjirm0=;
        b=Hs1NfvvrVdKVqL0om9PXdcn5Ovve9uG7ZyhWXdJ36Ymbp+Y8fixdGLRVs5vzy9dxmX
         l9P0djTvj9o0w0cJulTpqDl6i1bANZZfFh/2TgoBPNwFpup9Tk5ieyMA/coIfOGi/fwI
         /XfIwN0EV0+mRfXJrI4vyIev5RIGPuXmYdERAIndoYDVZLiaCjb6UaZG4XtoicJiC5kk
         ewWIDQA1PvwiPeUH9ZnTh30lET73w6SMzxVKCVQEhzfMY3Tu7901rUKrA6Ff5jtFNw+G
         Zpi9LDtWKt9xMvqxk47CxG17QDVJC2ODe+A8LBjgrXAr5yei6HpJ/Creeagujvmaj1AQ
         hW2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJBNW+KG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc572f281sor53067475ad.0.2025.05.12.11.05.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJBNW+KG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073133; x=1747677933; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=JJBNW+KG8QTe9ZmqDigT42HfddDG29vs2aeeEHFhFMn79WLQW8EPnyuMt82o7OtTYV
         harlcV0JfRVaCiNrVrZb9avhHM5tmCqHq2i6LC5CJ1g2U55u9kMxQD7eIdVKHWmH12DI
         m3nLH6d4M9+0NhGoBIqzoh4gFSx2fFg3+CQKCcMUJw7igoG57+7vXLyTt3Y0+6MhIf9b
         c+7gRiwW0PSgbLt5bw2QN0mZ7Vsqu3xhu7kvGMtyKI0Sa+copeWlDR7kftG0cbLj+vuy
         MSmJj7TJXA2FhgLVhm6oVb9YOfav/NgunryS+JoTJsfJBBh8MUcw7q4RxvKC1LULIsU1
         JKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073133; x=1747677933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=pgg358ioMeZ5/oyUsr+/MTkiJRbombPIJlTppwhWW4kG3XpZzDBqIaV7e6s3Gr3oA5
         RtOwUxjuP7OUupmmGCnkX0xIgFXRlnfqELUpG3FEMiMLNWjOPAPk6GLmQJrgZa8x17AY
         qfP9QptDrnlasLC9r2qiQu9qcPqfu9DYqiFrjvhRQiR2qqq/55/1PPW3bMp6sVWoNzQ+
         aeqa5XiO9rRKxZD73ZWN7oW2TrSTtfpTrgTFmXekDQAfwM3Ro7WTt9CuZyRN29R/xqZB
         Vp696APKasQnzEGpvBqoXpUYQrSl+3TUMDM/SGAEE3/LkrMMlS2DpezE1NzXC1MwJ+y5
         iRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB6CM6nTDniSC9h8BLjgeJMjQveCYe7Q4CJH5zJpO0ImkPgSOZxXeWPrm8QuT88Jzce2hm92ceLZlJag==@linaro.org
X-Gm-Message-State: AOJu0Ywdv1RezSrySRKfuoVSyQ5ZQrU0446HUmbB9iICljw1rzIP1euJ
	nuGlFhzw8eEyjYXTLfg5Q3mc9Kb61i+xEXk+4KzY36FXJRUPHWBpIumHtFMtTsUtfQIaM3dcly1
	fY7Y=
X-Gm-Gg: ASbGncuzxmmPoVKkljeKNtoweG4YsRUa7//p6v+PKI9h5oqE5gWSLHx+0wk5JgNPLUF
	TeHiA0RpJEzcqLbM7lHY/2NqmSDSzsrWBdcf46phgwT94jpwCqO4lp8JH4FxB5bjf/d2ASif3+9
	4eLNAovfpO5k4sNONuBZvaKluPpRBz6s4wOnKff2u9w0YUygCaHq24aOmySz/da5S98BmwZAulk
	NrFE8x1s2sH1P72Iz2dC1VkbEycx5E0AMos6hIb2yglUE7q93WkYalkKv3rWr1v3FxxjL2e2sYb
	6R9+PheX8ApeP6wz6NKnu1hEOC7bic21J8ldP2XCHLxyI/yYzM0=
X-Google-Smtp-Source: AGHT+IFCFhLetEwRoDr4iaBj8Wtr+2CIPtGJqZ3yk+dZbV8iR0p9eNz87XZ1bPZBW22ghrz1B8yiDg==
X-Received: by 2002:a17:903:1a10:b0:22e:61b2:5eb6 with SMTP id d9443c01a7336-22fc8b3ed12mr214319545ad.15.1747073133322;
        Mon, 12 May 2025 11:05:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 24/48] target/arm/vfp_fpscr: compile file twice (user, system)
Date: Mon, 12 May 2025 11:04:38 -0700
Message-ID: <20250512180502.2395029-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nyW+S7V6k6RG

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c8c80c3f969..06d479570e2 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
 
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_user_ss.add(files(
   'debug_helper.c',
   'helper.c',
+  'vfp_fpscr.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -40,6 +40,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'debug_helper.c',
   'helper.c',
+  'vfp_fpscr.c',
 ))
 
 subdir('hvf')
-- 
2.47.2

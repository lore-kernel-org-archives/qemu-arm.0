Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074402njc;
        Mon, 30 Sep 2024 00:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXw0juwzD3P6HD4evtpjz60Wq1vGVmS56QY1ggsFQ43Gyiyai8DKEXhEKOigI48ukC1uDWM058S248Jhw==@linaro.org
X-Received: by 2002:a05:600c:a02:b0:42c:a802:a8b4 with SMTP id 5b1f17b1804b1-42f582a3034mr81755165e9.0.1727681754903;
        Mon, 30 Sep 2024 00:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681754; cv=none;
        d=google.com; s=arc-20240605;
        b=eYjfdzqYlPuIkHjghrBtoR4uVrXEZgNqxek9SIXAUS4ypx0cxv4xZbrhsNfE2d+fHx
         lbo7QWEBrQ5SzTd9Gh1sx/SKtlIDN8/yKDLufS4KGEqtHXKSD/7hICV3/pvgcLXkAlNt
         SEusbkqV3v6vhSpuNxLDTjKqlUAywOop6696avlmmlLRdlCdRzin11O8XA0GtxgD80DB
         14Fay3p2JSArrHSucGNaU23y04bRRloxLv6XsGMHKhd4NdbmB6s3k9thdEo1ggJjGtEy
         52Nj44mRg39anL8DF9oatC0QOaX8J+iuH3Crh6waMOx6YUqYfmGtWT9hFfzA5FBapmj2
         7Q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PTheN6LnDYE/7gHrhVuAVd6VlwGt/9Pb92gg++hmAlc=;
        fh=39DkC4R+m7YwICL1kOarw6EA11/M+22htUamJyMHHFk=;
        b=bZq/1GSNUr3zHCdzhhD3y7PBa1mp/cCWTbND6t4Kn6+wVVglsiy0ppiyunat2lZQCl
         t00a83hAfeM/Ccnlj9ooVzDycY8MUgur9lVxAKSinYpH9+DTt5JOj/Mo9qkTKM9QCtGQ
         0Duws6flMJ4fzUQ3wFL47fOFuJtRwxIsvovM4xA2Zi5t79DeW3UFZ+NdXm8iO97MuHE1
         9NF5r6kSmg+6mnuS+C+0tOw2mwuhsfHTooSnKH46oXeKm19SO9S0quW4z/ZZV2GgB6DT
         +Va7su6nLyvRKUEp6q+S63jGcPK5h6WVzB6jgnlOE6KDQbynkCtp8tBC6R2eo9xzJB/g
         cFUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pBCYWTda;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f5f313536sor10431385e9.10.2024.09.30.00.35.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pBCYWTda;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681754; x=1728286554; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTheN6LnDYE/7gHrhVuAVd6VlwGt/9Pb92gg++hmAlc=;
        b=pBCYWTda69o/dRdW4aLrJCZ0NABtjLDsY/z3xyUDJDBeaJSO5xrgS4A06M8uaBs0lQ
         rhf3ld5UmY8jN+a1IjEh5VUtmdKMXUWzvtSZO9FEW5QgsjMzN/4cMTB9IeXAEMAoVO7C
         b0mW0MgCvTX4bLMtwVC0H/Ip+M4CyoqO2J3RKQ3yxHFiv4FvpOKztSdLr7YmNCXNNMFV
         ENA2ILSe+f8rzTQjAnCFmn1xKFb+YslvW2DVgZxCKBxzO1/nGCX9ih11YyWg7DDRZsPR
         X7BvHNUYxS1ZzSFsTTjDM/bFSdXJW3hZXSvSlMYivYnE71cH4TUXVLiLyRwEAL64z7Rw
         7/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681754; x=1728286554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTheN6LnDYE/7gHrhVuAVd6VlwGt/9Pb92gg++hmAlc=;
        b=wU3r3reDeekmaqdyMQ7vc3EUXaFigBoCsMaZtvpd/nlmhWJFpX1LkBkuvn/HrK0/ro
         OJ4fDLI/vpU+mb+glg1QYnNCg4z8LMXXADkSRhMMlX2KUKGcR0wZ8etQ0KBFerWriePZ
         DN+1IUtwzTRjkgj6kinUeKzQBaW5WE5YM6q5pt+Bg4fZdP5PTlE2de7SHd29kAb4asdy
         7NzEE/UfT+V1d/JLHvLtPg97Ly7gIMeZ33r8p/mzIubOWrURzLhA0wd49Fyg9XMOFC1r
         xg60+A289ATbV2YZxgm8vGgasQ0hvy/ZIUTWswB76Y5gyN8nZaDGB88B8qxCFMEHIb4i
         mSMw==
X-Forwarded-Encrypted: i=1; AJvYcCVINpwMdMi9d5S8Akzw4GU3Kkg/dyYyAivJ2NAwsNF/xMOAF9CBe+/cTzyGaF1RvFu3YlAu61nxlQ0Msw==@linaro.org
X-Gm-Message-State: AOJu0YyNcorTmmz4JivZnKt//B9dl3psuyBtBSZI9yDK5hsbXte8nOGQ
	rvvDrxSkuFTbNG5wuP1pUBSNVtGJFccPQbD3y9RB36sBr42lf0EcYgtdf5Ng3q4ktg==
X-Google-Smtp-Source: AGHT+IHEXr3aLIhI9JyM7H/sQJVL2/m/6ZOv4bKIitsJ0XgxUNKM1k7r/JUO4/aOFSZATCirYAHKaA==
X-Received: by 2002:a05:600c:3c9e:b0:426:6edf:6597 with SMTP id 5b1f17b1804b1-42f58440cefmr66722995e9.19.1727681754341;
        Mon, 30 Sep 2024 00:35:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ffce1sm142805165e9.28.2024.09.30.00.35.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 07/13] hw/xtensa/xtfpga: Remove TARGET_BIG_ENDIAN #ifdef'ry
Date: Mon, 30 Sep 2024 09:34:44 +0200
Message-ID: <20240930073450.33195-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2fvpqrTpgkWg

Move code evaluation from preprocessor to compiler so
both if() ladders are processed. Mostly style change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/xtfpga.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 955e8867a3..228f00b045 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -415,8 +415,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             }
         }
         if (entry_point != env->pc) {
-            uint8_t boot[] = {
-#if TARGET_BIG_ENDIAN
+            uint8_t boot_be[] = {
                 0x60, 0x00, 0x08,       /* j    1f */
                 0x00,                   /* .literal_position */
                 0x00, 0x00, 0x00, 0x00, /* .literal entry_pc */
@@ -425,7 +424,8 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
                 0x10, 0xff, 0xfe,       /* l32r a0, entry_pc */
                 0x12, 0xff, 0xfe,       /* l32r a2, entry_a2 */
                 0x0a, 0x00, 0x00,       /* jx   a0 */
-#else
+            };
+            uint8_t boot_le[] = {
                 0x06, 0x02, 0x00,       /* j    1f */
                 0x00,                   /* .literal_position */
                 0x00, 0x00, 0x00, 0x00, /* .literal entry_pc */
@@ -434,14 +434,16 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
                 0x01, 0xfe, 0xff,       /* l32r a0, entry_pc */
                 0x21, 0xfe, 0xff,       /* l32r a2, entry_a2 */
                 0xa0, 0x00, 0x00,       /* jx   a0 */
-#endif
             };
+            const size_t boot_sz = TARGET_BIG_ENDIAN ? sizeof(boot_be)
+                                                     : sizeof(boot_le);
+            uint8_t *boot = TARGET_BIG_ENDIAN ? boot_be : boot_le;
             uint32_t entry_pc = tswap32(entry_point);
             uint32_t entry_a2 = tswap32(tagptr);
 
             memcpy(boot + 4, &entry_pc, sizeof(entry_pc));
             memcpy(boot + 8, &entry_a2, sizeof(entry_a2));
-            cpu_physical_memory_write(env->pc, boot, sizeof(boot));
+            cpu_physical_memory_write(env->pc, boot, boot_sz);
         }
     } else {
         if (flash) {
-- 
2.45.2

Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074352njc;
        Mon, 30 Sep 2024 00:35:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXCqWZBAT+H18cGOx2svsKpXyBlcPXKTimaZE17MzXUzguhoG1B6d3pkcd5fPwEtuoAKCAV/Oy++lHuQ==@linaro.org
X-Received: by 2002:adf:fec3:0:b0:37c:ca21:bc5d with SMTP id ffacd0b85a97d-37cd5aa9ab4mr4890586f8f.17.1727681746114;
        Mon, 30 Sep 2024 00:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681746; cv=none;
        d=google.com; s=arc-20240605;
        b=LVgT3EGRKoXnT5qheQ6EYPp8hfi+f3laPCYqJuFq4N/wOJzGwo3HjxZyJgLg7Wtsyw
         dHAJnC4vjfcZ3HOtfr/8YAR+0SHI7JOZHncOfl4AsLmKOa2088ZOrtAJEciQC/DvcnJI
         X+38Xkoy6YSuAeZC6g/narnDJx4i3msrfeZSp3Uud6g9uEaaXu+V9iNLyLqqvrzMmGGe
         WkwhBTj/q7JlCZPtB5jlcZ3AXiUp5ouDzLljmn0YDeJ34o+OerOjZ9QVeKAh193vL9va
         5KK8/e2oPo+N4mBtwDSE8Tm+aBmn/Cbq42Pt1MnEHIdoY5R37HiT0BQNWY4077xETpI7
         tfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ke80z1hBRrKSp3+ZYDR0R7E2LnwfnPIGBFgkH62rA90=;
        fh=omWZffiE7T/Y2YoOeu+IRfiw0HOpu3o6OBZEUsgzKkw=;
        b=li+ubfqGGrDgkyvF8BFQeeU0LjqxkgQzqTOHbZrmUNbH3XbGU9JbDODmwEejIXf9pS
         k4eJSipFbNZ4vu+AQA0vrywhrd/wxDa6Oir9H+4vaePAvakm/9JIO8Oif4SqFEttS3Ct
         Kc/ZwswEH8a2OlQeIedinWhtJnBJcbKV9pkN+mq2sUGZDn5EGjBErZlqGsPF9qsKDene
         xR8Zt2bJVj/gkQt97E/Jj4hkkDoTGJ/3a9Xs0ZB7mP8V/zCRA6/Egxfu6SipN0YKX74u
         MzT6TkS0z6fE9pf3Dj4goPmSVLWnb02JqVUltQrAeVT8Y4PvzXAwYBCrVbEJIrDZcNa/
         Ns/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rh7awBeM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f58219b9esor21079905e9.12.2024.09.30.00.35.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rh7awBeM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681745; x=1728286545; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ke80z1hBRrKSp3+ZYDR0R7E2LnwfnPIGBFgkH62rA90=;
        b=rh7awBeM3LU2f0ksMHbXemtMZ3hygXVAEXmIXcNGfg5iTNG1sk8veL8An26xdv96dg
         1K+foZMF2N8RZgKennZk07E+UZs7d2GZrLScOTIwi34mxTcOVFmlexwRc2ydhpGnV1Sm
         VmcrFxWdFd0FEd9u1j+VG3KF5KbmB+uvAiHX6r27fJsnwp0azD0qeSp9h7GVX0yHSEKg
         WPn6M/RxLUlhFeFeDfWzdqPeQ/FeLjZwUIRts8/R4e+RxU4L5hkaojR+QLNHqVpvI1In
         eyD4US29mKWRyxhx9dJaSxWSb0T1hBLyZLeZ6+Yj85KEoInyMZcvE0MHekEQI30WfIJC
         F3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681745; x=1728286545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ke80z1hBRrKSp3+ZYDR0R7E2LnwfnPIGBFgkH62rA90=;
        b=lj7KBrmyMpbfX07ghLfaRQzWxPi4fsc7P1tNhjW0Yqgb6B8u3QA27Mx860JwxlvGuW
         T6x2wDc+lnVbpDjWV55JxoJIk2pfESrIIkxsS3NFlKNVpycZDx3LwQ3YX6e3EWhJuJdD
         ntix3PankkAG6ngR+DH2+Hb21gfNNYv5q2EvI/3n9tzl7vKuwdcGfDAENGJKpcZwRQKO
         39X3iRMZ6H8FsGfHwsUtjb8wMpgRG/rn2NzgxnA7yS5DwkBLkJ5opJi4NTTlU7UjyHa5
         JwrJ2ivCwk41f+zrE4h8ChHFGNnRC6XNBtshqS8TbfKVPzKpYglj4kpkvdWQ1mAV6WaI
         yA2g==
X-Forwarded-Encrypted: i=1; AJvYcCVuDHNnprJRzTSGzCppZ7Mv2FMSXC5ChrnL5//Tf32VFOgwsuDIrQeZQFEHPBIgGtnz1/YSS7ELdvIuYQ==@linaro.org
X-Gm-Message-State: AOJu0YyW6HXl8p7N++JIvHAmWtp/kpSoxRr8uh4KHbRf4AnfObLGoGC8
	+K/cDdKyi6/zE6ET5TSxDdxNY1NV/zjwW0ZBSbpo0A5ryyvh8TB2/hl6dXU4fWLX6Q==
X-Google-Smtp-Source: AGHT+IEtjPiT/vdhmDvKy5kyiLLj+B2N3ZG+taBN5or5yvAqA67A1U8MeeGcBTLFaojCJ5TT1R8r8Q==
X-Received: by 2002:a05:600c:1d20:b0:42c:b6e4:e3ac with SMTP id 5b1f17b1804b1-42f5840ceedmr70234335e9.3.1727681745463;
        Mon, 30 Sep 2024 00:35:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e9025c517sm147896025e9.0.2024.09.30.00.35.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:45 -0700 (PDT)
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
Subject: [PATCH 06/13] tests/tcg/plugins: Use the ld/st_endian_p() API
Date: Mon, 30 Sep 2024 09:34:43 +0200
Message-ID: <20240930073450.33195-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9VKlFJLA88hd

Refactor to use the recently introduced ld/st_endian_p() API
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/tcg/plugins/mem.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/tests/tcg/plugins/mem.c b/tests/tcg/plugins/mem.c
index b0fa8a9f27..3586d05587 100644
--- a/tests/tcg/plugins/mem.c
+++ b/tests/tcg/plugins/mem.c
@@ -163,13 +163,9 @@ static void update_region_info(uint64_t region, uint64_t offset,
     {
         uint16_t *p = (uint16_t *) &ri->data[offset];
         if (is_store) {
-            if (be) {
-                stw_be_p(p, value.data.u16);
-            } else {
-                stw_le_p(p, value.data.u16);
-            }
+            stw_endian_p(be, p, value.data.u16);
         } else {
-            uint16_t val = be ? lduw_be_p(p) : lduw_le_p(p);
+            uint16_t val = lduw_endian_p(be, p);
             unseen_data = val != value.data.u16;
         }
         break;
@@ -178,13 +174,9 @@ static void update_region_info(uint64_t region, uint64_t offset,
     {
         uint32_t *p = (uint32_t *) &ri->data[offset];
         if (is_store) {
-            if (be) {
-                stl_be_p(p, value.data.u32);
-            } else {
-                stl_le_p(p, value.data.u32);
-            }
+            stl_endian_p(be, p, value.data.u32);
         } else {
-            uint32_t val = be ? ldl_be_p(p) : ldl_le_p(p);
+            uint32_t val = ldl_endian_p(be, p);
             unseen_data = val != value.data.u32;
         }
         break;
@@ -193,13 +185,9 @@ static void update_region_info(uint64_t region, uint64_t offset,
     {
         uint64_t *p = (uint64_t *) &ri->data[offset];
         if (is_store) {
-            if (be) {
-                stq_be_p(p, value.data.u64);
-            } else {
-                stq_le_p(p, value.data.u64);
-            }
+            stq_endian_p(be, p, value.data.u64);
         } else {
-            uint64_t val = be ? ldq_be_p(p) : ldq_le_p(p);
+            uint64_t val = ldq_endian_p(be, p);
             unseen_data = val != value.data.u64;
         }
         break;
-- 
2.45.2

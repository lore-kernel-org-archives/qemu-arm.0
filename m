Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179666njc;
        Wed, 16 Apr 2025 01:17:31 -0700 (PDT)
X-Received: by 2002:a17:902:e542:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22c358c542fmr15491525ad.2.1744791450915;
        Wed, 16 Apr 2025 01:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791450; cv=none;
        d=google.com; s=arc-20240605;
        b=BAmvvcIuBOyz3t0F+ybDb2m7pdUmwj6vEK+Kft9Cu7rdsYqlOM7dvSAuz5NWTVIO/o
         m4FNPYadbjJJ1O7d2VDBAjIlPAbV3QXhFIshNPCqTp/c90da/Sx36cudOOliGhTZId38
         ziCuUZXCjfR4e44RnBryXjM50PbWQ8s4mv8UbokSN2rJK6QXnioLj4yRTi5AtlYYNf9+
         9I5vERXfhK/Db6BnE4LiC7/dGXswdbOOJRbLyzbHa2cFLqajC4BWvldJ4S7LSIkZaUeJ
         46bVeRZLcqdemdLoi8vwJjy1ukI8z/6iaTG+n1RkqRUWASgYKsUPRkZP1YrXyh9xVxSc
         YReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p61XeamrPryy5y8KZD/my/LXyq845Q2ZSQbHbgzzrSA=;
        fh=k3PyV3YIMseYxpCV5ph3FiFpSwjQ35w0Q8XFG8OAsz4=;
        b=Dt2C/MMMFetJVFEXDrVdn+yeSeU7WoTJ1zm6DXqrR3Gpw1bHILwLeGwWmyhMAd1i4N
         hzGbo/lnGOkVDNkxtexfg5DSMuUyx5beRi7tfAqv60yZw90gloJ4vemxY4KGW66UBXUP
         TL88gJ3riOX5mmHr4IlS6EZ3c73UTu3yJELWj7mlrTlLkncHD2cukl0eItXjk0aaWKUJ
         aZRFEKa2A0AhXuAKJjJKHjuuC6SpFyn72PEHr5f1+Od0QqRy6UCdEkrKKCP+qJURAUyG
         IiCYMqiQsd+k6o7CNTF0s87GBkvMctaq5vZ+xg9lsd6esDZMXY/reHRWjEuvb+Ypt5LF
         DLzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=klQJOPZx;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1d44a06sor13754229b3a.2.2025.04.16.01.17.30
        (Google Transport Security);
        Wed, 16 Apr 2025 01:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=klQJOPZx;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791450; x=1745396250; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p61XeamrPryy5y8KZD/my/LXyq845Q2ZSQbHbgzzrSA=;
        b=klQJOPZxLlQYCmrdt0Eqd2yrh3AShnhZJgqYH0k1AkiHJSiNCslAexbdH25IXAPlqO
         gThZfFq4xMjxj0Y7l/Pf4Wa4OGc9LZqRlEuFLZplcIet1iLgM4HNBokOVqehtTVaqSKG
         l1wxbS+Zzm/Q0fD7+hrkAkWdHR3Q3OBiPb1o0LrKxdinVe3qS75fBZXoJYFGzIuYzLJ/
         YyzFzsHRvBdilqTGa+YYdGdcJ2Aie2ghkRNOwNxj6lEyGr7W2k17L9SlSKR82+GkzVgj
         glAcZ496t7J8YW3pb7WOT58hbAOU+Di8aszYiVNESS9vuI6AS/B7SMFWPMpzqjWWice6
         /6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791450; x=1745396250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p61XeamrPryy5y8KZD/my/LXyq845Q2ZSQbHbgzzrSA=;
        b=r0igJMsooQ/XxjqUfz9/aZWQXsBpaWZd4+xraMpwiqOGZVF1gD8Amb6LlO2GywRQb7
         +NISmCLDXtjiu6+Zd2mBKlHQyU7etqkSBsJqep3u4sOFvme159G3TN4dOvUlJueO3fI0
         IuNBDlkCipdN+Hu7Inq56jZu21hCtVyQcP7rfA0HmXIE/h1idEELV8mIEpxaUI7bd6RG
         081XdIYslUnMfK6nLS/IK/qi8EqxghV/UbDlVVmXEucK7ueFdjN4XamWa7zbeC4RXNu5
         PNV+fZ9wE63nTEcaXtIUrP5Hkh51t2Gc24kgZZJ+5C0ER61hzPqRaWmtfuLMwZAt6B+w
         JzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNeA9qgO6ab0VNxnCVj3AHKhtdCVtjeFlWLoV1fHJpmpmzQL4h4/HuQlYYEVkgX5NdzcS2yukY@linaro.org, AJvYcCVgCylTIzl4RbuUDK13DWiZncJTmDXaQUpJmdZPH7tTD7NveiFKq9nMslsX8EV+hLx4cNH3SHJXDK9U4K13jQkjBwo=@linaro.org, AJvYcCWS2zvgePzWVOM49gQViuzJKEquHKE62TLvlXAkVlRkPLG++ke4ht9VZz3zhzluGdHcFB+C4CEXcWwUx0rA@linaro.org, AJvYcCXFt8bos8QqMcKiQ2K8WaioRSd9cINshibJsRFDmxtspKoZUxyw4Io6scRDfieZ835gHD1VRoWYbO1NLjiSCdlW7A==@linaro.org
X-Gm-Message-State: AOJu0YxzshbWS0EV8e6QPwNPSdQH4AmHB2J/PTSj2eUOuP3WN6CUzn2b
	5M//wdwVsWojk3sYZZdU1ZaaOgS2Cq9SxwC/7tFPvgg8/z1NllvU
X-Gm-Gg: ASbGncsqgTnCp8jzzZKD7jQEplplSfZBB3PoxSwhNzJX1SYfwhp0f4e0ERE85nhLpP3
	tytrDwfZqySgRwq1S8xT/Cg3WSWkkhK1P8zhGeQKlGsL1ETq1D468MAnxuZeicOobeijCm3Yxlm
	GYjH7waa1WwL6Bs/tzWwdayYid++XTqwpAGFbpu+KLvALbvTxrCceKcd/lVIjEHvmzQkBqCsEl2
	Wnv3MjB+pZY3tbmj/Inkmg8hGL2prPQhaL1u250mraRogPVhmga9VS7k9/cYzRXe5H7McdvVF6X
	y+hbUNqkrhjw71i2x2P6TinNTRGzGMYApVQmY25i9dpr6uxOaBUZCBMAy7hOkh9Mw5J9
X-Google-Smtp-Source: AGHT+IG+HhXY9MccZflP2IGJae4uZu0y23mzWOU0azhXj3wrV5kpmm22SzyuVnini2IXqkIH9KI0Sg==
X-Received: by 2002:a05:6a00:2e84:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73c26735170mr1091929b3a.11.1744791450203;
        Wed, 16 Apr 2025 01:17:30 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:17:29 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 19/19] MAINTAINERS: Update MAINTAINERS file for wasm-related files
Date: Wed, 16 Apr 2025 17:14:24 +0900
Message-Id: <185cfff812b952abb24e25dfcc8bab7c65da6214.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gepHt3rA66yQ

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b5578f8..74a102c594 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3903,6 +3903,16 @@ F: tcg/tci/
 F: tcg/tci.c
 F: disas/tci.c
 
+WebAssembly TCG target
+M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
+S: Maintained
+F: configs/meson/emscripten.txt
+F: tests/docker/dockerfiles/emsdk-wasm32-cross.docker
+F: util/coroutine-wasm.c
+F: os-wasm.c
+F: include/system/os-wasm.h
+F: stubs/emscripten.c
+
 Block drivers
 -------------
 VMDK
-- 
2.25.1

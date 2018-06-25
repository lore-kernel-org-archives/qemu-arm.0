Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b190-v6sm11643409wma.24.2018.06.25.09.00.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jun 2018 09:00:11 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 850133E08C1;
	Mon, 25 Jun 2018 17:00:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 4/5] linux-user/elfload: enable HWCAP_CPUID for AArch64
Date: Mon, 25 Jun 2018 17:00:08 +0100
Message-Id: <20180625160009.17437-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180625160009.17437-1-alex.bennee@linaro.org>
References: <20180625160009.17437-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UYzdVO62TVCQ

Userspace programs should (in theory) query the ELF HWCAP before
probing these registers. Now we have implemented them all make it
public.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 13bc78d0c8..76d7674649 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -566,6 +566,7 @@ static uint32_t get_elf_hwcap(void)
 
     hwcaps |= ARM_HWCAP_A64_FP;
     hwcaps |= ARM_HWCAP_A64_ASIMD;
+    hwcaps |= ARM_HWCAP_A64_CPUID;
 
     /* probe for the extra features */
 #define GET_FEATURE(feat, hwcap) \
-- 
2.17.1

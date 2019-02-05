Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v22sm4901940wml.37.2019.02.05.11.02.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 11:02:28 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B935C1FF85;
	Tue,  5 Feb 2019 19:02:24 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v2 5/6] linux-user/elfload: enable HWCAP_CPUID for AArch64
Date: Tue,  5 Feb 2019 19:02:23 +0000
Message-Id: <20190205190224.2198-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205190224.2198-1-alex.bennee@linaro.org>
References: <20190205190224.2198-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y3DwAnLuhbN3

Userspace programs should (in theory) query the ELF HWCAP before
probing these registers. Now we have implemented them all make it
public.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 775a36ccdd..3a50d587ff 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -580,6 +580,7 @@ static uint32_t get_elf_hwcap(void)
 
     hwcaps |= ARM_HWCAP_A64_FP;
     hwcaps |= ARM_HWCAP_A64_ASIMD;
+    hwcaps |= ARM_HWCAP_A64_CPUID;
 
     /* probe for the extra features */
 #define GET_FEATURE_ID(feat, hwcap) \
-- 
2.20.1

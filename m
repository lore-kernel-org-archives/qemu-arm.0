Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b0032f9688ea48sm11516899wrx.10.2023.11.15.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:55:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 636BD5F7B7;
	Wed, 15 Nov 2023 20:55:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 07/10] hw/core: skip loading debug on all failures
Date: Wed, 15 Nov 2023 20:55:39 +0000
Message-Id: <20231115205542.3092038-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115205542.3092038-1-alex.bennee@linaro.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JqbPx9n++Z3j

ELF_LOAD_FAILED is one of many negative return codes we can have. Lets
treat any positive size_t as a success for loading.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 3c79283777..e7a9b3775b 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -505,7 +505,7 @@ ssize_t load_elf_ram_sym(const char *filename,
                          clear_lsb, data_swab, as, load_rom, sym_cb);
     }
 
-    if (ret != ELF_LOAD_FAILED) {
+    if (ret > 0) {
         debuginfo_report_elf(filename, fd, 0);
     }
 
-- 
2.39.2

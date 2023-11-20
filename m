Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e29-20020adfa45d000000b0033169451a84sm11501414wra.29.2023.11.20.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CD30865777;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 09/14] hw/core: skip loading debug on all failures
Date: Mon, 20 Nov 2023 15:08:28 +0000
Message-Id: <20231120150833.2552739-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ejXfmANT+mkM

ELF_LOAD_FAILED is one of many negative return codes we can have. Lets
treat any positive size_t as a success for loading.

Message-Id: <20231115205542.3092038-8-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

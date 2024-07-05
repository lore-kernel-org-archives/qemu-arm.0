Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cab4sm676033266b.144.2024.07.05.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 12DF15F931;
	Fri,  5 Jul 2024 09:40:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 04/40] hw/core: ensure kernel_end never gets used undefined
Date: Fri,  5 Jul 2024 09:40:11 +0100
Message-Id: <20240705084047.857176-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AwJjD6DUa/rX

Really the problem here is the return values of fit_load_[kernel|fdt]() are a
little all over the place. However we don't want to somehow get
through not having set kernel_end and having it just be random unused
data.

The compiler complained on an --enable-gcov build:

  In file included from ../../hw/core/loader-fit.c:20:
  /home/alex/lsrc/qemu.git/include/qemu/osdep.h: In function ‘load_fit’:
  /home/alex/lsrc/qemu.git/include/qemu/osdep.h:486:45: error: ‘kernel_end’ may be used uninitialized [-Werror=maybe-uninitialized]
    486 | #define ROUND_UP(n, d) ROUND_DOWN((n) + (d) - 1, (d))
        |                                             ^
  ../../hw/core/loader-fit.c:270:12: note: ‘kernel_end’ was declared here
    270 |     hwaddr kernel_end;
        |            ^~~~~~~~~~

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/core/loader-fit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
index 9f20007dbb..7ccc9d5fbc 100644
--- a/hw/core/loader-fit.c
+++ b/hw/core/loader-fit.c
@@ -267,7 +267,7 @@ int load_fit(const struct fit_loader *ldr, const char *filename, void *opaque)
     const char *def_cfg_name;
     char path[FIT_LOADER_MAX_PATH];
     int itb_size, configs, cfg_off, off;
-    hwaddr kernel_end;
+    hwaddr kernel_end = 0;
     int ret;
 
     itb = load_device_tree(filename, &itb_size);
-- 
2.39.2

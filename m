Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d13-20020a5d4f8d000000b003063db8f45bsm10820461wru.23.2023.06.27.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 09:09:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A2E891FFC3;
	Tue, 27 Jun 2023 17:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bandan Das <bsd@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 07/36] scripts/oss-fuzz: add a suppression for keymap
Date: Tue, 27 Jun 2023 17:09:14 +0100
Message-Id: <20230627160943.2956928-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627160943.2956928-1-alex.bennee@linaro.org>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n456GUAwAYGd

When updating to the latest fedora the santizer found more leaks
inside xkbmap:

  FAILED: pc-bios/keymaps/ar
  /builds/stsquad/qemu/build-oss-fuzz/qemu-keymap -f pc-bios/keymaps/ar -l ara
  =================================================================
  ==3604==ERROR: LeakSanitizer: detected memory leaks
  Direct leak of 1424 byte(s) in 1 object(s) allocated from:
      #0 0x56316418ebec in __interceptor_calloc (/builds/stsquad/qemu/build-oss-fuzz/qemu-keymap+0x127bec) (BuildId: a2ad9da3190962acaa010fa8f44a9269f9081e1c)
      #1 0x7f60d4dc067e  (/lib64/libxkbcommon.so.0+0x1c67e) (BuildId: b243a34e4e58e6a30b93771c256268b114d34b80)
      #2 0x7f60d4dc2137 in xkb_keymap_new_from_names (/lib64/libxkbcommon.so.0+0x1e137) (BuildId: b243a34e4e58e6a30b93771c256268b114d34b80)
      #3 0x5631641ca50f in main /builds/stsquad/qemu/build-oss-fuzz/../qemu-keymap.c:215:11

and many more. As we can't do anything about the library add a
suppression to keep the CI going with what its meant to be doing.

Message-Id: <20230623122100.1640995-9-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/oss-fuzz/lsan_suppressions.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oss-fuzz/lsan_suppressions.txt b/scripts/oss-fuzz/lsan_suppressions.txt
index 02ec0a6ed5..7d90c280d0 100644
--- a/scripts/oss-fuzz/lsan_suppressions.txt
+++ b/scripts/oss-fuzz/lsan_suppressions.txt
@@ -1,2 +1,5 @@
 # The tcmalloc on Fedora37 confuses things
 leak:/lib64/libtcmalloc_minimal.so.4
+
+# libxkbcommon also leaks in qemu-keymap
+leak:/lib64/libxkbcommon.so.0
-- 
2.39.2

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f9c8c6bf53sm2239319wmj.13.2023.06.23.05.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 61CCF1FFC3;
	Fri, 23 Jun 2023 13:21:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Leonardo Bras <leobras@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/26] scripts/oss-fuzz: add a suppression for keymap
Date: Fri, 23 Jun 2023 13:20:42 +0100
Message-Id: <20230623122100.1640995-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iExF33gJyTRo

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

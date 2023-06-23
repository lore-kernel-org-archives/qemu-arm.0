Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d58e4000000b00311299df211sm9485684wrd.77.2023.06.23.05.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:21:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AEA7D1FFC4;
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
Subject: [PATCH 11/26] Makefile: add lcitool-refresh to UNCHECKED_GOALS
Date: Fri, 23 Jun 2023 13:20:45 +0100
Message-Id: <20230623122100.1640995-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RGRPiAUVWuJ0

This is yet another make target you usually run in the top level of
the source directory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b22bf6fba1..56f165c0b2 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@ quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 
 UNCHECKED_GOALS := TAGS gtags cscope ctags dist \
     help check-help print-% \
-    docker docker-% vm-help vm-test vm-build-%
+    docker docker-% lcitool-refresh vm-help vm-test vm-build-%
 
 all:
 .PHONY: all clean distclean recurse-all dist msi FORCE
-- 
2.39.2

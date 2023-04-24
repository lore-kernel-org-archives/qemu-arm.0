Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d5643000000b002e4cd2ec5c7sm10337523wrw.86.2023.04.24.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 543721FFC6;
	Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 16/18] docs/devel: make a statement about includes
Date: Mon, 24 Apr 2023 10:22:47 +0100
Message-Id: <20230424092249.58552-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5ZrNuaVGwLgC

While not explicitly disallowing header macro abuse (because that
would make us hypocrites) lets at least address some things to think
about.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230420155723.1711048-8-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 68aa776930..5bc6f2f095 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -300,6 +300,20 @@ putting those into qemu/typedefs.h instead of including the header.
 
 Cyclic inclusion is forbidden.
 
+Generative Includes
+-------------------
+
+QEMU makes fairly extensive use of the macro pre-processor to
+instantiate multiple similar functions. While such abuse of the macro
+processor isn't discouraged it can make debugging and code navigation
+harder. You should consider carefully if the same effect can be
+achieved by making it easy for the compiler to constant fold or using
+python scripting to generate grep friendly code.
+
+If you do use template header files they should be named with the
+``.c.inc`` or ``.h.inc`` suffix to make it clear they are being
+included for expansion.
+
 C types
 =======
 
-- 
2.39.2

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s16-20020a05600c045000b003fee0741b8csm3070971wmb.23.2023.08.24.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 09:39:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A942F1FFBF;
	Thu, 24 Aug 2023 17:39:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 04/12] docs/style: permit inline loop variables
Date: Thu, 24 Aug 2023 17:39:02 +0100
Message-Id: <20230824163910.1737079-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824163910.1737079-1-alex.bennee@linaro.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 18GOSzYbJ1Q2

I've already wasted enough of my time debugging aliased variables in
deeply nested loops. While not scattering variable declarations around
is a good aim I think we can make an exception for stuff used inside a
loop.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230822155004.1158931-1-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 3cfcdeb9cd..2f68b50079 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -204,7 +204,14 @@ Declarations
 
 Mixed declarations (interleaving statements and declarations within
 blocks) are generally not allowed; declarations should be at the beginning
-of blocks.
+of blocks. To avoid accidental re-use it is permissible to declare
+loop variables inside for loops:
+
+.. code-block:: c
+
+    for (int i = 0; i < ARRAY_SIZE(thing); i++) {
+        /* do something loopy */
+    }
 
 Every now and then, an exception is made for declarations inside a
 #ifdef or #ifndef block: if the code looks nicer, such declarations can
-- 
2.39.2

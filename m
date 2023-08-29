Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l4-20020adff484000000b003197a4b0f68sm14357588wro.7.2023.08.29.09.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 09:15:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A70E91FFBF;
	Tue, 29 Aug 2023 17:15:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Juan Quintela <quintela@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v3 04/12] docs/style: permit inline loop variables
Date: Tue, 29 Aug 2023 17:15:20 +0100
Message-Id: <20230829161528.2707696-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829161528.2707696-1-alex.bennee@linaro.org>
References: <20230829161528.2707696-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3Hi+nC3UM/tg

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

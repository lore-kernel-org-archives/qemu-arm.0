Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c6179sm63871185e9.22.2025.01.16.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:12:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 36F35608DD;
	Thu, 16 Jan 2025 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 28/37] tests/qtest: fix some copy and paste errors in kdoc
Date: Thu, 16 Jan 2025 16:02:57 +0000
Message-Id: <20250116160306.1709518-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EQxe7bcfg/rP

A number of copy and paste kdoc comments are referring to the wrong
definition. Fix those cases.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/qtest/libqos/qgraph.h | 2 +-
 tests/qtest/libqtest.h      | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 1b5de02e7b..81fbfdd0e2 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -355,7 +355,7 @@ void qos_object_start_hw(QOSGraphObject *obj);
 QOSGraphObject *qos_machine_new(QOSGraphNode *node, QTestState *qts);
 
 /**
- * qos_machine_new(): instantiate a new driver node
+ * qos_driver_new(): instantiate a new driver node
  * @node: A driver node to be instantiated
  * @parent: A #QOSGraphObject to be consumed by the new driver node
  * @alloc: An allocator to be used by the new driver node.
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index f23d80e9e5..fa08c7eca5 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -365,7 +365,7 @@ QDict *qtest_qmp_event_ref(QTestState *s, const char *event);
 char *qtest_hmp(QTestState *s, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
 /**
- * qtest_hmpv:
+ * qtest_vhmp:
  * @s: #QTestState instance to operate on.
  * @fmt: HMP command to send to QEMU, formats arguments like vsprintf().
  * @ap: HMP command arguments
@@ -904,7 +904,7 @@ void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
 
 #ifndef _WIN32
 /**
- * qtest_qmp_fd_assert_success_ref:
+ * qtest_qmp_fds_assert_success_ref:
  * @qts: QTestState instance to operate on
  * @fds: the file descriptors to send
  * @nfds: number of @fds to send
@@ -921,7 +921,7 @@ QDict *qtest_qmp_fds_assert_success_ref(QTestState *qts, int *fds, size_t nfds,
     G_GNUC_PRINTF(4, 5);
 
 /**
- * qtest_qmp_fd_assert_success:
+ * qtest_qmp_fds_assert_success:
  * @qts: QTestState instance to operate on
  * @fds: the file descriptors to send
  * @nfds: number of @fds to send
-- 
2.39.5

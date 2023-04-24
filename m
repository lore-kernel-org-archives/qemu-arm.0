Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d5043000000b002c70ce264bfsm10327237wrt.76.2023.04.24.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 87A481FFC8;
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
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 18/18] docs/style: call out the use of GUARD macros
Date: Mon, 24 Apr 2023 10:22:49 +0100
Message-Id: <20230424092249.58552-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hclPolxXIl9U

There use makes our code safer so we should mention them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230420155723.1711048-10-alex.bennee@linaro.org>

---
vppr:
  - show example of what QEMU_LOCK_GUARD makes easier (although I
  didn't repeat for the WITH_ form)
---
 docs/devel/style.rst | 54 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index e9fce0fc69..b97e5111fc 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -668,6 +668,60 @@ Note that there is no need to provide typedefs for QOM structures
 since these are generated automatically by the QOM declaration macros.
 See :ref:`qom` for more details.
 
+QEMU GUARD macros
+=================
+
+QEMU provides a number of ``_GUARD`` macros intended to make the
+handling of multiple exit paths easier. For example using
+``QEMU_LOCK_GUARD`` to take a lock will ensure the lock is released on
+exit from the function.
+
+.. code-block:: c
+
+    static int my_critical_function(SomeState *s, void *data)
+    {
+        QEMU_LOCK_GUARD(&s->lock);
+        do_thing1(data);
+        if (check_state2(data)) {
+            return -1;
+        }
+        do_thing3(data);
+        return 0;
+    }
+
+will ensure s->lock is released however the function is exited. The
+equivalent code without _GUARD macro makes us to carefully put
+qemu_mutex_unlock() on all exit points:
+
+.. code-block:: c
+
+    static int my_critical_function(SomeState *s, void *data)
+    {
+        qemu_mutex_lock(&s->lock);
+        do_thing1(data);
+        if (check_state2(data)) {
+            qemu_mutex_unlock(&s->lock);
+            return -1;
+        }
+        do_thing3(data);
+        qemu_mutex_unlock(&s->lock);
+        return 0;
+    }
+
+There are often ``WITH_`` forms of macros which more easily wrap
+around a block inside a function.
+
+.. code-block:: c
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
+            err = do_the_thing(kid->child);
+            if (err < 0) {
+                return err;
+            }
+        }
+    }
+
 Error handling and reporting
 ============================
 
-- 
2.39.2

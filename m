Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w6-20020adfee46000000b002f0442a2d3asm10372906wro.48.2023.04.24.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6F1B41FFC7;
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
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 17/18] docs/devel: mention the spacing requirement for QOM
Date: Mon, 24 Apr 2023 10:22:48 +0100
Message-Id: <20230424092249.58552-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Xiyb4rJpBbGL

We have a more complete document on QOM but we should at least mention
the style requirements in the style guide.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230420155723.1711048-9-alex.bennee@linaro.org>

---
vppr:
  - use Mark's formulation, briefly mention property separation.
---
 docs/devel/qom.rst   |  2 ++
 docs/devel/style.rst | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 3e34b07c98..c9237950d0 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -1,3 +1,5 @@
+.. _qom:
+
 ===========================
 The QEMU Object Model (QOM)
 ===========================
diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 5bc6f2f095..e9fce0fc69 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -628,6 +628,46 @@ are still some caveats to beware of
 QEMU Specific Idioms
 ********************
 
+QEMU Object Model Declarations
+==============================
+
+QEMU Object Model Declarations
+==============================
+
+The QEMU Object Model (QOM) provides a framework for handling objects
+in the base C language. The first declaration of a storage or class
+structure should always be the parent and leave a visual space between
+that declaration and the new code. It is also useful to separate
+backing for properties (options driven by the user) and internal state
+to make navigation easier.
+
+For a storage structure the first declaration should always be called
+"parent_obj" and for a class structure the first member should always
+be called "parent_class" as below:
+
+.. code-block:: c
+
+    struct MyDeviceState {
+        DeviceState parent_obj;
+
+        /* Properties */
+        int prop_a;
+        char *prop_b;
+        /* Other stuff */
+        int internal_state;
+    };
+
+    struct MyDeviceClass {
+        DeviceClass parent_class;
+
+        void (*new_fn1)(void);
+        bool (*new_fn2)(CPUState *);
+    };
+
+Note that there is no need to provide typedefs for QOM structures
+since these are generated automatically by the QOM declaration macros.
+See :ref:`qom` for more details.
+
 Error handling and reporting
 ============================
 
-- 
2.39.2

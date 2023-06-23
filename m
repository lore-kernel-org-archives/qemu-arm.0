Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b003f9bd9e3226sm2261931wmi.7.2023.06.23.05.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:30:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A2DC31FFCF;
	Fri, 23 Jun 2023 13:21:03 +0100 (BST)
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
Subject: [PATCH 26/26] docs/devel: introduce some key concepts for QOM development
Date: Fri, 23 Jun 2023 13:21:00 +0100
Message-Id: <20230623122100.1640995-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623122100.1640995-1-alex.bennee@linaro.org>
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SEHeDw6q1DVe

Using QOM correctly is increasingly important to maintaining a modern
code base. However the current documentation skips some important
concepts before launching into a simple example. Lets:

  - at least mention properties
  - mention TYPE_OBJECT and TYPE_DEVICE
  - talk about why we have realize/unrealize
  - mention the QOM tree

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230619171437.357374-6-alex.bennee@linaro.org>
---
 docs/devel/qom.rst | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index c342ce18e3..0113afb6e6 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -13,6 +13,53 @@ features:
 - System for dynamically registering types
 - Support for single-inheritance of types
 - Multiple inheritance of stateless interfaces
+- Mapping internal members to publicly exposed properties
+
+The root object class is TYPE_OBJECT which provides for the basic
+object methods.
+
+The Device Class
+================
+
+The TYPE_DEVICE class is the parent class for all modern devices
+implemented in QEMU and adds some specific methods to handle QEMU
+device model. This includes managing the lifetime of devices from
+creation through to when they become visible to the guest and
+eventually unrealized.
+
+Device Life-cycle
+-----------------
+
+As class initialisation cannot fail devices have an two additional
+methods to handle the creation of dynamic devices. The ``realize``
+function is called with ``Error **`` pointer which should be set if
+the device cannot complete its setup. Otherwise on successful
+completion of the ``realize`` method the device object is added to the
+QOM tree and made visible to the guest.
+
+The reverse function is ``unrealize`` and should be were clean-up
+code lives to tidy up after the system is done with the device.
+
+All devices can be instantiated by C code, however only some can
+created dynamically via the command line or monitor. Likewise only
+some can be unplugged after creation and need an explicit
+``unrealize`` implementation. This is determined by the
+``user_creatable`` and ``hotpluggable`` variables in the root
+``DeviceClass`` structure.
+
+The QOM tree
+------------
+
+The QOM tree is a composition tree which represents all of the objects
+that make up a QEMU "machine". You can view this tree by running
+``info qom-tree`` in the :ref:`QEMU monitor`. It will contain both
+objects created by the machine itself as well those created due to
+user configuration.
+
+Creating a minimal device
+=========================
+
+A simple minimal device implementation may look something like bellow:
 
 .. code-block:: c
    :caption: Creating a minimal type
-- 
2.39.2

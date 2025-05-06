Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895095d7sm697433266b.151.2025.05.06.05.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 598C25FADE;
	Tue,  6 May 2025 13:57:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 13/14] docs: Create a uniquelabel Sphinx extension
Date: Tue,  6 May 2025 13:57:14 +0100
Message-Id: <20250506125715.232872-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J6AE5TZXZPxo

From: Peter Maydell <peter.maydell@linaro.org>

Sphinx requires that labels within documents are unique across the
whole manual.  This is because the "create a hyperlink" directive
specifies only the name of the label, not a filename+label.  Some
Sphinx versions will warn about duplicate labels, but even if there
is no warning there is still an ambiguity and no guarantee that the
hyperlink will be created to the right target.

For QEMU this is awkward, because we have various .rst.inc fragments
which we include into multiple .rst files.  If you define a label in
the .rst.inc file then it will be a duplicate label.  We have mostly
worked around this by not putting labels into those .rst.inc files,
or by adding "insert a label" functionality into the hxtool extension
(see commit 1eeb432a953b0 "doc/sphinx/hxtool.py: add optional label
argument to SRST directive").

This Sphinx extension adds a "uniquelabel" directive, which creates a
label which is made unique by adding the name of the document to the
label.  The name of the generated label is "dir/file-labelname"; this
is patterned on the generated label names that the hxtool SRST(label)
directive creates.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20250429163212.618953-2-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/conf.py               |  1 +
 docs/sphinx/uniquelabel.py | 74 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 docs/sphinx/uniquelabel.py

diff --git a/docs/conf.py b/docs/conf.py
index 7b5712e122..562db95bbf 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -67,6 +67,7 @@
     'qapi_domain',
     'qapidoc',
     'qmp_lexer',
+    'uniquelabel',
 ]
 
 if sphinx.version_info[:3] > (4, 0, 0):
diff --git a/docs/sphinx/uniquelabel.py b/docs/sphinx/uniquelabel.py
new file mode 100644
index 0000000000..cc4ab7f31c
--- /dev/null
+++ b/docs/sphinx/uniquelabel.py
@@ -0,0 +1,74 @@
+# coding=utf-8
+#
+# Copyright (c) 2025 Linaro
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Sphinx extension to create a unique label by concatenating
+# the name of the origin document with the label text.
+#
+# Sphinx requires that labels within documents are unique across
+# the whole manual. This is because the "create a hyperlink" directive
+# specifies only the name of the label, not a filename+label.
+# Some Sphinx versions will warn about duplicate labels, but
+# even if there is no warning there is still an ambiguity and no
+# guarantee that the hyperlink will be created to the right target.
+#
+# For QEMU this is awkward, because we have various .rst.inc fragments
+# which we include into multiple .rst files. If you define a label in
+# the .rst.inc file then it will be a duplicate label.
+#
+# The uniquelabel directive is our fix for this: it creates a label
+# whose name includes the name of the top level .rst file. This is then
+# unique even if the .rst.inc file is included in multiple places, and
+# when we create a hyperlink we can explicitly specify which label we
+# are targeting.
+#
+# Concretely, if you have a foo/bar.rst and a foo/baz.rst that
+# both include wat.rst.inc, then in wat.rst.inc you can write
+# .. uniquelabel:: mylabel
+# and it will be as if you had written a reference label:
+# .. _foo/bar-mylabel
+# or
+# .. _foo/baz-mylabel
+# depending on which file included wat.rst.inc, and you can link to
+# whichever one you intend via any of the usual markup, e.g.
+# `documentation of the thing in bar <foo/bar-mylabel>`.
+
+"""uniquelabel is a Sphinx extension that implements the uniquelabel directive"""
+
+from docutils import nodes
+from docutils.statemachine import ViewList
+from docutils.parsers.rst import directives, Directive
+import sphinx
+
+__version__ = '1.0'
+
+class UniqueLabelDocDirective(Directive):
+    """Create a unique label by including the docname"""
+    required_arguments = 1
+    optional_arguments = 0
+    has_content = False
+
+    def run(self):
+        env = self.state.document.settings.env
+        label = self.arguments[0]
+
+        refline = ".. _" + env.docname + "-" + label + ":"
+
+        rstlist = ViewList()
+        rstlist.append(refline, "generated text", 0)
+
+        node = nodes.paragraph()
+        self.state.nested_parse(rstlist, 0, node)
+        return node.children
+
+def setup(app):
+    """ Register uniquelabel directive with Sphinx"""
+    app.add_directive('uniquelabel', UniqueLabelDocDirective)
+
+    return dict(
+        version = __version__,
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
-- 
2.39.5

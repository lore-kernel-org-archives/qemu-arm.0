Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391847nji;
        Mon, 15 Jul 2024 10:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKemyEtUC8FDS4M5gGvmL76Q/NaX3s3m0UUKgpPtFaEWj3UemotKi8U3RAzdCoLF+TjkcjvGJxTG4dpitu4VwDY5prchc9
X-Google-Smtp-Source: AGHT+IGzv4ZJj4K2fqi8hwPK23YjDSrm0+9C2gLUfSxIy33hha3JNK2tWRy609FkUfGWL1TOkDG+
X-Received: by 2002:a05:6214:29cc:b0:6b4:f761:f0b8 with SMTP id 6a1803df08f44-6b77de60d64mr5203326d6.8.1721064815602;
        Mon, 15 Jul 2024 10:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064815; cv=none;
        d=google.com; s=arc-20160816;
        b=efnUp+8MhKBDuq1TlZHkYA5H4lvcBqI21mwq4DzIsP3OXthDkE69IDHQK+MLCvS1sn
         Wd7nvsMiAXd1tOlN4VwfsSPpOKMHfSnhc41LqQdgw0XNEyxSl45e0AcSTReWaARUAU7L
         gQQ6Dv/VfoTL63Sxdv67VxIxMNxTGUDgEasgsJKO346rmm2GRWVLXxmmTSpBsjWc95VB
         aC2VUAJq7FgG3zLVE70uXUGz5SR9xlc4298pmUHuYS73hhZgabRAJxh0D51xsy5t1Lit
         SN7I/c4gqunzsH1SAf8hKq6yQJRDL+UUk0ULDhKMtpogNpzk9/+S6vCKXeaFRIfvBUy9
         vGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UlN8lY5PJP7S659eIzOujYC9eIjixnVgiMPk4Up1ekI=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=M6+b0mX2By4Ugkd6P+9QyjqK0X6rvSfxKE857/UCG0c1CRIqbSYuXX9Y7rp4dr8Wfw
         a3+mG3l1VKecNBfmF6ns1xQvCv5qWzHgChQh+9+Q5ufniCoQtJ5O8Wp7v3pc61wTUrpq
         KOKvSdHYqz9LcWjhz+Nie/Nc6x5lJLjawyS/j2yhzDM/iLPzN3TvkkJgIWDzhgyE6tlD
         QyYyaJPUnVO2XWYQlZBwYM7EwmUDMdefijQP4ZsMussaLiL+o2fCXTwEi7Lsh89f7DuP
         k3EEN5QADp/Q/4rV9sHHsGbjIkUC6HI+4fivue1JOLcLu8HwzA00NS1AQbXFF24en9Vb
         L3pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nswyl3ii;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a3bb51si55207976d6.446.2024.07.15.10.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nswyl3ii;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlN8lY5PJP7S659eIzOujYC9eIjixnVgiMPk4Up1ekI=;
	b=Nswyl3iiCR0bEds6/3lwCp9T90czE8sJDx9cytdNSXc9mJnjS0wEaGBefeeMn23S5v7EGP
	yS7VSlmQNh+ZnCZhD6kjNF0N089MPuMndkBgBVFtRRXl7KjXWyN7151XT9QHLcTdtNVsH8
	qz+lobd1mLzezOW116PgxBHMyCGfdEY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-QISIgKC9M2y7kXz5XtfgTg-1; Mon,
 15 Jul 2024 13:33:33 -0400
X-MC-Unique: QISIgKC9M2y7kXz5XtfgTg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84D511955F42;
	Mon, 15 Jul 2024 17:33:30 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 25EF91955D44;
	Mon, 15 Jul 2024 17:33:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Leonardo Bras <leobras@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Michael Roth <michael.roth@amd.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 6/6] docs: remove Sphinx 1.x compatibility code
Date: Mon, 15 Jul 2024 13:32:41 -0400
Message-ID: <20240715173241.572048-7-jsnow@redhat.com>
In-Reply-To: <20240715173241.572048-1-jsnow@redhat.com>
References: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 7YvorUA+eNHW

In general, the Use_SSI workaround is no longer needed, and neither is
the pre-1.6 logging shim for kerneldoc.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20240703175235.239004-3-jsnow@redhat.com
[rebased on top of origin/master. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/hxtool.py    | 21 ++++-----------------
 docs/sphinx/kerneldoc.py | 38 ++++++++++++--------------------------
 docs/sphinx/kernellog.py | 28 ----------------------------
 docs/sphinx/qapidoc.py   | 33 +++------------------------------
 4 files changed, 19 insertions(+), 101 deletions(-)
 delete mode 100644 docs/sphinx/kernellog.py

diff --git a/docs/sphinx/hxtool.py b/docs/sphinx/hxtool.py
index 3729084a36c..a84723be19e 100644
--- a/docs/sphinx/hxtool.py
+++ b/docs/sphinx/hxtool.py
@@ -24,16 +24,10 @@
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 from sphinx.errors import ExtensionError
+from sphinx.util.docutils import switch_source_input
 from sphinx.util.nodes import nested_parse_with_titles
 import sphinx
 
-# Sphinx up to 1.6 uses AutodocReporter; 1.7 and later
-# use switch_source_input. Check borrowed from kerneldoc.py.
-Use_SSI = sphinx.__version__[:3] >= '1.7'
-if Use_SSI:
-    from sphinx.util.docutils import switch_source_input
-else:
-    from sphinx.ext.autodoc import AutodocReporter
 
 __version__ = '1.0'
 
@@ -185,16 +179,9 @@ def run(self):
     # of title_styles and section_level that kerneldoc.py does,
     # because nested_parse_with_titles() does that for us.
     def do_parse(self, result, node):
-        if Use_SSI:
-            with switch_source_input(self.state, result):
-                nested_parse_with_titles(self.state, result, node)
-        else:
-            save = self.state.memo.reporter
-            self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
-            try:
-                nested_parse_with_titles(self.state, result, node)
-            finally:
-                self.state.memo.reporter = save
+        with switch_source_input(self.state, result):
+            nested_parse_with_titles(self.state, result, node)
+
 
 def setup(app):
     """ Register hxtool-doc directive with Sphinx"""
diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index 72c403a7379..3aa972f2e89 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -38,20 +38,14 @@
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 
-#
-# AutodocReporter is only good up to Sphinx 1.7
-#
 import sphinx
+from sphinx.util import logging
+from sphinx.util.docutils import switch_source_input
 
-Use_SSI = sphinx.__version__[:3] >= '1.7'
-if Use_SSI:
-    from sphinx.util.docutils import switch_source_input
-else:
-    from sphinx.ext.autodoc import AutodocReporter
-
-import kernellog
 
 __version__  = '1.0'
+logger = logging.getLogger('kerneldoc')
+
 
 class KernelDocDirective(Directive):
     """Extract kernel-doc comments from the specified file"""
@@ -111,8 +105,7 @@ def run(self):
         cmd += [filename]
 
         try:
-            kernellog.verbose(env.app,
-                              'calling kernel-doc \'%s\'' % (" ".join(cmd)))
+            logger.verbose('calling kernel-doc \'%s\'' % (" ".join(cmd)))
 
             p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
             out, err = p.communicate()
@@ -122,8 +115,10 @@ def run(self):
             if p.returncode != 0:
                 sys.stderr.write(err)
 
-                kernellog.warn(env.app,
-                               'kernel-doc \'%s\' failed with return code %d' % (" ".join(cmd), p.returncode))
+                logger.warning(
+                    'kernel-doc \'%s\' failed with return code %d' %
+                    (" ".join(cmd), p.returncode)
+                )
                 return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
             elif env.config.kerneldoc_verbosity > 0:
                 sys.stderr.write(err)
@@ -149,22 +144,13 @@ def run(self):
             return node.children
 
         except Exception as e:  # pylint: disable=W0703
-            kernellog.warn(env.app, 'kernel-doc \'%s\' processing failed with: %s' %
+            logger.warning('kernel-doc \'%s\' processing failed with: %s' %
                            (" ".join(cmd), str(e)))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
     def do_parse(self, result, node):
-        if Use_SSI:
-            with switch_source_input(self.state, result):
-                self.state.nested_parse(result, 0, node, match_titles=1)
-        else:
-            save = self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter
-            self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
-            self.state.memo.title_styles, self.state.memo.section_level = [], 0
-            try:
-                self.state.nested_parse(result, 0, node, match_titles=1)
-            finally:
-                self.state.memo.title_styles, self.state.memo.section_level, self.state.memo.reporter = save
+        with switch_source_input(self.state, result):
+            self.state.nested_parse(result, 0, node, match_titles=1)
 
 
 def setup(app):
diff --git a/docs/sphinx/kernellog.py b/docs/sphinx/kernellog.py
deleted file mode 100644
index af924f51a7d..00000000000
--- a/docs/sphinx/kernellog.py
+++ /dev/null
@@ -1,28 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Sphinx has deprecated its older logging interface, but the replacement
-# only goes back to 1.6.  So here's a wrapper layer to keep around for
-# as long as we support 1.4.
-#
-import sphinx
-
-if sphinx.__version__[:3] >= '1.6':
-    UseLogging = True
-    from sphinx.util import logging
-    logger = logging.getLogger('kerneldoc')
-else:
-    UseLogging = False
-
-def warn(app, message):
-    if UseLogging:
-        logger.warning(message)
-    else:
-        app.warn(message)
-
-def verbose(app, message):
-    if UseLogging:
-        logger.verbose(message)
-    else:
-        app.verbose(message)
-
-
diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index 2b06750a3cd..62b39833ca0 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -35,22 +35,11 @@
 from qapi.gen import QAPISchemaVisitor
 from qapi.schema import QAPISchema
 
-import sphinx
 from sphinx.errors import ExtensionError
+from sphinx.util.docutils import switch_source_input
 from sphinx.util.nodes import nested_parse_with_titles
 
 
-# Sphinx up to 1.6 uses AutodocReporter; 1.7 and later
-# use switch_source_input. Check borrowed from kerneldoc.py.
-USE_SSI = sphinx.__version__[:3] >= "1.7"
-if USE_SSI:
-    from sphinx.util.docutils import switch_source_input
-else:
-    from sphinx.ext.autodoc import (  # pylint: disable=no-name-in-module
-        AutodocReporter,
-    )
-
-
 __version__ = "1.0"
 
 
@@ -539,24 +528,8 @@ def do_parse(self, rstlist, node):
         subheadings (titles) without confusing the rendering of
         anything else.
         """
-        # This is from kerneldoc.py -- it works around an API change in
-        # Sphinx between 1.6 and 1.7. Unlike kerneldoc.py, we use
-        # sphinx.util.nodes.nested_parse_with_titles() rather than the
-        # plain self.state.nested_parse(), and so we can drop the saving
-        # of title_styles and section_level that kerneldoc.py does,
-        # because nested_parse_with_titles() does that for us.
-        if USE_SSI:
-            with switch_source_input(self.state, rstlist):
-                nested_parse_with_titles(self.state, rstlist, node)
-        else:
-            save = self.state.memo.reporter
-            self.state.memo.reporter = AutodocReporter(
-                rstlist, self.state.memo.reporter
-            )
-            try:
-                nested_parse_with_titles(self.state, rstlist, node)
-            finally:
-                self.state.memo.reporter = save
+        with switch_source_input(self.state, rstlist):
+            nested_parse_with_titles(self.state, rstlist, node)
 
 
 def setup(app):
-- 
2.45.0

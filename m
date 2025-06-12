Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2601312njc;
        Thu, 12 Jun 2025 13:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVELolobWqlP31QbKHUp8ZXBi3seAnA1va64U/UpeEC5oJU/2+1883cL6NPqOcqb5ajhMt5rq22z6dMRA==@linaro.org
X-Google-Smtp-Source: AGHT+IF1qRb5hJmaK9B+Uajw0Q6OBJWeIgV+wbbxqwPiXOWxaShr84yeIzAk9dXdRSDo2MuV4kGT
X-Received: by 2002:a05:620a:480b:b0:7c5:94b2:99da with SMTP id af79cd13be357-7d3bc42f21amr115234485a.28.1749761790277;
        Thu, 12 Jun 2025 13:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749761790; cv=none;
        d=google.com; s=arc-20240605;
        b=Fi77V87dP0BEhTRLfrQf7u4eJVm+XTV4uCyHX/uZGwonp6dwW5lsYwSzXwAYUhKtpp
         Ijs33ynwu1HbgXs78j2Exka6JcJVBfTcKB/x9vyM+1Yh0flHgv42rn+BD1qrfJ2k+TWA
         8Ey8kQgmXhoHZjOM0oRK/gG9qlcT2ZnWO/IuV1hj74ywPQxQ9y8Jcrk3eP0uiJ+XHjUf
         mOj5IFfqKjxLf2QJdXB28Pi5sCr6BZ9BtZPocShJ7TWyhtmx2CwsUXiIAywDmeP5mkZP
         /pZ3RhFQqsZsSa4ijwP/gQwEDeItZjNHuRNIh/VraUdXzrkgsaI8dwat9YKtZQitE6xP
         oHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R+HVWn5ejM2NRJ2UzNsYUYT8arVp5yX8Fj0AdCrYiak=;
        fh=Bqei7UspLQLDtJyhx8DFVPkwaTXoAlN/5Ng7ASZZYZk=;
        b=kZGZIW6+25xMfJ5Q0ZTKWYq6rq96U1+vp0tY2gLgN58uh4VaEC+alOXFOokeotfE7B
         6MkX/LMMaG4fYCVInWzqJs5VJCI2CU8VO9ZEAfHj0mTPvj0oAIyD9xqLewY4O5Wo7xfp
         Cw4B6e3Eyu+/SX7RhHjSReu9pUKpmr/l74a3oSYRc2D/Uj0lUkMIgF1tnlxPy8GRJIdd
         6DZaliyIc7I+YF6J0/5/G4tgrIuEzW+E0YCc97zYTLpYoFffhETw1Ddy8/ML03k2eaMt
         727zkI5MbAgSTi9o+PAJ1528oMdpAcxwyWWoGNiaKq1tuQQxYZzu+w4UnYPj+06UhdEA
         dqnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ihEIveKl;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ed9ab9si156625885a.375.2025.06.12.13.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ihEIveKl;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749761789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+HVWn5ejM2NRJ2UzNsYUYT8arVp5yX8Fj0AdCrYiak=;
	b=ihEIveKlzQZx1a6MfKxXXSA3rQR+5OJLUPCcRbGUseBwX9QeRZ6kTaKNayfM5XbzFAJQCc
	E2b3Rt55A1CKxaetH3PnNBJjVt8NCWVdZt6BGHOczO60eAp2SFXRzKEn3BdEkpJwIvk/dw
	T81jE3gbHg1He4c4Y0/fwfanh4UfOM4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-3q7aSDHgO1GPtMVMnHw1xw-1; Thu,
 12 Jun 2025 16:56:25 -0400
X-MC-Unique: 3q7aSDHgO1GPtMVMnHw1xw-1
X-Mimecast-MFC-AGG-ID: 3q7aSDHgO1GPtMVMnHw1xw_1749761772
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41B7A19560AD;
	Thu, 12 Jun 2025 20:56:10 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.54])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7ADA61955F4A;
	Thu, 12 Jun 2025 20:55:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
	Yi Liu <yi.l.liu@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Helge Deller <deller@gmx.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Fabiano Rosas <farosas@suse.de>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ed Maste <emaste@freebsd.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Eric Blake <eblake@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Troy Lee <leetroy@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Ani Sinha <anisinha@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	qemu-s390x@nongnu.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	qemu-block@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	Maksim Davydov <davydov-max@yandex-team.ru>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paul Durrant <paul@xen.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Jagannathan Raman <jag.raman@oracle.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Hao Wu <wuhaotsh@google.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Thomas Huth <thuth@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	qemu-rust@nongnu.org,
	Bandan Das <bsd@redhat.com>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Fam Zheng <fam@euphon.net>,
	Jia Liu <proljc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	Song Gao <gaosong@loongson.cn>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Xu <peterx@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Radoslaw Biernacki <rad@semihalf.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH v2 01/12] python: convert packages to PEP517/pyproject.toml
Date: Thu, 12 Jun 2025 16:54:39 -0400
Message-ID: <20250612205451.1177751-2-jsnow@redhat.com>
In-Reply-To: <20250612205451.1177751-1-jsnow@redhat.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m1wnsGwDqt2oWnZC1h0pFQD7I_s7xQ33U1fz2I2AcGA_1749761772
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: MtDH2N5g1tCz

Newer versions of setuptools increasingly expect that packages are
defined using the pyproject.toml/PEP517 packaging layout format. With
3.9 as our minimum, I believe it's finally appropriate to make the shift
away from the legacy packaging format.

Update documentation and dependencies that change as a result of the
different build/packaging/installation pathways.

This change has the effect of fixing "make check-dev", which has been
broken on newer versions of Fedora for a while, now.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst        | 33 ++++++++++++++++-----------------
 python/Makefile          | 18 +++++++++---------
 python/pyproject.toml    | 10 ++++++++++
 python/setup.py          | 40 ----------------------------------------
 python/tests/minreqs.txt |  2 +-
 5 files changed, 36 insertions(+), 67 deletions(-)
 create mode 100644 python/pyproject.toml
 delete mode 100755 python/setup.py

diff --git a/python/README.rst b/python/README.rst
index d62e71528d2..befa84e3261 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -5,24 +5,23 @@ This directory houses Python tooling used by the QEMU project to build,
 configure, and test QEMU. It is organized by namespace (``qemu``), and
 then by package (e.g. ``qemu/machine``, ``qemu/qmp``, etc).
 
-``setup.py`` is used by ``pip`` to install this tooling to the current
-environment. ``setup.cfg`` provides the packaging configuration used by
-``setup.py``. You will generally invoke it by doing one of the following:
+``pyproject.toml`` and ``setup.cfg`` are used by ``pip`` to install this
+tooling to the current environment. ``setup.cfg`` provides the packaging
+configuration, while ``pyproject.toml`` describes the package build
+system requirements.
 
-1. ``pip3 install .`` will install these packages to your current
-   environment. If you are inside a virtual environment, they will
-   install there. If you are not, it will attempt to install to the
-   global environment, which is **not recommended**.
+You will generally install these packages by invoking ``pip3 install
+.``; which will install these packages to your current environment. If
+you are inside a virtual environment, they will install there. If you
+are not, modern versions of pip will attempt instead to install to your
+local user environment. Older versions of pip will attempt to install to
+the global environment, which is **not recommended**.
 
-2. ``pip3 install --user .`` will install these packages to your user's
-   local python packages. If you are inside of a virtual environment,
-   this will fail; you want the first invocation above.
-
-If you append the ``--editable`` or ``-e`` argument to either invocation
-above, pip will install in "editable" mode. This installs the package as
-a forwarder ("qemu.egg-link") that points to the source tree. In so
-doing, the installed package always reflects the latest version in your
-source tree.
+If you append the ``--editable`` or ``-e`` argument to the above
+invocation, pip will install in "editable" mode. This installs the
+package as a "forwarder" that points to the source tree, so that the
+installed package always reflects the latest version in your source
+tree.
 
 Installing ".[devel]" instead of "." will additionally pull in required
 packages for testing this package. They are not runtime requirements,
@@ -81,4 +80,4 @@ Files in this directory
 - ``VERSION`` contains the PEP-440 compliant version used to describe
   this package; it is referenced by ``setup.cfg``.
 - ``setup.cfg`` houses setuptools package configuration.
-- ``setup.py`` is the setuptools installer used by pip; See above.
+- ``pyproject.toml`` lists build system requirements for the Python packages.
diff --git a/python/Makefile b/python/Makefile
index 764b79ccb23..845fbb66cf4 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -15,8 +15,8 @@ help:
 	@echo "make check-tox:"
 	@echo "    Run tests against multiple python versions."
 	@echo "    These tests use the newest dependencies."
-	@echo "    Requires: Python 3.9 - 3.11, and tox."
-	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.11'"
+	@echo "    Requires: Python 3.9 - 3.13, and tox."
+	@echo "    Hint (Fedora): 'sudo dnf install python3-tox python3.13'"
 	@echo "    The variable QEMU_TOX_EXTRA_ARGS can be use to pass extra"
 	@echo "    arguments to tox".
 	@echo ""
@@ -63,12 +63,12 @@ $(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate: setup.cfg tests/minreqs.tx
 	@(								\
 		echo "ACTIVATE $(QEMU_MINVENV_DIR)";			\
 		. $(QEMU_MINVENV_DIR)/bin/activate;			\
-		echo "INSTALL wheel $(QEMU_MINVENV_DIR)";               \
-		$(PIP_INSTALL) wheel 1>/dev/null;		               \
+		echo "INSTALL wheel $(QEMU_MINVENV_DIR)";		\
+		$(PIP_INSTALL) wheel 1>/dev/null;			\
 		echo "INSTALL -r tests/minreqs.txt $(QEMU_MINVENV_DIR)";\
 		$(PIP_INSTALL) -r tests/minreqs.txt 1>/dev/null;	\
 		echo "INSTALL -e qemu $(QEMU_MINVENV_DIR)";		\
-		$(PIP_INSTALL) -e . 1>/dev/null;			\
+		$(PIP_INSTALL) -e . --config-settings=editable_mode=compat 1>/dev/null;			\
 	)
 	@touch $(QEMU_MINVENV_DIR)
 
@@ -103,7 +103,7 @@ check-dev: dev-venv
 
 .PHONY: develop
 develop:
-	$(PIP_INSTALL) -e .[devel]
+	$(PIP_INSTALL) -e .[devel] --config-settings=editable_mode=compat
 
 .PHONY: check
 check:
@@ -122,12 +122,12 @@ check-coverage:
 
 .PHONY: clean
 clean:
-	python3 setup.py clean --all
-	rm -f pyproject.toml
+	rm -rf build/
 
 .PHONY: distclean
 distclean: clean
-	rm -rf qemu.egg-info/ .eggs/ dist/
+	rm -rf qemu.egg-info/
 	rm -rf $(QEMU_VENV_DIR) $(QEMU_MINVENV_DIR) .tox/
+	rm -rf .mypy_cache/
 	rm -f .coverage .coverage.*
 	rm -rf htmlcov/
diff --git a/python/pyproject.toml b/python/pyproject.toml
new file mode 100644
index 00000000000..2de34bf4729
--- /dev/null
+++ b/python/pyproject.toml
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+[build-system]
+requires = [
+    "setuptools>=39.2",
+    "wheel",
+]
+build-backend = "setuptools.build_meta"
+
+[tool.setuptools_scm]
diff --git a/python/setup.py b/python/setup.py
deleted file mode 100755
index c5bc45919a4..00000000000
--- a/python/setup.py
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/usr/bin/env python3
-"""
-QEMU tooling installer script
-Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
-"""
-
-import setuptools
-from setuptools.command import bdist_egg
-import sys
-import pkg_resources
-
-
-class bdist_egg_guard(bdist_egg.bdist_egg):
-    """
-    Protect against bdist_egg from being executed
-
-    This prevents calling 'setup.py install' directly, as the 'install'
-    CLI option will invoke the deprecated bdist_egg hook. "pip install"
-    calls the more modern bdist_wheel hook, which is what we want.
-    """
-    def run(self):
-        sys.exit(
-            'Installation directly via setup.py is not supported.\n'
-            'Please use `pip install .` instead.'
-        )
-
-
-def main():
-    """
-    QEMU tooling installer
-    """
-
-    # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
-    pkg_resources.require('setuptools>=39.2')
-
-    setuptools.setup(cmdclass={'bdist_egg': bdist_egg_guard})
-
-
-if __name__ == '__main__':
-    main()
diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
index cd2e2a81c3d..e9edfa55eb7 100644
--- a/python/tests/minreqs.txt
+++ b/python/tests/minreqs.txt
@@ -15,6 +15,7 @@
 # also pin setuptools to version 70 or below. Otherwise, the
 # installation of the QEMU package itself fails, failing to find
 # setuptools.
+# Avocado also appears to require an older setuptools.
 setuptools<=70
 
 # Dependencies for qapidoc/qapi_domain et al
@@ -55,7 +56,6 @@ astroid==2.15.4
 dill==0.2
 lazy-object-proxy==1.4.0
 platformdirs==2.2.0
-toml==0.10.0
 tomlkit==0.10.1
 wrapt==1.14.0
 
-- 
2.48.1

Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1026849qvs;
        Tue, 13 Jul 2021 14:20:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk27CZP7qZmIDIVGC3tuaAMEEMdAzoNH3QpkD4dfJHhxiFD6AC15/vaj2Eq2NanSDmyV4I
X-Received: by 2002:aa7:cc0c:: with SMTP id q12mr8563460edt.90.1626211240822;
        Tue, 13 Jul 2021 14:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211240; cv=none;
        d=google.com; s=arc-20160816;
        b=U19DYwOuB3eqe9HiqcUaV26XJqrtVTAHZuKUind9PVekjBb6IrEjyZhu4AvRTPsebt
         Kz+dQH3W9p98j9fHmv9wjqOqjTACAuFmruJJKuXVDmODaNhdFdOkVg0qHRcYq+jmBnuC
         QIIle5m28rzQBzsZv7OrouLhCUbSusKK6iH7VYmrkn/uwiyTHVYmmA9kOflfQzILdsRJ
         VZtjCqKS6khF+T0CtyI1WBuKIb5r+4AUUk2C44GEFn/nidc8pR1bU0oOuU3DivcnnyG1
         jwS1NIMlAEuxmVnu/s+RhzqbFXmMK/E9inpBpIOXfwFkuutAXl/m3UAjo7oKrT1yqp08
         thtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OS8v8CG+34mphZBpB0HybgdUv1BniMG/SDhz9sxy3DQ=;
        b=PGhZsyDGPTSYM8FoxwqS0RsveuGq/rLSVEJuJy5iotJVH/ZV72Iqw5BgYs1QUDscWK
         MtL9curvGMoP2PeMXstrzOcki5bmTs06p+XjO9AcEsbI5H+uU3ufElkRcttFicFgsFZh
         0ra0RPb0x+zJrPyVfTVWo1M1TWPggiDu/Xd5Dxobz31PLmaMl8vCHW5khhVd4Eno2bu8
         pzVclWH/uss8Vq/WzMFpq5bKM+K6IybCtTk/WEilIyuIHvPJDgl/sHaJxHBSZ1BNw66v
         rEbRsOVI8UihDoMBx2uPGfms/TYLsSEtc4G9UFBi056QrX8YuylfEwrOkuBqMG/kVGyi
         zRBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vsekz69R;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id k20si20998060ejj.639.2021.07.13.14.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vsekz69R;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OS8v8CG+34mphZBpB0HybgdUv1BniMG/SDhz9sxy3DQ=;
	b=Vsekz69RDAGhBCSB8izCf3LPOzAYDfxX2Z8n9hF474Jqa/5wzJDKFxfmz4oCVy9GtpeHZE
	nQMs7ZkTRU4QVzUecGMn+E1rC7R30iQD8Ia5PdADaJwF7npK93cZKHpu7wxv2Rqd5d7Fui
	8JPMV1+OTI08JbEh0TIceZrPVyMlR5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-_rGCbJSxO0GpXpu42Le2Tg-1; Tue, 13 Jul 2021 17:20:34 -0400
X-MC-Unique: _rGCbJSxO0GpXpu42Le2Tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC431005E46;
	Tue, 13 Jul 2021 21:20:31 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A9119C44;
	Tue, 13 Jul 2021 21:20:18 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 03/23] Acceptance Tests: distinguish between temp and logs dir
Date: Tue, 13 Jul 2021 17:19:03 -0400
Message-Id: <20210713211923.3809241-4-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: 1x1rAsMsWKE3

Logs can be very important to debug issues, and currently QEMUMachine
instances will remove logs that are created under the temporary
directories.

With this change, the stdout and stderr generated by the QEMU process
started by QEMUMachine will always be kept along the test results
directory.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210211220146.2525771-6-crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine/machine.py            | 17 ++++++++++++++---
 tests/acceptance/avocado_qemu/__init__.py |  3 ++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index d47ab3d896..94846dd71b 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -96,7 +96,8 @@ def __init__(self,
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
-                 console_log: Optional[str] = None):
+                 console_log: Optional[str] = None,
+                 log_dir: Optional[str] = None):
         '''
         Initialize a QEMUMachine
 
@@ -110,6 +111,7 @@ def __init__(self,
         @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
+        @param log_dir: where to create and keep log files
         @note: Qemu process is not started until launch() is used.
         '''
         # pylint: disable=too-many-arguments
@@ -123,6 +125,7 @@ def __init__(self,
         self._name = name or "qemu-%d" % os.getpid()
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir or self._base_temp_dir
+        self._log_dir = log_dir
         self._socket_scm_helper = socket_scm_helper
 
         if monitor_address is not None:
@@ -314,8 +317,6 @@ def _base_args(self) -> List[str]:
         return args
 
     def _pre_launch(self) -> None:
-        self._qemu_log_path = os.path.join(self.temp_dir, self._name + ".log")
-
         if self._console_set:
             self._remove_files.append(self._console_address)
 
@@ -332,6 +333,7 @@ def _pre_launch(self) -> None:
         # NOTE: Make sure any opened resources are *definitely* freed in
         # _post_shutdown()!
         # pylint: disable=consider-using-with
+        self._qemu_log_path = os.path.join(self.log_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
     def _post_launch(self) -> None:
@@ -770,3 +772,12 @@ def temp_dir(self) -> str:
             self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
                                               dir=self._base_temp_dir)
         return self._temp_dir
+
+    @property
+    def log_dir(self) -> str:
+        """
+        Returns a directory to be used for writing logs
+        """
+        if self._log_dir is None:
+            return self.temp_dir
+        return self._log_dir
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4ce09de4fa..420c00f1a9 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -222,9 +222,10 @@ def setUp(self):
     def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
-                         sock_dir=self._sd.name)
+                         sock_dir=self._sd.name, log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
         self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
+        self.log.debug('QEMUMachine "%s" log_dir: %s', name, vm.log_dir)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.31.1

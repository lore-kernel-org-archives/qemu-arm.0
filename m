Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891701ejb;
        Wed, 4 Oct 2023 12:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq3Ub5TKOhzRM/QL1vqfswJ8g9KV/h0SbuXIJG24ULyYjoY7NEik+pDlXJGoywh0AcZUEp
X-Received: by 2002:a81:a24a:0:b0:59f:7f8e:dc4a with SMTP id z10-20020a81a24a000000b0059f7f8edc4amr4115434ywg.22.1696448787997;
        Wed, 04 Oct 2023 12:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448787; cv=none;
        d=google.com; s=arc-20160816;
        b=BDl+dCGp+TJj1BOWxYFrBufAdGcRdG6srOcRHjBei1ycElmrpFvxwi5GaTJB6Wlasf
         oc7VFc9UMROuDqeL9Ir05ncSlyl836v7+GOMsO0aglEKqHG85lTJzx/xmounMFFVipXu
         iKgTiyATnBmIuWiwgmC1ptAXVQOc13EyspNMBT0KwokhlUR8RtKR6cBDBejzzgy7yili
         qnPDu7F11/ufparl6hC1vtqi0HAE0kaPI2nmDucG1pLhjv3xiC1YKQtaUB6r3zMumHkR
         OrZnlwHkWPu5kmIsBMKzyXdFya9VjUpQ5YkenuoKEiuB3aBbVNm7ZxwY8mjqQaWKDDtm
         F1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s8e0IXKXqZe6dWMOzvCuZI4rlrIkusOYaAYt4sScH5o=;
        fh=YYcUncbuZ8zA1+PNe3n/41UyzzQQmqdTXlaMDrLfUHg=;
        b=N3BF1WmCfOLcG0frjPFwjJ6/JnRwGAjF2m9hNaYVR2Xjc4D5uX92eGxlH68/s/TKu6
         T1FxIz9An8oEskCc0h/sS41NijBszDC226L+cVRMfsw6mxcm9mVy9lkGUkroikcGQNeM
         vfpCd47Rr7Dhrr/Eod5KdS+KCsY5pOoK4FFsVVRqfKG55+KvesboOlrqjMLd9CrzmL4O
         nK0h5Nb8SHJzAcJsMHzgaHTj3Pud5C6SPLR2V/Q9gHoU1V3ruUT7xvUIXx8BM4jsEAkZ
         nm0pZrI0kD3JsjW4WNG/5GDPiE9Wu/m7ZakALJdK3aTub8R7QTmL2J+XtarkSXHQrcA3
         8uFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gs7zCQQv;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f188-20020a81a8c5000000b005a4f4593ffasi1503882ywh.327.2023.10.04.12.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gs7zCQQv;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8e0IXKXqZe6dWMOzvCuZI4rlrIkusOYaAYt4sScH5o=;
	b=gs7zCQQvZnU2tfQWfY5fynfo3nzcJUDcJnACYEgcMTBXVA+dWxrc9Dl2lZjTbA9uu7J14J
	Vhcvke3YkzDQZvIx9OyNQZA/y5+WjkAGHyKpepfazYBMtY/3sr3ipJvAxwZsvYPQtSAvHS
	dZ+F4VV3YGxe1aCv1MkyfZ7V9QG1bqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-695-tYOzpbkuOsCnfyG7KjvOhQ-1; Wed, 04 Oct 2023 15:46:23 -0400
X-MC-Unique: tYOzpbkuOsCnfyG7KjvOhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E97280349A;
	Wed,  4 Oct 2023 19:46:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A14C41054FC1;
	Wed,  4 Oct 2023 19:46:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Hanna Reitz <hreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 7/9] python/machine: remove unused sock_dir argument
Date: Wed,  4 Oct 2023 15:46:11 -0400
Message-ID: <20231004194613.2900323-8-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: hVbF0d/t8vuU

By using a socketpair for all of the sockets managed by the VM class and
its extensions, we don't need the sock_dir argument anymore, so remove
it.

We only added this argument so that we could specify a second, shorter
temporary directory for cases where the temp/log dirs were "too long" as
a socket name on macOS. We don't need it for this class now. In one
case, avocado testing takes over responsibility for creating an
appropriate sockdir.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230928044943.849073-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py             | 18 ------------------
 python/qemu/machine/qtest.py               |  5 +----
 tests/avocado/acpi-bits.py                 |  5 +----
 tests/avocado/avocado_qemu/__init__.py     |  2 +-
 tests/avocado/machine_aspeed.py            |  5 ++++-
 tests/qemu-iotests/iotests.py              |  2 +-
 tests/qemu-iotests/tests/copy-before-write |  3 +--
 7 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 4156b8cf7d4..d539e91268a 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -127,7 +127,6 @@ def __init__(self,
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  monitor_address: Optional[SocketAddrT] = None,
-                 sock_dir: Optional[str] = None,
                  drain_console: bool = False,
                  console_log: Optional[str] = None,
                  log_dir: Optional[str] = None,
@@ -141,7 +140,6 @@ def __init__(self,
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param base_temp_dir: default location where temp files are created
         @param monitor_address: address for QMP monitor
-        @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
         @param log_dir: where to create and keep log files
@@ -163,7 +161,6 @@ def __init__(self,
             Tuple[socket.socket, socket.socket]] = None
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
-        self._sock_dir = sock_dir
         self._log_dir = log_dir
 
         self._monitor_address = monitor_address
@@ -189,9 +186,6 @@ def __init__(self,
         self._console_index = 0
         self._console_set = False
         self._console_device_type: Optional[str] = None
-        self._console_address = os.path.join(
-            self.sock_dir, f"{self._name}.con"
-        )
         self._console_socket: Optional[socket.socket] = None
         self._console_file: Optional[socket.SocketIO] = None
         self._remove_files: List[str] = []
@@ -335,9 +329,6 @@ def args(self) -> List[str]:
         return self._args
 
     def _pre_launch(self) -> None:
-        if self._console_set:
-            self._remove_files.append(self._console_address)
-
         if self._qmp_set:
             if self._monitor_address is None:
                 self._sock_pair = socket.socketpair()
@@ -937,15 +928,6 @@ def temp_dir(self) -> str:
                                               dir=self._base_temp_dir)
         return self._temp_dir
 
-    @property
-    def sock_dir(self) -> str:
-        """
-        Returns the directory used for sockfiles by this machine.
-        """
-        if self._sock_dir:
-            return self._sock_dir
-        return self.temp_dir
-
     @property
     def log_dir(self) -> str:
         """
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 8180d3ab017..4f5ede85b23 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -135,17 +135,14 @@ def __init__(self,
                  wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
-                 sock_dir: Optional[str] = None,
                  qmp_timer: Optional[float] = None):
         # pylint: disable=too-many-arguments
 
         if name is None:
             name = "qemu-%d" % os.getpid()
-        if sock_dir is None:
-            sock_dir = base_temp_dir
         super().__init__(binary, args, wrapper=wrapper, name=name,
                          base_temp_dir=base_temp_dir,
-                         sock_dir=sock_dir, qmp_timer=qmp_timer)
+                         qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
         self._qtest_sock_pair: Optional[
             Tuple[socket.socket, socket.socket]] = None
diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index bb3f8186899..eca13dc5181 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -92,17 +92,14 @@ def __init__(self,
                  base_temp_dir: str = "/var/tmp",
                  debugcon_log: str = "debugcon-log.txt",
                  debugcon_addr: str = "0x403",
-                 sock_dir: Optional[str] = None,
                  qmp_timer: Optional[float] = None):
         # pylint: disable=too-many-arguments
 
         if name is None:
             name = "qemu-bits-%d" % os.getpid()
-        if sock_dir is None:
-            sock_dir = base_temp_dir
         super().__init__(binary, args, wrapper=wrapper, name=name,
                          base_temp_dir=base_temp_dir,
-                         sock_dir=sock_dir, qmp_timer=qmp_timer)
+                         qmp_timer=qmp_timer)
         self.debugcon_log = debugcon_log
         self.debugcon_addr = debugcon_addr
         self.base_temp_dir = base_temp_dir
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 0172a359b71..0589534f28a 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -322,7 +322,7 @@ def require_multiprocess(self):
     def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="qemu_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
-                         sock_dir=self._sd.name, log_dir=self.logdir)
+                         log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
         self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
         self.log.debug('QEMUMachine "%s" log_dir: %s', name, vm.log_dir)
diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 90f1b7cb77a..f691ee3fb82 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -247,7 +247,10 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
 
-        socket = os.path.join(self.vm.sock_dir, 'swtpm-socket')
+        # force creation of VM object, which also defines self._sd
+        vm = self.vm
+
+        socket = os.path.join(self._sd.name, 'swtpm-socket')
 
         subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
                         '--tpmstate', f'dir={self.vm.temp_dir}',
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ef66fbd62b0..145c6827138 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -823,7 +823,7 @@ def __init__(self, path_suffix=''):
         super().__init__(qemu_prog, qemu_opts, wrapper=wrapper,
                          name=name,
                          base_temp_dir=test_dir,
-                         sock_dir=sock_dir, qmp_timer=timer)
+                         qmp_timer=timer)
         self._num_drives = 0
 
     def _post_shutdown(self) -> None:
diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index 2ffe092b318..d3987db9421 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -44,8 +44,7 @@ class TestCbwError(iotests.QMPTestCase):
 
         opts = ['-nodefaults', '-display', 'none', '-machine', 'none']
         self.vm = QEMUMachine(iotests.qemu_prog, opts,
-                              base_temp_dir=iotests.test_dir,
-                              sock_dir=iotests.sock_dir)
+                              base_temp_dir=iotests.test_dir)
         self.vm.launch()
 
     def do_cbw_error(self, on_cbw_error):
-- 
2.41.0

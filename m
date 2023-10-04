Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891711ejb;
        Wed, 4 Oct 2023 12:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+U/xGyfK8C+F0QrbLm8fMkRFmyikEJhuZbzxT/EI1arl5lR2GRSutYuvDVBh2YwUthGGH
X-Received: by 2002:a2e:3515:0:b0:2c0:2a6e:7869 with SMTP id z21-20020a2e3515000000b002c02a6e7869mr2967172ljz.44.1696448788979;
        Wed, 04 Oct 2023 12:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448788; cv=none;
        d=google.com; s=arc-20160816;
        b=B49VlunyciUbnRfb18a61sG3DZ7Z2288EUofahZRq3F2bnHWjd9NlnpTQicemuv8Sj
         /A5m88rc8JE68ggbOjljsTb+f0Zakn5fPbZVH3Sj5b0o6fz3qCaeQQeo2YfoghHWjo5A
         YDj4mQZEVMB3yC/k4T+T7L28RKoy22sY0lLNZ2A7KomrIy632mVH39JZOVrTzxEJuw11
         Znw5Z1hZtaGp0QGy9xvEvj80CH8hOqgkkE2aBz8686HOVrY5GcnZIwSf5PSYWGQ3TURw
         ziYX8DyRXQykitcNE8YWOkJkS9DPfYMKO+EZkkkhE3zxEuOp0AX9Q6my37Me0AN3evHF
         D/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EKJk7XVB2DViVMMKfF/Lt/CVsitRtP9avGJrQHTVjGQ=;
        fh=YYcUncbuZ8zA1+PNe3n/41UyzzQQmqdTXlaMDrLfUHg=;
        b=iOtKIke9zBrp2tNqdwtoHKpi5qFs4WLCrPGBcj3pHM77tQxsPVZeYk+P7xqsHN02rE
         QtXDjUY2zulDheVioeaxAinLwYRFHb4biykDEoKIZwQ5yI4cJj3skgh/EK8wT/kRVBDd
         n+y+UwkLpAkeS3WGh/1aZYs/oCpKOlhkzrW5Pa+wMZmiZXwWCvAh/LEylZQJxlu7Pvo7
         Cw94qBaKC6cU/hCvX9+KfwUGhhGpXUJ6xtN+awfAG7EnMrpnu2v9HZvL/z7fDAf9TVq2
         5Ze/Nz9+2s1hByvc1eI9qKLu//DNC/JNYOiMwxinulMhltSCKFMopAudFVu49y2LSfBJ
         FyKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aGVSHCQ/";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p5-20020a2e7405000000b002bcbe091bd3si3954718ljc.162.2023.10.04.12.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aGVSHCQ/";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EKJk7XVB2DViVMMKfF/Lt/CVsitRtP9avGJrQHTVjGQ=;
	b=aGVSHCQ/Kt0Waf6tVZH7SOGUurDYYVc7RG6o483yXfJRAqwavOLzyLe3/Ap8hA0VJURlMX
	RzWjtzwc2u7yigujPL+8PpMHgWLFg5+jY6QVN7WNBNVoer22HQ+0awYwY1tYe7/Fkr+0h7
	QSL9miJhRttKnWvcWfnknrXKWWuGDFU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-_yoS9iTfP7-Z29OlqBEk6A-1; Wed, 04 Oct 2023 15:46:22 -0400
X-MC-Unique: _yoS9iTfP7-Z29OlqBEk6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D5F12825E9A;
	Wed,  4 Oct 2023 19:46:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD4471054FC2;
	Wed,  4 Oct 2023 19:46:20 +0000 (UTC)
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
Subject: [PULL 6/9] python/machine: use socketpair() for qtest connection
Date: Wed,  4 Oct 2023 15:46:10 -0400
Message-ID: <20231004194613.2900323-7-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: sKwdFQCFHeaW

Like the QMP and console sockets, begin using socketpairs for the qtest
connection, too. After this patch, we'll be able to remove the vestigial
sock_dir argument, but that cleanup is best done in its own patch.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230928044943.849073-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/qtest.py | 49 +++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 1c46138bd0c..8180d3ab017 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -24,6 +24,7 @@
     Optional,
     Sequence,
     TextIO,
+    Tuple,
 )
 
 from qemu.qmp import SocketAddrT
@@ -38,23 +39,41 @@ class QEMUQtestProtocol:
     :param address: QEMU address, can be either a unix socket path (string)
                     or a tuple in the form ( address, port ) for a TCP
                     connection
-    :param server: server mode, listens on the socket (bool)
+    :param sock: An existing socket can be provided as an alternative to
+                 an address. One of address or sock must be provided.
+    :param server: server mode, listens on the socket. Only meaningful
+                   in conjunction with an address and not an existing
+                   socket.
+
     :raise socket.error: on socket connection errors
 
     .. note::
        No connection is established by __init__(), this is done
        by the connect() or accept() methods.
     """
-    def __init__(self, address: SocketAddrT,
+    def __init__(self,
+                 address: Optional[SocketAddrT] = None,
+                 sock: Optional[socket.socket] = None,
                  server: bool = False):
+        if address is None and sock is None:
+            raise ValueError("Either 'address' or 'sock' must be specified")
+        if address is not None and sock is not None:
+            raise ValueError(
+                "Either 'address' or 'sock' must be specified, but not both")
+        if sock is not None and server:
+            raise ValueError("server=True is meaningless when passing socket")
+
         self._address = address
-        self._sock = self._get_sock()
+        self._sock = sock or self._get_sock()
         self._sockfile: Optional[TextIO] = None
+
         if server:
+            assert self._address is not None
             self._sock.bind(self._address)
             self._sock.listen(1)
 
     def _get_sock(self) -> socket.socket:
+        assert self._address is not None
         if isinstance(self._address, tuple):
             family = socket.AF_INET
         else:
@@ -67,7 +86,8 @@ def connect(self) -> None:
 
         @raise socket.error on socket connection errors
         """
-        self._sock.connect(self._address)
+        if self._address is not None:
+            self._sock.connect(self._address)
         self._sockfile = self._sock.makefile(mode='r')
 
     def accept(self) -> None:
@@ -127,29 +147,40 @@ def __init__(self,
                          base_temp_dir=base_temp_dir,
                          sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
-        self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
+        self._qtest_sock_pair: Optional[
+            Tuple[socket.socket, socket.socket]] = None
 
     @property
     def _base_args(self) -> List[str]:
         args = super()._base_args
+        assert self._qtest_sock_pair is not None
+        fd = self._qtest_sock_pair[0].fileno()
         args.extend([
-            '-qtest', f"unix:path={self._qtest_path}",
+            '-chardev', f"socket,id=qtest,fd={fd}",
+            '-qtest', 'chardev:qtest',
             '-accel', 'qtest'
         ])
         return args
 
     def _pre_launch(self) -> None:
+        self._qtest_sock_pair = socket.socketpair()
+        os.set_inheritable(self._qtest_sock_pair[0].fileno(), True)
         super()._pre_launch()
-        self._qtest = QEMUQtestProtocol(self._qtest_path, server=True)
+        self._qtest = QEMUQtestProtocol(sock=self._qtest_sock_pair[1])
 
     def _post_launch(self) -> None:
         assert self._qtest is not None
         super()._post_launch()
-        self._qtest.accept()
+        if self._qtest_sock_pair:
+            self._qtest_sock_pair[0].close()
+        self._qtest.connect()
 
     def _post_shutdown(self) -> None:
+        if self._qtest_sock_pair:
+            self._qtest_sock_pair[0].close()
+            self._qtest_sock_pair[1].close()
+            self._qtest_sock_pair = None
         super()._post_shutdown()
-        self._remove_if_exists(self._qtest_path)
 
     def qtest(self, cmd: str) -> str:
         """
-- 
2.41.0

Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722623ejc;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8dZZrTRpSPZxKimbSwYa8xa9oCmoVDBlfBtxg0O6sfRtDFuaAmuv4vMXc7TB6PwQTvSK1
X-Received: by 2002:a0c:db11:0:b0:66c:fb1d:2601 with SMTP id d17-20020a0cdb11000000b0066cfb1d2601mr11350536qvk.5.1697224212282;
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224212; cv=none;
        d=google.com; s=arc-20160816;
        b=meUlCoTXo/ue8JFulj/FzdoxeE1Ci2fZWPczSqTbCcm1nLLIkF999NrZgsSvcw3Ak4
         VcqaTes7lNvPLb0imHLJb5Uung85p72w0Q922g3Llibd0oWJEwbIXexmdxGlL6zdIGif
         7dXKOWHbVtwJCBUQ5IVrT6fIPlL98TmqNJy979F6y/S21f4AF89UQsqL6RsZtsFdBq9L
         DCdEso4ToHTvXnVzprJifSVX8VbA3ipG2+lqHh3LbTbjdIplRpyyF16RJMn//QnVCfwl
         Gj3Ilg0HtDAzeqiGceN64omzfv+md3n2TkVcvwAH010LM/hUlNoEJ2HlV5rI1g3csWeW
         RERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5f0J1I00tgVSiN9VRb+ChusZ1yvCyLAj0W1V3gjAZJo=;
        fh=OrnKDpMzEp7wbNAUpJYWlPb6BZBa4HxNRhsHT4snMn4=;
        b=k/8JsZBQYWcMYGugQKfQwkWx4Y857WfDjxiaL01GGGcofrCB/WJA+uJBrsg9FqnSsN
         JSDyKEVPD6GSexCZZba/Gd/+CBCqLOgwIQFG0MjT+BsiQn9MdoOseao04UOPKYG5+PMR
         /QEJGZvLDXe+gWj8TXefbj4/yKHDl1KBu2kYJ4rR4at2eAh/06QWjBN83ktOt5kpR+Te
         4XNLKbtDUj51uEECpHuWotaHHkqqasL7yuLoqr4ysu57u6zZeAiqMnR/JaHgMx9vggUO
         h2+Emk+WiG70fDaCqHMk/1ScXTaQo3vvaTT+YsXgSWPZc/yBHZdi77yChU2rHxrl3fSH
         +hGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XBW1oIw/";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fb20-20020ad44f14000000b00651861e9275si1677162qvb.437.2023.10.13.12.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XBW1oIw/";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5f0J1I00tgVSiN9VRb+ChusZ1yvCyLAj0W1V3gjAZJo=;
	b=XBW1oIw/2HXma+japKO+EEU1KAPU/lCtx+JW4yHdB+dz9aDC6o9zdG2akMGdY9Kil0DECG
	BYE4xD7tv3qohGhIEM8VoAdmfcaKrxQghTzWRVGlFWFV9qB886MnnKqJR6YystdZsT2LU/
	jQ7DnDrZDukh2qIcr1NvAHenxpPrio4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-eQiDZcfFPaugXpx9nL3Kew-1; Fri, 13 Oct 2023 15:09:51 -0400
X-MC-Unique: eQiDZcfFPaugXpx9nL3Kew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E0B85A5BA;
	Fri, 13 Oct 2023 19:09:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9876440C6CA0;
	Fri, 13 Oct 2023 19:09:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Ani Sinha <anisinha@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	John Snow <jsnow@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Farman <farman@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 05/25] python/machine: use socketpair() for qtest connection
Date: Fri, 13 Oct 2023 15:09:20 -0400
Message-ID: <20231013190941.3699288-6-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: EJ/h/1hEGgbI

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
index 1c46138bd0..8180d3ab01 100644
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

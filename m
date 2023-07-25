Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp8746ejb;
        Tue, 25 Jul 2023 11:05:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH266z0goAnfLiv4mU2NcgoRc+UdQDBQFjciqlvT/5ezqNEggYwTeFJxeqnWw4HpdKeAies
X-Received: by 2002:a05:620a:2916:b0:767:11b1:de09 with SMTP id m22-20020a05620a291600b0076711b1de09mr4354954qkp.4.1690308328062;
        Tue, 25 Jul 2023 11:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690308328; cv=none;
        d=google.com; s=arc-20160816;
        b=O1+BBTWui1f1dOMndzn2F3BTKmRz8tRD3caNZUNff9AB1HnEqIxdZwKbUuKwjJEOib
         x1NXOCDLSf59/QWhpfblRdo5/e1lKOROhQON5mmNtfMLwJ+LEc44i7Kt0G6YDwHWR6VI
         75ZgRIi8DWSs9micIa1U5U9tfl62KMqz7Ovys0TjTfgCae/8GF8nmvFKxR/RlG5LrL//
         RJ6h5jSDxO4XcO9uq2upNiYoCDWeYadWPPujsRxJw8Kjh9Ferx84gEe8njG/BiyDO8iT
         B7n10FjKiqSB09FSUCH9N4z3qXYJnQHyxjDIp7eiCrjpSL0KR6WZG7n/p+GxaJsGEwRC
         LHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3dCGafAZC4fFvm0cUoPwpMW44ojyHkgV3OMH9yftIuw=;
        fh=VIjqXItD7ovqYEXpyxuqPkaQsOkVw6zkSP5vf471ryI=;
        b=DWbw0KxPfyIbH/T6kM0RNawteWoTEspZo84RE44VyfGnSE5W/A2ZU9zyjM3PkzWmUj
         Q1LgVzRFxRIE0NAnG/iX2OZEr0Fg627lrOXZWjzRYB1iYK0ibUC7oyLbcKcmXoIHRK2X
         sssfPuUopvTikRtwVKDUoNUsHi6cCCcbyNftOjtlORkuCQTFx+ZOH4O829wB1G41YOaB
         ci+e7vTk8BakAyzNbgSwUDICIHXW1Z9Q3/2X0cp+kDU/EIinR+Wk7FbM3+aJhFk4NgwT
         zFZ1gqkt1PCnnAeVlpc5FxHYYtlSRljhkb9hpe1d8kZnZNq0a9HQgazWmhWUOulC58UV
         K3Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PXdjebhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25-20020a37e119000000b00761fbbb1613si6628660qkm.626.2023.07.25.11.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PXdjebhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMO3-0002uI-MU; Tue, 25 Jul 2023 14:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMO2-0002sK-91
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNw-00014g-1H
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690308226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dCGafAZC4fFvm0cUoPwpMW44ojyHkgV3OMH9yftIuw=;
 b=PXdjebhqXgIWy4uEyGkx8cBIF5upthUZ97X859QVV6DVgte1LNAW0BnEc8mLXbuoZT0COk
 WZqvCzvnX7b2i/W3I6xTt6RLAN0eaM1FIZoZh8lSeoyquq6tYGTKChh23gWlRh2yha/cwI
 +/zZ1lEu9au7Tq+NwBhe2lntKZ8PSrE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-qYXX55CzP6eu68CgZPrMyA-1; Tue, 25 Jul 2023 14:03:42 -0400
X-MC-Unique: qYXX55CzP6eu68CgZPrMyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2912E280016C;
 Tue, 25 Jul 2023 18:03:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8739A1454150;
 Tue, 25 Jul 2023 18:03:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v2 5/6] python/machine: use socketpair() for qtest connection
Date: Tue, 25 Jul 2023 14:03:36 -0400
Message-ID: <20230725180337.2937292-6-jsnow@redhat.com>
In-Reply-To: <20230725180337.2937292-1-jsnow@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qrhghWVX0Y+N

Like the QMP and console sockets, begin using socketpairs for the qtest
connection, too. After this patch, we'll be able to remove the vestigial
sock_dir argument, but that cleanup is best done in its own patch.

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


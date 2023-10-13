Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722455ejc;
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyshBoqKuAeRCAms6NVkA5erUMBWlVqDm/QEZ0xinmECOS0ZXzBUxLO3DK5+V8nVuO4IoU
X-Received: by 2002:a05:6214:398a:b0:659:abd1:8d37 with SMTP id ny10-20020a056214398a00b00659abd18d37mr26481313qvb.4.1697224193358;
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224193; cv=none;
        d=google.com; s=arc-20160816;
        b=H514WkleWbPalj1pRhzotX0tiRPTiHI7FjVBZ4R5ysYZF6w5Aq4dJTxpRrsts/8FnT
         MMHc8KAug4JmvhrouoQwpZSI/6jVpjvGDG+LdU3ZzBktdSDh091QCqtluuYpM96HbXBn
         uB77RN58qKJWzT2x2dcZBVDwhjxEVpREImZz8RkhLGER0GPUT7RfWunARsV8mEHzKMDo
         xVkaT87D//3rjphtdDd+9Vmn9YyUAmVU/cMl3w3kcbpM93TyP0uQMLlrv8XggwlMNuYD
         Ssmc6zYi6bFqM+KMkSqGE/x13CSYu/jI94Oo1BPgdrJnCL1PRI/vQKtWgHsn40zCOohP
         USCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CY2ZzbNsrWHODBZH2uuGMmWYkeDgboyCelntd6RYtQ8=;
        fh=OrnKDpMzEp7wbNAUpJYWlPb6BZBa4HxNRhsHT4snMn4=;
        b=EuKAvC4zl3bJUSMuRq4WQvdniG5OjwnOEOMsaU7XMkbI8M6T3Re2F6ncFQW/dxluqu
         qulgy3e4v3DIDMFnQQ0dNgCZszCFF1urfihpGTQgTZFkAR/2zkNz9ya/tNS3FyPcTCXZ
         zaNMSETH9H09B+dXHdAThpXCVpsnWnj3XLIo4D2nZKKS1DsPG4LtosOaAyHGcMCuO0kn
         9T0v4kXrP/N8DuMsZnZCyUh9lZ7WdbhOQP9oofc7omiAcF2EWPCMnvWMLbfIOwuo8AaX
         abHo58gRITYt1uMJk7BbD7s11UY6LNqpUuwNRh4QoNCDvNbxExjAlab3t5MxiTlWsIzi
         U5XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q07yM9ts;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o14-20020a05620a2a0e00b007742a7ffa0csi1665647qkp.155.2023.10.13.12.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q07yM9ts;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CY2ZzbNsrWHODBZH2uuGMmWYkeDgboyCelntd6RYtQ8=;
	b=Q07yM9ts/5zIEL7agoPwyRgheP50dAylXremsILt1B/H8pNW7nxO30OHdpQnzBuH4l65gR
	vS8ixRg6h977AspUVH6wRfB5VOSHyCDKwYqpu1GQ3G5bV8H1wW0xypNlnlqagWh6yPx7yO
	yM8uROf0p8+XwRjeP9SJmJvMrdMRnT4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-IxGOvmAON-GYZM5AE8Y25A-1; Fri, 13 Oct 2023 15:09:49 -0400
X-MC-Unique: IxGOvmAON-GYZM5AE8Y25A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 896CD1C00D1A;
	Fri, 13 Oct 2023 19:09:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D53340C6CA2;
	Fri, 13 Oct 2023 19:09:47 +0000 (UTC)
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
Subject: [PULL 04/25] python/machine: use socketpair() for console connections
Date: Fri, 13 Oct 2023 15:09:19 -0400
Message-ID: <20231013190941.3699288-5-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: PKO/iO8yqxGM

Create a socketpair for the console output. This should help eliminate
race conditions around console text early in the boot process that might
otherwise have been dropped on the floor before being able to connect to
QEMU under "server,nowait".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230928044943.849073-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index e26109e6f0..4156b8cf7d 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -159,6 +159,8 @@ def __init__(self,
 
         self._name = name or f"{id(self):x}"
         self._sock_pair: Optional[Tuple[socket.socket, socket.socket]] = None
+        self._cons_sock_pair: Optional[
+            Tuple[socket.socket, socket.socket]] = None
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
@@ -316,8 +318,9 @@ def _base_args(self) -> List[str]:
         for _ in range(self._console_index):
             args.extend(['-serial', 'null'])
         if self._console_set:
-            chardev = ('socket,id=console,path=%s,server=on,wait=off' %
-                       self._console_address)
+            assert self._cons_sock_pair is not None
+            fd = self._cons_sock_pair[0].fileno()
+            chardev = f"socket,id=console,fd={fd}"
             args.extend(['-chardev', chardev])
             if self._console_device_type is None:
                 args.extend(['-serial', 'chardev:console'])
@@ -352,6 +355,10 @@ def _pre_launch(self) -> None:
                 nickname=self._name
             )
 
+        if self._console_set:
+            self._cons_sock_pair = socket.socketpair()
+            os.set_inheritable(self._cons_sock_pair[0].fileno(), True)
+
         # NOTE: Make sure any opened resources are *definitely* freed in
         # _post_shutdown()!
         # pylint: disable=consider-using-with
@@ -369,6 +376,9 @@ def _pre_launch(self) -> None:
     def _post_launch(self) -> None:
         if self._sock_pair:
             self._sock_pair[0].close()
+        if self._cons_sock_pair:
+            self._cons_sock_pair[0].close()
+
         if self._qmp_connection:
             if self._sock_pair:
                 self._qmp.connect()
@@ -524,6 +534,11 @@ def _early_cleanup(self) -> None:
             self._console_socket.close()
             self._console_socket = None
 
+        if self._cons_sock_pair:
+            self._cons_sock_pair[0].close()
+            self._cons_sock_pair[1].close()
+            self._cons_sock_pair = None
+
     def _hard_shutdown(self) -> None:
         """
         Perform early cleanup, kill the VM, and wait for it to terminate.
@@ -885,10 +900,19 @@ def console_socket(self) -> socket.socket:
         """
         if self._console_socket is None:
             LOG.debug("Opening console socket")
+            if not self._console_set:
+                raise QEMUMachineError(
+                    "Attempt to access console socket with no connection")
+            assert self._cons_sock_pair is not None
+            # os.dup() is used here for sock_fd because otherwise we'd
+            # have two rich python socket objects that would each try to
+            # close the same underlying fd when either one gets garbage
+            # collected.
             self._console_socket = console_socket.ConsoleSocket(
-                self._console_address,
+                sock_fd=os.dup(self._cons_sock_pair[1].fileno()),
                 file=self._console_log_path,
                 drain=self._drain_console)
+            self._cons_sock_pair[1].close()
         return self._console_socket
 
     @property
-- 
2.41.0

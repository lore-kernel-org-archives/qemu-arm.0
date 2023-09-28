Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2305911ejc;
        Wed, 27 Sep 2023 21:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqTWk/Cu9mt2HNXdfRmx59J8StvyNfdTxJewSUsSxTJ8wwhkN966DHxWmz6StYduwNLPa2
X-Received: by 2002:a05:620a:2910:b0:774:24c9:261e with SMTP id m16-20020a05620a291000b0077424c9261emr187591qkp.67.1695876696592;
        Wed, 27 Sep 2023 21:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695876696; cv=none;
        d=google.com; s=arc-20160816;
        b=rP/KIf/S38q2c2ss16qauP363nuEOboSm0K+fajXyz7gHw+clqt9ZoNvmJgSFxdYqD
         vMX48IAd46nso2voqVJXBZezk8pzVJ1pXHByodJRPJtDwIjfdg8vbAHOxDbSHfDvdUgk
         83PqG6Wy8UEmPNq5yrz1ikV0sYgk+PXaqwELW+hmabFIFk+d+0RpcPXSVhYq0fun6P6u
         24lZRDfNo17Gz4vpphdErSxPVax33sXmyk3TbqOZfOO19a6goKIs13EgaH+dH2YyIfAv
         E7zqzYBtHwVPprvC5zXjV+8oSzSjRIpWrUgXvgHlJtPVAYZDAIFt7iZn4tCMQsHUpgQz
         QWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3O/UX3IJX3ftQTm9VfwmH6srYggBUXaw1R2A+RoY+rg=;
        fh=SlnpYl/apPGobcNY8vCsr8ux0b+PCiuAYFwDQav0GZQ=;
        b=A0MhRHZNetH1sbVguLFxpirTNcVIEwubdNNENSSuxNTMDFACzpNNFzEYjSFQXjzvm5
         McEOmgukFeO3nz9Dv+Cuf4/3yNOpt1cP7K1Eu+++ol51LGSrh8P5EfNtjA4uz2k6GrxQ
         r7QIIJb9pOG9Kb7PtkUANr3Xah5k6WNeDEqVTLSk9txUm/samdYzd7v1NwyZWsSGCF1D
         gPdM5OTGau3qz9Yd2C9aOSjv5QbgBtSTnp4hQZuKKzGYLDEzaiGTrZezXE0d4blt0nXl
         n3nARnNHoLIz4F+GBSO2q8XeKEBNnv+FUobQfsW9m0zq9ox8HyHJKUlLEPn1lbQGOtjF
         FwaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MvJhrVfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020a05620a07f900b007725f230872si8459153qkk.268.2023.09.27.21.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 21:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MvJhrVfD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qliyj-0002Ry-7t; Thu, 28 Sep 2023 00:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qliyd-0002Ps-Ib
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:50:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qliyH-0006h9-GW
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 00:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695876591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3O/UX3IJX3ftQTm9VfwmH6srYggBUXaw1R2A+RoY+rg=;
 b=MvJhrVfDOsFwjcZGGk+DbbpSVlshiWsNer84DJwrFoR3w+lNXUNEaSSQptmwZjHXV1Y5lb
 uvCT5Go9HuVL7JdfASrhsCaenLPttrvBfgC5kiAY/vejCJjgM9fK0wynPGlI1vnO59L3cp
 ut06WSQv0+VZP3pZp+/79df6k0SBmPE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-oEIkfVumNtOl9-9rl1TSAQ-1; Thu, 28 Sep 2023 00:49:48 -0400
X-MC-Unique: oEIkfVumNtOl9-9rl1TSAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7643F3C108DA;
 Thu, 28 Sep 2023 04:49:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE4F51054FC1;
 Thu, 28 Sep 2023 04:49:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Daniel Berrange <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 4/6] python/machine: use socketpair() for console
 connections
Date: Thu, 28 Sep 2023 00:49:41 -0400
Message-ID: <20230928044943.849073-5-jsnow@redhat.com>
In-Reply-To: <20230928044943.849073-1-jsnow@redhat.com>
References: <20230928044943.849073-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: LcmrBQuIu9au

Create a socketpair for the console output. This should help eliminate
race conditions around console text early in the boot process that might
otherwise have been dropped on the floor before being able to connect to
QEMU under "server,nowait".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/machine/machine.py | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index e26109e6f0e..4156b8cf7d4 100644
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


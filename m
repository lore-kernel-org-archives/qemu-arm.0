Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891680ejb;
        Wed, 4 Oct 2023 12:46:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwGUKEz+ncFBjAB+n2QJwRb9DrUcvW9lSDq9dfyNG5EdO+7g3wXwuqs0OFhfIMoJz2rBDm
X-Received: by 2002:a05:6870:d38a:b0:1be:f7d9:c0e2 with SMTP id k10-20020a056870d38a00b001bef7d9c0e2mr3619587oag.38.1696448785523;
        Wed, 04 Oct 2023 12:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448785; cv=none;
        d=google.com; s=arc-20160816;
        b=zdX/GfsiD41XDjsRorV0yGfcRF9431LvrsR2GGLzzQiXI4J6Icg9Pk/zcJeEYcfi4l
         mZsPWCi9rPNJMY8A0WhFzp6s9zDEIjCK6Qw+jo868/z/X8+hj4uuXj0NEkuqOCXXFdkS
         IzcNBXivf4kQpvrIK6qQZXKk78HVXAQY+fJM7r64FeyL0t9xsEDLa5RWcPqNRWi7eKg5
         Jg+INkQAioLeHKWnYv2xSIX6z58z3LagYEPgNOdlCHIwW0RkDHijQIbyiscOxn01a+Cw
         a9Sq+eWllLgnkKEi+E8LNaqRu9XtF9sHAP38jISiGlA+wvEzpAU+/e2HUdPTtWmkYvqV
         yepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mVjnzkFb6jqe186MzH7ifkiBtaZPoadf/dEtoPMNUEY=;
        fh=YYcUncbuZ8zA1+PNe3n/41UyzzQQmqdTXlaMDrLfUHg=;
        b=AD98v3VmXtWY3jGOKRiDSkdM9riTRbZQCGjxURYSUgGADzE6jdwaJ0VtZOSYhPH1mH
         CfCusjWah/02HqM7TJS9KlI1eeemC0wMCv1ihW/lUZfZNZI2+NDbOORvcYb0S7V0ci7P
         oUPPOR5bG06Chh4m39ledZwXmfObn6l2A2bhKtgysd0qUK5uqp2ScKInaS06idjwBLqa
         44uZQZnDnhBptItnXyAO2YfyEbVV1rzWPTLe8MyVqlbdzBHv21DdHv2rizFwuCrkzrhW
         quK0wH6l39HE+n1Gi2BYzvZKoCHTfHXz/UBByrnBJw2w59D0AQYuuFfJIoSkKSVURDZ1
         V1BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KvXyu/bO";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s6-20020a0cdc06000000b006687bc2d63fsi1765044qvk.425.2023.10.04.12.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KvXyu/bO";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVjnzkFb6jqe186MzH7ifkiBtaZPoadf/dEtoPMNUEY=;
	b=KvXyu/bO8T2Dr79ptMb8H8eB6/ZHdOJQ4Uqrwo1ciOf4wVlpq3UXL9uf0DYuoi7dpiGSxU
	ivvngcJfhbwxcSMnd2to+tabtL234C00n+yBFWsDInlQ67f6zOg/iNqmarDcLpKiUrazSP
	Kzp+V2LI1XC046x1YmSqAslRo888Hmc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510--1mErR4kPPGo29Qvissxxg-1; Wed, 04 Oct 2023 15:46:21 -0400
X-MC-Unique: -1mErR4kPPGo29Qvissxxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AC713C0E660;
	Wed,  4 Oct 2023 19:46:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B73E21054FC2;
	Wed,  4 Oct 2023 19:46:19 +0000 (UTC)
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
Subject: [PULL 5/9] python/machine: use socketpair() for console connections
Date: Wed,  4 Oct 2023 15:46:09 -0400
Message-ID: <20231004194613.2900323-6-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: XFeOLlML8YSH

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

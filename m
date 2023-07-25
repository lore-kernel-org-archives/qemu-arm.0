Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp8512ejb;
        Tue, 25 Jul 2023 11:05:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH37n4geLVU3zgA2hB1aVG0M9qZKm2ByzY7Dp2EaHChapu21FRbb2vdD9qz5pgjeLAYJp+K
X-Received: by 2002:a05:622a:1d0:b0:405:3799:d28a with SMTP id t16-20020a05622a01d000b004053799d28amr4830059qtw.60.1690308308938;
        Tue, 25 Jul 2023 11:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690308308; cv=none;
        d=google.com; s=arc-20160816;
        b=qtEU1xdUf1xTCKdULVNrB0UIpHPsYYVbBE2MT3DRmOfbgRPiMzemM9tMov2X9D8LAN
         wMa0sFISVuaDw1Fk3IQNlejdsXh+L5oehOiY21dvQNbiKTGAzG/jbc83ZR9WraGt1uJR
         /nMt65etbD/Zt+RlcJcIQ88sd+F1ekwUwvkDlPrF5Z3SBaAgVZyiiuWKVjdahEOfDfms
         sSowYm1FWRzMu0zKmBNpoOlXz4bzPk/gKy8iBIDiZY001IZNOILN7iolKQB/Ys4WgyRc
         EzrDyImHt0+d96AWWa/RB4JDSIFNL3Q4hBTrUqxvRHCTCRIECgCK6Q2ZcI7s4+J1UdPh
         I6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xUvOqbeDQTYh8S6UQ0zMhCATK2YD+KgKhLBUJIECPEw=;
        fh=VIjqXItD7ovqYEXpyxuqPkaQsOkVw6zkSP5vf471ryI=;
        b=GLCBIm38/KGfJh2DrXl0A8d/8uUFGosNytO/uZoqnEft65FuRA9CGtVNTKLz0E+sZx
         KR4Koi0rfQGgpAYzPQEreehsg92irmeUUwkfWr19ywWtGhB37imDaBWr7ypVOPH5xHIG
         KNOw2DXCz3sx1cg80C9YSX/JqrkgJte+2RHZqgS6dVaHX9xJmlg8n/NA1QOshCaeQVo5
         4xQHE2wiomEmACzkOfdsxpmuKAVv8fXjgq8N3IVq2kbmiuw27iJaJL8ptUcC5gxtXYbd
         8T0Vk/2jO/SZZGbLmSqmdPd293q3Q7/6I6Ar0Pl/Jxi4LkE5QPqjlotCtVMPJM1TBUc6
         wA6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fx1tIdqq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a05622a024300b004042849cfb3si6949145qtx.262.2023.07.25.11.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fx1tIdqq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOMO3-0002tI-0K; Tue, 25 Jul 2023 14:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMO2-0002s8-4E
 for qemu-devel@nongnu.org; Tue, 25 Jul 2023 14:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNw-00014j-2P
 for qemu-devel@nongnu.org; Tue, 25 Jul 2023 14:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690308226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUvOqbeDQTYh8S6UQ0zMhCATK2YD+KgKhLBUJIECPEw=;
 b=Fx1tIdqqzTOCq1T+MWBFvC3gwWx3/lCg3cwBNWUeAKb1/+Hr5HX1C708mrIz7VRuylLGul
 h0/uhR9jQWYmwtHfhEaV9b6PMg7TwcqSYxYJKTu6v5/62VrIdTOYw9WVXIUSDjoSzUq+8e
 q1iJ2d6M6oNfjEm7RhpUpAwP9KSGYcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-7TwATzIhPTqUNJZjv0xoVQ-1; Tue, 25 Jul 2023 14:03:42 -0400
X-MC-Unique: 7TwATzIhPTqUNJZjv0xoVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76717802666;
 Tue, 25 Jul 2023 18:03:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D64F51454150;
 Tue, 25 Jul 2023 18:03:40 +0000 (UTC)
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
Subject: [PATCH v2 4/6] python/machine: use socketpair() for console
 connections
Date: Tue, 25 Jul 2023 14:03:35 -0400
Message-ID: <20230725180337.2937292-5-jsnow@redhat.com>
In-Reply-To: <20230725180337.2937292-1-jsnow@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KyeAzw5dhAUK

Create a socketpair for the console output. This should help eliminate
race conditions around console text early in the boot process that might
otherwise have been dropped on the floor before being able to connect to
QEMU under "server,nowait".

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 26f0fb8a81..09f214c95c 100644
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
@@ -315,8 +317,9 @@ def _base_args(self) -> List[str]:
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
@@ -351,6 +354,10 @@ def _pre_launch(self) -> None:
                 nickname=self._name
             )
 
+        if self._console_set:
+            self._cons_sock_pair = socket.socketpair()
+            os.set_inheritable(self._cons_sock_pair[0].fileno(), True)
+
         # NOTE: Make sure any opened resources are *definitely* freed in
         # _post_shutdown()!
         # pylint: disable=consider-using-with
@@ -368,6 +375,9 @@ def _pre_launch(self) -> None:
     def _post_launch(self) -> None:
         if self._sock_pair:
             self._sock_pair[0].close()
+        if self._cons_sock_pair:
+            self._cons_sock_pair[0].close()
+
         if self._qmp_connection:
             if self._sock_pair:
                 self._qmp.connect()
@@ -518,6 +528,11 @@ def _early_cleanup(self) -> None:
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
@@ -878,10 +893,19 @@ def console_socket(self) -> socket.socket:
         Returns a socket connected to the console
         """
         if self._console_socket is None:
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


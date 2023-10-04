Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2891687ejb;
        Wed, 4 Oct 2023 12:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE//gAxlodblTKo5+tMHnx+FfgLyAvmovHsNAxndTArpDlAe11k9dlYc+voxyw6dUgdrydn
X-Received: by 2002:ac8:7e8e:0:b0:419:6391:6bee with SMTP id w14-20020ac87e8e000000b0041963916beemr3523441qtj.67.1696448786455;
        Wed, 04 Oct 2023 12:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696448786; cv=none;
        d=google.com; s=arc-20160816;
        b=AYbxkkZ1IRBobLuTFKxaY564Hr8tzHY6sKu20jzgBZANrvrrSvoawFG5v5mEwrZyEh
         Lj256NmFriCGKP2m3aAi5mYHDAhZrDTrRraGgPp/FaVEpYowtDD/vQJYNNkU1D5EwXxN
         qb1rc05rfQwUnm2CDzhXLFSEXvr0t+gf3qDvus3oOnxemjqT52QdGjngv4hFKn7xnqGH
         2OXJEiOVfWDT26y5ad1p9jxaDK+E0FvWisbO7Bn594A2Va0T6G3z7ty5QrJYfaWRxY9V
         OteBfYwtpxS/0XBBkkwwWiF9Qm0Yx1oFVntMKOYR939Fnkm4ANydHUQxEmxXb1i18EJJ
         XtTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jTZZv+B4GQU8V204gzdoSm/m/cM8SbdIuVk0hYYZBR8=;
        fh=YYcUncbuZ8zA1+PNe3n/41UyzzQQmqdTXlaMDrLfUHg=;
        b=Fa+VQ/L+G7vcEGnHINJjC8qqcCm+Gn6PyrasyYJeS+DZ/sv6GctgbLkszKamUMEvv6
         i03pLepn0POmNNuwIwhH3rz+WXSOVQPd07a43zmihcouAUrbj1YOb1p8UB+vMjka7/oz
         e4i1QPI+dKM5v2/QO+JK1IFu2pIRRSmNQMec4YjVRJOsHM0QkhuyL4V956bP1DMzbBAV
         oyfBUeR7x/DvwNhfXnZVA44jEhvdKjmmyUSmPcCTXTFVwVWlZ5ttsvJdZ/Y+a59ThHWr
         nmY1WuICT7D+8NZdMqMg3Rn+V7rJ4VW3JRSTE9cJERGQULPfOSmaaHU0TQ51xo+im6wL
         ogaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E1TwrYdX;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l9-20020a05622a174900b00403b84a6bbasi1774152qtk.385.2023.10.04.12.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E1TwrYdX;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696448785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTZZv+B4GQU8V204gzdoSm/m/cM8SbdIuVk0hYYZBR8=;
	b=E1TwrYdXpLTRoyWHaeo1PPf1ZvTF50evkqxJYoKdy5hRc9jS5SJfVCUFmAo2+xU1FUrS8Y
	jiP3bwDcXp8nv81u6ojuvvmN5BO43yL39/oZhIOADueQ5l1a6j3+azSUBiTrPUEkPC8PoN
	9MhkGDH14crN6CDO6FMWj2nGBrFSkXA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-r49WVZUMPKebRhYbeWxxqA-1; Wed, 04 Oct 2023 15:46:21 -0400
X-MC-Unique: r49WVZUMPKebRhYbeWxxqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A20F881D786;
	Wed,  4 Oct 2023 19:46:19 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C152F1054FC1;
	Wed,  4 Oct 2023 19:46:18 +0000 (UTC)
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
Subject: [PULL 4/9] python/console_socket: accept existing FD in initializer
Date: Wed,  4 Oct 2023 15:46:08 -0400
Message-ID: <20231004194613.2900323-5-jsnow@redhat.com>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: YCRXtKJ2s3un

Useful if we want to use ConsoleSocket() for a socket created by
socketpair().

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230928044943.849073-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/console_socket.py | 29 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machine/console_socket.py
index 4e28ba9bb23..0a4e09ffc73 100644
--- a/python/qemu/machine/console_socket.py
+++ b/python/qemu/machine/console_socket.py
@@ -24,19 +24,32 @@ class ConsoleSocket(socket.socket):
     """
     ConsoleSocket represents a socket attached to a char device.
 
-    Optionally (if drain==True), drains the socket and places the bytes
-    into an in memory buffer for later processing.
-
-    Optionally a file path can be passed in and we will also
-    dump the characters to this file for debugging purposes.
+    :param address: An AF_UNIX path or address.
+    :param sock_fd: Optionally, an existing socket file descriptor.
+                    One of address or sock_fd must be specified.
+    :param file: Optionally, a filename to log to.
+    :param drain: Optionally, drains the socket and places the bytes
+                  into an in memory buffer for later processing.
     """
-    def __init__(self, address: str, file: Optional[str] = None,
+    def __init__(self,
+                 address: Optional[str] = None,
+                 sock_fd: Optional[int] = None,
+                 file: Optional[str] = None,
                  drain: bool = False):
+        if address is None and sock_fd is None:
+            raise ValueError("one of 'address' or 'sock_fd' must be specified")
+        if address is not None and sock_fd is not None:
+            raise ValueError("can't specify both 'address' and 'sock_fd'")
+
         self._recv_timeout_sec = 300.0
         self._sleep_time = 0.5
         self._buffer: Deque[int] = deque()
-        socket.socket.__init__(self, socket.AF_UNIX, socket.SOCK_STREAM)
-        self.connect(address)
+        if address is not None:
+            socket.socket.__init__(self, socket.AF_UNIX, socket.SOCK_STREAM)
+            self.connect(address)
+        else:
+            assert sock_fd is not None
+            socket.socket.__init__(self, fileno=sock_fd)
         self._logfile = None
         if file:
             # pylint: disable=consider-using-with
-- 
2.41.0

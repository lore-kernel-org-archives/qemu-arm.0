Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1722449ejc;
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0eoM1MgPCdxxsCTAYvONVYYa2Ob4rKmBPVPA6jR/Vj13+PWyHRxvPd73aqBZkT7JmeNKi
X-Received: by 2002:a05:622a:82:b0:417:a74f:69b5 with SMTP id o2-20020a05622a008200b00417a74f69b5mr37818600qtw.33.1697224193050;
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697224193; cv=none;
        d=google.com; s=arc-20160816;
        b=FYdN2NDXPgvb1qTobcc9oRmlm+VNRZD47rNRbC+yVMOBSpFdsLnW71eI0f6k/PsK2B
         u3wGbeeDDB+7eXz/cFcPfAvlTkIkqY23YuEGUGprBRE/8blGQiONFiGl+e3CBd2zDLRw
         2Dw3g1AGVkqgCaJkpW9z/2hHrdIByMPQeyK8Wl4+zW6lHGmIq/VV7DJSxDZ0/eLyPecA
         aVnNG00QfVOVamSWKl2UHI+nwe9FPhHeCdrEQ9R0mRvoULBLuCHADPm7Z1/C8XcdI0R6
         QgJI9ox7ivPhVTnsEtHcvb9GbUMyTzLtIUXmMyDkVq3ptXwCMXlqkK1/BjFssQ25gBP6
         2v8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PbwImhP6iyusgvGhiC7g0PBcTytQaaVCsTqxMoRHC2A=;
        fh=OrnKDpMzEp7wbNAUpJYWlPb6BZBa4HxNRhsHT4snMn4=;
        b=BziDbZLSPXXez/W0dI6b7zoNXpTGiHD9Fhf2oEmvnhHo74PSnuMtFNyrhGXKDhDZos
         tja9x2P/xu+TolbA2nFcHnrqe75FelJGQrnB3Sra/9HtDtQohDBQ8hzmeKxI0hRgImN0
         bpu++4zEHHH3zUy0OJMRxgAb+xlCyXNbuR+u/ErRJglGVEoy8TuiMqS9YREpQO8uGAzh
         JWjgjBcy1FAz4SK05bqqFTp3UEtgBx5pGInC/6mpBJDXEu+7L1yHMeFkYq4GaAx5cjA4
         ohgWKFiLmpbEPWi++ibn+iCyc9T4SQ8xda+TAsMVWGTDan/EKaz8P6B2whGLAUuGe2J0
         S12g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IQlYPiRj;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d8-20020a05622a15c800b00417ae509fa2si1687870qty.317.2023.10.13.12.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 12:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IQlYPiRj;
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697224192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbwImhP6iyusgvGhiC7g0PBcTytQaaVCsTqxMoRHC2A=;
	b=IQlYPiRjRkFFL2wx+LicnPq09ufby7Iil+BEfVTSokCW93uFmKkRrAlyzjIkhL4sT1EF+7
	1qXE3m+bs7mTJonwhCbV2n8qml5V2t3jmPxGMS9vFhdaSoLOXKqwiNaOOm4nvRCQu4XSKd
	NpAkcYrOyLRxItH4gucma2NUGHqD8lA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-g8qbn04cMNeONAs9Thz74A-1; Fri, 13 Oct 2023 15:09:48 -0400
X-MC-Unique: g8qbn04cMNeONAs9Thz74A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F18F85A5BF;
	Fri, 13 Oct 2023 19:09:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07F9F40C6F79;
	Fri, 13 Oct 2023 19:09:46 +0000 (UTC)
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
Subject: [PULL 03/25] python/console_socket: accept existing FD in initializer
Date: Fri, 13 Oct 2023 15:09:18 -0400
Message-ID: <20231013190941.3699288-4-jsnow@redhat.com>
In-Reply-To: <20231013190941.3699288-1-jsnow@redhat.com>
References: <20231013190941.3699288-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-TUID: NyBuWzJbUNPB

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
index 4e28ba9bb2..0a4e09ffc7 100644
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

Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp8466ejb;
        Tue, 25 Jul 2023 11:05:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFVHHH7qehSMW2ZBGI0/t7iIHR40qBEq8qn5ndaGBaYPC45LaqcoMekJqSx1TMepMcxqs26
X-Received: by 2002:a05:622a:1741:b0:403:b0e7:8e22 with SMTP id l1-20020a05622a174100b00403b0e78e22mr4411804qtk.59.1690308305305;
        Tue, 25 Jul 2023 11:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690308305; cv=none;
        d=google.com; s=arc-20160816;
        b=NJ5j11QN8C6uPTTdwriSKeHqtrBl/eiEVicj/s77Ih2pv2df2g5MmHKWdIxBx/dDOU
         H9B80H0EZE1q0SpFkM3JsXsGy0g62UVRnBGyr8/HZybC4+MxqO1fwqDba/0Zl8/Uhwl7
         S1VMohaqmFAMHyWgiGvI6kVEPmmP1jwKxz/nZQ8DorwbZThICgk6SNKeIcd0qLZJ49Qp
         o46bHQYYi3LHgZx8cLcwXiL+Kr2o6qEUwI7gceEgrpSUXzGQZOan9AVLQmIihxkVKzAQ
         xTqiZtvoaC8bDKKsuysWf9OfeEfPW0pQ7w+aO6y8AB/1d+1odEFNUZMR+oDLdeJEkYhb
         8WcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8VMLovqoYzZHjKkEoyIvN1jmOhnMPX7MkDUcSq33qDs=;
        fh=VIjqXItD7ovqYEXpyxuqPkaQsOkVw6zkSP5vf471ryI=;
        b=Ut1RaLeiMhJ4Cmy9PH+tTIfylRG9OG2r4fo42mrOKlFmA6E5QSBX7g5rTfzJaNS4Xl
         r2GFKO8xBdGyJ0zv3JctnxDhkh+ceeM0jgCtZ+HgZoGU5Wu7uO97/jod9v0RPtSmQovy
         5WWmHX4ZP8VJgBBl7A1muz1R7/yvf5Wl2Y2NrEjGI6ifA1VPVGuXbcdtOHNH52qHaaTJ
         zl1Qww7uicrb9w0+5/SUlV4Bz0d7TxMPkNsO4YTCnAhSBu73fHVQoeX0dVNfkiCERnpy
         D8zkWOmVPLtmYvtz3CV1/0ZpChW3s+VnJLfdWcbixwXo2Rn9gcHk+biRCM0ab7qCGhLL
         QrXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PT1gGSN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020a05622a065100b003f38d565188si6877558qtb.654.2023.07.25.11.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 11:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PT1gGSN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOMNy-0002iR-Vd; Tue, 25 Jul 2023 14:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNx-0002hi-Oj
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1qOMNu-00013f-0k
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 14:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690308225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VMLovqoYzZHjKkEoyIvN1jmOhnMPX7MkDUcSq33qDs=;
 b=PT1gGSN2wxdAY2cCCwirEFxnaGEiSzrkjags8vUObLwPOc7K/lPXyGto2QEBwOx1fGCYV5
 5BGGPK/KBQO3wq9+NJcTuTfzMpLG51TMZ8SoRrBBmskBixg//WpyUmc5zzww6exPckD63j
 X3264vNCJ47vgNUCKaZSbq4JcpEK8WI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-aWJQLU-tOsaWKLsN1x6UYw-1; Tue, 25 Jul 2023 14:03:41 -0400
X-MC-Unique: aWJQLU-tOsaWKLsN1x6UYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8D632800171;
 Tue, 25 Jul 2023 18:03:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 316261454150;
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
Subject: [PATCH v2 3/6] python/console_socket: accept existing FD in
 initializer
Date: Tue, 25 Jul 2023 14:03:34 -0400
Message-ID: <20230725180337.2937292-4-jsnow@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oyGPqI/ziiqr

Useful if we want to use ConsoleSocket() for a socket created by
socketpair().

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


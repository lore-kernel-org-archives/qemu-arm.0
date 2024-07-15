Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2391575nji;
        Mon, 15 Jul 2024 10:33:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIXT6S/3REDbRuK9vtbhP6ubAKKN6eylfoEK9LW/khs9+MTF3Bapq9VnWhJ7JlWZw03hNa2B4iv5PEXuBAxbN2dq6fZP0X
X-Google-Smtp-Source: AGHT+IG2/2AwTAL0f46iEgMawLTBwGKHq//Q6mMDqsWQc6u7OokBcFIJFQkVh0wZERm8OkxprY3w
X-Received: by 2002:a05:620a:172b:b0:79f:f6:1a78 with SMTP id af79cd13be357-7a179b1ef1fmr98188785a.15.1721064784665;
        Mon, 15 Jul 2024 10:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721064784; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIFuH437gO1yvqvAot/pIo4QAFOI94Q/6VcrRZCk6R0pYooQBSIBQGETplt/zUjXzB
         7eEnU2vaxzqa+16yFG8PLot6ear0dor/gEc4vZzIevk5jLcHLwyckisZDv+JEfq7Ydh/
         46Sh/mF3vlYvdpSKp5r/Uc7AQ4+ENB6IloNiZ3vUR9xkSSHPUMdwFWZ9RTIjrNMRCkM8
         8VpyG6RU2QMkySH0Cn0TiQ/L7OXDOMDKEbzzdiQKOnGVI+HtQiPu09TcGx5CMTBCntMW
         Qyq2gz0nXyM8huXNP5B4P2XTGM8Q4YoVsK7Ck3p7j5N6M18kP/jIQ285u/JXobVFMiAG
         1STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zU1Ua8p1SwDv1GYBbSZcCZAr9MlTqOjEfpNh5V0piDQ=;
        fh=Vh4aLTjuyylyycFlCkrZ7Ouz37ZrS6wbH/qgUthxXT8=;
        b=ib+Ws1B3Tn+ZC+6jIOs5/E+3QPMItGg7zHDYJoo4yGAhOcvHtYmaWgbf+RgsXEad64
         ik62BsLvRv1C13590ScJ4h1WoLUV11nMpnzGoozGOs0RQEa5AmgF0RwLEop7ruLnmiXw
         D8n5gllDsD/i+GKmi7HqiTMgf1UBwHCV45DNmf3j++PhHzrAcbIxDdMSAOuVDzOG33Vq
         2LWpg/fPM61jar/4Ukl+TukpOmAfHGoYuxqCkGcRCn7DfPq4Yc+AQx7MZH02VNG98g4z
         hXX41i0tcnt0gETpTDhbdktSITeqPWa41HV/kXibiZj8Z+qIjNmx2otK1lHxjQ5xSXxL
         NInA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Sy5Al7t/";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <jsnow@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c6a156si567919685a.530.2024.07.15.10.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:33:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Sy5Al7t/";
       spf=pass (google.com: domain of jsnow@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=jsnow@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721064784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zU1Ua8p1SwDv1GYBbSZcCZAr9MlTqOjEfpNh5V0piDQ=;
	b=Sy5Al7t/3GKc+CZJQujKtfw5aIiBtEKaXzVvcQNbdym7TXzTbg6ILVOk08up1U030LCGA+
	Kv6W6vt1CGpQuDtnUTflotiIy0iL9OomRdRSy2ceinlJw6lX8cm2XWdYn5co4+fxkKqZsO
	YSGCSy5DoBYsM6lwYdo/i2mkCf18ARQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-cQd-qIWDOpeEsVAvQHwYsg-1; Mon,
 15 Jul 2024 13:33:02 -0400
X-MC-Unique: cQd-qIWDOpeEsVAvQHwYsg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E3461955D50;
	Mon, 15 Jul 2024 17:32:58 +0000 (UTC)
Received: from scv.localdomain (unknown [10.22.65.127])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9684B1955D44;
	Mon, 15 Jul 2024 17:32:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Leonardo Bras <leobras@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Michael Roth <michael.roth@amd.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>
Subject: [PULL 1/6] python: linter changes for pylint 3.x
Date: Mon, 15 Jul 2024 13:32:36 -0400
Message-ID: <20240715173241.572048-2-jsnow@redhat.com>
In-Reply-To: <20240715173241.572048-1-jsnow@redhat.com>
References: <20240715173241.572048-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: VxKwd8+01hzq

New bleeding edge versions, new nits to iron out. This addresses the
'check-python-tox' optional GitLab test, while 'check-python-minreqs'
saw no regressions, since it's frozen on an older version of pylint.

Fixes:
qemu/machine/machine.py:345:52: E0606: Possibly using variable 'sock' before assignment (possibly-used-before-assignment)
qemu/utils/qemu_ga_client.py:168:4: R1711: Useless return at end of function or method (useless-return)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20240626232230.408004-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py      | 1 +
 python/qemu/utils/qemu_ga_client.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index f648f6af451..ebb58d5b68c 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -335,6 +335,7 @@ def binary(self) -> str:
 
     def _pre_launch(self) -> None:
         if self._qmp_set:
+            sock = None
             if self._monitor_address is None:
                 self._sock_pair = socket.socketpair()
                 os.set_inheritable(self._sock_pair[0].fileno(), True)
diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
index 9a665e6e990..cf0fcf9a8bb 100644
--- a/python/qemu/utils/qemu_ga_client.py
+++ b/python/qemu/utils/qemu_ga_client.py
@@ -174,7 +174,7 @@ def suspend(self, mode: str) -> None:
             # On error exception will raise
         except asyncio.TimeoutError:
             # On success command will timed out
-            return
+            pass
 
     def shutdown(self, mode: str = 'powerdown') -> None:
         if mode not in ['powerdown', 'halt', 'reboot']:
-- 
2.45.0

Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027045qvs;
        Tue, 13 Jul 2021 14:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmqrsKwx+2KgxGSF0PaRvL5a2aTkkTuf+ZK7danE8Z6sG73ZDHTeeiKxMFUEGCdKJ+T538
X-Received: by 2002:a17:906:844d:: with SMTP id e13mr7934660ejy.503.1626211257166;
        Tue, 13 Jul 2021 14:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211257; cv=none;
        d=google.com; s=arc-20160816;
        b=sAapS9FMYITOpR6y9WYmGifTwOwtjliD3Hj+qW/gDAN7z3xou8NLCrMxTFq8PhTDfw
         J1CFkxdR95vp81yRCAP9H4CNSZRslO9OeEGw2QjEnWY3HIlyrufPrdS5BbM19S0/nNmr
         ALNJl0vRIQSNloY05UQ9xhPTBN4kfvkxCSj/hSjzWnVFxBvn+pmI5AAFxfW2kAryyRA+
         Nhfk+PzSHnOvGaGS4ymVYuYfMhphpmRyykPKtHakFU1bSbS6oa0kAXcKnZWicwXgJ/xJ
         mlHOC4MYHp5WKW9KXlyPHP8+FOcs5dz00YFC/Ihw9VuIsUKDvMCohR3i+HFQiPbVJnkk
         pzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dObAmHePKlBhssvuYSm7yPTQOhbUAmlem4+csh72HAU=;
        b=lf1eaNzRfeqh90xa3NpFaj+VWAHyNNWpnT9JQmWfZg1gIRCbboRjJZjW2DVONp4+Yc
         L2+QgVojwXECN2dSIdjayKmkOd0Fg/h6np2swUrlGi9U9EFa5E1DIBal0FMo+IotU8WO
         VCWYTJy5/LMN1dWiP/tG5u6Yko7M0Im0919VwXV+klP0Om4TVx28NoPtOZZ9smohImK9
         RB0g78nlONs61e0F441QDWJyvM8u8v078PkUcmnCqPUmv/2wz6L2QePftHVpFIm+sfFd
         xB9RXb41sK1dO9zhT3rHM/DmS5sn5x3ieHDDRM2sscnxZnBvQAkuflajgOJtj0QacH0w
         O+mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CUYXJskt;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h9si21902951edz.433.2021.07.13.14.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CUYXJskt;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dObAmHePKlBhssvuYSm7yPTQOhbUAmlem4+csh72HAU=;
	b=CUYXJsktXEN8Aa5HjmrH4R5XTURNjQ5Uy8E10mK1haq8BTAdx39KvEdnH7Ifx4po6FDsNz
	xJfWQHbN6zoneWU/kKzfAxkkPNtnthg5nf06BFIEUFdgWuHqZDM/3l6MXyxWoZJtESnh9t
	BUknikZO0iU9mQ6ayKmkWZoS93PVIPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-mn3Ms-AbMLClCHMfJe3Pkg-1; Tue, 13 Jul 2021 17:20:54 -0400
X-MC-Unique: mn3Ms-AbMLClCHMfJe3Pkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B5818414A0;
	Tue, 13 Jul 2021 21:20:52 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 727DF17F72;
	Tue, 13 Jul 2021 21:20:39 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ryo ONODERA <ryoon@netbsd.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Willian Rampazzo <willianr@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Kamil Rytarowski <kamil@netbsd.org>,
	Cleber Rosa <crosa@redhat.com>
Subject: [PULL 07/23] tests/acceptance: Ignore binary data sent on serial console
Date: Tue, 13 Jul 2021 17:19:07 -0400
Message-Id: <20210713211923.3809241-8-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sMCX0u3zKXkP

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If a guest sends binary data on the serial console, we get:

 File "tests/acceptance/avocado_qemu/__init__.py", line 92,
   in _console_interaction msg = console.readline().strip()
 File "/usr/lib64/python3.8/codecs.py", line 322,
   in decode (result, consumed) = self._buffer_decode(data, self.errors, final)
 UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa9 in position 2: invalid start byte

Since we use the console with readline(), fix it the easiest
way possible: ignore binary data (all current tests compare
text string anyway).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210515134555.307404-2-f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 1f1728ab83..c3163af3b7 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -86,14 +86,17 @@ def _console_interaction(test, success_message, failure_message,
     assert not keep_sending or send_string
     if vm is None:
         vm = test.vm
-    console = vm.console_socket.makefile()
+    console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
     console_logger = logging.getLogger('console')
     while True:
         if send_string:
             vm.console_socket.sendall(send_string.encode())
             if not keep_sending:
                 send_string = None # send only once
-        msg = console.readline().strip()
+        try:
+            msg = console.readline().decode().strip()
+        except UnicodeDecodeError:
+            msg = None
         if not msg:
             continue
         console_logger.debug(msg)
-- 
2.31.1

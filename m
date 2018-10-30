Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440101wro;
        Tue, 30 Oct 2018 04:23:59 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cmThuEkhLMGQofjCgd4E0iTFmIiz7d74KEw8YBBVNEKwwMEiXZ5OZBwnk1OETd2Jt/yQKs
X-Received: by 2002:a1c:4e0d:: with SMTP id g13-v6mr1325203wmh.139.1540898639227;
        Tue, 30 Oct 2018 04:23:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898639; cv=none;
        d=google.com; s=arc-20160816;
        b=iw2bWN+U00KGb6k2bQcmL6iB6kwt5ipilX4kzT170fm1wwnsLGvdU9xrTgyMqDGX7g
         5Eev7y47Sj0+EWpgjVcelibvYy8xaOoBSo9vlzw2JoY8SIJh3PBU+72FRv1PxM+bBeXM
         blRisVlRE0todZoLJfp8DM7cObrpfX3MzV5FUsqG3itlK0ji5QIoABsj+OkNuaQRE7DQ
         KKzO4nWH9hYH9p9ldtgIu/+xjXVfNqIs53579vXuXKW3PuOhgDvKwOuIu2rawWVywDew
         f2UCI8SqMvzPJ+3hH+jdAQadtyv3mhLmwgdo8TjguARyI5Svml/6prX3i35IW7h1a7Ja
         VBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4CQq/2mY3d3qQMRw6dhU9bzrX1Q9nLU2Tmq/bJKp5+Q=;
        b=jAcmkFA0/eEEgKEJJ3X5d5q9zpOldPHV5+TwujLtbPV4Z3uNUoJnay/eX1CDpthzhe
         bCoEC3w8kSpnlwbYFXTawWyW7inPN3QURKdC6m4TgTMvngyV53VKUO0w8J0S+uvWWW9k
         ag3nAINWsE3l0u85GgCxncidvkSby0Yf3wfJahR3Ds2bEpZ6WbW5gIqFEueMg6e0IgnY
         RY50qmQ46DqvgjWgEkZdZBlhBmZgbjzLTPf2CzyuqP6+zLmiwtA7M/2uJeUpsLeYu8r9
         nTZuIos/JxXLVwYrf8H/kfESHNgydQTc0XkddG/yViN7B2Hxdo7skXIk8r1mPwlXCCKr
         tkiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id j2-v6si13037827wmi.162.2018.10.30.04.23.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:23:59 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7aqD-1gCCGc44Td-0085WZ; Tue, 30 Oct 2018 12:23:56 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7aqD-1gCCGc44Td-0085WZ; Tue, 30 Oct 2018 12:23:56 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 05/20] qemu-iotests: fix filename containing checks
Date: Tue, 30 Oct 2018 12:23:22 +0100
Message-Id: <20181030112337.17973-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HGf3vO88OS9YjExxl3IHlSCxaolOWWZDr/ZpH95+T9lkzF5OCnR
 OOZAhze5Ahl5x3FuY/VbrS6OcOQBYpBe2s+y49rJLQ3YRAXf8TipWZYqMR8we7MLUtr3ByR
 523u1xENy0P0bKNoXDJyVebtP0pGanvRJVBIUJo5ZExF7Hhj3RbTcBqDE0hy0VX2amu7IC2
 jMiWW1a1tQzP9WQsIcJ8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:EO6XVGOJqlo=:wvXON1J+jwCx85xUT939P0
 pBNcPmcjzCbU7hD45t48L+tmCLO+rtJV73Q4RlsLbncMoxuo+SobB0zPxqrrHm1+vzDjfooiA
 1k/YaC7M06EJx/Z6vAJdXaMdCzUjFRsy3mgTUSTyk+5W3z7fgpla1fvmQhH0dAX2jT0ckS2iP
 2TL0cv3zvNeZOI/dHgAS/ANL33JYJGqb9LqNlNMLGbuvIDjCZXvGQaIaD9BMBbKJmWm/5v8Bv
 aEPzXo1bhruFsKEbEIT/ojbZYakbNtwwiXyqUYJ3NOVlZ8Xep0gh9ZbM9JGTC/JgmSu1O0FrV
 2e6gSEmzDhDhUJhNRU5TCLmY/3AT4umHAgfp5KwO+nDHtdH1JJVqmYkG8ApDoBBa7Fqo1zJOz
 08INLuzhOBs1cRSoZwjBvSwncRayNMAuiaCdJKO0cfLpk46fxOs3pU3gXByytCevib/JsQTWN
 lM/47/WugFW3Cahh3c/HfmRwgefqIyMEde9TtZMd57wUfSv4qvu6CwMEIR+CXsDtFIzaDrl0G
 59s/r1lskp7p+CcNspJl/ZXSF+x0VZ0Rz08tcm4njBw1ABorJ+LiNhIFHBMl0G7n9C9M5nQNJ
 qwkk3spqSbdXHX6eWgIfkP8LtK5nZRFfgxDBsPDZtWATn1jeogQ2tZeqfjz3wqj7qsgVMFi1s
 +G+rATUi12Lw+pCJD1nOS+fmvRsCeDXtbxq5iZG8sJ60y74CsNi9TE/z+TAt+I6n1upa682NB
 ZYT5xr2qSKX/ay9O
X-TUID: nCn0V+u04IUj

From: Cleber Rosa <crosa@redhat.com>

Commit cce293a2945 moved some functions from common.config to
common.rc, but the error messages still reference the old file
location.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-5-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qemu-iotests/common.rc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 44bee16a5e..70ca65b49b 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -170,7 +170,7 @@ if [ ! -e "$TEST_DIR" ]; then
 fi
 
 if [ ! -d "$TEST_DIR" ]; then
-    echo "common.config: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
+    echo "common.rc: Error: \$TEST_DIR ($TEST_DIR) is not a directory"
     exit 1
 fi
 
@@ -179,7 +179,7 @@ if [ -z "$REMOTE_TEST_DIR" ]; then
 fi
 
 if [ ! -d "$SAMPLE_IMG_DIR" ]; then
-    echo "common.config: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
+    echo "common.rc: Error: \$SAMPLE_IMG_DIR ($SAMPLE_IMG_DIR) is not a directory"
     exit 1
 fi
 
-- 
2.17.2

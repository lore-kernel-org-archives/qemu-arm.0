Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2063981lfq;
        Fri, 25 Feb 2022 13:04:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/8N6WS/O5wwClJAAKef8ib8Cx4R4a7td4n39MIe0Bp/u1AvGUU7rkQrBkz954OVVTeyN2
X-Received: by 2002:a17:906:32d0:b0:6ce:e1cf:3f2e with SMTP id k16-20020a17090632d000b006cee1cf3f2emr7318145ejk.214.1645823050869;
        Fri, 25 Feb 2022 13:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645823050; cv=none;
        d=google.com; s=arc-20160816;
        b=yC02se2vJ6LjvZMM5FZYEt9Q5QkTv0dRoKWdkn7vYSfn4AuB5L4yNTycDUccrojwbp
         NarDuSufqquvo/2qNUtldxd1Ssjs5RJdk4OcOi38fTFjcOVNfH4pKizvkiVPpKaVzH2o
         VbcSLbHEZpLIclcykXYIxfUgEu+HlkC+ToAsjC9DQkoR9XpaN5oSqNackytDz3a5acgv
         EKUgkvJauM/oUQt18CkBGwQHt5KKXi6pDw0b0WIvQmqM6C9b7BRddMcXEpKvNiWuY+mo
         y08fQLYOJrZyBmvBy2jRqoGRl7nOizGg3YrjliCyHw1RyoEJKzzrThN3ezLn8e8HvKks
         Spsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3ZuPsnBa/TIN73zdOBhgnN9AsDduVrt/5Sg+K2kLmww=;
        b=crXFL5P7fbp0rkkx0doNoXfAxgK8qtooRN/j3AhJHcMagg1E0hpu3VplkpM0Qrg39x
         nSmH0+x0UfkMsnI70CwOIH/AcD2NzvdjoSnRrH9rTgXkHWdbGttz4GeQqlSftsvN80PE
         JJypHvYZA0/Fgn/EdWd2hapwdWcHZV3pl7BXdkDDeA514UCzrwjjVhGWfzGq7lGUKnW5
         90WmXyD6ED+DoHm7XsgImkG9kp/x4Du+cwEhJA99fpeJogSiE/4JXCib3JUSiv9fLu3w
         wnWTWGSnM7rs4ZQHd8g9CLEqviAkWd1gMjX/QH8K3QbxQnd/4CtdBDM8TY18B9rPmdwX
         A6cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SaoUIKph;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a10-20020a50858a000000b00410b5ffc5c2si2309388edh.491.2022.02.25.13.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SaoUIKph;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645823049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ZuPsnBa/TIN73zdOBhgnN9AsDduVrt/5Sg+K2kLmww=;
	b=SaoUIKphHt3yAk6zJvK7iHkzForUnrv14QzwnZjooJKtoTgiV5PbkF9Km0WkOOyr63khaA
	x44NFLM8tXZ0UyFE64ApLOQf48+D3z/BTRFOByAUVBv8XXpK/LrAHVm4wkgd7EN+Ku7f0o
	SBaM2yIKHniTgPpAp9noNl3CLr4Sjyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-89GT9vTaN2uwozykbX54GA-1; Fri, 25 Feb 2022 16:04:06 -0500
X-MC-Unique: 89GT9vTaN2uwozykbX54GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09BB91091DA0;
	Fri, 25 Feb 2022 21:04:02 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F028F2ED79;
	Fri, 25 Feb 2022 21:03:37 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	David Gibson <david@gibson.dropbear.id.au>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH 6/9] tests/avocado/virtiofs_submounts.py: shared_dir may not exist
Date: Fri, 25 Feb 2022 16:01:53 -0500
Message-Id: <20220225210156.2032055-7-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: nukabdmBML3l

If the test is skipped because of their conditionals, the shared_dir
attribute may not exist.

Check for its existence in the tearDown() method to avoid and
AttributeError.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/virtiofs_submounts.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
index e6dc32ffd4..d9c2c9d9ef 100644
--- a/tests/avocado/virtiofs_submounts.py
+++ b/tests/avocado/virtiofs_submounts.py
@@ -157,9 +157,10 @@ def tearDown(self):
         except:
             pass
 
-        scratch_dir = os.path.join(self.shared_dir, 'scratch')
-        self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
-                 ignore_error=True)
+        if hasattr(self, 'shared_dir'):
+            scratch_dir = os.path.join(self.shared_dir, 'scratch')
+            self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
+                     ignore_error=True)
 
     def test_pre_virtiofsd_set_up(self):
         self.set_up_shared_dir()
-- 
2.35.1

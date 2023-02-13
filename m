Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547583ejb;
        Mon, 13 Feb 2023 12:33:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8bDz3f0CAlo0GHlGvKYDmPXDw9nfDcNhoM0sFgoynY450kOvZxEFdD93MEHneNzNLCcF8x
X-Received: by 2002:a17:907:587:b0:8b1:29b7:6ee8 with SMTP id vw7-20020a170907058700b008b129b76ee8mr181384ejb.76.1676320387481;
        Mon, 13 Feb 2023 12:33:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320387; cv=none;
        d=google.com; s=arc-20160816;
        b=TaWPaD6o4OfsnADR752ODh7Aj+dKnT2j67gy0KSqGp1/zvCbnF7+qAiJZ47E+qDuTH
         cP2a5lMfmUMOxO0S+DS1FS/5pzpBVCv1mFIwI2xRsYBD2cbE2eFiOBZ22hsaIW7kkvdY
         o+rT8V+rmoekECTNIXRMqkx1nqErBIn/TinP/B789k/4lVqDJY+MZ3Qg4x6wp63enjAg
         obSl6NAo+YUD7gEMiYHDA/5Xym0AvxEPJGJcHMWlSP5nRRvNHtova9NZym0+ExuDwbQ+
         5h+Ifmwju/NKUNAHxxJ5HE8j3HoDLD9+ee1pS39Bm8H6EqeXrFeHe3/DAWpQMeO4xN6X
         X0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=MJEIUhzYVuGJ6FZ+v8A0F062pHs9Bm8wgwx26VOOYXE=;
        b=CklYjnIVDjBHGECS5pDPzjvDvbifZL3aUWzEgw8MaIDHEpE2Z+zx5BF0qKPeeBnF1r
         4c715oY1AObJsr0eYKz9QVEKN1P4J6Potrr6D3ND9diVWxvM32d8HHQo/+X8fQl1c40E
         bwySsuRC857nT3fJikp/N1LImhAWco2y42hwaJe9PKzptjv47sdV2dK9GSd316p/QUwo
         5Ffn3cb1CRg/qrJy3m6knkLYWpIUHWbXVRQ+sn6ILZBl40GUgCv+EpB+c0vXqv+OqUrb
         7/N9JTK5tEeteJ1rcrVWIzU7+RHZIxgmI9x67RmEkgNUMj/M15Yg4Vdnq+D+7wmg2d7I
         roPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=x9EwTD+g;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id vz16-20020a17090704d000b007825337afeesi13826714ejb.273.2023.02.13.12.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:33:07 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=x9EwTD+g;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 12E0D20193;
	Mon, 13 Feb 2023 20:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJEIUhzYVuGJ6FZ+v8A0F062pHs9Bm8wgwx26VOOYXE=;
	b=x9EwTD+gcBmmwo75JNmmLE8MK3NKYfCQTgrfFQUkR+Gtk7ATyH89go1UEriTlDqQvCuI2h
	or6/lcBZpXRqp6X8Ev4KDCJ4wqVWTv/MyaqXLzva+SjvpyTHCpmoruRJgIcWt0LaZt9/nG
	lLKoXSbnuNnDVA0dDsaAm2bMzPBp99g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320387;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MJEIUhzYVuGJ6FZ+v8A0F062pHs9Bm8wgwx26VOOYXE=;
	b=/2puDsUZTvaipmxvSWs2Ye1WRYfWZI8wyRBPw0e6DDGj8MV5KhMa2wqWlO4X/yPuTQ7cpI
	at1lSANp20wOANCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CF921391B;
	Mon, 13 Feb 2023 20:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gCv6BH+e6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:33:03 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH RESEND v5 25/28] target/avocado: Pass parameters to migration test on aarch64
Date: Mon, 13 Feb 2023 17:29:24 -0300
Message-Id: <20230213202927.28992-26-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qpfMtnksSt/e

The migration tests are currently broken for an aarch64 host because
the tests pass no 'machine' and 'cpu' options on the QEMU command
line. Most other architectures define a default value in QEMU for
these options, but arm does not.

Add these options to the test class in case the test is being executed
in an aarch64 host.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/migration.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 4b25680c50..ffd3db0f35 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -11,6 +11,8 @@
 
 
 import tempfile
+import os
+
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
@@ -26,6 +28,14 @@ class Migration(QemuSystemTest):
 
     timeout = 10
 
+    def setUp(self):
+        super().setUp()
+
+        arch = os.uname()[4]
+        if arch == 'aarch64':
+            self.machine = 'virt'
+            self.cpu = 'max'
+
     @staticmethod
     def migration_finished(vm):
         return vm.command('query-migrate')['status'] in ('completed', 'failed')
-- 
2.35.3

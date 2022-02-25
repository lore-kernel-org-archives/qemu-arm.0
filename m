Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2064132lfq;
        Fri, 25 Feb 2022 13:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxl5P3nEm26fY0KRClqILhUhiHAxGIFazEiiZgrSyxO8uABzNjkGtmIyasWHETaS4M90iS
X-Received: by 2002:a37:ba45:0:b0:508:19df:70e2 with SMTP id k66-20020a37ba45000000b0050819df70e2mr6219059qkf.213.1645823063372;
        Fri, 25 Feb 2022 13:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645823063; cv=none;
        d=google.com; s=arc-20160816;
        b=0w5I0EmVOXoh01su54mx0zhUk6vvOHRzWGMqhRctxtMYXQ9SWJT0XfwEnLjreeDCtO
         zU4GOW5xJ9q6FIWQdTQIvZjZ3uZj8WslhAPdBXtVR4h0fU1g44cNSgEPo2D2Cz7RgCso
         iQDxBV+P5/53nnpd82u8jH6gCplBfYOxoB+Q2TlyAzfA3bmV9ZKJXBsMtCm7faHdtCeV
         2Qz3VGnZ+v3TQASvC6QsiR8ErFZhaCQR2xKXzH98LFYQ6w8o7oTEc/W6b+YIMt8SXR9H
         InvRiyJ6w6SfVIxe3h5MxG79PdEMsoOqdCqK63qpWHolOZ+bVmbczYVSpY5ctU4S0sfL
         ONKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qNODeJwjuUNMne1tnJjwXA4MZtQxGl2DrlKChgzr9aw=;
        b=EHeq8Dc+CmC7VWD4/hroycjnMc8EvJdw54S6mAWtWV33fWKyielgAW9PjKypouAJVp
         krFR6Z4ifaExk1caCkBY3NNVHjoa4hxGPHw7LR66IfXjpHOfJm1dixJaoVmF19inhLMH
         g6WgWFlFAw8TqvtVruSashJX568QZYJBJhHhmY0jgYRkOj0fxC9SnPp+GOp45MK8d5U9
         3NaEcU+VIo5FfWxsDWDVEFoki2tVsuDiHwgQZWt+WZhd5qax1bz6ZOAiUMUBXjDLigXO
         ntjCZO/KwsM1lprIuRWuuzayAjAgvctaJMZi37UcPCqyqzfin6n6yQVIllxwMXuz1ml6
         mVBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRHaESJS;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id q10-20020ad4548a000000b0042ce7685d93si1943342qvy.207.2022.02.25.13.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WRHaESJS;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645823063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNODeJwjuUNMne1tnJjwXA4MZtQxGl2DrlKChgzr9aw=;
	b=WRHaESJSiAtWxR5CcQl7kwUHqHfwVt2CMDtam2/A1fwpWcW4K3ioH6VNi9H4N48T2zONaA
	22PqVbkgSEv5Xy+b7wcZz8GZ9En5qx/brmdUJ2vrO6uGDIBlN6nkSxczOA+bdoDVbsVA7q
	YPfyGv94ZXHqDs3luD674aBVM5FACJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-Vp8j209aOqiSR3BxDp8-8g-1; Fri, 25 Feb 2022 16:04:19 -0500
X-MC-Unique: Vp8j209aOqiSR3BxDp8-8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AEAC5200;
	Fri, 25 Feb 2022 21:04:16 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73A592ED84;
	Fri, 25 Feb 2022 21:04:13 +0000 (UTC)
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
Subject: [PATCH 9/9] Avocado tests: don't run tests with TCG that boot full blown distros
Date: Fri, 25 Feb 2022 16:01:56 -0500
Message-Id: <20220225210156.2032055-10-crosa@redhat.com>
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
X-TUID: 0ih8xpPblH2K

Tests that use TCG and boot full blown distros, such as Fedora, will
take a good time to run.  This excludes those combinations by default
on invocations of "make check-avocado".

Tests that rely on KVM instead, will continue to run.

As a reminder, one can always supply a list of tests or tags to be
used on a "make check-avocado" by setting AVOCADO_TESTS or
AVOCADO_TAGS.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 676aa0d944..6d9cf7cbc9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -91,8 +91,11 @@ endif
 # Any number of command separated loggers are accepted.  For more
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
+comma:=,
 ifndef AVOCADO_TAGS
-	AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
+       AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%$(comma)accel:tcg$(comma)boots:-distro, \
+						 $(filter %-softmmu,$(TARGETS)))
+       AVOCADO_CMDLINE_TAGS+=$(patsubst %-softmmu,-t arch:%$(comma)accel:kvm, \
 						 $(filter %-softmmu,$(TARGETS)))
 else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
-- 
2.35.1

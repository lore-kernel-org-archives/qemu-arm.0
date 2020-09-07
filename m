Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3445286lfc;
        Sun, 6 Sep 2020 21:20:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4+k4Fjzbz/AMF4S6qo7+/M6Vu7gGLmw32DMiTR1kgaqmsG5UCLUktsIvacpyeMRMCcKbn
X-Received: by 2002:a50:8f44:: with SMTP id 62mr20753267edy.3.1599452424109;
        Sun, 06 Sep 2020 21:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599452424; cv=none;
        d=google.com; s=arc-20160816;
        b=shf5U6zkPLDcNGYnKaJUV75Mun4hFcvcAA8m+0jG7eNurFykiL7zKHIkJ6sCh8Jfq5
         6XzgmTsfZoRGpXeA1S4amg1NchmJqS83OexCNYGcaF32oYkWkg9pcc08EQmsWSia0dqL
         lUGOD62Myv02Q6wIutWFmTLgXoXQ8pxFcYKk++VSu4YFvDSyS33XU8P1YR2XpJmHQuQ9
         W3MhOo12stjWxLPm63IiTnmkzBJZVFOnUKpCZFSk0RE77+6zlvcqJESjWMM5/F0iZJaB
         NdD68AadaViRYRr4RUqERRROtaDY1PexHqgzKBDSe9uqcp9llUNwf04omWIKaXo5Ifgu
         u5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IJ4slLay8b89rpTy43SAQf3zve8jR9BeHUD3qmKqNaw=;
        b=RrYiee9fOk9n3MDarQ20vjQfGvVRuZMDY8FcE7aUM8X5fwZkGQhQVa/iOPQedXxGcv
         XycsDQNYitSbaU6ZMOsDkL348JsvSysui3ZJ0K0Z4auaMyRHj82SdEQqqCKaLSEir4Ae
         MIJvEmyXopkLN46cXHZ8XYcA+JOPwaezVW1f+9ztYybx1Kk3Yfo/WlHz8OyWAPqNurz5
         hvNZ1O5MzGCSb/aXyvm16IvpBeKrmBwco/ZA1fKakpw/oDip11r/t9HBuOaj+dN5CI4M
         4KYWvrDcyRTbr4aAdsEsKlVHVZt1aHSn9aX+z2yyrJRcMRxT/DnS4/+2S5kmKx/kMxwJ
         pv1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZHUp995;
       spf=pass (google.com: domain of crosa@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id u20si6412828ejt.14.2020.09.06.21.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Sep 2020 21:20:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZHUp995;
       spf=pass (google.com: domain of crosa@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599452423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJ4slLay8b89rpTy43SAQf3zve8jR9BeHUD3qmKqNaw=;
	b=FZHUp995J8m7swv+6Scrpkm1kezgg77bawMezzOyRZ0Y+3/fFwz4nQeN6Igp9Xzz/0DQ49
	YZEqdbsXJmtyvjl2d/fZ6RlmiNQUKR/fgDqYs0354/l+9y3K6csTOPOQokkfhmctzVsrwM
	VvqVO3iT7cxk4/edIErPXiclnYGT0KE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Bcf1S9CSN8CC9SzS1QLozw-1; Mon, 07 Sep 2020 00:20:19 -0400
X-MC-Unique: Bcf1S9CSN8CC9SzS1QLozw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0823180F040;
	Mon,  7 Sep 2020 04:20:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A8621002D57;
	Mon,  7 Sep 2020 04:20:14 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Beraldo Leal <bleal@redhat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] boot linux test: update arm bionic URL
Date: Mon,  7 Sep 2020 00:19:58 -0400
Message-Id: <20200907042000.415931-3-crosa@redhat.com>
In-Reply-To: <20200907042000.415931-1-crosa@redhat.com>
References: <20200907042000.415931-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TUID: w4BFX2TWwMiV

Which uses an xz compressed file, which has builtin support for
decompression on avocado.utils.archive.  So the check for P7ZIP can be
dropped, and extraction logic simplified.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 751b47b8fd..c75c512c8b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -22,12 +22,6 @@ from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils.path import find_command, CmdNotFoundError
 
-P7ZIP_AVAILABLE = True
-try:
-    find_command('7z')
-except CmdNotFoundError:
-    P7ZIP_AVAILABLE = False
-
 """
 Round up to next power of 2
 """
@@ -687,7 +681,6 @@ class BootLinuxConsole(LinuxKernelTest):
         self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
-    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
     def test_arm_orangepi_bionic(self):
         """
         :avocado: tags=arch:arm
@@ -695,14 +688,13 @@ class BootLinuxConsole(LinuxKernelTest):
         :avocado: tags=device:sd
         """
 
-        # This test download a 196MB compressed image and expand it to 1GB
+        # This test download a 275MB compressed image and expand it to 1.1GB
         image_url = ('https://dl.armbian.com/orangepipc/archive/'
-                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
-        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
-        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
-        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
-        image_path = os.path.join(self.workdir, image_name)
-        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
+                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
+        image_hash = 'b4d6775f5673486329e45a0586bf06b6dbe792199fd182ac6b9c7bb6c7d3e6dd'
+        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
+                                         algorithm='sha256')
+        image_path = archive.extract(image_path_xz, self.workdir)
         image_pow2ceil_expand(image_path)
 
         self.vm.set_console()
-- 
2.25.4

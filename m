Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2063341lfq;
        Fri, 25 Feb 2022 13:03:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/tk/v47PMLTVplRiESnS7hUtC3rqRTdWulqEsyRaCYwAu7mwZ/SWKEvP0ey9SNqkewGfv
X-Received: by 2002:a05:6402:42c6:b0:412:8cbc:8f3d with SMTP id i6-20020a05640242c600b004128cbc8f3dmr8914245edc.310.1645823002258;
        Fri, 25 Feb 2022 13:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645823002; cv=none;
        d=google.com; s=arc-20160816;
        b=fG/BoKXLDNOJI7pQHz7gSYn04HwYVfNfMSPJcoS0ihhnhmVlvXe++Kj8FudCN5UThn
         OeXo8Ddrmn+lVN8qJFUV3q8xcIMz/ITX/a+plHgr1wLATzw6l5uJvgOtaGRWuVKrR3Sr
         /THuGesZWiyTpbvyGmcyIvXoSYh805bG4Zm5hXkuJD9pshKQbgzhk78DVRSStEuSIayV
         3zwIbpupHj7jcnAUEhMi8iOWcHfvDovO9Len4SxKXEfpOo19n5Lp5mZG9eAEO3knf+Ff
         ekO+UdjUikVpk/m5G5Z1o6S8g3UD5BuEmMWtLOtmwJQ39f1b8sOvOeA0nVyuO3KKeZyy
         XzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uOuOLyLdCnh99/oAfl/tDKSBuWvbul9urTxuUFywBmo=;
        b=f3aQvcDZMaRLhM85ypa1Vq/MMj+j9r+9i8N5CKQ12CFCy7FZfBvS118BtBP62wlD2x
         lxUsk4lOelO0PoR9rVSvN48geW2u0jyUmRoCP/ZBpXvTKox6kjWav+/G4PMBEW4xnkhu
         Zal0zN47+mQW7QKqdq1cU/7rkRk2RuRBSd7+QxBzW2aJda74b0Gjs8e5WiMgkbM25zAW
         wma1qhLR35wKPezsNlMot96E2p34CKgod30HApjIwHp/D30ALY9ve47ryrQU/y5hINhe
         Num/lR+AP45Nr9Du3HpN8BeNTj5+6Z+RikIL0cmA8atVRCJxp6SHY3VaMb3/jREC5kPy
         Vq6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fRKslDtU;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g5-20020a50d5c5000000b0041080ddd1b9si2505118edj.649.2022.02.25.13.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fRKslDtU;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645823001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOuOLyLdCnh99/oAfl/tDKSBuWvbul9urTxuUFywBmo=;
	b=fRKslDtUkcJ8jsai0HcXG0cnto8EsEsecoQM3X9u9A3dWUACexlbnvQ55KyZ1UXVzvm8MA
	2eR44W5nu0VGmE6gwMED5Zem7iHjLg3/y+JPGZS9aVElbOzIMURcS/wzznfY6Ehpu6IPWt
	exp2kQa35rW39Ata/XQ/Gvk4d7yNQ60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-UId7-3ZXMN23XF5Kag9G0Q-1; Fri, 25 Feb 2022 16:03:18 -0500
X-MC-Unique: UId7-3ZXMN23XF5Kag9G0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AD5D801AAD;
	Fri, 25 Feb 2022 21:03:15 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C0A2ED79;
	Fri, 25 Feb 2022 21:03:08 +0000 (UTC)
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
Subject: [PATCH 3/9] Avocado migration test: adapt to "utils.network" API namespace change
Date: Fri, 25 Feb 2022 16:01:50 -0500
Message-Id: <20220225210156.2032055-4-crosa@redhat.com>
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
X-TUID: vr+bbdja+AIw

Since Avocado 94.0[1], the "avocado.utils.network" dropped a lot of
previously deprecated API names, having the new names into a finer
grained structure.

This simply uses the new API names for the network port utility
module.

[1] - https://avocado-framework.readthedocs.io/en/latest/releases/94_0.html#utility-apis

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 5 +++--
 tests/avocado/migration.py             | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 88cec83e5c..3f15c8a222 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -17,7 +17,8 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
+from avocado.utils.network import ports
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -601,7 +602,7 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
-            self.phone_home_port = network.find_free_port()
+            self.phone_home_port = ports.find_free_port()
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 584d6ef53f..4b25680c50 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -14,7 +14,7 @@
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
-from avocado.utils import network
+from avocado.utils.network import ports
 from avocado.utils import wait
 from avocado.utils.path import find_command
 
@@ -57,7 +57,7 @@ def do_migrate(self, dest_uri, src_uri=None):
         self.assert_migration(source_vm, dest_vm)
 
     def _get_free_port(self):
-        port = network.find_free_port()
+        port = ports.find_free_port()
         if port is None:
             self.cancel('Failed to find a free port')
         return port
-- 
2.35.1

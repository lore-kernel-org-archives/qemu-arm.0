Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2063635lfq;
        Fri, 25 Feb 2022 13:03:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZkslPbcaa3J6ObxyPbSbMHUoC+aZccIIQaeqrgn+ra9GuxoAQ9FejI5dL62doxIo1dyLH
X-Received: by 2002:ac8:5994:0:b0:2b4:b4e7:69ff with SMTP id e20-20020ac85994000000b002b4b4e769ffmr8607130qte.653.1645823024772;
        Fri, 25 Feb 2022 13:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645823024; cv=none;
        d=google.com; s=arc-20160816;
        b=cpsYsTRlHhzBMN/meIzsISfa6BpvdVvpcDU8kBLHjZItZ55tFDP/xTq3ONysMlBQJn
         ShLiFwH8+8qCgD2og9jLGkUZiln9bIy78+YJfZzTK2jTvlroT4cKDeE1R5WeDUjUZshJ
         LB6N+kur7QRenhWZoRx4d+KUCfK+K6TJNSc2jqjb9TihhRTSOnhdKw3XNZij3IbuHG0k
         Wc2oLXtRD3x25jIif9KAhFBaTLKrw1UlB3v+1VGH6u7VnAKvI4MY2awJPCtGYjH/yAW4
         rprfGbt2jIXIDdZOiDNxlhnawXDVW4LkmerLPkO1lgPaX/Lp3MNixR8BRDUUmjtG5y5x
         yPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IVbnLlwQRb4NIz3ZEah/GxCpbHss72iluxasg8Q0AMo=;
        b=CBPo0sQVVJHqNDvJoouipHnZt89bhMi2Kwl2zvVayojcfaly+ru2mEBTB47cTuRfpE
         U1Yw9+K6fTfyuacbefvDEyp9R6LxylMpzDNiE5IKuvo6w1m8CxmrF2/gs7OgPxyM7HeI
         XxFGthtUmgqWUrYTCVP7G2FGM7Za98tEDzVTj0XuCvO5gQS/1LumgJBdut2vqECi2bdj
         XBpLPeXSJWtqcw5Li0CcY0C/xLv9SKWz2ielPoSTUiu63ISsi3I6EUKJtQGCKdc9ufNm
         Iqy3cE0uC+phhxz7wQ9yOcJ+fzLuf+Y4HlpBKP/E90IVC8rwmmKBqLDP334sC44Wn9+T
         GC4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OSDCnPwf;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h14-20020a0cf44e000000b0042c01fa5d28si1849327qvm.290.2022.02.25.13.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 13:03:44 -0800 (PST)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OSDCnPwf;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645823024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVbnLlwQRb4NIz3ZEah/GxCpbHss72iluxasg8Q0AMo=;
	b=OSDCnPwf5TwcK0ritCRbq4UXvVWaQt2XMeT/Bx43nUEO17yTxxIjO1pl/UJel9viLOyTj4
	7A1a+UbW6K8xFZ+O7YTs+CCRTaCh/TGVMbnp+2cZpE5pOJbX4R+cXKdEft4cXRefyY1Gi6
	ieI/NociYq1oNZ1HGJwMKC6sLayMhso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-8SSmJYa6MVS7mAE-xYonJg-1; Fri, 25 Feb 2022 16:03:41 -0500
X-MC-Unique: 8SSmJYa6MVS7mAE-xYonJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB83E180FD72;
	Fri, 25 Feb 2022 21:03:37 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D86632ED79;
	Fri, 25 Feb 2022 21:03:30 +0000 (UTC)
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
Subject: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing accel (tcg) tag
Date: Fri, 25 Feb 2022 16:01:52 -0500
Message-Id: <20220225210156.2032055-6-crosa@redhat.com>
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
X-TUID: jX8OfA3hIfEW

Being explicit about the accelerator used on these tests is a good
thing in itself, but it will also be used in the filtering rules
applied on "make check-avocado".

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/linux_ssh_mips_malta.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index c0f0be5ade..0179d8a6ca 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -23,6 +23,9 @@
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
 @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
 class LinuxSSH(QemuSystemTest, LinuxSSHMixIn):
+    """
+    :avocado: tags=accel:tcg
+    """
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
 
-- 
2.35.1

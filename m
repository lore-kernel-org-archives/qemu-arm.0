Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1026454qvs;
        Tue, 13 Jul 2021 14:20:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw/ULhUb1w3nTKH0oApAwS7CIup8fzSBTsMMDncOW2m3RPu+JtpB5mMjM9HkZIPry9/Mce
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr8094119eju.254.1626211206435;
        Tue, 13 Jul 2021 14:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211206; cv=none;
        d=google.com; s=arc-20160816;
        b=0NqdBABEen4ADIlExZxaFhA3mXWh3dHNE7V8lHe8x2fd0SWfBI81dv3zzwGB9vLzWM
         IDp8VadMYrEzJhr4+0ILmgt0o2t//+kbGEBcjsTJh+edRx7fT1B51eD2bw/Zcl7qkTVL
         Ju2mGKo5zPcJjPFMQqjyrfWKseSpe81SAz+0yDE303HW9lNzFvk68QEQRvY8c+OfLgGW
         mLpHtaguXxIqy9ZlpIjd8NJM8p0u1vUR6D+x2HhFfqOUgMzNwSFey5A3qvB+CEQjiANd
         48gnTKLl+cn4ScKMGoZxf7IuoHKOJfNZ7ep9pPJW9dDQVCUEN/nyqKiKf0d4zVVnJsfB
         u8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=o/hmecJHLqWZ/BY8YWnw3VpukSO4hxCzqvER0n9EBPk=;
        b=y1outAQQMI9DR4rn3x1ZVyKMYO3d3Vs2aHYrpSw4r4kRZ0UG/3HLcVqukwLWpg/w7b
         UOn78VxMHAzKuNUBdFGccK7MDc2p3h0ldruQr7zhHv17unokUUNsT4Vz6bzjwpLD+YQY
         BC7nIXUuZctHouMdAaLqcJGbpUCK7fukP3dP92brxZFiHBjnEuJQFFWjtlceA27uFZyF
         evza9kRefdGB4ME2BJg/6rTtFPwYNSU1BYcbm+tOgCak3WeKUV68b1lKZ7kfbccQf07a
         IkfPEwoc4s0Adu2/aZwHn29xJXNMHpu30bkljXf038sw0Rgjx3mSUzWCTbFX1C2PHi6/
         BbXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dJn1xqq2;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 26si21385873ejz.171.2021.07.13.14.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dJn1xqq2;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/hmecJHLqWZ/BY8YWnw3VpukSO4hxCzqvER0n9EBPk=;
	b=dJn1xqq2ls9d6feHKlXE45hEGZrb8ylbfzO15pMMGgZKhmwmbSwovhiKviADXNqejp9LCK
	ubms1HY+Ek9A8Rswn3Nc26/2+wyUy6GlWJ66COQfUYfLo3zQprowQVnTC4yPOtOzqo6EbH
	kxhQT4eIM+V05AdYlwPn07EMjVr/paI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-NpgRYWq_PeOXNyFr-_uV_g-1; Tue, 13 Jul 2021 17:19:58 -0400
X-MC-Unique: NpgRYWq_PeOXNyFr-_uV_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E09AA1084F4B;
	Tue, 13 Jul 2021 21:19:55 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 600DC19C44;
	Tue, 13 Jul 2021 21:19:46 +0000 (UTC)
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
Subject: [PULL 01/23] Acceptance Tests: use the job work directory for created VMs
Date: Tue, 13 Jul 2021 17:19:01 -0400
Message-Id: <20210713211923.3809241-2-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: tkTXxcsl0dct

The QEMUMachine uses a base temporary directory for all temporary
needs.  By setting it to the Avocado's workdir, it's possible to
keep the temporary files during debugging sessions much more
easily by setting the "--keep-tmp" command line option.

Reference: https://avocado-framework.readthedocs.io/en/85.0/api/test/avocado.html#avocado.Test.workdir
Reference:
https://avocado-framework.readthedocs.io/en/85.0/config/index.html#run-keep-tmp

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20210211220146.2525771-4-crosa@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 93c4b9851f..693c226d91 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -221,7 +221,8 @@ def setUp(self):
 
     def _new_vm(self, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
-        vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
+        vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
+                         sock_dir=self._sd.name)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.31.1

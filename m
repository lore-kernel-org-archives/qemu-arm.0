Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027805qvs;
        Tue, 13 Jul 2021 14:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiQ8Y8PcAJSPdrNkI84jHoIn+l/WvIrBWU7/fjQWglCgiMN0scaVi2MxYeNU3Zp44e9eyK
X-Received: by 2002:a17:906:bcd8:: with SMTP id lw24mr1424034ejb.228.1626211323493;
        Tue, 13 Jul 2021 14:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211323; cv=none;
        d=google.com; s=arc-20160816;
        b=yVgjasFgxeyQiSj/xFskYJlfWhcQSqzDTs75yoB9K9gEAI1Dn6oH0VNzvjtxRqqlIH
         JGNggqDP/djDW9xel9D86ORuNa/nGO+mx+vE8aTWb7IolW8h5+VkZqyuTmyDpoC7frj+
         uYi5LIClL+Eufvd9V/RffYbAP0likao0j/a5oN6/X7+mNxoH64JWmjAHiyecbmDHcqJV
         Z8vQS6iYb7wKzJj/OGbsDujikuU0cqTVhTsHlNc2QefA4ZyfPyxYRTRr9inqspowOh0X
         mw3t1nLTfBVb4M569ojIdvMI4L97C2tuMeGYxyhK4khuPxZp6EFDbqCzmue71vVeFB43
         k4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zsU0FTFf2rMachGGbCL/tF0cIh/ZF+yOJZdnct0Lkq0=;
        b=h0RW9spk6WtJ9F22yxuifgP1gPxOf/DRvNHSyBcON8iXmCzpat3vWqsKDiMdtxkQ7X
         xJQNXeUuANA5RgDCgGuweNaskoxAZlIYFnBbvuq6MU/QBPWRR6AfI42KRXBtxkdjfSxF
         QpRn7ut8zkAMyfEktHBZJi2VX7x0qPDpdbyfamtJn2EP+u+HqdHVGKOLkz736tOv5Ngp
         am4X7Rzz1sx1Ko1xsp97dQhzeGNM3cZ5rDOhjyQ6mTgVBfuQUTvT28Q32llKxTDonJB5
         uyJG9znPWmIw/kc7cCcOH0zG0MJeIgld7ADNto6nBdy44F83aAKcA9/napBmiD2waTzS
         ZXtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L5hTwZVI;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id i19si4175edc.50.2021.07.13.14.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L5hTwZVI;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsU0FTFf2rMachGGbCL/tF0cIh/ZF+yOJZdnct0Lkq0=;
	b=L5hTwZVI8mG6pa4qDOgSxUME5sEqzrdWBpvRoDfHZ1Ta52T07r/AmUhLGla1zQsLBTxoTL
	TdO+fqRcXWX8Z37IcvhYfmtlEAFF3MiEcMzpGsTzOpH+2UD3dgiNSQQwAefroKMlNyBiz/
	x7IuQ+QOa0Wic79Ngl5DjPwWUFPGnu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-ePkmP2fKMMO6JuY_FgbEWw-1; Tue, 13 Jul 2021 17:22:00 -0400
X-MC-Unique: ePkmP2fKMMO6JuY_FgbEWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54D4E100B3AC;
	Tue, 13 Jul 2021 21:21:58 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 036FA19C44;
	Tue, 13 Jul 2021 21:21:55 +0000 (UTC)
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
Subject: [PULL 19/23] tests/acceptance: Handle cpu tag on x86_cpu_model_versions tests
Date: Tue, 13 Jul 2021 17:19:19 -0400
Message-Id: <20210713211923.3809241-20-crosa@redhat.com>
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
X-TUID: OgIBRHA1P3Kn

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Some test cases on x86_cpu_model_versions.py are corner cases because they
need to pass extra options to the -cpu argument. Once the avocado_qemu
framework will set -cpu automatically, the value should be reset. This changed
those tests so to call set_vm_arg() to overwrite the -cpu value.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210430133414.39905-8-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/x86_cpu_model_versions.py
index 77ed8597a4..0e9feda62d 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -252,10 +252,13 @@ def get_cpu_prop(self, prop):
     def test_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # machine-type only:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server should not have arch-capabilities')
@@ -263,9 +266,12 @@ def test_4_1(self):
     def test_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.0 + Cascadelake-Server should not have arch-capabilities')
@@ -273,10 +279,13 @@ def test_4_0(self):
     def test_set_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # command line must override machine-type if CPU model is not versioned:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off,+arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off,+arch-capabilities')
         self.vm.launch()
         self.assertTrue(self.get_cpu_prop('arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server,+arch-capabilities should have arch-capabilities')
@@ -284,9 +293,12 @@ def test_set_4_0(self):
     def test_unset_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server,x-force-features=on,check=off,enforce=off,-arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server,x-force-features=on,check=off,'
+                        'enforce=off,-arch-capabilities')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server,-arch-capabilities should not have arch-capabilities')
@@ -294,10 +306,13 @@ def test_unset_4_1(self):
     def test_v1_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # versioned CPU model overrides machine-type:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v1,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v1,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.0 + Cascadelake-Server-v1 should not have arch-capabilities')
@@ -305,9 +320,12 @@ def test_v1_4_0(self):
     def test_v2_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=on,check=off,enforce=off')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v2,x-force-features=on,check=off,'
+                        'enforce=off')
         self.vm.launch()
         self.assertTrue(self.get_cpu_prop('arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server-v2 should have arch-capabilities')
@@ -315,10 +333,13 @@ def test_v2_4_0(self):
     def test_v1_set_4_0(self):
         """
         :avocado: tags=machine:pc-i440fx-4.0
+        :avocado: tags=cpu:Cascadelake-Server
         """
         # command line must override machine-type and versioned CPU model:
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v1,x-force-features=on,check=off,enforce=off,+arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v1,x-force-features=on,check=off,'
+                        'enforce=off,+arch-capabilities')
         self.vm.launch()
         self.assertTrue(self.get_cpu_prop('arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server-v1,+arch-capabilities should have arch-capabilities')
@@ -326,9 +347,12 @@ def test_v1_set_4_0(self):
     def test_v2_unset_4_1(self):
         """
         :avocado: tags=machine:pc-i440fx-4.1
+        :avocado: tags=cpu:Cascadelake-Server
         """
         self.vm.add_args('-S')
-        self.vm.add_args('-cpu', 'Cascadelake-Server-v2,x-force-features=on,check=off,enforce=off,-arch-capabilities')
+        self.set_vm_arg('-cpu',
+                        'Cascadelake-Server-v2,x-force-features=on,check=off,'
+                        'enforce=off,-arch-capabilities')
         self.vm.launch()
         self.assertFalse(self.get_cpu_prop('arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server-v2,-arch-capabilities should not have arch-capabilities')
-- 
2.31.1

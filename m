Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027557qvs;
        Tue, 13 Jul 2021 14:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDAqp4Iz2mFP2R4Yved4PE6ylNXUYdDY7e9bmEIVlji2sasWmYur02qaytjKaBftCUGlhc
X-Received: by 2002:a17:906:c087:: with SMTP id f7mr7339162ejz.487.1626211299538;
        Tue, 13 Jul 2021 14:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211299; cv=none;
        d=google.com; s=arc-20160816;
        b=jFsK7pjYF+0Mr3vhvcqv28PdZ7nIALg4599Ta4FfNN+FMdDDV6FQRH9PX/rwTJQCOE
         D1ge5db9sFHXNWWHUHqaJVW/RzrwxLwEmZ4HrdDknZN/eZO5dNyuuEMY2J6O2Zk11LVP
         AQn0ssU97YTLL80W9rN35RM09bnAjmyZ2EQJFxK9AJdziAK3CkIb7KKgJtWQHDCiGbPL
         v6JoGgiYsLX9mAl/WXMzGTXznLRy/Fo7wlloON1U/fqkcuC/3UIZXUH8CqXt2fIlSQ5R
         Vo8ZI9gNBAHUwlk/WO6q6DXyNwRNMloyIPbUqDbIi0FiESb3Rv0P205wN6ZuSBLJcxLl
         dHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VXdPZlAI6IeP711DAhs2nOIOrrqgzKNYegZ/vaXgSrs=;
        b=zqBiZNHYaCafHvUMMfavxJBDeGuVXuZ7RHJhcuW4FxwaahRS3B9Dz7ArIooIImiLRw
         dS1EdgdAdIaAwUNWRqO6J5Xs76d+dtyFjFJcNwJpoapxg+VUyoPn+FDmLqgaloIJDI9N
         NSPsnbrVut5aIw9kLXZn/tNmJ+V2iJj4ta0Nb5TanDz/lmTjQ28UZez22hsDSSuuuoTi
         M1ESkzZVV6vg/Wp7miRWU0W+zsWTM6sOaqF/kiX4zivsTpJyweO+5L4Aa+j9z04W0sX7
         ptSYUYS6zYc0twFo6t2qse/77pZX0XYz6EQzYGTy4F76rG9RZxZKKDVs4D0c6T1H+UsV
         95Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KonnLPEN;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x16si4618021edd.147.2021.07.13.14.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KonnLPEN;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VXdPZlAI6IeP711DAhs2nOIOrrqgzKNYegZ/vaXgSrs=;
	b=KonnLPENrgVVAx90KyD7oBZEbefalyD9p8Kh2Cdu56G3RLcHMTRJFplrY4zL1QJGYjtr8p
	OUV1BIp/QHaBgDlh9qSoZkeW1xXDNDVRg4SJe0L0RDF5YWmKDeexOl5htJofiD9sqorI+S
	nFPX4opsIPhmR0WtdObW8muykhDumco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-kaA4uqGIOYCrp9wUR5pacg-1; Tue, 13 Jul 2021 17:21:36 -0400
X-MC-Unique: kaA4uqGIOYCrp9wUR5pacg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FCF11084F4B;
	Tue, 13 Jul 2021 21:21:34 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2809F19C44;
	Tue, 13 Jul 2021 21:21:32 +0000 (UTC)
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
Subject: [PULL 14/23] tests/acceptance: Fix mismatch on cpu tagged tests
Date: Tue, 13 Jul 2021 17:19:14 -0400
Message-Id: <20210713211923.3809241-15-crosa@redhat.com>
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
X-TUID: 8wdyNlKfVOHo

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

There are test cases on machine_mips_malta.py and tcg_plugins.py files
where the cpu tag does not correspond to the value actually given to the QEMU
binary. This fixed those tests tags.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-3-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/machine_mips_malta.py | 6 +++---
 tests/acceptance/tcg_plugins.py        | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index 7c9a4ee4d2..b1fd075f51 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -96,7 +96,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         """
         self.do_test_i6400_framebuffer_logo(1)
 
@@ -105,7 +105,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(7)
@@ -115,7 +115,7 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(8)
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index c21bf9e52a..aa6e18b62d 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -95,7 +95,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -121,7 +121,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-- 
2.31.1

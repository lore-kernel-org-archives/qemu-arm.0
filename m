Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027998qvs;
        Tue, 13 Jul 2021 14:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH5FKJeSRK8f5VKFDig23e7K7DGbm6P4ZDFhNMzncFXTfcgEa7Z+k7PgJTNSpDcSJCa4K/
X-Received: by 2002:a17:906:4e52:: with SMTP id g18mr8144032ejw.214.1626211341233;
        Tue, 13 Jul 2021 14:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211341; cv=none;
        d=google.com; s=arc-20160816;
        b=bTEvnn0lTdsBHT1eEaGNN8MfL2gxE5PWZrTYVylhJRo/vCXANx59oiWZga+e6Gm5B4
         eImR10k0u6WClCEcg9BobU9N1p2vqOzPW+BZtmJlDRNMhR+4Cn5edUhXXVKNhv/Ea7il
         PfdDa6Rd0+SN4GoVGOIV4F7L/jEstNIYQbhCqxKI+2U9AqcKufWEaFX3esk6pJkmY7Oz
         NttAsYjfmFINGz5puE7FAkAYF6Fk2wkzvWoJ/FNaQ4JwGYsK1K1qxnVdmQzEZE5ZRKS0
         wIvXz/4uiAbm++pb7nJcxAofhM16zW3VN2iiiJYbFEGQNYP4QmtSKzVvjKOKDiUIaz1p
         tGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GRT3B5Wxzq0jFQitt44SK22Id/avAGWaSnYHAamy4vs=;
        b=FSg9SmDShTZlMHFj7b8N85QmGO3Ru05KInT1H8xcdhhQZEg3cMVkuhYWgdI4LDS0t+
         KwTacgk2sFbAYS4rCFFtvIuNr0hHk2FC94N5JURZrJ8FtAqEMZHH+87mLuHQmiTNPE4w
         xTwFj37AZ4a/a7uCLTjcuDwxknVHW5J15CVfp1V9Rw9ekCVZXLrxi75gLvnHCKw82wkJ
         s7BJ/G0zRePayo9DVrfHxy16sWHCk4G7WK+fUSezWcXEZLmMCcrQ6ngazTEe1bB+zLmJ
         A9lDckBJml/N2/0/RcLf72IaJgjDo36HWX6EOvzH5vy+FdATeauVJ3scijh+26GOZE4p
         kWFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fq/SlV8f";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id op26si7527833ejb.151.2021.07.13.14.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Fq/SlV8f";
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRT3B5Wxzq0jFQitt44SK22Id/avAGWaSnYHAamy4vs=;
	b=Fq/SlV8fovt9OrQj7bW/VJw9jT9nwNhIYLRpjbH+XBh0aVain8UZrv+aZqWBpbH5s4No8E
	OjudgbvzumOsgwFswJyKJZa+UMK/jS1eR5sdt5jRECjuJTaJWENHfU3Scg458PChXgtvIJ
	JQHXIFHNBh60yPyEKzYgG5jZq4LqcQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-p2cEvcV-NqyaIX27ub0M4Q-1; Tue, 13 Jul 2021 17:22:18 -0400
X-MC-Unique: p2cEvcV-NqyaIX27ub0M4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3806E1084F55;
	Tue, 13 Jul 2021 21:22:16 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCBAB19C44;
	Tue, 13 Jul 2021 21:22:13 +0000 (UTC)
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
Subject: [PULL 22/23] tests/acceptance/linux_ssh_mips_malta.py: drop identical setUp
Date: Tue, 13 Jul 2021 17:19:22 -0400
Message-Id: <20210713211923.3809241-23-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XgE3kjuni9Or

These tests' setUp do not do anything beyong what their base class do.
And while they do decorate the setUp() we can decorate the classes
instead, so no functionality is lost here.

This is possible because since Avocado 76.0 we can decorate setUp()
directly.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210415215141.1865467-4-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
[PMD: added note to commit message about Avocado feature/version]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/linux_ssh_mips_malta.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 61c9079d04..4de1947418 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -19,6 +19,8 @@
 from avocado.utils import ssh
 
 
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+@skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
 class LinuxSSH(Test, LinuxSSHMixIn):
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
@@ -65,11 +67,6 @@ def get_kernel_info(self, endianess, wordsize):
         kernel_hash = self.IMAGE_INFO[endianess]['kernel_hash'][wordsize]
         return kernel_url, kernel_hash
 
-    @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
-    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
-    def setUp(self):
-        super(LinuxSSH, self).setUp()
-
     def ssh_disconnect_vm(self):
         self.ssh_session.quit()
 
-- 
2.31.1

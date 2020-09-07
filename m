Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3445371lfc;
        Sun, 6 Sep 2020 21:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUux1cuwrxYJvLCYCYwvhi9H8lseDH+zGNTfwWkAS+fmcPM7J5pjOiPeCw21NYFJw/Fjz3
X-Received: by 2002:a25:afce:: with SMTP id d14mr24035895ybj.170.1599452432199;
        Sun, 06 Sep 2020 21:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599452432; cv=none;
        d=google.com; s=arc-20160816;
        b=QXK/dgCjFdtCyVShaiOA0t2nz+ieF+x2UMnbaT9ThkshWzQfFzbeXgZDK9e96e6O59
         f2i+XwGff9Jt8voLN6ZG/D0gfQSRB53oZ9L/IKta9eZTbA4rX2quh5YhBVEvS6WbaWKv
         ZlTGwS6FPc7nnPJe2WB9d8SxugoZG3jY5kyLs5tyLFXplSyUa+iVHMsSQ220WGpYqKpY
         xfxlDPNCp7xBOJ9hp/3Cb0CPZRKiAM95n0cOTG1muqfTSGUXqPgLCeiUeMzYm9VoXUCA
         uQqPkqI4ojTCLUl3O0F2nGjPs1YWZ/KpgJjkjGodPd9IantvXrveKoEA6mlP9T7uQITY
         QMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GiFJBPvIhB511xK7+MZlX+hVc52c1HiLvujW1F20PqA=;
        b=kzN3AoIHob15vr+7H/xZSRe3eR3EXKPTbJ5rCWYHPmRg8CyD4THv7hVksavf36KopH
         4Xmdr98RP/idBaU/a+nn8sTAVFtcUvfGvSKugMVMiTtE0+4RTqS7nDKSV3iJ1EB6y1nF
         gYe2N7jVJK8KylhWeASo8Wwrp3tTdZJjreyHWFWDxoA5/8Dw7z2owzkR3vsrClUDnvJN
         12FF64PK41Fe/7JaPrgK89TKO4p05Iuvdq5k/MxyC1iZ1PUodaS66WsKZ5xnGm2Jcv9g
         TyqMNK+VEnIq4RGqb7gwIJo697gMqxOYe7LLRldIv63/RIg2acV0zzIfqyGQjWzrYqL5
         8zMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=chjb4MMn;
       spf=pass (google.com: domain of crosa@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id l9si13116637ybb.254.2020.09.06.21.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Sep 2020 21:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=chjb4MMn;
       spf=pass (google.com: domain of crosa@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599452431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiFJBPvIhB511xK7+MZlX+hVc52c1HiLvujW1F20PqA=;
	b=chjb4MMn1m5RosuKngcRlj3NxoqA5HQr/fM44DY4lUPEgCOHyGtvfuzrPPB29lJGMYscaD
	DHDqESe2Y5uYzfC2Ox+hjfRCdDIEQBVt5LPegQi9UxmTjzoTfZYWKHinXwlYqGksz2arzi
	kJ+kUFhegtAYOm43lTPF61/HGju/GKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-qbx0IgqVPx2m3jNrnkR6jQ-1; Mon, 07 Sep 2020 00:20:25 -0400
X-MC-Unique: qbx0IgqVPx2m3jNrnkR6jQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37BBB109106D;
	Mon,  7 Sep 2020 04:20:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-166.rdu2.redhat.com [10.10.120.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 336071002D49;
	Mon,  7 Sep 2020 04:20:17 +0000 (UTC)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>,
	Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
	Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH 3/4] tests: bump avocado version
Date: Mon,  7 Sep 2020 00:19:59 -0400
Message-Id: <20200907042000.415931-4-crosa@redhat.com>
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
X-TUID: Nui9y1/vdm2q

From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>

Reverse debugging test uses gdb remote client of avocado framework.
This client was fixed since the currently used version 76.
Therefore this patch bumps the version to 81 and fixes command
line version compatibility issue.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <159903462803.28509.16851113546106095750.stgit@pasha-ThinkPad-X280>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 2 +-
 tests/requirements.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9ac8f5b86a..0687c8bcda 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -517,7 +517,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
             $(AVOCADO_TAGS) \
-            $(if $(GITLAB_CI),,--failfast=on) tests/acceptance, \
+            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
             "AVOCADO", "tests/acceptance")
 
 # Consolidated targets
diff --git a/tests/requirements.txt b/tests/requirements.txt
index f9c84b4ba1..036691c922 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,5 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-avocado-framework==76.0
+avocado-framework==81.0
 pycdlib==1.9.0
-- 
2.25.4

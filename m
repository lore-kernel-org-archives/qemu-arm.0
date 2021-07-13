Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp1027973qvs;
        Tue, 13 Jul 2021 14:22:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlOc/03wPunLT3AmmL0aphkCGyXgzUYDS/tjn+SmRilVNzOZfiXxQ2Tg7eP1R70PFXDF4O
X-Received: by 2002:a17:906:6c8f:: with SMTP id s15mr8156665ejr.498.1626211338569;
        Tue, 13 Jul 2021 14:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626211338; cv=none;
        d=google.com; s=arc-20160816;
        b=LbzPvTk7ufktC1xX6puO1Rglk06DBnAabr/CrvXcUQAspvem8yCiTpl7+KbNSeig0y
         O0WzRJMkv98pmjYfZfanrREsDDQtKiEoDAwWccP+D/SsTo6aFa1WR6bm1i5jjH4IgT5Z
         da8DD+qBNPTXaJLxxHr9V1EqAuxgD2nenLoK5OalmQylclMFM6Fy9mecDqhBZG6PWdZc
         ULk3AUyCcAe+PgRa14HculMWy9AdjsCe52nYB7b5mOdNA+OHot36R1Q1Gw7JJFvimREu
         tO32LCamd0qEm3+KpNwOWE2q1WXbG2rl6MIJFPu7s6hamKNOylvJR9DyE6DQjWQ5t9Bf
         Gpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sWGl7pEtJ1J3FHqvu3ZJ1mgZQaatUycxUYwgyMO1Jyg=;
        b=tlaxeP9UtNCwM6LqK9isZMZeLz1DHi+YnvO0on4CeiDkv4OZ10hJzOh1W8s8zHiQpP
         /12yk4Dt11KlN18vmcb27fz3236gWY1L/1o0xwkvH3hVw+/jqVcuK8D0pcoNOgrngCRp
         S1rY6ARALOwm8ZRrOOoCWyFrDiOS7GDOSRbjblkyayy/ndoCl0Rot6mtnytUr4r39V0s
         nM6OqDri4i+HfRr3i+JA/BZWoAVm25G2DuBH5WXMZARF4k8sS6aqczKHv+1G7lIfuhWW
         vCdov0uhdtmEmIv+nTWVIS0cY/6/VYnvAFmvn/b4kWb6EcwVtJgc6BMsiNl62ZY24pNd
         GVaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BSPGEz0S;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f2si11080343edw.161.2021.07.13.14.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 14:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BSPGEz0S;
       spf=pass (google.com: domain of crosa@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626211337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWGl7pEtJ1J3FHqvu3ZJ1mgZQaatUycxUYwgyMO1Jyg=;
	b=BSPGEz0S3UoUec944Y79rqrAt7zVDPb+O2iR7gemMMYENcAN8g7w/qu2D6Pjo6nLre1HXu
	sFK2dOEl7rIZw0tq6ZIeZ5X5RI7BzPQ+ZjQA4eAQPlchW9wNzDvuqVKNKj8qWh2ZbdbJcL
	i7fmekYzqc0MP0BE4OorKAaaw8xgkq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-ZSDzdpYbMRiDE69Y2FwJOg-1; Tue, 13 Jul 2021 17:22:16 -0400
X-MC-Unique: ZSDzdpYbMRiDE69Y2FwJOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB96802C80;
	Tue, 13 Jul 2021 21:22:13 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 019FC19C44;
	Tue, 13 Jul 2021 21:22:00 +0000 (UTC)
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
Subject: [PULL 21/23] Acceptance tests: do not try to reuse packages from the system
Date: Tue, 13 Jul 2021 17:19:21 -0400
Message-Id: <20210713211923.3809241-22-crosa@redhat.com>
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
X-TUID: sXJBGafavSau

The premise behind the original behavior is that it would save people
from downloading Avocado (and other dependencies) if already installed
on the system.  To be honest, I think it's extremely rare that the
same versions described as dependencies will be available on most
systems.  But, the biggest motivations here are that:

 1) Hacking on QEMU in the same system used to develop Avocado leads
    to confusion with regards to the exact bits that are being used;

 2) Not reusing Python packages from system wide installations gives
    extra assurance that the same behavior will be seen from tests run
    on different machines;

With regards to downloads, pip already caches the downloaded wheels
and tarballs under ~/.cache/pip, so there should not be more than
one download even if the venv is destroyed and recreated.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210415215141.1865467-3-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e4dcb17329..6e16c05f10 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -96,7 +96,7 @@ AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, \
-            $(PYTHON) -m venv --system-site-packages $@, \
+            $(PYTHON) -m venv $@, \
             VENV, $@)
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m pip -q install -r $(TESTS_VENV_REQ), \
-- 
2.31.1
